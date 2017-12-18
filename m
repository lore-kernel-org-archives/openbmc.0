Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0W0B4lzkzDsRN
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 17:12:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2017 22:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,420,1508828400"; 
   d="scan'208";a="3231857"
Received: from build0101.sh.intel.com ([10.239.164.138])
 by fmsmga007.fm.intel.com with ESMTP; 17 Dec 2017 22:12:06 -0800
From: Haiyue Wang <haiyue.wang@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Haiyue Wang <haiyue.wang@linux.intel.com>
Subject: [PATCH linux dev-4.10] eSPI: add Aspeed AST2500 eSPI driver to boot a
 host with PCH runs on eSPI
Date: Mon, 18 Dec 2017 14:12:22 +0800
Message-Id: <1513577542-8693-1-git-send-email-haiyue.wang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Dec 2017 06:12:11 -0000

The PCH (master) provides the eSPI to support connection of a BMC (slave)
to the platform.

The LPC and eSPI interfaces are mutually exclusive. Both use the same
pins, but on power-up, a HW strap determines if the eSPI or the LPC bus is
operational. Once selected, it’s not possible to change to the other
interface.

eSPI Channels and Supported Transactions:
+------+---------------------+----------------------+--------------------+
| CH # | Channel             | Posted Cycles        | Non-Posted Cycles  |
+------+---------------------+----------------------+--------------------+
|  0   | Peripheral          | Memory Write,        | Memory Read,       |
|      |                     | Completions          | I/O Read/Write     |
+------+---------------------+----------------------+--------------------+
|  1   | Virtual Wire        | Virtual Wire GET/PUT | N/A                |
+------+---------------------+----------------------+--------------------+
|  2   | Out-of-Band Message | SMBus Packet GET/PUT | N/A                |
+------+---------------------+----------------------+--------------------+
|  3   | Flash Access        | N/A                  | Flash Read, Write, |
|      |                     |                      | Erase              |
+------+---------------------+----------------------+--------------------+
|  N/A | General             | Register Accesses    | N/A                |
+------+---------------------+----------------------+--------------------+

Virtual Wire Channel (Channel 1) Overview
The Virtual Wire channel uses a standard message format to communicate
several types of signals between the components on the platform.
- Sideband and GPIO Pins: System events and other dedicated signals
  between the PCH and eSPI slave. These signals are tunneled between the
  two components over eSPI.
- Serial IRQ Interrupts: Interrupts are tunneled from the eSPI slave to
  the PCH. Both edge and triggered interrupts are supported.

[This patch add the basic function to boot a host whose PCH runs on eSPI]

When PCH runs on eSPI mode, from BMC side, the following VW messages are
done in firmware:
1. SLAVE_BOOT_LOAD_DONE / SLAVE_BOOT_LOAD_STATUS
2. SUS_ACK
3. OOB_RESET_ACK
4. HOST_RESET_ACK

+----------------------+---------+---------------------------------------+
|Virtual Wire          |PCH Pin  |Comments                               |
|                      |Direction|                                       |
+----------------------+---------+---------------------------------------+
|SUS_WARN#             |Output   |PCH pin is a GPIO when eSPI is enabled.|
|                      |         |eSPI controller receives as VW message.|
+----------------------+---------+---------------------------------------+
|SUS_ACK#              |Input    |PCH pin is a GPIO when eSPI is enabled.|
|                      |         |eSPI controller receives as VW message.|
+----------------------+---------+---------------------------------------+
|SLAVE_BOOT_LOAD_DONE  |Input    |Sent when the BMC has completed its    |
|                      |         |boot process as an indication to       |
|                      |         |eSPI-MC to continue with the G3 to S0  |
|                      |         |exit.                                  |
|                      |         |The eSPI Master waits for the assertion|
|                      |         |of this virtual wire before proceeding |
|                      |         |with the SLP_S5# deassertion.          |
|                      |         |The intent is that it is never changed |
|                      |         |except on a G3 exit - it is reset on a |
|                      |         |G3 entry.                              |
+----------------------+---------+---------------------------------------+
|SLAVE_BOOT_LOAD_STATUS|Input    |Sent upon completion of the Slave Boot |
|                      |         |Load from the attached flash. A stat of|
|                      |         |1 indicates that the boot code load was|
|                      |         |successful and that the integrity of   |
|                      |         |the image is intact.                   |
+----------------------+---------+---------------------------------------+
|HOST_RESET_WARN       |Output   |Sent from the MC just before the Host  |
|                      |         |is about to enter reset. Upon receiving|
|                      |         |, the BMC must flush and quiesce its   |
|                      |         |upstream Peripheral Channel request    |
|                      |         |queues and assert HOST_RESET_ACK VWire.|
|                      |         |The MC subsequently completes any      |
|                      |         |outstanding posted transactions or     |
|                      |         |completions and then disables the      |
|                      |         |Peripheral Channel via a write to      |
|                      |         |the Slave's Configuration Register.    |
+----------------------+---------+---------------------------------------+
|HOST_RESET_ACK        |Input    |ACK for the HOST_RESET_WARN message    |
+----------------------+---------+---------------------------------------+
|OOB_RESET_WARN        |Output   |Sent from the MC just before the OOB   |
|                      |         |processor is about to enter reset. Upon|
|                      |         |receiving, the BMC must flush and      |
|                      |         |quiesce its OOB Channel upstream       |
|                      |         |request queues and assert OOB_RESET_ACK|
|                      |         |VWire. The-MC subsequently completes   |
|                      |         |any outstanding posted transactions or |
|                      |         |completions and then disables the OOB  |
|                      |         |Channel via a write to the Slave's     |
|                      |         |Configuration Register.                |
+----------------------+---------+---------------------------------------+
|OOB_RESET_ACK         |Input    |ACK for OOB_RESET_WARN message         |
+----------------------+---------+---------------------------------------+

Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
---
 .../devicetree/bindings/misc/aspeed-espi-slave.txt |  32 +++
 drivers/misc/Kconfig                               |  11 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/aspeed-espi-slave.c                   | 300 +++++++++++++++++++++
 4 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
 create mode 100644 drivers/misc/aspeed-espi-slave.c

diff --git a/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt b/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
new file mode 100644
index 0000000..0db889b
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
@@ -0,0 +1,32 @@
+Aspeed eSPI Slave Controller
+
+Enhanced Serial Peripheral Interface (eSPI) is an interface using pins of SPI,
+but runs different protocol.
+
+Its interface supports peripheral, virtual wire, out-of-band, and flash sharing
+channels.
+
+ -- https://www.intel.com/content/dam/support/us/en/documents/software/chipset-software/327432-004_espi_base_specification_rev1.0.pdf
+    Enhanced Serial Peripheral Interface (eSPI)
+    Interface Base Specification (for Client and Server Platforms)
+    January 2016
+    Revision 1.0
+
+Required properties:
+ - compatible: must be one of:
+	- "aspeed,ast2500-espi-slave"
+
+ - reg: physical base address of the controller and length of memory mapped
+   region
+
+ - interrupts: interrupt generated by the controller
+
+Example:
+
+    espi: espi@1e6ee000 {
+        compatible = "aspeed,ast2500-espi-slave";
+        reg = <0x1e6ee000 0x100>;
+        interrupts = <23>;
+        status = "disabled";
+};
+
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 02ffdd1..8c0d791 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -766,6 +766,17 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.
 
+config ASPEED_ESPI_SLAVE
+	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP
+	tristate "Aspeed ast2500 eSPI slave device"
+	---help---
+	  This allows host to access Baseboard Management Controller (BMC) over the
+	  Enhanced Serial Peripheral Interface (eSPI) bus, which replaces the Low Pin
+	  Count (LPC) bus.
+
+	  Its interface supports peripheral, virtual wire, out-of-band, and flash
+	  sharing channels.
+
 config ASPEED_LPC_CTRL
 	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
 	tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index ab8af76..a648599 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_ASPEED_ESPI_SLAVE) += aspeed-espi-slave.o
 obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
 
diff --git a/drivers/misc/aspeed-espi-slave.c b/drivers/misc/aspeed-espi-slave.c
new file mode 100644
index 0000000..18e5fad
--- /dev/null
+++ b/drivers/misc/aspeed-espi-slave.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2012-2020, ASPEED Technology Inc.
+// Copyright (c) 2015-2017, Intel Corporation.
+
+#include <linux/atomic.h>
+#include <linux/slab.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+#include <linux/sched.h>
+#include <linux/timer.h>
+
+
+#define DEVICE_NAME     "aspeed-espi-slave"
+
+/***************************** eSPI Register ****************************/
+#define ESPI_CTRL                 0x00
+#define      ESPI_CTRL_SW_RESET             GENMASK(31, 24)
+#define      ESPI_CTRL_OOB_CHRDY            BIT(4)
+#define ESPI_ISR                  0x08
+#define      ESPI_ISR_HW_RESET              BIT(31)
+#define      ESPI_ISR_VW_SYS_EVT1           BIT(22)
+#define      ESPI_ISR_VW_SYS_EVT            BIT(8)
+#define ESPI_IER                  0x0C
+
+#define ESPI_SYS_IER              0x94
+#define ESPI_SYS_EVENT            0x98
+#define ESPI_SYS_INT_T0           0x110
+#define ESPI_SYS_INT_T1           0x114
+#define ESPI_SYS_INT_T2           0x118
+#define ESPI_SYS_ISR              0x11C
+#define      ESPI_SYSEVT_HOST_RST_ACK       BIT(27)
+#define      ESPI_SYSEVT_SLAVE_BOOT_STATUS  BIT(23)
+#define      ESPI_SYSEVT_SLAVE_BOOT_DONE    BIT(20)
+#define      ESPI_SYSEVT_OOB_RST_ACK        BIT(16)
+#define      ESPI_SYSEVT_HOST_RST_WARN      BIT(8)
+#define      ESPI_SYSEVT_OOB_RST_WARN       BIT(6)
+#define      ESPI_SYSEVT_PLT_RST_N          BIT(5)
+
+#define ESPI_SYS1_IER             0x100
+#define ESPI_SYS1_EVENT           0x104
+#define ESPI_SYS1_INT_T0          0x120
+#define ESPI_SYS1_INT_T1          0x124
+#define ESPI_SYS1_INT_T2          0x128
+#define ESPI_SYS1_ISR             0x12C
+#define      ESPI_SYSEVT1_SUS_ACK           BIT(20)
+#define      ESPI_SYSEVT1_SUS_WARN          BIT(0)
+
+
+struct aspeed_espi_slave_data {
+	struct regmap *map;
+	int irq;
+};
+
+static void aspeed_espi_slave_sys_event(struct aspeed_espi_slave_data *priv)
+{
+	u32 sts, evt;
+
+	if (regmap_read(priv->map, ESPI_SYS_ISR, &sts) != 0 ||
+	    regmap_read(priv->map, ESPI_SYS_EVENT, &evt) != 0)
+		return;
+
+	if (sts & ESPI_SYSEVT_HOST_RST_WARN)
+		regmap_update_bits_base(priv->map, ESPI_SYS_EVENT,
+			ESPI_SYSEVT_HOST_RST_ACK,
+			evt & ESPI_SYSEVT_HOST_RST_WARN
+				? ESPI_SYSEVT_HOST_RST_ACK : 0,
+			NULL, false, true);
+
+	if (sts & ESPI_SYSEVT_OOB_RST_WARN)
+		regmap_update_bits_base(priv->map, ESPI_SYS_EVENT,
+			ESPI_SYSEVT_OOB_RST_ACK,
+			evt & ESPI_SYSEVT_OOB_RST_WARN
+				? ESPI_SYSEVT_OOB_RST_ACK : 0,
+			NULL, false, true);
+
+	regmap_write(priv->map, ESPI_SYS_ISR, sts);
+}
+
+static void aspeed_espi_slave_sys1_event(struct aspeed_espi_slave_data *priv)
+{
+	u32 sts;
+
+	if (regmap_read(priv->map, ESPI_SYS1_ISR, &sts) != 0)
+		return;
+
+	if (sts & ESPI_SYSEVT1_SUS_WARN)
+		regmap_update_bits_base(priv->map, ESPI_SYS1_EVENT,
+			ESPI_SYSEVT1_SUS_ACK, ESPI_SYSEVT1_SUS_ACK,
+			NULL, false, true);
+
+	regmap_write(priv->map, ESPI_SYS1_ISR, sts);
+}
+
+static irqreturn_t aspeed_espi_slave_irq(int irq, void *arg)
+{
+	u32 sts;
+	struct aspeed_espi_slave_data *priv = arg;
+
+	if (regmap_read(priv->map, ESPI_ISR, &sts) != 0)
+		return IRQ_NONE;
+
+	if (sts & ESPI_ISR_HW_RESET) {
+		regmap_update_bits_base(priv->map, ESPI_CTRL,
+				ESPI_CTRL_SW_RESET, 0,
+				NULL, false, true);
+		regmap_update_bits_base(priv->map, ESPI_CTRL,
+				ESPI_CTRL_SW_RESET, ESPI_CTRL_SW_RESET,
+				NULL, false, true);
+
+		regmap_update_bits_base(priv->map, ESPI_SYS_EVENT,
+				ESPI_SYSEVT_SLAVE_BOOT_STATUS |
+					ESPI_SYSEVT_SLAVE_BOOT_DONE,
+				ESPI_SYSEVT_SLAVE_BOOT_STATUS |
+					ESPI_SYSEVT_SLAVE_BOOT_DONE,
+				NULL, false, true);
+	}
+
+	if (sts & ESPI_ISR_VW_SYS_EVT)
+		aspeed_espi_slave_sys_event(priv);
+
+	if (sts & ESPI_ISR_VW_SYS_EVT1)
+		aspeed_espi_slave_sys1_event(priv);
+
+	regmap_write(priv->map, ESPI_ISR, sts);
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_espi_slave_config_irq(struct aspeed_espi_slave_data *priv,
+			struct platform_device *pdev)
+{
+	int rc;
+	struct device *dev = &pdev->dev;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (!priv->irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, priv->irq, aspeed_espi_slave_irq,
+			IRQF_SHARED, DEVICE_NAME, priv);
+	if (rc < 0) {
+		dev_warn(dev, "Unable to request IRQ %d\n", priv->irq);
+		priv->irq = 0;
+		return rc;
+	}
+
+	regmap_update_bits(priv->map, ESPI_CTRL,
+			ESPI_CTRL_OOB_CHRDY, ESPI_CTRL_OOB_CHRDY);
+
+	/* Setup Interrupt Type/Enable of System Event from Master
+	 *				   T2 T1 T0
+	 *  1). HOST_RST_WARN : Dual Edge   1  0  0
+	 *  2). OOB_RST_WARN  : Dual Edge   1  0  0
+	 *  3). PLTRST_N      : Dual Edge   1  0  0
+	 */
+#define ESPI_SYS_INT_T0_SET \
+			0x00000000
+#define ESPI_SYS_INT_T1_SET \
+			0x00000000
+#define ESPI_SYS_INT_T2_SET ( \
+			ESPI_SYSEVT_HOST_RST_WARN | \
+			ESPI_SYSEVT_OOB_RST_WARN  | \
+			ESPI_SYSEVT_PLT_RST_N)
+#define ESPI_SYS_INT_SET ( \
+			ESPI_SYSEVT_HOST_RST_WARN | \
+			ESPI_SYSEVT_OOB_RST_WARN  | \
+			ESPI_SYSEVT_PLT_RST_N)
+	regmap_write(priv->map, ESPI_SYS_INT_T0, ESPI_SYS_INT_T0_SET);
+	regmap_write(priv->map, ESPI_SYS_INT_T1, ESPI_SYS_INT_T1_SET);
+	regmap_write(priv->map, ESPI_SYS_INT_T2, ESPI_SYS_INT_T2_SET);
+	regmap_write(priv->map, ESPI_SYS_IER,    ESPI_SYS_INT_SET);
+
+	/* Setup Interrupt Type/Enable of System Event 1 from Master
+	 *				   T2 T1 T0
+	 *  1). SUS_WARN    : Rising Edge   0  0  1
+	 */
+	regmap_write(priv->map, ESPI_SYS1_INT_T0, ESPI_SYSEVT1_SUS_WARN);
+	regmap_write(priv->map,	ESPI_SYS1_INT_T1, 0x00000000);
+	regmap_write(priv->map,	ESPI_SYS1_INT_T2, 0x00000000);
+	regmap_write(priv->map, ESPI_SYS1_IER,    ESPI_SYSEVT1_SUS_WARN);
+
+	regmap_write(priv->map, ESPI_IER, 0xFFFFFFFF);
+
+	return rc;
+}
+
+static void aspeed_espi_slave_boot_ack(struct aspeed_espi_slave_data *priv)
+{
+	u32 evt;
+
+	if (regmap_read(priv->map, ESPI_SYS_EVENT, &evt) == 0 &&
+	    (evt & ESPI_SYSEVT_SLAVE_BOOT_STATUS) == 0)
+		regmap_write(priv->map, ESPI_SYS_EVENT,
+			evt |
+			ESPI_SYSEVT_SLAVE_BOOT_STATUS |
+			ESPI_SYSEVT_SLAVE_BOOT_DONE);
+
+	if (regmap_read(priv->map, ESPI_SYS1_EVENT, &evt) == 0 &&
+	    (evt & ESPI_SYSEVT1_SUS_WARN) != 0)
+		regmap_write(priv->map, ESPI_SYS1_EVENT,
+			evt | ESPI_SYSEVT1_SUS_ACK);
+}
+
+
+static int regmap_espi_slave_reg_write(void *context, unsigned int reg,
+					     unsigned int val)
+{
+	void __iomem *regs = (void __iomem *)context;
+
+	writel(val, regs + reg);
+	return 0;
+}
+
+static int regmap_espi_slave_reg_read(void *context, unsigned int reg,
+					    unsigned int *val)
+{
+	void __iomem *regs = (void __iomem *)context;
+
+	*val = readl(regs + reg);
+	return 0;
+}
+
+static const struct regmap_config aspeed_espi_slave_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_write = regmap_espi_slave_reg_write,
+	.reg_read = regmap_espi_slave_reg_read,
+	.fast_io = true,
+};
+
+static int aspeed_espi_slave_probe(struct platform_device *pdev)
+{
+	struct aspeed_espi_slave_data *priv;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *regs;
+	int rc;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENOENT;
+	regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->map = devm_regmap_init(dev, NULL, (__force void *)regs,
+			&aspeed_espi_slave_regmap_config);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	rc = aspeed_espi_slave_config_irq(priv, pdev);
+	if (rc) {
+		dev_err(dev, "Failed to configure IRQ\n");
+		return rc;
+	}
+
+	aspeed_espi_slave_boot_ack(priv);
+
+	platform_set_drvdata(pdev, priv);
+
+	dev_info(dev, "eSPI slave is running!\n");
+
+	return 0;
+}
+
+static int aspeed_espi_slave_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id of_espi_slave_match_table[] = {
+	{ .compatible = "aspeed,ast2500-espi-slave" },
+	{},
+};
+
+static struct platform_driver aspeed_espi_slave_driver = {
+	.driver = {
+		.name           = DEVICE_NAME,
+		.of_match_table = of_espi_slave_match_table,
+	},
+	.probe = aspeed_espi_slave_probe,
+	.remove = aspeed_espi_slave_remove,
+};
+
+module_platform_driver(aspeed_espi_slave_driver);
+
+MODULE_DEVICE_TABLE(of, of_espi_slave_match_table);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_DESCRIPTION("Linux device interface to the eSPI slave");
-- 
2.7.4
