Return-Path: <openbmc+bounces-2497-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBE6C61CE2
	for <openbmc@archiver.kernel.org>; Tue, 25 Aug 2026 10:38:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hTkks1wBBz2xYh;
	Tue, 25 Aug 2026 20:37:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787654276;
	cv=pass; b=Vd1VBjRT1+Z2GjvI5PbS2nYVD/Gx7ei2VkiA+tWlqaWYk79T84VD4o6pNZ7c5onYVpxVLnWlA4XqxqQUM2pvtkiCuXFsp9YOrwnE3Nzy7GwCAwC6+u9LrjhJjY0tZSIr3dk/MAp+1Cdjk8altN5kurWRn9TGgxxTFtqMlxSo0fQYq+pUG9oKkbgS70hNrfYjWPuW1tBPLz0NCbxi36kvLC1cg94ZtEqf7W4X/qe9jiZjik1H+kgq/QypgEewyxxKe6avSiWVHuvjtGGQ1/5unMPu3ZAJ6x/6R+3xVB0MWyKiY48Abv/qeUQAMu5Rd+o7MK3HiD3S4NDpGlL6YIHUhg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787654276; c=relaxed/relaxed;
	bh=jBfBqJmbjMb0ur+mcYqPtBNidI+4xhPwijhCL1S0yx0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RaRdWWv+6Sx08pgvL8rOKZ0fQB9XYJu2WT9wq13klARQ3PgUzozaMWKE02t+3o6YFs9PDxMAX5n4vs87omUMZMCM6kmMDA4f44oKV/kU6oU36ZvPVY0Yra4Y03JGdv/bsK6hAIiUJHrMyX3RL/9+5YPPCAXv+ZQcDSGQzbH122MljAs7QE/LBQGd9NYkHmau/qyaHpZzHlIuRvZF+YnLXbDZdxuVHR6OPzWAiD6nhPaeLKRkAaIn8qA7uaGOnCQJovhlbBf440u9Mj1CvIYP2km0Kq4p+gdL17pC0e7TMigAKaqxJncc3jeL29j9fSPXiwkBBMucWA/WhEGTDAjIqw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BTA/oxAI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BTA/oxAI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTkkq5Fn2z2x9g
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 20:37:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISHoAyr12bS/UiLUpPxQ8/sRjS5m7pX9S4wAEQXrtG57e5BC478EDIAI60ND7LvCxHmjOhDsCSDRYQJcpKmYWkKF6es+KaOu8SnZuSFBWo5IxqfUL1R5jWKnrpbreBnG80NG9UbacB9NOmS9k4vu/+V3C+WQLYkkg164J5EeIrsoYxzdKPYveykBLihEB1E/i4EcW68axhIvpuVMhyQ9EyjaThmOxOrtj3sNQK7ynKPfKdN1qQP2fhe86acUei6D/VUYTv0K2lynowaFDJOfBaCgrxA5j1hIS+6+v83zx28LdVwYUimpJwTqR5EGbqaMqnNMB4aBI0GyEqC8dco9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBfBqJmbjMb0ur+mcYqPtBNidI+4xhPwijhCL1S0yx0=;
 b=ykvMKisDH5v4G6n8VwJNTEqCt6GCx83NOPKKsZm/64CxA6gVREZGBiqQDp9OG+MWc8EySNpxkxsMrL35/ujCEWm3HGQmyMrnfGhF4TYCbWPQofPiG9ldO+N4j3Fp1Dn6fepT9Dq74ImkXa6dGkc6J7ll9dsGW5m7PuunqMIro8S1xMf/O+VtC9eJL+l5fmgISK1fhoFw4WqbW5ggfrPJTSVxbEuLO+yxP7j/j1R7a892KOnQ2/Vy29NTHI4XMhGiwBtYfmf7bki54Hth9kkmkEuEpV6XtydVdjkACrfEawu/riDxWAYQ87rx3wmjT5k/AoV3cuM6/4/jFrGwcFv16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBfBqJmbjMb0ur+mcYqPtBNidI+4xhPwijhCL1S0yx0=;
 b=BTA/oxAIpJTpgLlSRxneHTE/ESWT4kg7SufvvHqJDcPEFEnXuF6M+bJR4MgpiNT+KAiIEoAo0q3L/9eSWYUUZz9JzAf1KaWdMeWIsu/jMLMkkVkDjbPExBF1D3LwVoUuRle7/4q7NbqtnovgsDt830dMk+KBWeLScpR36MwDFQAH8e7TkDZpZd6SDlilDDsoqOjRKFTqUyUUC3dOfM/fMX3l4BEcrsXylVFyCaH/rDwdgXsPAcFNG4cX3GttH/lLbTuMG4rutoDaRSOPZ+2u5Qc27ZADrrPSpk0nvWLu+gyDHa7TiHYwQ21w9R62AvSkYATnJI+dSOiMfl0NJ1GViA==
Received: from BN9PR03CA0776.namprd03.prod.outlook.com (2603:10b6:408:13a::31)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 10:37:28 +0000
Received: from BN3PEPF00022BBF.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::2f) by BN9PR03CA0776.outlook.office365.com
 (2603:10b6:408:13a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 10:37:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BBF.mail.protection.outlook.com (10.167.248.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 10:37:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 03:37:10 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 03:37:08 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <openbmc@lists.ozlabs.org>
CC: <tan.siewert@9elements.com>, <andrew@codeconstruct.com.au>,
	<joel@jms.id.au>, Jacky Huang <jackyhuang@nvidia.com>
Subject: [PATCH u-boot v3] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
Date: Tue, 25 Aug 2026 19:33:03 +0900
Message-ID: <20260825103647.3023260-1-jackyhuang@nvidia.com>
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
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBF:EE_|CH2PR12MB4309:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5be46b-e1b4-4918-aeaa-08df0294db65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HfTpSZzSm8dMEoCdOG21VyygkVLH3LXGZXJjh6reY3h8nEG0rXgI/lp/JQMq5dmHs50ggpLEGuKhI7Lka11LiQoAGyF1Unw7p7EV0UwvgKAl8ztMsxAKqQK7lMYKx+WyEv/Mx0q6y3Z+ylw14er+LI9uX5kiiTC4X+WkHXMZOKlzqUIPoG0GFfzZRWm4yD5yvn3Bdgyisq7O3kMIYDA3rdLeM47oXHh2w8DELpmMUmXRN+bqqHEo5DyFLlISDQlbWw5j2FEAz2N94qbhRei8KSIpgqBk3frWuTz3A3Vr2zZRzk9JVuBC/W2VlTU9SGo48TE/fwULfHC6ca6oowRStz5QvWtjlBOCOGxUVdTTgcK2imatDtjLkEqRR/Tlc9uPGR19p7vQDEk12DB3bwJsBxFTl1mvE+ur1VWapky4qvJuqEZeCAiIBtiy7/Ka7Qxz4OTb6Rw8NURa++Rkzz2r+5ZwdlBJ0bqiEhDokeG3OXG6Y3/RdTiwVrWU+UIqpa7w5unGTJu5VfP5k59rNAOLi59oIwUc/wXSb40QyGSqU4SZ+cajkCquzfDra0O53MHFagSmEsW3WQxLmR5+jSNyeEwgok7RMbtketpgu11pR3JEfPRlQQS3sRLW/CHEXp7aZczhodOYlK5Snb5wFDgr7xr4ggUu08wrtgrXY8zKicxaNIlRms/mOZp8VVCWRbbfliLjF4YZe6LC7G6DGePAGQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9MyM4JnFm/MVCqRFZpQrvVfz13EgyJ+eupRPLx1x0BWc4IhIdtzJ+B4yJ/bxaNL5zZ06lm2tP6vBapzGDo5pn4FpdtN8Kx5LFLCe75tQn9QcnLTWa7udRdT0YIrWGGlnyhWGeplCWvIk4gUYNQxnN+ujEhJja4B5XjeSdTk0Up7U4NbL//0M874g4u+l5rdT4x402ucA0UDx5wcdFZT+hqPuAnv0pOPPm+0/H2istZhoW4BZrYPlxnEqw0680o7CCxf8QL4nDm/AFv3pYY+qhRsznjGAsAHRAxpoex7UH4bWTM6XUpf1xWO6Zk/QqeuT967eng1ZAYBtJ2YEIxjkYBT8NpV4PHIUptCo/oCaYtbeKk0Nsbd7huNE+og/aisyVZ3bbNyQXmF9F01vCs75W4eGa/AuKOrPrvoLeQTiB97bjv1V13KRnBU2ap+hHg59
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 10:37:26.7298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5be46b-e1b4-4918-aeaa-08df0294db65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309

Adds a dts for the NVIDIA VR-NVL BMC board, an AST2600-based BMC for
the Vera Rubin NVL platform.

MAC0 uses phy-mode = "rgmii-id" with no SoC-side clk-delay node, so it
relies on the zero default introduced by commit 3f6198c0db1c ("clk:
ast2600: set default clk-delay for all ethernet macs to 0"). With that
change in place, MAC0 brings up its MDIO bus and establishes a link
with the on-board PHY.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
---
v3:
  - Drop unused spi1/spi2 aliases and nodes.
  - Drop unused FMC flash@1 and flash@2.

v2:
  - Sort the Makefile entry alphabetically.
  - Drop unused mmc0/1/2 aliases; eMMC/SD are not used on this board.
  - Drop unused ethernet1/2/3 aliases (only mac0 is enabled).
  - Drop redundant aspeed,ecc-size-mb = <0> (defaults to 0).
  - Drop unnecessary flash compatible; it defaults to jedec,spi-nor.
  - Drop the disabled spi1 flash@1 node.

v2: Message-Id: <20260629105202.1417679-1-jackyhuang@nvidia.com>
v1: Message-Id: <20260624172052.752986-1-jackyhuang@nvidia.com>

 arch/arm/dts/Makefile                  |   1 +
 arch/arm/dts/ast2600-vr-bmc-nvidia.dts | 155 +++++++++++++++++++++++++
 2 files changed, 156 insertions(+)
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
index 0000000000..b4818ead81
--- /dev/null
+++ b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
@@ -0,0 +1,155 @@
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


