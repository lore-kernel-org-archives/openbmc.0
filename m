Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KFT4676GzDqXr
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 11:02:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 16:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,370,1539673200"; d="scan'208";a="128987474"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2018 16:02:48 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux dev-4.19 08/12] mfd: intel-peci-client: Add PECI client
 MFD driver
Date: Tue, 18 Dec 2018 16:02:32 -0800
Message-Id: <20181219000236.30812-9-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
References: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 19 Dec 2018 00:02:50 -0000

This commit adds PECI client MFD driver.

Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/mfd/Kconfig                   |  14 ++++
 drivers/mfd/Makefile                  |   1 +
 drivers/mfd/intel-peci-client.c       | 150 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/intel-peci-client.h | 110 +++++++++++++++++++++++++
 4 files changed, 275 insertions(+)
 create mode 100644 drivers/mfd/intel-peci-client.c
 create mode 100644 include/linux/mfd/intel-peci-client.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 11841f4b7b2b..66b71a6122d6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -595,6 +595,20 @@ config MFD_INTEL_MSIC
 	  Passage) chip. This chip embeds audio, battery, GPIO, etc.
 	  devices used in Intel Medfield platforms.
 
+config MFD_INTEL_PECI_CLIENT
+	bool "Intel PECI client"
+	depends on (PECI || COMPILE_TEST)
+	select MFD_CORE
+	help
+	  If you say yes to this option, support will be included for the
+	  Intel PECI (Platform Environment Control Interface) client. PECI is a
+	  one-wire bus interface that provides a communication channel from PECI
+	  clients in Intel processors and chipset components to external
+	  monitoring or control devices.
+
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_IPAQ_MICRO
 	bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
 	depends on SA1100_H3100 || SA1100_H3600
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 5856a9489cbd..ed05583dc30e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -203,6 +203,7 @@ obj-$(CONFIG_MFD_INTEL_LPSS)	+= intel-lpss.o
 obj-$(CONFIG_MFD_INTEL_LPSS_PCI)	+= intel-lpss-pci.o
 obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)	+= intel-lpss-acpi.o
 obj-$(CONFIG_MFD_INTEL_MSIC)	+= intel_msic.o
+obj-$(CONFIG_MFD_INTEL_PECI_CLIENT)	+= intel-peci-client.o
 obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
 obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
diff --git a/drivers/mfd/intel-peci-client.c b/drivers/mfd/intel-peci-client.c
new file mode 100644
index 000000000000..d53e4f1078ac
--- /dev/null
+++ b/drivers/mfd/intel-peci-client.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/intel-peci-client.h>
+#include <linux/module.h>
+#include <linux/peci.h>
+#include <linux/of_device.h>
+
+#define CPU_ID_MODEL_MASK      GENMASK(7, 4)
+#define CPU_ID_FAMILY_MASK     GENMASK(11, 8)
+#define CPU_ID_EXT_MODEL_MASK  GENMASK(19, 16)
+#define CPU_ID_EXT_FAMILY_MASK GENMASK(27, 20)
+
+#define LOWER_NIBBLE_MASK      GENMASK(3, 0)
+#define UPPER_NIBBLE_MASK      GENMASK(7, 4)
+#define LOWER_BYTE_MASK        GENMASK(7, 0)
+#define UPPER_BYTE_MASK        GENMASK(16, 8)
+
+enum cpu_gens {
+	CPU_GEN_HSX = 0, /* Haswell Xeon */
+	CPU_GEN_BRX,     /* Broadwell Xeon */
+	CPU_GEN_SKX,     /* Skylake Xeon */
+};
+
+static struct mfd_cell peci_functions[] = {
+	{ .name = "peci-cputemp", },
+	{ .name = "peci-dimmtemp", },
+	/* TODO: Add additional PECI sideband functions into here */
+};
+
+static const struct cpu_gen_info cpu_gen_info_table[] = {
+	[CPU_GEN_HSX] = {
+		.family        = 6, /* Family code */
+		.model         = INTEL_FAM6_HASWELL_X,
+		.core_max      = CORE_MAX_ON_HSX,
+		.chan_rank_max = CHAN_RANK_MAX_ON_HSX,
+		.dimm_idx_max  = DIMM_IDX_MAX_ON_HSX },
+	[CPU_GEN_BRX] = {
+		.family        = 6, /* Family code */
+		.model         = INTEL_FAM6_BROADWELL_X,
+		.core_max      = CORE_MAX_ON_BDX,
+		.chan_rank_max = CHAN_RANK_MAX_ON_BDX,
+		.dimm_idx_max  = DIMM_IDX_MAX_ON_BDX },
+	[CPU_GEN_SKX] = {
+		.family        = 6, /* Family code */
+		.model         = INTEL_FAM6_SKYLAKE_X,
+		.core_max      = CORE_MAX_ON_SKX,
+		.chan_rank_max = CHAN_RANK_MAX_ON_SKX,
+		.dimm_idx_max  = DIMM_IDX_MAX_ON_SKX },
+};
+
+static int peci_client_get_cpu_gen_info(struct peci_client_manager *priv)
+{
+	u32 cpu_id;
+	u16 family;
+	u8 model;
+	int rc;
+	int i;
+
+	rc = peci_get_cpu_id(priv->client->adapter, priv->client->addr,
+			     &cpu_id);
+	if (rc)
+		return rc;
+
+	family = FIELD_PREP(LOWER_BYTE_MASK,
+			    FIELD_GET(CPU_ID_FAMILY_MASK, cpu_id)) |
+		 FIELD_PREP(UPPER_BYTE_MASK,
+			    FIELD_GET(CPU_ID_EXT_FAMILY_MASK, cpu_id));
+	model = FIELD_PREP(LOWER_NIBBLE_MASK,
+			   FIELD_GET(CPU_ID_MODEL_MASK, cpu_id)) |
+		FIELD_PREP(UPPER_NIBBLE_MASK,
+			   FIELD_GET(CPU_ID_EXT_MODEL_MASK, cpu_id));
+
+	for (i = 0; i < ARRAY_SIZE(cpu_gen_info_table); i++) {
+		const struct cpu_gen_info *cpu_info = &cpu_gen_info_table[i];
+
+		if (family == cpu_info->family && model == cpu_info->model) {
+			priv->gen_info = cpu_info;
+			break;
+		}
+	}
+
+	if (!priv->gen_info) {
+		dev_err(priv->dev, "Can't support this CPU: 0x%x\n", cpu_id);
+		rc = -ENODEV;
+	}
+
+	return rc;
+}
+
+static int peci_client_probe(struct peci_client *client)
+{
+	struct device *dev = &client->dev;
+	struct peci_client_manager *priv;
+	uint cpu_no;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->client = client;
+	priv->dev = dev;
+	cpu_no = client->addr - PECI_BASE_ADDR;
+
+	ret = peci_client_get_cpu_gen_info(priv);
+	if (ret)
+		return ret;
+
+	ret = devm_mfd_add_devices(priv->dev, cpu_no, peci_functions,
+				   ARRAY_SIZE(peci_functions), NULL, 0, NULL);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to register child devices: %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id peci_client_of_table[] = {
+	{ .compatible = "intel,peci-client" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, peci_client_of_table);
+#endif
+
+static const struct peci_device_id peci_client_ids[] = {
+	{ .name = "peci-client" },
+	{ }
+};
+MODULE_DEVICE_TABLE(peci, peci_client_ids);
+
+static struct peci_driver peci_client_driver = {
+	.probe    = peci_client_probe,
+	.id_table = peci_client_ids,
+	.driver   = {
+		.name           = "peci-client",
+		.of_match_table = of_match_ptr(peci_client_of_table),
+	},
+};
+module_peci_driver(peci_client_driver);
+
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_DESCRIPTION("PECI client driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/intel-peci-client.h b/include/linux/mfd/intel-peci-client.h
new file mode 100644
index 000000000000..8f6d823a59cd
--- /dev/null
+++ b/include/linux/mfd/intel-peci-client.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018 Intel Corporation */
+
+#ifndef __LINUX_MFD_INTEL_PECI_CLIENT_H
+#define __LINUX_MFD_INTEL_PECI_CLIENT_H
+
+#include <linux/peci.h>
+
+#if IS_ENABLED(CONFIG_X86)
+#include <asm/intel-family.h>
+#else
+/**
+ * Architectures other than x86 cannot include the header file so define these
+ * at here. These are needed for detecting type of client x86 CPUs behind a PECI
+ * connection.
+ */
+#define INTEL_FAM6_HASWELL_X   0x3F
+#define INTEL_FAM6_BROADWELL_X 0x4F
+#define INTEL_FAM6_SKYLAKE_X   0x55
+#endif
+
+#define CORE_MAX_ON_HSX        18 /* Max number of cores on Haswell */
+#define CHAN_RANK_MAX_ON_HSX   8  /* Max number of channel ranks on Haswell */
+#define DIMM_IDX_MAX_ON_HSX    3  /* Max DIMM index per channel on Haswell */
+
+#define CORE_MAX_ON_BDX        24 /* Max number of cores on Broadwell */
+#define CHAN_RANK_MAX_ON_BDX   4  /* Max number of channel ranks on Broadwell */
+#define DIMM_IDX_MAX_ON_BDX    3  /* Max DIMM index per channel on Broadwell */
+
+#define CORE_MAX_ON_SKX        28 /* Max number of cores on Skylake */
+#define CHAN_RANK_MAX_ON_SKX   6  /* Max number of channel ranks on Skylake */
+#define DIMM_IDX_MAX_ON_SKX    2  /* Max DIMM index per channel on Skylake */
+
+#define CORE_NUMS_MAX          CORE_MAX_ON_SKX
+#define CHAN_RANK_MAX          CHAN_RANK_MAX_ON_HSX
+#define DIMM_IDX_MAX           DIMM_IDX_MAX_ON_HSX
+#define DIMM_NUMS_MAX          (CHAN_RANK_MAX * DIMM_IDX_MAX)
+
+/**
+ * struct cpu_gen_info - CPU generation specific information
+ * @family: CPU family ID
+ * @model: CPU model
+ * @core_max: max number of cores
+ * @chan_rank_max: max number of channel ranks
+ * @dimm_idx_max: max number of DIMM indices
+ *
+ * CPU generation specific information to identify maximum number of cores and
+ * DIMM slots.
+ */
+struct cpu_gen_info {
+	u16  family;
+	u8   model;
+	uint core_max;
+	uint chan_rank_max;
+	uint dimm_idx_max;
+};
+
+/**
+ * struct peci_client_manager - PECI client manager information
+ * @client; pointer to the PECI client
+ * @dev: pointer to the struct device
+ * @name: PECI client manager name
+ * @gen_info: CPU generation info of the detected CPU
+ *
+ * PECI client manager information for managing PECI sideband functions on a CPU
+ * client.
+ */
+struct peci_client_manager {
+	struct peci_client *client;
+	struct device *dev;
+	char name[PECI_NAME_SIZE];
+	const struct cpu_gen_info *gen_info;
+};
+
+/**
+ * peci_client_read_package_config - read from the Package Configuration Space
+ * @priv: driver private data structure
+ * @index: encoding index for the requested service
+ * @param: parameter to specify the exact data being requested
+ * @data: data buffer to store the result
+ * Context: can sleep
+ *
+ * A generic PECI command that provides read access to the
+ * "Package Configuration Space" that is maintained by the PCU, including
+ * various power and thermal management functions. Typical PCS read services
+ * supported by the processor may include access to temperature data, energy
+ * status, run time information, DIMM temperatures and so on.
+ *
+ * Return: zero on success, else a negative error code.
+ */
+static inline int
+peci_client_read_package_config(struct peci_client_manager *priv,
+				u8 index, u16 param, u8 *data)
+{
+	struct peci_rd_pkg_cfg_msg msg;
+	int rc;
+
+	msg.addr = priv->client->addr;
+	msg.index = index;
+	msg.param = param;
+	msg.rx_len = 4;
+
+	rc = peci_command(priv->client->adapter, PECI_CMD_RD_PKG_CFG, &msg);
+	if (!rc)
+		memcpy(data, msg.pkg_config, 4);
+
+	return rc;
+}
+
+#endif /* __LINUX_MFD_INTEL_PECI_CLIENT_H */
-- 
2.7.4
