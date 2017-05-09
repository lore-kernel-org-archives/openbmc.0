Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMt6q1LQqzDqKl
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 07:39:14 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v49LYRef074558
 for <openbmc@lists.ozlabs.org>; Tue, 9 May 2017 17:39:12 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ab91du0u5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 May 2017 17:39:12 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 9 May 2017 17:39:11 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 9 May 2017 17:39:10 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v49LdA3610682760; Tue, 9 May 2017 21:39:10 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE174124035;
 Tue,  9 May 2017 17:39:04 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 67613124037;
 Tue,  9 May 2017 17:39:04 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 4/7] drivers/fsi: Set IRQ masks along hub path
Date: Tue,  9 May 2017 16:38:59 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17050921-0044-0000-0000-0000032708C8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007039; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00858366; UDB=6.00425300; IPR=6.00637830; 
 BA=6.00005339; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015382; XFM=3.00000015;
 UTC=2017-05-09 21:39:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050921-0045-0000-0000-0000075513E0
Message-Id: <20170509213902.37939-5-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 09 May 2017 21:39:15 -0000

Enable/disable client engine IRQ masks including those along
the hub path to a particular engine. This includes slave
Si1M, SRSIM, and hub master MSIEP, MMODE.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c       | 145 +++++++++++++++++++++++++++++++++++++++++--
 drivers/fsi/fsi-master-hub.c |   6 +-
 2 files changed, 144 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index d29af9a..d6ea95b 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -56,6 +56,8 @@
 #define FSI_SI1S		0x1C	/* R  : IRQ status */
 #define FSI_SRSIC0		0x68	/* R/W: Hub IRQ condition 0 */
 #define FSI_SRSIC1		0x6C	/* R/W: Hub IRQ condition 1 */
+#define FSI_SRSIM0		0x70	/* R/W: Hub IRQ mask 0 */
+#define FSI_SRSIS0		0x78	/* R: Hub IRQ status 0 */
 #define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
 
 /*
@@ -72,6 +74,13 @@
 #define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
 
+#define FSI_SI1S_HUB_SRC	0x00100000
+
+/*
+ * SRSIM, SRSIS, SRSIC fields
+ */
+#define FSI_SRSIX_BITS_PER_LINK	8
+
 /*
  * LLMODE fields
  */
@@ -79,6 +88,12 @@
 
 #define FSI_SLAVE_SIZE_23b		0x800000
 
+/* Master control regs */
+#define	FSI_HUB_CONTROL		0x3400
+#define FSI_MMODE		0x0		/* R/W: mode */
+#define FSI_MSIEP0		0x30		/* R/W: Slave IRQ enable */
+#define FSI_MSIEP_BITS_PER_LINK	4
+
 static DEFINE_IDA(master_ida);
 
 struct fsi_slave {
@@ -807,7 +822,7 @@ static int __fsi_dev_irq(struct device *dev, void *data)
 		dev_dbg(dev, "IRQ handler exit: %d\n", rc);
 	}
 
-	return 0;
+	return 1;
 }
 
 static int __fsi_slave_irq(struct device *dev, void *data)
@@ -993,17 +1008,129 @@ void fsi_driver_unregister(struct fsi_driver *fsi_drv)
 }
 EXPORT_SYMBOL_GPL(fsi_driver_unregister);
 
+static uint32_t link_to_srsim_mask(int link)
+{
+	return ((0x80000000 >> 6) >> FSI_SRSIX_BITS_PER_LINK * link);
+}
+
+static uint32_t link_to_msiep_mask(int link)
+{
+	return (0xf0000000 >> (FSI_MSIEP_BITS_PER_LINK * link));
+}
+
+static int fsi_write_mask(struct fsi_master *master, struct fsi_slave *slave,
+			uint32_t offset, uint32_t mask, int on)
+{
+	int rc;
+	uint32_t val;
+
+	if (!slave && !master)
+		return -EINVAL;
+
+	if (slave)
+		rc = fsi_slave_read(slave, FSI_SLAVE_BASE + offset, &val,
+				sizeof(val));
+	else
+		rc = master->read(master, 0, 0, offset, &val, sizeof(val));
+
+	if (rc) {
+		dev_dbg(&slave->dev, "Failed to read offset %04x\n",
+			offset);
+		return rc;
+	}
+	val = be32_to_cpu(val);
+
+	if (on)
+		val |= mask;
+	else
+		val &= ~mask;
+
+	val = cpu_to_be32(val);
+	if (slave)
+		rc = fsi_slave_write(slave, FSI_SLAVE_BASE + offset, &val,
+				sizeof(val));
+	else
+		rc = master->write(master, 0, 0, offset, &val, sizeof(val));
+
+	return rc;
+}
+
+static int set_upstream_irq_masks(struct fsi_master *master,
+			struct fsi_slave *slave, int on)
+{
+	struct fsi_slave *upstream_slave;
+	struct fsi_master *upstream_master;
+	uint32_t mask, si1m;
+	int rc;
+
+	if (!master->idx)
+		return 0;
+
+	upstream_slave = to_fsi_slave(slave->master->dev.parent);
+	if (!upstream_slave) {
+		dev_dbg(&slave->dev, "No upstream slave found\n");
+		return -ENODEV;
+	}
+
+	mask = link_to_srsim_mask(slave->link);
+	rc = fsi_write_mask(NULL, upstream_slave, FSI_SRSIM0, mask, on);
+	if (rc)
+		return rc;
+
+	upstream_master = upstream_slave->master;
+	if (!upstream_master) {
+		dev_dbg(&upstream_slave->dev, "Cannot find master\n");
+		return -ENODEV;
+	}
+
+	mask = link_to_msiep_mask(slave->link);
+
+	/*
+	 * TODO: Remove these HUB control references by creating a new master
+	 * method master->write_control(msiep)
+	 */
+	rc = fsi_write_mask(upstream_master, NULL, FSI_HUB_CONTROL + FSI_MSIEP0,
+			mask, on);
+
+	mask = FSI_SI1S_HUB_SRC;
+	if (on)
+		upstream_master->ipoll |= mask;
+	else
+		upstream_master->ipoll &= mask;
+
+	if (rc)
+		return rc;
+
+	si1m = be32_to_cpu(0xd0040410);
+
+	/*
+	 * TODO: Remove the HUB control reference by creating a new master
+	 * method master->write_control(mmode)
+	 */
+	rc = upstream_master->write(upstream_master, 0, 0,
+			FSI_HUB_CONTROL + FSI_MMODE, &si1m,
+			sizeof(si1m));
+	if (rc) {
+		dev_dbg(&upstream_slave->dev,
+			"Failed to set i-poll\n");
+	}
+
+	return fsi_write_mask(NULL, upstream_slave, FSI_SI1M, mask, on);
+}
+
 int fsi_enable_irq(struct fsi_device *dev)
 {
 	int rc;
 	uint32_t si1m;
 	uint32_t bit = 0x80000000 >> dev->si1s_bit;
 	struct fsi_master *master = dev->slave->master;
+	struct fsi_slave *slave = dev->slave;
+	int link = slave->link;
 
 	if (!dev->irq_handler)
 		return -EINVAL;
 
-	rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+	rc = master->read(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
 			sizeof(uint32_t));
 	if (rc) {
 		dev_err(&master->dev, "Coudn't read si1m:%d\n", rc);
@@ -1011,7 +1138,7 @@ int fsi_enable_irq(struct fsi_device *dev)
 	}
 
 	si1m |= bit;
-	rc = master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+	rc = master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
 			sizeof(uint32_t));
 	if (rc) {
 		dev_err(&master->dev, "Coudn't write si1m:%d\n", rc);
@@ -1019,20 +1146,23 @@ int fsi_enable_irq(struct fsi_device *dev)
 	}
 
 	master->ipoll |= bit;
-	return 0;
+	return set_upstream_irq_masks(master, slave, 1);
 }
 EXPORT_SYMBOL(fsi_enable_irq);
 
+
 void fsi_disable_irq(struct fsi_device *dev)
 {
 	int rc;
 	uint32_t si1m;
 	uint32_t bits = ~(0x80000000 >> dev->si1s_bit);
 	struct fsi_master *master = dev->slave->master;
+	struct fsi_slave *slave = dev->slave;
+	int link = slave->link;
 
 	master->ipoll &= bits;
 
-	rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+	rc = master->read(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
 			sizeof(uint32_t));
 	if (rc) {
 		dev_err(&master->dev, "Couldn't read si1m:%d\n", rc);
@@ -1040,12 +1170,15 @@ void fsi_disable_irq(struct fsi_device *dev)
 	}
 
 	si1m &= bits;
-	rc = master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+	rc = master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
 		sizeof(uint32_t));
 	if (rc) {
 		dev_err(&master->dev, "Coudn't write si1m:%d\n", rc);
 		return;
 	}
+
+	if (!master->ipoll)
+		set_upstream_irq_masks(master, slave, 0);
 }
 EXPORT_SYMBOL(fsi_disable_irq);
 
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index aebaa6b..48944b6 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -59,7 +59,11 @@
 #define FSI_MMODE_CRS1SHFT	8		/* Clk rate selection 1 shift */
 #define FSI_MMODE_CRS1MASK	0x3ff		/* Clk rate selection 1 mask */
 
-/* MRESB: Reset brindge */
+/* MSIEP: Per slave interrupt enable */
+#define FSI_MSIEP0		0x30		/* R/W: Slave IRQ enable */
+#define FSI_MSIEP_BITS_PER_LINK 4
+
+/* MRESB: Reset bridge */
 #define FSI_MRESB_RST_GEN	0x80000000	/* General reset */
 #define FSI_MRESB_RST_ERR	0x40000000	/* Error Reset */
 
-- 
1.8.2.2
