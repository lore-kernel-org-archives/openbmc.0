Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qvZ3f2lGVzDqB3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 06:11:10 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461701463082457.07251658618793;
 Tue, 26 Apr 2016 13:11:03 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH linux 3/3] Initial support for Garrison system.
Date: Tue, 26 Apr 2016 15:10:58 -0500
Message-Id: <1461701458-2173-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461701458-2173-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461701458-2173-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 26 Apr 2016 20:11:10 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Garrison is an IBM branded OpenPOWER system.

devtree stub.
SCU setup.
---
 arch/arm/boot/dts/Makefile                    |  3 +-
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 80 +++++++++++++++++++++++++++
 arch/arm/mach-aspeed/aspeed.c                 | 15 +++++
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9697ea5..ada1fcd 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -779,7 +779,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_MACH_OPP_PALMETTO_BMC) += \
 	aspeed-bmc-opp-palmetto.dtb \
-	aspeed-bmc-opp-barreleye.dtb
+	aspeed-bmc-opp-barreleye.dtb \
+	aspeed-bmc-opp-garrison.dtb
 endif
 
 dtstree		:= $(srctree)/$(src)
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
new file mode 100644
index 0000000..93c84d2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -0,0 +1,80 @@
+/dts-v1/;
+
+#include "ast2400.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Garrison BMC";
+	compatible = "ibm,garrison-bmc", "aspeed,ast2400";
+
+	ahb {
+		fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				/*
+				 * Possibly required props:
+				 * spi-max-frequency = <>
+				 * spi-tx-bus-width = <>
+				 * spi-rx-bus-width  = <>
+				 * m25p,fast-read
+				 * spi-cpol if inverse clock polarity (CPOL)
+				 * spi-cpha if shifted clock phase (CPHA)
+				 */
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+		spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,smc";
+			flash {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+				/* spi-max-frequency = <>; */
+				/* m25p,fast-read; */
+			};
+		};
+		apb {
+			i2c: i2c@1e78a040 {
+				i2c4: i2c-bus@140 {
+					occ@50 {
+						compatible = "ibm,occ-i2c";
+						reg = <0x50>;
+					};
+				};
+				i2c5: i2c-bus@180 {
+					occ@50 {
+						compatible = "ibm,occ-i2c";
+						reg = <0x50>;
+					};
+				};
+				i2c10: i2c-bus@3c0 {
+					status = "okay";
+				};
+				i2c11: i2c-bus@400 {
+					status = "okay";
+
+					rtc@68 {
+						compatible = "dallas,ds3231";
+						reg = <0x68>;
+					};
+				};
+				i2c12: i2c-bus@440 {
+					status = "okay";
+				};
+				i2c13: i2c-bus@480 {
+					status = "okay";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 594a781..18aefdb 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -171,6 +171,18 @@ static void __init do_palmetto_setup(void)
 	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));
 }
 
+static void __init do_garrison_setup(void)
+{
+	do_common_setup();
+
+	/* Setup PNOR address mapping for 64M flash */
+	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+	/* SCU setup */
+	writel(0xd7000000, AST_IO(AST_BASE_SCU | 0x88));
+}
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -207,6 +219,9 @@ static void __init aspeed_init_early(void)
 		do_barreleye_setup();
 	if (of_machine_is_compatible("tyan,palmetto-bmc"))
 		do_palmetto_setup();
+	if (of_machine_is_compatible("ibm,garrison-bmc"))
+		do_garrison_setup();
+
 }
 
 static void __init aspeed_map_io(void)
-- 
2.8.1
