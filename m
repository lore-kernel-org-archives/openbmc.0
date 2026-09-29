Return-Path: <openbmc+bounces-2667-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33395CA5FA1
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 07:33:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hv8zw57rCz30Vy;
	Tue, 29 Sep 2026 17:33:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790667212;
	cv=pass; b=ZaeArxwC4oMrVuhWOjgz+kHrpABWpuKXku9pXXzVc9stlAN6vqho/4NnKqTK3m31GGPaVyUxp5xfG4IQ9KWk3nggvSKkb7GnvObxNTmYMHFHvnJaUrdWY0B/C1VlTQUXoqmYofHBlsBhyfTIVpdHW9kpIHZ36N9JWgwaSNK+XpTXb9+Bl21e7oUoWWLJ1b2xwlSCH3XpAdkfGbVHq8IxG8y6ZJX1RCIt8BWhs4KzHwWbRIMRAyCBGRDDIYx/7lepah1bpsGxrsCDF+XPCfPdVtVp14/MlncScCGnfuZmjozmoq5tRMY+L881oc6o8HPG6qcUgBgOGPSzcr/398C//A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790667212; c=relaxed/relaxed;
	bh=4FMjQ8/QmnsyioY+UYziRaW7LmG3dz/bIJOrzVpdKyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AHGZ5L4yRgnP54kq7h1s4Ij5aodb/JVAuaXbs8aSgqVjsv4khQy/QVPrB6hv9vXP44OKn/OkN86DEGlXL8SwoTJIZZ+Zi3cAgs2Ia3Eu2Nop93D7lsXZAuTe5PsGYG/jyLfDzgUG8eba6rMfOKohQLz3S9I61Blc5du2WN2qGY+1A/xx9RRGiOjzN70bkzZbpAJwnnc6dPEVlafEB1VAbnbKUhyWddKiZWOn+Zx33n+zeXRvgQjqeD69x3wqSYF53V/pf0dGccHZD49o7GOtl01PEM2kgq3He/OUnEHMyxT/rcvuvw2WhlmD9VcgYlBJmCGRO9JMQDOvmSb7RFHCWA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=yrhd15gi; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=bounces+srs=sj1uc=hv@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=yrhd15gi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amdcloud.onmicrosoft.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=bounces+srs=sj1uc=hv@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hv8zv64c0z2xbQ
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 17:33:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Et7mNNv7V/bOo4nFq4wSfx4dL1oMFzrAXazVA1AT1l2x5+1ckLSQ3/DO3KKJnI1egXF9e5PJ9PArwU/uvpabsiteHlf1pvZj5A8he5o8Gr1pVXv6SR9n50Om4uZ2AzXKkM/KgelaKMQoIMXF3CwDf7p11YmqM7z1olpJJdbZLN0hN/4Yp/UG80XokQQVZ34pf8Yp8G3Yn24xekb5UACbfWvnV8zs9yW058Y6WTsYgyFJyr4pakGPcLXpKuLPUimawYICqb4N4Z8uN1Hgo1DVXv3zZkBB7Qexpn+dYD78t0d8A79vA0Blg2X9hlkMd6rtlPDz4zqb53MhSXrLgPmmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FMjQ8/QmnsyioY+UYziRaW7LmG3dz/bIJOrzVpdKyg=;
 b=T0VAv6QyZU5uAhxHBCoBtbrfmGvZ+gX1FQ3Pvr2sLAWz23jUPqc2EMUDDkVb1TF6dYJxgTJph76VIgoV1tom4y5Zr4d+VuJAmMn0iShuro5GP1MBIHXlR3ZOf17uezMprq5WAnJkivDT8NscfgfVa9d8VA1t8xv4dnnqJyw+m8J4CFNgh1tqrQz5oil9moFxV6ycXP9BrDyTVOkg7Skz8mijjqShA0UIYXpOfmQIciAJt073nCT+RXsqcSsLulwgEs3IeyQPJADkpbWH8WilNfjuYrmV+Qv50b+SnXZkFAP+R5NZE8NvXoNMMh0dJIUss7q7djqCcDpxQaYGyqEhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FMjQ8/QmnsyioY+UYziRaW7LmG3dz/bIJOrzVpdKyg=;
 b=yrhd15gisYLBQKg/Xrf6CpWhdbNmpOKTvfTCJ3J4z1EpwnELP7x8+9GwQOz7BOgP6MHiKoYOfWQ+aVjwQt4/WLCbx+MSEBGE07uB4kmwHHyig4mayPH5THDqon9DsHF42tRrNywEco5mio7nH3El2FaM9Pl1xPV0OZ7bdqaR8nhDRXw5GHFO8/x8xH3cI7/wA4yo+hEIKLH5bv7+HJ3PVltK4TJIm9FeFCfD7Tp+aYpRMUiMnJqq4YQnUv/2+Vjhaxiv3iMmD9594JPpoZi/8letHLGBIjH+3+uNt+k8+gTt8wnJvuJq+8FXbW4m6I48P8mMKl++i8Cn/aVMdEtkOg==
Received: from PH7P221CA0074.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::16)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 07:33:07 +0000
Received: from BY1PEPF00026964.namprd05.prod.outlook.com
 (2603:10b6:510:328:cafe::90) by PH7P221CA0074.outlook.office365.com
 (2603:10b6:510:328::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Tue,
 29 Sep 2026 07:33:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF00026964.mail.protection.outlook.com (10.167.244.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 07:33:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:33:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:33:04 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 02:33:03 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 29 Sep 2026 15:29:45 +0800
Subject: [PATCH linux dev-6.18 1/2] dt-bindings: hwmon: pmbus/isl68137: Add
 Renesas RAA229639 and RAA229640
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260929-openbmc-add-raa229639-and-raa229640-v1-1-de693c0a6ecb@gmail.com>
References: <20260929-openbmc-add-raa229639-and-raa229640-v1-0-de693c0a6ecb@gmail.com>
In-Reply-To: <20260929-openbmc-add-raa229639-and-raa229640-v1-0-de693c0a6ecb@gmail.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, Colin Huang <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790667009; l=1152;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=oLVGUVSWhFBTnlWcqPeH3vfi4y6WBz7o9S8R24YvtKU=;
 b=ieK/DfNIX21IxvdTOM6OUhJVzbUBdi5ISqCEhaZnA+xH0lmuJp1wEir6TSNtKRQE6QoIvG3dv
 l6APeI6/jBPATltckKBUGAIFYiXKN2Xa6SVe71Aa1ZJgkPRmQzGxbhE
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026964:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 663813a7-9a0f-4df3-95dd-08df1dfbe6d0
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|48200799018|7093399015|82310400026|61400799027|35950700016|13003099007|10067099003|11063799006|22082099003|18002099003|56012099006|16102099003;
X-Microsoft-Antispam-Message-Info:
	4Ll/TwBme+y0pY0uFF69gOsN9CjVZPIxwA2KS3rsA13zXFYU8O50pEN/fO4qIQTdagXR6M1/xCIo4KKUhS7+naKnHMGoIgdDg9B129VUKwmIo5T4s0mhs5w2dh577lJEDUPA6SJ7smOxrhecxkpFMYaLp6cOTfKICEPPprUzr1tX3pngBuJxz+t8mbh/PjpqalImRLU36iDhd7rDAb62LnzqKsBHN19UZamrqPL0VqIQWt7LeloH0vD+YjAUx3uJQxeGaTdt68hlWJ9LjT/zeB5O2nZvfJLnbaglg8S28dhKLUKZRcei7by4v61MsKSEf0LJR4g+Zv5SVoRZH+GoHlpRttTMsak2D1lW7lHbnMaG2/uq8cQ/oDdcA0lTLRsDA7u4oz5shvvVkRo4As2/OTVahrxtTu4xb/6Jg7GXhijXr6kycsRmZYBcX5FFDdBFkPOz/uQ6qrxwoSIpfHE5+m9tr3YRvSeAKcqkpnqMy1lmz3E2yivpUOg1n7zWrFJvzgI7G7c4qWe1XPbQM6JdNsaJQ6Cg0uGjBm1oJuO5c6DXcFOgMrN59DHbPZI1Lidb+OaI2ZEBnZaOAbbs8Uxk3xQqO39xmMJ0XYiCcTY2S0oOTS2nhXv09zttTmHnU5LySLfgsKJyyzYpv1XP8/SuHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(48200799018)(7093399015)(82310400026)(61400799027)(35950700016)(13003099007)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(16102099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J8f3RZ3l9QMQTzcKH3YSbDWSdQyLv/zm/lM602sozWlqicudWmkA6ZkhOLMe31ZbtpZ6AZQpkfNTDSVIkTQy/ppYKNYC984q4WwYjNJPjh/7d2D8NcExqF/vQqIeUjUPn0lpWf3YdqQGx56oT9FowK3xMN+4pGGOR9jlv/sUJsVGKO2FTISIZpCnnjrH6/7MNwc7D2ZwnxR7+g3ya5YPKTvqwcraQG+FU0vSq4G4BGu9/5Sv3n3FKtFyyjHXhpH25ma0jusWKCcNVxb7jX4s/47+4Q2v11nw2G34m0LwPiMP3aRSxNRr03CTODn27njBbOUJ+bTxHQvOZ/zGk5adtVgHd3RdRhJtP2BHbrWIiXDGnQT2nsz1trjNX6I7GwLrK3w947I7XspA+9VZk/YS1O3KTeyZm+zbD8NWgMRk90yRJuhlYze4A4Bevg3FIGTO
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 07:33:05.5049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 663813a7-9a0f-4df3-95dd-08df1dfbe6d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026964.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648

Add Device Tree compatible strings for Renesas RAA229639 and
RAA229640 PMBus devices.

They are compatible with existing 2-rail non-TC controllers

Signed-off-by: Colin Huang <u8813345@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://patch.msgid.link/20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 645469a438cffb1516d1c2d48a887e3b99202ca0)
---
 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index ae23a05375cb..3f5f49c61481 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -59,6 +59,8 @@ properties:
       - renesas,raa229001
       - renesas,raa229004
       - renesas,raa229621
+      - renesas,raa229639
+      - renesas,raa229640
 
   reg:
     maxItems: 1

-- 
2.34.1


