Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6yPz2tWGzDq9s
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 07:07:35 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3IL3a5J101579
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:25 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29wrpuv866-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:24 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 18 Apr 2017 15:07:23 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Apr 2017 15:07:21 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3IL7EYq13631752; Tue, 18 Apr 2017 14:07:20 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5695C6057;
 Tue, 18 Apr 2017 15:07:20 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 65A37C604F;
 Tue, 18 Apr 2017 15:07:20 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 2/3] drivers: fsi: sbefifo: Add OCC driver
Date: Tue, 18 Apr 2017 16:07:13 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17041821-0008-0000-0000-000007A251AE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006936; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00849294; UDB=6.00419353; IPR=6.00627935; 
 BA=6.00005300; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015089; XFM=3.00000013;
 UTC=2017-04-18 21:07:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041821-0009-0000-0000-00004195E8C0
Message-Id: <1492549634-27369-3-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 18 Apr 2017 21:07:35 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add a driver to control communications with the OCC on the POWER9. The
driver communicates with OCC SRAM using the FSI SBEFIFO driver.

The format of the communication is a command followed by response. The
sequence must be done atomically. The driver performs these operations
asynchronously, such that a write operation starts the command, and a
read will gather the response data.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/Kconfig   |  10 +
 drivers/fsi/Makefile  |   1 +
 drivers/fsi/occfifo.c | 649 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 660 insertions(+)
 create mode 100644 drivers/fsi/occfifo.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 087f239..8dbe5d9 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -24,6 +24,16 @@ config FSI_SBEFIFO
 	---help---
 	This option enables an FSI based SBEFIFO device driver.
 
+if FSI_SBEFIFO
+
+config OCCFIFO
+	tristate "OCC SBEFIFO client device driver"
+	depends on FSI_SBEFIFO
+	---help---
+	This option enables an FSI based OCC driver using the SBEFIFO.
+
+endif
+
 config FSI_SCOM
 	tristate "SCOM FSI client device driver"
 	depends on FSI
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index edd84b2..eddaf79 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -2,5 +2,6 @@
 obj-$(CONFIG_FSI) += fsi-core.o
 obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
 obj-$(CONFIG_FSI_SBEFIFO) += fsi-sbefifo.o
+obj-$(CONFIG_OCCFIFO) += occfifo.o
 obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
 obj-$(CONFIG_FSI_I2C) += i2c/
diff --git a/drivers/fsi/occfifo.c b/drivers/fsi/occfifo.c
new file mode 100644
index 0000000..c1a3351
--- /dev/null
+++ b/drivers/fsi/occfifo.c
@@ -0,0 +1,649 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <asm/unaligned.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fsi-sbefifo.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#define OCC_SRAM_BYTES		4096
+#define OCC_CMD_DATA_BYTES	4090
+#define OCC_RESP_DATA_BYTES	4089
+
+struct occfifo {
+	struct sbefifo_drv_ref ref;
+	struct sbefifo *sbefifo;
+	char name[32];
+	struct miscdevice mdev;
+	struct list_head xfrs;
+	spinlock_t list_lock;
+	spinlock_t occ_lock;
+	struct work_struct work;
+};
+
+#define to_occfifo(x)	container_of((x), struct occfifo, mdev)
+
+struct occ_command {
+	u8 seq_no;
+	u8 cmd_type;
+	u16 data_length;
+	u8 data[OCC_CMD_DATA_BYTES];
+	u16 checksum;
+};
+
+struct occ_response {
+	u8 seq_no;
+	u8 cmd_type;
+	u8 return_status;
+	u16 data_length;
+	u8 data[OCC_RESP_DATA_BYTES];
+	u16 checksum;
+};
+
+struct occfifo_xfr;
+
+enum {
+	CLIENT_NONBLOCKING,
+};
+
+struct occfifo_client {
+	struct occfifo *occfifo;
+	struct occfifo_xfr *xfr;
+	spinlock_t lock;
+	wait_queue_head_t wait;
+	size_t read_offset;
+	unsigned long flags;
+};
+
+enum {
+	XFR_IN_PROGRESS,
+	XFR_COMPLETE,
+	XFR_CANCELED,
+	XFR_WAITING,
+};
+
+struct occfifo_xfr {
+	struct list_head link;
+	struct occfifo_client *client;
+	int rc;
+	u8 buf[OCC_SRAM_BYTES];
+	size_t cmd_data_length;
+	size_t resp_data_length;
+	unsigned long flags;
+};
+
+static struct workqueue_struct *occfifo_wq;
+
+static void occfifo_enqueue_xfr(struct occfifo_xfr *xfr)
+{
+	int empty;
+	struct occfifo *occfifo = xfr->client->occfifo;
+
+	spin_lock_irq(&occfifo->list_lock);
+	empty = list_empty(&occfifo->xfrs);
+	list_add_tail(&xfr->link, &occfifo->xfrs);
+	spin_unlock(&occfifo->list_lock);
+
+	if (empty)
+		queue_work(occfifo_wq, &occfifo->work);
+}
+
+static int occfifo_open(struct inode *inode, struct file *file)
+{
+	struct occfifo_client *client;
+	struct miscdevice *mdev = file->private_data;
+	struct occfifo *occfifo = to_occfifo(mdev);
+
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
+	if (!client)
+		return -ENOMEM;
+
+	client->occfifo = occfifo;
+	spin_lock_init(&client->lock);
+	init_waitqueue_head(&client->wait);
+
+	if (file->f_flags & O_NONBLOCK)
+		set_bit(CLIENT_NONBLOCKING, &client->flags);
+
+	file->private_data = client;
+
+	return 0;
+}
+
+static ssize_t occfifo_read(struct file *file, char __user *buf, size_t len,
+			    loff_t *offset)
+{
+	int rc;
+	size_t bytes;
+	struct occfifo_xfr *xfr;
+	struct occfifo_client *client = file->private_data;
+
+	if (!access_ok(VERIFY_WRITE, buf, len))
+		return -EFAULT;
+
+	if (len > OCC_SRAM_BYTES)
+		return -EINVAL;
+
+	spin_lock_irq(&client->lock);
+	if (!client->xfr) {
+		/* we just finished reading all data, return 0 */
+		if (client->read_offset) {
+			rc = 0;
+			client->read_offset = 0;
+		}
+		else
+			rc = -ENOMSG;
+
+		goto done;
+	}
+
+	xfr = client->xfr;
+
+	if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
+		if (client->flags & CLIENT_NONBLOCKING) {
+			rc = -ERESTARTSYS;
+			goto done;
+		}
+
+		set_bit(XFR_WAITING, &xfr->flags);
+		spin_unlock(&client->lock);
+
+		rc = wait_event_interruptible(client->wait,
+			test_bit(XFR_COMPLETE, &xfr->flags) ||
+			test_bit(XFR_CANCELED, &xfr->flags));
+
+		spin_lock_irq(&client->lock);
+		if (test_bit(XFR_CANCELED, &xfr->flags)) {
+			kfree(xfr);
+			spin_unlock(&client->lock);
+			kfree(client);
+			return -EBADFD;
+		}
+
+		clear_bit(XFR_WAITING, &xfr->flags);
+		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
+			rc = -EINTR;
+			goto done;
+		}
+	}
+
+	if (xfr->rc) {
+		rc = xfr->rc;
+		goto done;
+	}
+
+	bytes = min(len, xfr->resp_data_length - client->read_offset);
+	if (copy_to_user(buf, &xfr->buf[client->read_offset], bytes)) {
+		rc = -EFAULT;
+		goto done;
+	}
+
+	client->read_offset += bytes;
+
+	/* xfr done */
+	if (client->read_offset == xfr->resp_data_length) {
+		kfree(xfr);
+		client->xfr = NULL;
+	}
+
+	rc = bytes;
+
+done:
+	spin_unlock(&client->lock);
+	return rc;
+}
+
+static ssize_t occfifo_write(struct file *file, const char __user *buf,
+			     size_t len, loff_t *offset)
+{
+	int rc;
+	struct occfifo_xfr *xfr;
+	struct occfifo_client *client = file->private_data;
+
+	if (!access_ok(VERIFY_READ, buf, len))
+		return -EFAULT;
+
+	if (len > OCC_SRAM_BYTES)
+		return -EINVAL;
+
+	spin_lock_irq(&client->lock);
+	if (client->xfr) {
+		rc = -EDEADLK;
+		goto done;
+	}
+
+	xfr = kzalloc(sizeof(*xfr), GFP_KERNEL);
+	if (!xfr) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	if (copy_from_user(xfr->buf, buf, len)) {
+		kfree(xfr);
+		rc = -EFAULT;
+		goto done;
+	}
+
+	xfr->client = client;
+	xfr->cmd_data_length = len;
+	client->xfr = xfr;
+	client->read_offset = 0;
+
+	occfifo_enqueue_xfr(xfr);
+
+	rc = len;
+
+done:
+	spin_unlock(&client->lock);
+	return rc;
+}
+
+static int occfifo_release(struct inode *inode, struct file *file)
+{
+	struct occfifo_xfr *xfr;
+	struct occfifo_client *client = file->private_data;
+	struct occfifo *occfifo = client->occfifo;
+
+	spin_lock_irq(&client->lock);
+	xfr = client->xfr;
+	if (!xfr) {
+		spin_unlock(&client->lock);
+		kfree(client);
+		return 0;
+	}
+
+	spin_lock_irq(&occfifo->list_lock);
+	set_bit(XFR_CANCELED, &xfr->flags);
+	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
+		/* already deleted from list if complete */
+		if (!test_bit(XFR_COMPLETE, &xfr->flags))
+			list_del(&xfr->link);
+
+		spin_unlock(&occfifo->list_lock);
+
+		if (test_bit(XFR_WAITING, &xfr->flags)) {
+			/* blocking read; let reader clean up */
+			wake_up_interruptible(&client->wait);
+			spin_unlock(&client->lock);
+			return 0;
+		}
+
+		kfree(xfr);
+		spin_unlock(&client->lock);
+		kfree(client);
+		return 0;
+	}
+
+	/* operation is in progress; let worker clean up*/
+	spin_unlock(&occfifo->list_lock);
+	spin_unlock(&client->lock);
+	return 0;
+}
+
+static const struct file_operations occfifo_fops = {
+	.owner = THIS_MODULE,
+	.open = occfifo_open,
+	.read = occfifo_read,
+	.write = occfifo_write,
+	.release = occfifo_release,
+};
+
+static int occfifo_getscom(struct sbefifo *sbefifo, u32 address, u8 *data)
+{
+	int rc;
+	u32 buf[4];
+	struct sbefifo_client *client;
+	const size_t len = sizeof(buf);
+
+	buf[0] = 0x4;
+	buf[1] = 0xa201;
+	buf[2] = 0;
+	buf[3] = address;
+
+	client = sbefifo_drv_open(sbefifo, 0);
+	if (!client)
+		return -ENODEV;
+
+	rc = sbefifo_drv_write(client, (const char *)buf, len);
+	if (rc < 0)
+		goto done;
+	else if (rc != len) {
+		rc = -EIO;
+		goto done;
+	}
+
+	rc = sbefifo_drv_read(client, (char *)buf, len);
+	if (rc < 0)
+		goto done;
+	else if (rc != len) {
+		rc = -EIO;
+		goto done;
+	}
+
+	rc = 0;
+
+	memcpy(data, buf, sizeof(u64));
+
+done:
+	sbefifo_drv_release(client);
+	return rc;
+}
+
+static int occfifo_putscom(struct sbefifo *sbefifo, u32 address, u8 *data)
+{
+	int rc;
+	u32 buf[6];
+	struct sbefifo_client *client;
+	const size_t len = sizeof(buf);
+
+	buf[0] = 0x6;
+	buf[1] = 0xa202;
+	buf[2] = 0;
+	buf[3] = address;
+	memcpy(&buf[4], data, sizeof(u64));
+
+	client = sbefifo_drv_open(sbefifo, 0);
+	if (!client)
+		return -ENODEV;
+
+	rc = sbefifo_drv_write(client, (const char *)buf, len);
+	if (rc < 0)
+		goto done;
+	else if (rc != len) {
+		rc = -EIO;
+		goto done;
+	}
+
+	rc = sbefifo_drv_read(client, (char *)buf, sizeof(u32) * 4);
+	if (rc < 0) {
+		rc = 0;
+		goto done;
+	} else if (rc != sizeof(u32) * 4) {
+		rc = -EIO;
+		goto done;
+	}
+
+	rc = 0;
+
+done:
+	sbefifo_drv_release(client);
+	return rc;
+}
+
+static int occfifo_putscom_u32(struct sbefifo *sbefifo, u32 address, u32 data0,
+			       u32 data1)
+{
+	u8 buf[8];
+
+	memcpy(buf, &data0, 4);
+	memcpy(buf + 4, &data1, 4);
+
+	return occfifo_putscom(sbefifo, address, buf);
+}
+
+static void occfifo_worker(struct work_struct *work)
+{
+	int i, empty, canceled, waiting, rc;
+	u16 resp_data_length;
+	struct occfifo *occfifo = container_of(work, struct occfifo, work);
+	struct sbefifo *sbefifo = occfifo->sbefifo;
+	struct occfifo_client *client;
+	struct occfifo_xfr *xfr;
+	struct occ_response *resp;
+
+again:
+	spin_lock_irq(&occfifo->list_lock);
+	xfr = list_first_entry(&occfifo->xfrs, struct occfifo_xfr, link);
+	if (!xfr) {
+		spin_unlock(&occfifo->list_lock);
+		return;
+	}
+
+	set_bit(XFR_IN_PROGRESS, &xfr->flags);
+	spin_unlock(&occfifo->list_lock);
+
+	resp = (struct occ_response *)xfr->buf;
+
+	spin_lock_irq(&occfifo->occ_lock);
+
+	/* set stream mode enabled */
+	rc = occfifo_putscom_u32(sbefifo, 0x6D053, 0x08000000, 0);
+	if (rc)
+		goto done;
+
+	/* set stream mode to linear */
+	rc = occfifo_putscom_u32(sbefifo, 0x6D052, 0x04000000, 0);
+	if (rc)
+		goto done;
+
+	/* set address reg to occ sram command buffer */
+	rc = occfifo_putscom_u32(sbefifo, 0x6D050, 0xFFFBE000, 0);
+	if (rc)
+		goto done;
+
+	/* write cmd data */
+	for (i = 0; i < xfr->cmd_data_length; i += 8) {
+		rc = occfifo_putscom(sbefifo, 0x6D055, &xfr->buf[i]);
+		if (rc)
+			goto done;
+	}
+
+	/* set stream mode enabled and stream mode to circular */
+	rc = occfifo_putscom_u32(sbefifo, 0x6D033, 0x0C000000, 0);
+	if (rc)
+		goto done;
+
+	/* trigger attention */
+	rc = occfifo_putscom_u32(sbefifo, 0x6D035, 0x20010000, 0);
+	if (rc)
+		goto done;
+
+	/* set address reg to occ sram response buffer */
+	rc = occfifo_putscom_u32(sbefifo, 0x6D050, 0xFFFBF000, 0);
+	if (rc)
+		goto done;
+
+	rc = occfifo_getscom(sbefifo, 0x6D055, xfr->buf);
+	if (rc)
+		goto done;
+
+	xfr->resp_data_length += 8;
+
+	resp_data_length = be16_to_cpu(get_unaligned(&resp->data_length));
+	if (resp_data_length > OCC_RESP_DATA_BYTES) {
+		rc = -EFAULT;
+		goto done;
+	}
+
+	/* already read 3 bytes of resp data, but also need 2 bytes chksum */
+	for (i = 8; i < resp_data_length + 7; i += 8) {
+		rc = occfifo_getscom(sbefifo, 0x6D055, &xfr->buf[i]);
+		if (rc)
+			goto done;
+
+		xfr->resp_data_length += 8;
+	}
+
+	/* no errors, got all data */
+	xfr->resp_data_length = resp_data_length + 7;
+
+done:
+	spin_unlock(&occfifo->occ_lock);
+
+	xfr->rc = rc;
+	client = xfr->client;
+
+	/* lock client to prevent race with read() */
+	spin_lock_irq(&client->lock);
+	set_bit(XFR_COMPLETE, &xfr->flags);
+	waiting = test_bit(XFR_WAITING, &xfr->flags);
+	spin_unlock(&client->lock);
+
+	spin_lock_irq(&occfifo->list_lock);
+	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
+	list_del(&xfr->link);
+	empty = list_empty(&occfifo->xfrs);
+	canceled = test_bit(XFR_CANCELED, &xfr->flags);
+	spin_unlock(&occfifo->list_lock);
+
+	if (waiting)
+		wake_up_interruptible(&client->wait);
+	else if (canceled) {
+		kfree(xfr);
+		kfree(xfr->client);
+	}
+
+	if (!empty)
+		goto again;
+}
+
+void occfifo_notify(struct sbefifo_drv_ref *ref)
+{
+	struct occfifo *occfifo = container_of(ref, struct occfifo, ref);
+
+	/* TODO: find better solution? this does seem to work if we lose
+	 * the sbefifo in the middle of a transfer
+	 */
+	occfifo->sbefifo = NULL;
+}
+
+static int occfifo_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct occfifo *occfifo;
+	struct device_node *bus;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+
+	occfifo = devm_kzalloc(dev, sizeof(*occfifo), GFP_KERNEL);
+	if (!occfifo)
+		return -ENOMEM;
+
+	bus = of_parse_phandle(node, "bus", 0);
+	if (!bus) {
+		dev_err(dev, "failed to get dts phandle\n");
+		return -ENODEV;
+	}
+
+	occfifo->ref.notify = occfifo_notify;
+	occfifo->sbefifo = sbefifo_drv_reference(bus, &occfifo->ref);
+	if (!occfifo->sbefifo) {
+		dev_err(dev, "failed to get sbefifo reference\n");
+		rc = -ENODEV;
+		goto done;
+	}
+
+	INIT_LIST_HEAD(&occfifo->xfrs);
+	spin_lock_init(&occfifo->list_lock);
+	spin_lock_init(&occfifo->occ_lock);
+	INIT_WORK(&occfifo->work, occfifo_worker);
+
+	snprintf(occfifo->name, sizeof(occfifo->name), "occfifo%d",
+		 sbefifo_drv_get_idx(occfifo->sbefifo));
+
+	occfifo->mdev.fops = &occfifo_fops;
+	occfifo->mdev.minor = MISC_DYNAMIC_MINOR;
+	occfifo->mdev.name = occfifo->name;
+	occfifo->mdev.parent = dev;
+
+	rc = misc_register(&occfifo->mdev);
+	if (rc) {
+		dev_err(dev, "failed to register miscdevice\n");
+		goto done;
+	}
+
+	platform_set_drvdata(pdev, occfifo);
+
+done:
+	of_node_put(bus);
+	return rc;
+}
+
+static int occfifo_remove(struct platform_device *pdev)
+{
+	struct occfifo_xfr *xfr, *tmp;
+	struct occfifo *occfifo = platform_get_drvdata(pdev);
+	struct occfifo_client *client;
+
+	misc_deregister(&occfifo->mdev);
+
+	spin_lock_irq(&occfifo->list_lock);
+	list_for_each_entry_safe(xfr, tmp, &occfifo->xfrs, link) {
+		client = xfr->client;
+		set_bit(XFR_CANCELED, &xfr->flags);
+
+		if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
+			list_del(&xfr->link);
+
+			spin_lock_irq(&client->lock);
+			if (test_bit(XFR_WAITING, &xfr->flags)) {
+				wake_up_interruptible(&client->wait);
+				spin_unlock(&client->lock);
+			}
+			else {
+				kfree(xfr);
+				spin_unlock(&client->lock);
+				kfree(client);
+			}
+		}
+	}
+	spin_unlock(&occfifo->list_lock);
+
+	flush_work(&occfifo->work);
+	list_del(&occfifo->ref.link);
+
+	return 0;
+}
+
+static const struct of_device_id occfifo_match[] = {
+	{ .compatible = "ibm,occfifo" },
+	{ },
+};
+
+static struct platform_driver occfifo_driver = {
+	.driver = {
+		.name = "occfifo",
+		.of_match_table	= occfifo_match,
+	},
+	.probe	= occfifo_probe,
+	.remove = occfifo_remove,
+};
+
+static int occfifo_init(void)
+{
+	occfifo_wq = create_singlethread_workqueue("occfifo");
+	if (!occfifo_wq)
+		return -ENOMEM;
+
+	return platform_driver_register(&occfifo_driver);
+}
+
+static void occfifo_exit(void)
+{
+	destroy_workqueue(occfifo_wq);
+
+	platform_driver_unregister(&occfifo_driver);
+}
+
+module_init(occfifo_init);
+module_exit(occfifo_exit);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P9 OCC driver");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
