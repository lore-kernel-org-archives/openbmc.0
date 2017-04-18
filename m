Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6yPq1M3GzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 07:07:26 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3IL3ZTO089905
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:22 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29wr31x3qw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:22 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 18 Apr 2017 15:07:21 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Apr 2017 15:07:19 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3IL7EYk13631752; Tue, 18 Apr 2017 14:07:18 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B55F2C604A;
 Tue, 18 Apr 2017 15:07:18 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 6D20DC6043;
 Tue, 18 Apr 2017 15:07:18 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 1/3] drivers: fsi: sbefifo: Add in-kernel API
Date: Tue, 18 Apr 2017 16:07:12 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17041821-0008-0000-0000-000007A251AB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006936; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00849294; UDB=6.00419353; IPR=6.00627935; 
 BA=6.00005300; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015089; XFM=3.00000013;
 UTC=2017-04-18 21:07:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041821-0009-0000-0000-00004195E8AE
Message-Id: <1492549634-27369-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-18_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704180166
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Apr 2017 21:07:27 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add exported functions to the SBEFIFO driver to open/write/read/close
from within the kernel.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c   | 173 ++++++++++++++++++++++++++++++++++++--------
 include/linux/fsi-sbefifo.h |  41 +++++++++++
 2 files changed, 185 insertions(+), 29 deletions(-)
 create mode 100644 include/linux/fsi-sbefifo.h

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 9a13ce3..4b95b00 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -15,9 +15,11 @@
 #include <linux/errno.h>
 #include <linux/idr.h>
 #include <linux/fsi.h>
+#include <linux/fsi-sbefifo.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -49,7 +51,9 @@ struct sbefifo {
 	wait_queue_head_t wait;
 	struct list_head link;
 	struct list_head xfrs;
+	struct list_head drv_refs;
 	struct kref kref;
+	struct device_node *node;
 	spinlock_t lock;
 	char name[32];
 	int idx;
@@ -82,6 +86,7 @@ struct sbefifo_client {
 	struct list_head xfrs;
 	struct sbefifo *dev;
 	struct kref kref;
+	unsigned long f_flags;
 };
 
 static struct list_head sbefifo_fifos;
@@ -493,6 +498,7 @@ static int sbefifo_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	file->private_data = client;
+	client->f_flags = file->f_flags;
 
 	return 0;
 }
@@ -517,24 +523,18 @@ static unsigned int sbefifo_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
-static ssize_t sbefifo_read(struct file *file, char __user *buf,
-		size_t len, loff_t *offset)
+static ssize_t sbefifo_read_common(struct sbefifo_client *client,
+				   char __user *ubuf, char *kbuf, size_t len)
 {
-	struct sbefifo_client *client = file->private_data;
 	struct sbefifo *sbefifo = client->dev;
 	struct sbefifo_xfr *xfr;
-	ssize_t ret = 0;
 	size_t n;
-
-	WARN_ON(*offset);
-
-	if (!access_ok(VERIFY_WRITE, buf, len))
-		return -EFAULT;
+	ssize_t ret = 0;
 
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
 
-	if ((file->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
+	if ((client->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
 		return -EAGAIN;
 
 	sbefifo_get_client(client);
@@ -553,10 +553,14 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf,
 
 	n = min_t(size_t, n, len);
 
-	if (copy_to_user(buf, READ_ONCE(client->rbuf.rpos), n)) {
-		sbefifo_put_client(client);
-		return -EFAULT;
+	if (ubuf) {
+		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
+			sbefifo_put_client(client);
+			return -EFAULT;
+		}
 	}
+	else
+		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
 
 	if (sbefifo_buf_readnb(&client->rbuf, n)) {
 		xfr = sbefifo_client_next_xfr(client);
@@ -579,20 +583,28 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf,
 	return n;
 }
 
-static ssize_t sbefifo_write(struct file *file, const char __user *buf,
+static ssize_t sbefifo_read(struct file *file, char __user *buf,
 		size_t len, loff_t *offset)
 {
 	struct sbefifo_client *client = file->private_data;
-	struct sbefifo *sbefifo = client->dev;
-	struct sbefifo_xfr *xfr;
-	ssize_t ret = 0;
-	size_t n;
 
 	WARN_ON(*offset);
 
-	if (!access_ok(VERIFY_READ, buf, len))
+	if (!access_ok(VERIFY_WRITE, buf, len))
 		return -EFAULT;
 
+	return sbefifo_read_common(client, buf, NULL, len);
+}
+
+static ssize_t sbefifo_write_common(struct sbefifo_client *client,
+				    const char __user *ubuf, const char *kbuf,
+				    size_t len)
+{
+	struct sbefifo *sbefifo = client->dev;
+	struct sbefifo_xfr *xfr;
+	ssize_t ret = 0;
+	size_t n;
+
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
 
@@ -604,7 +616,7 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 	spin_lock_irq(&sbefifo->lock);
 	xfr = sbefifo_next_xfr(sbefifo);
 
-	if ((file->f_flags & O_NONBLOCK) && xfr && n < len) {
+	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irq(&sbefifo->lock);
 		return -EAGAIN;
 	}
@@ -644,18 +656,26 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 
 		n = min_t(size_t, n, len);
 
-		if (copy_from_user(READ_ONCE(client->wbuf.wpos), buf, n)) {
-			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
-			sbefifo_get(sbefifo);
-			if (mod_timer(&sbefifo->poll_timer, jiffies))
-				sbefifo_put(sbefifo);
-			sbefifo_put_client(client);
-			return -EFAULT;
+		if (ubuf) {
+			if (copy_from_user(READ_ONCE(client->wbuf.wpos), ubuf,
+			    n)) {
+				set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
+				sbefifo_get(sbefifo);
+				if (mod_timer(&sbefifo->poll_timer, jiffies))
+					sbefifo_put(sbefifo);
+				sbefifo_put_client(client);
+				return -EFAULT;
+			}
+
+			ubuf += n;
+		}
+		else {
+			memcpy(READ_ONCE(client->wbuf.wpos), kbuf, n);
+			kbuf += n;
 		}
 
 		sbefifo_buf_wrotenb(&client->wbuf, n);
 		len -= n;
-		buf += n;
 		ret += n;
 
 		/*
@@ -672,6 +692,19 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 	return ret;
 }
 
+static ssize_t sbefifo_write(struct file *file, const char __user *buf,
+		size_t len, loff_t *offset)
+{
+	struct sbefifo_client *client = file->private_data;
+
+	WARN_ON(*offset);
+
+	if (!access_ok(VERIFY_READ, buf, len))
+		return -EFAULT;
+
+	return sbefifo_write_common(client, buf, NULL, len);
+}
+
 static int sbefifo_release(struct inode *inode, struct file *file)
 {
 	struct sbefifo_client *client = file->private_data;
@@ -691,11 +724,72 @@ static const struct file_operations sbefifo_fops = {
 	.release	= sbefifo_release,
 };
 
+struct sbefifo *sbefifo_drv_reference(struct device_node *node,
+				      struct sbefifo_drv_ref *ref)
+{
+	struct sbefifo *sbefifo;
+
+	list_for_each_entry(sbefifo, &sbefifo_fifos, link) {
+		if (node == sbefifo->node) {
+			if (ref)
+				list_add(&ref->link, &sbefifo->drv_refs);
+			return sbefifo;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_reference);
+
+struct sbefifo_client *sbefifo_drv_open(struct sbefifo *sbefifo,
+					unsigned long flags)
+{
+	struct sbefifo_client *client;
+
+	if (!sbefifo)
+		return NULL;
+
+	client = sbefifo_new_client(sbefifo);
+	if (client)
+		client->f_flags = flags;
+
+	return client;
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_open);
+
+int sbefifo_drv_read(struct sbefifo_client *client, char *buf, size_t len)
+{
+	return sbefifo_read_common(client, NULL, buf, len);
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_read);
+
+int sbefifo_drv_write(struct sbefifo_client *client, const char *buf,
+		      size_t len)
+{
+	return sbefifo_write_common(client, NULL, buf, len);
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_write);
+
+void sbefifo_drv_release(struct sbefifo_client *client)
+{
+	if (!client)
+		return;
+
+	sbefifo_put_client(client);
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_release);
+
+int sbefifo_drv_get_idx(struct sbefifo *sbefifo)
+{
+	return sbefifo->idx;
+}
+
 static int sbefifo_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct sbefifo *sbefifo;
-	u32 sts;
+	struct device_node *np;
+	u32 sts, addr;
 	int ret;
 
 	dev_info(dev, "Found sbefifo device\n");
@@ -736,6 +830,19 @@ static int sbefifo_probe(struct device *dev)
 			sbefifo->idx);
 	init_waitqueue_head(&sbefifo->wait);
 	INIT_LIST_HEAD(&sbefifo->xfrs);
+	INIT_LIST_HEAD(&sbefifo->drv_refs);
+
+	for_each_compatible_node(np, NULL, "ibm,power9-sbefifo") {
+		ret = of_property_read_u32(np, "reg", &addr);
+		if (ret)
+			continue;
+
+		/* TODO: get real address, not cfam offset */
+		if (addr == fsi_dev->addr) {
+			sbefifo->node = np;
+			break;
+		}
+	}
 
 	/* This bit of silicon doesn't offer any interrupts... */
 	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
@@ -749,11 +856,19 @@ static int sbefifo_remove(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct sbefifo *sbefifo, *sbefifo_tmp;
+	struct sbefifo_drv_ref *ref, *ref_tmp;
 	struct sbefifo_xfr *xfr;
 
 	list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, link) {
 		if (sbefifo->fsi_dev != fsi_dev)
 			continue;
+
+		list_for_each_entry_safe(ref, ref_tmp, &sbefifo->drv_refs,
+					 link) {
+			ref->notify(ref);
+			list_del(&ref->link);
+		}
+
 		misc_deregister(&sbefifo->mdev);
 		list_del(&sbefifo->link);
 		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
diff --git a/include/linux/fsi-sbefifo.h b/include/linux/fsi-sbefifo.h
new file mode 100644
index 0000000..2d8115a
--- /dev/null
+++ b/include/linux/fsi-sbefifo.h
@@ -0,0 +1,41 @@
+/*
+ * Copyright (C) IBM Corporation 2017
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __FSI_SBEFIFO_H__
+#define __FSI_SBEFIFO_H__
+
+#include <linux/types.h>
+
+struct device_node;
+struct sbefifo;
+struct sbefifo_client;
+
+struct sbefifo_drv_ref {
+	struct list_head link;
+	void (*notify)(struct sbefifo_drv_ref *ref);
+};
+
+extern struct sbefifo *sbefifo_drv_reference(struct device_node *node,
+					     struct sbefifo_drv_ref *ref);
+
+extern struct sbefifo_client *sbefifo_drv_open(struct sbefifo *sbefifo,
+					       unsigned long flags);
+extern int sbefifo_drv_read(struct sbefifo_client *client, char *buf,
+			    size_t len);
+extern int sbefifo_drv_write(struct sbefifo_client *client, const char *buf,
+			     size_t len);
+extern void sbefifo_drv_release(struct sbefifo_client *client);
+
+extern int sbefifo_drv_get_idx(struct sbefifo *sbefifo);
+
+#endif /* __FSI_SBEFIFO_H__ */
-- 
1.8.3.1
