Return-Path: <openbmc+bounces-2638-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78462C982F1
	for <openbmc@archiver.kernel.org>; Tue, 22 Sep 2026 07:22:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hps4r0VNlz2yjw;
	Tue, 22 Sep 2026 17:22:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c001::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790061771;
	cv=pass; b=W+8Z5dT8SiRFWeNtnAHvZQq5CRtdzm6kzwNCHa9Gzn+WzT8ZqLcNUfwNDFE0AvDr+hJW0UXXjvB8AphXmEUY+SIX7+iVgBeldcJbUSWkkkACtzVKCtrg5Ib7YCaZOGD7Fl8InIVH6mvmG2eO2kbtWBI4/HNCgYeATxFHFEv+rnjpNjue9ECcYQ5uNKA5PCW0qUkiT5gc98PaW99K3lrObuBrxQrMh15/zAkn/PCRz0GObZ/Wya22Vcpzp7zMgu4NpEk7ghG67AGuZqybNYQRSJZ5GWRB3vXfF8FO+mbIAdjnpsbsZHnyJZx/fuGZuLK5JVU4htLGN50Nf6bxkZSeeg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790061771; c=relaxed/relaxed;
	bh=jIHUwN389n5dAvl/owQjx7+AEOM+sOb1OX03gsfjgoM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSck5jqSgw4/4JTAB906kmzJYbP1lAPkXMrp3fXhdL09lTQqziUM3wDsL0L2NQGXQXEJ5yzj/RDfySvKDQ3X7LXf3yP5I7e0yOaaA5NbeG5B5e7qUWSyzZC1nxYB9aP8mJu/B2nszr5vaFglkJqnDSQEZXlLvhmhdeDwEheM+o9EBOQt6psvzz0vnDqUEUXCxLH2EWbWmgFAuWOZyVdVlWBiyyVQQoV2D47etFL7EmzoeJfysfYtnSvHqFChDTpMlVOiSnnGL9CwEhWQa3N2nZ1Be8nbnCaOEiKdpCDtJnKDZdMJino90hTYvb9/lJa71z3HzN2wzi/QKYow9A9ODg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UQA76RpM; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UQA76RpM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jackyhuang@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hps4p4tWDz2yfy
	for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2026 17:22:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYlIpuVVbBg+zllQtbYQ6B0crhykTnsZLonavOBvZSxw4jHBmg1zhUXa4t+KLvynzXwNZf/nnzM1rsIKHmbzxAQxNu7lYL+k9MGeMO0o8sm2QFQa8lB903oU+Np76cvUNl8F0UShg1dcArC2Wmiug815zaOJ0592aNM9vPjjTff2jMBYMOysZk3sqDXV0brPUQIrq2HmuGWihA11+kKM08R2mjF/78iC89ZJHxH/rbs49CqR7+28BH+5ImYjDHd/u9lDf1QbEYmZuE7ppgGsKScWOYObRufEkllnz/lPhrKg/KAjO75jGBfgVvLSCa0cvyTLue0fmtlbNPCvKqaF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIHUwN389n5dAvl/owQjx7+AEOM+sOb1OX03gsfjgoM=;
 b=HlIhj7iCmM6SXNrsVLjZjgNqaqQWnIaeNpdmvuqsxEhkykAcuIvJ8N5S9pWUE4YZ5Hh9OW8aCYxz4OA6jRgbsZSEXwkhfZYwe4TPLbsvSntFbJBxO5ZwpSyjJx4YUPEKAKuKXQQEd0GFLsKh1z0OGhtwgTZ4fNjNVwZTf4gFEN+TzxE9Qn+Wm7PQHUbGVVd8bVKG7OQWzrl31VBZ6T34OIdR/IteTnrlytr5yRt9+6PQZgBgyZYJitzoi7QLdFJD0qxiuWCfDx6jr2NmipiJ1cgWjc1xjD7K7ubYKADoMyJkzC7ZVkBHg+UzsTzog+9ZxNudB3/+7KHIZENLw4atZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=9elements.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIHUwN389n5dAvl/owQjx7+AEOM+sOb1OX03gsfjgoM=;
 b=UQA76RpM2PCzYNHhy5nCtdbXgBhhjFSmV+PN/zIWJXDKIIGQIF7yBfiJv++ERaHwRZHA/Ox1vZdhjvi8oLqO7p5778AzY4gFUZHDtHBKeNYs2rVlow4FM7pNB+IkVSzrHqL00GN+aI99sFabWNWU6ia98N7pxSLO3TGquBWzZw4KzUa8HeN44kZ+CbkByLS5j4mMtBsGWdfLLbSQEwZCd0TAvoBP4sjIEmyshFDBBRGJDlsm+UHwG0zmhlKD30UNHzqzNXcSx4EhCfXgqkiB2N7OCIr681fD3YVL569tS0f7CoB5pwZcCerxb424BiWZErrA7MWAngocjvY9FFWmkQ==
Received: from PH8P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::25)
 by IA0PPF4D923B935.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 07:22:26 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::44) by PH8P222CA0012.outlook.office365.com
 (2603:10b6:510:2d7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 22 Sep 2026 07:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 07:22:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 00:22:06 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 00:22:04 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <tan.siewert@9elements.com>
CC: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<joel@jms.id.au>
Subject: Re: [PATCH u-boot] ARM: dts: aspeed: Add Nvidia MGX Vera C2 BMC
Date: Tue, 22 Sep 2026 16:21:41 +0900
Message-ID: <20260922072141.4008110-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7c2d3926-3d72-41cf-a47f-40225356c2d2@9elements.com>
References: <20260921085602.752144-1-jackyhuang@nvidia.com> <7c2d3926-3d72-41cf-a47f-40225356c2d2@9elements.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|IA0PPF4D923B935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5831c4b0-edc2-4474-3086-08df187a40fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/XLHecbN+BDng8AHwYs6hyltw8uurNBVRSgqJ7+BNdhaP6kAOoCUKG6JUw49CKqptiSI5R+cl1qT2dMtyha3qMeXC25pDuCi/zVSjBRZZZSoW9BidAWpgWY8oQfk3xE9P3Ol2W8/gyWOC9/hprOQ5+PJ+pY3DkV4ACvPssYrhhCpgSy1DAtPq902tHUf7AASZkHDGnkCWXzicnZ2B7XJcof7itPYGdP1u0wFoPks3QM4+zrTdofAr8f/3/d91NwpePIQVWw7HwXn9lPGozoQzdq30/9ThSJPiCFhZK0gGIPXWydvXdnTz+Ne0hGfQH3gCYXqQjkwb+i63HLvLISLKZTJlO+yjG9nYZ/a6Fx1jtyUMxOUjMzH8Kq3H62vckyF60wH2+rfWGS2Etk8bDhzDkxsnRzKVjeQXAbfy3TblTYiOU0VWAf7cWHrx8FJlf6l/l38K8ktfXx0EdUJZgMaDY5Wsd0MFM/0RlS+0l9yxTDaJzJRsHiy7UA6zbAxeZFEK5051blpyQAXpU+vj9dDCd9ypw2muWbjfLZ91IJScUjqAn0eeJNqqUzGCEp1FJSojVVtSAC6xAbqQGClsne+NgBLTIsahTAfdrUU7NkOYc6AJUqMdzqaKoW+oZ+cjiWf5YVy3DixldwdQ3FZFpl2ZBj9jWfigG6cWhh4Ifl2m0XiW3Vi31xsbIQGFY2+gSv4amBAe5ANaGHKqcx/JO/HGw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e6EK5IkVRUxfijZTXWzKXy8rxoBY32fN5IZOhXqgpMYZsw/+ztt186W/+uPFoWP50eRZwRocdFXLeMH9SOAWQQm95adEKVFrZQBVpHn6szoo+cyAP3D0SQP5xQH31+PmQd2g+w9yviPVF5za+2YKmiS6FGaB3aqVDfU4lfmXD4nEY1RnralmFEmnO+Is4c2EANBlYr93L8GCvfofYg40IpPAvqvALH6+USdUAfvjFxN4qnSXtPeJzOD2+o+GxAimDp2oo7G8ZrmJX+xCz1qyYUkaLcYkmKlQK2HDgrxSXq4c4aWhgg//N2Vep9gCnf0i5/9qX3sxXmT0piNjwDFcnWznTY1eoYx5Nsn2CGXlI5of0AOGbK1ZWpkrVXWRsGHOHvkrdcpHFZbV2nhejICAbApcTWtEsVo+cPPHsaE2LthozkjuPjXL7jGDDVEpbOA7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:22:26.3979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5831c4b0-edc2-4474-3086-08df187a40fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF4D923B935

Hi Tan,

Yes, this platform shares the same BMC module as VR-NVL, so we can
reuse the existing U-Boot device tree.

I'll send a v2 patch to add the C2 compatible to the existing
VR-NVL DTS.

Thank you for pointing this out!

Thanks,
Jacky

