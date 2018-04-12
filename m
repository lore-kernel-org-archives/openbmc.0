Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XX2OrV6k"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fhg5kkHJ"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40M6Zd4zzyzF1RZ
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 13:58:17 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8462F218D2;
 Wed, 11 Apr 2018 23:52:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Apr 2018 23:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cGh6FJYFxi19a13CT
 KYsSAyBc4YuwTVlbULgcDcZmAI=; b=XX2OrV6knCmTxXR9RQH6wTtqh+p7yS9ZJ
 DuqbVvbq3AmHwwdfhNjxQRGEYILx8+b7K7wS/aPNYW6ZArxrqcmtiEgxnXhhVKhl
 yMOzUSx6znfolB3jCXrltkZpegT7IY+0MOY/ghWVKopELuyNixjEtkybhWBgFygG
 ny8tSyarpqXZYv2E5MP7mL50SiGA0ZkTaWSotTQNljKmPw62QtWW0uyqqpCUlcEt
 +x3sOodPCWPpjo+qYS110W7ZvIvqpAP+B8TyrPY68ruGf2FmVBQfmHb+W74lsCWm
 brtsCl3RWYVSTMOWpWXsRQyJKJJHS6yUJK8Ngnp7wmF7mL0o5iQDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cGh6FJYFxi19a13CTKYsSAyBc4YuwTVlbULgcDcZmAI=; b=fhg5kkHJ
 cANOq9r6I9QzTzca8ApBxWs/2wtmW6+fLfK3ou3sQRtiodzcM7gte5CU3tdp6UoX
 F8pM4cQt7/SiGlm6hvecuCXpDCHkU3pLK7Ff0awM1xMD+lDwReHqjMzuQ5ads/g0
 awbAcC1+5dFib6r5KVdoHy6wtuRaOhVKmWchQTp1K6NwPDYprG1bKLSshHEaZ0u0
 2V1QdF0CDV8v5WSTnP39j3GI0obVnCqf1d3tkfRPhf63YegGFRL8CXfoFlaB6Rjz
 gC3xa5PIDoS7GWtdj821s8HSw71Ji3HeYzllKH0Bpd+J9AOZuLcPJanEAQxHgJBz
 tP/Dy6hc0yzJJA==
X-ME-Sender: <xms:_dfOWmLDamjLIvk9y0cAKmV8kzS44BHNJugqU2j4KG3RBI1v-c6lLw>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F17410255;
 Wed, 11 Apr 2018 23:52:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 benh@kernel.crashing.org
Subject: [RFC PATCH linux dev-4.13 1/3] soc: aspeed: Miscellaneous control
 interfaces
Date: Thu, 12 Apr 2018 13:21:43 +0930
Message-Id: <20180412035145.21488-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180412035145.21488-1-andrew@aj.id.au>
References: <20180412035145.21488-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 12 Apr 2018 03:58:19 -0000

The ASPEED BMC SoCs have many knobs and switches that are sometimes
design-specific and often defy any approach to unify them under an
existing subsystem.

Add a driver to translate a devicetree table into sysfs entries to
expose bits and fields for manipulation from userspace. This encompasses
concepts from scratch registers to boolean conditions to enable or
disable host interface features.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/soc/Kconfig                  |   1 +
 drivers/soc/Makefile                 |   1 +
 drivers/soc/aspeed/Kconfig           |  11 +++
 drivers/soc/aspeed/Makefile          |   1 +
 drivers/soc/aspeed/aspeed-bmc-misc.c | 187 +++++++++++++++++++++++++++++++++++
 5 files changed, 201 insertions(+)
 create mode 100644 drivers/soc/aspeed/Kconfig
 create mode 100644 drivers/soc/aspeed/Makefile
 create mode 100644 drivers/soc/aspeed/aspeed-bmc-misc.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 07fc0ac51c52..776fd5978f70 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -1,6 +1,7 @@
 menu "SOC (System On Chip) specific Drivers"
 
 source "drivers/soc/actions/Kconfig"
+source "drivers/soc/aspeed/Kconfig"
 source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/fsl/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 9241125416ba..94a5b97c4466 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -3,6 +3,7 @@
 #
 
 obj-$(CONFIG_ARCH_ACTIONS)	+= actions/
+obj-$(CONFIG_ARCH_ASPEED)       += aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
new file mode 100644
index 000000000000..704a4efe180f
--- /dev/null
+++ b/drivers/soc/aspeed/Kconfig
@@ -0,0 +1,11 @@
+menu "ASPEED SoC drivers"
+
+config ASPEED_BMC_MISC
+	bool "Miscellaneous ASPEED BMC interfaces"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	default ARCH_ASPEED
+	help
+	  Say yes to expose VGA and LPC scratch registers, and other
+	  miscellaneous control interfaces specific to the ASPEED BMC SoCs
+
+endmenu
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
new file mode 100644
index 000000000000..d1a80f9a584f
--- /dev/null
+++ b/drivers/soc/aspeed/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_ASPEED_BMC_MISC) += aspeed-bmc-misc.o
diff --git a/drivers/soc/aspeed/aspeed-bmc-misc.c b/drivers/soc/aspeed/aspeed-bmc-misc.c
new file mode 100644
index 000000000000..48522a736a05
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-bmc-misc.c
@@ -0,0 +1,187 @@
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define DEVICE_NAME "aspeed-bmc-misc"
+
+struct aspeed_bmc_ctrl {
+	const char *name;
+	u32 offset;
+	u32 mask;
+	u32 shift;
+	struct regmap *map;
+	struct kobj_attribute attr;
+};
+
+struct aspeed_bmc_misc {
+	struct device *dev;
+	struct regmap *map;
+	struct aspeed_bmc_ctrl *ctrls;
+	int nr_ctrls;
+};
+
+static int aspeed_bmc_misc_parse_dt_child(struct device_node *child,
+					  struct aspeed_bmc_ctrl *ctrl)
+{
+	int rc;
+
+	/* Example child:
+	 *
+	 * ilpc2ahb {
+	 *     offset = <0x80>;
+	 *     bit-mask = <0x1>;
+	 *     bit-shift = <6>;
+	 *     label = "foo";
+	 * }
+	 */
+	if (of_property_read_string(child, "label", &ctrl->name))
+		ctrl->name = child->name;
+
+	rc = of_property_read_u32(child, "offset", &ctrl->offset);
+	if (rc < 0)
+		return rc;
+
+	rc = of_property_read_u32(child, "bit-mask", &ctrl->mask);
+	if (rc < 0)
+		return rc;
+
+	rc = of_property_read_u32(child, "bit-shift", &ctrl->shift);
+	if (rc < 0)
+		return rc;
+
+	ctrl->mask <<= ctrl->shift;
+
+	return 0;
+}
+
+static int aspeed_bmc_misc_parse_dt(struct aspeed_bmc_misc *bmc,
+				    struct device_node *parent)
+{
+	struct aspeed_bmc_ctrl *ctrl;
+	struct device_node *child;
+	int rc;
+
+	bmc->nr_ctrls = of_get_child_count(parent);
+	bmc->ctrls = devm_kcalloc(bmc->dev, bmc->nr_ctrls, sizeof(*bmc->ctrls),
+				  GFP_KERNEL);
+	if (!bmc->ctrls)
+		return -ENOMEM;
+
+	ctrl = bmc->ctrls;
+	for_each_child_of_node(parent, child) {
+		rc = aspeed_bmc_misc_parse_dt_child(child, ctrl++);
+		if (rc < 0) {
+			of_node_put(child);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t aspeed_bmc_misc_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct aspeed_bmc_ctrl *ctrl;
+	unsigned int val;
+	int rc;
+
+	ctrl = container_of(attr, struct aspeed_bmc_ctrl, attr);
+	rc = regmap_read(ctrl->map, ctrl->offset, &val);
+	if (rc)
+		return rc;
+
+	val &= ctrl->mask;
+	val >>= ctrl->shift;
+
+	return sprintf(buf, "%u\n", val);
+}
+
+static ssize_t aspeed_bmc_misc_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct aspeed_bmc_ctrl *ctrl;
+	long val;
+	int rc;
+
+	rc = kstrtol(buf, 0, &val);
+	if (rc)
+		return rc;
+
+	ctrl = container_of(attr, struct aspeed_bmc_ctrl, attr);
+	val <<= ctrl->shift;
+	rc = regmap_update_bits(ctrl->map, ctrl->offset, ctrl->mask, val);
+
+	return rc < 0 ? rc : count;
+}
+
+static int aspeed_bmc_misc_add_sysfs_attr(struct aspeed_bmc_misc *bmc,
+					  struct aspeed_bmc_ctrl *ctrl)
+{
+	ctrl->map = bmc->map;
+
+	sysfs_attr_init(&ctrl->attr.attr);
+	ctrl->attr.attr.name = ctrl->name;
+	ctrl->attr.attr.mode = 0664;
+	ctrl->attr.show = aspeed_bmc_misc_show;
+	ctrl->attr.store = aspeed_bmc_misc_store;
+
+	return sysfs_create_file(&bmc->dev->kobj, &ctrl->attr.attr);
+}
+
+static int aspeed_bmc_misc_populate_sysfs(struct aspeed_bmc_misc *bmc)
+{
+	int rc;
+	int i;
+
+	for (i = 0; i < bmc->nr_ctrls; i++) {
+		rc = aspeed_bmc_misc_add_sysfs_attr(bmc, &bmc->ctrls[i]);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int aspeed_bmc_misc_probe(struct platform_device *pdev)
+{
+	struct aspeed_bmc_misc *bmc;
+	int rc;
+
+	bmc = devm_kzalloc(&pdev->dev, sizeof(*bmc), GFP_KERNEL);
+	if (!bmc)
+		return -ENOMEM;
+
+	bmc->dev = &pdev->dev;
+	bmc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(bmc->map))
+		return PTR_ERR(bmc->map);
+
+	rc = aspeed_bmc_misc_parse_dt(bmc, pdev->dev.of_node);
+	if (rc < 0)
+		return rc;
+
+	return aspeed_bmc_misc_populate_sysfs(bmc);
+}
+
+static const struct of_device_id aspeed_bmc_misc_match[] = {
+	{ .compatible = "aspeed,bmc-misc" },
+	{ },
+};
+
+static struct platform_driver aspeed_bmc_misc = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = aspeed_bmc_misc_match,
+	},
+	.probe = aspeed_bmc_misc_probe,
+};
+
+module_platform_driver(aspeed_bmc_misc);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
-- 
2.14.1
