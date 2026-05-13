Return-Path: <openbmc+bounces-1925-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6CACD37AC
	for <openbmc@archiver.kernel.org>; Wed, 13 May 2026 23:51:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gG9G90pH1z2yLH;
	Thu, 14 May 2026 09:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778689919;
	cv=none; b=LGgPkOiGb4qE9h3DIrFvp2qVVP1G8XV6Fk5sKhj/fLPzT8KN/I6G8zmpelsu8GxdqmlL0SOOFdnIZU9Qp9wzCPy9K7uzTWHULbfCSMFU/UOx36kukf+NMw9zI8N5nNJfYTbQWKqb6Uc40r8WczZJNgo9co8w/1ZRiaBwbvdDTHkntRcz5fII3Qj7lX4Y9OKN9yLWvDsX30AYrABky4LXs+1hRxwsTybdldNdOSWbyyWapSnDJOiZP050cUUM30QYFxUi4HQ8UCT2+f+DGFHYLQ+HkmaL+IBPEYj7TsChEVsHsLOUOLMyWUgszxQ9gqb3ZeB+tuMxAcveJZC4RijxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778689919; c=relaxed/relaxed;
	bh=D5UPxw3T48FJ/vk7uItxWIhxvBUTqVp74nlh/1zpits=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A91/xRocJHjnW3c2zVXi7ngBdeRcoNalG9fxpF8/TkLEk3IRJkJ6oQ8/mj9Kd9PAtJ/Uf+0YdM++tj+ylTWXhc9LZO4Fg1cHU6y69zoqyFNI7erPsTa9Ty4TtiCXVeMCNtEUM0kwFoC1qX2DwUfKeL72NVM7V1DcVLMtjQ1yfudoMP9NwWEPaeQmmzq8AfQhbllgbAmPrapdxDj0T28HuYKiNMuMs7nc5L6O/LQ32h1KW/DHyBgN7ZMTdAI5PnWlS1UHQIiRpIdTdDv1TNdlA/lI7qPpswtjCrlfMVFHBCgxqa2beZVLlsVU3bXUJIU5Zz3MAT7OtFNHvy1Fk2H6Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OjECRQAh; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OjECRQAh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gFzWK6gl4z2xSb
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 02:31:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689918; x=1810225918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i6qFgr4BdGt7bca1DzWlDakJS74x3G3JFyTvjzdSAes=;
  b=OjECRQAhUcPKtlS4OWUPrfgqY2iUhMD3ZXx6xsyI9FtZgIAe/5woPkpP
   xQi/pmBrVL9wr/tV1fZ7yEduo14oFWDBfQRVmdWaIZnmclEB11x23kRCM
   tq2QPcC+zqgJU/VgQQXQzAjM+OsjOUBxzx7pKROXPy9LUPyOWUYnSWJqh
   eBEFyUd3UPiH9o5XP5E1Ba33arYaWZcSNsl3Lps8/z0S2sVIGjqzRA0CN
   AMBFJVthZZuxI7F6SPCbwpOORWpRWlmGk3UFvOKknn+9GAfIXuFiyqnd0
   bLvbbEYnZUs9y8461puXATCMD40XKvyRNdPGpARAmu8FDHOSdSw9f1Oge
   g==;
X-CSE-ConnectionGUID: DKriBwXwSqSZJ1JkRKE0Sw==
X-CSE-MsgGUID: CU0Pd5MpRm+J0npdZN13Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79655182"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79655182"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:55 -0700
X-CSE-ConnectionGUID: 1gxhngOSTC+LHV++DHxyVg==
X-CSE-MsgGUID: O0a3/EBkQmKTRZXfYlf2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="242478518"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:54 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH linux dev-6.18 3/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Date: Wed, 13 May 2026 19:30:06 +0200
Message-ID: <7a94a5f4cf84c11c7fba7485e666ecbaddfbe5cf.1778692820.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778692820.git.dawid.glazik@linux.intel.com>
References: <cover.1778692820.git.dawid.glazik@linux.intel.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add the i3c controller devices to the ast2600 g6 common dts. We add all
6 busses to the common g6 definition, but leave disabled through the
status property, to be enabled per-platform.

Suggested-by: Jeremy Kerr <jk@codeconstruct.com.au>
Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
v4:
 - removed i3c aliases
 - renamed i3c-global node name to generic: syscon
v3:
 - add i3c aliases
 - rebase on top of latest tree and solve conflicts
 - as agreed with Jeremy off-list, he said I can take authorship of this going forward
v2:
 - use inline bus representation, without the i3c: label
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 91 +++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index f5641128614f..51a6a4157f1b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -1066,6 +1066,97 @@ i2c15: i2c@800 {
 				};
 			};
 
+			bus@1e7a0000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e7a0000 0x8000>;
+
+				i3c_global: syscon@0 {
+					compatible = "aspeed,ast2600-i3c-global", "syscon";
+					reg = <0x0 0x1000>;
+					resets = <&syscon ASPEED_RESET_I3C_DMA>;
+				};
+
+				i3c0: i3c@2000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x2000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C0CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c1_default>;
+					interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 0>;
+					status = "disabled";
+				};
+
+				i3c1: i3c@3000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x3000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C1CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c2_default>;
+					interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 1>;
+					status = "disabled";
+				};
+
+				i3c2: i3c@4000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x4000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C2CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c3_default>;
+					interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 2>;
+					status = "disabled";
+				};
+
+				i3c3: i3c@5000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x5000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C3CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c4_default>;
+					interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 3>;
+					status = "disabled";
+				};
+
+				i3c4: i3c@6000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x6000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C4CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c5_default>;
+					interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 4>;
+					status = "disabled";
+				};
+
+				i3c5: i3c@7000 {
+					compatible = "aspeed,ast2600-i3c";
+					reg = <0x7000 0x1000>;
+					#address-cells = <3>;
+					#size-cells = <0>;
+					clocks = <&syscon ASPEED_CLK_GATE_I3C5CLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i3c6_default>;
+					interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+					aspeed,global-regs = <&i3c_global 5>;
+					status = "disabled";
+				};
+			};
+
 			fsim0: fsi@1e79b000 {
 				#interrupt-cells = <1>;
 				compatible = "aspeed,ast2600-fsi-master";
-- 
2.43.0


