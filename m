Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BX9f1xJBzDrcd;
 Fri, 22 Jun 2018 05:40:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 12:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,253,1526367600"; d="scan'208";a="66157691"
Received: from maru.jf.intel.com ([10.54.51.80])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2018 12:40:35 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH linux-next v6 05/13] ARM: dts: aspeed: peci: Add PECI node
Date: Thu, 21 Jun 2018 12:40:34 -0700
Message-Id: <20180621194034.20813-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 19:40:39 -0000

This commit adds PECI bus/adapter node of AST24xx/AST25xx into
aspeed-g4 and aspeed-g5.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 26 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 75df1573380e..f7b83298e25f 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -29,6 +29,7 @@
 		serial3 = &uart4;
 		serial4 = &uart5;
 		serial5 = &vuart;
+		peci0 = &peci0;
 	};
 
 	cpus {
@@ -295,6 +296,13 @@
 				};
 			};
 
+			peci: peci@1e78b000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e78b000 0x60>;
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
@@ -338,6 +346,24 @@
 	};
 };
 
+&peci {
+	peci0: peci-bus@0 {
+		compatible = "aspeed,ast2400-peci";
+		reg = <0x0 0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <15>;
+		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
+		resets = <&syscon ASPEED_RESET_PECI>;
+		clock-frequency = <24000000>;
+		msg-timing = <1>;
+		addr-timing = <1>;
+		rd-sampling-point = <8>;
+		cmd-timeout-ms = <1000>;
+		status = "disabled";
+	};
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 17f2714d18a7..f8eccdaacedc 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -29,6 +29,7 @@
 		serial3 = &uart4;
 		serial4 = &uart5;
 		serial5 = &vuart;
+		peci0 = &peci0;
 	};
 
 	cpus {
@@ -352,6 +353,13 @@
 				};
 			};
 
+			peci: peci@1e78b000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e78b000 0x60>;
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
@@ -395,6 +403,24 @@
 	};
 };
 
+&peci {
+	peci0: peci-bus@0 {
+		compatible = "aspeed,ast2500-peci";
+		reg = <0x0 0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <15>;
+		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
+		resets = <&syscon ASPEED_RESET_PECI>;
+		clock-frequency = <24000000>;
+		msg-timing = <1>;
+		addr-timing = <1>;
+		rd-sampling-point = <8>;
+		cmd-timeout-ms = <1000>;
+		status = "disabled";
+	};
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
-- 
2.17.1
