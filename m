Return-Path: <kunyi@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8NNw1jbbzDvNg
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 09:41:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Xz00pG0P; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id 189so19146260pfz.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 15:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YYPyphTIu7/OLAwQm7R8wF+LYbJmR2J3s0PEPl1leyA=;
 b=Xz00pG0P+xXP2cMOEE5gDHTg8lmIgPwZlbmlQJPc2xq5vhCRpIIHITzsxB51WGq97e
 KBo8fLbL3WCb5PJc+yrNXXmjMTl7OQK5CBbeo1kvC9RonViySWIAuoY4YZdpXxLd9ZVW
 UDMQKnDTWz6/t/fvwUj41097DvvowXNdo5O+n5h8xZTpcw1q8cDsQ96/LW7UDRaHsIoo
 BqsorEO9TXK1cLUcyccUh1PMTHJ35CwvGAzGdFDtdgGV6RLbWTurfB7eo3qBRXgXkYkU
 qXeyDwfqx0jZmy9bSMCbmS3+EtZb7uRsOheJoIdqGu+rWv83Ktj0nhnE67Gxcvy5jQTe
 BR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YYPyphTIu7/OLAwQm7R8wF+LYbJmR2J3s0PEPl1leyA=;
 b=ki0P8c1bPSJdURqPnx1PV1i2gMLRVgMQWIFg//V2owM+j1WsbHwuHqWq59uGv4/DZf
 6p0EoAlGkMlFDsJ8FTL2LrT/C7fdEqPeyA3dhoGIRUB3e9YwwhOOODqeGkJNfNutrU6D
 2QkETXcPPsQU5xGL8yu6WOkrPLSgV6aqMXyGb2Bg3q0ol7zcFm+ghJBzYDSpC1aizea6
 f78xHq8AuStFBwNoU8VQyDJcod1CDcB4bqszMU94j2DiHWzuI83jzGocduke80CD/xvn
 VF/o07HodgTj9kRNwKnVaM4OMspY4eYst0xjzD82S+vFcR622wsbhlnS2bZoeLJ9E+uv
 jKbQ==
X-Gm-Message-State: ABUngvflzhSsm5IHaIb04q0U4ZqOtdzfzflE/vFfCd4Dfj73TkqlD9iEPi7bJ++4ZSti/5uR
X-Received: by 10.98.67.133 with SMTP id l5mr11023141pfi.170.1478126462238;
 Wed, 02 Nov 2016 15:41:02 -0700 (PDT)
Received: from kunyi0.svl.corp.google.com ([100.123.242.82])
 by smtp.gmail.com with ESMTPSA id n7sm7130061pfn.62.2016.11.02.15.41.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 15:41:01 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 v1 1/1] pinctrl: aspeed: Enable ASPEED pinctrl
 driver to modify SPI1 strap bits
Date: Wed,  2 Nov 2016 15:39:40 -0700
Message-Id: <1478126380-3189-2-git-send-email-kunyi@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478126380-3189-1-git-send-email-kunyi@google.com>
References: <1478126380-3189-1-git-send-email-kunyi@google.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 22:41:05 -0000

Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only. Changing
SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1, and keep
other strap bits as read-only.

Note: with this change devicetree default pinctrl settings for spi1 will
effectively override any previous mode set by physical strapping or
aspeed.c when Aspeed smc driver is probed.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  2 +-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 21ef195..c647503 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -16,6 +16,8 @@
 
 const char *const aspeed_pinmux_ips[] = { "SCU", "SIO", "GFX", "LPC" };
 
+#define SPI1_REG_MASK   0x3000
+
 int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
@@ -178,6 +180,7 @@ static bool aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
  *
  * @return true if the expression is configured as requested, false otherwise
  */
+
 static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 				bool enable, struct regmap *map)
 {
@@ -197,15 +200,30 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
 
 		/*
 		 * Strap registers are configured in hardware or by early-boot
-		 * firmware. Treat them as read-only despite that we can write
+		 * firmware. With the exception of SPI1 interface bits, treat
+		 * them as read-only despite that we can write
 		 * them. This may mean that certain functions cannot be
 		 * deconfigured and is the reason we re-evaluate after writing
 		 * all descriptor bits.
 		 */
-		if (is_scu && (offset == HW_STRAP1 || offset == HW_STRAP2))
+		if (is_scu && (offset == HW_STRAP2 ||
+			offset == HW_STRAP1 && desc->mask != SPI1_REG_MASK))
 			continue;
 
 		/*
+		 * HW_STRAP1 bits can only be set to 0 by writing 1 into
+		 * bits of same offset in SCU7C. To configure different SPI1
+		 * modes, we write 1 to SCU7C[13:12] to clear SPI1 mask to make
+		 * sure later write to strap register can take effect.
+		 */
+		if (is_scu && offset == HW_STRAP1 &&
+		    desc->mask == SPI1_REG_MASK) {
+			ret = regmap_write(map, HW_STRAP1_RESET, desc->mask);
+			if (ret)
+				return false;
+		};
+
+		/*
 		 * Sometimes we need help from IP outside the SCU to activate a
 		 * mux request. Report that we need its cooperation.
 		 */
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 68315a8..46ba16d 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -268,6 +268,7 @@
 #define HW_STRAP2       0xD0 /* Strapping */
 
 #define SIORD30		SIG_DESC_TO_REG(ASPEED_IP_SIO, 0x30)
+#define HW_STRAP1_RESET	SIG_DESC_TO_REG(ASPEED_IP_SCU, 0x7C)
 
  /**
   * A signal descriptor, which describes the register, bits and the
@@ -580,5 +581,4 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 int aspeed_pinctrl_probe(struct platform_device *pdev,
 		struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
-
 #endif /* PINCTRL_ASPEED */
-- 
2.8.0.rc3.226.g39d4020
