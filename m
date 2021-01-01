Return-Path: <SRS0=6QMd=GE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD29CC433DB
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 12:48:59 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FC1122202
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 12:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FC1122202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6lFj03cDzDqN6
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 23:48:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6kxY5Yr4zDqFv
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jan 2021 23:34:56 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 101CNg8l027195;
 Fri, 1 Jan 2021 14:23:42 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id B4A7363A17; Fri,  1 Jan 2021 14:23:42 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 08/11] pinctrl: npcm7xx: Add pin persist
 configuration support
Date: Fri,  1 Jan 2021 14:23:25 +0200
Message-Id: <20210101122328.43510-9-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210101122328.43510-1-tmaimon77@gmail.com>
References: <20210101122328.43510-1-tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index e5f58ea89917..ec12efd23bbe 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -36,6 +36,19 @@
 
 #define SRCNT_ESPI		BIT(3)
 
+/* reset registers */
+#define NPCM7XX_RST_WD0RCR	0x38
+#define NPCM7XX_RST_WD1RCR	0x3C
+#define NPCM7XX_RST_WD2RCR	0x40
+#define NPCM7XX_RST_SWRSTC1	0x44
+#define NPCM7XX_RST_SWRSTC2	0x48
+#define NPCM7XX_RST_SWRSTC3	0x4C
+#define NPCM7XX_RST_SWRSTC4	0x50
+#define NPCM7XX_RST_CORSTC	0x5C
+
+#define GPIOX_MODULE_RESET	BIT(16)
+#define CA9C_MODULE_RESET	BIT(0)
+
 /* GPIO registers */
 #define NPCM7XX_GP_N_TLOCK1	0x00
 #define NPCM7XX_GP_N_DIN	0x04 /* Data IN */
@@ -94,6 +107,7 @@ struct npcm7xx_pinctrl {
 	struct npcm7xx_gpio	gpio_bank[NPCM7XX_GPIO_BANK_NUM];
 	struct irq_domain	*domain;
 	struct regmap		*gcr_regmap;
+	struct regmap		*rst_regmap;
 	void __iomem		*regs;
 	u32			bank_num;
 };
@@ -1583,6 +1597,48 @@ static int npcm7xx_set_drive_strength(struct npcm7xx_pinctrl *npcm,
 	return -ENOTSUPP;
 }
 
+static int npcm7xx_gpio_reset_persist(struct npcm7xx_pinctrl *npcm,
+					unsigned int pin, int enable)
+{
+	struct npcm7xx_gpio *bank =
+		&npcm->gpio_bank[pin / NPCM7XX_GPIO_PER_BANK];
+	int banknum = pin / bank->gc.ngpio;
+
+	if (enable) {
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD0RCR,
+				   GPIOX_MODULE_RESET << banknum, 0);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD1RCR,
+				   GPIOX_MODULE_RESET << banknum, 0);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD2RCR,
+				   GPIOX_MODULE_RESET << banknum, 0);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_CORSTC,
+				   GPIOX_MODULE_RESET << banknum, 0);
+	} else {
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD0RCR,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD1RCR,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD2RCR,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_CORSTC,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+	}
+
+	return 0;
+}
+
 /* pinctrl_ops */
 static void npcm7xx_pin_dbg_show(struct pinctrl_dev *pctldev,
 				 struct seq_file *s, unsigned int offset)
@@ -1852,6 +1908,8 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
 		return npcm7xx_set_slew_rate(bank, npcm->gcr_regmap, pin, arg);
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		return npcm7xx_set_drive_strength(npcm, pin, arg);
+	case PIN_CONFIG_PERSIST_STATE:
+		return npcm7xx_gpio_reset_persist(npcm, pin, arg);
 	default:
 		return -ENOTSUPP;
 	}
@@ -2051,6 +2109,13 @@ static int npcm7xx_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctrl->gcr_regmap);
 	}
 
+	pctrl->rst_regmap =
+		syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
+	if (IS_ERR(pctrl->rst_regmap)) {
+		dev_err(pctrl->dev, "didn't find nuvoton,npcm750-rst\n");
+		return PTR_ERR(pctrl->rst_regmap);
+	}
+
 	ret = npcm7xx_gpio_of(pctrl);
 	if (ret < 0) {
 		dev_err(pctrl->dev, "Failed to gpio dt-binding %u\n", ret);
-- 
2.22.0

