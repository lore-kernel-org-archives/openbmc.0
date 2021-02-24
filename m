Return-Path: <SRS0=psil=H2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5AEC433DB
	for <openbmc@archiver.kernel.org>; Wed, 24 Feb 2021 19:05:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A303864F1A
	for <openbmc@archiver.kernel.org>; Wed, 24 Feb 2021 19:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A303864F1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm52y0lmxz3ck3
	for <openbmc@archiver.kernel.org>; Thu, 25 Feb 2021 06:05:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm52F5LBRz30Mb;
 Thu, 25 Feb 2021 06:04:37 +1100 (AEDT)
IronPort-SDR: 8Pm/LsX0zcJ3sA42TTBZtx3Zof4ce/9ZdWI6EpVS9qgkEoQrfBsl6DDm0FEEcodyssJhlF5EQn
 DgC0TS3Fb4ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="184578384"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="184578384"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 11:04:31 -0800
IronPort-SDR: AZpPr18JmMZMHZ62/FIp9wAuQDpySyX+dhaOvE+3yY16rmLIlalEJEwjD0dvudF8xAFGIGz892
 stlXlZG3HLhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="367098917"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2021 11:04:31 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Subject: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
Date: Wed, 24 Feb 2021 11:17:17 -0800
Message-Id: <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Append bindings to support transfer mode.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes since v3:
- None

Changes since v2:
- Moved SRAM resources back to default dtsi and added mode selection
  property.

Changes since v1:
- Removed buffer reg settings from default device tree and added the settings
  into here to show the predefined buffer range per each bus.

 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
index b47f6ccb196a..242343177324 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -17,6 +17,20 @@ Optional Properties:
 - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
 		  specified
 - multi-master	: states that there is another master active on this bus.
+- aspeed,i2c-xfer-mode	: should be "byte", "buf" or "dma" to select transfer
+			  mode defaults to "byte" mode when not specified.
+
+			  I2C DMA mode on AST2500 has these restrictions:
+			    - If one of these controllers is enabled
+				* UHCI host controller
+				* MCTP controller
+			      I2C has to use buffer mode or byte mode instead
+			      since these controllers run only in DMA mode and
+			      I2C is sharing the same DMA H/W with them.
+			    - If one of these controllers uses DMA mode, I2C
+			      can't use DMA mode
+				* SD/eMMC
+				* Port80 snoop
 
 Example:
 
@@ -26,20 +40,29 @@ i2c {
 	#size-cells = <1>;
 	ranges = <0 0x1e78a000 0x1000>;
 
-	i2c_ic: interrupt-controller@0 {
-		#interrupt-cells = <1>;
-		compatible = "aspeed,ast2400-i2c-ic";
+	i2c_gr: i2c-global-regs@0 {
+		compatible = "aspeed,ast2500-i2c-gr", "syscon";
 		reg = <0x0 0x40>;
-		interrupts = <12>;
-		interrupt-controller;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x40>;
+
+		i2c_ic: interrupt-controller@0 {
+			#interrupt-cells = <1>;
+			compatible = "aspeed,ast2500-i2c-ic";
+			reg = <0x0 0x4>;
+			interrupts = <12>;
+			interrupt-controller;
+		};
 	};
 
 	i2c0: i2c-bus@40 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
-		reg = <0x40 0x40>;
-		compatible = "aspeed,ast2400-i2c-bus";
+		reg = <0x40 0x40>, <0x200 0x10>;
+		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		bus-frequency = <100000>;
-- 
2.17.1

