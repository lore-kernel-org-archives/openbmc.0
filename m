Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rsWNt45W"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBhc5G76zF3Hh
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:16 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id r5-v6so70704pgv.0
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SL1s242LPlVjRBnk0K8pdJKHfyuaTnMWD9CPfsEQfnk=;
 b=rsWNt45WUgNMT2gTDLVaATCcKbQ543xGAVzdmCOBsCAt6qesLGwE5Iu9RNlMyZqilg
 24daXj2PqK3/XpRyK4RVKQhIHsd8d4uD/rWrXZSEeCdT2puRbVG3MKdAzUKIbB+CultV
 QHOclL5M94Nji5D+IZQr7detBD6tp/zybmeCXwmNrordKbwhlJP0VL0oQ95wk5FhNeRd
 b0BUZxSGk3OSHr/8D41PPsAjQ3rb3jS4od6RHC37UPQw3lGGzL/XSNwE9aIuL4G9z8LY
 Rnm9zyFE3wM1i59ypqlp4vCNJLTHbrRlslWyvA7aUF3LeiUg2sjrPZa2EftfHZOa2As4
 22Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SL1s242LPlVjRBnk0K8pdJKHfyuaTnMWD9CPfsEQfnk=;
 b=GJn2FhoAb5oEASUdztzZUxoY3pLYXc6bgh4dVqEUSg9l/MZC15YIwgMtP21Xrq7BdA
 8vWfr2Q3VTYz2qjekkPRrJhK0EoSG5If6Khy8W0wOyv8zijwELMF1V8/3TLcxnmhJ1S9
 sKuhqWnb7jxi1G3UrvbSV9dxQehFBeFbGWC1TMFO5+N/Kb9vzbOAMSnI8l4DNKSSEyn1
 XAfxg/L86YVg/d4wso433JgDzVJ9GwK7lMTqumKYOprqCOCxkV5zbUUSdtJPxcpVD9TP
 8gVYRH6SuXXz2MkHqoRAmd57dwQNj9jqYvGMUUrkm5yx4tmK4A61JFvjZPFK8jyxjrE5
 6wLw==
X-Gm-Message-State: AOUpUlGN27Zo9VQ+mzDEl3NcLC6kiHwkG17tMl1qKQ8uy79Vyn3Gg2z3
 AmvPs+PQqSiCcIT7e1oUYaxCRQ==
X-Google-Smtp-Source: AAOMgpdOxjEHXZTlwFMD/mZKq/Ay00qSvBOofWRX1C9x2yasZxH/QTeZDcUH7ovbjHtkFBRl4VaZWg==
X-Received: by 2002:a62:1219:: with SMTP id
 a25-v6mr545902pfj.104.1531812493927; 
 Tue, 17 Jul 2018 00:28:13 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:12 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 2/7] clk: Aspeed: Add sdhci reset and clock
Date: Tue, 17 Jul 2018 15:26:13 +0800
Message-Id: <1531812378-14316-3-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 07:28:17 -0000

1.Add Aspeed sdhci reset for SCU04 bit 16
2.Aspeed sdhci have two clock one is for controller clock,
another is for SD card clock. so when enable sdhci need enable
both.

v0->V2
Use aspeed_resets[ASPEED_RESET_SDHCI] replace the maginc number 16
move aspeed_resets in front of aspeed_clk_enable function

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/clk/clk-aspeed.c                 | 44 ++++++++++++++++++--------------
 include/dt-bindings/clock/aspeed-clock.h |  2 +-
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 9e55743..f399da2 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -20,6 +20,7 @@
 
 #define ASPEED_RESET_CTRL	0x04
 #define ASPEED_CLK_SELECTION	0x08
+#define  ASPEED_SDIO_CLK_EN BIT(15)
 #define ASPEED_CLK_STOP_CTRL	0x0c
 #define ASPEED_MPLL_PARAM	0x20
 #define ASPEED_HPLL_PARAM	0x24
@@ -208,6 +209,25 @@ static const struct aspeed_clk_soc_data ast2400_data = {
 	.calc_pll = aspeed_ast2400_calc_pll,
 };
 
+static const u8 aspeed_resets[] = {
+	/* SCU04 resets */
+	[ASPEED_RESET_XDMA]	= 25,
+	[ASPEED_RESET_MCTP]	= 24,
+	[ASPEED_RESET_ADC]	= 23,
+	[ASPEED_RESET_JTAG_MASTER] = 22,
+	[ASPEED_RESET_MIC]	= 18,
+	[ASPEED_RESET_PWM]	=  9,
+	[ASPEED_RESET_PECI]	= 10,
+	[ASPEED_RESET_I2C]	=  2,
+	[ASPEED_RESET_AHB]	=  1,
+	[ASPEED_RESET_SDHCI]	= 16,
+	/*
+	 * SCUD4 resets start at an offset to separate them from
+	 * the SCU04 resets.
+	 */
+	[ASPEED_RESET_CRT1]	= ASPEED_RESET2_OFFSET + 5,
+};
+
 static int aspeed_clk_is_enabled(struct clk_hw *hw)
 {
 	struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
@@ -260,6 +280,11 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
 	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
 
+	/* sd ext clk */
+	if (gate->reset_idx == aspeed_resets[ASPEED_RESET_SDHCI]) {
+		regmap_update_bits(gate->map, ASPEED_CLK_SELECTION, ASPEED_SDIO_CLK_EN, ASPEED_SDIO_CLK_EN);
+	}
+
 	if (gate->reset_idx >= 0) {
 		/* A delay of 10ms is specified by the ASPEED docs */
 		mdelay(10);
@@ -306,25 +331,6 @@ struct aspeed_reset {
 
 #define to_aspeed_reset(p) container_of((p), struct aspeed_reset, rcdev)
 
-static const u8 aspeed_resets[] = {
-	/* SCU04 resets */
-	[ASPEED_RESET_XDMA]	= 25,
-	[ASPEED_RESET_MCTP]	= 24,
-	[ASPEED_RESET_ADC]	= 23,
-	[ASPEED_RESET_JTAG_MASTER] = 22,
-	[ASPEED_RESET_MIC]	= 18,
-	[ASPEED_RESET_PWM]	=  9,
-	[ASPEED_RESET_PECI]	= 10,
-	[ASPEED_RESET_I2C]	=  2,
-	[ASPEED_RESET_AHB]	=  1,
-
-	/*
-	 * SCUD4 resets start at an offset to separate them from
-	 * the SCU04 resets.
-	 */
-	[ASPEED_RESET_CRT1]	= ASPEED_RESET2_OFFSET + 5,
-};
-
 static int aspeed_reset_deassert(struct reset_controller_dev *rcdev,
 				 unsigned long id)
 {
diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index 4476184..088553f 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -50,5 +50,5 @@
 #define ASPEED_RESET_I2C		7
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
-
+#define ASPEED_RESET_SDHCI		10
 #endif
-- 
2.7.4
