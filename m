Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EFCDB1A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:59:23 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1023)
 id CC83E140C43; Fri, 29 Jan 2016 15:59:23 +1100 (AEDT)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] arm/aspeed: Enable VUART driver
Date: Fri, 29 Jan 2016 12:55:48 +0800
Message-Id: <1454043348-11432-2-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454043348-11432-1-git-send-email-jk@ozlabs.org>
References: <1454043348-11432-1-git-send-email-jk@ozlabs.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jan 2016 04:59:24 -0000

This change makes use of the new VUART device driver. We need a separate
compatible property for the VUART node, and a fix for the interrupt
definitions. We also change the SCU setup to notify host firmware that the
VUART is available.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/boot/dts/ast2400.dtsi    | 7 ++++---
 arch/arm/configs/aspeed_defconfig | 3 +++
 arch/arm/mach-aspeed/aspeed.c     | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index 70c0883..de816a9 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -344,15 +344,16 @@
 			};
 #endif
 
-			uart6: serial@1e787000 {
-			       compatible = "ns16550a";
+			uart6: vuart@1e787000 {
+			       compatible = "aspeed,vuart";
 			       reg = <0x1e787000 0x1000>;
 			       reg-shift = <2>;
-			       interrupts = <10>;
+			       interrupts = <8>;
 			       clock-frequency = < 1843200 >;
 			       current-speed = < 38400 >;
 			       no-loopback-test;
 			};
+
 		};
 	};
 };
diff --git a/arch/arm/configs/aspeed_defconfig b/arch/arm/configs/aspeed_defconfig
index 9727eba..8dd6351 100644
--- a/arch/arm/configs/aspeed_defconfig
+++ b/arch/arm/configs/aspeed_defconfig
@@ -122,6 +122,9 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_DMA is not set
 CONFIG_SERIAL_8250_NR_UARTS=6
 CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_ASPEED_VUART=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index cdab46b..2feb161 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -123,7 +123,7 @@ static void __init do_common_setup(void)
 
 	/* Setup scratch registers */
 	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
-	writel(0x00004000, AST_IO(AST_BASE_LPC | 0x174));
+	writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));
 }
 
 static void __init do_barreleye_setup(void)
-- 
2.5.0
