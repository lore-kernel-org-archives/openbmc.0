Return-Path: <openbmc+bounces-2669-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B828CA5FA5
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 09:02:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvByG0LrQz30Pp;
	Tue, 29 Sep 2026 19:02:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790672533;
	cv=pass; b=KMBDmNL1TdZQUnHRak4FNoNyMXJBHA3Dgtsk4JKJkOZeXgtXBSnCSNFAuap8pH9grB+GqhW763q5lhB5PeV1/CbH4klswgxCGf3Y5NTUkswDOh/fILCuW14XXllvgcpR5/TLK/bUJxOoGXpNgMsuMY4tEOjfqsStCgK9Dv2qkpe/IafHu09+K4t/BKabD+oIogHSmy0BGgkvBWLH5zSFYkIYTucJbblkj/kL+ySU+QjoSRTtwwVS/1G7TRhiGOSt//SMsmsfk5qm4M5TNl4/std68T5nDorgLM+fAFuZboDQLUvfjhVqC2yvTvWWKCIsIP7N0skajF3XkPcszk+WhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790672533; c=relaxed/relaxed;
	bh=lNTmHmcyW5zNeMm/yvAjxfrjD8KKD2JbfbHKImnZfuA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ri7BBBlqbNBLZXnlm4SmGdqp0k8uQ9RaICmIChoctvKz9NsaPzKkakRWQYsmwK522lLbzGWyD4zYEOQZ/7No47vZ8wOwXGxEqaEzMU+TrnkESrtnnHnR5n2wqrbHA18awf8v5Pl+CkFPJcIueq9FT/63g2qfswOso/Aov77hCfgfaC/alwLbmR/XnWAn5RYgzCqaYp5k21C07E1MUdSXC4PlHRxKCKhZlXqX0Ku81HXyOeYPUlPv4mnYNtrB45Z9USpa3FRCovXuQsUM95wkIBkVYbCQPfvB/pDoKwpv3v4PW1fwYS6Ow5J5A/EBuFs635a7i9ZylD0cNSVtUISRxA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VAnlnVwa; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::3; helo=bn8pr05cu002.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VAnlnVwa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::3; helo=bn8pr05cu002.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvByB5t12z2yft
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 19:02:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+4Bgny/PZ6PTZHQvIPRgd8oN8W6RrE57TNeHxv21wrefg01gYiYa1vp6HIizkdjq7O0Nw2xb1rt1YhXqSaEKZsAKccNVbnJ9+5SEY1F9quA+F7YfByvMAPLMbxdZkvbG+eaD9nbDVlxfoAuWOf0XNqoxn6NdO+woTuNN1yjRnlWNRftUfkxqHASKC3BaXDfAdnkSirumy/EmAt6LTxDoThM1lf47kh4xzzqh+j5AXsxufRrAlEmy7jVuZUeC7R/aiN+2Nv6gUbY2P9jU9WCHPTJlzvDE0jEc4dBnUnvBN7RRt6N/l0kgti8kiBzZZZfa2BD6JW30fzt+oE8J1mrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNTmHmcyW5zNeMm/yvAjxfrjD8KKD2JbfbHKImnZfuA=;
 b=OPp4cr0Qm/DvE1IJo8oGCIieNzGDKArLyvhWcvnpdnX6CQy9QM2ScGydRxN3wj35y4E5Wyu7c7jqkD2n8ysrNmLcBPBxm5wgmBoigTFgF5aPmGAxO7q4hutQ1L3nC3VrmLDwzibT5EPY+RmqWD8WiBleDUAaMGAYYJjZYwrOO90Sca4iaKvNGb2utm9J0ZWk4XIcRWqPivswca+UNZb8hauTxyD5Txtkpu2gqCaMwuFoU0kFnfXVQ58djcEzsEWL5/BbWxZhSGHJQuYLe31Zp/nSqgei0EkXwlmVmLFdgEhpfF0vRHzx9MDjqhO1zdCTK3PS8KgALf9BG3s8FpTAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNTmHmcyW5zNeMm/yvAjxfrjD8KKD2JbfbHKImnZfuA=;
 b=VAnlnVwajGxYg3jRY0xq5TW3Vi/7RivqxxU7WJVB78VhC/QxScKV1VELMm0rkmpccc25hk0h0pMWQQLeafBrMGZatoguitOjf/9ZQGm0Fro43/C9mRT6V6lRxR9wKROwGgmKSL9+EAUePhcVwcJWPd4UEV9iSyqWTETy4UY4teQ94OHLryQStqwBP/Wd4Ggih6VwdAuf5SBPazDN/Q8QQsvHOxjOjXKi0PaNEqh6kF4w1nYeNBnofgRe9bXyDn789vdbbbxg+cKnt21oZCnk5sxMRlM2rvSHiZ6DmUhtSpA7Vh/+tFdyjlitLrWSl3glTaJk7g/8X18n2lfR+A8RvQ==
Received: from BN1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:408:e2::15)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:01:43 +0000
Received: from BN3PEPF00022BC3.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::99) by BN1PR13CA0010.outlook.office365.com
 (2603:10b6:408:e2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 09:01:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BC3.mail.protection.outlook.com (10.167.248.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 09:01:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:01:26 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:01:24 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <openbmc@lists.ozlabs.org>
CC: <andrew@codeconstruct.com.au>, <joel@jms.id.au>,
	<tan.siewert@9elements.com>
Subject: [PATCH u-boot v2] ARM: dts: aspeed: Support MGX Vera C2 BMC
Date: Tue, 29 Sep 2026 18:00:29 +0900
Message-ID: <20260929090029.4166891-1-jackyhuang@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC3:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ce31f5-1ad7-4fc9-b133-08df1e084828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|13003099007|11063799006|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nhfRG5LLrnizCnrUxd93zSqdW0Todg/PF/kNX6ib31BtjY/nnyTFMNn8Hkn29mg7Wk5ekKUCInz55mE8UnABm9tT7ONVrXY50XKCvHN7f43df1dSY6UTV47tzlReoBRTGAdB3ryk35RfdRRpgNiuMbFrOeCznUwOYB+fXxbLo/CuUubBB9EU3ot+TADtSAyJ61ly8/oQ9YOY4JpomuyNh/dx1whY6RueC5Zn4FKcLg7lq8QqEkxFCQOKG2k+8rwkh5SgwVYzsj0b+ssokS8yhhm60seLzKnlOiQPDsttcX7hud0djgQ+nWXBbRvkx2/cQZys2xbetcfpXuYC103ntYrQ1LQfUgp/1OJamAP97OuCL1v9PMceUKHGH+sfl0+7pIPLx0SZ3EWm6YOCLbGbC3bFe9EL27tGuLbZRvE1za5PTvoy0s5fCt6OUVu3EDTDkfQtiBw2t7zSe+v0f8u7VPaeEQfzV7zScVKchHeHNmQtFpbGMr7TVuhqCU1fVJXsMD6btJmB8svQR4cUv/xk2VeCbNNIw0R0cCOKasX1BKnG88tBAb8ZB/WAYlJwDPtaHguIcdl89k6285e1uhnUpKvHdQEvbD7nuoQljc5Zm7fYOMo6sF4yl60UlilVXynF7zz3EndmvSJK4uTiA5zAvC2w3psowXzfq6cYuwetX3ey5c0kIsaxavjphAO7+vcbHy2BhGAPnhrS3frTd+MTgQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(13003099007)(11063799006)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ntPQvoIfOL9RtZOlY0GI6Az6WLCTQRjPrrYbBx2zWv6GNyVQGt3B6JltSwxqnwJUw1KluP9UsbdngQDUYYK1L254HW7kGqzpfVS0cBPUg6Xoh8RHb8NfjDfoHPxFK65Ijt2rB1DpfXkdDeBPlB2IZQc3TDSwix/gg+4McKm9Avc/5PLF5uaMROst/WR5atljb+gWi6pxqQVkCWfJSZ0G8n2I4llddAfkONEXu4lCbu5C+C47Wkvuo5b1NbCzYFv8Kw0AP0qHw+w4oUlMS0HkthCwgE3gUSWQwMsrjBq0iJ6SDXIZiiNNF5YnXQWgLTwS2t0HZprYnsax+BblplOg5uV9k8fflnqTml4TUL7ItgVpsw59U/JBeUZVEHlpuhUjs0eEPPjKXXcsOT5gN/D+bsXq2nS1oW0HfIkEfqyl2bKIisU57jw0FzbHgWdNBvBW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:01:42.7232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ce31f5-1ad7-4fc9-b133-08df1e084828
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942

MGX Vera C2 and VR-NVL share the same BMC module and U-Boot hardware
configuration. Reuse the existing device tree for MGX Vera C2 and add
its compatible.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
Changes in v2:
- Reuse the existing VR-NVL device tree instead of adding a separate
  C2 device tree.

v1: https://lore.kernel.org/openbmc/20260921085602.752144-1-jackyhuang@nvidia.com/

 arch/arm/dts/ast2600-vr-bmc-nvidia.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/ast2600-vr-bmc-nvidia.dts b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
index b4818ead81a55cae3659d4abb3ce02919221822e..10ef6e0da2ef04d2c219fcdcc1c0f77da1741e62 100644
--- a/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
+++ b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
@@ -5,7 +5,8 @@
 
 / {
 	model = "AST2600 VR-NVL BMC";
-	compatible = "nvidia,vr-nvl-bmc", "aspeed,ast2600";
+	compatible = "nvidia,vr-nvl-bmc", "nvidia,vr-c2-bmc",
+		     "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
-- 
2.43.0

