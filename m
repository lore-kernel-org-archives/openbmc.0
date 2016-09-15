Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZbPs6jSyzDsTX
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 21:13:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=hXfRHM+N; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id p2so2012787pap.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=K9Ibq9uQuaCFkuRvMXZo1Os2Q7B8R5h5YzsWvxFt1gw=;
 b=hXfRHM+N1Ta5NiWkDVIs9NuZe2dM9PZU6YVhnH3nqgcbuZbcaLRw+jYYxoRfTt8iQ5
 wI4XT5k12Y22cRc0qo49UlvhQXsJNElUhTqIVOUMEKWC3Blf9qjzWqU1QlMc6yws5eR7
 M3EV9vwwpsfDTW/ku2796e13S6XShvfUaTXWJSJBcDUbSDOSoGLrUSQyWuHyeUFHiFUN
 oWZ+YlFvug4cYv1nIbzfokju6oFK23E20rNO/hEkbgmhRNDxMDbDhgT7knDaZ3fagKO/
 MNHx2Om8GZjVfLcqRksusmlj2m4U0Pm0yME4edpgWVYpXyj5v5Lkupu5BFypCsWzNy68
 z4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=K9Ibq9uQuaCFkuRvMXZo1Os2Q7B8R5h5YzsWvxFt1gw=;
 b=EJN9iB8aOlFWx62DGom00bb8DLZxUhnArpiSFEVl2aKTPnbgxTbT4Eo2LGBCByt/EG
 vV3sWsrYGKh1Jkf/7urGkEEWPWQq4Mr6wxWIBlBs8C406MI3/vtq/dR0T1vnKwiR8J3g
 yx+bdEJwV8b7fyCCcfWJkZsoHYGL6PlUkxcsvwO9qoeQSDsyNgx3DzENXNFU27HZK0f3
 SHP0rIQk56KWgGTJAG5HaDwj1sFqUB/W4d2WiEmmxcoYaH/TspUqSdlwzsEUl5t52U9J
 CvrU/Eg7uknW3fD0ArXX03eitq9ooXERK2aSnZrBBom86TkIf0nLrLMgXefRUH/I+ijD
 VbLA==
X-Gm-Message-State: AE9vXwNm3yJXAKdH76c1wcs3vhe9FFgGs8KFbEJIW6XHkHu/VOCtswrwmQpUb9WkDH+OpQ==
X-Received: by 10.66.23.69 with SMTP id k5mr13726434paf.144.1473938013767;
 Thu, 15 Sep 2016 04:13:33 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:7414:b01f:d849:6117])
 by smtp.gmail.com with ESMTPSA id t21sm44507729pfa.71.2016.09.15.04.13.29
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 15 Sep 2016 04:13:32 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 15 Sep 2016 20:43:24 +0930
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 1/3] pinctrl: aspeed: Add SPI pins to G5
Date: Thu, 15 Sep 2016 20:43:06 +0930
Message-Id: <20160915111308.31481-1-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Thu, 15 Sep 2016 11:13:38 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 89 ++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index a0b1d4ee3b5e..6e5b90e62e99 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -140,6 +140,77 @@ MS_PIN_DECL(D21, GPIOD3, SD2DAT1, GPID1OUT);
 
 FUNC_GROUP_DECL(GPID1, D20, D21);
 
+#define SYSSPI_DESC SIG_DESC_SET(HW_STRAP1, 13)
+
+#define C18 64
+SIG_EXPR_LIST_DECL_SINGLE(SYSCS, SYSSPI, COND1, SYSSPI_DESC);
+SS_PIN_DECL(C18, GPIOI0, SYSCS);
+
+#define E15 65
+SIG_EXPR_LIST_DECL_SINGLE(SYSCK, SYSSPI, COND1, SYSSPI_DESC);
+SS_PIN_DECL(E15, GPIOI1, SYSCK);
+
+#define B16 66 
+SIG_EXPR_LIST_DECL_SINGLE(SYSMOSI, SYSSPI, COND1, SYSSPI_DESC);
+SS_PIN_DECL(B16, GPIOI2, SYSMOSI);
+
+#define C16 67 
+SIG_EXPR_LIST_DECL_SINGLE(SYSMISO, SYSSPI, COND1, SYSSPI_DESC);
+SS_PIN_DECL(C16, GPIOI3, SYSMISO);
+
+FUNC_GROUP_DECL(SYSSPI, C18, E15, B16, C16);
+
+#define SPI1_MASTER_DESC	{ HW_STRAP1, GENMASK(13, 12), 1, 0 }
+#define SPI1_DEBUG_DESC		{ HW_STRAP1, GENMASK(13, 12), 2, 0 }
+#define SPI1_PASSTHRU_DESC	{ HW_STRAP1, GENMASK(13, 12), 3, 0 }
+
+#define VB_DESC	SIG_DESC_SET(HW_STRAP1, 5)
+
+#define B15 68 
+SIG_EXPR_DECL(SPI1CS0, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
+SIG_EXPR_DECL(SPI1CS0, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
+SIG_EXPR_DECL(SPI1CS0, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
+SIG_EXPR_LIST_DECL(SPI1CS0, SIG_EXPR_PTR(SPI1CS0, SPI1_MASTER),
+			    SIG_EXPR_PTR(SPI1CS0, SPI1_DEBUG),
+			    SIG_EXPR_PTR(SPI1CS0, SPI1_PASSTHRU));
+SIG_EXPR_LIST_DECL_SINGLE(VBCS, VGABIOS_ROM, COND1, VB_DESC);
+MS_PIN_DECL(B15, GPIOI4, SPI1CS0, VBCS);
+		
+#define C15 69
+SIG_EXPR_DECL(SPI1CK, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
+SIG_EXPR_DECL(SPI1CK, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
+SIG_EXPR_DECL(SPI1CK, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
+SIG_EXPR_LIST_DECL(SPI1CK, SIG_EXPR_PTR(SPI1CK, SPI1_MASTER),
+			    SIG_EXPR_PTR(SPI1CK, SPI1_DEBUG),
+			    SIG_EXPR_PTR(SPI1CK, SPI1_PASSTHRU));
+SIG_EXPR_LIST_DECL_SINGLE(VBCK, VGABIOS_ROM, COND1, VB_DESC);
+MS_PIN_DECL(C15, GPIOI5, SPI1CK, VBCK);
+
+#define A14 70
+SIG_EXPR_DECL(SPI1MOSI, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
+SIG_EXPR_DECL(SPI1MOSI, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
+SIG_EXPR_DECL(SPI1MOSI, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
+SIG_EXPR_LIST_DECL(SPI1MOSI, SIG_EXPR_PTR(SPI1MOSI, SPI1_MASTER),
+			    SIG_EXPR_PTR(SPI1MOSI, SPI1_DEBUG),
+			    SIG_EXPR_PTR(SPI1MOSI, SPI1_PASSTHRU));
+SIG_EXPR_LIST_DECL_SINGLE(VBMOSI, VGABIOS_ROM, COND1, VB_DESC);
+MS_PIN_DECL(A14, GPIOI6, SPI1MOSI, VBMOSI);
+
+#define A15 71
+SIG_EXPR_DECL(SPI1MISO, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
+SIG_EXPR_DECL(SPI1MISO, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
+SIG_EXPR_DECL(SPI1MISO, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
+SIG_EXPR_LIST_DECL(SPI1MISO, SIG_EXPR_PTR(SPI1MISO, SPI1_MASTER),
+			    SIG_EXPR_PTR(SPI1MISO, SPI1_DEBUG),
+			    SIG_EXPR_PTR(SPI1MISO, SPI1_PASSTHRU));
+SIG_EXPR_LIST_DECL_SINGLE(VBMISO, VGABIOS_ROM, COND1, VB_DESC);
+MS_PIN_DECL(A15, GPIOI7, SPI1MISO, VBMISO);
+
+FUNC_GROUP_DECL(SPI1_MASTER, B15, C15, A14, A15); 
+FUNC_GROUP_DECL(SPI1_DEBUG, B15, C15, A14, A15); 
+FUNC_GROUP_DECL(SPI1_PASSTHRU, B15, C15, A14, A15); 
+FUNC_GROUP_DECL(VGABIOS_ROM, B15, C15, A14, A15); 
+
 #define I2C5_DESC       SIG_DESC_SET(SCU90, 18)
 
 #define L3 80
@@ -492,6 +563,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A11),
 	ASPEED_PINCTRL_PIN(A12),
 	ASPEED_PINCTRL_PIN(A13),
+	ASPEED_PINCTRL_PIN(A14),
+	ASPEED_PINCTRL_PIN(A15),
 	ASPEED_PINCTRL_PIN(A2),
 	ASPEED_PINCTRL_PIN(A3),
 	ASPEED_PINCTRL_PIN(A4),
@@ -501,6 +574,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(B1),
 	ASPEED_PINCTRL_PIN(B11),
 	ASPEED_PINCTRL_PIN(B12),
+	ASPEED_PINCTRL_PIN(B15),
+	ASPEED_PINCTRL_PIN(B16),
 	ASPEED_PINCTRL_PIN(B2),
 	ASPEED_PINCTRL_PIN(B3),
 	ASPEED_PINCTRL_PIN(B4),
@@ -510,6 +585,9 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(C11),
 	ASPEED_PINCTRL_PIN(C12),
 	ASPEED_PINCTRL_PIN(C14),
+	ASPEED_PINCTRL_PIN(C15),
+	ASPEED_PINCTRL_PIN(C16),
+	ASPEED_PINCTRL_PIN(C18),
 	ASPEED_PINCTRL_PIN(C2),
 	ASPEED_PINCTRL_PIN(C3),
 	ASPEED_PINCTRL_PIN(C4),
@@ -527,6 +605,7 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(D9),
 	ASPEED_PINCTRL_PIN(E10),
 	ASPEED_PINCTRL_PIN(E12),
+	ASPEED_PINCTRL_PIN(E15),
 	ASPEED_PINCTRL_PIN(E21),
 	ASPEED_PINCTRL_PIN(E6),
 	ASPEED_PINCTRL_PIN(E7),
@@ -581,6 +660,11 @@ static const struct aspeed_pin_group aspeed_g5_groups[] = {
 	ASPEED_PINCTRL_GROUP(RGMII1),
 	ASPEED_PINCTRL_GROUP(RMII2),
 	ASPEED_PINCTRL_GROUP(RGMII2),
+	ASPEED_PINCTRL_GROUP(SPI1_MASTER),
+	ASPEED_PINCTRL_GROUP(SPI1_DEBUG),
+	ASPEED_PINCTRL_GROUP(SPI1_PASSTHRU),
+	ASPEED_PINCTRL_GROUP(VGABIOS_ROM),
+	ASPEED_PINCTRL_GROUP(SYSSPI),
 };
 
 static const struct aspeed_pin_function aspeed_g5_functions[] = {
@@ -612,6 +696,11 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
 	ASPEED_PINCTRL_FUNC(RGMII1),
 	ASPEED_PINCTRL_FUNC(RMII2),
 	ASPEED_PINCTRL_FUNC(RGMII2),
+	ASPEED_PINCTRL_FUNC(SPI1_MASTER),
+	ASPEED_PINCTRL_FUNC(SPI1_DEBUG),
+	ASPEED_PINCTRL_FUNC(SPI1_PASSTHRU),
+	ASPEED_PINCTRL_FUNC(VGABIOS_ROM),
+	ASPEED_PINCTRL_FUNC(SYSSPI),
 };
 
 static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
-- 
2.9.3
