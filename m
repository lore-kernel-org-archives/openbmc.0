Return-Path: <openbmc+bounces-1998-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3A4CD5BD0
	for <openbmc@archiver.kernel.org>; Tue, 26 May 2026 03:11:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gPd772s1Zz2y8t;
	Tue, 26 May 2026 13:10:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c105::1"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779765059;
	cv=fail; b=DhpD1qDhG6/5fDWzd+3SByKLAQTs3Noac10LKODI0z2JC5dJu2x+fvd6liEme8TCDPQGQzcOdramvrSLShBYnTUjcmxhSS5QvXxMATcxaETMPL55Rw+1sXq+Q7gEyG+MaNYFlqsjJyryWCDR8oCzwxM8V2u5GWHR5nhP8aZ+lEiwt34wCDn9sSPLtUszi17+rJT3qajj+iUIXnkc4lB4yzPcF+PO2ir5o/WCKlAFtLaGSzPYIOaGxTx8p39PfTTiDIYmr4QjG+PskoxplsDlkKnNquL2U3sIIMzKzX3otQhHd2AU8mrOYZYpQGk2k+LumJZ65F9Bm9wQ5e2k+W27vA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779765059; c=relaxed/relaxed;
	bh=FCrZ0vT8GEHGFev6/3uA3WHQi7DyyRS7uwzK/HWoWGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJ9FH+SY/eFDfOwub4cTipWxm+z+mfMEBbKwVQqkfVOJwKjqIsTMWSHKX23QZiDnjkKVeiOSnRiZZQ0tR5XA9tGNaxrIV2qG6JQfoXUE422ViIig60J21yyJgQwS9BR5i1Pv2tVxvMbLBJbkj3bWa9ZEkLAWIH4yQ9vAwmilHugcxQvUmalhE9m4bCOEi+TgRBj2lyINkGmx7LVoy4OxLhawyvtK0JDrEubeCs/C3zp8xpOgzpZhVrdkN2/PI+HIX9DJCvatzh8+PCZEU5HD2otsN9FwuQEOLzcg9lKHRoY7di49qd5S2TSqpk9u/2sNr/5io97pr05AR3Jnzb9xJw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FRYmc9b+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FRYmc9b+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::1; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gPd753tQ4z2xHK
	for <openbmc@lists.ozlabs.org>; Tue, 26 May 2026 13:10:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RV1frr+/GY8FBYfvX2adqGpUu9arwOgKKnBXs6F7LWtGSCXeMiOHTqSJb/oAgfEUbE1Tit/fE9ETM39DZ24UlJsMTrQzG/mDUqIwv4CjDGvsz1F7dLjiUnVfb4ffz9l5lrPCCiwBW8Yu7/GbxUspriL86uJv+fsr/BPd3VGSDpkPhUCXavUoNFY3hAjeX22SFih56VFx0z8GEYoYqPwc0Ke/Naw0ILpOJeXPfHIe23G8ZwyLYI9VNHjJFo6HUiiu5X2MbpJpfkEL8PCivbXvJ1R2Q7szM/Y/rJ8bspIMKAkrZPbtPjEM32DwKNGzAbd+232/0knkK/M+NiulVVV6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCrZ0vT8GEHGFev6/3uA3WHQi7DyyRS7uwzK/HWoWGU=;
 b=K5/2z7rOGrSA7Rz0IonNwLKYm59rW3k00H17z/zHBtvAnwX3lcka0Y32B4YRYFY3XJw3OzyTxnzdAiAa0H0/jRkiEbVorskXQ6eb0rHpwTO4b6MmIs/Be1l9Ugd4U6yNUgvHCntja1SOUmPt6FK6lBCBPPRUrVS/cNOjmGjGKL2gufSR95j0fpSPmDbwzdIk10KLl4Vg9bTkcSFJqMJ/np5TCqvF5Cq1Se8uGH2HJ6e2SCj9m0GtjwwXJ14ziAXjEk+e0dReff9rypuSbrGIsXCPFQSy6OH+PshSZ35U6nKe1TMPS6TzikiHEZqZxSmWWPFjwxBHuXlZu/rytURe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCrZ0vT8GEHGFev6/3uA3WHQi7DyyRS7uwzK/HWoWGU=;
 b=FRYmc9b+L/cA2QExQWfLocwdlveJoLaGpaAfRgqGgrncX0mN3tDRRqevcIlnvUFac/7ZkFi3aB0nxZRaImfQhlp29AMiMoQ+MGdcsA4im/iYED2sPiOuvdidlYbsdl8pZshR52SRxSb0HyFKwSu1jmFyLz3dgehaQkmMN1exKrxPxf9Bw5nZHuM0uSkUnrDqT/1FyLOCoopkuC5vC9Gd1mD068J1B+bQSRexXCuTaYd61dEzMXgmG+js32kwQV7HaF7tf/qVO2Z9OxCrsFHSBLiNnyJwIs3MKcWW9rGg8cNEyMnxEQ8PKGEsvZSpDV4aZStbSb4fLp1Zg9FcnlVmfg==
Received: from MN2PR06CA0030.namprd06.prod.outlook.com (2603:10b6:208:23d::35)
 by SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 03:10:31 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::7) by MN2PR06CA0030.outlook.office365.com
 (2603:10b6:208:23d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 03:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 03:10:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 20:10:14 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 20:10:12 -0700
From: Ender Hsieh <andhsieh@nvidia.com>
To: <anirudhsriniv@gmail.com>
CC: <andrew@codeconstruct.com.au>, <chiawei_wang@aspeedtech.com>,
	<joel@jms.id.au>, <molberding@nvidia.com>, <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH u-boot v2] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
Date: Tue, 26 May 2026 12:09:35 +0900
Message-ID: <20260526030935.3956976-1-andhsieh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJ13v3QewF4YodTyXAN3aLA2xd=QR9y=E0Uj78tC6zz30fdNGA@mail.gmail.com>
References: <CAJ13v3QewF4YodTyXAN3aLA2xd=QR9y=E0Uj78tC6zz30fdNGA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SA1PR12MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc3863c-6201-48a0-18ca-08debad45899
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
 4F5GjmoTc3G1H3EHTppX1piMzc1u5Yqd0zFK4VxYWF3ISbJ+dIDEohvbr0T8FxYoVBFMoIAjnyRSRnYjg/bgkd2M3SrRp3x8YIl8z+k5UCEYrjNSbe/bkF2uqNCOmO0HtSK7RIxo4jfS53YF4+uhVQ/sXtQGzJdk5/ooBJh5YFL3iRHq34kAXg3sGhlr/CzxkKncxUaSpGXCbxAGQZiliFVxT1Kwe0kTnfN09471tb5NTjciaVbf39BpBcbEW+TKVea9SghgINaOZ2PlrUYYU08//uK2Ve6ddbisBOeTaxteBHdzUohiGl9wmzIzp9x2sFOBEyuBRiupd+0AWb6ZzZmlbSTSNIDJJ1yvgt7UGde579PybJeMD3XrvA1KmNPgKbG3DirSBugSj9dTZ4V3n5qhyB87D75uYvVPQy2btkqXqCnzAR1YLz56W1eC2kKpgEmVOGJMF1TYqDfoh5e4WfrnqvlBLB2/mG25IB4tadaJe+vBL5vmOLwo27MMW74z8+A+zEfHTlTPomt8RrBBA12RjVlpuP5uNEoTL4rUP5A7giPaWbn3Nxp5cUcSqdoIWBmAg6HBp5D8pXwWSCV0UgBXZVZWxJoIrTZT2wMEt/ZzqqzwIYm/PUKuzgABZnucUiv4FZHRbLyFe3w/Fa35wygLiaqNNjhCBJ4+RC2ZXFPpeXGwQT7VJDPtxRKvbFB95ITLTgLjI3XSAj3DrnTKzgSmnqeo8QPbW1bsmzTQbZc=
X-Forefront-Antispam-Report:
 CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 72ydGKM5TddAZMazLHI+hKUMuqvtPFaUFMDokQzJTWtaOXDSOKEGDhnb51jJt7b9d+MpHUZ9a/kqHVrEId8z7adkbNGdzkL0cbnE74xAsGjbF9++chL4IvWAlT5NZ89MT1uKYY/S+JwPU4A4pPP0SEw4s/+5NiqbAx01aQIXMLfHaQ7+XrwePNTGNXLXU44Ta99pjJ+rnCZ3TTKKvcZMjDuMuEHCPnYjceB1byT2xj31f8qJFaFgDo/C/S25fRy6iOtWq4oyBiCMGYFwRXDYcl7y1Po8Vzs9ld7yzQStHqfHKJQ6Vj1HeDPlGMxpOoLDOBF+T/jtRh9kw5/D0aorp9P6opILhW4GAL29JKfUJlx0c+S1ktJy4cbu2js2CqA8AAW33YZf4Jzjank5gZe4uQi9fSZrHVqAd0moCroTxWTMsDq7GI1g7Jz0OYxvhK5h
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 03:10:31.3667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc3863c-6201-48a0-18ca-08debad45899
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246

> I think that the u-boot implementation [1] uses a default value for=0D
> the clk delay if it doesn't find a clk-delay node in the DT.=0D
=0D
You're correct =E2=80=94 I verified this earlier in QEMU testing: when I=0D
dropped the &scu mac0-clk-delay block in my MSX4 patch, U-Boot still=0D
writes hardcoded defaults to the SCU register.=0D
=0D
> I looked through Ender's efforts and it seems surprising that it=0D
> works for their board. Maybe the board design is different in some=0D
> manner there?=0D
=0D
Yes =E2=80=94 likely a PCB layout / PHY tolerance coincidence rather than b=
y=0D
design. The hardcoded defaults combined with PHY internal delay=0D
happen to land within 1Gbps tolerance on the MSX4 board.=0D
=0D
Happy to test your v3 on alon8, to verify the explicit defaults =0D
restore the same behaviour.=0D
=0D
Thanks,=0D
Ender=0D

