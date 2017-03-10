Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg19Z2t1yzDqYX
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 08:48:50 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2ALY5JM119527
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:37 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 293ry5ydy7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:37 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 10 Mar 2017 16:48:36 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 10 Mar 2017 16:48:34 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2ALmXsq41943162; Fri, 10 Mar 2017 21:48:33 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B959D112040;
 Fri, 10 Mar 2017 16:48:32 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 5CB6211204B;
 Fri, 10 Mar 2017 16:48:32 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 2/5] drivers: i2c: Add FSI-attached I2C master
 algorithm
Date: Fri, 10 Mar 2017 15:48:23 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17031021-0056-0000-0000-000002FF0438
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006759; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832829; UDB=6.00408758; IPR=6.00610418; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014600; XFM=3.00000013;
 UTC=2017-03-10 21:48:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031021-0057-0000-0000-00000735216C
Message-Id: <1489182506-20505-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703100168
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
X-List-Received-Date: Fri, 10 Mar 2017 21:48:50 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Initial startup code for the I2C algorithm to drive the I2C master
located on POWER CPUs over FSI bus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/Makefile             |   2 +-
 drivers/i2c/busses/Kconfig   |  11 ++
 drivers/i2c/busses/Makefile  |   1 +
 drivers/i2c/busses/i2c-fsi.c | 302 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 315 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-fsi.c

diff --git a/drivers/Makefile b/drivers/Makefile
index 26f18ac..b1db6d3 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_SERIO)		+= input/serio/
 obj-$(CONFIG_GAMEPORT)		+= input/gameport/
 obj-$(CONFIG_INPUT)		+= input/
 obj-$(CONFIG_RTC_LIB)		+= rtc/
+obj-$(CONFIG_FSI)		+= fsi/
 obj-y				+= i2c/ media/
 obj-$(CONFIG_PPS)		+= pps/
 obj-$(CONFIG_PTP_1588_CLOCK)	+= ptp/
@@ -173,4 +174,3 @@ obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_ANDROID)		+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
-obj-$(CONFIG_FSI)		+= fsi/
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 835480b..c248eded 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1210,4 +1210,15 @@ config I2C_OPAL
 	  This driver can also be built as a module. If so, the module will be
 	  called as i2c-opal.
 
+config I2C_FSI
+	tristate "FSI I2C driver"
+	depends on FSI
+	help
+	  Driver for FSI bus attached I2C masters. These are I2C masters that
+	  are connected to the system over a FSI bus, instead of the more
+	  common PCI or MMIO interface.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called as i2c-fsi.
+
 endmenu
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 49631cd..b74b585 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -119,5 +119,6 @@ obj-$(CONFIG_I2C_PCA_ISA)	+= i2c-pca-isa.o
 obj-$(CONFIG_I2C_SIBYTE)	+= i2c-sibyte.o
 obj-$(CONFIG_I2C_XGENE_SLIMPRO) += i2c-xgene-slimpro.o
 obj-$(CONFIG_SCx200_ACB)	+= scx200_acb.o
+obj-$(CONFIG_I2C_FSI)		+= i2c-fsi.o
 
 ccflags-$(CONFIG_I2C_DEBUG_BUS) := -DDEBUG
diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
new file mode 100644
index 0000000..c47cd234
--- /dev/null
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -0,0 +1,302 @@
+/*
+ * Copyright 2017 IBM Corporation
+ *
+ * Eddie James <eajames@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/fsi.h>
+#include <linux/i2c.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/sched.h>
+
+#define FSI_ENGID_I2CM		0x7
+
+/* Find left shift from first set bit in m */
+#define MASK_TO_LSH(m)          (__builtin_ffsll(m) - 1ULL)
+
+/* Extract field m from v */
+#define GETFIELD(m, v)          (((v) & (m)) >> MASK_TO_LSH(m))
+
+/* Set field m of v to val */
+#define SETFIELD(m, v, val)                             \
+	(((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
+
+#define I2C_DEFAULT_CLK_DIV	6
+#define I2C_DEFAULT_CLK		333333
+#define I2C_ADDR_PORT		0xff00
+#define I2C_BOE_FIFO_HI_LVL	4
+#define I2C_BOE_FIFO_LO_LVL	4
+
+/* i2c registers */
+#define I2C_BOE_FIFO		0x00
+#define I2C_BOE_CMD		0x04
+#define I2C_BOE_MODE		0x08
+#define I2C_BOE_WATER_MARK	0x0C
+#define I2C_BOE_INT_MASK	0x10
+#define I2C_BOE_INT_COND	0x14
+#define I2C_BOE_OR_INT_MASK	0x14
+#define I2C_BOE_INTS		0x18
+#define I2C_BOE_AND_INT_MASK	0x18
+#define I2C_BOE_STAT		0x1C
+#define I2C_BOE_RESET_I2C	0x1C
+#define I2C_BOE_ESTAT		0x20
+#define I2C_BOE_RESET_ERR	0x20
+#define I2C_BOE_RESID_LEN	0x24
+#define I2C_BOE_SET_SCL		0x24
+#define I2C_BOE_PORT_BUSY	0x28
+#define I2C_BOE_RESET_SCL	0x2C
+#define I2C_BOE_SET_SDA		0x30
+#define I2C_BOE_RESET_SDA	0x34
+
+/* cmd register */
+#define I2C_BOE_CMD_WITH_START	0x80000000
+#define I2C_BOE_CMD_WITH_ADDR	0x40000000
+#define I2C_BOE_CMD_RD_CONT	0x20000000
+#define I2C_BOE_CMD_WITH_STOP	0x10000000
+#define I2C_BOE_CMD_FORCELAUNCH	0x08000000
+#define I2C_BOE_CMD_ADDR	0x00fe0000
+#define I2C_BOE_CMD_READ	0x00010000
+#define I2C_BOE_CMD_LEN		0x0000ffff
+
+/* mode register */
+#define I2C_BOE_MODE_CLKDIV	0xffff0000
+#define I2C_BOE_MODE_PORT	0x0000fc00
+#define I2C_BOE_MODE_ENHANCED	0x00000008
+#define I2C_BOE_MODE_DIAG	0x00000004
+#define I2C_BOE_MODE_PACE_ALLOW	0x00000002
+#define I2C_BOE_MODE_WRAP	0x00000001
+
+/* watermark register */
+#define I2C_BOE_WATERMARK_HI	0x0000f000
+#define I2C_BOE_WATERMARK_LO	0x000000f0
+
+/* interrupt register */
+#define I2C_BOE_INT_INV_CMD	0x00008000
+#define I2C_BOE_INT_PARITY	0x00004000
+#define I2C_BOE_INT_BE_OVERRUN	0x00002000
+#define I2C_BOE_INT_BE_ACCESS	0x00001000
+#define I2C_BOE_INT_LOST_ARB	0x00000800
+#define I2C_BOE_INT_NACK	0x00000400
+#define I2C_BOE_INT_DAT_REQ	0x00000200
+#define I2C_BOE_INT_CMD_COMP	0x00000100
+#define I2C_BOE_INT_STOP_ERR	0x00000080
+#define I2C_BOE_INT_BUSY	0x00000040
+#define I2C_BOE_INT_IDLE	0x00000020
+
+#define I2C_BOE_INT_ENABLE	0x0000ff80
+#define I2C_BOE_INT_ERR		0x0000fcc0
+
+/* status register */
+#define I2C_BOE_STAT_INV_CMD	0x80000000
+#define I2C_BOE_STAT_PARITY	0x40000000
+#define I2C_BOE_STAT_BE_OVERRUN	0x20000000
+#define I2C_BOE_STAT_BE_ACCESS	0x10000000
+#define I2C_BOE_STAT_LOST_ARB	0x08000000
+#define I2C_BOE_STAT_NACK	0x04000000
+#define I2C_BOE_STAT_DAT_REQ	0x02000000
+#define I2C_BOE_STAT_CMD_COMP	0x01000000
+#define I2C_BOE_STAT_STOP_ERR	0x00800000
+#define I2C_BOE_STAT_MAX_PORT	0x000f0000
+#define I2C_BOE_STAT_ANY_INT	0x00008000
+#define I2C_BOE_STAT_SCL_IN	0x00000800
+#define I2C_BOE_STAT_SDA_IN	0x00000400
+#define I2C_BOE_STAT_PORT_BUSY	0x00000200
+#define I2C_BOE_STAT_SELF_BUSY	0x00000100
+#define I2C_BOE_STAT_FIFO_COUNT	0x000000ff
+
+#define I2C_BOE_STAT_ERR	0xfc800000
+#define I2C_BOE_STAT_ANY_RESP	0xff800000
+
+/* extended status register */
+#define I2C_BOE_ESTAT_FIFO_SZ	0xff000000
+#define I2C_BOE_ESTAT_SCL_IN_SY	0x00008000
+#define I2C_BOE_ESTAT_SDA_IN_SY	0x00004000
+#define I2C_BOE_ESTAT_S_SCL	0x00002000
+#define I2C_BOE_ESTAT_S_SDA	0x00001000
+#define I2C_BOE_ESTAT_M_SCL	0x00000800
+#define I2C_BOE_ESTAT_M_SDA	0x00000400
+#define I2C_BOE_ESTAT_HI_WATER	0x00000200
+#define I2C_BOE_ESTAT_LO_WATER	0x00000100
+#define I2C_BOE_ESTAT_PORT_BUSY	0x00000080
+#define I2C_BOE_ESTAT_SELF_BUSY	0x00000040
+#define I2C_BOE_ESTAT_VERSION	0x0000001f
+
+struct fsi_i2c_bus {
+	struct i2c_adapter	adapter;
+	struct fsi_device	*fsi;
+	u8			fifo_size;
+	unsigned long		clk;
+};
+
+static unsigned long fsi_i2c_get_clk_div(struct fsi_i2c_bus *i2c)
+{
+	unsigned long clk_div = I2C_DEFAULT_CLK_DIV;
+	unsigned long fsi_clk = fsi_device_get_clk_rate(i2c->fsi);
+
+	if (fsi_clk > i2c->clk)
+		clk_div = ((fsi_clk / i2c->clk) - 1) / 4;
+
+	return clk_div;
+}
+
+static int fsi_i2c_dev_init(struct fsi_i2c_bus *i2c)
+{
+	int rc;
+	unsigned long clk_div;
+	u32 mode = I2C_BOE_MODE_ENHANCED, extended_status, watermark = 0;
+	u32 interrupt = 0;
+
+	/* since we use polling, disable interrupts */
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_INT_MASK, &interrupt,
+			      sizeof(interrupt));
+	if (rc)
+		return rc;
+
+	clk_div = fsi_i2c_get_clk_div(i2c);
+	mode = SETFIELD(I2C_BOE_MODE_CLKDIV, mode, clk_div);
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_MODE, &mode, sizeof(mode));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_read(i2c->fsi, I2C_BOE_ESTAT, &extended_status,
+			     sizeof(extended_status));
+	if (rc)
+		return rc;
+
+	i2c->fifo_size = GETFIELD(I2C_BOE_ESTAT_FIFO_SZ, extended_status);
+	watermark = SETFIELD(I2C_BOE_WATERMARK_HI, watermark,
+			     i2c->fifo_size - I2C_BOE_FIFO_HI_LVL);
+	watermark = SETFIELD(I2C_BOE_WATERMARK_LO, watermark,
+			     I2C_BOE_FIFO_LO_LVL);
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_WATER_MARK, &watermark,
+			      sizeof(watermark));
+
+	return rc;
+}
+
+static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return -ENOSYS;
+}
+
+static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR;
+}
+
+static const struct i2c_algorithm fsi_i2c_algorithm = {
+	.master_xfer = fsi_i2c_xfer,
+	.functionality = fsi_i2c_functionality,
+};
+
+static const char *compatible_strings[] = {
+	"ibm,power8-i2cm",
+	"ibm,power9-i2cm",
+};
+
+static int fsi_i2c_probe(struct device *dev)
+{
+	struct fsi_i2c_bus *i2c;
+	int rc, i;
+	struct device_node *np, *node = NULL;
+	u32 addr, clk;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->fsi = to_fsi_dev(dev);
+	i2c->clk = I2C_DEFAULT_CLK;
+
+	i2c->adapter.owner = THIS_MODULE;
+	i2c->adapter.dev.parent = dev;
+	i2c->adapter.algo = &fsi_i2c_algorithm;
+	i2c->adapter.algo_data = i2c;
+	strncpy(i2c->adapter.name, "power_i2cm", sizeof(i2c->adapter.name));
+
+	/* find node that matches FSI address */
+	for (i = 0; i < ARRAY_SIZE(compatible_strings) && !node; ++i) {
+		for_each_compatible_node(np, NULL, compatible_strings[i]) {
+			rc = of_property_read_u32(np, "reg", &addr);
+			if (rc)
+				continue;
+
+			if (addr == i2c->fsi->addr) {
+				node = np;
+				break;
+			}
+		}
+	}
+
+	if (node) {
+		rc = of_property_read_u32(node, "clock-frequency", &clk);
+		if (!rc)
+			i2c->clk = clk;
+	}
+
+	rc = fsi_i2c_dev_init(i2c);
+	if (rc)
+		return rc;
+
+	/* TODO: should we add an adapter for each port?? A lot of adapters...
+	 * numbering isn't ideal either, automatically set to i2c-%d. So no
+	 * way to distinguish fsi-i2c devs.
+	 */
+	rc = i2c_add_adapter(&i2c->adapter);
+	if (rc < 0)
+		return rc;
+
+	dev_set_drvdata(dev, i2c);
+
+	return 0;
+}
+
+static int fsi_i2c_remove(struct device *dev)
+{
+	struct fsi_i2c_bus *i2c = dev_get_drvdata(dev);
+
+	i2c_del_adapter(&i2c->adapter);
+
+	return 0;
+}
+
+static const struct fsi_device_id fsi_i2c_ids[] = {
+	{ FSI_ENGID_I2CM, FSI_VERSION_ANY },
+	{ 0 }
+};
+
+static struct fsi_driver fsi_i2c_driver = {
+	.id_table = fsi_i2c_ids,
+	.drv = {
+		.name = "power_i2cm",
+		.bus = &fsi_bus_type,
+		.probe = fsi_i2c_probe,
+		.remove = fsi_i2c_remove,
+	},
+};
+
+static int fsi_i2c_init(void)
+{
+	return fsi_driver_register(&fsi_i2c_driver);
+}
+
+static void fsi_i2c_exit(void)
+{
+	fsi_driver_unregister(&fsi_i2c_driver);
+}
+
+module_init(fsi_i2c_init);
+module_exit(fsi_i2c_exit);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("FSI attached I2C master");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
