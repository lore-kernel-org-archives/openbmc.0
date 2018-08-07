Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kz4w4DrPzDqBx
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 12:30:08 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w772TtFv021428;
 Mon, 6 Aug 2018 21:29:56 -0500
Message-ID: <cc45d5fe697afda6b77be859c163852aecefcbd4.camel@kernel.crashing.org>
Subject: [PATCH] fsi: sbefifo: Bump max command length to 2MB
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery
 <andrewrj@au1.ibm.com>, Joel Stanley <joel@jms.id.au>
Date: Tue, 07 Aug 2018 12:29:55 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.4 (3.28.4-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 02:30:09 -0000

Otherwise cronus putmem fails istep and BML fails to upload skiboot

To do that, we still use our one-page command buffer for small commands
for speed, and for anything bigger, with a limit of 2MB, we vmalloc
a temporary buffer.

Ideally, if/when cronus (or pdbg) learns to split putmem's into
smaller chunks, we will be able to reduce the max size.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-sbefifo.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index f97ec3e4ddea..8a2338c085a7 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -30,6 +30,7 @@
 #include <linux/delay.h>
 #include <linux/uio.h>
 #include <linux/vmalloc.h>
+#include <linux/mm.h>
 
 /*
  * The SBEFIFO is a pipe-like FSI device for communicating with
@@ -110,7 +111,7 @@ enum sbe_state
 #define SBEFIFO_TIMEOUT_IN_RSP		1000
 
 /* Other constants */
-#define SBEFIFO_MAX_CMD_LEN		PAGE_SIZE
+#define SBEFIFO_MAX_USER_CMD_LEN	0x200000
 #define SBEFIFO_RESET_MAGIC		0x52534554 /* "RSET" */
 #define SBEFIFO_BENCH_MAGIC		0x424E4348 /* "BNCH" */
 
@@ -129,6 +130,7 @@ struct sbefifo {
 struct sbefifo_user {
 	struct sbefifo		*sbefifo;
 	struct mutex		file_lock;
+	void			*cmd_page;
 	void			*pending_cmd;
 	size_t			pending_len;
 };
@@ -724,7 +726,7 @@ int sbefifo_submit(struct device *dev, const __be32 *command, size_t cmd_len,
 		return -ENODEV;
 	if (WARN_ON_ONCE(sbefifo->magic != SBEFIFO_MAGIC))
 		return -ENODEV;
-	if (!resp_len || !command || !response || cmd_len > SBEFIFO_MAX_CMD_LEN)
+	if (!resp_len || !command || !response)
 		return -EINVAL;
 
 	/* Prepare iov iterator */
@@ -760,8 +762,8 @@ static int sbefifo_user_open(struct inode *inode, struct file *file)
 
 	file->private_data = user;
 	user->sbefifo = sbefifo;
-	user->pending_cmd = (void *)__get_free_page(GFP_KERNEL);
-	if (!user->pending_cmd) {
+	user->cmd_page = (void *)__get_free_page(GFP_KERNEL);
+	if (!user->cmd_page) {
 		kfree(user);
 		return -ENOMEM;
 	}
@@ -814,6 +816,9 @@ static ssize_t sbefifo_user_read(struct file *file, char __user *buf,
 	/* Extract the response length */
 	rc = len - iov_iter_count(&resp_iter);
  bail:
+	if (is_vmalloc_addr(user->pending_cmd)) 
+		vfree(user->pending_cmd);
+	user->pending_cmd = NULL;
 	user->pending_len = 0;
 	mutex_unlock(&user->file_lock);
 	return rc;
@@ -859,13 +864,23 @@ static ssize_t sbefifo_user_write(struct file *file, const char __user *buf,
 	if (!user)
 		return -EINVAL;
 	sbefifo = user->sbefifo;
-	if (len > SBEFIFO_MAX_CMD_LEN)
+	if (len > SBEFIFO_MAX_USER_CMD_LEN)
 		return -EINVAL;
 	if (len & 3)
 		return -EINVAL;
 
 	mutex_lock(&user->file_lock);
 
+	/* Can we use the pre-allocate buffer ? If not, allocate */
+	if (len <= PAGE_SIZE)
+		user->pending_cmd = user->cmd_page;
+	else
+		user->pending_cmd = vmalloc(len);
+	if (!user->pending_cmd) {
+		rc = -ENOMEM;
+		goto bail;
+	}
+
 	/* Copy the command into the staging buffer */
 	if (copy_from_user(user->pending_cmd, buf, len)) {
 		rc = -EFAULT;
@@ -906,6 +921,11 @@ static ssize_t sbefifo_user_write(struct file *file, const char __user *buf,
 	/* Update the staging buffer size */
 	user->pending_len = len;
  bail:
+	if (!user->pending_len) {
+		if (is_vmalloc_addr(user->pending_cmd)) 
+			vfree(user->pending_cmd);
+		user->pending_cmd = NULL;
+	}
 	mutex_unlock(&user->file_lock);
 
 	/* And that's it, we'll issue the command on a read */
@@ -919,7 +939,9 @@ static int sbefifo_user_release(struct inode *inode, struct file *file)
 	if (!user)
 		return -EINVAL;
 
-	free_page((unsigned long)user->pending_cmd);
+	if (is_vmalloc_addr(user->pending_cmd))
+		vfree(user->pending_cmd);
+	free_page((unsigned long)user->cmd_page);
 	kfree(user);
 
 	return 0;
