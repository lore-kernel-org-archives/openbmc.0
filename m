Return-Path: <Chen.KenYY@inventec.com>
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD3Gn1v72zDq9K
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 14:04:01 +1000 (AEST)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Thu, 27 Apr 2017 12:03:48 +0800
Received: from IEC1-SPAM-1.inventec.com (smg.inventec.com [10.1.254.201])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id v3R42Vc0059519	for
 <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 12:02:31 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pf0-f199.google.com (mail-pf0-f199.google.com
 [209.85.192.199])	by IEC1-SPAM-1.inventec.com with ESMTP id v3R42bso052712
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 12:02:38 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pf0-f199.google.com with SMTP id 194so15790778pfv.11
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 21:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3mRCcsIisKsVqPOlpHvwOsQEtBeD30wJo8btG6fOudI=;
 b=QKY+BCvfywsV5QuFAT/htqPy5htF/JY+6L7q2mRyvSkciJXBCG+EK2e2DHMFFmVU5U
 crpk15wk7ym4up4dLfojJ0tak7v8n+RkNUu+tL3E90xSC3gGgE6/+VGatXEeq33BqwiI
 NWWFEZieHbivPJRgBHGw3cdhdSEn+/S88MslMTLsd+iV14vBvAZZawyFjzpTq/b0+6vD
 yx2C9585lZxfL2vDLidtJ8i0mz1DWwUmSjmb3MIyc3XWHef3wRCNlSMs4JGmldn95/pW
 er098M/xP1QbldnvqrPzMFJQAyatL1TPsas16gegS6lLIb7wbPal40oANgV+zgm2GRPJ
 fdbA==
X-Gm-Message-State: AN3rC/7beab3SBFh/PNkat6Ex+Gu3L7PtPXKh92Su1q+XRLKTDx9vG1+
 ns7MSpxkWPCw0nhkzFEyNUswo8vfD3lsSEwG4IoudjjgMPOeWBRSvQxBjM2X26WVvpruLvNZrPh
 wqmNtE9bmRMkN
X-Received: by 10.84.230.229 with SMTP id e92mr4358719plk.2.1493265734833;
 Wed, 26 Apr 2017 21:02:14 -0700 (PDT)
X-Received: by 10.84.230.229 with SMTP id e92mr4358704plk.2.1493265734658;
 Wed, 26 Apr 2017 21:02:14 -0700 (PDT)
Received: from localhost ([122.146.87.216])        by smtp.gmail.com with
 ESMTPSA id h89sm1305511pfh.45.2017.04.26.21.02.13        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Wed, 26 Apr 2017
 21:02:14 -0700 (PDT)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.7 v4] ARM: dts: aspeed: Modify Laanyang BMC device
 tree
Date: Thu, 27 Apr 2017 12:02:14 +0800
Message-ID: <20170427040214.15096-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com v3R42Vc0059519
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
X-List-Received-Date: Thu, 27 Apr 2017 04:04:02 -0000

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
index a7b03a0..0717181 100644
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
+                do_lanyang_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.9.3
