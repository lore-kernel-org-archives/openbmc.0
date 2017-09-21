Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TLGyxPfT"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyTDX54glzDsMr
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 17:45:32 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id g65so2191461pfe.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=zi4Gkih241Qrw+E1Yjjl5JJgTftwz/4xYErIhGpupHc=;
 b=TLGyxPfTRUuqblVMDbjtRHYIj12qNG/LX2vZuWXVwegkqI4rq1Nt4H2rLNnt8G0ZFo
 gQVeesGvjGP70Lm4Cl9PLZmiyOimr/pPVP3NCjZ76/2jmpM81CmPufXvZKHOaObWQiRI
 FlBnMDM/B3adodXMQGdoP3XX7Kw0tiD1ZAvmXtn0eEVTR8VFoaCT65sdPydKcHApAaFR
 52AaqFDPQ3mpKf3M6H1PB7o6GlD+LXv/2Hugw/+3e2Xy+CUAE2/A+L5qOqxKp4Eo4iIQ
 Ukhi8ocyDgdkPXlkC67HIsWJHTlpWtwBWiF6bpzRLXlR3GvzCMv59SV6C26+Am3vLQUW
 OY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=zi4Gkih241Qrw+E1Yjjl5JJgTftwz/4xYErIhGpupHc=;
 b=sR23X3fAjUhYeWa1w+bcQ5AZOEQk2lN8G0nLZbGwuyiBTHbz/e6nGY3bEURewAz3Rh
 TrOLCktZ1R4xvrMMuc8JauycKHpLC/6OytUXu6sXaR0fyJTNLmV7XHMAFoeNEOKsYJ++
 exGrilL41EfUyzEwcIaTH97V+xbgsTfgkblmdqNc8wrFlVOhKxznw1iYzIa/1rbYSls5
 ioi7hZ+4EZDoZUoxxvemypdWj6CYyS/RmrOR64cu7b69+5n2rC58DFnnZwjfZsJaJkSa
 rvL4w0vA2ZRZ8h/SrRPpotfqXw1iaOt1tlOSnjuHppr7hzHM+q4P34aWCkkWVuCdx91I
 Vr2g==
X-Gm-Message-State: AHPjjUg81v/Z1ttWsh2abo8S/fryFQOSPrDP72GsWG/hgDoPGYdKyv5I
 beEaPLJVuQ6Y0MCIMEF72Wwcj+kiEuQ=
X-Google-Smtp-Source: AOwi7QDMEIO8EUTW2eGbJAQlWeKFNItuCocu3THE1oYDlzjX06i8g212GzKAM98i+C6pC35Hp9nnwA==
X-Received: by 10.84.131.105 with SMTP id 96mr4740768pld.229.1505979930433;
 Thu, 21 Sep 2017 00:45:30 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id z1sm1351279pge.45.2017.09.21.00.45.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Sep 2017 00:45:29 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 21 Sep 2017 17:15:22 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Rick Altherr <raltherr@google.com>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ranges to SCU node
Date: Thu, 21 Sep 2017 17:15:21 +0930
Message-Id: <20170921074521.22796-1-joel@jms.id.au>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 07:45:33 -0000

The SCU contains a number of devices. To date we have the pinctrl node,
which doesn't have a reg property, the out of tree clock drivers which
do have a single address in their reg properties, and the timeriomem
node which has an address and length.

From now on we will use a ranges property, allowing all of the devices
under the SCU to specify an address and size starting from the SCU base.

This allows the timeriomem node to live under the SCU syscon node. This change
is required to get the timeriomem driver to probe on the ast2400.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This supersedes http://patchwork.ozlabs.org/patch/816677/ following discussion
with Jeremy and Andrew.

 arch/arm/boot/dts/aspeed-g4.dtsi | 21 +++++++++++----------
 arch/arm/boot/dts/aspeed-g5.dtsi | 31 ++++++++++++++++---------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index a83b6a8d73d4..6151704aa87e 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -158,9 +158,14 @@
 			syscon: syscon@1e6e2000 {
 				compatible = "aspeed,g4-scu", "syscon", "simple-mfd";
 				reg = <0x1e6e2000 0x1a8>;
+				ranges = <0x0 0x1e6e2000 0x1a8>;
 
 				#address-cells = <1>;
-				#size-cells = <0>;
+				#size-cells = <1>;
+
+				pinctrl: pinctrl@1e6e2000 {
+					compatible = "aspeed,g4-pinctrl";
+				};
 
 				clk_clkin: clk_clkin {
 					#clock-cells = <0>;
@@ -171,40 +176,36 @@
 				clk_hpll: clk_hpll@70 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g4-hpll-clock";
-					reg = <0x70>;
+					reg = <0x70 0x0>;
 					clocks = <&clk_clkin>;
 				};
 
 				clk_ahb: clk_ahb@70 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g4-ahb-clock";
-					reg = <0x70>;
+					reg = <0x70 0x0>;
 					clocks = <&clk_hpll>;
 				};
 
 				clk_apb: clk_apb@08 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g4-apb-clock";
-					reg = <0x08>;
+					reg = <0x08 0x0>;
 					clocks = <&clk_hpll>;
 				};
 
 				clk_uart: clk_uart@2c{
 					#clock-cells = <0>;
 					compatible = "aspeed,g4-uart-clock";
-					reg = <0x2c>;
+					reg = <0x2c 0x0>;
 				};
 
 				hwrng@1e6e2078 {
 					compatible = "timeriomem_rng";
-					reg = <0x1e6e2078 0x4>;
+					reg = <0x78 0x4>;
 					period = <1>;
 					quality = <100>;
 				};
-
-				pinctrl: pinctrl@1e6e2000 {
-					compatible = "aspeed,g4-pinctrl";
-				};
 			};
 
 			adc: adc@1e6e9000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 9a988f69e610..ba3607c788e8 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -207,55 +207,56 @@
 			syscon: syscon@1e6e2000 {
 				compatible = "aspeed,g5-scu", "syscon", "simple-mfd";
 				reg = <0x1e6e2000 0x1a8>;
+				ranges = <0x0 0x1e6e2000 0x1a8>;
 
 				#address-cells = <1>;
-				#size-cells = <0>;
+				#size-cells = <1>;
+
+				pinctrl: pinctrl@1e6e2000 {
+					compatible = "aspeed,g5-pinctrl";
+				};
 
 				clk_clkin: clk_clkin@70 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g5-clkin-clock";
-					reg = <0x70>;
+					reg = <0x70 0x0>;
 				};
 
 				clk_hpll: clk_hpll@24 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g5-hpll-clock";
-					reg = <0x24>;
+					reg = <0x24 0x0>;
 					clocks = <&clk_clkin>;
 				};
 
 				clk_ahb: clk_ahb@70 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g5-ahb-clock";
-					reg = <0x70>;
+					reg = <0x70 0x0>;
 					clocks = <&clk_hpll>;
 				};
 
 				clk_apb: clk_apb@08 {
 					#clock-cells = <0>;
 					compatible = "aspeed,g5-apb-clock";
-					reg = <0x08>;
+					reg = <0x08 0x0>;
 					clocks = <&clk_hpll>;
 				};
 
 				clk_uart: clk_uart@2c {
 					#clock-cells = <0>;
 					compatible = "aspeed,g5-uart-clock";
-					reg = <0x2c>;
+					reg = <0x2c 0x0>;
 				};
 
-				pinctrl: pinctrl@1e6e2000 {
-					compatible = "aspeed,g5-pinctrl";
+				hwrng@1e6e2078 {
+					compatible = "timeriomem_rng";
+					reg = <0x78 0x4>;
+					period = <1>;
+					quality = <100>;
 				};
 			};
 
-			hwrng@1e6e2078 {
-				compatible = "timeriomem_rng";
-				reg = <0x1e6e2078 0x4>;
-				period = <1>;
-				quality = <100>;
-			};
-
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2500-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;
-- 
2.14.1
