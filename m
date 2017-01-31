Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCZlZ3KbKzDq99
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 05:38:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tj2fKhaj"; 
 dkim-atps=neutral
Received: by mail-pf0-x22b.google.com with SMTP id f144so109627907pfa.2
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=K3u0WGl3HsWqaOZb2UcPohKH+HkS1Dh+BEppUyyZFH4=;
 b=tj2fKhaj1H1QsaCFmnziSfOw9tJWxGgCu0DfHYK5IOeJrS7bMeCJ4FElg953V8Z/D9
 5nXTxMv+mKoQEzQ1P7eQKfMmx6dUgEnnVeeASs+Rs6ZAOthdmHxc9S8khFiPNnkivlrK
 8fy/nBpJKGCTU7GEnip7fuZbXXXXW9oF03iBYbSYOWoth9xLUeXrUg4WdQa0ab6qXazv
 JVW/4gWKHb44BlCf8giNVGR4Ck7kU+Wih6on0yDT78zivg+nbIASOE1Egsots9ttJIDA
 fZlH46MQKAFIMd8h/o7l7rLxSeXYSWf7BMfhx8lZm6D9EMllFiVaderZMkIoY0iPrPc5
 587w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=K3u0WGl3HsWqaOZb2UcPohKH+HkS1Dh+BEppUyyZFH4=;
 b=rELY3GQSOX2CquYElbPbvjBOxbcDDpWm4zY2x223a29WBnwOC0sz8+qwMetiZTV95N
 9e2/0IoNRPjSG+mdKyluRFP43Bwn9fGkjermV1ckc0TeE43eb63+uNjF5pi70yql2O/p
 Xw90sy4dt0cpUmiY/2YtZFbBUw1RuNCJahl9MAf4+9++3LXKvT95/Mn6fJMQ3/vRvYSa
 ifRgcKczXeB8fayqm9fEwSrvbDEBaStf7gl6/cc1cTFMIERJDBc+YrAndtyt9iFKrCT2
 bsc8Q6Rt74dEAga//58bRwDE5her0h/oOqUx7gcKI3mpgwbAJDTme4I2zevxEwLSFquw
 5u/g==
X-Gm-Message-State: AIkVDXKrcWS5UqPcFWBT06O44h0Gys5KNw6e7EUc+BF+QBmO/+vY6BkynBldqtvGVVLb5L/Z
X-Received: by 10.84.217.68 with SMTP id e4mr40935366plj.99.1485887910426;
 Tue, 31 Jan 2017 10:38:30 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id s8sm42974095pfj.30.2017.01.31.10.38.29
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Jan 2017 10:38:29 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] dts: Minimal device tree for Quanta Q71L BMC
Date: Tue, 31 Jan 2017 10:38:28 -0800
Message-Id: <20170131183828.30671-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Tue, 31 Jan 2017 18:38:35 -0000

Supports:
  - BMC console UART
  - BMC boot flash
  - host boot flash
  - host virtual UART (host console)

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts | 86 ++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts
new file mode 100644
index 000000000000..cd92e6f7c365
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts
@@ -0,0 +1,86 @@
+/dts-v1/;
+
+#include "aspeed-g4.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Quanta Q71L BMC";
+	compatible = "quanta,q71l-bmc", "aspeed,ast2400";
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
+		reg = <0x40000000 0x8000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@5f000000 {
+			no-map;
+			reg = <0x5f000000 0x01000000>; /* 16MB */
+		};
+	};
+
+	ahb {
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-fmc";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+
+		host_pnor: spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x01000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-smc";
+			flash {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+			};
+		};
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
+
+			&pinctrl_vgahs_default &pinctrl_vgavs_default
+			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
+};
+
+&mac0 {
+	status = "okay";
+
+	use-ncsi;
+	no-hw-checksum;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+};
-- 
2.11.0.483.g087da7b7c-goog
