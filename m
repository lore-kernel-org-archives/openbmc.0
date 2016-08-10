Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8Qd73G6LzDr0Z
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 19:21:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ksZzmhVt; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id hh10so2548895pac.1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=1ylVpfgABBDv9FAGwr4V6WbYQ/qr+RwU5utJEKWnX7c=;
 b=ksZzmhVtXRfATKI9ZLRGrPa2QmsfHin1D2KY+mlC/9pXIOIgMxq1BUo/VSMfteFiAQ
 zgmSkMfi8tBuHNJ7wh8EIDoeRHkBQcRYnrfWMA7Xe1YwWXhUyU6xNcwV05nOROXNPKNY
 eXigzXfpMgwidaqNN8RQewPcGjPzV0z3QEYKmFXbeOXoa5+RBsT1QL3kD8q/xMKW6cFb
 KAh51nRuW8etxTLcf7K3K1PntXNcMmJn0rWPmhLPQbBtykhXXSYIf7d/B0l6Vs0l0jWN
 7sqFpoQAdQkywoFK1izjfEt9OndvB9Yb/xgqzPqXOKICsW1S9Id/3TRJQlnJECyLZm1W
 huEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=1ylVpfgABBDv9FAGwr4V6WbYQ/qr+RwU5utJEKWnX7c=;
 b=GHPJ052mRDKdESv6RzemfTWlYw1IrNn0mt7sy6MDdNiFjaS2YTJkpSG/D1Utb5qIZA
 6AGMfR5kGkmZvhfE+ZBXA/U7768Taor08ZycKaYOoWYVTaIf3gimAr019Z5lyslj2ZFV
 j/QxlDwt+lDE1EAZ8hv0sIzxJmYz1qwHLSBFw9gkblrXhhROrCgBO3pjE/GMMMrknm+O
 lzwPhpzPTWYMizIocBC3s2NHi+qaLnfEBOM6hrxTfqY6HwlNRS9A0DwOD3bDlu0Q0+dC
 sEkvHxUlO8P3mV/b0hECBQcbJ0lZmceXY9sucyOKuogAhKWFAtp5Zr8HhkHh7i3Tuc5I
 6zog==
X-Gm-Message-State: AEkoouvHHp716E1KG9xFvrVwFioAWLYZSVU5LFlFBQ3nEmfBGaEB2jbq6qLAjE+v3ThIkw==
X-Received: by 10.66.221.229 with SMTP id qh5mr5303228pac.66.1470820888781;
 Wed, 10 Aug 2016 02:21:28 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id m128sm62060875pfm.42.2016.08.10.02.21.25
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 10 Aug 2016 02:21:28 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 10 Aug 2016 18:51:22 +0930
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] pinctrl/aspeed: Add GPIOR to g4 pinmux
Date: Wed, 10 Aug 2016 18:51:18 +0930
Message-Id: <1470820879-18661-1-git-send-email-joel@jms.id.au>
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
X-List-Received-Date: Wed, 10 Aug 2016 09:21:31 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 81 ++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index d36e14892d4e..96952bf33b9f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -585,6 +585,71 @@ SIG_EXPR_LIST_DECL(ROMCS1, SIG_EXPR_PTR(ROMCS1, ROM8),
 		SIG_EXPR_PTR(ROMCS1, ROM16S));
 MS_PIN_DECL_(V20, SIG_EXPR_LIST_PTR(ROMCS1), SIG_EXPR_LIST_PTR(GPIOR0));
 
+#define W21 137
+#define W21_DESC	SIG_DESC_SET(SCU88, 25)
+SIG_EXPR_LIST_DECL_SINGLE(GPIOR1, GPIOR1);
+SIG_EXPR_DECL(ROMCS2, ROM8, W21_DESC);
+SIG_EXPR_DECL(ROMCS2, ROM16, W21_DESC);
+SIG_EXPR_DECL(ROMCS2, ROM16S, W21_DESC);
+SIG_EXPR_LIST_DECL(ROMCS2, SIG_EXPR_PTR(ROMCS2, ROM8),
+		SIG_EXPR_PTR(ROMCS2, ROM16),
+		SIG_EXPR_PTR(ROMCS2, ROM16S));
+MS_PIN_DECL_(W21, SIG_EXPR_LIST_PTR(ROMCS2), SIG_EXPR_LIST_PTR(GPIOR1));
+
+#define Y22 138
+#define Y22_DESC	SIG_DESC_SET(SCU88, 26)
+SIG_EXPR_LIST_DECL_SINGLE(GPIOR2, GPIOR2);
+SIG_EXPR_DECL(ROMCS3, ROM8, Y22_DESC);
+SIG_EXPR_DECL(ROMCS3, ROM16, Y22_DESC);
+SIG_EXPR_DECL(ROMCS3, ROM16S, Y22_DESC);
+SIG_EXPR_LIST_DECL(ROMCS3, SIG_EXPR_PTR(ROMCS3, ROM8),
+		SIG_EXPR_PTR(ROMCS3, ROM16),
+		SIG_EXPR_PTR(ROMCS3, ROM16S));
+MS_PIN_DECL_(Y22, SIG_EXPR_LIST_PTR(ROMCS3), SIG_EXPR_LIST_PTR(GPIOR2));
+
+#define U19 139
+#define U19_DESC	SIG_DESC_SET(SCU88, 27)
+SIG_EXPR_LIST_DECL_SINGLE(GPIOR3, GPIOR3);
+SIG_EXPR_DECL(ROMCS4, ROM8, U19_DESC);
+SIG_EXPR_DECL(ROMCS4, ROM16, U19_DESC);
+SIG_EXPR_DECL(ROMCS4, ROM16S, U19_DESC);
+SIG_EXPR_LIST_DECL(ROMCS4, SIG_EXPR_PTR(ROMCS4, ROM8),
+		SIG_EXPR_PTR(ROMCS4, ROM16),
+		SIG_EXPR_PTR(ROMCS4, ROM16S));
+MS_PIN_DECL_(U19, SIG_EXPR_LIST_PTR(ROMCS4), SIG_EXPR_LIST_PTR(GPIOR3));
+
+#define V21 140
+#define V21_DESC	SIG_DESC_SET(SCU88, 28)
+SIG_EXPR_DECL(ROMA24, ROM8, V21_DESC);
+SIG_EXPR_DECL(ROMA24, ROM16, V21_DESC);
+SIG_EXPR_DECL(ROMA24, ROM16S, V21_DESC);
+SIG_EXPR_LIST_DECL(ROMA24, SIG_EXPR_PTR(ROMA24, ROM8),
+		SIG_EXPR_PTR(ROMA24, ROM16),
+		SIG_EXPR_PTR(ROMA24, ROM16S));
+SIG_EXPR_LIST_DECL_SINGLE(VPOR6, VPO24, V21_DESC, VPO_24_OFF);
+MS_PIN_DECL(V21, GPIOR4, ROMA24, VPOR6);
+
+#define W22 141
+#define W22_DESC	SIG_DESC_SET(SCU88, 29)
+SIG_EXPR_DECL(ROMA25, ROM8, W22_DESC);
+SIG_EXPR_DECL(ROMA25, ROM16, W22_DESC);
+SIG_EXPR_DECL(ROMA25, ROM16S, W22_DESC);
+SIG_EXPR_LIST_DECL(ROMA25, SIG_EXPR_PTR(ROMA25, ROM8),
+		SIG_EXPR_PTR(ROMA25, ROM16),
+		SIG_EXPR_PTR(ROMA25, ROM16S));
+SIG_EXPR_LIST_DECL_SINGLE(VPOR7, VPO24, W22_DESC, VPO_24_OFF);
+MS_PIN_DECL(W22, GPIOR5, ROMA25, VPOR7);
+
+#define C6 142
+SIG_EXPR_LIST_DECL_SINGLE(MDC1, MDIO1, SIG_DESC_SET(SCU88, 30));
+SS_PIN_DECL(C6, GPIOR6, MDC1);
+
+#define A5 143
+SIG_EXPR_LIST_DECL_SINGLE(MDIO1, MDIO1, SIG_DESC_SET(SCU88, 31));
+SS_PIN_DECL(A5, GPIOR7, MDIO1);
+
+FUNC_GROUP_DECL(MDIO1, C6, A5);
+
 #define U21 144
 #define U21_DESC        SIG_DESC_SET(SCU8C, 0)
 SIG_EXPR_DECL(ROMD4, ROM8, U21_DESC, VPOOFF0_DESC);
@@ -681,11 +746,12 @@ SIG_EXPR_LIST_DECL(ROMA23, SIG_EXPR_PTR(ROMA23, ROM8),
 SIG_EXPR_LIST_DECL_SINGLE(VPOR5, VPO24, K18_DESC, VPO_24_OFF);
 MS_PIN_DECL(K18, GPIOS7, ROMA23, VPOR5);
 
-FUNC_GROUP_DECL(ROM8, V20, U21, T19, V22, U20, R18, N21, L22, K18);
+FUNC_GROUP_DECL(ROM8, V20, U21, T19, V22, U20, R18, N21, L22, K18, W21, Y22,
+		U19);
 FUNC_GROUP_DECL(ROM16, V20, U21, T19, V22, U20, R18, N21, L22, K18,
-		A8, C7, B7, A7, D7, B6, A6, E7);
+		A8, C7, B7, A7, D7, B6, A6, E7, W21, Y22, U19);
 FUNC_GROUP_DECL(VPO12, U21, T19, V22, U20);
-FUNC_GROUP_DECL(VPO24, U21, T19, V22, U20, L22, K18);
+FUNC_GROUP_DECL(VPO24, U21, T19, V22, U20, L22, K18, V21, W22);
 
 #define RMII1_DESC      SIG_DESC_BIT(HW_STRAP1, 6, 0)
 
@@ -792,6 +858,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A2),
 	ASPEED_PINCTRL_PIN(A3),
 	ASPEED_PINCTRL_PIN(A4),
+	ASPEED_PINCTRL_PIN(A5),
 	ASPEED_PINCTRL_PIN(A6),
 	ASPEED_PINCTRL_PIN(A7),
 	ASPEED_PINCTRL_PIN(A8),
@@ -820,6 +887,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(C3),
 	ASPEED_PINCTRL_PIN(C4),
 	ASPEED_PINCTRL_PIN(C5),
+	ASPEED_PINCTRL_PIN(C6),
 	ASPEED_PINCTRL_PIN(C7),
 	ASPEED_PINCTRL_PIN(D1),
 	ASPEED_PINCTRL_PIN(D11),
@@ -861,6 +929,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(T5),
 	ASPEED_PINCTRL_PIN(U1),
 	ASPEED_PINCTRL_PIN(U18),
+	ASPEED_PINCTRL_PIN(U19),
 	ASPEED_PINCTRL_PIN(U2),
 	ASPEED_PINCTRL_PIN(U20),
 	ASPEED_PINCTRL_PIN(U21),
@@ -870,11 +939,15 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(V1),
 	ASPEED_PINCTRL_PIN(V2),
 	ASPEED_PINCTRL_PIN(V20),
+	ASPEED_PINCTRL_PIN(V21),
 	ASPEED_PINCTRL_PIN(V22),
 	ASPEED_PINCTRL_PIN(V6),
 	ASPEED_PINCTRL_PIN(W1),
+	ASPEED_PINCTRL_PIN(W21),
+	ASPEED_PINCTRL_PIN(W22),
 	ASPEED_PINCTRL_PIN(W4),
 	ASPEED_PINCTRL_PIN(W5),
+	ASPEED_PINCTRL_PIN(Y22),
 	ASPEED_PINCTRL_PIN(Y3),
 	ASPEED_PINCTRL_PIN(Y4),
 	ASPEED_PINCTRL_PIN(Y5),
@@ -952,6 +1025,7 @@ static const struct aspeed_pin_group aspeed_g4_groups[] = {
 	ASPEED_PINCTRL_GROUP(VPO24),
 	ASPEED_PINCTRL_GROUP(RGMII1),
 	ASPEED_PINCTRL_GROUP(RMII1),
+	ASPEED_PINCTRL_GROUP(MDIO1),
 };
 
 static const struct aspeed_pin_function aspeed_g4_functions[] = {
@@ -1022,6 +1096,7 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
 	ASPEED_PINCTRL_FUNC(VPO24),
 	ASPEED_PINCTRL_FUNC(RGMII1),
 	ASPEED_PINCTRL_FUNC(RMII1),
+	ASPEED_PINCTRL_FUNC(MDIO1),
 };
 
 static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
-- 
2.8.1
