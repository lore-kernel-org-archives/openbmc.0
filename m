Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDHgH2f9YzDq5Y
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 09:22:19 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v11MIlBo113584
 for <openbmc@lists.ozlabs.org>; Wed, 1 Feb 2017 17:22:16 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28bk1tcec1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 17:22:16 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 1 Feb 2017 15:22:15 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 1 Feb 2017 15:22:12 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 30FF41FF0021;
 Wed,  1 Feb 2017 15:21:50 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v11MMCE511141394; Wed, 1 Feb 2017 15:22:12 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E9416A042;
 Wed,  1 Feb 2017 15:22:12 -0700 (MST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.201.28])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 28D206A03B;
 Wed,  1 Feb 2017 15:22:08 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au,
 alistair@popple.id.au, benh@kernel.crashing.org,
 Eddie James <eajames@us.ibm.com>
Subject: [PATCH] drivers/fsi: Add slave interrupt polling
Date: Wed,  1 Feb 2017 16:22:01 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020122-0008-0000-0000-000007192EF6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006539; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00815877; UDB=6.00398359; IPR=6.00593319; 
 BA=6.00005108; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014142; XFM=3.00000011;
 UTC=2017-02-01 22:22:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020122-0009-0000-0000-00003F88C87A
Message-Id: <20170201222201.49331-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-01_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702010218
X-Mailman-Approved-At: Thu, 02 Feb 2017 10:42:03 +1100
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
X-List-Received-Date: Wed, 01 Feb 2017 22:22:19 -0000

Scan slaves present for asserting interrupt signals in the si1s
register and call a registered client's interrupt handler as
appropriate.

Signed-off-by: Eddie James <eajames@us.ibm.com>
Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c        | 99 +++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master-gpio.c |  1 +
 drivers/fsi/fsi-master.h      |  2 +
 include/linux/fsi.h           |  5 +++
 4 files changed, 107 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 72e0ca3..4df7218 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -15,11 +15,15 @@
 
 #include <linux/device.h>
 #include <linux/fsi.h>
+#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/jiffies.h>
 
 #include "fsi-master.h"
 
+#define DEBUG
+
 #define FSI_N_SLAVES	4
 
 #define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
@@ -36,7 +40,11 @@
 #define FSI_PEEK_BASE			0x410
 #define	FSI_SLAVE_BASE			0x800
 
+#define FSI_IPOLL_PERIOD		msecs_to_jiffies(fsi_ipoll_period_ms)
+
 static const int engine_page_size = 0x400;
+static struct task_struct *master_ipoll;
+static unsigned int fsi_ipoll_period_ms = 100;
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
@@ -60,6 +68,8 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
  * FSI slave engine control register offsets
  */
 #define	FSI_SMODE		0x0	/* R/W: Mode register */
+#define FSI_SI1M		0x18	/* R/W: IRQ mask */
+#define FSI_SI1S		0x1C	/* R: IRQ status */
 
 /*
  * SMODE fields
@@ -197,6 +207,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 	uint32_t engine_addr;
 	uint32_t conf;
 	int rc, i;
+	uint8_t si1s_bit = 1;
 
 	INIT_LIST_HEAD(&slave->my_engines);
 
@@ -253,6 +264,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			dev->unit = i;
 			dev->addr = engine_addr;
 			dev->size = slots * engine_page_size;
+			dev->si1s_bit = si1s_bit++;
 
 			dev_info(&slave->dev,
 			"engine[%i]: type %x, version %x, addr %x size %x\n",
@@ -507,6 +519,56 @@ static void fsi_master_unscan(struct fsi_master *master)
 	master->slave_list = false;
 }
 
+static void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
+{
+	struct fsi_slave *slave;
+	struct fsi_device *fsi_dev;
+
+	if (list_empty(&master->my_slaves))
+		return;
+
+	slave = list_first_entry(&master->my_slaves, struct fsi_slave,
+				list_link);
+
+	list_for_each_entry(fsi_dev, &slave->my_engines, link) {
+		if (si1s & (0x80000000 >> fsi_dev->si1s_bit) &&
+		    fsi_dev->irq_handler)
+			fsi_dev->irq_handler(0, &fsi_dev->dev);
+	}
+}
+
+static int fsi_master_ipoll(void *data)
+{
+	int rc;
+	uint32_t si1s;
+	unsigned long elapsed = 0;
+	unsigned long previous_jiffies = jiffies;
+	struct fsi_master *master = data;
+
+	while (!kthread_should_stop()) {
+		if (!master->ipoll)
+			goto done;
+
+		/* Ignore errors for now */
+		rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1S,
+				  &si1s, sizeof(uint32_t));
+		if (rc)
+			goto done;
+
+		if (si1s & master->ipoll)
+			fsi_master_irq(master, 0, si1s);
+done:
+		elapsed = jiffies - previous_jiffies;
+		if (elapsed < FSI_IPOLL_PERIOD) {
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			schedule_timeout(FSI_IPOLL_PERIOD - elapsed);
+		}
+		previous_jiffies = jiffies;
+	}
+
+	return 0;
+}
+
 int fsi_master_register(struct fsi_master *master)
 {
 	if (!master || !master->dev)
@@ -524,9 +586,36 @@ void fsi_master_unregister(struct fsi_master *master)
 {
 	fsi_master_unscan(master);
 	put_device(master->dev);
+	if (master_ipoll) {
+		kthread_stop(master_ipoll);
+		master_ipoll = NULL;
+	}
 }
 EXPORT_SYMBOL_GPL(fsi_master_unregister);
 
+/*
+ * TODO: move this to master->start_ipoll( ) -each master may have its
+ * own way of doing this
+ */
+int fsi_master_start_ipoll(struct fsi_master *master)
+{
+	if (master_ipoll) {
+		dev_err(master->dev, "Already polling for irqs\n");
+		return -EALREADY;
+	}
+	master_ipoll = kthread_create(fsi_master_ipoll, master,
+				"fsi_master_ipoll");
+	if (IS_ERR(master_ipoll)) {
+		dev_err(master->dev, "Couldn't create ipoll thread rc:%d\n",
+			(int)PTR_ERR(master_ipoll));
+		return PTR_ERR(master_ipoll);
+	}
+	wake_up_process(master_ipoll);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsi_master_start_ipoll);
+
 /* FSI core & Linux bus type definitions */
 
 static int fsi_bus_match(struct device *dev, struct device_driver *drv)
@@ -566,6 +655,16 @@ void fsi_driver_unregister(struct fsi_driver *fsi_drv)
 }
 EXPORT_SYMBOL_GPL(fsi_driver_unregister);
 
+int fsi_enable_irq(struct fsi_device *dev)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsi_enable_irq);
+
+void fsi_disable_irq(struct fsi_device *dev)
+{
+}
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 83c7cf0..73d9985 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -457,6 +457,7 @@ static ssize_t store_scan(struct device *dev,
 	/* clear out any old scan data if present */
 	fsi_master_unregister(&master->master);
 	fsi_master_register(&master->master);
+	fsi_master_start_ipoll(&master->master);
 
 	return count;
 }
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 454af2b..3737404 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -25,6 +25,7 @@ struct fsi_master {
 	struct device	*dev;
 	int		idx;
 	int		n_links;
+	uint32_t	ipoll;
 	int		(*read)(struct fsi_master *, int link,
 				uint8_t slave, uint32_t addr,
 				void *val, size_t size);
@@ -37,6 +38,7 @@ struct fsi_master {
 
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
+extern int fsi_master_start_ipoll(struct fsi_master *master);
 
 /**
  * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 2721255..d22d0c5 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -23,9 +23,11 @@ struct fsi_device {
 	u8			engine_type;
 	u8			version;
 	u8			unit;
+	u8			si1s_bit;
 	struct fsi_slave	*slave;
 	uint32_t		addr;
 	uint32_t		size;
+	int (*irq_handler)(int, void *);
 };
 
 extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
@@ -69,4 +71,7 @@ extern void fsi_driver_unregister(struct fsi_driver *);
 
 extern struct bus_type fsi_bus_type;
 
+extern int fsi_enable_irq(struct fsi_device *dev);
+extern void fsi_disable_irq(struct fsi_device *dev);
+
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
