Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C92606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:54:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFVgk64h6z30Tf;
	Thu, 29 Oct 2026 14:53:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793245986;
	cv=none; b=H4IF1OABopbsEDXdst5weJBgDS+WlCnZ4dlyMhf92bBpavNc7tpuAYCccO6Em/d5x13fIZWJpbO704rxIw3gfHyipYzDJiYXueZ3GN9TUnAIWeQSQRvInMfojcri2EXA5nJacf2J+ySSJX6FPf2Pk8hDb85XGzGlE7IJHwqSgnQaIiG8Xqzy4oFLaemB+W6/xPZNlSFsVipTWMsx0fg7zK3l7RhuIg8LSp076JkRvexzr2ny2IYCtkgy1Dcx8rwPWObArKm/sdHiJAPx85J7v+dSGFzN55vYkkzviF82dDjeUZkmAxFaRFHWV5soRIPzg9RQoLGc0TFYAlXcJL03Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793245986; c=relaxed/relaxed;
	bh=JPz4C6KNM3ynStT18iIOxim6Bp6CJ7vcpp9SbW+zje8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEiXGpMTq+IocJhr6MEpG05+HOxxyCSm2ucW8l+6c07h2v5Tq9x0efyNY+mZZxLV0ONEI/tJ0Qrg8462qtlqdIl4cFPG1U+bSr7NCdn4y84sHlxoJKKmR9im0KqsZlh8XP9/13MzEC2WFOeigB7lSeWxZjdG3G5di3ty6oMNLv1qz94xzA7KdUt1P85D/KB2E0FWj5XbSYRLKsD8hpjYij6ZGkhSrR/74C/8aniBeIB+ojzT2MVBI1TUsTkyLIkqoJN0P2yQhLowr7DKLeNPFv/XoIn1IZ1SkwqbqAy8/R9FdxiJmiXp2kv53pJz/9KX2LdkzoN1kUcNEiqvHktj1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFVgj4x8kz30T8
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:53:05 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:52:43 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:52:43 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH linux dev-6.18 5/5] arm64: dts: aspeed: Fix duplicate pinctrl labels and address scheme
Date: Thu, 29 Oct 2026 11:52:40 +0800
Message-ID: <20261029035242.651988-6-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029035242.651988-1-vince_chang@aspeedtech.com>
References: <20261029035242.651988-1-vince_chang@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ryan Chen <ryan_chen@aspeedtech.com>

A report from shashiko-bot highlighted some concerns concurrent to
application of the series[1].

Fix duplicate pinctrl_tach{0-15} and pinctrl_n{cts,dcd,dsr,ri}5 labels
in aspeed-g7-soc1-pinctrl.dtsi. These didn't cause errors from dtc
because dtc accepts duplicate labels for duplicate nodes specified
through a node reference[2].

Drop the cpu-index from secondary/tertiary container nodes: reduce
the "#address-cells" from 2 to 1 and update unit-addresses and reg
accordingly. The 2-cell scheme was proposed in an early mailing list
sketch to prompt discussion[3], but the design evolved in ways that made
it unnecessary.

Also remove URL comments from the DTS. The links were to comments in
the kernel sources with discussion justifying the approach, but are not
necessary to carry forward.

[arj: Extend discussion in the commit message]

Link: https://lore.kernel.org/all/20260609025708.ADBFE1F00893@smtp.kernel.org/ [1]
Link: https://lore.kernel.org/all/b226339bb2abe42ce23e90eadbc654b426131083.camel@codeconstruct.com.au/ [2]
Link: https://lore.kernel.org/all/1a2ca78746e00c2ec4bfc2953a897c48376ed36f.camel@codeconstruct.com.au/ [3]
Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device tree")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Link: https://patch.msgid.link/20260611-dtsi_fix-v1-1-ef2b7cd86d6d@aspeedtech.com
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Link: https://lore.kernel.org/r/20260612-aspeed-arm64-dt-v1-1-d1d1a4737905@codeconstruct.com.au
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 9e84fd546dc3f9f97bfbf2717c2d71d878a4f46f)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi |  14 ++-
 .../dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi    | 102 ------------------
 2 files changed, 6 insertions(+), 110 deletions(-)

diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
index ef283d95649a..58193c3c3696 100644
--- a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
+++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
@@ -84,32 +84,30 @@ l2: l2-cache0 {
 	};
 
 	secondary {
-		#address-cells = <2>;
-		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/address.c?h=v6.16#n491 */
+		#address-cells = <1>;
 		#size-cells = <0>;
-		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/address.c?h=v6.16#n430 */
 
-		ssp_nvic: interrupt-controller@1,e000e100 {
+		ssp_nvic: interrupt-controller@e000e100 {
 			compatible = "arm,v7m-nvic";
 			#interrupt-cells = <2>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <1 0xe000e100>;
+			reg = <0xe000e100>;
 			arm,num-irq-priority-bits = <3>;
 			status = "disabled";
 		};
 	};
 
 	tertiary {
-		#address-cells = <2>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		tsp_nvic: interrupt-controller@2,e000e100 {
+		tsp_nvic: interrupt-controller@e000e100 {
 			compatible = "arm,v7m-nvic";
 			#interrupt-cells = <2>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <2 0xe000e100>;
+			reg = <0xe000e100>;
 			arm,num-irq-priority-bits = <3>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
index 72d93323593d..6edf14617b09 100644
--- a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
@@ -496,87 +496,6 @@ pinctrl_hvi3c15_default: hvi3c15-default-state {
 		function = "I3C15";
 		groups = "HVI3C15";
 	};
-
-	pinctrl_tach0_default: tach0-default-state {
-		function = "TACH0";
-		groups = "TACH0";
-	};
-
-	pinctrl_tach1_default: tach1-default-state {
-		function = "TACH1";
-		groups = "TACH1";
-	};
-
-	pinctrl_tach2_default: tach2-default-state {
-		function = "TACH2";
-		groups = "TACH2";
-	};
-
-	pinctrl_tach3_default: tach3-default-state {
-		function = "TACH3";
-		groups = "TACH3";
-	};
-
-	pinctrl_tach4_default: tach4-default-state {
-		function = "TACH4";
-		groups = "TACH4";
-	};
-
-	pinctrl_tach5_default: tach5-default-state {
-		function = "TACH5";
-		groups = "TACH5";
-	};
-
-	pinctrl_tach6_default: tach6-default-state {
-		function = "TACH6";
-		groups = "TACH6";
-	};
-
-	pinctrl_tach7_default: tach7-default-state {
-		function = "TACH7";
-		groups = "TACH7";
-	};
-
-	pinctrl_tach8_default: tach8-default-state {
-		function = "TACH8";
-		groups = "TACH8";
-	};
-
-	pinctrl_tach9_default: tach9-default-state {
-		function = "TACH9";
-		groups = "TACH9";
-	};
-
-	pinctrl_tach10_default: tach10-default-state {
-		function = "TACH10";
-		groups = "TACH10";
-	};
-
-	pinctrl_tach11_default: tach11-default-state {
-		function = "TACH11";
-		groups = "TACH11";
-	};
-
-	pinctrl_tach12_default: tach12-default-state {
-		function = "TACH12";
-		groups = "TACH12";
-	};
-
-	pinctrl_tach13_default: tach13-default-state {
-		function = "TACH13";
-		groups = "TACH13";
-	};
-
-	pinctrl_tach14_default: tach14-default-state {
-		function = "TACH14";
-		groups = "TACH14";
-	};
-
-	pinctrl_tach15_default: tach15-default-state {
-		function = "TACH15";
-		groups = "TACH15";
-	};
-
 	pinctrl_thru0_default: thru0-default-state {
 		function = "THRU0";
 		groups = "THRU0";
@@ -940,27 +859,6 @@ pinctrl_uart3_default: uart3-default-state {
 		function = "UART3";
 		groups = "UART3";
 	};
-
-	pinctrl_ncts5_default: ncts5-default-state {
-		function = "NCTS5";
-		groups = "NCTS5";
-	};
-
-	pinctrl_ndcd5_default: ndcd5-default-state {
-		function = "NDCD5";
-		groups = "NDCD5";
-	};
-
-	pinctrl_ndsr5_default: ndsr5-default-state {
-		function = "NDSR5";
-		groups = "NDSR5";
-	};
-
-	pinctrl_nri5_default: nri5-default-state {
-		function = "NRI5";
-		groups = "NRI5";
-	};
-
 	pinctrl_ndtr5_default: ndtr5-default-state {
 		function = "NDTR5";
 		groups = "NDTR5";
-- 
2.43.0


