Return-Path: <kunyi@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8slm0cqvzDvWB
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 04:44:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=N8Ijy+xN; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id i88so35042994pfk.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tce0C901hvL20hxK5u/cAGn2cqGmFD5gtbUOxuGIwTA=;
 b=N8Ijy+xN+oyPTsfcI15LUWfHDahsE9zAXocUop3Gwy8G0fZ6KGOtSMV1wc6mZQcq0B
 l7fiL+21nxq5b9BZ8OFsyrLNKilE7zOCFXxF4e4WNxEQXQJtmUVgDrxH1NSho3CfMA//
 HO4CY5qSRIMOYRwsLIiRnvD0Mdd1NoXDyKq+gVNSptnkOvZ3aWmhqKiFoZ57GbK6fI/V
 AiBJbVtplPErvy4yYYYAUKtz0Hfxy/BfZNk2N9+1bkr/kCZ5U05qf8Bj9U+agdq9MsUN
 l2U7PS8IZgDG8Yo+HKWMUJOeZ7myHQyiLAJFNrS/IJpOKdigyNUHUUnF7YPLsrpvh7Tv
 HmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tce0C901hvL20hxK5u/cAGn2cqGmFD5gtbUOxuGIwTA=;
 b=SCccKmc28U0VjiCPWhuSrx1OM4qNFYJY7rFlAF25Y7fnbsUzDiHqLSLUnLuU1pvL9w
 L6SH/FYKyYT/m6IA2HxoMxodnGJrcuTovWjUORQw7zqpACnmlrOZzabqEMm1S4y8DHGQ
 YvHGnNBKQhwFA5zYskcEsVHfBlSnSQ3YjlMszCPMrNxfDAkAgJHQTCXStAmYSHtg8tIU
 now6ckZ6Lt/H2e2sjK3oSWnASEYkUTFG9QrIdPOOFVlSxk1R1/jEwLo+pX4IgJmywOLv
 ZXf5ZsRNhFeojNyDDZR192AuQTVMLfdsr0UeO2FDC8ljwvM0hUh0q7znEE1OG6LPDmC5
 tdkA==
X-Gm-Message-State: ABUngvcUZJGojgMbd+U7l5MNl9wFkpsBWpLjhgNe8zu0aawBG5HSWcpnv7CDYlyHKiQUwmW+
X-Received: by 10.98.61.152 with SMTP id x24mr18670996pfj.88.1478195041578;
 Thu, 03 Nov 2016 10:44:01 -0700 (PDT)
Received: from kunyi0.svl.corp.google.com ([100.123.242.82])
 by smtp.gmail.com with ESMTPSA id a140sm14250975pfa.14.2016.11.03.10.44.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 10:44:01 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.7 v2 1/1] pinctrl: aspeed: Enable ASPEED pinctrl
 driver to modify SPI1 strap bits
Date: Thu,  3 Nov 2016 10:43:38 -0700
Message-Id: <1478195018-132099-2-git-send-email-kunyi@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478195018-132099-1-git-send-email-kunyi@google.com>
References: <1478195018-132099-1-git-send-email-kunyi@google.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 17:44:05 -0000

Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only.
Changing SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  2 +-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 21ef195..ce1399d 100644
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
+			offset == HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
 			continue;
 
 		/*
+		 * HW_STRAP1 bits can only be set to 0 by writing 1 into
+		 * bits of same offset in SCU7C. To configure different SPI1
+		 * modes, we write 1 to SCU7C[13:12] to clear SPI1 mask to make
+		 * sure later write to strap register can take effect.
+		 */
+		if (is_scu && offset == HW_STRAP1 &&
+		    (desc->mask & SPI1_REG_MASK)) {
+			ret = regmap_write(map, HW_STRAP1_CLEAR, desc->mask);
+			if (ret)
+				return false;
+		};
+
+		/*
 		 * Sometimes we need help from IP outside the SCU to activate a
 		 * mux request. Report that we need its cooperation.
 		 */
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 68315a8..602b260 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -255,6 +255,7 @@
 #define SCU3C           0x3C /* System Reset Control/Status Register */
 #define SCU48           0x48 /* MAC Interface Clock Delay Setting */
 #define HW_STRAP1       0x70 /* AST2400 strapping is 33 bits, is split */
+#define HW_STRAP1_CLEAR 0x7C /* Bits written 1 to are cleared from HW_STRAP1 */
 #define SCU80           0x80 /* Multi-function Pin Control #1 */
 #define SCU84           0x84 /* Multi-function Pin Control #2 */
 #define SCU88           0x88 /* Multi-function Pin Control #3 */
@@ -580,5 +581,4 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 int aspeed_pinctrl_probe(struct platform_device *pdev,
 		struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
-
 #endif /* PINCTRL_ASPEED */
-- 
2.8.0.rc3.226.g39d4020
