Return-Path: <ray.lue@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=ray.lue@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qhgQDyaM"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pMPD54wrzDqPM
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 21:56:45 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id p6so7491779pgh.9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=atRIyakUCipLdZnsZF9FapNyS80y9DcZo+L0niZJjkU=;
 b=qhgQDyaMndX5Ugimwvrt69rmvEOU4f1aDx/KxZu3ZqoSJFvxCuljadKcc1VNZgVDtW
 OHW/DJs7fpDZeNq43l/V6RozVn40b7HHygsSMZvhni4sUp5ZSjPQsT2rKxy1vBN1SXwU
 y7E2JEvz6k0H0MkLL9sPbvfult0HjMQ3mTmupz+PkUBayxBum0dh6P5mv9u++nLQEnJr
 KDmeqQY82cGlzCdS0Uwrd4IgLid37I48xJsXYLKjWEqBlb6/YoRwDsWmWQhP6z+Orejb
 ht+kSImkRU4xrE5Lw8QsUKcFCqz0yF2szOIu9BUdPTB29pQTbwoTBvR8WsBpGpEC1fUG
 eohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=atRIyakUCipLdZnsZF9FapNyS80y9DcZo+L0niZJjkU=;
 b=Am3mu8FBIzOGtUDSKac42s8FWI+2bNJ92GMaSXFwnqfWutFtaiwdGNIleuBQxnI1mh
 XPsPEeXKOZLJWx4G52b7D6S6O8BYQIXElLXaNKsVnUhx0TTorQ0gPm9jdN2Qz8gcKnv/
 Z2rGLkKZKAXCWoooLWpLAVfJJhwa1YckQbQJ4Ph3OCEV0dwX38Kzx9ZtIbykQfHlMXl5
 yVJHTiA0zBdpaCpitnVPUVBeRev71ip5iriNgY/05CQALWqeIoO4v1CUaZmnIAWg2k8x
 hX4o2Ggre3TLqlKPCDWwZngY9SN68MmjLKSPSy2dd0Wt4IMMY7zFEXwtZDVRQNEc/AcB
 p7yQ==
X-Gm-Message-State: APjAAAXU589tEJs006uTNowrtcTt4WGLVCnyqysrZG3RdkVdVQO1GiSx
 RSLEqwpQ+gnBonWrLDKJtVpcJp4ilc8=
X-Google-Smtp-Source: APXvYqzkF5hV+37yocNuXKiA04WKd4NfKvPXvD6g1smymLkdVKgXHD9mKlBXoLJ2gqPLVDek0QeHIg==
X-Received: by 2002:a63:2b0d:: with SMTP id r13mr24514119pgr.400.1556020601293; 
 Tue, 23 Apr 2019 04:56:41 -0700 (PDT)
Received: from localhost.localdomain ([220.130.36.2])
 by smtp.gmail.com with ESMTPSA id y20sm22166215pfe.188.2019.04.23.04.56.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 04:56:39 -0700 (PDT)
From: "ray.lue" <ray.lue@gmail.com>
X-Google-Original-From: "ray.lue" <ray.lue@mic.com.tw>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: "ray.lue" <ray.lue@mic.com.tw>
Subject: [PATCH linux dev-5.0 1/1] ARM: dts: aspeed: Add s7106 BMC Machine
Date: Tue, 23 Apr 2019 19:56:32 +0800
Message-Id: <1556020592-27195-1-git-send-email-ray.lue@mic.com.tw>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2019 11:56:49 -0000

    s7106 is a Tyan platform family with an ASPEED AST2500 BMC.

Signed-off-by: ray.lue <ray.lue@mic.com.tw>
---
 arch/arm/boot/dts/Makefile                  |   3 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 174 ++++++++++++++++++++++++++++
 2 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100755 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bd40148..bc38f77 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
-	aspeed-bmc-quanta-q71l.dtb
+	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-tyan-s7106.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
new file mode 100755
index 0000000..b9801d1
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -0,0 +1,174 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "Tyan S7106 BMC";
+	compatible = "tyan,s7106-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@98000000 {
+			no-map;
+			reg = <0x98000000 0x00800000>; /* 8MB */
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 12>, <&adc 13>, <&adc 14>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 15>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		label = "bmc";
+		status = "okay";
+		m25p,fast-read;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+// UART1 is used only by the host. While the BMC does not need to access it,
+// enable it here to make sure the UART's clock gets enabled.
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&adc {
+	status = "okay";
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm3_default &pinctrl_pwm4_default>;
+
+	fan@0 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@1 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@2 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@3 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@4 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@5 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	nct7802@28 {
+		compatible = "nuvoton,nct7802";
+		reg = <0x28>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "at,24c256";
+		reg = <0x50>;
+	};
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
+&mac0 {
+	status = "okay";
+
+	use-ncsi;
+	no-hw-checksum;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+};
+
+&ibt {
+	status = "okay";
+};
-- 
2.7.4
