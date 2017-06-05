Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh6Hp3cHczDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 17:43:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NpDjTT0I"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id v18so5582795pgb.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=MvfgiPuo0oz38mScg7Aodj9TSUKkKLltv77jmjhi0FE=;
 b=NpDjTT0IeH2HZk+Ttor11E/z2zNoqeh1kFRsPRdUhI7APPUMCWpHgTzusZO7FuhJ/7
 ebZEX2GuuElh+ElI226Z9rVegxA40Nk+yQiHNZzWbLLSu/vbBn0jKMOAjmcWnT9wbZj3
 C/aldQfcvU/MpTitLmfPkt11lkXLW2207mf1yRDF8e+47UADIOcvGdbag04THpP0kAuK
 G5qjRSjh6OEMutICFywbOp+yM/0LvT0kfxIgmph/adGq2LFVjoZaOmqOH25/ZlA5/9jF
 qss+jA5GhNOAcdBa6Isr6KZyLlpcji6Ogy+wh7QEc8hKJFcnFm4ZWAVOcFLhY68pLcDE
 75DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=MvfgiPuo0oz38mScg7Aodj9TSUKkKLltv77jmjhi0FE=;
 b=hoagH1RCKiPlZPxqVcW3raqnGgyMkVK3v55kawdFCWWRMN4qQmm7BvRxYzfNJvgTvc
 G2E8yv2l+sn6usNKj2FUBI97SrSgKhiOCiS+GwxMTmxp4Yx1a0kBMeIP5PLuWSe7zab1
 KrKzolMLMLL7aiwixjk8Ki9LsZsyV4wjFn/YZ7LkzCb0KfCOVRQvovuOBuOH+uvp+OhR
 1evTg+VGIVxfJdWCXVi+D4Js3kAsP4R5O9WzJpXOUUjqpy1DXPEkp2lCQyr2bI8Tow1Y
 tGgGHIgqMe9u+Tme17tShU63e6Ar3A1nTJXVLtsRZHaZmjP6borsggQZRLqxs4GxKK9/
 mwQA==
X-Gm-Message-State: AODbwcAOJ82XG3kzeJP1ePF19oMh31lb3p1jZ2NN1eA/1cwOgFqNXFO2
 OfhE9pEN9wUkj+fY2sH5gw==
X-Received: by 10.101.88.8 with SMTP id g8mr16918277pgr.180.1496648596182;
 Mon, 05 Jun 2017 00:43:16 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id x27sm5028876pfe.113.2017.06.05.00.43.12
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Jun 2017 00:43:15 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 05 Jun 2017 17:13:09 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
	Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Add devices under FSI CFAM
Date: Mon,  5 Jun 2017 17:13:01 +0930
Message-Id: <20170605074301.11310-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 05 Jun 2017 07:43:19 -0000

This describes the SBE FIFO and OCC device that are attached via the FSI
bus.

As this layout is common to all existing p9 machines, we add them via a
dtsi.  This dtsi requires the 'fsi' label be present.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  8 +++--
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  8 +++--
 arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 45 ++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/ibm-power9-cfam.dtsi

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 03cde39189c5..dd01dfaa8509 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -47,10 +47,10 @@
 		};
 	};
 
-	gpio-fsi {
+	fsi: gpio-fsi {
 		compatible = "fsi-master-gpio", "fsi-master";
-
-		status = "okay";
+		#address-cells = <2>;
+		#size-cells = <0>;
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
@@ -70,6 +70,8 @@
 	};
 };
 
+#include "ibm-power9-cfam.dtsi"
+
 &fmc {
 	status = "okay";
 	flash@0 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 3001597d42d9..42b70a5d57aa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -63,10 +63,10 @@
 		};
 	};
 
-	gpio-fsi {
+	fsi: gpio-fsi {
 		compatible = "fsi-master-gpio", "fsi-master";
-
-		status = "okay";
+		#address-cells = <2>;
+		#size-cells = <0>;
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
@@ -81,6 +81,8 @@
 	};
 };
 
+#include "ibm-power9-cfam.dtsi"
+
 &fmc {
 	status = "okay";
 	flash@0 {
diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
new file mode 100644
index 000000000000..5beb978f9f31
--- /dev/null
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -0,0 +1,45 @@
+&fsi {
+	cfam@0,0 {
+		reg = <0 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			occ@1 {
+				compatible = "ibm,p9-occ";
+				reg = <1>;
+			};
+		};
+
+		hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			cfam@1,0 {
+				reg = <1 0>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				sbefifo@2400 {
+					compatible = "ibm,p9-sbefifo";
+					reg = <0x2400 0x400>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					occ@2 {
+						compatible =
+							"ibm,p9-occ";
+						reg = <2>;
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.11.0
