Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96ms1zJ6zDt11
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:30:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="akjyQ4Rl"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i88so6564155pfk.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 20:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=HUc/dfB7Qn/nS7JLalwDqZen1gIyiluoh40Z+SAe0yM=;
 b=akjyQ4Rlm5AKHrgAE3aK+EsFxzAhv6pbuk3Qn6NoZr73FxaUD3rvGMilpogg+zKwMy
 WFwYKvOJ5PF/a4q53bGpAc5PNDJfMLFLfF+vNjV2FJ5jrQE+ulIbYgaWGGYH9WJ9zTVC
 kAVkYCKjAobn2hvob6xOAbkTqTdBhzzGzzqkv/LVzv/cvdAS/6DUMuZAJP7Xj+jQTnDD
 gjCrb9XI52JTtHBoH5Y0RGPCMrCppCc1GZKDMuAB2jR0eA0416uZEcN2IjjGGSqep3GE
 +0PtoElpdjMr4dgXODDXFx2CjlVr2Zf2YHMAvWNHaknoktbGImlp9ogj7XsbgzVtdFku
 01mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=HUc/dfB7Qn/nS7JLalwDqZen1gIyiluoh40Z+SAe0yM=;
 b=QsxRvNoui9YBzeAElm/nXEVZHTZP+cUQCx/JoyMEe8vQ/32KquboS21YceHSjRWD8P
 uW7he6nQE/GryDrZl7GtH8KPqulhbX38a32p6GWcZjvEL5jlWkp9w9WiLylKPxXZMw3z
 OotygD7Ab7mSFR1pVY4pWmFT2UZ3zhOo015Q1hSxxrxuv1428NPkj5C5YN5sPx1v5WGT
 OY36jUW4UW7mXpNkCRapSU4TA6yh6M+sT9OOzwQYF5+48QmvrEE2B1ZnWusnIJOIRNg2
 NZ2+JsFX3/XWB4A5MbxNywb9iUfEgzvGtEFaYjFui73CI/cQ6hnFtozPb8NotNJru08F
 ka8g==
X-Gm-Message-State: ABUngvcLJhat3t6t2lr5pNOVAXzV4SMlp9Hga94cFcn3sCGSjpp3ckbqcFhX3HcPqoSD9w==
X-Received: by 10.99.251.5 with SMTP id o5mr18909799pgh.160.1478230251306;
 Thu, 03 Nov 2016 20:30:51 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 21sm15822337pfs.88.2016.11.03.20.30.47
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 20:30:50 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 Nov 2016 14:00:43 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] arm: dts: aspeed: Set SPI1 mode to master
Date: Fri,  4 Nov 2016 14:00:41 +1030
Message-Id: <20161104033042.32562-1-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Fri, 04 Nov 2016 03:30:53 -0000

Now that we can modify the strapping with pinmux, select the mode we
wish the flash to be in with the device tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index e1be7b0c5484..4c4c547fe412 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -36,7 +36,7 @@
 &spi1 {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1debug_default>;
+	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 9ff2412eef67..5c93139ad200 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -36,7 +36,7 @@
 &spi1 {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1debug_default>;
+	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
 		status = "okay";
-- 
2.9.3
