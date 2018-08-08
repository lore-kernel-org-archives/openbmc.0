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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lcPL1ffpzDq6t
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 13:31:33 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w783VFPv005080;
 Tue, 7 Aug 2018 22:31:17 -0500
Message-ID: <c67f4ad53054761e0ae51eb85bd32e880c614288.camel@kernel.crashing.org>
Subject: [PATCH v3] fsi: sbefifo: Bump max command length
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery
 <andrewrj@au1.ibm.com>, Joel Stanley <joel@jms.id.au>
Date: Wed, 08 Aug 2018 13:31:15 +1000
In-Reply-To: <cc45d5fe697afda6b77be859c163852aecefcbd4.camel@kernel.crashing.org>
References: <cc45d5fe697afda6b77be859c163852aecefcbd4.camel@kernel.crashing.org>
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
X-List-Received-Date: Wed, 08 Aug 2018 03:31:34 -0000

Otherwise cronus putmem fails istep and BML fails to upload skiboot

To do that, we still use our one-page command buffer for small commands
for speed, and for anything bigger, with a limit of 1MB plus a page,
we vmalloc a temporary buffer.

The limit was chosen because Cronus will break up any data transfer
into 1M chunks (the extra page is for the command header).

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 v3. Factor the buffer cleanup code into a helper function

 v2. Reduce max to 1MB + PAGE_SIZE which is enough for Cronus as
     it will break up transfers in 1MB chunks and we can make
     sure pdbg does the same.

 drivers/fsi/fsi-sbefifo.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index f97ec3e4ddea..9e778aac9ae7 100644
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
+#define SBEFIFO_MAX_USER_CMD_LEN	(0x100000 + PAGE_SIZE)
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
@@ -749,6 +751,15 @@ EXPORT_SYMBOL_GPL(sbefifo_submit);
 /*
  * Char device interface
  */
+
+static void sbefifo_release_command(struct sbefifo_user *user)
+{
+	if (is_vmalloc_addr(user->pending_cmd))
+		vfree(user->pending_cmd);
+	user->pending_cmd = NULL;
+	user->pending_len = 0;
+}
+
 static int sbefifo_user_open(struct inode *inode, struct file *file)
 {
 	struct sbefifo *sbefifo = container_of(inode->i_cdev, struct sbefifo, cdev);
@@ -760,8 +771,8 @@ static int sbefifo_user_open(struct inode *inode, struct file *file)
 
 	file->private_data = user;
 	user->sbefifo = sbefifo;
-	user->pending_cmd = (void *)__get_free_page(GFP_KERNEL);
-	if (!user->pending_cmd) {
+	user->cmd_page = (void *)__get_free_page(GFP_KERNEL);
+	if (!user->cmd_page) {
 		kfree(user);
 		return -ENOMEM;
 	}
@@ -814,7 +825,7 @@ static ssize_t sbefifo_user_read(struct file *file, char __user *buf,
 	/* Extract the response length */
 	rc = len - iov_iter_count(&resp_iter);
  bail:
-	user->pending_len = 0;
+	sbefifo_release_command(user);
 	mutex_unlock(&user->file_lock);
 	return rc;
 }
@@ -859,13 +870,23 @@ static ssize_t sbefifo_user_write(struct file *file, const char __user *buf,
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
@@ -906,6 +927,9 @@ static ssize_t sbefifo_user_write(struct file *file, const char __user *buf,
 	/* Update the staging buffer size */
 	user->pending_len = len;
  bail:
+	if (!user->pending_len)
+		sbefifo_release_command(user);
+
 	mutex_unlock(&user->file_lock);
 
 	/* And that's it, we'll issue the command on a read */
@@ -919,7 +943,8 @@ static int sbefifo_user_release(struct inode *inode, struct file *file)
 	if (!user)
 		return -EINVAL;
 
-	free_page((unsigned long)user->pending_cmd);
+	sbefifo_release_command(user);
+	free_page((unsigned long)user->cmd_page);
 	kfree(user);
 
 	return 0;
