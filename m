Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPVZ60YqyzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 09:04:45 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1GM3mc5072673
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 17:04:43 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nkwq1fvs-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 17:04:42 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 16 Feb 2017 15:04:42 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 15:04:40 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 6EB9C1FF0029;
 Thu, 16 Feb 2017 15:04:17 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1GM4T0c10879386; Thu, 16 Feb 2017 15:04:39 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C49B7136046;
 Thu, 16 Feb 2017 15:04:39 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 6E69713603C;
 Thu, 16 Feb 2017 15:04:39 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 2/5] drivers/fsi: Initialize hub master engine
Date: Thu, 16 Feb 2017 16:04:31 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021622-8235-0000-0000-00000AFC0E86
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006629; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00822949; UDB=6.00402657; IPR=6.00600396; 
 BA=6.00005146; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014312; XFM=3.00000011;
 UTC=2017-02-16 22:04:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021622-8236-0000-0000-000039AA5D4D
Message-Id: <20170216220434.79474-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160206
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
X-List-Received-Date: Thu, 16 Feb 2017 22:04:46 -0000

Define hub master probe and add definitions for general
master registers and bitfields.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c        |  44 ++++++++++--
 drivers/fsi/fsi-master-gpio.c |   7 ++
 drivers/fsi/fsi-master-hub.c  | 154 ++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h      |  64 ++++++++++++++++++
 include/linux/fsi.h           |   6 ++
 5 files changed, 269 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1e9c5a2..843389e 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -48,13 +48,19 @@ static unsigned int fsi_ipoll_period_ms = 100;
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
+static uint32_t set_smode_defaults(struct fsi_master *master);
+static int fsi_slave_set_smode(struct fsi_master *master, int link, int id);
+static int fsi_master_break(struct fsi_master *master, int link);
+
 struct fsi_slave {
 	struct list_head	list_link;	/* Master's list of slaves */
 	struct list_head	my_engines;
 	struct device		dev;
-	struct fsi_master	*master;
+	struct fsi_master	*master;	/* Upstream master */
+	struct fsi_master	*next_master;	/* Downstream master */
 	int			link;
 	uint8_t			id;
+	uint32_t		base;		/* Base address */
 };
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
@@ -112,6 +118,11 @@ int fsi_device_write(struct fsi_device *dev, uint32_t addr, const void *val,
 }
 EXPORT_SYMBOL_GPL(fsi_device_write);
 
+struct fsi_master *fsi_get_master(struct fsi_device *fsi_dev)
+{
+	return fsi_dev->slave->master;
+}
+
 int fsi_device_peek(struct fsi_device *dev, void *val)
 {
 	uint32_t addr = FSI_PEEK_BASE + ((dev->unit - 2) * sizeof(uint32_t));
@@ -192,14 +203,14 @@ static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 			void *val, size_t size)
 {
 	return slave->master->read(slave->master, slave->link,
-			slave->id, addr, val, size);
+			slave->id, slave->base + addr, val, size);
 }
 
 static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			const void *val, size_t size)
 {
 	return slave->master->write(slave->master, slave->link,
-			slave->id, addr, val, size);
+			slave->id, slave->base + addr, val, size);
 }
 
 static int fsi_slave_scan(struct fsi_slave *slave)
@@ -251,7 +262,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 		 * Unused address areas are marked by a zero type value; this
 		 * skips the defined address areas
 		 */
-		if (type != 0 && slots != 0) {
+		if (type != 0) {
 
 			/* create device */
 			dev = fsi_create_device(slave);
@@ -413,6 +424,7 @@ static int fsi_slave_init(struct fsi_master *master,
 	slave->id = slave_id;
 	slave->dev.parent = master->dev;
 	slave->dev.release = fsi_slave_release;
+	slave->base = link * master->link_size;
 
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
 	rc = device_register(&slave->dev);
@@ -519,6 +531,24 @@ static void fsi_master_unscan(struct fsi_master *master)
 	master->slave_list = false;
 }
 
+struct fsi_master *fsi_get_link_master(struct fsi_device *fsi_dev)
+{
+	if (fsi_dev && fsi_dev->slave)
+		return fsi_dev->slave->next_master;
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(fsi_get_link_master);
+
+int fsi_set_next_master(struct fsi_device *fsi_dev, struct fsi_master *master)
+{
+	if (fsi_dev && fsi_dev->slave) {
+		fsi_dev->slave->next_master = master;
+		return 0;
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(fsi_set_next_master);
+
 static void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
 {
 	struct fsi_slave *slave;
@@ -595,7 +625,7 @@ DEVICE_ATTR(fsi_ipoll_period, S_IRUGO | S_IWUSR, fsi_ipoll_period_show,
 
 int fsi_master_register(struct fsi_master *master)
 {
-	if (!master || !master->dev)
+	if (!master)
 		return -EINVAL;
 
 	master->idx = atomic_inc_return(&master_idx);
@@ -657,8 +687,10 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
 		if (id->engine_type != fsi_dev->engine_type)
 			continue;
 		if (id->version == FSI_VERSION_ANY ||
-				id->version == fsi_dev->version)
+				id->version == fsi_dev->version) {
+			fsi_dev->id = id;
 			return 1;
+		}
 	}
 
 	return 0;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 91bdbf2..92af53d 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -13,6 +13,8 @@
 
 #include "fsi-master.h"
 
+#define	FSI_MASTER_GPIO_TYPE	0x1
+
 #define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
 #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
@@ -63,6 +65,8 @@
 #define	FSI_GPIO_MSG_RESPID_SIZE	2
 #define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
 
+#define	FSI_MASTER_GPIO_LINK_SIZE	0x00800000
+
 static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);	/* lock around fsi commands */
 
 struct fsi_master_gpio {
@@ -512,11 +516,14 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	else
 		master->gpio_mux = gpio;
 
+	master->master.type = FSI_MASTER_GPIO_TYPE;
 	master->master.n_links = 1;
+	master->master.link_size = FSI_MASTER_GPIO_LINK_SIZE;
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.link_enable = fsi_master_gpio_link_enable;
+	master->master.dev = &pdev->dev;
 	platform_set_drvdata(pdev, master);
 
 	return device_create_file(&pdev->dev, &dev_attr_scan);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 19b7c77..e8c0726 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -18,14 +18,168 @@
 #include <linux/cdev.h>
 #include <linux/fs.h>
 #include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
 
 #include "fsi-master.h"
 
+#define FSI_MASTER_HUB_TYPE             0x02
+
+#define FSI_MASTER_HUB_MAX_LINKS        8
+#define FSI_MASTER_HUB_LINK_SIZE        0x00080000
+
 #define FSI_ENGID_HUB_MASTER	0x1C
 #define FSI_ENGID_HUB_LINK	0x1D
 
+int hub_master_read(struct fsi_master *master, int linkno, uint8_t slave,
+			uint32_t addr, void *val, size_t size)
+{
+	return 0;
+}
+
+int hub_master_write(struct fsi_master *master, int linkno, uint8_t slave,
+			uint32_t addr, const void *val, size_t size)
+{
+	return 0;
+}
+
+int hub_master_break(struct fsi_master *master, int linkno)
+{
+	return 0;
+}
+
+int hub_master_link_enable(struct fsi_master *master, int link)
+{
+	return 0;
+}
+
 static int hub_master_probe(struct device *dev)
 {
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct fsi_master *master;
+	int rc = 0;
+	uint32_t mver;
+
+	master = fsi_get_master(fsi_dev);
+
+	/* Two Hub masters in communication chain not allowed */
+	if (master->type == FSI_MASTER_HUB_TYPE)
+		return 0;
+
+	if (master && (master->n_links >= FSI_MASTER_HUB_MAX_LINKS * 2))
+		return 0;
+
+	if (fsi_dev->id->engine_type == FSI_ENGID_HUB_MASTER) {
+		master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
+		if (!master)
+			return -ENOMEM;
+
+		fsi_dev->master = master;
+
+		/* TODO: can use master->dev to get at the engine possibly */
+		master->engine = fsi_dev;
+		master->read = hub_master_read;
+		master->write = hub_master_write;
+		master->send_break = hub_master_break;
+		master->link_enable = hub_master_link_enable;
+		master->link_size = FSI_MASTER_HUB_LINK_SIZE;
+		rc = fsi_set_next_master(fsi_dev, master);
+
+		/* Initialize the MFSI (hub master) engine */
+		rc = fsi_device_read(master->engine, FSI_MVER, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		mver = FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
+				| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE;
+		rc = fsi_device_write(master->engine, FSI_MRESP0, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		mver = FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM;
+		rc = fsi_device_write(master->engine, FSI_MECTRL, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		mver = FSI_MMODE_EIP | FSI_MMODE_ECRC | FSI_MMODE_EPC
+			| fsi_mmode_crs0(1) | fsi_mmode_crs1(1)
+			| FSI_MMODE_P8_TO_LSB;
+		rc = fsi_device_write(master->engine, FSI_MMODE, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		mver = 0xffff0000;
+		rc = fsi_device_write(master->engine, FSI_MDLYR, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		mver = ~0;
+		rc = fsi_device_write(master->engine, FSI_MSENP0, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		/* Leave enabled long enough for master logic to set up */
+		udelay(1000);
+
+		rc = fsi_device_write(master->engine, FSI_MCENP0, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		rc = fsi_device_read(master->engine, FSI_MAEB, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		mver = FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK;
+		rc = fsi_device_write(master->engine, FSI_MRESP0, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		rc = fsi_device_read(master->engine, FSI_MLEVP0, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		/* Reset the master bridge */
+		mver = FSI_MRESB_RST_GEN;
+		rc = fsi_device_write(master->engine, FSI_MRESB0, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+
+		mver = FSI_MRESB_RST_ERR;
+		rc = fsi_device_write(master->engine, FSI_MRESB0, &mver,
+					sizeof(mver));
+		if (rc)
+			return rc;
+	} else {
+		/*
+		 * A hub link device.
+		 */
+		master = fsi_get_link_master(fsi_dev);
+		if (!master)
+			return -ENODEV;
+
+		if (master->n_links == 0) {
+			/*
+			 * CFAM Config space doesn't list correct size
+			 * for hub links, fix this.
+			 */
+			fsi_dev->size = fsi_dev->addr *
+					FSI_MASTER_HUB_MAX_LINKS;
+			master->link = fsi_dev;
+		}
+		master->n_links++;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 3737404..367b8d9 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -17,8 +17,57 @@
 #ifndef DRIVERS_FSI_MASTER_H
 #define DRIVERS_FSI_MASTER_H
 
+#include <linux/fsi.h>
 #include <linux/device.h>
 
+#define FSI_BREAK			0xc0de0000
+
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
@@ -26,6 +75,10 @@ struct fsi_master {
 	int		idx;
 	int		n_links;
 	uint32_t	ipoll;
+	struct fsi_device *engine;
+	struct fsi_device *link;
+	uint8_t		type;
+	uint32_t	link_size;
 	int		(*read)(struct fsi_master *, int link,
 				uint8_t slave, uint32_t addr,
 				void *val, size_t size);
@@ -61,4 +114,15 @@ extern int fsi_master_start_ipoll(struct fsi_master *master);
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
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index d22d0c5..9bf0b06 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -20,6 +20,8 @@
 struct fsi_device {
 	struct list_head	link;	/* for slave's list */
 	struct device		dev;
+	const struct fsi_device_id *id;
+	struct fsi_master	*master;
 	u8			engine_type;
 	u8			version;
 	u8			unit;
@@ -71,6 +73,10 @@ extern void fsi_driver_unregister(struct fsi_driver *);
 
 extern struct bus_type fsi_bus_type;
 
+extern struct fsi_master *fsi_get_link_master(struct fsi_device *dev);
+extern int fsi_set_next_master(struct fsi_device *dev,
+				struct fsi_master *master);
+extern struct fsi_master *fsi_get_master(struct fsi_device *dev);
 extern int fsi_enable_irq(struct fsi_device *dev);
 extern void fsi_disable_irq(struct fsi_device *dev);
 
-- 
1.8.2.2
