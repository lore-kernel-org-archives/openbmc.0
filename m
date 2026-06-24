Return-Path: <openbmc+bounces-2135-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5863ACDE000
	for <openbmc@archiver.kernel.org>; Wed, 24 Jun 2026 23:43:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glz5R58PRz2yWK;
	Thu, 25 Jun 2026 09:43:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782321729;
	cv=pass; b=QenRg2NOdDtzRry2Q6dcRLz4L5UbmgU5V1voB97zWKSwuko8SlFytWXtjelJbgakvmz2/D4Qdm3EH8kWp70adI/YQUPJqK8aq1lgKWeAprXtZ8JvAjYumbolNCBgw+j+jkKzQK1XK80AVd3HYbm4MGc2w/8M0D1oYTDt0pUTi2tS3sNCmEFBw9XlPJAsSZBog4xqyZML/ZGOyQDAu7HocRWcoxukZtjwBcHDV5OzeW49jsRInY7OZsWoshMutgPl5R8FfcXyr/5ur5+djB6myD1rE5eoyQPJl8h4rRdBm6Yly1B20h3Vns40THA0TITZLKT1rnb/2ATajYFc03UqzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782321729; c=relaxed/relaxed;
	bh=nPW1PTdVaPQrKtAsqT+IQyPdlxlPc6/WF6LuS8JuLZo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eLHKgJ1dSjdFCzrmIaMUOZt8pHJpKFrxErSqntUkofRikvqSq2j94KYklxkj4d+hs2wBYLlS9rGTwPUd1xnn/ZYeTaMOSWc/IEJ1nnrnqzjVBD9mZRKEXnp0kE4Ny2MQlKH7Nun6vnwguOSsIBMfWDS6H198TbLJWInmqs1Flfwu+7bTletQpkL9F9pu4EA6SCCU1dYTjyUUpvJeY+VW8iJGMZ93Nm/vHS+MzNzqVCFI0GqxGuT99KsAcPeSraDzdq2j1GZVFD14qEhQCvCjBmfTae6oqemRA5BAxDRuS35AWMei+uZcvzs6GsO6qg8qySjU1l+lqvzRWO8LYKnBVg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=edRLSLq1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=edRLSLq1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glpdq4n5Sz2yVd
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 03:22:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/5X4TFqD2DPHC99YsKYLV+t4UUOFUqHmCnrQbMyRJjTIhFYp3VQZvUhzjrPxQ7j8tdlVF8bl4EorL72xt3Rhbug2/s2TqqTlgCbOLV72sZI/BdYwSuvUxkBBggtvp7sZCDDD25z690WKJdZL3aoCxf2AnkmXFuriXXY+3VADUBnJbr6n+O0CrScjGwP4IZCbDpSVeUAwb+nuAhcw6JjSWQCgnRqye4isbdm5RzOwu/1WJzKTL4OYm76iwyAPEWwjjpvQ4wfJSUT63v2bItdBxnogBHZwvyA52tsvY/GRjzAKIlgQRGqTRc5NvKjKkGcT2rVACA182DUg5ZIPMomqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPW1PTdVaPQrKtAsqT+IQyPdlxlPc6/WF6LuS8JuLZo=;
 b=fFb+j0EnDMr3iREdWj0hiJy6QIk+cXvD3G/Jm9rP0ewezGMNf5gxb84lezLT6Rzgen0wRNor5rRsdQTGzoppqnMWkh++UhhyOwq+9TBzPDMBkiBMXijG1aVLN3cJTeVYfga5k68WxKpCzXWKnnbatRcojNC6HEpiNaDcfoPvzYiEL0+0+fnUpOBP9zeDoxJN9hxhVwI69zZeCkxe4EhySQtW9fyexetJZ3mnZhwstw4I8bl12RpCgL40DW+m5b9qsWP2o19Qb4SDryihU3sCBJubDEDWBYNIQUlbRbgiASuTQbguCpj8RJ34Sm2EYfv+Tu6A2L4+jpwNkndwsEtycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPW1PTdVaPQrKtAsqT+IQyPdlxlPc6/WF6LuS8JuLZo=;
 b=edRLSLq1srtV7+5CKSmyXS7HGdm48lbkv9YtY2AlOqI21aTFRsOH4zqHAqMYoX3eTUfUG3Sg6gxJcgcVaZBi+CdR3NiRKbUzDKXE5yYUPjEh95xpXecw+RzDeA055LVSZySGblawL2mVoevhUQDYjLY1soqyC+cUgZUIwngHMWgm5t4GaeX2hl+no4lXszmNPXfRe8oZIL7+qb3iY43YavuY9BA1v0Xf+iu733ktgiNLJpOe/MbbdmiQ+j6SwLzBFm1cumTl6uSIDARvsHk97hwlu6hCibwzNhtFgdFRaqoUIS5bPUs9ePbWcRk9wnR2s+9Ylfm8Qq2Mogr/HTqEaw==
Received: from BN0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:408:141::32)
 by IA1PR12MB6019.namprd12.prod.outlook.com (2603:10b6:208:3d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 17:21:39 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:141:cafe::15) by BN0PR07CA0011.outlook.office365.com
 (2603:10b6:408:141::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 17:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Wed, 24 Jun 2026 17:21:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 10:21:15 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 10:21:14 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <openbmc@lists.ozlabs.org>
CC: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: [PATCH u-boot] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
Date: Thu, 25 Jun 2026 02:20:52 +0900
Message-ID: <20260624172052.752986-1-jackyhuang@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|IA1PR12MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: d619888c-3b81-4c8d-fbdf-08ded2150d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	YMFGb7B5EMQOwyWO1l+SgB0LSZnlW0v9YnZOaqnlDljuXrc3BWzbAx5Fj1GleLaxLFWF2uU1wWfGlMR2cPAD41u0EMnN1ZnagghEVj7ZG5bAA/9vJddTSyF0pg55B0dDAVe5ZPfY3qbrImCzYGiMuqFyH5+tT5QkXIqYBbPhMCS98TTeIEqDlju+f9gQGZaRzqi/+eIrCrrifpW9oe+HaQlac8VIrYaGSgvoa4zsjB/AES9CLffsx1E/phAtl5a5Af4Uils/RwmvtxZOyqPpEkBEzE2tqLM9LwJJyMkp/O9oAhWnJaE8znGqOcQKLct76/XWlp32nN4RWFi1rzl4p5G/FUR5Nrfqtol3EltMm8IRL0tS/SPbUsblh4IN30Ckmcy0PWyUC9LQVIiXGM9fIjuYSBlYp9vnOoP9OP9fh4LlEiOs8TBTzOVxeWVlWJXerE9XTVr7G2m3OfYxEs5ZoFDEhZmFLPbpr8AkOQSCE3bpnHarAaTrXfymyr/A2EG+S8kZGM+pQFjdzJC+OORRE71prRnJQutEz7ZnLDF6C/Qfygs8E5e3Y62cnLpJbAnBdqwcgDQ0IFAeW/ekh41rsaRbtrIi2dNITiFoHJwXy0DeRSXLYm6BcnH+omAJAdcQPGxzZ4beyNRPsIAnS1qSd2JmoWj0R5OIpjOy4ZMUESY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IO5BfpLV4rMYuvIOAX8xD0qGODCVSY+wMlWLW2gKczbkYVrBULRhP/2sdqlDEfPJ/M9ycpc0gyN93nl4VEoMk+HDJjE+6nTGq6l5sB+zoMFZKbLpIqPDEIqUTAmscszlUcYXNMKOnAfxswdG0hhanqI01juodpP5hVHQKBeYBLCr5ykaCVOUDFE1alKnuy0e6uCj1wJh8YVDekCkscW+HfrHJ1Xs13aQXA76zE3pnXXjKVxVQfwICqchBiK3v0huBI652D1ecVrahiHpbqatMWOCYqGmBRcUbyu8H1Aoj3CBghRM5bvubTWURVs8E0UdGVN1c64UIVrcXGhZl6z0DrO2Xd5pPK/6Mc+TfBhSR6X6WEPt0aYEM4vCMD4jQrTLXB6PU5g9/tLHzUbxQ0Dz6U/4sj52w9Sas4p7AUH9aW7X3MGp8zyM6YG7+RzjP/Ye
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:21:38.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d619888c-3b81-4c8d-fbdf-08ded2150d33
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6019

Adds a dts for the NVIDIA VR-NVL BMC board, an AST2600-based BMC for
the Vera Rubin NVL platform.

MAC0 uses phy-mode = "rgmii-id" with no SoC-side clk-delay node, so it
relies on the zero default introduced by commit 3f6198c0db1c ("clk:
ast2600: set default clk-delay for all ethernet macs to 0"). With that
change in place, MAC0 brings up its MDIO bus and establishes a link
with the on-board PHY.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/dts/Makefile                  |   1 +
 arch/arm/dts/ast2600-vr-bmc-nvidia.dts | 222 +++++++++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-vr-bmc-nvidia.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index fa6837be74..4db765dd83 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -691,6 +691,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-fpga.dtb \
 	ast2600-gb200nvl-bmc-nvidia.dtb \
 	ast2600-msx4-bmc-nvidia.dtb \
+	ast2600-vr-bmc-nvidia.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-vr-bmc-nvidia.dts b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
new file mode 100644
index 0000000000..f8856b1e59
--- /dev/null
+++ b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
@@ -0,0 +1,222 @@
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
+		mmc0 = &emmc_slot0;
+		mmc1 = &sdhci_slot0;
+		mmc2 = &sdhci_slot1;
+		spi0 = &fmc;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
+		ethernet2 = &mac2;
+		ethernet3 = &mac3;
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
+	aspeed,ecc-size-mb = <0>;
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
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@2 {
+		compatible = "spi-flash", "sst,w25q256";
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
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "disabled";
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
+		compatible = "spi-flash", "sst,w25q256";
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


