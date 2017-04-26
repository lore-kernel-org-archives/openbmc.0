Return-Path: <Chen.KenYY@inventec.com>
Received: from mail.inventec.com (hub02.inventec.com [218.32.67.167])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCSkN0WSzzDqG3
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 15:07:23 +1000 (AEST)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-04.iec.inventec (10.1.254.157) with Microsoft SMTP Server id
 14.3.266.1; Wed, 26 Apr 2017 13:07:18 +0800
Received: from IEC1-SPAM-1.inventec.com (smg.inventec.com [10.1.254.201])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id v3Q57Dmc012077	for
 <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 13:07:13 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pf0-f197.google.com (mail-pf0-f197.google.com
 [209.85.192.197])	by IEC1-SPAM-1.inventec.com with ESMTP id v3Q57WXx026378
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 13:07:33 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pf0-f197.google.com with SMTP id t23so38195198pfe.17
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 22:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Fd4Yv0oirOLFo3J9szY6rPY9e4ypXQjs2okAx9X3Ks8=;
 b=Gz8szx4MgqZkmDlukaTLT+ywM0qn6FV0GhvOF/JSoV1mhOYhVpCDB0yzk168lfW5L7
 ewaR/MSi/ycRY0MKQ3B2P6C2uNa2PP+NVErCULCh1w5ZM6+tGONSL4TTvVnQtX5PLjXx
 iD9HFsiN69c5gez6Raq10zROkMtGgaN43TczUwrXlZBxts332Ni0W82LvRY1Ts4FF4GZ
 JwNVr34Js4wrMq4VYYcer7xQD88EQ1J4WXRUbaCx0jSCU2e9x+2VkMCsyxesKJecoPKp
 xj36aGqtZ6ENEn+S8bcHqiE8Sq/7zvUg7Aqv/WoQFJy4SJMIeaVT62MniETIeL3ObcGY
 za/Q==
X-Gm-Message-State: AN3rC/4PzcxWjtZNuhQl+N31r3vfuo7SxGKTMGCmS/9ixLRJCKhDvDDj
 7ejuFXpWrrGP6/4ktDJwat8carjkvq64Rw7ehX+/sxWVUDaFsoA8X5G7wNTJGs//IcGtHFJjBz8
 xKKzrmwOb/Qc0
X-Received: by 10.98.197.194 with SMTP id j185mr30596524pfg.239.1493183229632; 
 Tue, 25 Apr 2017 22:07:09 -0700 (PDT)
X-Received: by 10.98.197.194 with SMTP id j185mr30596510pfg.239.1493183229401; 
 Tue, 25 Apr 2017 22:07:09 -0700 (PDT)
Received: from localhost (59-120-179-172.HINET-IP.hinet.net. [59.120.179.172])
 by smtp.gmail.com with ESMTPSA id
 e13sm39306646pfb.30.2017.04.25.22.07.08        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Tue, 25 Apr 2017
 22:07:08 -0700 (PDT)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: Modify Laanyang BMC device
 tree
Date: Wed, 26 Apr 2017 13:07:09 +0800
Message-ID: <20170426050709.26186-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com v3Q57Dmc012077
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 26 Apr 2017 16:42:32 +1000
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
X-List-Received-Date: Wed, 26 Apr 2017 05:07:24 -0000

Modify Lanyang dts and add lanyang initial in aspeed.c

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 13 +++---
 arch/arm/mach-aspeed/aspeed.c                | 65 ++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 7 deletions(-)

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
index a7b03a0..b1073e5 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -238,6 +238,69 @@ static void __init do_romulus_setup(void)
     writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
+static void __init do_lanyang_setup(void)
+{
+        unsigned long reg;
+        unsigned long board_rev;
+        /* D3 in GPIOA/B/C/D direction and data registers */
+        unsigned long phy_reset_mask = BIT(27);
+
+        do_common_setup();
+
+        /* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
+        reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
+        board_rev = (reg >> 3) & 0x1F;
+
+        /* EVT1 hacks */
+        if (board_rev == 0) {
+                /* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
+                reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
+                writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
+        }
+
+        /* Disable GPIO H/AC pulldowns to float 1-wire interface pins */
+        reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
+        writel(reg | BIT(23), AST_IO(AST_BASE_SCU | 0x8C));
+
+        /* Assert MAC2 PHY hardware reset */
+        /* Set pin low */
+        reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
+        writel(reg & ~phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
+        /* Enable pin for output */
+        reg = readl(AST_IO(AST_BASE_GPIO | 0x04));
+        writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x04));
+        udelay(3);
+        /* Set pin high */
+        reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
+        writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
+
+        /* Setup PNOR address mapping for 64M flash
+         *
+         *   ADRBASE: 0x3000 (0x30000000)
+         *   HWMBASE: 0x0C00 (0x0C000000)
+         *  ADDRMASK: 0xFC00 (0xFC000000)
+         *   HWNCARE: 0x03FF (0x03FF0000)
+         *
+         * Mapping appears at 0x60300fc000000 on the host
+         */
+        writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+        writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+        /* Set SPI1 CE1 decoding window to 0x34000000 */
+        writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
+        /* Set SPI1 CE0 decoding window to 0x30000000 */
+        writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
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
@@ -275,6 +338,8 @@ static void __init aspeed_init_early(void)
 		do_witherspoon_setup();
 	if (of_machine_is_compatible("ibm,romulus-bmc"))
 		do_romulus_setup();
+        if (of_machine_is_compatible("inventec,lanyang-bmc"))
+                do_romulus_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.9.3
