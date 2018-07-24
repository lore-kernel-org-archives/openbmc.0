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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ZRBx5kbwzDrM8;
 Tue, 24 Jul 2018 15:05:45 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6O55JLJ028169;
 Tue, 24 Jul 2018 00:05:30 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 3/5] fsi: scom: Convert to use the new chardev
Date: Tue, 24 Jul 2018 15:05:17 +1000
Message-Id: <20180724050519.31920-4-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724050519.31920-1-benh@kernel.crashing.org>
References: <20180724050519.31920-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 24 Jul 2018 05:05:46 -0000

This converts FSI scom to use the new fsi-core controlled
chardev allocator and use a real cdev instead of a miscdev.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-scom.c | 130 +++++++++++++++++++++++++----------------
 1 file changed, 80 insertions(+), 50 deletions(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 39c74351f1bf..0f303a700f69 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -20,9 +20,8 @@
 #include <linux/fs.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
-#include <linux/miscdevice.h>
+#include <linux/cdev.h>
 #include <linux/list.h>
-#include <linux/idr.h>
 
 #include <uapi/linux/fsi.h>
 
@@ -77,18 +76,12 @@
 struct scom_device {
 	struct list_head link;
 	struct fsi_device *fsi_dev;
-	struct miscdevice mdev;
+	struct device dev;
+	struct cdev cdev;
 	struct mutex lock;
-	char	name[32];
-	int	idx;
+	bool dead;
 };
 
-#define to_scom_dev(x)		container_of((x), struct scom_device, mdev)
-
-static struct list_head scom_devices;
-
-static DEFINE_IDA(scom_ida);
-
 static int __put_scom(struct scom_device *scom_dev, uint64_t value,
 		      uint32_t addr, uint32_t *status)
 {
@@ -374,9 +367,7 @@ static int get_scom(struct scom_device *scom, uint64_t *value,
 static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
 			 loff_t *offset)
 {
-	struct miscdevice *mdev =
-				(struct miscdevice *)filep->private_data;
-	struct scom_device *scom = to_scom_dev(mdev);
+	struct scom_device *scom = filep->private_data;
 	struct device *dev = &scom->fsi_dev->dev;
 	uint64_t val;
 	int rc;
@@ -385,7 +376,10 @@ static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
 		return -EINVAL;
 
 	mutex_lock(&scom->lock);
-	rc = get_scom(scom, &val, *offset);
+	if (scom->dead)
+		rc = -ENODEV;
+	else
+		rc = get_scom(scom, &val, *offset);
 	mutex_unlock(&scom->lock);
 	if (rc) {
 		dev_dbg(dev, "get_scom fail:%d\n", rc);
@@ -403,8 +397,7 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
 			  size_t len, loff_t *offset)
 {
 	int rc;
-	struct miscdevice *mdev = filep->private_data;
-	struct scom_device *scom = to_scom_dev(mdev);
+	struct scom_device *scom = filep->private_data;
 	struct device *dev = &scom->fsi_dev->dev;
 	uint64_t val;
 
@@ -418,7 +411,10 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
 	}
 
 	mutex_lock(&scom->lock);
-	rc = put_scom(scom, val, *offset);
+	if (scom->dead)
+		rc = -ENODEV;
+	else
+		rc = put_scom(scom, val, *offset);
 	mutex_unlock(&scom->lock);
 	if (rc) {
 		dev_dbg(dev, "put_scom failed with:%d\n", rc);
@@ -532,12 +528,15 @@ static int scom_check(struct scom_device *scom, void __user *argp)
 
 static long scom_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct miscdevice *mdev = file->private_data;
-	struct scom_device *scom = to_scom_dev(mdev);
+	struct scom_device *scom = file->private_data;
 	void __user *argp = (void __user *)arg;
 	int rc = -ENOTTY;
 
 	mutex_lock(&scom->lock);
+	if (scom->dead) {
+		mutex_unlock(&scom->lock);
+		return -ENODEV;
+	}
 	switch(cmd) {
 	case FSI_SCOM_CHECK:
 		rc = scom_check(scom, argp);
@@ -556,48 +555,88 @@ static long scom_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	return rc;
 }
 
+static int scom_open(struct inode *inode, struct file *file)
+{
+	struct scom_device *scom = container_of(inode->i_cdev, struct scom_device, cdev);
+
+	file->private_data = scom;
+
+	return 0;
+}
+
 static const struct file_operations scom_fops = {
 	.owner		= THIS_MODULE,
+	.open		= scom_open,
 	.llseek		= scom_llseek,
 	.read		= scom_read,
 	.write		= scom_write,
 	.unlocked_ioctl	= scom_ioctl,
 };
 
+static void scom_free(struct device *dev)
+{
+	struct scom_device *scom = container_of(dev, struct scom_device, dev);
+
+	put_device(&scom->fsi_dev->dev);
+	kfree(scom);
+}
+
 static int scom_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct scom_device *scom;
+	int rc, didx;
 
-	scom = devm_kzalloc(dev, sizeof(*scom), GFP_KERNEL);
+	scom = kzalloc(sizeof(*scom), GFP_KERNEL);
 	if (!scom)
 		return -ENOMEM;
-
+	dev_set_drvdata(dev, scom);
 	mutex_init(&scom->lock);
-	scom->idx = ida_simple_get(&scom_ida, 1, INT_MAX, GFP_KERNEL);
-	snprintf(scom->name, sizeof(scom->name), "scom%d", scom->idx);
-	scom->fsi_dev = fsi_dev;
-	scom->mdev.minor = MISC_DYNAMIC_MINOR;
-	scom->mdev.fops = &scom_fops;
-	scom->mdev.name = scom->name;
-	scom->mdev.parent = dev;
-	list_add(&scom->link, &scom_devices);
-
-	return misc_register(&scom->mdev);
+
+	/* Grab a reference to the device (parent of our cdev), we'll drop it later */
+	if (!get_device(dev)) {
+		kfree(scom);
+		return -ENODEV;
+	}
+
+	/* Create chardev for userspace access */
+	scom->dev.type = &fsi_cdev_type;
+	scom->dev.parent = dev;
+	scom->dev.release = scom_free;
+	device_initialize(&scom->dev);
+
+	/* Allocate a minor in the FSI space */
+	rc = fsi_get_new_minor(fsi_dev, fsi_dev_scom, &scom->dev.devt, &didx);
+	if (rc)
+		goto err;
+
+	dev_set_name(&scom->dev, "scom%d", didx);
+	cdev_init(&scom->cdev, &scom_fops);
+	rc = cdev_device_add(&scom->cdev, &scom->dev);
+	if (rc) {
+		dev_err(dev, "Error %d creating char device %s\n",
+			rc, dev_name(&scom->dev));
+		goto err_free_minor;
+	}
+
+	return 0;
+ err_free_minor:
+	fsi_free_minor(scom->dev.devt);
+ err:
+	put_device(&scom->dev);
+	return rc;
 }
 
 static int scom_remove(struct device *dev)
 {
-	struct scom_device *scom, *scom_tmp;
-	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct scom_device *scom = dev_get_drvdata(dev);
 
-	list_for_each_entry_safe(scom, scom_tmp, &scom_devices, link) {
-		if (scom->fsi_dev == fsi_dev) {
-			list_del(&scom->link);
-			ida_simple_remove(&scom_ida, scom->idx);
-			misc_deregister(&scom->mdev);
-		}
-	}
+	mutex_lock(&scom->lock);
+	scom->dead = true;
+	mutex_unlock(&scom->lock);
+	cdev_device_del(&scom->cdev, &scom->dev);
+	fsi_free_minor(scom->dev.devt);
+	put_device(&scom->dev);
 
 	return 0;
 }
@@ -622,20 +661,11 @@ static struct fsi_driver scom_drv = {
 
 static int scom_init(void)
 {
-	INIT_LIST_HEAD(&scom_devices);
 	return fsi_driver_register(&scom_drv);
 }
 
 static void scom_exit(void)
 {
-	struct list_head *pos;
-	struct scom_device *scom;
-
-	list_for_each(pos, &scom_devices) {
-		scom = list_entry(pos, struct scom_device, link);
-		misc_deregister(&scom->mdev);
-		devm_kfree(&scom->fsi_dev->dev, scom);
-	}
 	fsi_driver_unregister(&scom_drv);
 }
 
-- 
2.17.1
