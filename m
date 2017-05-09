Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMt6l5wx2zDqKl
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 07:39:11 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v49LYS9h133831
 for <openbmc@lists.ozlabs.org>; Tue, 9 May 2017 17:39:09 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2abatwwcsj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 May 2017 17:39:08 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 9 May 2017 17:39:08 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 9 May 2017 17:39:06 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v49Ld6dR41746546; Tue, 9 May 2017 21:39:06 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EC2512403D;
 Tue,  9 May 2017 17:39:00 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 038DA124035;
 Tue,  9 May 2017 17:38:59 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org, 
 Eddie James <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/7] drivers/fsi: Add slave interrupt polling
Date: Tue,  9 May 2017 16:38:56 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17050921-0036-0000-0000-000002008BEF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007039; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00858366; UDB=6.00425300; IPR=6.00637831; 
 BA=6.00005339; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015382; XFM=3.00000015;
 UTC=2017-05-09 21:39:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050921-0037-0000-0000-000040465DC1
Message-Id: <20170509213902.37939-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-09_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705090123
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
X-List-Received-Date: Tue, 09 May 2017 21:39:12 -0000

Scan slaves present for asserting interrupt signals in the
si1s register and call a registered client's interrupt handler as
appropriate.

Includes initial code from Eddie James <eajames@us.ibm.com>

Signed-off-by: Eddie James <eajames@us.ibm.com>
Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c   | 110 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h |   1 +
 include/linux/fsi.h      |   5 +++
 3 files changed, 116 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index a6ed34f..73fdb69 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -15,9 +15,11 @@
 
 #include <linux/device.h>
 #include <linux/fsi.h>
+#include <linux/kthread.h>
 #include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/jiffies.h>
 
 #include "fsi-master.h"
 
@@ -38,8 +40,11 @@
 #define FSI_PEEK_BASE			0x410
 
 static const int engine_page_size = 0x400;
+static struct task_struct *master_ipoll;
+static unsigned int fsi_ipoll_period_ms = 100;
 
 #define FSI_SLAVE_BASE			0x800
+#define FSI_IPOLL_PERIOD		msecs_to_jiffies(fsi_ipoll_period_ms)
 
 /*
  * FSI slave engine control register offsets
@@ -47,6 +52,8 @@
 #define FSI_SMODE		0x0	/* R/W: Mode register */
 #define FSI_SISC		0x8	/* R/W: Interrupt condition */
 #define FSI_SSTAT		0x14	/* R  : Slave status */
+#define FSI_SI1M		0x18	/* R/W: IRQ mask */
+#define FSI_SI1S		0x1C	/* R  : IRQ status */
 #define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
 
 /*
@@ -342,6 +349,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 	uint32_t engine_addr;
 	uint32_t conf;
 	int rc, i;
+	uint8_t si1s_bit = 1;
 
 	/*
 	 * scan engines
@@ -396,6 +404,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			dev->unit = i;
 			dev->addr = engine_addr;
 			dev->size = slots * engine_page_size;
+			dev->si1s_bit = si1s_bit++;
 
 			dev_info(&slave->dev,
 			"engine[%i]: type %x, version %x, addr %x size %x\n",
@@ -761,6 +770,90 @@ static void fsi_master_unscan(struct fsi_master *master)
 	device_for_each_child(&master->dev, NULL, __fsi_master_remove_slave);
 }
 
+static int __fsi_dev_irq(struct device *dev, void *data)
+{
+	uint32_t *si1s = data;
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+
+	if (!fsi_dev || !si1s) {
+		dev_dbg(dev, "Invalid input: %p %p\n", fsi_dev, si1s);
+		return -EINVAL;
+	}
+
+	if (*si1s & (0x80000000 >> fsi_dev->si1s_bit) &&
+					fsi_dev->irq_handler) {
+		fsi_dev->irq_handler(0, &fsi_dev->dev);
+		return 1;
+	}
+
+	return 0;
+}
+
+static int __fsi_slave_irq(struct device *dev, void *data)
+{
+	return device_for_each_child(dev, data, __fsi_dev_irq);
+}
+
+static void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
+{
+	device_for_each_child(&master->dev, &si1s, __fsi_slave_irq);
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
+				&si1s, sizeof(uint32_t));
+		if (rc)
+			goto done;
+
+		if (si1s & master->ipoll)
+			fsi_master_irq(master, 0, si1s);
+done:
+		elapsed = jiffies = previous_jiffies;
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
+/*
+ * TODO: move this to master->start_ipoll() - each master may have its
+ * own way of doing this
+ */
+int fsi_master_start_ipoll(struct fsi_master *master)
+{
+	if (master_ipoll) {
+		dev_err(&master->dev, "Already polling for irqs\n");
+		return -EALREADY;
+	}
+	master_ipoll = kthread_create(fsi_master_ipoll, master,
+					"fsi_master_ipoll");
+	if (IS_ERR(master_ipoll)) {
+		dev_err(&master->dev, "Coudn't create ipoll thread rc:%d\n",
+			(int)PTR_ERR(master_ipoll));
+		return PTR_ERR(master_ipoll);
+	}
+	wake_up_process(master_ipoll);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsi_master_start_ipoll);
+
 static ssize_t master_rescan_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t count)
 {
@@ -768,6 +861,7 @@ static ssize_t master_rescan_store(struct device *dev,
 
 	fsi_master_unscan(master);
 	fsi_master_scan(master);
+	fsi_master_start_ipoll(master);
 
 	return count;
 }
@@ -829,6 +923,11 @@ void fsi_master_unregister(struct fsi_master *master)
 		master->idx = -1;
 	}
 
+	if (master_ipoll) {
+		kthread_stop(master_ipoll);
+		master_ipoll = NULL;
+	}
+
 	device_unregister(&master->dev);
 }
 EXPORT_SYMBOL_GPL(fsi_master_unregister);
@@ -872,6 +971,17 @@ void fsi_driver_unregister(struct fsi_driver *fsi_drv)
 }
 EXPORT_SYMBOL_GPL(fsi_driver_unregister);
 
+int fsi_enable_irq(struct fsi_device *dev)
+{
+	return 0;
+}
+EXPORT_SYMBOL(fsi_enable_irq);
+
+void fsi_disable_irq(struct fsi_device *dev)
+{
+}
+EXPORT_SYMBOL(fsi_disable_irq);
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index fd39924..668ab0c 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -26,6 +26,7 @@ struct fsi_master {
 	int		idx;
 	int		n_links;
 	int		flags;
+	uint32_t	ipoll;
 	int		(*read)(struct fsi_master *, int link, uint8_t id,
 				uint32_t addr, void *val, size_t size);
 	int		(*write)(struct fsi_master *, int link, uint8_t id,
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 141fd38..bb5c6c6 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -22,9 +22,11 @@ struct fsi_device {
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
@@ -80,4 +82,7 @@ extern int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 
 extern struct bus_type fsi_bus_type;
 
+extern int fsi_enable_irq(struct fsi_device *dev);
+extern void fsi_disable_irq(struct fsi_device *dev);
+
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
