Return-Path: <openbmc+bounces-2627-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C4EC982E1
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 09:00:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpHHY6DrNz2yPR;
	Mon, 21 Sep 2026 19:00:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789981209;
	cv=pass; b=MyyDJHt+lk9xsKEItM5UP0vIdj+tmAz4Td7yxTtnx38xbZ0jTUv1dHv1auLEFpyO446BC/r9F+7j0b/I4y6fjoT5e6W9LczDpHbaABwfi0hDYQSfu/i6c0xsXFpgNvFhcN3Y1h21YOp76ubo8c6BQX27yuKuAMiAYwmhqbGL9L4aw10fPkBOZKvh51sMyWXR7gvJXM3EYemlJY3G/dPcIOMdoY1D6nw/kD1nJPmOnXbt41nJwtV7BtDDjMYE+ZHkFibeRWbJYui6IxeP+pfnQauLfOU0vy9gL3KygV+rmOFVKB7FCfQQOulOU9lI/rxg8R6BAr4OZskd4ND2l6yJEA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789981209; c=relaxed/relaxed;
	bh=IE9ski7GHbG84JJYmJPxCtf0kHx0B4oRvaa+pjP0QjI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A1v7ERm6r/5hnFSwAW7KHWYzKWKdsRxCXIm6L2lbpO3ukrsYZOwX7P8Mxg1+E/wlPbZ6skjImxSFUeR6in3U0MaFq0fhxeY45Yzo7q3ANIAx1X8gLwDv7VVY6DtzlUhcQ5GinrHngKvFOZDfPdG9RkKlF0enVM7aWHYMNw8lRqA2KqSx4YycU2yYJHmHASeneEIeUMT1mHCaZ9GFC7bFFzUnp3w4fQ5KKRkQT8g1H9S72Lzaptngj/U4ObTovQgCJAr+dXm9xRV5benjftIGnIveZjDlXl3Ci0RSWrhAj6L+BOZglLRtqkZAxLFfFQqAbaRgTkT1TzbAbMPa+tBFow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rxeLr3zQ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::3; helo=bn8pr05cu002.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rxeLr3zQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::3; helo=bn8pr05cu002.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpHHX3mDDz2xk7
	for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 19:00:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFjqwUWz/Az2Ki2G0LAAn/CUGiPoMSSyz6Ijm/Pztu0NUkmwJrTVvDC1TPYVVDf5+TyyKXTjGgwI1OJtfy1+oLG5qSrK4hN29l/XU6G6Qg+ylI1RBS2e6fT4vXwh8Z3tWNaWZ7h/rj5Q8tWYqBI1qTCCRQF1AqbKD/rrYkyZtIHwpb8Guxxw4kzgfzfr0k6gaBL2O1YWYzMYpPl9bCRBICONTQaqose7/enTr0f8nID2IJDNJ98AAM7fzQAdSc39E4BEbWzxQo4epaM+g7hR5FJ1Dtt3pYtITLKIKGg8gJL7L/xgFcFIo9rOdFL9uQZ139fDiPvALS/oZLbtNSME1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE9ski7GHbG84JJYmJPxCtf0kHx0B4oRvaa+pjP0QjI=;
 b=zWyrlMtb8KRhSYwnwe4qPJpkMyRXPcGhlbOed7yJWIeRCW+hPl8V40zUSJWhn9ZwZ10AI9BhnRW6P75DXAKZWGm0j+kN1rg/y80n9Vuh5nJwy5eOpijc9TvEa7hXb8lxlElFm+gdjLlOXTVi/7wLV8gWHkMnvn3BKHilitQqmXe6X+MbY+WFeMETAuJ4MCuEbOCslHPiEJoE1PONMmfpiZEZbkO8sxsbBHbZ81H9iV8YGfjMb+PHrWeJbSuwHYmXWcVRklL6CgtDImTdtiq9mtRc8DzKNAoVARKNtnwHmUAI95HXGYyAF3jwq0rB/whfdcYL4uqf52RxTN4ioX2p2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE9ski7GHbG84JJYmJPxCtf0kHx0B4oRvaa+pjP0QjI=;
 b=rxeLr3zQ6HOtG0+Xd+GZquPx6Oy/5/2qCnzKQy5ngEujQOh3neTDbuJNqI7qIdbkf5ihirkwU6rsWplpkFTVCUzOEsxHWJdMBCzcvTh5XUH/6UzVkuEcloAgUpy7uobgZ0VRZMG2PfrALzYIeGX9nHyvp4Dn1yv2Ot9cSoQlm/M+dPZ+wKu/2M+ucaHW9CIOyuFZbVeC8zeLDtZm1m5fDbDKi0ZWmz7d41EcNV4SSiR4+YxLM/kOPIPWggACKsn4Ij8g+FFGzdcYFBj6rHPjxJGjQHzAbp/3/oXdRyRzcb5O0UElA54ExAStSx2O9dnSVKGmShc70d7Y9XMtZ8k4Uw==
Received: from CH2PR18CA0011.namprd18.prod.outlook.com (2603:10b6:610:4f::21)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:57:34 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::8c) by CH2PR18CA0011.outlook.office365.com
 (2603:10b6:610:4f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 08:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 08:57:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:13 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:57:12 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <openbmc@lists.ozlabs.org>
CC: <andrew@codeconstruct.com.au>, <joel@jms.id.au>,
	<tan.siewert@9elements.com>, Jacky Huang <jackyhuang@nvidia.com>
Subject: [PATCH u-boot] ARM: dts: aspeed: Add Nvidia MGX Vera C2 BMC
Date: Mon, 21 Sep 2026 17:56:02 +0900
Message-ID: <20260921085602.752144-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb8f07a-414c-45f9-bf0b-08df17be5eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	U3d/K+tqPzjw2DCarIYgHEzU4nMMjA4K4B9rxjdFx/E9fiYSP4egqobfU0Y1RG7v7r8uIznGpXNz/KpP+j9k1xrfDXD+XjFukGrQ777eHpuXyrQoxAE5H3YrZgQLfWuX8RoAlTfZpswqWQJj0O68Oi25RaSXEeRn3GRdkJXLvjExDv71v0cvSvO5+DpYdW5EyIl26USExrD+jZLyjxPqMkIi3I0v/Xtl4BTvpmTrwY+eWnTZF5V0gQEFN77s4KbpriX9mXGtalZi4SnlQN5Cu/F4UZV0WrwF/725O9t9Y40LGBk5/r+hfcBdt/yf1O2stOksnzMNQnCR945wCbkEpay90KOsHdmJs9cDvzZy3ATDud52yts4rZxCviF4i6cyG1IfzMDD1Ais7t1J7vrADf7/XY9DZln5w7T4wmrcjDewNh/Yn1FSSxCnWPuU7pgw2n6yrBRsQ7lqfdr4SUhQu68xdvs+eC/zUWUpoQf0NUnxdnvyZHIILSN8+gM+G4pKvr5UXybpfA3QlrzRTjwbhlPNkeqHc3JGa5wk8S5hd6SGO+5B62h/ohz7AMsUOx0ImhAUer+WSPkHm7zpPSuDIyaFp0NOkV7BxXk/+MusIoH/htt1qyTBQReKkPA0ctvI++CUwcsMn+p4+HmU8qoP3oFrp5FsWqqmDg75aDG1pxFUz+5pKKVGy584DdFAacemnvRFDSSTCFsvV4vs9uXeAw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4GrLOm1eqX3bzXneWHz787SoFQ7VxnvPW8hZU4de3nkcPzCgMoO8LA4CMT+taglG2uXZ07z7ze3hAe25h8E3mj6vU7hWct8IvwenAcF0zwsLrZzTZq1UEyOLbe7jlo3wUH9iHA2FnlqnDfERAdh0v19SKvYZqpZ5n0GC0MH3I+l/VMpqTHl7IoDKWz/2tJ6AOjl1xBGOFnMGtWSWZA8FshZgG3w1jB9d4qiGAy2OgWKj1PeKCuHWmAirUlOjJskEg4qVd6eGeb08tyKO76LEirQVd3N74gity17gPuMCk0l0pUu2WH18zsIEiEJCGgP8fiwLSHiNfQ/UvQe/WcOfn/PwmG0MPb3zrH9CBETZ73EgMczDfpMBLNlbcjwShVuqdQKpWyWzrycsQv4oU0KTKrdsDmAWFlpncXknbpPKyCCHyU20ad1SsZL3P79HJv63
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:57:31.1778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb8f07a-414c-45f9-bf0b-08df17be5eec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713

Add a device tree for the NVIDIA MGX Vera C2 BMC, which is equipped
with the ASPEED AST2600 SoC.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/dts/Makefile                     |   1 +
 arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts | 155 ++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 51e1729eeb979afc3cb59960f3fe7639f6265fb9..b037ad286e614143f5f00749f98be9dcfd254d2d 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -703,6 +703,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-tacoma.dtb \
 	ast2600-tacoma.dtb \
 	ast2600-vr-bmc-nvidia.dtb \
+	ast2600-vr-c2-bmc-nvidia.dtb \
 	ast2600-x4tf.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb
diff --git a/arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts b/arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts
new file mode 100644
index 0000000000000000000000000000000000000000..22c82794b2ae7d898cc453a06c50b2d69685f02e
--- /dev/null
+++ b/arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 MGX Vera C2 BMC";
+	compatible = "nvidia,vr-c2-bmc", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet0 = &mac0;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+	aspeed,ecc-enabled;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio1_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ethphy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+};
+
+&i2c7 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&i2c10 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c11_default>;
+};
+
+&pcie_phy1 {
+	status = "okay";
+};
+
+&pcie_bridge {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&acry {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&display_port {
+	status = "okay";
+};
-- 
2.43.0

