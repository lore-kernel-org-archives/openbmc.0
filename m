Return-Path: <Chen.KenYY@inventec.com>
Received: from mail.inventec.com (hub02.inventec.com [218.32.67.167])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD3CM61sJzDq9K
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 14:01:03 +1000 (AEST)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-04.iec.inventec (10.1.254.157) with Microsoft SMTP Server id
 14.3.266.1; Thu, 27 Apr 2017 12:00:37 +0800
Received: from IEC1-SPAM-1.inventec.com (smg.inventec.com [10.1.254.201])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id v3R4035i053747	for
 <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 12:00:03 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pf0-f199.google.com (mail-pf0-f199.google.com
 [209.85.192.199])	by IEC1-SPAM-1.inventec.com with ESMTP id v3R40BQV048885
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 12:00:12 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pf0-f199.google.com with SMTP id j16so15811119pfk.4
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 20:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cOw3lvordxFe0cr048Ck+tYiqtn8+gyCVTlWEoJB60E=;
 b=ocwTw7yRMrm7SbRPTytlassFLBVgzqQdqnEcGmZYUt3pVjaGsZ1FoVDM2oQEtFcJy+
 KnyUKqaQBTZoy1SO4JR3mKSF0YRbKpmOCZqEbLEsTAB0dyO42uje2037PICKl7kiuKOB
 jkw5WRsmAU0potgW0uCDBBpU7HWldAQyvizTn1qIYp+JnpF5przIOma9nJI9JW4TTyxb
 kVZXEZzJa20m+ZmLd9+M7/I42lq1Xlrkp1qI0W/cBZc6/AAVipq2xVda4xoBpTKyPFiY
 R5BfbWpqYrN7keEKcmIb8Kk92Ks42MNSAHZDS2/KJaS/3UKSDIOBjYHM1227jYmvSsli
 xibA==
X-Gm-Message-State: AN3rC/5oQj7A1JepNf6Phsdnvco1pixiJ8/Q0rBsWNOGKei+GxyRJuSt
 nb1Y8LKOaEiFSDiLsvF9pJ3H4EpW2DGoORr7/GtNl0UXrXUYKywHxHkygULJJRmiVtvabUDwSj2
 Pu0NRhMkyzh4X
X-Received: by 10.84.228.193 with SMTP id y1mr4269253pli.77.1493265588773;
 Wed, 26 Apr 2017 20:59:48 -0700 (PDT)
X-Received: by 10.84.228.193 with SMTP id y1mr4269244pli.77.1493265588559;
 Wed, 26 Apr 2017 20:59:48 -0700 (PDT)
Received: from localhost ([122.146.87.216])        by smtp.gmail.com with
 ESMTPSA id p2sm1261645pfj.93.2017.04.26.20.59.47        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Wed, 26 Apr 2017
 20:59:47 -0700 (PDT)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.7 v3] ARM: dts: aspeed: Modify Laanyang BMC device
 tree
Date: Thu, 27 Apr 2017 11:59:42 +0800
Message-ID: <20170427035942.12129-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com v3R4035i053747
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Thu, 27 Apr 2017 04:01:04 -0000

Modify Lanyang dts and add lanyang initial in aspeed.c

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 13 ++++++-------
 arch/arm/mach-aspeed/aspeed.c                | 17 +++++++++++++++++
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
index 176e4b4..6456458 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -1,4 +1,4 @@
-/dts-v1/;
+/dts-v3/;
 
 #include "aspeed-g5.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
@@ -302,18 +302,17 @@
 };
 
 &gpio {
-	line_apss_reset {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(E, 4) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "BMC_APSS_RESET_N";
-	};
+
 };
 
 &vuart {
 	status = "okay";
 };
 
+&gfx {
+        status = "okay";
+};
+
 &pinctrl {
 	aspeed,external-nodes = <&gfx &lhc>;
 };
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index a7b03a0..ae1e6cc 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -238,6 +238,21 @@ static void __init do_romulus_setup(void)
     writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
+static void __init do_lanyang_setup(void)
+{
+        unsigned long reg;
+
+        do_common_setup();
+
+        /* Disable default behavior of UART1 being held in reset by LPCRST#.
+         * By releasing UART1 from being controlled by LPC reset, it becomes
+         * immediately available regardless of the host being up.
+         */
+        reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+        /* Clear "Enable UART1 reset source from LPC" */
+        writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
+}
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -275,6 +290,8 @@ static void __init aspeed_init_early(void)
 		do_witherspoon_setup();
 	if (of_machine_is_compatible("ibm,romulus-bmc"))
 		do_romulus_setup();
+        if (of_machine_is_compatible("inventec,lanyang-bmc"))
+                do_romulus_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.9.3
