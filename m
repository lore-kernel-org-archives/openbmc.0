Return-Path: <prvs=7030e684c9=mattconolly@fb.com>
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8GCS3Z63zDqJ5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 13:02:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b=EKeeeGu9; 
 dkim-atps=neutral
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u7A323aD015375
 for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2016 20:02:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fb.com;
 h=from : to : cc : subject :
 date : message-id : mime-version : content-type; s=facebook;
 bh=rKwa4LZrupQarg3CusDHRUfOy/XDPVzKLuAm6xIRnp8=;
 b=EKeeeGu9HaoAhnLMkUvPPnQUP4dZQ2yvepC1IrP92IZymE9/YurRhYMk7+oW8/kf4DM4
 /67+Y1JzSio23WImIuDl7wv1fpFx8A9tmoZaOwkVAL3sFOth3kq2hcOhh6pBTOdGrg6u
 4xOPJR1Z7v0ZvpxBszBU8Ak4nDgHiBbgNrk= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 24qmf822f7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2016 20:02:09 -0700
Received: from mx-out.facebook.com (192.168.52.123) by
 PRN-CHUB05.TheFacebook.com (192.168.16.15) with Microsoft SMTP Server (TLS)
 id 14.3.294.0; Tue, 9 Aug 2016 20:02:08 -0700
Received: from facebook.com (2401:db00:11:d0a6:face:0:13:0)	by
 mx-out.facebook.com (10.102.107.99) with ESMTP	id
 d32e20dc5ea611e6b5000002c99293a0-e84f9aa0 for <openbmc@lists.ozlabs.org>;
 Tue, 09 Aug 2016 20:02:08 -0700
Received: by devbig293.prn1.facebook.com (Postfix, from userid 9402)	id
 1E3C36A80895; Tue,  9 Aug 2016 20:02:08 -0700 (PDT)
From: Matthew Conolly <mattconolly@fb.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH v2] arm/dts/aspeed: Add minimal Facebook CMM BMC board based
 on AST2500
Date: Tue, 9 Aug 2016 20:02:01 -0700
Message-ID: <1470798121-725657-1-git-send-email-mattconolly@fb.com>
X-Mailer: git-send-email 2.8.0.rc2
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-10_02:, , signatures=0
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
X-List-Received-Date: Wed, 10 Aug 2016 03:02:13 -0000

Minimal device tree for CMM bmc board to boot into a console over UART with some drivers functional.

Signed-off-by: Matthew Conolly <mattconolly@fb.com>
---

Rebased patch on the openbmc github dev-4.7 branch

v2:
Removed commented out eeprom
Removed of_machine_is_compatible for LPC/UART config
checkpatch whitespace fixup

 arch/arm/boot/dts/Makefile                         |   1 +
 .../dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi  |  24 +++++
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      | 104 +++++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 048fbb5..495ca3d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -895,6 +895,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-firestone.dtb \
 	aspeed-bmc-opp-garrison.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
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
index 0000000..dcfa303
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -0,0 +1,104 @@
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
+	};
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
-- 
2.8.0.rc2
