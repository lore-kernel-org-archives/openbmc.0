Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTyGW0Y3xzDqGh
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 15:06:42 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1O43ibM081965
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 23:06:40 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28tb3j5eh2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 23:06:39 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 23 Feb 2017 21:06:38 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Feb 2017 21:06:36 -0700
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 5E0173E40030;
 Thu, 23 Feb 2017 21:06:36 -0700 (MST)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1O46a7q42991820; Fri, 24 Feb 2017 04:06:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ABBC124037;
 Thu, 23 Feb 2017 23:06:34 -0500 (EST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.209.80])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 2C14A124035;
 Thu, 23 Feb 2017 23:06:30 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v4] drivers/fsi: Add hub master support
Date: Thu, 23 Feb 2017 22:06:26 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022404-0024-0000-0000-000015FD7994
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006672; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826274; UDB=6.00404667; IPR=6.00603725; 
 BA=6.00005168; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014420; XFM=3.00000011;
 UTC=2017-02-24 04:06:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022404-0025-0000-0000-000049036362
Message-Id: <20170224040626.99777-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-24_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702240041
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
X-List-Received-Date: Fri, 24 Feb 2017 04:06:43 -0000

Scan for links off of the mFSI master on CFAM. Add any devices
detected to the existing list of FSI devices and notify any
clients.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

---
v4 - set a common 10 milliseconds for wait after link enable
     and create a define for it

   - Remove hub class creation, allocate hub master device
     struct with kzalloc

   - Define hub master device release function

   - Add further details in comments about how hubs differ from
     cascaded masters.

   - Add more details in comments regarding hub link break
     address hardware workarounds.

   - Remove char* cast in device_create()

v3 - Squash all patches in series related to hub master into one
     patch.

   - fsi_slave_scan  refactor if/else to switch on type

   - Add device for hub master dev field

   - Update method of setting master->n_links for hub

v2 - Refactor hub master structures, hub no longer a slave engine

   - Add description of what a hub master is and how it differs
     from a cascaded master
---
 drivers/fsi/fsi-core.c   | 225 +++++++++++++++++++++++++++++++++++++++++++++--
 drivers/fsi/fsi-master.h |  57 ++++++++++++
 2 files changed, 277 insertions(+), 5 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e13774f..8409c00 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -20,12 +20,14 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
+#include <linux/delay.h>
 
 #include "fsi-master.h"
 
 #define DEBUG
 
 #define FSI_N_SLAVES	4
+#define FSI_BREAK	0xc0de0000
 
 #define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
 #define FSI_SLAVE_CONF_SLOTS_MASK	0x00ff0000
@@ -43,6 +45,14 @@
 
 #define FSI_IPOLL_PERIOD		msecs_to_jiffies(fsi_ipoll_period_ms)
 
+#define	FSI_ENGID_HUB_MASTER		0x1c
+#define	FSI_ENGID_HUB_LINK		0x1d
+#define	FSI_HUB_LINK_OFFSET		0x80000
+#define	FSI_MASTER_HUB_LINK_SIZE	0x80000
+#define	FSI_HUB_MASTER_MAX_LINKS	8
+
+#define	FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
+
 static const int engine_page_size = 0x400;
 static struct task_struct *master_ipoll;
 static unsigned int fsi_ipoll_period_ms = 100;
@@ -58,6 +68,17 @@ struct fsi_slave {
 	uint8_t			id;
 };
 
+struct fsi_master_hub {
+	struct fsi_master	master;
+	struct fsi_slave	*slave;
+	struct device		dev;
+	uint32_t		control_regs;	/* slave-relative addr regs */
+	uint32_t		base;		/* slave-relative addr of */
+						/* master address space */
+};
+
+#define to_fsi_hub(d) container_of(d, struct fsi_master_hub, dev)
+#define to_fsi_master_hub(d) container_of(d, struct fsi_master_hub, master)
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
 static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
@@ -197,12 +218,169 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			slave->id, addr, val, size);
 }
 
+/*
+ * FSI hub master support
+ *
+ * A hub master increases the number of potential target devices that the
+ * primary FSI master can access.  For each link a primary master supports
+ * each of those links can in turn be chained to a hub master with multiple
+ * hub links of its own.  Hubs differ from cascaded masters (cMFSI) in the
+ * total addressable range per link -hubs having address ranges that are much
+ * larger.  Hub masters also contain the registers that describe them
+ * whereas cascaded masters are described by their parent.
+ */
+int hub_master_read(struct fsi_master *master, int linkno, uint8_t slave,
+			uint32_t addr, void *val, size_t size)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+
+	addr += (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
+	return fsi_slave_read(hub->slave, addr, val, size);
+}
+
+int hub_master_write(struct fsi_master *master, int linkno, uint8_t slave,
+			uint32_t addr, const void *val, size_t size)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+
+	addr += (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
+	return fsi_slave_write(hub->slave, addr, val, size);
+}
+
+int hub_master_break(struct fsi_master *master, int linkno)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	uint32_t command;
+	uint32_t break_offset = 0x4; /* hw workaround: hub links require a */
+				     /* break to offset 4 instead of the */
+				     /* non hub 0 offset. */
+	uint32_t addr;
+
+	command = FSI_BREAK;
+	addr = (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
+	return fsi_slave_write(hub->slave, addr + break_offset, &command,
+			sizeof(command));
+}
+
+int hub_master_link_enable(struct fsi_master *master, int linkno)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	uint32_t menp = L_MSB_MASK(linkno);
+	int rc;
+
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MSENP0, &menp,
+				sizeof(menp));
+
+	/*
+	 * Wait for hw to finish enable - there is latency in logic setup
+	 * before link operations like break, etc can be done
+	 */
+	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
+
+	return rc;
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
+	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
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
+static void hub_master_release(struct device *dev)
+{
+	struct fsi_master_hub *hub = to_fsi_hub(dev);
+
+	kfree(hub);
+}
+
 static int fsi_slave_scan(struct fsi_slave *slave)
 {
 	uint32_t engine_addr;
 	uint32_t conf;
 	int rc, i;
 	uint8_t si1s_bit = 1;
+	uint8_t conf_link_count = 0;
+	struct fsi_master_hub *hub;
 
 	INIT_LIST_HEAD(&slave->my_engines);
 
@@ -242,11 +420,43 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 		type = (conf & FSI_SLAVE_CONF_TYPE_MASK)
 			>> FSI_SLAVE_CONF_TYPE_SHIFT;
 
-		/*
-		 * Unused address areas are marked by a zero type value; this
-		 * skips the defined address areas
-		 */
-		if (type != 0 && slots != 0) {
+		switch (type) {
+		case 0:
+			/*
+			 * Unused address areas are marked by a zero type
+			 * value; this skips the defined address areas
+			 */
+			break;
+
+		case FSI_ENGID_HUB_MASTER:
+			hub = kzalloc(sizeof(*hub), GFP_KERNEL);
+			if (!hub)
+				return -ENOMEM;
+
+			device_initialize(&hub->dev);
+			dev_set_name(&hub->dev, "hub@%02x", hub->master.idx);
+			hub->dev.release = hub_master_release;
+			rc = device_add(&hub->dev);
+			if (rc)
+				return rc;
+
+			hub->master.dev = &hub->dev;
+			hub->master.dev->parent = &slave->dev;
+			hub->base = FSI_HUB_LINK_OFFSET;
+			hub->control_regs = engine_addr;
+			hub->slave = slave;
+			rc = hub_master_init(hub);
+
+			break;
+
+		case FSI_ENGID_HUB_LINK:
+			conf_link_count++;
+
+			break;
+
+		default:
+			if (slots == 0)
+				break;
 
 			/* create device */
 			dev = fsi_create_device(slave);
@@ -286,6 +496,11 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			break;
 	}
 
+	if (hub) {
+		hub->master.n_links = conf_link_count / 2;
+		fsi_master_register(&hub->master);
+	}
+
 	return 0;
 }
 
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
