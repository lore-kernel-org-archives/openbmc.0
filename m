Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s78zY1HSSzDqS5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 18:03:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OlYLvkkB; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id g202so24629436pfb.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 Aug 2016 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=4m82F5Tbzr2TUC+dz4hyJXLqRHOwb12D8wnoLLQmpCg=;
 b=OlYLvkkBxwqcUao5ICHEGE3BIoz4CzOvQlOCTOvimvERLePQbiOAJobdoH/o+/2P3Y
 7d5ilIHUVCh7n4X3fcnw9avmqJqVzKXotRqsSz27ls8vLAC/KCrD+JBvD8JgVm/da9ar
 fUqbmX4m89o23ETI/b1Mroi1g11LR+H0zeJsDE5ssFCoBaTOfJtBjwnuOaZYrgUaFD3w
 1rhpr/GPH2L2cw8QnVQa+lHVAi/M2AvwS9Jmd3wgPzRZodts0k50IfduZZRGFZ+Y+9Xz
 jkx+54tMwIO6iJ0x51Cso9WiO0J04a35MY1G/EevM1pl2OTz4OimgXVq86waOKxR2ulC
 wbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=4m82F5Tbzr2TUC+dz4hyJXLqRHOwb12D8wnoLLQmpCg=;
 b=gcScuwaWYskqevwC5YXvHlGLkED9Se/5j+V7MibBUYPzNfVp2iV9V4yD0x1xuVXLCo
 PZ3BNiBracj/jhlvuwX6S48lrAJzxyXb5vec5jiklC/uQflYNspHddcp2Q9LLPUvh02u
 0zgLxYxBJtUeXerFBWYKH4UD4vcXleOiMpYK/rbkm254wd/l3fOe/xDrBd3A1SzOijd8
 S+GSb3bUlpWHJZAd3L1XjznmuCiy2Uu8qakJVRelHz9lM74srl+CaRUnreJ4o2uRsBnF
 uF1KNSgZppX8RqHEf71iqBuhqat7lMhM3zarMUvnFlbYPhJf6BKZXw1ItK3k9rSv/Jc1
 UORw==
X-Gm-Message-State: AEkooutxI5vUaLo5VowZK5bNFlf51SsYeqMX5hQCXTM9UWE6odJFeRn4a9BcyGfPqISuMA==
X-Received: by 10.98.89.23 with SMTP id n23mr160155481pfb.34.1470643383197;
 Mon, 08 Aug 2016 01:03:03 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id bw10sm45671707pac.27.2016.08.08.01.03.00
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 08 Aug 2016 01:03:02 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 08 Aug 2016 17:32:56 +0930
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [linux dev-4.7] pinctrl/aspeed: Add RGMII2/RMII2 for ast2500
Date: Mon,  8 Aug 2016 17:32:52 +0930
Message-Id: <1470643372-28221-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 08:03:05 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi           |  10 +++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 109 +++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 2daf0045173a..136c921a532b 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -191,6 +191,16 @@
 						function = "RMII1";
 						groups = "RMII1";
 					};
+
+					pinctrl_rgmii2_default: rgmii2_default {
+						function = "RGMII2";
+						groups = "RGMII2";
+					};
+
+					pinctrl_rmii2_default: rmii2_default {
+						function = "RMII2";
+						groups = "RMII2";
+					};
 				};
 			};
 
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index b1464ad7f06f..b9dd7be75766 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -395,6 +395,98 @@ MS_PIN_DECL_(C4, SIG_EXPR_LIST_PTR(GPIOV1), SIG_EXPR_LIST_PTR(RMII1RXER),
 FUNC_GROUP_DECL(RGMII1, B4, A4, A3, D6, C5, C4, B5, E9, F9, A5, E7, D7);
 FUNC_GROUP_DECL(RMII1, B4, A3, D6, C5, C4, B5, E9, F9, A5);
 
+/* RGMII2/RMII2 */
+
+#define RMII2_DESC      SIG_DESC_BIT(HW_STRAP1, 7, 0)
+
+#define B2 158
+SIG_EXPR_LIST_DECL_SINGLE(GPIOT6, GPIOT6, SIG_DESC_SET(SCUA0, 6));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2RCLKO, RMII2, RMII2_DESC,
+		SIG_DESC_SET(SCU48, 30));
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXCK, RGMII2);
+MS_PIN_DECL_(B2, SIG_EXPR_LIST_PTR(GPIOT6), SIG_EXPR_LIST_PTR(RMII2RCLKO),
+		SIG_EXPR_LIST_PTR(RGMII2TXCK));
+
+#define B1 159
+SIG_EXPR_LIST_DECL_SINGLE(GPIOT7, GPIOT7, SIG_DESC_SET(SCUA0, 7));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2TXEN, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXCTL, RGMII2);
+MS_PIN_DECL_(B1, SIG_EXPR_LIST_PTR(GPIOT7), SIG_EXPR_LIST_PTR(RMII2TXEN),
+		SIG_EXPR_LIST_PTR(RGMII2TXCTL));
+
+#define A2 160
+SIG_EXPR_LIST_DECL_SINGLE(GPIOU0, GPIOU0, SIG_DESC_SET(SCUA0, 8));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2TXD0, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD0, RGMII2);
+MS_PIN_DECL_(A2, SIG_EXPR_LIST_PTR(GPIOU0), SIG_EXPR_LIST_PTR(RMII2TXD0),
+		SIG_EXPR_LIST_PTR(RGMII2TXD0));
+
+#define B3 161
+SIG_EXPR_LIST_DECL_SINGLE(GPIOU1, GPIOU1, SIG_DESC_SET(SCUA0, 9));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2TXD1, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD1, RGMII2);
+MS_PIN_DECL_(B3, SIG_EXPR_LIST_PTR(GPIOU1), SIG_EXPR_LIST_PTR(RMII2TXD1),
+		SIG_EXPR_LIST_PTR(RGMII2TXD1));
+
+#define D5 162
+SIG_EXPR_LIST_DECL_SINGLE(GPIOU2, GPIOU2, SIG_DESC_SET(SCUA0, 10));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2DASH0, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD2, RGMII2);
+MS_PIN_DECL_(D5, SIG_EXPR_LIST_PTR(GPIOU2), SIG_EXPR_LIST_PTR(RMII2DASH0),
+		SIG_EXPR_LIST_PTR(RGMII2TXD2));
+
+#define D4 163
+SIG_EXPR_LIST_DECL_SINGLE(GPIOU3, GPIOU3, SIG_DESC_SET(SCUA0, 11));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2DASH1, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD3, RGMII2);
+MS_PIN_DECL_(D4, SIG_EXPR_LIST_PTR(GPIOU3), SIG_EXPR_LIST_PTR(RMII2DASH1),
+		SIG_EXPR_LIST_PTR(RGMII2TXD3));
+
+#define C2 170
+SIG_EXPR_LIST_DECL_SINGLE(GPIOV2, GPIOV2, SIG_DESC_SET(SCUA0, 18));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2RCLKI, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXCK, RGMII2);
+MS_PIN_DECL_(C2, SIG_EXPR_LIST_PTR(GPIOV2), SIG_EXPR_LIST_PTR(RMII2RCLKI),
+		SIG_EXPR_LIST_PTR(RGMII2RXCK));
+
+#define C1 171
+SIG_EXPR_LIST_DECL_SINGLE(GPIOV3, GPIOV3, SIG_DESC_SET(SCUA0, 19));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2DASH2, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXCTL, RGMII2);
+MS_PIN_DECL_(C1, SIG_EXPR_LIST_PTR(GPIOV3), SIG_EXPR_LIST_PTR(RMII2DASH2),
+		SIG_EXPR_LIST_PTR(RGMII2RXCTL));
+
+#define C3 172
+SIG_EXPR_LIST_DECL_SINGLE(GPIOV4, GPIOV4, SIG_DESC_SET(SCUA0, 20));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2RXD0, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD0, RGMII2);
+MS_PIN_DECL_(C3, SIG_EXPR_LIST_PTR(GPIOV4), SIG_EXPR_LIST_PTR(RMII2RXD0),
+		SIG_EXPR_LIST_PTR(RGMII2RXD0));
+
+#define D1 173
+SIG_EXPR_LIST_DECL_SINGLE(GPIOV5, GPIOV5, SIG_DESC_SET(SCUA0, 21));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2RXD1, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD1, RGMII2);
+MS_PIN_DECL_(D1, SIG_EXPR_LIST_PTR(GPIOV5), SIG_EXPR_LIST_PTR(RMII2RXD1),
+		SIG_EXPR_LIST_PTR(RGMII2RXD1));
+
+#define D2 174
+SIG_EXPR_LIST_DECL_SINGLE(GPIOV6, GPIOV6, SIG_DESC_SET(SCUA0, 22));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2CRSDV, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD2, RGMII2);
+MS_PIN_DECL_(D2, SIG_EXPR_LIST_PTR(GPIOV6), SIG_EXPR_LIST_PTR(RMII2CRSDV),
+		SIG_EXPR_LIST_PTR(RGMII2RXD2));
+
+#define E6 175
+SIG_EXPR_LIST_DECL_SINGLE(GPIOV7, GPIOV7, SIG_DESC_SET(SCUA0, 23));
+SIG_EXPR_LIST_DECL_SINGLE(RMII2RXER, RMII2, RMII2_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD3, RGMII2);
+MS_PIN_DECL_(E6, SIG_EXPR_LIST_PTR(GPIOV7), SIG_EXPR_LIST_PTR(RMII2RXER),
+		SIG_EXPR_LIST_PTR(RGMII2RXD3));
+
+FUNC_GROUP_DECL(RGMII2, B2, B1, A2, B3, D5, D4, C2, C1, C3, D1, D2, E6);
+FUNC_GROUP_DECL(RMII2, B2, B1, A2, B3, C2, C3, D1, D2, E6);
+
 static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(C14),
 	ASPEED_PINCTRL_PIN(A13),
@@ -434,12 +526,23 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(N22),
 	ASPEED_PINCTRL_PIN(D10),
 	ASPEED_PINCTRL_PIN(E12),
+	ASPEED_PINCTRL_PIN(A2),
+	ASPEED_PINCTRL_PIN(B3),
+	ASPEED_PINCTRL_PIN(D5),
+	ASPEED_PINCTRL_PIN(D4),
+	ASPEED_PINCTRL_PIN(A2),
 	ASPEED_PINCTRL_PIN(B4),
 	ASPEED_PINCTRL_PIN(A4),
 	ASPEED_PINCTRL_PIN(A3),
 	ASPEED_PINCTRL_PIN(D6),
 	ASPEED_PINCTRL_PIN(C5),
 	ASPEED_PINCTRL_PIN(C4),
+	ASPEED_PINCTRL_PIN(C2),
+	ASPEED_PINCTRL_PIN(C1),
+	ASPEED_PINCTRL_PIN(C3),
+	ASPEED_PINCTRL_PIN(D1),
+	ASPEED_PINCTRL_PIN(D2),
+	ASPEED_PINCTRL_PIN(E6),
 	ASPEED_PINCTRL_PIN(D8),
 	ASPEED_PINCTRL_PIN(E10),
 	ASPEED_PINCTRL_PIN(B5),
@@ -448,6 +551,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A5),
 	ASPEED_PINCTRL_PIN(E7),
 	ASPEED_PINCTRL_PIN(D7),
+	ASPEED_PINCTRL_PIN(B2),
+	ASPEED_PINCTRL_PIN(B1),
 };
 
 static const struct aspeed_pin_group aspeed_g5_groups[] = {
@@ -477,6 +582,8 @@ static const struct aspeed_pin_group aspeed_g5_groups[] = {
 	ASPEED_PINCTRL_GROUP(MDIO1),
 	ASPEED_PINCTRL_GROUP(RMII1),
 	ASPEED_PINCTRL_GROUP(RGMII1),
+	ASPEED_PINCTRL_GROUP(RMII2),
+	ASPEED_PINCTRL_GROUP(RGMII2),
 };
 
 static const struct aspeed_pin_function aspeed_g5_functions[] = {
@@ -506,6 +613,8 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
 	ASPEED_PINCTRL_FUNC(MDIO1),
 	ASPEED_PINCTRL_FUNC(RMII1),
 	ASPEED_PINCTRL_FUNC(RGMII1),
+	ASPEED_PINCTRL_FUNC(RMII2),
+	ASPEED_PINCTRL_FUNC(RGMII2),
 };
 
 static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
-- 
2.8.1
