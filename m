Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ1c4cxTzDqCc
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:50:44 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LLnEWU119307
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:42 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28rshfu9mw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:41 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 14:50:41 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 14:50:37 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 6DD241FF001F;
 Tue, 21 Feb 2017 14:50:14 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLobdO10551628; Tue, 21 Feb 2017 14:50:37 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E16F56A04A;
 Tue, 21 Feb 2017 14:50:36 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id A82CE6A042;
 Tue, 21 Feb 2017 14:50:36 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 2/7] drivers/fsi: Initialize hub master
Date: Tue, 21 Feb 2017 15:50:27 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-0020-0000-0000-00000B6FA8E0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006659; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825191; UDB=6.00404016; IPR=6.00602646; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:50:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-0021-0000-0000-00005A4E2161
Message-Id: <20170221215032.79282-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-21_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702210201
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
X-List-Received-Date: Tue, 21 Feb 2017 21:50:45 -0000

Initialize the hub master control registers.  Set up clock delays,
error handling behavior, toggle link enables.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

---

Changes in V2:

- Add some description of what a hub master is and how it differs
  from a cascaded master.
---
 drivers/fsi/fsi-core.c   | 116 ++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/fsi/fsi-master.h |  57 +++++++++++++++++++++++
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 646bb43..4199188 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
+#include <linux/delay.h>
 
 #include "fsi-master.h"
 
@@ -216,11 +217,124 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			slave->id, addr, val, size);
 }
 
-static int hub_master_init(struct fsi_master_hub *hub)
+/*
+ * FSI hub master support
+ *
+ * A hub master increases the number of potential target devices that the
+ * primary FSI master can access.  For each link a primary master supports
+ * each of those links can in turn be chained to a hub master with multiple
+ * hub links of its own.  Hubs differ from cascaded masters (cMFSI) in the
+ * total addressable range per link -hubs having address ranges that are much
+ * larger.
+ */
+int hub_master_read(struct fsi_master *master, int linkno, uint8_t slave,
+			uint32_t addr, void *val, size_t size)
+{
+	return 0;
+}
+
+int hub_master_write(struct fsi_master *master, int linkno, uint8_t slave,
+			uint32_t addr, const void *val, size_t size)
 {
 	return 0;
 }
 
+int hub_master_break(struct fsi_master *master, int linkno)
+{
+	return 0;
+}
+
+int hub_master_link_enable(struct fsi_master *master, int linkno)
+{
+	return 0;
+}
+
+static int hub_master_init(struct fsi_master_hub *hub)
+{
+	int rc;
+	uint32_t mver;
+	struct fsi_master *master = &hub->master;
+
+	master->read = hub_master_read;
+	master->write = hub_master_write;
+	master->send_break = hub_master_break;
+	master->link_enable = hub_master_link_enable;
+
+	/* Initialize the MFSI (hub master) engine */
+	rc = fsi_slave_read(hub->slave, hub->control_regs + FSI_MVER, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	mver = FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
+			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE;
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MRESP0, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	mver = FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM;
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MECTRL, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	mver = FSI_MMODE_EIP | FSI_MMODE_ECRC | FSI_MMODE_EPC
+			| fsi_mmode_crs0(1) | fsi_mmode_crs1(1)
+			| FSI_MMODE_P8_TO_LSB;
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MMODE, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	mver = 0xffff0000;
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MDLYR, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	mver = ~0;
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MSENP0, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	/* Leave enabled long enough for master logic to set up */
+	udelay(1000);
+
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MCENP0, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	rc = fsi_slave_read(hub->slave, hub->control_regs + FSI_MAEB, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	mver = FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK;
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MRESP0, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	rc = fsi_slave_read(hub->slave, hub->control_regs + FSI_MLEVP0, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	/* Reset the master bridge */
+	mver = FSI_MRESB_RST_GEN;
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MRESB0, &mver,
+				sizeof(mver));
+	if (rc)
+		return rc;
+
+	mver = FSI_MRESB_RST_ERR;
+	return fsi_slave_write(hub->slave, hub->control_regs + FSI_MRESB0,
+				&mver, sizeof(mver));
+}
+
 static int fsi_slave_scan(struct fsi_slave *slave)
 {
 	uint32_t engine_addr;
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 3737404..4a3176b 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -19,6 +19,52 @@
 
 #include <linux/device.h>
 
+/* Control Registers */
+#define FSI_MMODE		0x0		/* R/W: mode */
+#define FSI_MDLYR		0x4		/* R/W: delay */
+#define FSI_MCRSP		0x8		/* R/W: clock rate */
+#define FSI_MENP0		0x10		/* R/W: enable */
+#define FSI_MLEVP0		0x18		/* R: plug detect */
+#define FSI_MSENP0		0x18		/* S: Set enable */
+#define FSI_MCENP0		0x20		/* C: Clear enable */
+#define FSI_MAEB		0x70		/* R: Error address */
+#define FSI_MVER		0x74		/* R: master version/type */
+#define FSI_MRESP0		0xd0		/* W: Port reset */
+#define FSI_MESRB0		0x1d0		/* R: Master error status */
+#define FSI_MRESB0		0x1d0		/* W: Reset bridge */
+#define FSI_MECTRL		0x2e0		/* W: Error control */
+
+/* MMODE: Mode control */
+#define FSI_MMODE_EIP		0x80000000	/* Enable interrupt polling */
+#define FSI_MMODE_ECRC		0x40000000	/* Enable error recovery */
+#define FSI_MMODE_EPC		0x10000000	/* Enable parity checking */
+#define FSI_MMODE_P8_TO_LSB	0x00000010	/* Timeout value LSB */
+						/* Rolf Fritz Nov 20, 2013: */
+						/*   MSB=1, LSB=0 is 0.8 ms */
+						/*   MSB=0, LSB=1 is 0.9 ms */
+#define FSI_MMODE_CRS0SHFT	18		/* Clk rate selection 0 shift */
+#define FSI_MMODE_CRS0MASK	0x3ff		/* Clk rate selection 0 mask */
+#define FSI_MMODE_CRS1SHFT	8		/* Clk rate selection 1 shift */
+#define FSI_MMODE_CRS1MASK	0x3ff		/* Clk rate selection 1 mask */
+
+/* MRESB: Reset brindge */
+#define FSI_MRESB_RST_GEN	0x80000000	/* General reset */
+#define FSI_MRESB_RST_ERR	0x40000000	/* Error Reset */
+
+/* MRESB: Reset port */
+#define FSI_MRESP_RST_ALL_MASTER 0x20000000	/* Reset all FSI masters */
+#define FSI_MRESP_RST_ALL_LINK	0x10000000	/* Reset all FSI port contr. */
+#define FSI_MRESP_RST_MCR	0x08000000	/* Reset FSI master reg. */
+#define FSI_MRESP_RST_PYE	0x04000000	/* Reset FSI parity error */
+#define FSI_MRESP_RST_ALL	0xfc000000	/* Reset any error */
+
+/* MECTRL: Error control */
+#define FSI_MECTRL_EOAE		0x8000		/* Enable machine check when */
+						/* master 0 in error */
+#define FSI_MECTRL_P8_AUTO_TERM	0x4000		/* Auto terminate */
+
+#define L_MSB_MASK(x)		(0x80000000 >> (x))
+
 struct fsi_master {
 	struct list_head my_slaves;
 	bool		slave_list;
@@ -61,4 +107,15 @@ extern int fsi_master_start_ipoll(struct fsi_master *master);
  */
 uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits);
 
+/* mmode encoders */
+static inline u32 fsi_mmode_crs0(u32 x)
+{
+	return (x & FSI_MMODE_CRS0MASK) << FSI_MMODE_CRS0SHFT;
+}
+
+static inline u32 fsi_mmode_crs1(u32 x)
+{
+	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
+}
+
 #endif /* DRIVERS_FSI_MASTER_H */
-- 
1.8.2.2
