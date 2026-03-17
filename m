Return-Path: <openbmc+bounces-1565-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0B6FF6E9A
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 22:54:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fb6gl5dWDz2ypw;
	Wed, 18 Mar 2026 09:53:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773777160;
	cv=pass; b=TQ8mmhL5pwQ+mUXB4KwtzxVCABMcSbhMdHE1tIL+2r5dF83srzmbF3jyCR8lzMBjGyvbeRfQnPBjlSOJ0FG6AorcWNm0036CIGFOwjwpjag5ZHEoFoWH1bAP0SVNknz9lsySlshzh2YSCN92xPdOZe0v6rt86mnv6eCrCeGHuJ3178tLVTr8lZ4iV/1AAoiKny+oHOT87my/6OmOqX1TN2rCFepwWX0RLr38P3XbCzyaDbwE/0Th705PseyPvHNStwGyvxzErvR0hX41tNGaUHIT5T5XCQydnf6ZxQVWSy2HwcorEAk1VjFH/Bfb+HdcaPWsuEc8AAarK/nAC6WIIg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773777160; c=relaxed/relaxed;
	bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIAruWGjCBlB0S0sM6D1z2EJxyfZ+zw7T7Itle5xWeBhgTMKMm0tohe47exXdaXXOt8io/GnNUuHGxv9pEDO0EpZ2n//dgOwdHzVR1ABVnDebhmkfbxUxKlQ+Cl8ixPr7frEBFoICIQMzuaFnYjmbT2aXJTPOuMUHhl5DyfQiC4TUQgf0bUcMNk8CdFo3cTuEo8VH/DZpYq2FokuyCLIIw3DEjRsjMa5C8Kd6yfKgkIrLu+XboTbLlN0/Rn1Bv8e3OmYb/+c6LO0sW8Yy2HlZwVrX3M7BXH6yfiYp366uTSYX5kCnfmA6x7rQ36nXIzCD4lcR1BViXnjGHcx38j6Kg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=XUQsvmsw; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=XUQsvmsw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fb2g93KKSz2yZ6
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 06:52:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTyvY6NPHpkMAtm5m+q+VRm7yVgpleS6O+jK+dP4IHw7+NLjizFHnoCRB7UK04UAHdsq6JyHyMVssYrsDR/kZO7/QJWMFA20pJQHbdvmrAVJTqIi37am1xMXBb4Tjn90r+kRnlkOzt7Xd5yQ4gpHKHG0hqIFRgifecfX4QDi6CvN8YkE9IzdBlX/SD99Ml0AsqBt7W5votoap9YVMJssQGLKLE9ZKH0KjLQgOVmLLc/kGMJ4DNS21ypmYeRKSybUcnSe9SbaDcu6sjpYuuHwqZV1saG24crY0oKVc257LLklYASu/kz4q6lctrPHhotX0i98fuVPfvCzYgoCdcPhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=;
 b=TtetDd/euBZwp2c4+TptHQt8qyzQKKQlHgXzmKCkSjVQyKXAzZXm4BTJaVuV1kfpPRqmPaX2wduXY+7Uq66ts4/bqEopYZ8vnW3QeQ64/iEO2Wq1Ghl1dMeSL4y6FXiewNdukI/vlQ/pDPfYeiQjhuL9mgRhk4q73RkSyUKOgEMgiUayTsh9icROFtvDqPlWQ9sOza//WO3/1VRcYpJgOYzH4pcfguIV1RE/Ib4cP5JaKXLb9I6892+fq3M5bcq1SawolyeiBNHaCJj7ZMZOPFz6ZUybCBKOWyb+CTStcJT4r3AoAaZ0cngJuYnE1Enf9eZ54jcaO4DI497cbJ7kcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=;
 b=XUQsvmswP106geq/yLD92q4nd16Z6mniaOEE/AtHNNJcuxUdViRE5/RerjMM/FFOOjgd3u4Gmlrk3BCN11QR+p5lnhqeK9bhGiAzgp1jt7LRZQtXfnV8RCfChDmMnV+SfhKKo+b/1LP1ovJIujZ+ogaIrwNG3HhqN6jB7mJPuiWkTX47Ii55rcqM7ygusSVqkyWnJ5+rivRscP4t/NgG2LXNCmqSt7i1LEh0/+VboJFhNLZAZ5xaEyFVfqWrUyEWV92S6O+ijA2dSlvGpgFdCCogvbjEd/SpoVzPlhRDpve2kjTe0OtrGkhJHTlWU465bA0wB9/yVfUDGTKLhhASew==
Received: from SJ0PR05CA0087.namprd05.prod.outlook.com (2603:10b6:a03:332::32)
 by LV5PR18MB927632.namprd18.prod.outlook.com (2603:10b6:408:35b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 19:52:12 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::1e) by SJ0PR05CA0087.outlook.office365.com
 (2603:10b6:a03:332::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Tue,
 17 Mar 2026 19:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 19:52:11 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 678484157BE5;
	Tue, 17 Mar 2026 12:52:10 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Tue, 17 Mar 2026 12:52:08 -0700
Subject: [PATCH v3 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add
 Axiado eMMC PHY
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
Message-Id: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-1-fbf790f3f711@axiado.com>
References: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
In-Reply-To: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=twei@axiado.com;
 h=from:subject:message-id; bh=dmL4+JZi1AdhbhPqTCa4lhbBe/FaZIli85fBevKnbj8=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpubDqpXO8aBQuApYM0CZljQXkyFil0QITpywgE
 V9b5OVTfniJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCabmw6gAKCRB4EDBdxFrx
 11KIDACh+SSXsun2k1z+niGJiHhIQWlx0ssCE7XNdlUXLp3fxHYV3xZW16HiA383ezLXyqXl2Ut
 0uxqrAtRPn7PGQqMESXWMF09ly/ROTq1kssalzF6BBCEslQVePtWjakDpV+hKbs2BcaHS1Z9fRs
 wcI29oyeSTVRQbgipQ1sMCumEVcg+CCf33zIGRh5PrjeJwKr+90nVMtRZ70HIICqB1eL8tqlJPY
 9kxHI7HtLLYwDKAAqM8jzGDSCYJXU2gASxMKDoiCePheV/NTs+fqwro2SQHzhiYqLw5z+jGqYtN
 1SwsKIrBneAdoiIsDOKw2A4XyHlQGMfpKsd9gpgNE6pcxaWsHs20howKSbneOwS1fT1oRhFAoJY
 JHFTuzrWA6/OVXQcHKe0W8pOiNe7MStFTOEv58wGH0RSC/UZU7dCYCwQ20lqPyJzDr31Zbkq1xC
 gTnGncWftu/FNoST1fyY6/Bkjyh+0Y6AzXKB8AOhZq1Y4T7VNpiDS5uGphA8pH7PYtqsc=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|LV5PR18MB927632:EE_
X-MS-Office365-Filtering-Correlation-Id: f7eb3591-524c-4de4-60cd-08de845eae22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|42112799006|7416014|376014|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	DEoKrSOoasz8EDq123yuurF0Z9YrNGlmoiH1IVFJJDZh372npyuQYMh2dfuYIGdOj4qH5lC1fZkU2aChnrfcDVXZAHaC9BYGJS53rty6Hn65j9LIBMbPheMqie9HPu2Bhd5oEUO2q5/hjsqYPBfdjugCdw+YqOlnFBg/5v/t5wkUnzXC36Pw0ok/Wlu2/Bo1sj69qKjpt5qTLDmGAqnek71xwBJtBZRiDxXMaubyOEet+TM642oC3pNX6O00uOET/fETkjnWEC5+CiIDHHyw4L49WjKPL577hmifWOExUC1nhPgkv3k7sw0fjiKMB9ypsFCS0mweUgqRFe7WHJ36x3f4GxXo0LmVO4yrWRafau9/B9flim3SjVHJvizh4UyLPFkGP3SnJsCObP1Np9CR0EFfJgrtumh80/+ATU0hJFQub49J7LIby6Y1H+9sCRLY+ZddBd4T74Aicf74f4DXTkCS5xYgGmFDR9X7+pRYvToyjYMy0KhYvT5FzcFb/mIiP/YlPRy/eBKB6UWggkMl0BdquVuaV2daD0gG+R4urroTNidwADBYUWylkXJNWu/sR284XrvA8hMD8te9w7y2RpW3TtxPX9h8nUZo3Wozus6q/5eLwSkO6nye3++ed7Bgm642mjQgiRl4kYY9yc3hk5akP1G4SXwz8EA71DX0r9LSYqjea0Gl6zfBqtWu2Pm/p3i9faB2OgBLQg1bnaR3NGHo2XwCm8vrZlyK/o64f/0=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(42112799006)(7416014)(376014)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WCs632pEqGFRN2kLXirjGeqv4wqHIuMcfY9E2tZlRYT5nFgjAFfCaL8YEag+wlZQYuz4Nhg1bThUnIXhfRa6KVlch+Ywy2dPcdBKDGszvgRLYn0mCLaDeZtNa1lRbt51WpwpU2Ncw1C+i7f3zUlZfD2t9IB7UX6TQdiOFsuDfSwNHsXt8z/nyljC0qNK03x6ekpd0fGYbPjuF1L92Z9Oo5C/OTkmHsxSCR+AgXC8Zihccu70xIdD3XuP5dVNv8cMemb56Kr7NzTNImLKu9Tzf53GOuLQHTg8W09wxyoRtPfZzn174bEW3uXbPNdHD52aIFlIifClvnVHaHJrba3WbU85R2kM168PTfOboNT3q/wmzgeyyqnJUtWi4yuLdoTJgvTnQ0pjSifDceTt2SkdaSX7p7X3T89U+X4E9X3V7oBIAqRMaIN/GzLIUsfhzktU
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:52:11.5981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eb3591-524c-4de4-60cd-08de845eae22
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR18MB927632

From: SriNavmani A <srinavmani@axiado.com>

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC host controller.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..61700b80e93f7185e16ca9eab0922fe6bb29fe86
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/axiado,ax3000-emmc-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 Arasan eMMC PHY
+
+maintainers:
+  - SriNavmani A <srinavmani@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+properties:
+  compatible:
+    const: axiado,ax3000-emmc-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@80801c00 {
+        compatible = "axiado,ax3000-emmc-phy";
+        reg = <0x80801c00 0x1000>;
+        #phy-cells = <0>;
+    };

-- 
2.34.1


