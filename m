Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w003m6LP1zDqKK
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:57:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="a0hqST1C"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YBiBk349"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B3CA0206FC;
 Fri,  7 Apr 2017 08:57:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=/5+g+P
 QNgD7P1FX9DT0vziVrvCMzqJ69nLtVUGspWF4=; b=a0hqST1CW+w49nxF8HrvXS
 z3fV5jLzHFG6AH6x0E0c+rJqEGlc5acPHcJDvwKcEEHiTmi70zvCiCrgm2b7ZRVm
 iixNZNKv+4bZbzlMhgxgaAqJGHQCIiQnbseNZZGOLqMEObiNxiiPrB4LASdrkpwd
 TI4gQBikhJOp5g5HY3AlEKpbpvmqWuHmPcpjMdnZUX+MsnZ289vGvWBIhcQKcpac
 TkQubTIaqu7KAQ6yy4Xn9OzGlyatvrNHDR4hmg0wfYyS/YUqIqU0WycUJ64j8X3o
 theNo3lHxD/2uwQARaOpbLVVh8q21PLySttCB9GxVzAorkU2Ly8zAjzi3ldyDmpQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=/5+g+PQNgD7P1FX9DT0vziVrvCMzqJ69nLtVUGspW
 F4=; b=YBiBk3490GpKPOJM+ZYpq2e6DcgEfCSjDVbBvyPu0ImPkdo32D5tN/wHm
 We2+m6qvJJ1h9QGUACIDZ84azEFYITyHUAMEcJWk2QSWPkC728R2MYUrLgrqbmsQ
 z4WYGAiCG+xNfGu/hTwCn7WGskpgStg7UAx4dfrQMgwFLzGsqi9gSnJIv2+vpze8
 jm9HlU5t7FCDhhY4idi8KmTerAvwWMVEuoy9GcV5DeSKIY6IFe6/d2t2mjOC3aE+
 spLJ6tGoQDNb29OOIcYTPp3zx5i+yH3qpaKGG9c82DKZaDzYG9OE1XjgoPb8Tps2
 HpjS5viswNgpB/ui0FKI+ki5RibZQ==
X-ME-Sender: <xms:woznWD8RyIfV6z-YhM4luY5aUp_FPrysz0yNjvtB0HbbQTFLdGDXQg>
X-Sasl-enc: 4S9cz5/6U+PTVbbdzTeMZd/Pn5S0UXbumBSgTnqmQwC4 1491569857
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4610F7E669;
 Fri,  7 Apr 2017 08:57:33 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/4] pinctrl: aspeed: Add core pinconf support
Date: Fri,  7 Apr 2017 22:27:11 +0930
Message-Id: <20170407125713.15678-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170407125713.15678-1-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:57:42 -0000

Several pinconf parameters have a fairly straight-forward mapping onto
the Aspeed pin controller. These include management of pull-down bias,
drive-strength, and some debounce configuration.

Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
ADC and RMII/RGMII pins. As the bias configuration for each pin in a
bank maps onto a single per-bank bit, configuration tables will be
introduced to describe the ranges of pins and the supported pinconf
parameter. The use of tables also helps with the sparse support of
pinconf properties, and the fact that not all GPIO banks support
biasing or drive-strength configuration.

Further, as the pin controller uses a consistent approach for bias and
drive strength configuration at the register level, a second table is
defined for looking up the the bit-state required to enable or query the
provided configuration.

Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
system, and pinctrl-aspeed-g5 on an AST2500EVB as well as under QEMU.
The test method was to set the appropriate bits via devmem and verify
the result through the controller's pinconf-pins debugfs file. This
simultaneously validates the get() path and half of the set() path. The
remainder of the set() path was validated by configuring a handful of
pins via the devicetree with the supported pinconf properties and
verifying the appropriate registers were touched.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 211 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  28 +++++
 2 files changed, 239 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 76f62bd45f02..3dcf82533bef 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -537,3 +537,214 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+
+static inline bool pin_in_config_range(unsigned int offset,
+		const struct aspeed_pin_config *config)
+{
+	return offset >= config->pins[0] && offset <= config->pins[1];
+}
+
+static inline const struct aspeed_pin_config *find_pinconf_config(
+		const struct aspeed_pinctrl_data *pdata,
+		unsigned int offset,
+		enum pin_config_param param)
+{
+	unsigned int i;
+
+	for (i = 0; i < pdata->nconfigs; i++) {
+		if (param == pdata->configs[i].param &&
+				pin_in_config_range(offset, &pdata->configs[i]))
+			return &pdata->configs[i];
+	}
+
+	return NULL;
+}
+
+/**
+ * @param: pinconf configuration parameter
+ * @arg: The supported argument for @param, or -1 if any value is supported
+ * @value: The register value to write to configure @arg for @param
+ *
+ * The map is to be used in conjunction with the configuration array supplied
+ * by the driver implementation.
+ */
+struct aspeed_pin_config_map {
+	enum pin_config_param param;
+	s32 arg;
+	u32 val;
+};
+
+enum aspeed_pin_config_map_type { MAP_TYPE_ARG, MAP_TYPE_VAL };
+
+/* Aspeed consistently both:
+ *
+ * 1. Defines "disable bits" for internal pull-downs
+ * 2. Uses 8mA or 16mA drive strengths
+ */
+static const struct aspeed_pin_config_map pin_config_map[] = {
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1 },
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0 },
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1 },
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0 },
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1 },
+};
+
+static const struct aspeed_pin_config_map *find_pinconf_map(
+		enum pin_config_param param,
+		enum aspeed_pin_config_map_type type,
+		s64 value)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pin_config_map); i++) {
+		const struct aspeed_pin_config_map *elem;
+		bool match;
+
+		elem = &pin_config_map[i];
+
+		switch (type) {
+		case MAP_TYPE_ARG:
+			match = (elem->arg == -1 || elem->arg == value);
+			break;
+		case MAP_TYPE_VAL:
+			match = (elem->val == value);
+			break;
+		}
+
+		if (param == elem->param && match)
+			return elem;
+	}
+
+	return NULL;
+}
+
+int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *config)
+{
+	const enum pin_config_param param = pinconf_to_config_param(*config);
+	const struct aspeed_pin_config_map *pmap;
+	const struct aspeed_pinctrl_data *pdata;
+	const struct aspeed_pin_config *pconf;
+	unsigned int val;
+	int rc = 0;
+	u32 arg;
+
+	pdata = pinctrl_dev_get_drvdata(pctldev);
+	pconf = find_pinconf_config(pdata, offset, param);
+	if (!pconf)
+		return -ENOTSUPP;
+
+	rc = regmap_read(pdata->maps[ASPEED_IP_SCU], pconf->reg, &val);
+	if (rc < 0)
+		return rc;
+
+	pmap = find_pinconf_map(param, MAP_TYPE_VAL,
+			(val & BIT(pconf->bit)) >> pconf->bit);
+
+	if (!pmap)
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		arg = (u32) pmap->arg;
+	else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
+		arg = !!pmap->arg;
+	else
+		arg = 1;
+
+	if (!arg)
+		return -EINVAL;
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *configs, unsigned int num_configs)
+{
+	const struct aspeed_pinctrl_data *pdata;
+	unsigned int i;
+	int rc = 0;
+
+	pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	for (i = 0; i < num_configs; i++) {
+		const struct aspeed_pin_config_map *pmap;
+		const struct aspeed_pin_config *pconf;
+		enum pin_config_param param;
+		unsigned int val;
+		u32 arg;
+
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		pconf = find_pinconf_config(pdata, offset, param);
+		if (!pconf)
+			return -ENOTSUPP;
+
+		pmap = find_pinconf_map(param, MAP_TYPE_ARG, arg);
+
+		if (unlikely(WARN_ON(!pmap)))
+			return -EINVAL;
+
+		val = pmap->val << pconf->bit;
+
+		rc = regmap_update_bits(pdata->maps[ASPEED_IP_SCU], pconf->reg,
+				BIT(pconf->bit), val);
+
+		if (rc < 0)
+			return rc;
+
+		pr_debug("%s: Set SCU%02X[%d]=%d for param %d(=%d) on pin %d\n",
+				__func__, pconf->reg, pconf->bit, pmap->val,
+				param, arg, offset);
+	}
+
+	return 0;
+}
+
+int aspeed_pin_config_group_get(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int rc;
+
+	rc = aspeed_pinctrl_get_group_pins(pctldev, selector, &pins, &npins);
+	if (rc < 0)
+		return rc;
+
+	if (!npins)
+		return -ENODEV;
+
+	rc = aspeed_pin_config_get(pctldev, pins[0], config);
+
+	return rc;
+}
+
+int aspeed_pin_config_group_set(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *configs,
+		unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int rc;
+	int i;
+
+	pr_debug("%s: Fetching pins for group selector %d\n",
+			__func__, selector);
+	rc = aspeed_pinctrl_get_group_pins(pctldev, selector, &pins, &npins);
+	if (rc < 0)
+		return rc;
+
+	for (i = 0; i < npins; i++) {
+		rc = aspeed_pin_config_set(pctldev, pins[i], configs,
+				num_configs);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 08a10d4db229..fa125db828f5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -514,6 +514,20 @@ struct aspeed_pin_desc {
 	SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
 	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(gpio))
 
+/**
+ * @param The pinconf parameter type
+ * @pins The pin range this config struct covers, [low, high]
+ * @reg The register housing the configuration bits
+ * @mask The mask to select the bits of interest in @reg
+ */
+struct aspeed_pin_config {
+	enum pin_config_param param;
+	unsigned int pins[2];
+	unsigned int reg;
+	u8 bit;
+	u8 value;
+};
+
 struct aspeed_pinctrl_data {
 	struct regmap *maps[ASPEED_NR_PINMUX_IPS];
 
@@ -525,6 +539,9 @@ struct aspeed_pinctrl_data {
 
 	const struct aspeed_pin_function *functions;
 	const unsigned int nfunctions;
+
+	const struct aspeed_pin_config *configs;
+	const unsigned int nconfigs;
 };
 
 #define ASPEED_PINCTRL_PIN(name_) \
@@ -580,5 +597,16 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 int aspeed_pinctrl_probe(struct platform_device *pdev,
 		struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
+int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *config);
+int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
+		unsigned long *configs, unsigned int num_configs);
+int aspeed_pin_config_group_get(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *config);
+int aspeed_pin_config_group_set(struct pinctrl_dev *pctldev,
+		unsigned int selector,
+		unsigned long *configs,
+		unsigned int num_configs);
 
 #endif /* PINCTRL_ASPEED */
-- 
2.9.3
