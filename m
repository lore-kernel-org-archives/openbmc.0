Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wY1Nf1pZPzDqdR
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 04:37:54 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4OITTTk092156
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 14:37:47 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2amvawjy4k-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 14:37:47 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 24 May 2017 12:37:45 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 24 May 2017 12:37:44 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4OIbhck16187878; Wed, 24 May 2017 11:37:43 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94DC9BE03A;
 Wed, 24 May 2017 12:37:43 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 27216BE042;
 Wed, 24 May 2017 12:37:43 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 1/2] drivers: fsi: sbefifo: Add in-kernel API
Date: Wed, 24 May 2017 13:37:34 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1495651055-30057-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1495651055-30057-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17052418-0016-0000-0000-000006CFD96E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007112; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865073; UDB=6.00429505; IPR=6.00644853; 
 BA=6.00005372; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015568; XFM=3.00000015;
 UTC=2017-05-24 18:37:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052418-0017-0000-0000-000039CB0E07
Message-Id: <1495651055-30057-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705240088
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
X-List-Received-Date: Wed, 24 May 2017 18:37:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add exported functions to the SBEFIFO driver to open/write/read/close
from within the kernel.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c   | 161 +++++++++++++++++++++++++++++++++++---------
 include/linux/fsi-sbefifo.h |  30 +++++++++
 2 files changed, 161 insertions(+), 30 deletions(-)
 create mode 100644 include/linux/fsi-sbefifo.h

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index b49aec2..56e6331 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -15,9 +15,12 @@
 #include <linux/errno.h>
 #include <linux/idr.h>
 #include <linux/fsi.h>
+#include <linux/fsi-sbefifo.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -82,6 +85,7 @@ struct sbefifo_client {
 	struct list_head xfrs;
 	struct sbefifo *dev;
 	struct kref kref;
+	unsigned long f_flags;
 };
 
 static struct list_head sbefifo_fifos;
@@ -506,6 +510,7 @@ static int sbefifo_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	file->private_data = client;
+	client->f_flags = file->f_flags;
 
 	return 0;
 }
@@ -530,24 +535,18 @@ static unsigned int sbefifo_poll(struct file *file, poll_table *wait)
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
@@ -566,10 +565,13 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf,
 
 	n = min_t(size_t, n, len);
 
-	if (copy_to_user(buf, READ_ONCE(client->rbuf.rpos), n)) {
-		sbefifo_put_client(client);
-		return -EFAULT;
-	}
+	if (ubuf) {
+		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
+			sbefifo_put_client(client);
+			return -EFAULT;
+		}
+	} else
+		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
 
 	if (sbefifo_buf_readnb(&client->rbuf, n)) {
 		xfr = sbefifo_client_next_xfr(client);
@@ -592,20 +594,28 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf,
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
 
@@ -617,7 +627,7 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 	spin_lock_irq(&sbefifo->lock);
 	xfr = sbefifo_next_xfr(sbefifo);
 
-	if ((file->f_flags & O_NONBLOCK) && xfr && n < len) {
+	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irq(&sbefifo->lock);
 		return -EAGAIN;
 	}
@@ -657,18 +667,25 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 
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
+		} else {
+			memcpy(READ_ONCE(client->wbuf.wpos), kbuf, n);
+			kbuf += n;
 		}
 
 		sbefifo_buf_wrotenb(&client->wbuf, n);
 		len -= n;
-		buf += n;
 		ret += n;
 
 		/*
@@ -685,6 +702,19 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
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
@@ -704,12 +734,68 @@ static int sbefifo_release(struct inode *inode, struct file *file)
 	.release	= sbefifo_release,
 };
 
+struct sbefifo_client *sbefifo_drv_open(struct device *dev,
+					unsigned long flags)
+{
+	struct sbefifo_client *client = NULL;
+	struct sbefifo *sbefifo;
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+
+	list_for_each_entry(sbefifo, &sbefifo_fifos, link) {
+		if (sbefifo->fsi_dev != fsi_dev)
+			continue;
+
+		client = sbefifo_new_client(sbefifo);
+		if (client)
+			client->f_flags = flags;
+	}
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
+static int sbefifo_unregister_child(struct device *dev, void *data)
+{
+	struct platform_device *child = to_platform_device(dev);
+
+	of_device_unregister(child);
+	if (dev->of_node)
+		of_node_clear_flag(dev->of_node, OF_POPULATED);
+
+	return 0;
+}
+
 static int sbefifo_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct sbefifo *sbefifo;
+	struct device_node *np;
+	struct platform_device *child;
+	char child_name[32];
 	u32 sts;
-	int ret;
+	int ret, child_idx = 0;
 
 	dev_info(dev, "Found sbefifo device\n");
 	sbefifo = kzalloc(sizeof(*sbefifo), GFP_KERNEL);
@@ -750,6 +836,18 @@ static int sbefifo_probe(struct device *dev)
 	init_waitqueue_head(&sbefifo->wait);
 	INIT_LIST_HEAD(&sbefifo->xfrs);
 
+	if (dev->of_node) {
+		/* create platform devs for dts child nodes (occ, etc) */
+		for_each_child_of_node(dev->of_node, np) {
+			snprintf(child_name, sizeof(child_name), "%s-dev%d",
+				 sbefifo->name, child_idx++);
+			child = of_platform_device_create(np, child_name, dev);
+			if (!child)
+				dev_warn(&sbefifo->fsi_dev->dev,
+					 "failed to create child node dev\n");
+		}
+	}
+
 	/* This bit of silicon doesn't offer any interrupts... */
 	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
 			(unsigned long)sbefifo);
@@ -767,6 +865,9 @@ static int sbefifo_remove(struct device *dev)
 	list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, link) {
 		if (sbefifo->fsi_dev != fsi_dev)
 			continue;
+
+		device_for_each_child(dev, NULL, sbefifo_unregister_child);
+
 		misc_deregister(&sbefifo->mdev);
 		list_del(&sbefifo->link);
 		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
diff --git a/include/linux/fsi-sbefifo.h b/include/linux/fsi-sbefifo.h
new file mode 100644
index 0000000..1b46c63
--- /dev/null
+++ b/include/linux/fsi-sbefifo.h
@@ -0,0 +1,30 @@
+/*
+ * SBEFIFO FSI Client device driver
+ *
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
+struct device;
+struct sbefifo_client;
+
+extern struct sbefifo_client *sbefifo_drv_open(struct device *dev,
+					       unsigned long flags);
+extern int sbefifo_drv_read(struct sbefifo_client *client, char *buf,
+			    size_t len);
+extern int sbefifo_drv_write(struct sbefifo_client *client, const char *buf,
+			     size_t len);
+extern void sbefifo_drv_release(struct sbefifo_client *client);
+
+#endif /* __FSI_SBEFIFO_H__ */
-- 
1.8.3.1
