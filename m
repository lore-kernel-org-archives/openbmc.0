Return-Path: <clg@kaod.org>
X-Greylist: delayed 411 seconds by postgrey-1.36 at bilbo;
 Fri, 21 Oct 2016 01:01:21 AEDT
Received: from 6.mo69.mail-out.ovh.net (6.mo69.mail-out.ovh.net
 [46.105.50.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t09TF3cvGzDvWt
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 01:01:21 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 28954789B
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 15:54:26 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 02B6F54008D;
 Thu, 20 Oct 2016 15:54:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] aspeed: fix the debugfs write operation
Date: Thu, 20 Oct 2016 15:54:20 +0200
Message-Id: <1476971660-6106-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14740563055837154050
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrheekgdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 20 Oct 2016 14:01:21 -0000

It was incompatible with the seq_file used in the read so the read
operation was changed also. Now you can write to the debug file with:

  # echo 0x1E630004=0x3DBB2081 > /sys/kernel/debug/aspeed/1e630000.spi
  # cat /sys/kernel/debug/aspeed/1e630000.spi 
  0x1E630000: 0x00000002
  0x1E630004: 0x3DBB2081
  0x1E630008: 0x00000000
  0x1E63000C: 0x00000000
  0x1E630010: 0x00000000
  0x1E630014: 0x00000000

Some basic checks are done to not ruin the kernel but anyhow, this is
not for upstream. It is just a useful devmem replacement.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/mach-aspeed/debugfs.c |   69 +++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 22 deletions(-)

Index: linux-openbmc-4.7.git/arch/arm/mach-aspeed/debugfs.c
===================================================================
--- linux-openbmc-4.7.git.orig/arch/arm/mach-aspeed/debugfs.c
+++ linux-openbmc-4.7.git/arch/arm/mach-aspeed/debugfs.c
@@ -23,21 +23,36 @@
 #define AST_IO(__pa)	((void __iomem *)(((__pa) & 0x001fffff) | AST_IO_VA))
 
 struct aspeed_controller {
+	struct device *dev;
 	const char *name;
 	unsigned int base;
 	unsigned int nregs;
 };
 
-static int aspeed_show(struct seq_file *s, void *unused)
+static ssize_t aspeed_read(struct file *filp, char __user *ubuf,
+			   size_t count, loff_t *ppos)
 {
-	struct aspeed_controller *ctrl = s->private;
+	struct aspeed_controller *ctrl = filp->private_data;
+	char *kbuf;
+	int ret, n = 0;
+	size_t size;
 	int i;
 
-	for (i = 0; i < ctrl->nregs; i += 4)
-		seq_printf(s, "0x%08X: 0x%08X\n", ctrl->base | i,
-			   readl(AST_IO(ctrl->base | i)));
+	size = ctrl->nregs * 23 + 1;
+	kbuf = kzalloc(size, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	for (i = 0; i < ctrl->nregs; i += 4) {
+		n += scnprintf(kbuf + n, size - n, "0x%08X: 0x%08X\n",
+			       ctrl->base | i, readl(AST_IO(ctrl->base | i)));
+	}
+
+	ret = simple_read_from_buffer(ubuf, count, ppos, kbuf, n);
 
-	return 0;
+	kfree(kbuf);
+
+	return ret;
 }
 
 static ssize_t aspeed_write(struct file *filp, const char __user *ubuf,
@@ -45,35 +60,44 @@ static ssize_t aspeed_write(struct file
 {
 	struct aspeed_controller *ctrl = filp->private_data;
 	unsigned int reg, val;
-	char buf[50];
+	char *kbuf = kmalloc(count + 1, GFP_KERNEL);
 	int ret;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, ubuf, count);
-	if (!ret)
-		return -EFAULT;
+	if (!kbuf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(kbuf, count, ppos, ubuf, count);
+	if (ret != count) {
+		kfree(kbuf);
+		return ret >= 0 ? -EIO : ret;
+	}
+	kbuf[count] = '\0';
+
+	ret = sscanf(kbuf, "%x=%x", &reg, &val);
+	kfree(kbuf);
 
-	ret = sscanf(buf, "%x=%x", &reg, &val);
 	if (ret != 2)
 		return -EINVAL;
 
-	if (reg >= ctrl->nregs)
+	if ((ctrl->base & reg) != ctrl->base) {
+		dev_err(ctrl->dev, "wrong base address: %x\n", reg);
 		return -EINVAL;
+	}
 
-	writel(val, AST_IO(ctrl->base | reg));
-	return count;
-}
+	if ((~ctrl->base & reg) >= ctrl->nregs) {
+		dev_err(ctrl->dev, "wrong register: %x\n", reg);
+		return -EINVAL;
+	}
 
-static int aspeed_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, aspeed_show, inode->i_private);
+	writel(val, AST_IO(reg));
+	return count;
 }
 
 static const struct file_operations aspeed_fops = {
-	.open		= aspeed_open,
-	.read		= seq_read,
+	.open		= simple_open,
+	.read		= aspeed_read,
 	.write		= aspeed_write,
-	.llseek		= seq_lseek,
-	.release	= single_release,
+	.llseek		= generic_file_llseek,
 };
 
 static struct dentry *aspeed_debugfs_root;
@@ -95,6 +119,7 @@ static int aspeed_device_show(struct dev
 	if (!ctrl)
 		return -ENOMEM;
 
+	ctrl->dev = dev;
 	ctrl->name = pdev->name;
 	ctrl->base = r->start;
 	ctrl->nregs = resource_size(r);
