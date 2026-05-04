Return-Path: <openbmc+bounces-1885-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32491FF885A
	for <openbmc@archiver.kernel.org>; Mon,  4 May 2026 23:37:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g8dMv4yClz2yZN;
	Tue, 05 May 2026 09:36:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777870085;
	cv=pass; b=oehqP5EWoGiDoilxK1pgfuUPbPDonAtTaypdOaQOFYjnvofpKhhlJWy0Of0NAB2OpWANpNih0b/5ABDPPxtgbqnUbY/a4OFMQpE+oeJzwLh5NoPdJjQTOnPUOV/2RhQFYDjbcolchB4OV2TedF0DWrYQ1PLB2P7NnzhIwDYk+9L6fIDA8ztVe/XgMFOtvXsi5SQmlXxDTj230YTKqaUviak04FyiZn3XoZcaPgYd2XrEtUfK7yGcv3EjX6p6H0mIIcCs2qc86J+wkxkyHgC2NnI1QY4U3/52nfNGTml+HV1gFbrZ1N+cqunFJVaoJg+PbnD5U7Lu0buA5XNXCHqT7g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777870085; c=relaxed/relaxed;
	bh=SM/LlsBXBWaf+oujLB/raz8T814DIFn/HVPHUtKWuXc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZi6/wx2H6ce5T3qmyRIAauZT0OPdeyRtL/2bv8mwN5bhVrpxoFLkdT0zxdQPW1A9qCpNf1TFQkkdris/7LSEV2fQ9Mn6LGtKZVxHYLVBuQSxwqno75OcqpIHAfMVlVz3LNx5Vc4PyUkGCLCA1bJN90SmqKYcMK+vj2iWcsHAWtxMh05wmIVWgTV4graYvFnkTbqi1I+8eWflEofGBfgTZLXy0nW1nc495ip/nQl6FMTQY4XEh6fvdQ3NWUiErw/db6aM3qx9lgfdG68JfUW4DbPRHoYWDklV4jdGpL/SwnC8pawJShkqJr7Dn+bT9GM7RIdBUiyZWwvyT8rzhQ3tg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aYmmnDPt; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aYmmnDPt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g88KJ5bLkz2xZK
	for <openbmc@lists.ozlabs.org>; Mon, 04 May 2026 14:48:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TR3Aqe3eBKSuut2YSm0GwkAKT/HB242B+omM4UO2hLxP4Hb5Ma/oK71cM32p6kShRSZiHGNLRmM81lkVdt+BQbne5K8OnA+pK7RePVhPvgEkeQ7JwoFjfmslv/LfpPOQpjDg5R86ky3HZg2cGA/VLWdMrjqG8NryWClBts3sPsepAFNKy73ZP/jTP4LiAycdX017BIg+pzMmdusQzir7D5UYgODpDRxkG8MgV3O2shqoziUbWQizpELMYoE2kVYe1/VXDaJ1B3KIi90auvQHV64HuXiTopNyHsRN0KINZBMSYPIdxy3J3+YP9NXCd1kfvyfD2CTyw2bzVjQRKbmIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM/LlsBXBWaf+oujLB/raz8T814DIFn/HVPHUtKWuXc=;
 b=XLq+Qjn8NDRpES4yC8yqFqxYx0bzDULD89Y8BqO8NlExuw7gU7KrMK3Tcf3QICAc23DLAif0zk0loJ1Qhu9Jlx4WXFi+Mukw/uTv+npRYy7991TCV1P0EMOgikZ8jTRDlzTiJir/wZxcYP2uAh4AmmKONF22Atb64Jw8uATO99BiQjSNoHHEQZVLl0n+efZDkPMtnEStjDl1w1Owls2rK+N1QyVdwJcZYZfLAUcu85ygCDNp6BwmbX8YrsikrFs1QyHUgVXhDEFxIAzjnIrJBVfRD9BL4iiAtQghaEsUEUEHy25gXiozShp6hzFDypEZzCYCJFmXUDx6DhTbd+aL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM/LlsBXBWaf+oujLB/raz8T814DIFn/HVPHUtKWuXc=;
 b=aYmmnDPtUBU+9LC5VjVp1cZRGAn0rhouxgFXUwulfZ7nm3vbdlkA4PwTIP8fBbFl+OuHwSaWXthmx6lRLBkk+WC5BRnkU73K7bc01NGIL6hAGnspk/5ynZt2nspyKkKAKSWlOUKybBeWLH1IWD31sJnyZalWFY3/w8vrooExuKdMEFCmaCyzA7Rhpj0zdsQKrDHXY7tEVbvuGq20yuO1HO8irPTAXEdS/gJhPJ6xPsw9wY2vYkpALAkgzHzJM1jpmBuqAswYkWhD0eur02/70OOBUi7JqMO3ZfJ4TI3R6Z/av9Ht3j7yAqTExGNO0m526ts8X7fVPBqZvZZkD7O/YQ==
Received: from SJ0PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:33f::27)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 04:47:37 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::86) by SJ0PR05CA0052.outlook.office365.com
 (2603:10b6:a03:33f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.13 via Frontend Transport; Mon,
 4 May 2026 04:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 04:47:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 3 May
 2026 21:47:25 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 3 May
 2026 21:47:23 -0700
From: Ender Hsieh <andhsieh@nvidia.com>
To: <openbmc@lists.ozlabs.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>
CC: <molberding@nvidia.com>, <jacky_chou@aspeedtech.com>, <andrew@lunn.ch>
Subject: [PATCH u-boot 1/1] ARM: dts: ast2600 msx4: switch to rgmii-id phy mode
Date: Mon, 4 May 2026 13:47:02 +0900
Message-ID: <20260504044702.2613879-2-andhsieh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504044702.2613879-1-andhsieh@nvidia.com>
References: <20260504044702.2613879-1-andhsieh@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6d1977-dbb9-409d-18dc-08dea998437d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sdxI3JIY+7aMg6j0YwceeDfa+EVh5ffUPHWdVlXMKcFSXckrshYVmhP+sygx7h/bljrmxXxauZyVHNdqjztG79c2mLXB8tBY4Yx75qhBV5eXvmxvgFK+xLbRe+FkYOll176nElQPsVefeBLRDUNnTZPuf+NV7Fh8sGTc7wZi8pbXZ6ON9nWfBSnfGiCQqIEmpwsahiAqKIkDZ8FFNAJs3xLAuNjYLXQzMw7lraH0rbhlYMnqyNJEVaSSY+1qpjJ0rxcQafBpEL59yfXK7REgdf0QR/QOcqQSYZQyMEDtc2qt3VRFnxQLj+E5gbGxLjgOvVkjG68sybhkE8+7uWV8tgukVi8spoqO+ZGjmOLakC4FoM65ajnxX9W61LdzersosOkZd7D4rN6QVaQGBCX+9odtJODPDQr4+jbR8dRtIZbYHzeFuYGsMUHLstHryuWQCKbG9K87Q7CdM3utSl3ngp6bzoFB0f2dStMwKlHhPNsVi9RFj8b6idHl2tpu3tJorS3/OllJv6nue15GxewEaKqUefV9zQFXrOS42GIf8lownAYVDrfuHI3Ux6yTuRFD8fbIihG9b3PKnP+oahQv8A7lC3nKq0BGIgaB61eEePyDqsRcA3I6hpOGUg87EOMX65vpt80fqBEYSnZ4rjFLhluuHn4t4hDUqoEkFv5mv/T+XjK+Ffbi9yeC+tM+qVIv5YCoCdJAOILy4xkq1R/vgufTclMM7spapRYmlKUulBo=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0tlZTOS+2auhtr5wFonpCs8HBLecptpq1c/gB1yFry80+453ywvb4sPOHuCbr4q8ARnONzRbFYj39XxF9mcgh1SHgYnwT3tWtuqlJJ+ZtTxuPzs6Jr65mkxHvz/O9WhAjFWRs2rARWG1/00H6wC6VlSzKFGEb0uPq0E7UO6tU38kfN0eCbDebC+6TYNQPoqUjVQGKi1sCe6RtCQRFPRQfqgVB4sPeCDFF/sLquNV+VtLz24jYh9nf4lwKptYw64sBt13FqjOznuV8tvaPzf9LNUXBv3d2AisyD3b9HY/Y+VozV8HWkhfQUIY6orvCX+4v4UEydc6VKZCNSU/Uuh9QFWfXt+N6GM0XJFebyg85uLrt1YR4QR054BlAHcKOsSAMEQdtwqQ4s0B7D3mkH2bd1iv95QW/xb1q1TGTRZmHOLi34qI8+cHl9hp691I4cnF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 04:47:36.4314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6d1977-dbb9-409d-18dc-08dea998437d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488

Switch the MAC0 phy-mode to "rgmii-id" so the PHY handles internal
RX/TX delay, and drop the SCU mac0-clk-delay block since SoC-side
delay is no longer needed.

Coordinated with the kernel-side change adding the &mac0/&mdio3
nodes with phy-mode = "rgmii-id" to the MSX4 board dts in
mainline Linux.

Signed-off-by: Ender Hsieh <andhsieh@nvidia.com>
---
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
index 9b64f7e734..9df5e74c98 100644
--- a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
+++ b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
@@ -62,7 +62,7 @@
 
 &mac0 {
 	status = "okay";
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
 
 	pinctrl-names = "default";
@@ -82,12 +82,6 @@
 	};
 };
 
-&scu {
-	mac0-clk-delay = <0x1d 0x0a
-			  0x1d 0x0a
-			  0x1d 0x0a>;
-};
-
 &sdrammc {
 	clock-frequency = <400000000>;
 	aspeed,ecc-enabled;
-- 
2.34.1


