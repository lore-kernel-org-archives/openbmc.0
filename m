Return-Path: <openbmc+bounces-2147-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E227C43458
	for <openbmc@archiver.kernel.org>; Mon, 29 Jun 2026 10:55:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gpjq42sWJz2yZ8;
	Mon, 29 Jun 2026 20:55:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782730512;
	cv=pass; b=m4TJdzCJMQSEZ9sVe4dbwSXLxw+J9PTKKtqclT5d5yoUl7TYYjfSJTGEnTGqHl0URYXCQzrLxisehoh0kL7MFBCpeCW5EmIjBuPmGuCRAwJq9icLMeznLc4TLksHub8Y9ZjM90oHn1Q/62L7feTV2+URQHqZe7qwunnYHGFr2YdjoSdv9ur/Ztdfe0Er9X142NvTyAAdztK688aIhcgF7/Wer+DGeygWGwGLJ3lLXssX3vrqhYdPp5IpafIlQz73elqLxQXIdsXhPMTo4q9F1IfHtdvYFo7AP9yFHR1A822obgNK4DY13ROHEygf5Ac+LPLMhuyUqRzPUNA3Nksc9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782730512; c=relaxed/relaxed;
	bh=wGat3rY8d2w0dQc1sL1AvPQhOAKkOC6YMSE8Bhy8dkU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OHUEtX90RL8BboWlhTL7jvFq0yIMuU5icKWSThHeM022xzhpcH+iUo0+7lrLGsorBYBvipva6CLKI4Il3RGjBvT/GVXnd6m4tvH7aoEYqg20AysM6JX1VEnS+pQ4CN3mtI3543EHdhUlqlVwXXfQ/6alh+6mHekwPEdnfD25vVQtgNqyhYuxEW+yWiOBobeZ6BHETk5LEqvTALNd1LLgTsIVbeePio+SveKENvGPZnxVr1lYGauuPHE68a8tuiAkXtSdf+pV0PdtUZ5npn5o2BRidJc9cJVBM1nv77wjXnn7N5u+ghCYcOOy/M3rEOowKsYwpqMoCavWjQ0RCB/05g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=azyD6Hm9; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=azyD6Hm9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gpjq20zL7z2xYh
	for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2026 20:55:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuJvW8nzVnZozI41V0QugI5icHsIT3Lfcb64oXHQjLMrFjvSaZkPHL7voUI1x2xxo49U52hDWuu8bYVSludVVsw9EAIiaVvsJpgRbIrU9xQvbw64oozhcVzKDzpSZ1HyZYYgS7X7mc97FDvNuSxR+dBJkGEuHAltVPv5bOBIonq54yatiCYgT0TMsRqTSOOAE6Hc6GDhh/5R8cASbNVSFH6QVJ/s0M5DPXmcdPF8bcdu+5GtagNgkWPYTyen/sz6U8fImiieMQm2BA390wDtwn0GRs6zlw986PRwwXlx9HpSOW/+LMwJSHr0Xv2aCvK3sQw2TZBUiuB2TXGykHQroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGat3rY8d2w0dQc1sL1AvPQhOAKkOC6YMSE8Bhy8dkU=;
 b=cRMv3CpZymPDLtg848a+olYKQsCzxsLJZKOHq0fNMlAJeAQlFMf5r8jDAC9BNoo9UYjoF3zKpB6aX2AE9Y6MHd9GdJeKzUuK5kDpkzDzAQh2PgbpsR0EWznSG9QTWT+qlYDWrU00WMkCeJLXLzdQ2LmbzmhfCAsBFwMxlToNSkiZ3PLAaMzd3GtAq8tUrjsQw8pOtX6adP3TjAVVJDzbTmmvszH51Tcls5RI1gZlT7d29q9AulUPUaP0ieg2tSEiBb0NLHIgoqcTy6WeWLJZdNg2BJmgJMsEeGYuXi1GzQboIJhGpYJQGq6UWorqTwFabauOgx31i3KCZ6xLnkNU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGat3rY8d2w0dQc1sL1AvPQhOAKkOC6YMSE8Bhy8dkU=;
 b=azyD6Hm9bUepDr8p0XJUAUk+suR/ftpJqsFOWnyiTvTVXXnoiWL2gHLauc9pZH/A+wEgp1jEeKQQvQxTQtgsWWtSBOr78E5xhGVCsAx0hawEZV1NKIAc72y0AR5F6luXLpOR8ziuYoDgylEtUjuyMk6XoG1yFWCRd4BGTgeTDBftH8gJCcomw6uquvBCIU5w7IYSKV03tlyWXui5tkFAXjzawsC7s5n4Er4eUG/9oqcEmefpf2RrLhBmh+ME9Oiq/FrZHtRSUFgKM959+sB6Jn9A52SIhlYOV6LpfpiQ2DCkkZwK6fn57wgRWnCmnTv1P3W5qBaDOy+SZ8TeOGDhSA==
Received: from CYXPR03CA0065.namprd03.prod.outlook.com (2603:10b6:930:d1::7)
 by PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:54:43 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:930:d1:cafe::8b) by CYXPR03CA0065.outlook.office365.com
 (2603:10b6:930:d1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:54:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 03:54:27 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 03:54:25 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <openbmc@lists.ozlabs.org>
CC: <tan.siewert@9elements.com>, <andrew@codeconstruct.com.au>,
	<joel@jms.id.au>, Jacky Huang <jackyhuang@nvidia.com>
Subject: [PATCH u-boot v2] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
Date: Mon, 29 Jun 2026 19:52:02 +0900
Message-ID: <20260629105202.1417679-1-jackyhuang@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|PH7PR12MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f6c229-54d1-4bfa-df41-08ded5ccd30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	mleKosODJXY2PIRhFbo4D76pvVbWxNsE/rqztuOFyQYkaYYi8Y53pkDQvPsVrMmRYuq0wFGt/i14fE3AkRVqWA2GCqhjU4nfiMdQrnYtvNtffW6eSPrMh872ljfuoTY+9tx92zCG3S6TwM2URvUcFExdXDzJi7wIVKi+gpz8yb36CtpYk8lj5m3Z2tssB6T2ZmpbTSK5p2RK8Jnh5HTBSdgV9j4mglH20fXCSEuWEN2qjFdD1tpaPpeOsT9DrRS2gD11svyRfUEc6xLXadmMKkqolXe9gzMHhhhOB2UkWov9GLGnMLFtWirBeKOvFsJ9UlHuibUj/4SaA/0nTKfM2xTRYvFaX/YRbrMf6cYEwOP4YJIHLn249mDhqSFPele8NPuzBn4bNmmZ/dgiwab9WxQ7UJEFF/Ol62URWIbe3E8QdMgkR6/8LGbuFY1gQKjcEJe6yt0s6VEkv1Qw5MVRChCuEjzW74GxlQY8oo5yRBQJvn38ijaui2JRef3988ucc/sSRSwiuviwROeuAHJrcHyxtgXqY0R5kwCLOiyJrC9CoKWVT0E5uoIzDCZzF+WFnS60b7Rr+GZCoj2YQMv1yXhwJjcjDXC9qTY/0fGZveMjnVYPcFhRPutoFh0o+/6G2ZloWCYVxn2z3FqCa4wF5WsoBBdoEbW/usbAj/3c9LQmqmVzk1Y9jaCQYXc8gh6OjhbIpuxSfsz+r+c4cZwq2g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RNUT9hvjaMXKKjsQiRpSfy5zy4fbW2A1ZV4KJ2xYUNnXQK1PUI5MA96BlwKAvDL2Y9Nd1xpM/WmJi9qDoG5OwPF1+1LdyieG+43bSXD13ClqoAipX2WFVB+EE4/4thEODLjx8edRGeJ1k8/CcI5+UnidmxGzEzdV//cGZ2RX0C9MCq0tpOKDyvH2RzhV6pdWYUc22U/q8VNvYit+jFKxcPp+NG7it4SK0pl6McHnj+AWu90Nh7UVwHQkyxDMlo1dYjbrDqrJN/BHUUUcjBQWjOdYaCiWIxokUWJYmA8UcmLZ9Ul8NPDiB/zZ7V45ea6VkEtFzfxKifLxFqV7gOckMrm4a5iGwocGYbVhlA8hrJKOrZHy2/ggtIQteqcchF2iShKTerMXDx2C8+ZPyDvZUVx0Jj1HBQ1AqjpwR1i9zuHXnBeJ/1tHP7gUJRRaPTrp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:54:42.2256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f6c229-54d1-4bfa-df41-08ded5ccd30a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879

Adds a dts for the NVIDIA VR-NVL BMC board, an AST2600-based BMC for
the Vera Rubin NVL platform.

MAC0 uses phy-mode = "rgmii-id" with no SoC-side clk-delay node, so it
relies on the zero default introduced by commit 3f6198c0db1c ("clk:
ast2600: set default clk-delay for all ethernet macs to 0"). With that
change in place, MAC0 brings up its MDIO bus and establishes a link
with the on-board PHY.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
v2:
  - Sort the Makefile entry alphabetically.
  - Drop unused mmc0/1/2 aliases; eMMC/SD are not used on this board.
  - Drop unused ethernet1/2/3 aliases (only mac0 is enabled).
  - Drop redundant aspeed,ecc-size-mb = <0> (defaults to 0).
  - Drop unnecessary flash compatible; it defaults to jedec,spi-nor.
  - Drop the disabled spi1 flash@1 node.

v1: Message-Id: <20260624172052.752986-1-jackyhuang@nvidia.com>

 arch/arm/dts/Makefile                  |   1 +
 arch/arm/dts/ast2600-vr-bmc-nvidia.dts | 202 +++++++++++++++++++++++++
 2 files changed, 203 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-vr-bmc-nvidia.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index fa6837be74..51e1729eeb 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -702,6 +702,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb \
 	ast2600-tacoma.dtb \
+	ast2600-vr-bmc-nvidia.dtb \
 	ast2600-x4tf.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb
diff --git a/arch/arm/dts/ast2600-vr-bmc-nvidia.dts b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
new file mode 100644
index 0000000000..8995602757
--- /dev/null
+++ b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 VR-NVL BMC";
+	compatible = "nvidia,vr-nvl-bmc", "aspeed,ast2600";
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
+		spi1 = &spi1;
+		spi2 = &spi2;
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
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@2 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
+			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
+			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
+			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
+	num-cs = <1>;
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


