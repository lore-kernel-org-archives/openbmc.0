Return-Path: <openbmc+bounces-2092-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8C9CD98C7
	for <openbmc@archiver.kernel.org>; Fri, 12 Jun 2026 01:43:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gc2NQ41TDz3bpm;
	Fri, 12 Jun 2026 11:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781228319;
	cv=pass; b=UfihlsYAdzWozMpNDgXZctolJEu2bOa+hSq7YQ3RcZ8xt1X7ykmRv/uZm8drV7zLZ9EQDdaBuvmAm4GdlwAEX5Uscj6fubpm4FE1L2ARFSmrW8yUmBdfF7u/LX/KJeggr88DBLFkb7pveewUcA9DGLOCRM26SISljuWEhdLk0uHsqgQnpWftx+r3tIPCUTshd7QPGbtOCvFQNPGQj/h5IIEpUg3SA679SHH+N5Jp9jMuXLFQsInQBUcC9TJavBwv8pqPKMcKd2O7AElA5M0OBKxqJIyHQ3NIKOYmZqYj03NOOGHha3sRVVX+/Bf4MiuO0AF3Vl+qsDXCiBLD/UcxZg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781228319; c=relaxed/relaxed;
	bh=bjFMzFJ6yUksF5dhFWE0k43oVd1xQxTozEctMgcE/10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJDAWeg3xVTxHAh2PoH5pOZ1oFopHoTTrAsWQ26mRJlXcqfoxFgo+AXv2ontaXGLjliQi42q+ia4uKAeicnctB5XysS6aO5veayPvTqUKAMhDltPKXcbUot7pgt6PDrL2EiN8u0GgtH4I7wFbyfneGFKJTzRTeAJbBse4KbqhEL8ocQuDIGvDJ+VL9v37BC88lmeiHs0ze5NIDXxL5RHS4KwiuSK9J5baShqQdFBlkMymaOQA6ctBLalzN+wYnxK6EVMFgdGjVQdaq+Ymbmthxb71IRYu3NjI88NOzpwZ2KLAEe5pkxXxbYh6+d13yNRZcSfLWphTdYqepXIJewN/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=k66I+WSa; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=k66I+WSa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gc2Gh519wz2ykX
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2026 11:38:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCbHcC/O7tpvqlbCEu1qcIHTO/e6fIpMheV/+1vxlBR9LBu3U9AoU7J0X4cegeqAeSIzM4GYQNbb34LQJEd0gWK5ei4pRn9dSvMe56j12+8jH7C0DBq8NuYTKJGaKQNnlEyICExvxW1tUdIrmtS1KXY6Mdmvv3CFaf6JFvGAcpAfK5ynbyelodR1p2JEhjNxSTkw6ds8Lx8hKP0vv/rJV6O2pZ+MIWlzcqpdcAVZfPym/g8tkmylLYAud21z2rG0n5ODTRH1OMsV3xWBZtkjPCx2yPt/4Zk42T8azSsIBJBVIPc5moaNZEGU0/6cd3xb+jcya+xbx/yEmo+S0zVONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjFMzFJ6yUksF5dhFWE0k43oVd1xQxTozEctMgcE/10=;
 b=ymgWgf/xlMS+f79S+arifwFzFHTuQmXiqrrqH2UGZvR3yZKUAE+DTwboParyBoar21fIzFls5Ix2qexVNzp52El5rhQeeawzp9qqdbNA91GOeIoCAPyEZLARvEOwT95VMOcVeiMTgaL4wLx12qFbKn0WQZWxWWC0+/BuBjiCh8YcQQHtqpYYuYKlnWXu4gfsgEbnd2I8oGl+WgstKyr7YnHkxVO38ccntieLRl6hVGkWDwN4yHx9K6Hz1GEZFqwM2fLXkJVJaLqapYMzbSj5rR2pXBj74ckFL4bU+gN+vRyAkaWyxxppKSVUAOgePKYotB4D9VciezbtGd7rYnWjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjFMzFJ6yUksF5dhFWE0k43oVd1xQxTozEctMgcE/10=;
 b=k66I+WSaEzhQQBmhV+xZC49L5dDaXH7LYl8DU9g/4jdFp8dTdRbbTH3qVMz3d0gW6OTvldjS+2KALG1e4/9aBNQujYoVGzlqRNvMIzHoaJlyks+x6b3sfXlqtXetGWukLk+rr4zD7TakfKondYwNuGzyIiqWlFk2KEV47qTcbkNmhbBBdTqXaeTTrBH2njWpph5fqX2wWT1teruAHhivRBQIb0q0Qr8QE0RzPEblXEhRujvlVAlsFK1xHv3DxQPnRKWNgrLCIbtiuvZrYahtsOdtkPY3GbRC0UjVcsM55pO/SPpDEi4MhaaUMnGgTfiTl2qfUy/kKp7xLISqbL5gTg==
Received: from SA9PR13CA0145.namprd13.prod.outlook.com (2603:10b6:806:27::30)
 by CO6PR18MB4386.namprd18.prod.outlook.com (2603:10b6:5:350::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 01:38:11 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::f) by SA9PR13CA0145.outlook.office365.com
 (2603:10b6:806:27::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.9 via Frontend Transport; Fri, 12
 Jun 2026 01:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Fri, 12 Jun 2026 01:38:10 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id EC4B64186B5A;
	Thu, 11 Jun 2026 18:35:35 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Thu, 11 Jun 2026 18:37:29 -0700
Subject: [PATCH RESEND v2 1/2] dt-bindings: i2c: cadence: Add Axiado AX3000
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
Message-Id: <20260611-axiado-ax3000-cadence-i2c-support-v2-1-cfdad0534afa@axiado.com>
References: <20260611-axiado-ax3000-cadence-i2c-support-v2-0-cfdad0534afa@axiado.com>
In-Reply-To: <20260611-axiado-ax3000-cadence-i2c-support-v2-0-cfdad0534afa@axiado.com>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224; i=syang@axiado.com;
 h=from:subject:message-id; bh=TkSXC4qzID2jUyQceZnzGevfYjclKCs2KXsFLzBDCII=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhiztZMYm5Qd+pp7L+V9mBIopnAo8WnF60ivBR07Ttq9P+
 KDMtGVpRykLgxgHg6yYIstXnW/5J3O173XuXVkKM4eVCWQIAxenAExEz5ORoZvp+I9EC7mPURvu
 lfj+K5I1OdiYsnqt6LkZfx0P3T9xqo7hfxCLWYcN9/SyU3cPt29r2L+Qy6hJ3WXCtnTnyavsMrf
 sZAAA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CO6PR18MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd02341-1898-4e99-3c02-08dec82342db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|7416014|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PoNFLVVeHz0E3qwCt0ZjA/dVulyRGZLgjjjicU3sX9Hh3Ue0EGkCvFKykogBBSdQsEmRqINAut/Re1xucfAgO8ZqxN5K8UTXGm1Ppnrf1b+VHaB2ZZfZpdgZsLsw39QTUXGORfiamSkfe9w2xU4R13JSA+3ZFi4w6eO/RHHWDO+rWlAhaAipkf4Di12y5knyfiF+Gk9KsfEO3hvpTVTGGT1apqyjs2NiC1gJ1eM2wtkGTSbrdQdUBjyLhwO9iPGXHE/j2pMGRb6hNMsKT7Exz4snVy1aF8yj1D9p6LXqX8fPHoiDcxDYjWHY4KAbpNf+FV0ySfcbR0qNQI3OxAV5Y8stpwv5A1aZusmLrZZNr1WZnTPkDNpSrPTnQk2GWYSOGBoP5IWdkE9/Tn2nrzURfGOLitVfJUI8iNYfs6Rh4fHiU2bLXufTUKrMPYqbMVuYxI31J0Pe0rqYf7zbXoItR8IjeCDaxLtPEcZyD0gCBKFemQb6V+gpEQCjaO31kLcmV2dXevG+fLOQgRwmO+GXnIGraH9GCctS/OW5FEPO3ox/N5B8G9+ZYkAkvQzjosA1Q2aCh0x6xqcwH6KHxrIF0qKYXPDw/4rs4C27x3U2hPc6xLWuN0x086LC0Xrb8p3Xz06gO9Dzcfluz8q0OwlcKZ6m/FGrcnCgldlWSiJXcxRqE6WXJKKtUtmfdbuzRhMi7JAsh/LaPU/vFLxx9sGCKgQTBRKeSkmRZ3NDOZfLx8k=
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(7416014)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uGgMGZ3/kGxk315iJAmnnAruhOCEUY59Rx+rcGDo/PbUT6qE1LIKRv/CFh24pi9m08vRqXzOWOyxHDDmoK5SSOaPprHjuSu+ZOuD6B1I4n/WfwF+3L24WFjVd0oSZLZUcVcbTExIts8S+gc5FF4HzO/gw6YuHIgSqV0fu6BdNFe5Z/Q8H4Qf5rC1KapeiRo3RR2c4DDqgz96mOQAyacis7xEXDyf/Gxrl4klEgXK99OlTLKTf91V2Y9vGazQ5ERl+6OHPp5XSCJgPNB4sb8yp1ceNhZsxak8cznKV8KnXVKTFpkKnAbCoMO0+6U6KkGxtpXPARxoGVRK4eOWflw+3bi08k8KH0b3lek6Zu5A6eyzya76YlmG7V+lCxJ5rsVoWiUroRujBOgbgkbAqixtcmse5/hOp96Crbp1rtxRyAK3uy++2+Dp7KB9YVzRWqFL
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 01:38:10.3011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd02341-1898-4e99-3c02-08dec82342db
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB4386

The Axiado AX3000 SoC integrates the Cadence I2C controller.
Add a specific compatible string "axiado,ax3000-i2c" to support
its hardware features, including SMBus Quick command capability.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Swark Yang <syang@axiado.com>
---
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 9f1d35ce1fe8..de2110376a3f 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -14,9 +14,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - cdns,i2c-r1p10 # cadence i2c controller version 1.0
-      - cdns,i2c-r1p14 # cadence i2c controller version 1.4
+    oneOf:
+      - items:
+          - const: axiado,ax3000-i2c
+          - const: cdns,i2c-r1p14
+      - enum:
+          - cdns,i2c-r1p10 # cadence i2c controller version 1.0
+          - cdns,i2c-r1p14 # cadence i2c controller version 1.4
 
   reg:
     maxItems: 1

-- 
2.34.1


