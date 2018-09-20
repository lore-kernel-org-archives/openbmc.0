Return-Path: <3Jy2kWw4KB_QXnajZWjdeccejockkcha.YkiklajXiYheopo.kvhWXo.knc@flex--brendanhiggins.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3jy2kww4kb_qxnajzwjdeccejockkcha.ykiklajxiyheopo.kvhwxo.knc@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fJyVxQ7c"; 
 dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42GXx047CZzF3Nm
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 09:28:45 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id a70-v6so9004747qkb.16
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 16:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=0eUfEmnxFezrSWKVS8+HPs0FXoxcazz84MXUQZFdxbU=;
 b=fJyVxQ7cgqSl7e6mSUlC8lQHPTUObhfrBxGToeWQ0k1leOJcsGULvoRDU7Uw0ZNR/B
 8SM5Rr4Ckeq3EGNIxrjiWc1qyofJTfVBNLxhJWet85O6Ztv+4ZxdapPzdL9kpLJFY8z/
 GtcSOPDMFi3k8dtLNzmtonLBpQvh9/TP/lBageq0hh9jbkJPnPUbTnp7lZfUut28Vphh
 kP1kt5aZ1qRYHrO8f3SNrvSJgJKzsf2O4ubkuXLW7S7SKfSgy8a6b6s0E+IkEnm4LY8G
 K5+5x9s8Tynk3Cj7639sccDWn+ceuAPJGnE78tFx/0PZTx4/NldDUA6YF7Y4sWhrpOvb
 /y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=0eUfEmnxFezrSWKVS8+HPs0FXoxcazz84MXUQZFdxbU=;
 b=kZ0ZZthZTKRdEk4g+MfxWbmxbN33G5xWTBSj5DvTRJC1jmVLysCA+B2rciDl/Tizw3
 hNgMlOopco2tF317udzCyNm85aoQUQOcEk3kiew3HTyxVBQUqPfcIaH4dSQ2XDw95SiP
 +9Ewg4TIrM2ry8F4+pv+41YXxfDiim6mNzgNM9i5Ow72yVNMyFYvtC6MgGOYNVIB7FO4
 0VCMyndyAMvmZFp4ZavB6576QU5iZ2tA19/bvyqMYOlRNFIAfHpzqp6mCgHKhlVlTnt9
 4/zgHN81poo5CKR2SFZPmOyheTYe0zfpnUWRFjluS4Gus34Ae9scdNpSgWx5hgVvRev3
 4fLA==
X-Gm-Message-State: APzg51BrdPI946qmwnXovf0hcVwhCC6jV03YzndrYkk82mee2Vr6bnTY
 EPpGm7ZP+CH/dnkcq3f/lKX495jbEyN5tGNDsz+KkA==
X-Google-Smtp-Source: ANB0VdYaDFqzF+HTdLSPr6ttW3gxWxwfA0d/he1PbJBae0J+jLvsNfF5zh0a5q0ZP93+7cC51WdyD/hWYKK5Cv/YsFaxOQ==
X-Received: by 2002:a0c:b138:: with SMTP id
 q53-v6mr14496850qvc.29.1537486119413; 
 Thu, 20 Sep 2018 16:28:39 -0700 (PDT)
Date: Thu, 20 Sep 2018 16:28:20 -0700
Message-Id: <20180920232820.243734-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
Subject: [PATCH] i2c: aspeed: fixed invalid clock parameters for very large
 divisors
From: Brendan Higgins <brendanhiggins@google.com>
To: jae.hyun.yoo@linux.intel.com, benh@kernel.crashing.org, joel@jms.id.au, 
 andrew@aj.id.au
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 20 Sep 2018 23:28:53 -0000

The function that computes clock parameters from divisors did not
respect the maximum size of the bitfields that the parameters were
written to. This fixes the bug.

This bug can be reproduced with (and this fix verified with) the test
at: https://kunit-review.googlesource.com/c/linux/+/1035/

Discovered-by-KUnit: https://kunit-review.googlesource.com/c/linux/+/1035/
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 38 +++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index c258c4d9a4c0..c1c3f0a4d805 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -705,9 +705,18 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
 #endif /* CONFIG_I2C_SLAVE */
 };
 
-static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_max, u32 divisor)
+static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_mask, u32 divisor)
 {
-	u32 base_clk, clk_high, clk_low, tmp;
+	u32 base_clk, clk_high_low_max, clk_high, clk_low, tmp;
+
+	/*
+	 * SCL_high and SCL_low represent a value 1 greater than what is stored
+	 * since a zero divider is meaningless. Thus, the max value each can
+	 * store is every bit set + 1. Since SCL_high and SCL_low are added
+	 * together (see below), the max value of both is the max value of one
+	 * them times two.
+	 */
+	clk_high_low_max = (clk_high_low_mask + 1) * 2;
 
 	/*
 	 * The actual clock frequency of SCL is:
@@ -731,15 +740,22 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_max, u32 divisor)
 	 */
 	base_clk = divisor > clk_high_low_max ?
 			ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;
-	tmp = (divisor + (1 << base_clk) - 1) >> base_clk;
-	clk_low = tmp / 2;
-	clk_high = tmp - clk_low;
 
-	if (clk_high)
-		clk_high--;
+	if (base_clk > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
+		base_clk = ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
+		clk_low = clk_high_low_mask;
+		clk_high = clk_high_low_mask;
+	} else {
+		tmp = (divisor + (1 << base_clk) - 1) >> base_clk;
+		clk_low = tmp / 2;
+		clk_high = tmp - clk_low;
+
+		if (clk_high)
+			clk_high--;
 
-	if (clk_low)
-		clk_low--;
+		if (clk_low)
+			clk_low--;
+	}
 
 
 	return ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
@@ -755,7 +771,7 @@ static u32 aspeed_i2c_24xx_get_clk_reg_val(u32 divisor)
 	 * clk_high and clk_low are each 3 bits wide, so each can hold a max
 	 * value of 8 giving a clk_high_low_max of 16.
 	 */
-	return aspeed_i2c_get_clk_reg_val(16, divisor);
+	return aspeed_i2c_get_clk_reg_val(GENMASK(2, 0), divisor);
 }
 
 static u32 aspeed_i2c_25xx_get_clk_reg_val(u32 divisor)
@@ -764,7 +780,7 @@ static u32 aspeed_i2c_25xx_get_clk_reg_val(u32 divisor)
 	 * clk_high and clk_low are each 4 bits wide, so each can hold a max
 	 * value of 16 giving a clk_high_low_max of 32.
 	 */
-	return aspeed_i2c_get_clk_reg_val(32, divisor);
+	return aspeed_i2c_get_clk_reg_val(GENMASK(3, 0), divisor);
 }
 
 /* precondition: bus.lock has been acquired. */
-- 
2.19.0.444.g18242da7ef-goog
