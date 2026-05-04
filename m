Return-Path: <openbmc+bounces-1884-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25201CD3427
	for <openbmc@archiver.kernel.org>; Mon,  4 May 2026 23:37:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g8dMs36MXz2xnt;
	Tue, 05 May 2026 09:36:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777870082;
	cv=pass; b=NXCqYBuaqca9CqPW+leYfmFiycvHbA0jrwU/aGu60zAiCWbo/kSAs37seNF0DMrcv2vNYZ8Dlm5UAj5ujM0RIV6aB9cJ4cXGdPh+NMfEXt8bSOqCJQ4EZc0x0Ii1E/TzmrdjgIclOVIOsvZh67mBf+YWw7YQDppigi+RBzNNnt2S0l4F7EmZSAKGDRmwwripaL6TqtvzTgF2c2DOftRIEdJ1OT3vkaHvqH03bfQ2yhMs4lul9nkPZ4B75wMdxIokraMdbgtCbupyX+w4ycXi2d8jGbMHRiLRFC6Iih3RI66kn0Y0Z1UObJlKcY9w39SSbduK4pPtrbCQvv0PbGPDoA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777870082; c=relaxed/relaxed;
	bh=YhrRRgbkPAmk+5x7rNlxqocW/kvk2HT3mfpq6vYRw40=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L29FCJSJaEcMKdNXS6dSs+mxA+ZYBHQtsW+uGMUANZzfwjC6zGvWtzWzTfaXI6EQ3fUglqXbvy2koKjzzmsQlBJQ9Wcp+xpbQxTF1HM7a5aqaZHlX1BYMI0UGttLGIZxsKw6akxX/gXgBSuLgYxtJxYB4BzalTgBVy8yhVTOQQiA184/0RqQ/hR2/wgKeg9/+RDYltjoHhEmK4JDnwcKcvYiksPho+/mRKN2U61rqPl6bcfD5MmGR8kRNXFf7MSdfJl0PYse0cZV9PhzxEQMQJxkw84223b1hUdaTNz+QnmmF/mMeQxM+rGZFnKefDLJUACjX8ksYU5pg9iw0aOiPA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fVl+Kc/i; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fVl+Kc/i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g88KF06wTz2xZK
	for <openbmc@lists.ozlabs.org>; Mon, 04 May 2026 14:47:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY+OBq96e6g49irVwSOc0yGiAwJP6+pCPGhXIAtRbfHKT1h6FTd0xoKlvub6njUPM6c0PYj2e2xnLTgc4q+xKgzQ2bHtfGALH5pDYW+Gef2Froh8zM0JzPWK1t8QLwvYAr1Jf8S2o3+ArHJF2gbmfrWHQVC/qSuehvdKa2QTSffbj9FPTnd9eh4kcyCX3SPfR1ZNHD9OvCDP+NMnAI7RIlOkt0LEzwqwAVPB1ghl2onlH2syzywu7jNAEbBovuktvbgAlZQsGfzvvusVSxDpkk3rTO1vrFg1SkWIuWSc7YY5dFW/Q/LmMdwna9rUtesDvzPC2a7nKBnS/pYqCRckpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhrRRgbkPAmk+5x7rNlxqocW/kvk2HT3mfpq6vYRw40=;
 b=qa4Ec0EE+kbo+nPYs3C3pYAIfmvcJE0XHBvGloYdAj0iVSyzLlUv8TX+PeNtBv93VYyVLr0Stfcoyu2Q3GwfIKicnRehg8RRpo9m4E6hc6PRjzhjjf4WeVKarlZSHy589b0qx8Uti7j8482z1DQzkITxKfda+tkmUWVLiwzT/UgvTs/aHt311/KN0QLJduzLwe4ADaK6Z9QgmsivLOEQWfdafS8mlROS8JuSJ501UUGYlhP4veKihTT+VqtnLxXCGXZIdelPjlsEq6e7QH1uvFJ8H4pSROUWpxZbVtN5+wfPbCq+TyLtzOgbtvSSS/5cbKuVye2SZTxhOXqNx+0b1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhrRRgbkPAmk+5x7rNlxqocW/kvk2HT3mfpq6vYRw40=;
 b=fVl+Kc/iamcytLANU8QMTJ9850JEBxLiXQw8v3fN/8yl32od39/FE6lLXpL4KfVCE0uBm45v7IPrlxrM4Bx8qNvcloUh/iykRQIeunpaDiqOS/NFG2+AwUpAUgTQcFc3dDc6RHqoZkS09WnptbBc2yHy5vjHsTGrqPQBZMxr5h1A1/2YNB0aQSRB65XSYW9btZs04oT4i4HFxVfi4rP7nwFEmD/1AlN0t4oDuNU8w6VFeXqZyWQ+RfxB73LBFH67QUCp5Maa0CslPOR8Lf+4bK0h15NMn3h1XIfVOkTzMudepd+K3RfJiMcosFortjgfoCPUbl+tdOdlAv2q+0K5aw==
Received: from SJ0PR13CA0165.namprd13.prod.outlook.com (2603:10b6:a03:2c7::20)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 04:47:33 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::f1) by SJ0PR13CA0165.outlook.office365.com
 (2603:10b6:a03:2c7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.13 via Frontend Transport; Mon,
 4 May 2026 04:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 04:47:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 3 May
 2026 21:47:19 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 3 May
 2026 21:47:17 -0700
From: Ender Hsieh <andhsieh@nvidia.com>
To: <openbmc@lists.ozlabs.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>
CC: <molberding@nvidia.com>, <jacky_chou@aspeedtech.com>, <andrew@lunn.ch>
Subject: [PATCH u-boot 0/1] aspeed: msx4: switch phy-mode to rgmii-id
Date: Mon, 4 May 2026 13:47:01 +0900
Message-ID: <20260504044702.2613879-1-andhsieh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3dc2dd-0ffa-407f-3ca4-08dea9984095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4T7wJ0HGR6ASNJMRX/7tGasPE23GpAgVnQS1+3hmryoDEXUXN7+x4y0NAq2VechdpdVMRAWdp9FL4k8aidY0HN/2Xm0y1yQFK5Q7G1BdpWekPCObGCw65KuhPKdHx0so33GRnUZbKgAIIlCdsKqtB57akFoZZo6d9DEPo+M7oA38E3ij6d8HMJhLclbGR05OKY87xVgWlrXsHvNcLtlrBDKfO13P7jFvM+jYFpG72FP4pv1k5qN9SOlj/d5z8VUkPvt6OLraxhnEQiSmK2xu3KYTqz1hAC0igByKHDIl6tLt5tT2kzmDQkX09X4NwgkeoGr20/mfDSnQ4kQ/FwKpxxW7ueBa9iXjlfu1ng19YEaUCCU7y4GPNIhQDVdFuAKsrrMZ2o1gBUxWpw1hxBCp2eaBHigp37EXDUHMg0Fls+QufJPFH05rY9bNuNYAmTjpI7/F3xRT/R/mWNmyvuAngBN/ak5plingqRbPk2COVOJl8L9nKNqYKhwsVRnmFT4sngHhNEZA3M9W77INsda4AYe5F56bQPmcspCDGAL/i0sOLAZolJiRdMW+RM8bBdiHqTX87iBM8rcS09mZhO/NCcZjeYAteRW/2LTD8qKWtLOFMiwr4EjeseacSo8MT9xJaRLgFmGWXPH14/C2Oh/9de2GIQNLS4XfBFqAzPzAOGhJQ/uZVAolJ9aLy8JiyyuMgu0Jm7JbL2ZRmQpWiO8UrdfySoDpiUE7R69oVJ8Bp68=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cgchAxg0axs9bU6q3R4K0ZSgwTWbGPuTpXi3ulGHlX5h2D0Bo4VrC/u7Wy5Wef20sXGOgq50Ikxw+nK86WOtdP9fHoEnTOKiUn3YX8HUWpBVO3FoybHeW8bj6UhAPfB0HUhW2BfEo2JQZY4Z79vDBklqlBK8WlK1Gq3fIiOXpdvUUz4kmcrBGJSkq1EWab3a6nXC2jLIU9O2AytzouKS1OPEj1+bC7rgoeCjpZeWFnw5J+T46tFItKu07bHsEnj26LiLSGsQnZDVRUNF76o2GUiD3I1cgKQQHmziuqdqnxXqf1rm+xLRj6Isi8oXaEYaLDEDoQVnVCJUFz5oTEu0aYAFObCncHVq0PfJfzUJ/33toLkuAZzfsYpO3C3cTtTxS+eiQXYG1/ybzw7kLtpI3XqBXN+sDR1aQ3JHqOq2u7tZfT7O9gldMu9stq/vO7Bk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 04:47:31.5448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3dc2dd-0ffa-407f-3ca4-08dea9984095
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232

Following Aspeed (Jacky Chou) and Andrew Lunn's guidance on
linux-aspeed [1], switch the MSX4 board to phy-mode = "rgmii-id"
so the PHY handles internal RX/TX delay, and remove the SCU
mac0-clk-delay block since SoC-side delay is no longer needed.

A coordinated kernel-side change adding the &mac0/&mdio3 nodes
with phy-mode = "rgmii-id" to aspeed-bmc-nvidia-msx4-bmc.dts will
be sent to mainline Linux separately.

Tested on alon8 hardware: 1G link negotiation succeeds with this
change in coordination with the kernel-side patch.

[1] https://lore.kernel.org/linux-aspeed/eac09481-0ba1-4ac2-ad8c-d859822ff0d5@lunn.ch/

Ender Hsieh (1):
  ARM: dts: ast2600 msx4: switch to rgmii-id phy mode

 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

-- 
2.34.1


