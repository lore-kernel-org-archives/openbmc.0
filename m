Return-Path: <prvs=9877b4cea=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9877b4cea=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Xkc26pt8zDqLH
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 18:33:53 +1100 (AEDT)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 01 Apr 2019 15:33:52 +0800
Received: from george-Quanta.com.com (10.243.91.252) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Apr 2019
 15:33:51 +0800
From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>, <emilyshaffer@google.com>,
 <benjaminfair@google.com>, <Avi.Fishman@nuvoton.com>,
 <ofer.eilon@nuvoton.com>, <tomer.maimon@nuvoton.com>
Subject: [PATCH dev-5.0 v2 1/2] EDAC: Add Nuvoton NPCM7xx EDAC driver
Date: Mon, 1 Apr 2019 15:30:31 +0800
Message-ID: <20190401073032.46316-1-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx05.quanta.corp (10.243.91.100) To
 mailbx05.quanta.corp (10.243.91.100)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 07:33:56 -0000

Add support for the Nuvoton NPCM7xx SoC EDAC driver

NPCM7xx ECC datasheet from nuvoton.israel-Poleg:
"Cadence DDR Controller User’s Manual For DDR3 & DDR4 Memories"

Tested: Forcing an ECC error event

Write a value to the xor_check_bits parameter that will trigger
an ECC event once that word is read

For example, to force a single-bit correctable error on bit 0 of
the user-word space shown, write 0x75 into that byte of the
xor_check_bits parameter and then assert fwc (force write check)
bit to 'b1' (mem base: 0xf0824000, xor_check_bits reg addr: 0x178)

$ devmem 0xf0824178 32 0x7501

To force a double-bit un-correctable error for the user-word space,
write 0x03 into that byte of the xor_check_bits parameter

$ devmem 0xf0824178 32 0x301

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 MAINTAINERS                 |   7 +
 drivers/edac/Kconfig        |   7 +
 drivers/edac/Makefile       |   1 +
 drivers/edac/npcm7xx_edac.c | 424 ++++++++++++++++++++++++++++++++++++
 4 files changed, 439 insertions(+)
 create mode 100644 drivers/edac/npcm7xx_edac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 997e27ab492f..b9e3ce72bcc3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5527,6 +5527,13 @@ L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/mpc85xx_edac.[ch]
 
+EDAC-NPCM7XX
+M:	George Hung <george.hung@quantatw.com>
+L:	linux-edac@vger.kernel.org
+S:	Maintained
+F:	drivers/edac/npcm7xx_edac.c
+F:	Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
+
 EDAC-PASEMI
 M:	Egor Martovetsky <egor@pasemi.com>
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index e286b5b99003..a078a1b56d94 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -475,4 +475,11 @@ config EDAC_QCOM
 	  For debugging issues having to do with stability and overall system
 	  health, you should probably say 'Y' here.
 
+config EDAC_NPCM7XX
+        tristate "Nuvoton NPCM7xx DDR Memory Controller"
+        depends on ARCH_NPCM7XX
+        help
+          Support for error detection and correction on the
+          Nuvoton NPCM7xx DDR memory controller.
+
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 716096d08ea0..c8a6b7a4215d 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -78,3 +78,4 @@ obj-$(CONFIG_EDAC_SYNOPSYS)		+= synopsys_edac.o
 obj-$(CONFIG_EDAC_XGENE)		+= xgene_edac.o
 obj-$(CONFIG_EDAC_TI)			+= ti_edac.o
 obj-$(CONFIG_EDAC_QCOM)			+= qcom_edac.o
+obj-$(CONFIG_EDAC_NPCM7XX)		+= npcm7xx_edac.o
diff --git a/drivers/edac/npcm7xx_edac.c b/drivers/edac/npcm7xx_edac.c
new file mode 100644
index 000000000000..bab25a4308be
--- /dev/null
+++ b/drivers/edac/npcm7xx_edac.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Quanta Computer lnc.
+ */
+
+#include <linux/edac.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+
+#include "edac_module.h"
+
+#define ECC_ENABLE                     BIT(24)
+#define ECC_EN_INT_MASK                0x7fffff87
+
+#define INT_STATUS_ADDR                116
+#define INT_ACK_ADDR                   117
+#define INT_MASK_ADDR                  118
+
+#define ECC_EN_ADDR                    93
+#define ECC_C_ADDR_ADDR                98
+#define ECC_C_DATA_ADDR                100
+#define ECC_C_ID_ADDR                  101
+#define ECC_C_SYND_ADDR                99
+#define ECC_U_ADDR_ADDR                95
+#define ECC_U_DATA_ADDR                97
+#define ECC_U_ID_ADDR                  101
+#define ECC_U_SYND_ADDR                96
+
+#define ECC_ERROR                      -1
+#define EDAC_MSG_SIZE                  256
+#define EDAC_MOD_NAME                  "npcm7xx-edac"
+
+struct ecc_error_signature_info {
+	u32 ecc_addr;
+	u32 ecc_data;
+	u32 ecc_id;
+	u32 ecc_synd;
+};
+
+struct npcm7xx_ecc_int_status {
+	u32 int_mask;
+	u32 int_status;
+	u32 int_ack;
+	u32 ce_cnt;
+	u32 ue_cnt;
+	struct ecc_error_signature_info ceinfo;
+	struct ecc_error_signature_info ueinfo;
+};
+
+struct npcm7xx_edac_priv {
+	void __iomem *baseaddr;
+	char message[EDAC_MSG_SIZE];
+	struct npcm7xx_ecc_int_status stat;
+};
+
+/**
+ * npcm7xx_edac_get_ecc_syndrom - Get the current ecc error info
+ * @base:	Pointer to the base address of the ddr memory controller
+ * @p:		Pointer to the Nuvoton ecc status structure
+ *
+ * Determines there is any ecc error or not
+ *
+ * Return: ECC detection status
+ */
+static int npcm7xx_edac_get_ecc_syndrom(void __iomem *base,
+					struct npcm7xx_ecc_int_status *p)
+{
+	int status = 0;
+	u32 int_status = 0;
+
+	int_status = readl(base + 4*INT_STATUS_ADDR);
+	writel(int_status, base + 4*INT_ACK_ADDR);
+	edac_dbg(3, "int_status: %#08x\n", int_status);
+
+	if ((int_status & (1 << 6)) == (1 << 6)) {
+		edac_dbg(3, "6-Mult uncorrectable detected.\n");
+		p->ue_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if ((int_status & (1 << 5)) == (1 << 5)) {
+		edac_dbg(3, "5-An uncorrectable detected\n");
+		p->ue_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if ((int_status & (1 << 4)) == (1 << 4)) {
+		edac_dbg(3, "4-mult correctable detected.\n");
+		p->ce_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if ((int_status & (1 << 3)) == (1 << 3)) {
+		edac_dbg(3, "3-A correctable detected.\n");
+		p->ce_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if (status == ECC_ERROR) {
+		u32 ecc_id;
+
+		p->ceinfo.ecc_addr = readl(base + 4*ECC_C_ADDR_ADDR);
+		p->ceinfo.ecc_data = readl(base + 4*ECC_C_DATA_ADDR);
+		p->ceinfo.ecc_synd = readl(base + 4*ECC_C_SYND_ADDR);
+
+		p->ueinfo.ecc_addr = readl(base + 4*ECC_U_ADDR_ADDR);
+		p->ueinfo.ecc_data = readl(base + 4*ECC_U_DATA_ADDR);
+		p->ueinfo.ecc_synd = readl(base + 4*ECC_U_SYND_ADDR);
+
+		/* ECC_C_ID_ADDR has same value as ECC_U_ID_ADDR */
+		ecc_id = readl(base + 4*ECC_C_ID_ADDR);
+		p->ueinfo.ecc_id = ecc_id & 0xffff;
+		p->ceinfo.ecc_id = ecc_id >> 16;
+	}
+
+	return status;
+}
+
+/**
+ * npcm7xx_edac_handle_error - Handle controller error types CE and UE
+ * @mci:	Pointer to the edac memory controller instance
+ * @p:		Pointer to the Nuvoton ecc status structure
+ *
+ * Handles the controller ECC correctable and un correctable error.
+ */
+static void npcm7xx_edac_handle_error(struct mem_ctl_info *mci,
+				    struct npcm7xx_ecc_int_status *p)
+{
+	struct npcm7xx_edac_priv *priv = mci->pvt_info;
+	u32 page, offset;
+
+	if (p->ce_cnt) {
+		snprintf(priv->message, EDAC_MSG_SIZE,
+			"DDR ECC: synd=%#08x addr=%#08x data=%#08x source_id=%#08x ",
+			p->ceinfo.ecc_synd, p->ceinfo.ecc_addr,
+			p->ceinfo.ecc_data, p->ceinfo.ecc_id);
+
+		page = p->ceinfo.ecc_addr >> PAGE_SHIFT;
+		offset = p->ceinfo.ecc_addr & ~PAGE_MASK;
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
+				     p->ce_cnt, page, offset,
+				     p->ceinfo.ecc_synd,
+				     0, 0, -1,
+				     priv->message, "");
+	}
+
+	if (p->ue_cnt) {
+		snprintf(priv->message, EDAC_MSG_SIZE,
+			"DDR ECC: synd=%#08x addr=%#08x data=%#08x source_id=%#08x ",
+			p->ueinfo.ecc_synd, p->ueinfo.ecc_addr,
+			p->ueinfo.ecc_data, p->ueinfo.ecc_id);
+
+		page = p->ueinfo.ecc_addr >> PAGE_SHIFT;
+		offset = p->ueinfo.ecc_addr & ~PAGE_MASK;
+		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
+				     p->ue_cnt, page, offset,
+				     p->ueinfo.ecc_synd,
+				     0, 0, -1,
+				     priv->message, "");
+	}
+
+	memset(p, 0, sizeof(*p));
+}
+
+/**
+ * npcm7xx_edac_check - Check controller for ECC errors
+ * @mci:	Pointer to the edac memory controller instance
+ *
+ * This routine is used to check and post ECC errors and is called by
+ * this driver's CE and UE interrupt handler.
+ */
+static void npcm7xx_edac_check(struct mem_ctl_info *mci)
+{
+	struct npcm7xx_edac_priv *priv = mci->pvt_info;
+	int status = 0;
+
+	status = npcm7xx_edac_get_ecc_syndrom(priv->baseaddr, &priv->stat);
+	if (status != ECC_ERROR)
+		return;
+
+	npcm7xx_edac_handle_error(mci, &priv->stat);
+}
+
+/**
+ * npcm7xx_edac_isr - CE/UE interrupt service routine
+ * @irq:    The virtual interrupt number being serviced.
+ * @dev_id: A pointer to the EDAC memory controller instance
+ *          associated with the interrupt being handled.
+ *
+ * This routine implements the interrupt handler for both correctable
+ * (CE) and uncorrectable (UE) ECC errors for the Nuvoton Cadence DDR
+ * controller. It simply calls through to the routine used to check,
+ * report and clear the ECC status.
+ *
+ * Unconditionally returns IRQ_HANDLED.
+ */
+static irqreturn_t npcm7xx_edac_isr(int irq, void *dev_id)
+{
+	struct mem_ctl_info *mci = dev_id;
+	int npcm_edac_report = 0;
+
+	npcm_edac_report = edac_get_report_status();
+	if (npcm_edac_report != EDAC_REPORTING_DISABLED)
+		npcm7xx_edac_check(mci);
+
+	return IRQ_HANDLED;
+}
+
+static int npcm7xx_edac_register_irq(struct mem_ctl_info *mci,
+					struct platform_device *pdev)
+{
+	int status = 0;
+	int mc_irq;
+	struct npcm7xx_edac_priv *priv = mci->pvt_info;
+
+	mc_irq = platform_get_irq(pdev, 0);
+
+	if (!mc_irq) {
+		edac_printk(KERN_ERR, EDAC_MC, "Unable to map interrupts.\n");
+		status = -ENODEV;
+		goto fail;
+	}
+
+	status = devm_request_irq(&pdev->dev, mc_irq, npcm7xx_edac_isr, 0,
+			       "npcm-memory-controller", mci);
+
+	if (status < 0) {
+		edac_printk(KERN_ERR, EDAC_MC,
+				      "Unable to request irq %d for ECC",
+				      mc_irq);
+		status = -ENODEV;
+		goto fail;
+	}
+
+	/* Only enable MC interrupts with ECC - clear int_mask[6:3] */
+	writel(ECC_EN_INT_MASK, priv->baseaddr + 4*INT_MASK_ADDR);
+
+	return 0;
+
+fail:
+	return status;
+}
+
+static const struct of_device_id npcm7xx_edac_of_match[] = {
+	{ .compatible = "nuvoton,npcm7xx-sdram-edac"},
+	{ /* end of table */ }
+};
+
+MODULE_DEVICE_TABLE(of, npcm7xx_edac_of_match);
+
+/**
+ * npcm7xx_edac_mc_init - Initialize driver instance
+ * @mci:	Pointer to the edac memory controller instance
+ * @pdev:	Pointer to the platform_device struct
+ *
+ * Performs initialization of the EDAC memory controller instance and
+ * related driver-private data associated with the memory controller the
+ * instance is bound to.
+ *
+ * Returns 0 if OK; otherwise, < 0 on error.
+ */
+static int npcm7xx_edac_mc_init(struct mem_ctl_info *mci,
+				 struct platform_device *pdev)
+{
+	const struct of_device_id *id;
+
+	id = of_match_device(npcm7xx_edac_of_match, &pdev->dev);
+	if (!id)
+		return -ENODEV;
+
+	/* Initialize controller capabilities and configuration */
+	mci->mtype_cap = MEM_FLAG_DDR4;
+	mci->edac_ctl_cap = EDAC_FLAG_SECDED;
+	mci->edac_cap = EDAC_FLAG_SECDED;
+	mci->scrub_cap = SCRUB_FLAG_HW_SRC;
+	mci->scrub_mode = SCRUB_HW_SRC;
+	mci->ctl_name = id->compatible;
+	mci->dev_name = dev_name(&pdev->dev);
+	mci->mod_name = EDAC_MOD_NAME;
+
+	edac_op_state = EDAC_OPSTATE_INT;
+
+	return 0;
+}
+
+/**
+ * npcm7xx_edac_get_eccstate - Return the controller ecc enable/disable status
+ * @base:	Pointer to the ddr memory controller base address
+ *
+ * Get the ECC enable/disable status for the controller
+ *
+ * Return: a ecc status boolean i.e true/false - enabled/disabled.
+ */
+static bool npcm7xx_edac_get_eccstate(void __iomem *base)
+{
+	u32 ecc_en;
+	bool state = false;
+
+	ecc_en = readl(base + 4*ECC_EN_ADDR);
+	if (ecc_en & ECC_ENABLE) {
+		edac_printk(KERN_INFO, EDAC_MC, "ECC reporting and correcting on. ");
+		state = true;
+	}
+
+	return state;
+}
+
+/**
+ * npcm7xx_edac_mc_probe - Check controller and bind driver
+ * @pdev:	Pointer to the platform_device struct
+ *
+ * Probes a specific controller instance for binding with the driver.
+ *
+ * Return: 0 if the controller instance was successfully bound to the
+ * driver; otherwise, < 0 on error.
+ */
+static int npcm7xx_edac_mc_probe(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci;
+	struct edac_mc_layer layers[1];
+	struct npcm7xx_edac_priv *priv;
+	struct resource *res;
+	void __iomem *baseaddr;
+	int rc;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	baseaddr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(baseaddr)) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			    "DDR controller regs not defined\n");
+		return PTR_ERR(baseaddr);
+	}
+
+	/*
+	 * Check if ECC is enabled.
+	 * If not, there is no useful monitoring that can be done
+	 * for this controller.
+	 */
+	if (!npcm7xx_edac_get_eccstate(baseaddr)) {
+		edac_printk(KERN_INFO, EDAC_MC, "ECC disabled\n");
+		return -ENXIO;
+	}
+
+	/*
+	 * Allocate an EDA controller instance and perform the appropriate
+	 * initialization.
+	 */
+	layers[0].type = EDAC_MC_LAYER_ALL_MEM;
+	layers[0].size = 1;
+
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
+			    sizeof(struct npcm7xx_edac_priv));
+	if (!mci) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed memory allocation for mc instance\n");
+		return -ENOMEM;
+	}
+
+	mci->pdev = &pdev->dev;
+	priv = mci->pvt_info;
+	priv->baseaddr = baseaddr;
+	platform_set_drvdata(pdev, mci);
+
+	rc = npcm7xx_edac_mc_init(mci, pdev);
+	if (rc) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed to initialize instance\n");
+		goto free_edac_mc;
+	}
+
+	/* Attempt to register it with the EDAC subsystem */
+	rc = edac_mc_add_mc(mci);
+	if (rc) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed to register with EDAC core\n");
+		goto free_edac_mc;
+	}
+
+	/* Register interrupts */
+	rc = npcm7xx_edac_register_irq(mci, pdev);
+	if (rc)
+		goto free_edac_mc;
+
+	return 0;
+
+free_edac_mc:
+	edac_mc_free(mci);
+
+	return rc;
+}
+
+/**
+ * npcm7xx_edac_mc_remove - Unbind driver from controller
+ * @pdev:	Pointer to the platform_device struct
+ *
+ * Return: Unconditionally 0
+ */
+static int npcm7xx_edac_mc_remove(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+
+	return 0;
+}
+
+static struct platform_driver npcm7xx_edac_driver = {
+	.probe = npcm7xx_edac_mc_probe,
+	.remove = npcm7xx_edac_mc_remove,
+	.driver = {
+		   .name = EDAC_MOD_NAME,
+		   .of_match_table = npcm7xx_edac_of_match,
+	},
+};
+
+module_platform_driver(npcm7xx_edac_driver);
+
+MODULE_AUTHOR("Quanta Computer Inc.");
+MODULE_DESCRIPTION("Nuvoton NPCM7xx EDAC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0
