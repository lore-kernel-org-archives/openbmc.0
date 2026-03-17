Return-Path: <openbmc+bounces-1560-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0328FFF6E9B
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 22:53:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fb6gj32tpz2yk6;
	Wed, 18 Mar 2026 09:53:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773777159;
	cv=pass; b=nPve13Fjl4rkJ0WfY9B8tf7vGaF2wYQxdFo1CsJ99ME5qHYcaKrbe0McUVzd4Hl3pRqV44/fCR5dA2FH/kuXMxa7U0MOfqteFCJw3cqWtuXXysff1+nfQqU2vi7kRRlFoDy/TkltcAa+F7OS7vZkE3R9WbX54wBTHZnHLRwTIbORrgjq2K5ChePbV0elFaOusr0DUv5/4DpnPFY5SzY13tXz6yr93AdppGalUEaL8QS9IrmH3td4/t/Rn1FAKxgmzYu1HNot6PV0FzX3h39GvpaD6ShpCo0S+SQi+Lnm6D64vOHs2MK0voxVGUA5mIQ9ds9wInuwvQubMJb/YRVi1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773777159; c=relaxed/relaxed;
	bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mv2cgCX3XVtGrJMHvFMRY3cw4L2jc/LaPH6vD26jBIjjk70w52Psv/5+Uj3YDPlpk3MZ0rX83nnJLgKfRlewZi73ZizSsqRJaJrjYJ5LC8d2mp+1pmqO7VbPp1Ik5cLGkFjYxEYTN+Jxl9wM4qf/Ij4fJEtvUHUYtgSPpBiXocjOE8hmWz75FxBULGFfFe6Z8e62aKzBVs8Zx0mUo+99dX6y0FZOMYb2OFhgClHu1kjyMefd5JHkWY+poTqyMdJvAzU9DC2dyWbIZQji4cDjCq3AczJkXWvU454iTMsiEyM+HDFPM0z0mvKjDjoRAmJX4E100x852oU8858KGGtENg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=uOIwF6qv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=uOIwF6qv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=twei@axiado.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fb2g95G4qz2yjw
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 06:52:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrZRvwWWd3mu5dyQDCRBV0eGsIrhTk9gYrfhpAjKIV4qqH7W/wR6/ufJl8dm8q1dF74m4sUfQlvOUgN7wYS5Qw+vXP8EGZuM6Qu4mTOxiPaNYLF60sK7wtTvwoFtMdKYSpdttDCYfxCIJGWY27h9plCxW3FC02tkVNb0eiHdl7wyW6FjGENBEQ3G7kQUuchdD73ykmnArjQXOz1MMjzxcbo3LXD3fJL2goerHnUEtzbjLSGRsMjgcYOds4cDJaY4rWxpsVBGZahDYHJmjLMoj51l7hUFBz7u62bFq+qDfFm8EdJ2ueO31hnrW4aNJRY69Se/QCdG0RNV3ute5gHOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=tpzwxM5nLCHD2grD4GXdJ5FXa4Ku5lIi/yWtUX5iVzLU9XrVbmdv8Ysw+HjpxW5Fv8GDhZgkbF14uZNulYKiEbPpBjK8s93IO4xk9GEWEjHMrdmycuSEeRkT0boggimtERUssU45SX9Tx89sYW9b7kFvIxA9xD9xi6ZfpXKmauqjQ9wDvXdkflTG2hdHjvYHy/ShLIe76nhWzT/F5GfNN/e90rrcGAKtRhCQBJG8zmrZCdiK/MTEEv9xukM+shSg9TKipFcbW86/DHA3noDflkXnuV8B37nnui1UNPM/w3A2oGlGY8AsVCyDFXl9m7LlhnzRbjnxWK2LEq4XXXo/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=uOIwF6qvKjXsjqy19qsCsmojAMEANZmQypBi6ogfveVlZmRH+TJRiKGzOugO2DxYyu+DjE+4kdHjHWxkgB/bc0uTWoYAULHovWiLMZHw2bOc3BTi/Pl4I/kaMmyQqxskRwLBg2MefhmSICggGrIErc46oDeSE0QwWQrxvul1AmJ08AQiJVHIiLggnDP7aRFUv3QWNNd/P2/B/Jp9tNn4OuwqGyZIZvwwWXSfGQmh9wUhD6Jd6AQ7f9NlW5YRN3gKGMxNvy9LPdTzG3+AwOy7FDdQToUJcf/0TeIrelJHNFjOgKsS55vNYj5Vu/rcr3+DoGHE113u7QHoxxkeE69dqg==
Received: from CH0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:610:75::27)
 by PH7PR18MB5827.namprd18.prod.outlook.com (2603:10b6:510:15d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Tue, 17 Mar
 2026 19:52:14 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::f8) by CH0PR04CA0112.outlook.office365.com
 (2603:10b6:610:75::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 19:52:12 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 9DD384186B5D;
	Tue, 17 Mar 2026 12:52:10 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Tue, 17 Mar 2026 12:52:11 -0700
Subject: [PATCH v3 4/4] arm64: dts: axiado: Add eMMC PHY node
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
Message-Id: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-4-fbf790f3f711@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=twei@axiado.com;
 h=from:subject:message-id; bh=ifJe6BWD6fxFLW7464vvxiIMU26jLX4+q7GsF1xfii8=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpubDrsBgd7jTU0mf0WTqsmEN7ZRebhG5BsaCSN
 jtiEtA3wAmJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCabmw6wAKCRB4EDBdxFrx
 12ZcDACdvDxeWa+YvZ9ZkoDutVUkl6P9A3G1iiS+eJLgdxQ779On7lSQmqP04GCkGVGw1Ym9gru
 9B08opDi3TyE4nBVLpgC0szn/nTB57rxAZZgf15B+N0rnPn57KV25sPClwsQL0LUc1ZqPZmIk/w
 XSVrBEQsP/fzpD1YbnvGY7Vlb3cwhOtkgeYis9KlVnayk9CghlpHK0SjiADV1TwfAeLda5+678Y
 w2Cukrgkb4RHHs69EGWAlq6IeA44u4OYjs/+A1SC7zvpua9Glu/krrkdKTE7QRsYxD7QedgTp5J
 Ilg97SJXTwm9Med6Zr0u17Re/X0Otq2eUqBS8F8ftqGCDfEA0pbfhE9u0U6c9YSnoP4Td9q36Zi
 U2ocnmC8+vNNXEkF+T8sL9nUe1AUPQLhaJEEYffhGruHUj/dESmH5WG2yxFs2e65yooUldBIFFB
 O1Mt80Oip9wQqzdIJNqSbbJ/aPXKhxB/5tPk2wQIFI6NKdQrczK6IY/iPzHfFVIRbMdPI=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH7PR18MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 6301bf5c-3acf-4135-865e-08de845eae97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|376014|36860700016|1800799024|7416014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	t0M/h+9p3xQ86JxX+PDB5FooKrTg05KZQOhCCWUyAKFfAIgzJCqsZaPzCRresAghTFOhzM6VlcYjoWKgxnd4Cyo1Xw8906o0SGiySDSl039nxM1xNSn1auhMBSwLo+6/YW5aXNfkXCp62LxAE0s9lH2f0Gc/n+O/nrpmbML7a3IkNkwPIkC/Ok439eRZSx+inTuOKedKr8/fLN0KSleQW7sXOmrkXnYiVwSr71QjRKz+04N9+Gql1qzdFi8j6SvulIM+r6+eOh5WBZr42V90oK8MEbCWYH5B9QoDDWjlKQhzqFk/lgmDm8xPkdCqv9ZVmWoU5m6m2L4HaV+p6kFMZasXkm+B4+MwKE6BYKyPcyHCCo6EZHmpa/h2n0NkBTDrINDWqX9CrgieR/WWVKkYrPnl5z+4mBY406pFZq8YPNswv3Wp5X9MFcYcftjtRTJHIdDexDy8rffCJK8nF0kqwYlkeumBOaz26JoWbN0ovf1V7doRJsFU7i4Y+IE42sdVPErrzpQq1vZADHGK69Fohv1JYCVbLSm4pJh6c5/sOisWWuNN2pJ3VQRVgSasm4Jil6V/B/j+xGRpDBhVF5X3An57YDWTVkHS+6tj0TNvKyYUV7uhLkWOjLuNMON9bjFG3QgUdeoyaQoC3XsqPtSznCrszG0AdHiBp977/0o/V4XoAwh+Ci9k406JAIZfGA8yA1E836Aajvkjvgm3aUoFIqZ7ryWza3RmaJgOP5+Up8/DqrOYZYzlPH88YNYtVhHbioC2oIvvU7KQIMHOaBkA6Q==
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(376014)(36860700016)(1800799024)(7416014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FAx4iUjvoUAli7arZ+WitifI1A8mcHdZGwEsi/NAE09hxZUvXJb5ma8beECNOzQcBrqWhEAcyNxtsLYdyr0bZSSTSgKYJSUqMTTWjPPGUylqdyfUx0VZFl8mwPAB8my4f4RY6SyuxG3w+HpwxD6QWPeQ6zby3jbOQVUTKeIsqUsXNeCq4uToX/8a0NBalkSHMNqUmjQSm/oJKuER6Fvlijpw9z6ksNXnyrpmqE/u0RjJwBwQxagu5RydFUp9jGhkHCv9pJ04i3LNx33JsYNJdFyVAMtp+Os0GE7hVOHUyX3+JoXfZFcxWFegAFfAKf572c4JiWnxMhe7db7nqKhOTOwUA5h2rfbn0C8s4VY4mH1G+7xl4KggOyr3hNR7PH0X3PaakIUYGelUNLlq9Mh07Dl2Rxc+Acg2/rBPw/R/hnfY2F9UbxQ+AMT3OjeB1+rU
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:52:12.2686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6301bf5c-3acf-4135-865e-08de845eae97
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5827

From: SriNavmani A <srinavmani@axiado.com>

Add the eMMC PHY device tree node to the AX3000 SoC DTSI.
AX3000 has one eMMC PHY interface.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8..ccc8088bd8258cfb666268b14a3b0716a9ca69f4 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -507,6 +507,13 @@ uart3: serial@80520800 {
 			clocks = <&refclk &refclk>;
 			status = "disabled";
 		};
+
+		emmc_phy: phy@80801c00 {
+			compatible = "axiado,ax3000-emmc-phy";
+			reg = <0x0 0x80801c00 0x0 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.34.1


