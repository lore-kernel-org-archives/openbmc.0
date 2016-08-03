Return-Path: <prvs=7023bd758a=mattconolly@fb.com>
X-Greylist: delayed 2016 seconds by postgrey-1.35 at bilbo;
 Thu, 04 Aug 2016 09:41:21 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b=cJOHMjtn; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4V2T0qnVzDqQ4
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 09:41:19 +1000 (AEST)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u73N5jo0012263
 for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2016 16:07:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fb.com;
 h=from : to : cc : subject :
 date : message-id : mime-version : content-type; s=facebook;
 bh=xH1UpZWk47dWff6RyK0fAI7loqnXrYz3MUfo9VEVUXY=;
 b=cJOHMjtnB3WaZ6GUBH7+t7NwLXwll7r3IwkbYo4ZX3us0V5qS6uS0Rx9GRLsfYAp0J/O
 OaPsrdKkTnz3AXePRHAjDlouyzSV70KEiupSf8arBaP9jrFa8ctylS0XG4RcsRBoJUsh
 JldsZm1cMP0txWJLco3nm0KY3LJWvojgfqg= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 24kpyes29m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 16:07:41 -0700
Received: from mx-out.facebook.com (192.168.52.123) by
 PRN-CHUB08.TheFacebook.com (192.168.16.18) with Microsoft SMTP Server (TLS)
 id 14.3.294.0; Wed, 3 Aug 2016 16:07:41 -0700
Received: from facebook.com (2401:db00:11:d0a6:face:0:13:0)	by
 mx-out.facebook.com (10.212.236.89) with ESMTP	id
 13b14c8859cf11e683cf0002c95209d8-ceffdaf0 for <openbmc@lists.ozlabs.org>;
 Wed, 03 Aug 2016 16:07:40 -0700
Received: by devbig293.prn1.facebook.com (Postfix, from userid 9402)	id
 0B5036A80C95; Wed,  3 Aug 2016 16:07:40 -0700 (PDT)
From: Matthew Conolly <mattconolly@fb.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH] arm/dts/aspeed: Add minimal Facebook CMM BMC board based on
 AST2500
Date: Wed, 3 Aug 2016 16:07:31 -0700
Message-ID: <1470265651-3679131-1-git-send-email-mattconolly@fb.com>
X-Mailer: git-send-email 2.8.0.rc2
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-03_16:, , signatures=0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2016 23:41:21 -0000

A minimal device tree to let the CMM bmc board boot to a console over UART with some drivers functional

Signed-off-by: Matthew Conolly <mattconolly@fb.com>
---
 arch/arm/boot/dts/Makefile                         |   1 +
 .../dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi  |  24 +++++
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      | 112 +++++++++++++++++++++
 arch/arm/mach-aspeed/aspeed.c                      |   5 +-
 4 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3c27d57..21fe59b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -843,6 +843,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-barreleye.dtb \
 	aspeed-bmc-opp-firestone.dtb \
 	aspeed-bmc-opp-garrison.dtb \
+	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-ast2500-evb.dtb
 endif
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
new file mode 100644
index 0000000..1b3133f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
@@ -0,0 +1,24 @@
+/* This file is the label for the bmc primary flash and its partitions */
+				label = "bmc";
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				u-boot {
+					reg = < 0 0x80000 >;
+					label = "u-boot";
+				};
+				u-boot-env {
+					reg = < 0x60000 0x20000 >;
+					label = "u-boot-env";
+				};
+				kernel  {
+					reg = < 0x80000 0x280000 >;
+					label = "kernel";
+				};
+				initramfs {
+					reg = < 0x300000 0x300000 >;
+					label = "initramfs";
+				};
+				pd_rootfs  {
+					reg = < 0x4c0000 0x1740000 >;
+					label = "pd_rootfs";
+				};
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
new file mode 100644
index 0000000..4ea8e7e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -0,0 +1,112 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "FACEBOOK CMM BMC";
+	compatible = "facebook,cmm-bmc", "aspeed,ast2500";
+
+	aliases {
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+		bootargs = "console=ttyS1,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x3f000000>;
+	};
+
+	ahb {
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+#include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
+			};
+		};
+  };
+
+
+
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "disabled";
+};
+
+&mac1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+
+//	eeprom@50 {
+//		compatible = "atmel,24c08";
+//		reg = <0xa0>;
+//	};
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index db540ac..da03fed 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -202,8 +202,9 @@ static void __init do_ast2500evb_setup(void)
 
 static void __init aspeed_init_early(void)
 {
-	// XXX UART stuff to fix to pinmux & co
-	writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));
+	if (!of_machine_is_compatible("facebook,cmm-bmc"))
+		/* XXX UART stuff to fix to pinmux & co */
+		writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));
 
 	/* Unlock SCU */
 	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU));
-- 
2.8.0.rc2
