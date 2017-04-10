Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w23DY608vzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 07:27:25 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3ALNTVH154982
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 17:27:14 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29r99u1dhs-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2017 17:27:14 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 10 Apr 2017 17:27:13 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Apr 2017 17:27:10 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3ALRDMZ44105882; Mon, 10 Apr 2017 21:27:13 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BB06124049;
 Mon, 10 Apr 2017 17:27:05 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.2.23])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id E5930124037;
 Mon, 10 Apr 2017 17:27:02 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 3/4] drivers/fsi: Scan for hub link IRQ
 sources
Date: Mon, 10 Apr 2017 16:26:50 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170410212651.65499-1-cbostic@linux.vnet.ibm.com>
References: <20170410212651.65499-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17041021-0048-0000-0000-000001548674
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006913; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00845723; UDB=6.00417077; IPR=6.00624157; 
 BA=6.00005281; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014997; XFM=3.00000013;
 UTC=2017-04-10 21:27:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041021-0049-0000-0000-00004063B2B7
Message-Id: <20170410212651.65499-4-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704100170
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
X-List-Received-Date: Mon, 10 Apr 2017 21:27:26 -0000

Look for the hub link that may have sourced the IRQ being handled.
Clear out hub link interrupting conditions that are latched in
hardware after FSI client handler has been dispatched.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 129 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 5 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 45e1171..72f3a35 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -96,6 +96,10 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 #define	FSI_SMODE		0x0	/* R/W: Mode register */
 #define FSI_SI1M		0x18	/* R/W: IRQ mask */
 #define FSI_SI1S		0x1C	/* R: IRQ status */
+#define FSI_SRSIC0		0x68	/* R/W: Remote IRQ condition 0 */
+#define FSI_SRSIC1		0x6C	/* R/W: Remote IRQ condition 1 */
+#define FSI_SRSIM0		0x70	/* R/W: Remote IRQ mask 0 */
+#define FSI_SRSIS0		0x78	/* R: Remote IRQ status 0 */
 
 /*
  * SI1S, SI1M fields
@@ -116,6 +120,13 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 #define	FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define	FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
 
+/*
+ * SRSIS, SRSIM, SRSIC fields
+ */
+#define	FSI_SRSIX_IRQ1_MASK	0x00aaaaaa	/* SI1 IRQ sources */
+#define	FSI_SRSIX_BITS_PER_LINK	8
+
+
 /* FSI endpoint-device support */
 int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
 		size_t size)
@@ -584,6 +595,21 @@ static struct bin_attribute fsi_slave_raw_attr = {
 	.write = fsi_slave_sysfs_raw_write,
 };
 
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
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
 {
@@ -649,8 +675,11 @@ static int fsi_slave_init(struct fsi_master *master,
 		dev_warn(&slave->dev, "failed to create raw attr: %d\n", rc);
 
 	list_add(&slave->list_link, &master->my_slaves);
-	fsi_slave_scan(slave);
-	return 0;
+	rc = fsi_slave_scan(slave);
+	if (rc)
+		return rc;
+
+	return fsi_slave_irq_clear(slave);
 }
 
 /* FSI master support */
@@ -783,10 +812,62 @@ static void fsi_master_unscan(struct fsi_master *master)
 	master->slave_list = false;
 }
 
+/* TODO: Add support for hub links 4-7 */
+static int next_hublink_source(struct fsi_slave *slave, uint32_t srsis)
+{
+	int index;
+
+	if (!slave)
+		return -EINVAL;
+
+	if (!(srsis & FSI_SRSIX_IRQ1_MASK)) {
+		dev_dbg(&slave->dev, "Unexpected IRQ source SRSIS:0x%08x\n",
+			srsis);
+		return -EINVAL;
+	}
+
+	/*
+	 * TODO: add a fair scheduler to ensure we don't favor lower
+	 * hublink IRQ sources over others
+	 */
+	index = __clz(srsis);
+	dev_dbg(&slave->dev, "SRSIS:0x%08x index:%d\n", srsis, index);
+	return index / FSI_SRSIX_BITS_PER_LINK;
+}
+
+static int __fsi_dev_irq(struct device *dev, void *data);
+
+static int __fsi_hub_slave_irq(struct device *dev, void *data)
+{
+	int rc;
+	struct fsi_slave *hub_slave = to_fsi_slave(dev);
+	uint32_t si1s;
+
+	if (!hub_slave) {
+		dev_dbg(dev, "Could not find hub slave\n");
+		return -ENODEV;
+	}
+
+	rc = fsi_slave_read(hub_slave, FSI_SLAVE_BASE + FSI_SI1S, &si1s,
+			sizeof(si1s));
+	if (rc) {
+		dev_dbg(dev, "Fail on read of hub slave si1s\n");
+		return rc;
+	}
+
+	if (!si1s)
+		return 0;
+
+	return device_for_each_child(dev, &si1s, __fsi_dev_irq);
+}
+
 static int __fsi_dev_irq(struct device *dev, void *data)
 {
-	uint32_t *si1s = data;
+	uint32_t *si1s = data, srsis;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct fsi_slave *slave;
+	struct fsi_master_hub *hub;
+	int rc, hublink;
 
 	if (!fsi_dev || !si1s) {
 		dev_dbg(dev, "Invalid input: %p %p\n", fsi_dev, si1s);
@@ -803,9 +884,47 @@ static int __fsi_dev_irq(struct device *dev, void *data)
 		return 0;
 	}
 
-	/* TODO: handle hub sourced IRQ */
+	hub = dev_get_drvdata(dev);
+	if (!hub) {
+		dev_dbg(dev, "Not a hub device\n");
+		return 0;
+	}
 
-	return 0;
+	/* Scan the hub links for the source of IRQ */
+	slave = to_fsi_slave(dev->parent);
+	if (!slave) {
+		dev_dbg(dev, "Could not retrieve device's slave\n");
+		return -ENODEV;
+	}
+
+	rc = fsi_slave_read(slave, FSI_SLAVE_BASE + FSI_SRSIS0, &srsis,
+			sizeof(srsis));
+	if (rc) {
+		dev_dbg(&slave->dev, "Failed to read SRSIS0\n");
+		return rc;
+	}
+	if (srsis) {
+		hublink = next_hublink_source(slave, srsis);
+
+		if (!hub->master.dev)
+			return 0;
+
+		device_for_each_child(dev, &hublink, __fsi_hub_slave_irq);
+
+		/* Clear out the interrupting condition */
+		srsis = 0xff000000 >> (hublink * FSI_SRSIX_BITS_PER_LINK);
+		rc =  fsi_slave_write(slave, FSI_SLAVE_BASE + FSI_SRSIC0,
+					&srsis, sizeof(srsis));
+		if (rc) {
+			dev_dbg(&slave->dev, "Failed to clear out SRSIC\n");
+			return rc;
+		}
+	} else {
+		dev_dbg(&slave->dev, "SI1S HUB src but no SRSIS0 bits!\n");
+		return -EINVAL;
+	}
+
+	return 1;
 }
 
 static int __fsi_slave_irq(struct device *dev, void *data)
-- 
1.8.2.2
