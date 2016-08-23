Return-Path: <prvs=7043a21156=mattconolly@fb.com>
X-Greylist: delayed 2387 seconds by postgrey-1.35 at bilbo;
 Wed, 24 Aug 2016 09:23:40 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b=p+Wg8H7C; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJmhr0XNfzDrcJ
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 09:23:38 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.17/8.16.0.17) with SMTP id u7NMfn7G027202
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 15:43:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fb.com;
 h=from : to : cc : subject :
 date : message-id : mime-version : content-type; s=facebook;
 bh=LskLuEY8R+qR4ymU11DxJW5D3HAKrutRoHDtBlczDhk=;
 b=p+Wg8H7C0SAf0fubIjhDh48Udql5wCI2fBRNE2enO8+VoNYdmUVtXC2j2C8iPw/71RaF
 JG7t5hRu4Y948/0vPDDD5tB9+zDOxxIhg+qVTJhIC/Vdtx8SSRhcpCjD5fC3u/ZzmUyc
 OvYS0FluLwYyrVWuDq2ETV/6rTqNOocHBvo= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 250t9au6y5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 15:43:49 -0700
Received: from mx-out.facebook.com (192.168.52.123) by
 PRN-CHUB11.TheFacebook.com (192.168.16.21) with Microsoft SMTP Server (TLS)
 id 14.3.294.0; Tue, 23 Aug 2016 15:43:47 -0700
Received: from facebook.com (2401:db00:11:d0a6:face:0:13:0)	by
 mx-out.facebook.com (10.223.100.99) with ESMTP	id
 0d195866698311e6bb7424be05956610-4ddfbaa0 for <openbmc@lists.ozlabs.org>;
 Tue, 23 Aug 2016 15:43:46 -0700
Received: by devbig293.prn1.facebook.com (Postfix, from userid 9402)	id
 C7C2767008B8; Tue, 23 Aug 2016 15:43:42 -0700 (PDT)
From: Matthew Conolly <mattconolly@fb.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH v3] arm/dts/aspeed: Add minimal Facebook CMM BMC board based
 on AST2500
Date: Tue, 23 Aug 2016 15:43:40 -0700
Message-ID: <1471992220-3192885-1-git-send-email-mattconolly@fb.com>
X-Mailer: git-send-email 2.8.0.rc2
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-23_13:, , signatures=0
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
X-List-Received-Date: Tue, 23 Aug 2016 23:23:41 -0000

Minimal device tree for CMM bmc board to boot into a console over UART with some drivers functional.

Signed-off-by: Matthew Conolly <mattconolly@fb.com>
---

I'm going to start looking at the UART1 pinctl that Andrew mentioned 

v3:
Changed fmc compatible string to use "aspeed,ast2400-fmc" as per review

v2:
Rebased patch on the openbmc github dev-4.7 branch
Removed commented out eeprom
Removed of_machine_is_compatible for LPC/UART config
checkpatch whitespace fixup




 arch/arm/boot/dts/Makefile                         |   1 +
 .../dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi  |  24 +++++
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      | 100 +++++++++++++++++++++
 3 files changed, 125 insertions(+)
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
index 0000000..1b3bb22
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -0,0 +1,100 @@
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
+			compatible = "aspeed,ast2400-fmc";
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
