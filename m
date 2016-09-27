Return-Path: <xow@google.com>
Received: from mail-pa0-x236.google.com (mail-pa0-x236.google.com
 [IPv6:2607:f8b0:400e:c03::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjjyy0kmkzDrSf
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 11:33:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Pac4zc9o; 
 dkim-atps=neutral
Received: by mail-pa0-x236.google.com with SMTP id fn2so6076328pad.0
 for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2016 18:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DnfZ+z4g7ruxWmSNU1DymvSdbbRr6a/HEWxItgscc8M=;
 b=Pac4zc9oQViQWTR0Rj8u6+4beVuGojU7o/oeki+D3xt/rOUqx1FjEhmhf7o0hCZ+Lr
 B4o6yWq7XdU8I30MUyVcWgB84pOnrZ65O/m92jNIXfXYDQbbiUU2qgkpb+k1+DOiyBDC
 obwTP6IvojayjAtDfxdf+gjL2iAZltEe325iq4VwyQAZyaXgdeHGj1I8LbjcWpFE+jCE
 0XrsnAy4inTjffapp+MD3B7OnLf5iwY1ghpIEm10npLlG5VSdS3atU56C4nkD8BIJQbm
 3UPM/CvXdVqyw7XL92ls8yOR4scOWUXfIBw8ypEOkAL6RUQMqX5Y+iLLuYQISb2dEoIT
 r9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DnfZ+z4g7ruxWmSNU1DymvSdbbRr6a/HEWxItgscc8M=;
 b=hSKZbkQnSqRMKv1GoBSXHe3P/vjkDwXZ5zQO9BlS7bxHFrsFXMmj6yeYr+0FhgQtMa
 c8E3UdQn1BNuBSULnA/Wsivzd17duqn90PlbItKNHo4FM4B2Y2vBIcgVKJokREebpI8L
 hXCjRk2KiAvyzyLgk0X3Y3JZg9dyCoOKaRVQhr2bUQK3gmOpqMWPTb6pVvnA1gRbQH4u
 Xmzl+VWHrN3pSjLFKbht4Upj4LBbAwUPc3VBWsZnoSZjqBEjuMKQyDpxcgg9OPkAbHOC
 yMdShZMDNUOx2NlRcws01DIHNLa67bVW+m8P2+9XEAM9BnFWQUbhEBHK3Nt3jGLe/sdZ
 UMjg==
X-Gm-Message-State: AE9vXwOLbpaQK1RASSWWWFJAJShzHoHAA6zBAXBerebnO1gDwzz7b8c0m8w5/I4sscXmsR/+
X-Received: by 10.66.89.72 with SMTP id bm8mr43993272pab.1.1474940007552;
 Mon, 26 Sep 2016 18:33:27 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id sl9sm33832594pab.22.2016.09.26.18.33.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 26 Sep 2016 18:33:26 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] pinctrl: aspeed: Fix names for balls at GPIOD2,3
Date: Mon, 26 Sep 2016 18:33:22 -0700
Message-Id: <1474940002-73911-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 27 Sep 2016 01:33:30 -0000

Update ball names in SDIO block per AST2500 pin mapping table. Functions
and select expressions are correct; they were just one ball low.

Signed-off-by: Xo Wang <xow@google.com>
---
Changes for v2: now it compiles.
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index c98beb6..d8e5824 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -129,21 +129,21 @@ FUNC_GROUP_DECL(GPID0, F19, E21);
 
 #define GPID1_DESC      SIG_DESC_SET(SCU8C, 9)
 
-#define D20 26
+#define F20 26
 SIG_EXPR_LIST_DECL_SINGLE(SD2DAT0, SD2, SD2_DESC);
 SIG_EXPR_DECL(GPID1IN, GPID1, GPID1_DESC);
 SIG_EXPR_DECL(GPID1IN, GPID, GPID_DESC);
 SIG_EXPR_LIST_DECL_DUAL(GPID1IN, GPID1, GPID);
-MS_PIN_DECL(D20, GPIOD2, SD2DAT0, GPID1IN);
+MS_PIN_DECL(F20, GPIOD2, SD2DAT0, GPID1IN);
 
-#define D21 27
+#define D20 27
 SIG_EXPR_LIST_DECL_SINGLE(SD2DAT1, SD2, SD2_DESC);
 SIG_EXPR_DECL(GPID1OUT, GPID1, GPID1_DESC);
 SIG_EXPR_DECL(GPID1OUT, GPID, GPID_DESC);
 SIG_EXPR_LIST_DECL_DUAL(GPID1OUT, GPID1, GPID);
-MS_PIN_DECL(D21, GPIOD3, SD2DAT1, GPID1OUT);
+MS_PIN_DECL(D20, GPIOD3, SD2DAT1, GPID1OUT);
 
-FUNC_GROUP_DECL(GPID1, D20, D21);
+FUNC_GROUP_DECL(GPID1, F20, D20);
 
 #define I2C5_DESC       SIG_DESC_SET(SCU90, 18)
 
@@ -522,8 +522,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(D1),
 	ASPEED_PINCTRL_PIN(D10),
 	ASPEED_PINCTRL_PIN(D2),
+	ASPEED_PINCTRL_PIN(F20),
 	ASPEED_PINCTRL_PIN(D20),
-	ASPEED_PINCTRL_PIN(D21),
 	ASPEED_PINCTRL_PIN(D4),
 	ASPEED_PINCTRL_PIN(D5),
 	ASPEED_PINCTRL_PIN(D6),
-- 
2.8.0.rc3.226.g39d4020
