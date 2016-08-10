Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8QdF69frzDr0c
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 19:21:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=y0u33vuP; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i6so2551791pfe.0
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bdCzGvN70sPTwj0S7O29kKkMF3O3fGL8QDINSyu0CcI=;
 b=y0u33vuPo85edxeTxm+aSCFu0zBrS9WKNJmPc/K+1YFE/dgx9+fHEC/ryh6OIhtUgq
 5QS6ZDCXz03qUP9rFhEIURPMc9i38EheiFXFzrPwwPh5X68vpIqg8uGSSQecE24gL7sZ
 I3v10LgwFAr02NhKxJVNK1NsPU/1tsH8Y4CGqzBTkaF7vPnP8qWVDl0YRBGW/o+1yYmV
 oJy84yZl9eH59LwL5hh5rtkHDJSLVLmXM2OOyIZUmxTHlxH8QolOpJ52WthCSTJ37EUi
 ko8jDQbKAVxXcEkGSuqyiD+9M1C/Btjus7Ly2z2X7jNduOBsyy+qHSzDyr5Stq2oJ7Fr
 g7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=bdCzGvN70sPTwj0S7O29kKkMF3O3fGL8QDINSyu0CcI=;
 b=KBk/uJZuFtdUNoM3wDG/iSh6rnYAoOQoZ4narApVt+Zo8CCfsdUcKYq6cYZcZhwdcS
 bMyaZW/Xw51pW2lm1vi8TiDHqmxWtAmE5q6pXS3xQ7F5Q597RZ9n9wkF9qlXvg4vTUqd
 ZoM6FdRBnSiaNdR0TVAdMUjoovgbPRWJ5J41gz2ij0fPzpljmT0fxmUmHzKhdaEWDrg1
 cAG1ybWjtk34m7vsteSIMowIp3TBoBXdRvQ4usSGpc9MqdYny378a4J3IiiaF8KIsSrT
 avjCJSI+wn30tsWi5hrEKp8uwQCsCOg37zret33tL2k9XgDAEvAOW3hMLZKTfm6fGeuG
 YXSA==
X-Gm-Message-State: AEkooutfFf9obVsdKUbi5xERsKvChgEKMwCZKkXimEN6KI19d6V9iGS7ua0ckZ9KB/FgJw==
X-Received: by 10.98.202.202 with SMTP id y71mr5395280pfk.10.1470820896136;
 Wed, 10 Aug 2016 02:21:36 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id c125sm62161706pfc.40.2016.08.10.02.21.32
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 10 Aug 2016 02:21:35 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 10 Aug 2016 18:51:29 +0930
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] pinctrl/aspeed: Add GPIOE to g4 pinmux
Date: Wed, 10 Aug 2016 18:51:19 +0930
Message-Id: <1470820879-18661-2-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470820879-18661-1-git-send-email-joel@jms.id.au>
References: <1470820879-18661-1-git-send-email-joel@jms.id.au>
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
X-List-Received-Date: Wed, 10 Aug 2016 09:21:38 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 84 ++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 96952bf33b9f..c7aa8519188a 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -172,6 +172,9 @@ FUNC_GROUP_DECL(GPID0, A18, D16);
 
 #define GPIE_DESC       SIG_DESC_SET(HW_STRAP1, 22)
 #define GPIE0_DESC      SIG_DESC_SET(SCU8C, 12)
+#define GPIE2_DESC      SIG_DESC_SET(SCU8C, 13)
+#define GPIE4_DESC      SIG_DESC_SET(SCU8C, 14)
+#define GPIE6_DESC      SIG_DESC_SET(SCU8C, 15)
 
 #define D15 32
 SIG_EXPR_LIST_DECL_SINGLE(NCTS3, NCTS3, SIG_DESC_SET(SCU80, 16));
@@ -192,6 +195,63 @@ MS_PIN_DECL(C15, GPIOE1, NDCD3, GPIE0OUT);
 FUNC_GROUP_DECL(NDCD3, C15);
 FUNC_GROUP_DECL(GPIE0, D15, C15);
 
+#define B15 34
+SIG_EXPR_LIST_DECL_SINGLE(NDSR3, NDSR3, SIG_DESC_SET(SCU80, 18));
+SIG_EXPR_DECL(GPIE2IN, GPIE2, GPIE2_DESC);
+SIG_EXPR_DECL(GPIE2IN, GPIE, GPIE_DESC);
+SIG_EXPR_LIST_DECL_DUAL(GPIE2IN, GPIE2, GPIE);
+MS_PIN_DECL(B15, GPIOE2, NDSR3, GPIE2IN);
+
+FUNC_GROUP_DECL(NDSR3, B15);
+
+#define A15 35
+SIG_EXPR_LIST_DECL_SINGLE(NRI3, NRI3, SIG_DESC_SET(SCU80, 19));
+SIG_EXPR_DECL(GPIE2OUT, GPIE2, GPIE2_DESC);
+SIG_EXPR_DECL(GPIE2OUT, GPIE, GPIE_DESC);
+SIG_EXPR_LIST_DECL_DUAL(GPIE2OUT, GPIE2, GPIE);
+MS_PIN_DECL(A15, GPIOE3, NRI3, GPIE2OUT);
+
+FUNC_GROUP_DECL(NRI3, A15);
+FUNC_GROUP_DECL(GPIE2, B15, A15);
+
+#define E14 36
+SIG_EXPR_LIST_DECL_SINGLE(NDTR3, NDTR3, SIG_DESC_SET(SCU80, 20));
+SIG_EXPR_DECL(GPIE4IN, GPIE4, GPIE4_DESC);
+SIG_EXPR_DECL(GPIE4IN, GPIE, GPIE_DESC);
+SIG_EXPR_LIST_DECL_DUAL(GPIE4IN, GPIE4, GPIE);
+MS_PIN_DECL(E14, GPIOE4, NDTR3, GPIE4IN);
+
+FUNC_GROUP_DECL(NDTR3, E14);
+
+#define D14 37
+SIG_EXPR_LIST_DECL_SINGLE(NRTS3, NRTS3, SIG_DESC_SET(SCU80, 21));
+SIG_EXPR_DECL(GPIE4OUT, GPIE4, GPIE4_DESC);
+SIG_EXPR_DECL(GPIE4OUT, GPIE, GPIE_DESC);
+SIG_EXPR_LIST_DECL_DUAL(GPIE4OUT, GPIE4, GPIE);
+MS_PIN_DECL(D14, GPIOE5, NRTS3, GPIE4OUT);
+
+FUNC_GROUP_DECL(NRTS3, D14);
+FUNC_GROUP_DECL(GPIE4, E14, D14);
+
+#define C14 38
+SIG_EXPR_LIST_DECL_SINGLE(TXD3, TXD3, SIG_DESC_SET(SCU80, 22));
+SIG_EXPR_DECL(GPIE6IN, GPIE6, GPIE6_DESC);
+SIG_EXPR_DECL(GPIE6IN, GPIE, GPIE_DESC);
+SIG_EXPR_LIST_DECL_DUAL(GPIE6IN, GPIE6, GPIE);
+MS_PIN_DECL(C14, GPIOE6, TXD3, GPIE6IN);
+
+FUNC_GROUP_DECL(TXD3, C14);
+
+#define B14 39
+SIG_EXPR_LIST_DECL_SINGLE(RXD3, RXD3, SIG_DESC_SET(SCU80, 23));
+SIG_EXPR_DECL(GPIE6OUT, GPIE6, GPIE6_DESC);
+SIG_EXPR_DECL(GPIE6OUT, GPIE, GPIE_DESC);
+SIG_EXPR_LIST_DECL_DUAL(GPIE6OUT, GPIE6, GPIE);
+MS_PIN_DECL(B14, GPIOE7, RXD3, GPIE6OUT);
+
+FUNC_GROUP_DECL(RXD3, B14);
+FUNC_GROUP_DECL(GPIE6, C14, B14);
+
 #define D18 40
 SSSF_PIN_DECL(D18, GPIOF0, NCTS4, SIG_DESC_SET(SCU80, 24));
 
@@ -854,6 +914,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A11),
 	ASPEED_PINCTRL_PIN(A12),
 	ASPEED_PINCTRL_PIN(A13),
+	ASPEED_PINCTRL_PIN(A15),
 	ASPEED_PINCTRL_PIN(A18),
 	ASPEED_PINCTRL_PIN(A2),
 	ASPEED_PINCTRL_PIN(A3),
@@ -872,6 +933,8 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(B1),
 	ASPEED_PINCTRL_PIN(B11),
 	ASPEED_PINCTRL_PIN(B12),
+	ASPEED_PINCTRL_PIN(B14),
+	ASPEED_PINCTRL_PIN(B15),
 	ASPEED_PINCTRL_PIN(B19),
 	ASPEED_PINCTRL_PIN(B2),
 	ASPEED_PINCTRL_PIN(B3),
@@ -881,6 +944,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(C1),
 	ASPEED_PINCTRL_PIN(C11),
 	ASPEED_PINCTRL_PIN(C12),
+	ASPEED_PINCTRL_PIN(C14),
 	ASPEED_PINCTRL_PIN(C15),
 	ASPEED_PINCTRL_PIN(C17),
 	ASPEED_PINCTRL_PIN(C2),
@@ -892,6 +956,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(D1),
 	ASPEED_PINCTRL_PIN(D11),
 	ASPEED_PINCTRL_PIN(D12),
+	ASPEED_PINCTRL_PIN(D14),
 	ASPEED_PINCTRL_PIN(D15),
 	ASPEED_PINCTRL_PIN(D16),
 	ASPEED_PINCTRL_PIN(D17),
@@ -904,6 +969,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(E10),
 	ASPEED_PINCTRL_PIN(E11),
 	ASPEED_PINCTRL_PIN(E12),
+	ASPEED_PINCTRL_PIN(E14),
 	ASPEED_PINCTRL_PIN(E16),
 	ASPEED_PINCTRL_PIN(E2),
 	ASPEED_PINCTRL_PIN(E3),
@@ -974,6 +1040,15 @@ static const struct aspeed_pin_group aspeed_g4_groups[] = {
 	ASPEED_PINCTRL_GROUP(NCTS3),
 	ASPEED_PINCTRL_GROUP(NDCD3),
 	ASPEED_PINCTRL_GROUP(GPIE0),
+	ASPEED_PINCTRL_GROUP(NDSR3),
+	ASPEED_PINCTRL_GROUP(NRI3),
+	ASPEED_PINCTRL_GROUP(GPIE2),
+	ASPEED_PINCTRL_GROUP(NDTR3),
+	ASPEED_PINCTRL_GROUP(NRTS3),
+	ASPEED_PINCTRL_GROUP(GPIE4),
+	ASPEED_PINCTRL_GROUP(TXD3),
+	ASPEED_PINCTRL_GROUP(RXD3),
+	ASPEED_PINCTRL_GROUP(GPIE6),
 	ASPEED_PINCTRL_GROUP(NCTS4),
 	ASPEED_PINCTRL_GROUP(ACPI),
 	ASPEED_PINCTRL_GROUP(NDCD4),
@@ -1047,6 +1122,15 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
 	ASPEED_PINCTRL_FUNC(NCTS3),
 	ASPEED_PINCTRL_FUNC(NDCD3),
 	ASPEED_PINCTRL_FUNC(GPIE0),
+	ASPEED_PINCTRL_FUNC(NDSR3),
+	ASPEED_PINCTRL_FUNC(NRI3),
+	ASPEED_PINCTRL_FUNC(GPIE2),
+	ASPEED_PINCTRL_FUNC(NDTR3),
+	ASPEED_PINCTRL_FUNC(NRTS3),
+	ASPEED_PINCTRL_FUNC(GPIE4),
+	ASPEED_PINCTRL_FUNC(TXD3),
+	ASPEED_PINCTRL_FUNC(RXD3),
+	ASPEED_PINCTRL_FUNC(GPIE6),
 	ASPEED_PINCTRL_FUNC(NCTS4),
 	ASPEED_PINCTRL_FUNC(ACPI),
 	ASPEED_PINCTRL_FUNC(NDCD4),
-- 
2.8.1
