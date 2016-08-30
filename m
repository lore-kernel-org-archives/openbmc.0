Return-Path: <xow@google.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sP01V5nTYzDrht
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 06:07:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=OSKq4x2L; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id x72so11082398pfd.2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPuJaJkZBnxmVg/iFhr77/IkEgNX5X9bUj5pMukYOM8=;
 b=OSKq4x2L9yqLfCypWuYVv8HjzlP2wasqxYOhBGGmpAeghFDICIf379SC61pZ//m4EE
 xoEi5d0ef4TPU6Ebxmy+I2B8W5OwMvG2qWfzv2moN1h9x9NVG3oVqwxwbO6/U/1AdDYG
 GbGBimRzMpURPPf7VPp1CFOXvZCrJ+EbNOBJPSSAPtARKH7d3hgnlK7mkgPJHFWE1Vct
 0GhPUyUC9QC3qoSUYbHevuqpyOL75oCfe5e0vfSHpWYgShGulEQJK/cZ/zrg7FCjVnmk
 F9Jtdumme3Apf8id8B2UdCNsB/mxT6P/IpA7bEh2Xu2ubzFucBmS81Ij8UDhAHCBWHnh
 r86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPuJaJkZBnxmVg/iFhr77/IkEgNX5X9bUj5pMukYOM8=;
 b=FNwmtif0fcTkD4g1E7Xk6Kyf8wyJl4KWUEMACvPCp7XkWy6kCclP/lrFF4Rg1Giu6R
 rv3GB0vwmlOEzMo08jkUE3j4rG1q+93/4dMwGgJsuFp1eoF3tAkuruFSADWcdSh86sLG
 99apcb+QM8XEWQzvGOEt/tPZmbknEVgsD0rOQ9TPbbEUDvjQeZxtEeSfWfkY/av5fjk0
 kBi1vK2RnXWEJ0Jj4KM4Dykl0viGd1rJntF3NTT3T097ICKfAZDA9uRQ6AdWiu7qaZM5
 y6155KpfH3CCIiriUwHHBkzaUexEaO65Dl+MfM06gebkSa4cR8bDAJZnfD6npTVXPta1
 iArw==
X-Gm-Message-State: AE9vXwM7FoVF50iCNAOGIfHGX1mKKdfltRA0WFvQOTSheyJb1Ormrt2FHCr85NPsp78gFzJK
X-Received: by 10.98.89.210 with SMTP id k79mr9588392pfj.43.1472587660707;
 Tue, 30 Aug 2016 13:07:40 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id y3sm59169033pfd.65.2016.08.30.13.07.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 30 Aug 2016 13:07:40 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] ARM: dts: aspeed: Add Ingrasys Zaius BMC DTS
Date: Tue, 30 Aug 2016 13:07:24 -0700
Message-Id: <1472587644-73391-2-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1472587644-73391-1-git-send-email-xow@google.com>
References: <1472587644-73391-1-git-send-email-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 30 Aug 2016 20:07:44 -0000

GPIO and LEDs coming later.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 210 +++++++++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 495ca3d..b9541c6 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -895,6 +895,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-firestone.dtb \
 	aspeed-bmc-opp-garrison.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
+	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-ast2500-evb.dtb
 endif
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
new file mode 100644
index 0000000..4c4754b
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -0,0 +1,210 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "Zaius BMC";
+	compatible = "ingrasys,zaius-bmc", "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x40000000>;
+	};
+
+	ahb {
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0xc4
+				0x20000000 0x04000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2500-fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+
+		host_pnor: spi@1e630000 {
+			reg = < 0x1e630000 0xc4
+				0x30000000 0x04000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2500-smc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+			};
+		};
+
+		data_pnor: spi@1e631000 {
+			reg = < 0x1e631000 0xc4
+				0x38000000 0x00800000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2500-smc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+			};
+		};
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	use-ncsi;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default>;
+};
+
+&i2c0 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	rtc@68 {
+		compatible = "nxp,pcf8523";
+		reg = <0x68>;
+	};
+
+	/* Power sequencer UCD90160 PMBUS @64h
+	 * FRU AT24C64D @50h
+	 * RTC PCF8523 @68h
+	 * Clock buffer 9DBL04 @6dh
+	 */
+};
+
+&i2c1 {
+	status = "disabled";
+
+	/* MUX1 PCA9546A @71h
+	 *   PCIe 0
+	 *   PCIe 1
+	 *   PCIe 2
+	 *   TPM header
+	 */
+};
+
+&i2c2 {
+	status = "disabled";
+
+	/* OCP Mezz Connector A (OOB SMBUS) */
+};
+
+&i2c3 {
+	status = "disabled";
+
+	/* OCP Mezz Connector A (PCIe slot SMBUS) */
+};
+
+&i2c4 {
+	status = "disabled";
+
+	/* MUX1 PCA9546A @71h
+	 *   PCIe 3
+	 *   PCIe 4
+	 */
+};
+
+
+&i2c5 {
+	status = "disabled";
+
+	/* CPU0 PRM 0.7V */
+	/* CPU0 PRM 1.2V CH03 */
+	/* CPU0 PRM 0.8V */
+	/* CPU0 PRM 1.2V CH47 */
+};
+
+&i2c6 {
+	status = "disabled";
+
+	/* CPU1 PRM 0.7V */
+	/* CPU1 PRM 1.2V CH03 */
+	/* CPU1 PRM 0.8V */
+	/* CPU1 PRM 1.2V CH47 */
+};
+
+&i2c7 {
+	status = "disabled";
+
+	/* MUX PCA9541A (other master: CPU0 PCIe 1)
+	 *   ADM1272 PMBUS @10h
+	 */
+	/* 12V SMPS Q54SH12050NNDH @61h */
+	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
+	/* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
+	/* CPU0 VR ISL68137 0.8V PMBUS @60h */
+	/* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
+	/* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
+};
+
+&i2c8 {
+	status = "disabled";
+
+	/* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
+	/* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
+	/* CPU1 VR ISL68137 0.8V PMBUS @61h */
+	/* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
+	/* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
+};
+
+
+&i2c9 {
+	status = "disabled";
+
+	/* Fan board */
+};
+
+&i2c10 {
+	status = "disabled";
+};
+
+&i2c11 {
+	status = "disabled";
+
+	/* GPU sideband */
+};
+
+&i2c12 {
+	status = "disabled";
+};
+
+&i2c13 {
+	status = "disabled";
+
+	/* MUX PI3USB102
+	 *   CPU0 debug
+	 *   CPU1 debug
+	 */
+};
+
+&vuart {
+	status = "okay";
+};
-- 
2.8.0.rc3.226.g39d4020
