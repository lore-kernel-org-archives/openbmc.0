Return-Path: <xow@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjjKd5kB1zDrSX
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 11:04:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=XnRaLmGc; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id l25so23060255pfb.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2016 18:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YuBTvjSWc7R0EKyzjMjKWbb1c5GgTA6t+PIbkqeE1ec=;
 b=XnRaLmGcXhMcwEhMWX2kF8ueIwL3hiZzHDVFLzRHLiH86iC7QeBurceD6YpalfhKlg
 eNLHEkpqxY5dmw7eW39HVfJ6j25bOwsiWvzsqpXoTl2ycHJ4lSeFRfwmeMO4Jx9zYoMk
 lH1GRvu/u1xnt83FPD/U5rZAQyoHwNDSy2t9PqHq961PYRN+BfN2iNj30UgKHK67nZ4+
 1sq6fLwai3M6itFzUIyasmIk5RUep/AxU6R4caICCRedpUMkdLewC7iwMzeWKdIx7Z+c
 iEhpZW+Zuum4ue79R0YgS7TbOWWfJ+y6bwkMeBhfP+7sYspFYCbBq0BHcQinMFw7dRmU
 xtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YuBTvjSWc7R0EKyzjMjKWbb1c5GgTA6t+PIbkqeE1ec=;
 b=ZMGTLzrkVqAC81K3xdTgnqiXqeTKtszmZM82egf8+Si+BufsdzbidVRrwByJeZu/IQ
 wsj3J0dcgrRt95m2p3cbyKihHZqqs8TjsXlmQrnWfAWFCcS+4UKThU5T3/V1iMK4sAy2
 QaitZOkhNp5M0Kr4JJZ9TePJuL/PWfkWKdtxp40McucOvBuSXX3dywnlR5LhoAD4kLv/
 TyyNsAnwdhRFJ4jQlnCbr0c3ko8RWuoEH7S8rGMWDJgh8tt9Qr179PE4MvAoOhuEvMia
 8i/Q5871Rjzkmcv+eboSjcjbjm9Jq80LY4WjM8Fuip1cU7kpKR6lJXAUEmtQtB2FUvWu
 yvcw==
X-Gm-Message-State: AE9vXwNxoAsgBJZ7Sb8apmZi4wRgR6Y9+NU5BxK3DNHkQi9JylB7Lj7oT99y0fkLOH7MBmy2
X-Received: by 10.98.10.145 with SMTP id 17mr43088867pfk.144.1474938273980;
 Mon, 26 Sep 2016 18:04:33 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id e21sm33602938pfb.96.2016.09.26.18.04.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 26 Sep 2016 18:04:33 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] pinctrl: aspeed: Fix names for balls at GPIOD2,3
Date: Mon, 26 Sep 2016 18:04:24 -0700
Message-Id: <1474938264-130747-1-git-send-email-xow@google.com>
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
X-List-Received-Date: Tue, 27 Sep 2016 01:04:38 -0000

Update ball names in SDIO block per AST2500 pin mapping table. Functions
and select expressions are correct; they were just one ball low.

Signed-off-by: Xo Wang <xow@google.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index a0b1d4e..301ef3b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -124,21 +124,21 @@ FUNC_GROUP_DECL(GPID0, F19, E21);
 
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
 
-- 
2.8.0.rc3.226.g39d4020
