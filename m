Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40yCNk6TGqzF0dm
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jun 2018 04:22:30 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jun 2018 11:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,467,1520924400"; d="scan'208";a="60520490"
Received: from maru.jf.intel.com ([10.54.51.80])
 by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2018 11:22:28 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>,
	openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: [PATCH linux-next v5 08/13] drivers/mfd: Add PECI client mfd driver
Date: Fri,  1 Jun 2018 11:22:27 -0700
Message-Id: <20180601182227.23938-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 18:22:31 -0000

This commit adds PECI client mfd driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: James Feist <james.feist@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
---
 drivers/mfd/Kconfig             |  11 ++
 drivers/mfd/Makefile            |   1 +
 drivers/mfd/peci-client.c       | 205 ++++++++++++++++++++++++++++++++
 include/linux/mfd/peci-client.h |  60 ++++++++++
 4 files changed, 277 insertions(+)
 create mode 100644 drivers/mfd/peci-client.c
 create mode 100644 include/linux/mfd/peci-client.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index b860eb5aa194..4068a2cdf777 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -885,6 +885,17 @@ config UCB1400_CORE
 	  To compile this driver as a module, choose M here: the
 	  module will be called ucb1400_core.
 
+config MFD_PECI_CLIENT
+	bool "PECI client multi-function device driver"
+	depends on (PECI || COMPILE_TEST)
+	select MFD_CORE
+	help
+	  If you say yes to this option, support will be included for the
+	  the PECI client multi-function devices.
+
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_PM8XXX
 	tristate "Qualcomm PM8xxx PMIC chips driver"
 	depends on (ARM || HEXAGON || COMPILE_TEST)
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e9fd20dba18d..d352599c8dfd 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+= si476x-core.o
 
 obj-$(CONFIG_MFD_CS5535)	+= cs5535-mfd.o
 obj-$(CONFIG_MFD_OMAP_USB_HOST)	+= omap-usb-host.o omap-usb-tll.o
+obj-$(CONFIG_MFD_PECI_CLIENT)	+= peci-client.o
 obj-$(CONFIG_MFD_PM8XXX) 	+= qcom-pm8xxx.o ssbi.o
 obj-$(CONFIG_MFD_QCOM_RPM)	+= qcom_rpm.o
 obj-$(CONFIG_MFD_SPMI_PMIC)	+= qcom-spmi-pmic.o
diff --git a/drivers/mfd/peci-client.c b/drivers/mfd/peci-client.c
new file mode 100644
index 000000000000..02f8ef5fc606
--- /dev/null
+++ b/drivers/mfd/peci-client.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/peci-client.h>
+#include <linux/module.h>
+#include <linux/peci.h>
+#include <linux/of_device.h>
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
+#define LOWER_NIBBLE_MASK      GENMASK(3, 0)
+#define UPPER_NIBBLE_MASK      GENMASK(7, 4)
+
+#define CPU_ID_MODEL_MASK      GENMASK(7, 4)
+#define CPU_ID_FAMILY_MASK     GENMASK(11, 8)
+#define CPU_ID_EXT_MODEL_MASK  GENMASK(19, 16)
+#define CPU_ID_EXT_FAMILY_MASK GENMASK(27, 20)
+
+enum cpu_gens {
+	CPU_GEN_HSX = 0, /* Haswell Xeon */
+	CPU_GEN_BRX,     /* Broadwell Xeon */
+	CPU_GEN_SKX,     /* Skylake Xeon */
+};
+
+static struct mfd_cell peci_functions[] = {
+	{
+		.name = "peci-cputemp",
+		.of_compatible = "intel,peci-cputemp",
+	},
+	{
+		.name = "peci-dimmtemp",
+		.of_compatible = "intel,peci-dimmtemp",
+	},
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
+static int peci_client_get_cpu_gen_info(struct peci_mfd *priv)
+{
+	u32 cpu_id;
+	int i, rc;
+
+	rc = peci_get_cpu_id(priv->adapter, priv->addr, &cpu_id);
+	if (rc)
+		return rc;
+
+	for (i = 0; i < ARRAY_SIZE(cpu_gen_info_table); i++) {
+		if (FIELD_GET(CPU_ID_FAMILY_MASK, cpu_id) +
+			FIELD_GET(CPU_ID_EXT_FAMILY_MASK, cpu_id) ==
+				cpu_gen_info_table[i].family &&
+		    FIELD_GET(CPU_ID_MODEL_MASK, cpu_id) ==
+			FIELD_GET(LOWER_NIBBLE_MASK,
+				  cpu_gen_info_table[i].model) &&
+		    FIELD_GET(CPU_ID_EXT_MODEL_MASK, cpu_id) ==
+			FIELD_GET(UPPER_NIBBLE_MASK,
+				  cpu_gen_info_table[i].model)) {
+			break;
+		}
+	}
+
+	if (i >= ARRAY_SIZE(cpu_gen_info_table))
+		return -ENODEV;
+
+	priv->gen_info = &cpu_gen_info_table[i];
+
+	return 0;
+}
+
+bool peci_temp_need_update(struct temp_data *temp)
+{
+	if (temp->valid &&
+	    time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(peci_temp_need_update);
+
+void peci_temp_mark_updated(struct temp_data *temp)
+{
+	temp->valid = 1;
+	temp->last_updated = jiffies;
+}
+EXPORT_SYMBOL_GPL(peci_temp_mark_updated);
+
+int peci_client_command(struct peci_mfd *priv, enum peci_cmd cmd, void *vmsg)
+{
+	return peci_command(priv->adapter, cmd, vmsg);
+}
+EXPORT_SYMBOL_GPL(peci_client_command);
+
+int peci_client_rd_pkg_cfg_cmd(struct peci_mfd *priv, u8 mbx_idx,
+			       u16 param, u8 *data)
+{
+	struct peci_rd_pkg_cfg_msg msg;
+	int rc;
+
+	msg.addr = priv->addr;
+	msg.index = mbx_idx;
+	msg.param = param;
+	msg.rx_len = 4;
+
+	rc = peci_command(priv->adapter, PECI_CMD_RD_PKG_CFG, &msg);
+	if (!rc)
+		memcpy(data, msg.pkg_config, 4);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(peci_client_rd_pkg_cfg_cmd);
+
+static int peci_client_probe(struct peci_client *client)
+{
+	struct device *dev = &client->dev;
+	struct peci_mfd *priv;
+	int rc;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->client = client;
+	priv->dev = dev;
+	priv->adapter = client->adapter;
+	priv->addr = client->addr;
+	priv->cpu_no = client->addr - PECI_BASE_ADDR;
+
+	snprintf(priv->name, PECI_NAME_SIZE, "peci_client.cpu%d", priv->cpu_no);
+
+	rc = peci_client_get_cpu_gen_info(priv);
+	if (rc)
+		return rc;
+
+	rc = devm_mfd_add_devices(priv->dev, priv->cpu_no, peci_functions,
+				  ARRAY_SIZE(peci_functions), NULL, 0, NULL);
+	if (rc < 0) {
+		dev_err(priv->dev, "mfd_add_devices failed: %d\n", rc);
+		return rc;
+	}
+
+	dev_dbg(dev, "'%s' at 0x%02x\n", priv->name, priv->addr);
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
+	{ .name = "peci-client", .driver_data = 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(peci, peci_client_ids);
+
+static struct peci_driver peci_client_driver = {
+	.probe    = peci_client_probe,
+	.id_table = peci_client_ids,
+	.driver   = {
+			.name           = "peci-client",
+			.of_match_table =
+				of_match_ptr(peci_client_of_table),
+	},
+};
+module_peci_driver(peci_client_driver);
+
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_DESCRIPTION("PECI client multi-function driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/peci-client.h b/include/linux/mfd/peci-client.h
new file mode 100644
index 000000000000..b06e37355632
--- /dev/null
+++ b/include/linux/mfd/peci-client.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018 Intel Corporation */
+
+#ifndef __LINUX_MFD_PECI_CLIENT_H
+#define __LINUX_MFD_PECI_CLIENT_H
+
+#include <linux/peci.h>
+
+#define TEMP_TYPE_PECI         6 /* Sensor type 6: Intel PECI */
+
+#define UPDATE_INTERVAL        HZ
+
+struct temp_data {
+	uint  valid;
+	s32   value;
+	ulong last_updated;
+};
+
+struct cpu_gen_info {
+	u16  family;
+	u8   model;
+	uint core_max;
+	uint chan_rank_max;
+	uint dimm_idx_max;
+};
+
+struct peci_mfd {
+	struct peci_client *client;
+	struct device *dev;
+	struct peci_adapter *adapter;
+	char name[PECI_NAME_SIZE];
+	u8 addr;
+	uint cpu_no;
+	const struct cpu_gen_info *gen_info;
+};
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
+bool peci_temp_need_update(struct temp_data *temp);
+void peci_temp_mark_updated(struct temp_data *temp);
+int  peci_client_command(struct peci_mfd *mfd, enum peci_cmd cmd, void *vmsg);
+int  peci_client_rd_pkg_cfg_cmd(struct peci_mfd *mfd, u8 mbx_idx,
+				u16 param, u8 *data);
+
+#endif /* __LINUX_MFD_PECI_CLIENT_H */
-- 
2.17.0
