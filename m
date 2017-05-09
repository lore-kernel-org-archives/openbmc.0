Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMt6s64gbzDqL0
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 07:39:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v49LYRjc064615
 for <openbmc@lists.ozlabs.org>; Tue, 9 May 2017 17:39:12 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2abcjm1fdd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 May 2017 17:39:11 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 9 May 2017 17:39:10 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 9 May 2017 17:39:09 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v49Ld8oo64684070; Tue, 9 May 2017 21:39:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FDF2124037;
 Tue,  9 May 2017 17:39:03 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id ECC50124035;
 Tue,  9 May 2017 17:39:02 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/7] drivers/fsi: Scan for hub sourced IRQ's
Date: Tue,  9 May 2017 16:38:58 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17050921-0044-0000-0000-0000032708C7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007039; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00858366; UDB=6.00425300; IPR=6.00637830; 
 BA=6.00005339; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015382; XFM=3.00000015;
 UTC=2017-05-09 21:39:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050921-0045-0000-0000-0000075513DF
Message-Id: <20170509213902.37939-4-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 09 May 2017 21:39:18 -0000

Look for the hub link that may have sourced the IRQ being handled.
Clear out hub link interrupting conditions that are latched in
hardware after FSI client handler has been dispatched.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c       | 32 ++++++++++++---
 drivers/fsi/fsi-master-hub.c | 93 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h     |  2 +
 3 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ca3021f..d29af9a 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -54,6 +54,8 @@
 #define FSI_SSTAT		0x14	/* R  : Slave status */
 #define FSI_SI1M		0x18	/* R/W: IRQ mask */
 #define FSI_SI1S		0x1C	/* R  : IRQ status */
+#define FSI_SRSIC0		0x68	/* R/W: Hub IRQ condition 0 */
+#define FSI_SRSIC1		0x6C	/* R/W: Hub IRQ condition 1 */
 #define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
 
 /*
@@ -573,6 +575,21 @@ static void fsi_slave_release(struct device *dev)
 	kfree(slave);
 }
 
+static int fsi_slave_irq_clear(struct fsi_slave *slave)
+{
+	uint32_t clear = ~0;
+	int rc;
+
+	rc = fsi_slave_write(slave, FSI_SLAVE_BASE + FSI_SRSIC0, &clear,
+				sizeof(clear));
+	if (rc) {
+		dev_dbg(&slave->dev, "Failed on write to SRSIC0\n");
+		return rc;
+	}
+	return fsi_slave_write(slave, FSI_SLAVE_BASE + FSI_SRSIC1, &clear,
+				sizeof(clear));
+}
+
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
 	uint32_t chip_id, llmode;
@@ -657,8 +674,11 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	if (rc)
 		dev_warn(&slave->dev, "failed to create term attr: %d\n", rc);
 
-	fsi_slave_scan(slave);
-	return 0;
+	rc = fsi_slave_scan(slave);
+	if (rc)
+		return rc;
+
+	return fsi_slave_irq_clear(slave);
 }
 
 /* FSI master support */
@@ -774,6 +794,7 @@ static int __fsi_dev_irq(struct device *dev, void *data)
 {
 	uint32_t *si1s = data;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	int rc;
 
 	if (!fsi_dev || !si1s) {
 		dev_dbg(dev, "Invalid input: %p %p\n", fsi_dev, si1s);
@@ -782,8 +803,8 @@ static int __fsi_dev_irq(struct device *dev, void *data)
 
 	if (*si1s & (0x80000000 >> fsi_dev->si1s_bit) &&
 					fsi_dev->irq_handler) {
-		fsi_dev->irq_handler(0, &fsi_dev->dev);
-		return 1;
+		rc = fsi_dev->irq_handler(0, &fsi_dev->dev);
+		dev_dbg(dev, "IRQ handler exit: %d\n", rc);
 	}
 
 	return 0;
@@ -794,7 +815,7 @@ static int __fsi_slave_irq(struct device *dev, void *data)
 	return device_for_each_child(dev, data, __fsi_dev_irq);
 }
 
-static void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
+void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
 {
 	device_for_each_child(&master->dev, &si1s, __fsi_slave_irq);
 }
@@ -817,6 +838,7 @@ static int fsi_master_ipoll(void *data)
 		if (rc)
 			goto done;
 
+		si1s = be32_to_cpu(si1s);
 		if (si1s & master->ipoll)
 			fsi_master_irq(master, 0, si1s);
 done:
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 133b9bf..aebaa6b 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -20,6 +20,18 @@
 
 #include "fsi-master.h"
 
+/* Upstream Slave Hub Related Registers */
+#define FSI_SLAVE_BASE		0x800
+#define FSI_SI1S		0x1C		/* R:   IRQ status */
+#define FSI_SRSIC0		0x68		/* R/W: Hub IRQ condition 0 */
+#define FSI_SRSIC1		0x6C		/* R/W: Hub IRQ condition 1 */
+#define FSI_SRSIM0		0x70		/* R/W: Hub IRQ mask 0 */
+#define FSI_SRSIS0		0x78		/* R: Hub IRQ status 0 */
+
+/* SRSIS / SRSIM / SRSIC fields */
+#define FSI_SRSIX_IRQ1_MASK	0x00aaaaaa      /* SI1 IRQ sources */
+#define FSI_SRSIX_BITS_PER_LINK	8
+
 /* Control Registers */
 #define FSI_MMODE		0x0		/* R/W: mode */
 #define FSI_MDLYR		0x4		/* R/W: delay */
@@ -64,6 +76,7 @@
 #define FSI_MECTRL_P8_AUTO_TERM	0x4000		/* Auto terminate */
 
 #define FSI_ENGID_HUB_MASTER		0x1c
+#define FSI_HUB_UPSTREAM_SI1S_BIT	11
 #define FSI_HUB_LINK_OFFSET		0x80000
 #define FSI_HUB_LINK_SIZE		0x80000
 #define FSI_HUB_MASTER_MAX_LINKS	8
@@ -168,6 +181,83 @@ static inline u32 fsi_mmode_crs1(u32 x)
 	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
 }
 
+/* TODO: Add support for hub links 4-7 */
+static int next_hub_irq_source(struct device *dev, uint32_t srsis)
+{
+	int index;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!(srsis & FSI_SRSIX_IRQ1_MASK)) {
+		dev_dbg(dev, "Unexpected IRQ source SRSIS:0x%08x\n",
+			srsis);
+		return -EINVAL;
+	}
+
+	/*
+	 * TODO: add a round robin scheduler to ensure we don't favor
+	 * lower hub link irq sources over others
+	 */
+	index = __clz(srsis);
+	dev_dbg(dev, "SRSIS:0x%08x index:%d\n", srsis, index);
+	return index / FSI_SRSIX_BITS_PER_LINK;
+}
+
+/*
+ * Interrupt handler for IRQs sourced from a hub FSI link
+ */
+int fsi_master_hub_irq_handler(int irq, void *device_data)
+{
+	int rc, hublink;
+	struct device *dev = device_data;
+	struct fsi_master_hub *hub = dev_get_drvdata(dev);
+	uint32_t srsis, si1s;
+
+	if (!hub)
+		return 1;
+
+	rc = fsi_slave_read(hub->upstream->slave, FSI_SLAVE_BASE + FSI_SRSIS0,
+			&srsis, sizeof(srsis));
+	if (rc) {
+		dev_dbg(dev, "Hub IRQ: Failed to read SRSIS\n");
+		return rc;
+	}
+	srsis = be32_to_cpu(srsis);
+	if (srsis) {
+		hublink = next_hub_irq_source(dev, srsis);
+		if (hublink < 0)
+			return 1;
+
+		if (!(&hub->master.dev))
+			return 0;
+
+		rc = hub_master_read(&hub->master, hublink, 0,
+				FSI_SLAVE_BASE + FSI_SI1S, &si1s,
+				sizeof(si1s));
+		if (rc) {
+			dev_dbg(dev,
+				"Hub IRQ: Failed to read hub slave si1s\n");
+			return 1;
+		}
+		si1s = be32_to_cpu(si1s);
+		fsi_master_irq(&hub->master, hublink, si1s);
+
+		/* Clear the interrupting condition */
+		srsis = 0xff000000 >> (hublink * FSI_SRSIX_BITS_PER_LINK);
+		srsis = be32_to_cpu(srsis);
+		rc =  fsi_slave_write(hub->upstream->slave,
+					FSI_SLAVE_BASE + FSI_SRSIC0,
+					&srsis, sizeof(srsis));
+		if (rc)
+			dev_dbg(dev,
+				"Hub IRQ: Failed on write to clear out SRSIC\n");
+	} else
+		dev_dbg(dev, "Hub IRQ: No SRSIS bits asserted\n");
+
+	return 1;
+}
+
 static int hub_master_init(struct fsi_master_hub *hub)
 {
 	struct fsi_device *dev = hub->upstream;
@@ -281,6 +371,9 @@ static int hub_master_probe(struct device *dev)
 	hub->master.send_break = hub_master_break;
 	hub->master.link_enable = hub_master_link_enable;
 
+	/* Override the parent slave's setting for si1s */
+	fsi_dev->si1s_bit = FSI_HUB_UPSTREAM_SI1S_BIT;
+	fsi_dev->irq_handler = fsi_master_hub_irq_handler;
 	dev_set_drvdata(dev, hub);
 
 	hub_master_init(hub);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 668ab0c..3334558 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -41,6 +41,8 @@ struct fsi_master {
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 
+void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s);
+
 /**
  * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
  * which is @bits in length. This may be required by master implementations
-- 
1.8.2.2
