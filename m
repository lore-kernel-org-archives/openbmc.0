Return-Path: <openbmc+bounces-2015-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF1CCD6E60
	for <openbmc@archiver.kernel.org>; Mon,  1 Jun 2026 08:50:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gTSMp6mZzz2yrt;
	Mon, 01 Jun 2026 18:50:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780303814;
	cv=pass; b=FXCd6yOOlU+1xTTQlO3v6pZIFQGDGRTOpDIqA46fwdbzNyYjhOHZm3B4ms0PRRGxMgIUVtCgTKEBcLwPWjtZ55U4+x6F5+pOwcwWfTiq8w9GP7m8wvBZLziVKBIFd9O/2+JCI2vJie6zVkH5ziqxZEjFuYA2FfSmD7nuflrNvOyrX/mnAeXZvKA2R7SdAO6QMxWBJIPPmtK0luiRO8SoYAQIGzCkmx1E/ays1uDm7lxYh12DVRjsI1Rqqv3dbaIgWnT+9bOseP6xbg/ncamiLSN1NqMCfd9/ItQ08XTCErRs35AXR+vYkB/8m042sbjL+/WKqPHXChtOu9WJC/LSkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780303814; c=relaxed/relaxed;
	bh=AUl/nKAMZ2jAc28NBImBFUXutJpnd8w0G3XO5c/07XE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QfeiIPlTjOLAZgfBse5B3UC+2vKz6F0n6jyOA4E+38+RNhCJpSKlqdU/gv934tSH602Q7flSU2XjEHs2sMywXwdC8U0I4AzXm8doedjUxRUgzWPQnt8Y/Zd7OVRuJgbDViK4DQOJpkpjA/1vJZLqn/UIxqQZqwsUb3AK5NOVq9ZSp3R/9qFR0WTzzEjoiazFjOb4O5sjTvAgLcQrDJ/C49MwuGMIp9dJj6ylbXYM3Mbl+rj/226Jbu7Mo5IF2FwErbcECu0DkFojH0z0JWfaXy3EkWPxpoNmYbOVWTvVDN69ebh0VMXahSuEiphdyJZVpZ9l5aPfygkinn/jjjZhUA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XTBzwjNv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XTBzwjNv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=andhsieh@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gTSMm5yzQz2xmV
	for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 18:50:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxpLE3SVLKI9VS+/5rCwxMlFKx5SHTU2T0Pd5aajKQzf8nGmBzr7AvwKu79wPjrn+4NlkgTWHE6gr5uAI/zwTaPEtB7Sb3dQLSxh/3CA9kj9NMawURMnrDzI9PD59X7JtzOmXKQahF1hWiJHH743g7hNs1dIFEeOATDC4TdQg2u2O4aV1v4AWCvS8Q7SQR5HiWNJT5aRIzNJRyOfwaBqaMvHO19tZj43WVUwMsSNmKoLqAYowvkz9RjYGzwAr7Po68ZT4Qtbk7uxpRBsafKz8m2QSZ2sUxZIOwQeMQW579aXtH2BAh6dcXICNvjxS+57hKcGtiG1go5gIhbNHIYMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUl/nKAMZ2jAc28NBImBFUXutJpnd8w0G3XO5c/07XE=;
 b=oLlw0BZq9ysYF6q71MRiw1NPdRwjCIuraGogKIbkuYTn0CRTprpvu9SocCtU4eL7MyqRnP63mra8WRyfTBSRyzhuDgDY1u77yhDvJRsl9xyV/MCTAB2sDvo16DLyqE0Coj7+SNrYrys2486wQ6E1bU51tvP4eZsTNW528KIcOHl+kthzm2kKIVzGxeopbd7YISvqdzhJ610WSYmmGQQJt54L8Cwz9fsyGVY4f5J2l/OCUpI8cxfYQCUE8gYRaL9NdC0BUEbA3nh/rqToFcaI8hgAKA0GK/kMY8PSryxVfCEqt3DlsoC7YCf6KvByxhhVrMGZscmZ4z0FZWLO/BnPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUl/nKAMZ2jAc28NBImBFUXutJpnd8w0G3XO5c/07XE=;
 b=XTBzwjNvvJmj+9ShrbKLxD96zv7Tqb3C3MU1XXLbrMdCtDOqOh0R3U56PKIinLEe+tbYX6Jg2Qr9BXQ3MPG2qrAPZdmSU2CzWF1GkzW14I/YvjF7rI8EABdSNGhZBBNmzAuF4UrgGf8iBOzjiagyxjDa3aToyUcbsalEtAPY62KMYt6lNystyZwovpODxkrJ8h7SzLxsSrUq75lnAnuunh8GOnYpLdoCnC3lYitq0gDRXSGWf7jtHoujHm8pk8acHHwk7z1aeHJZ3CViz3+1+6+BuZxHIAmrBOUEj8KGaYLV9945q+ZF3603LjG7/FSFvrAwzAxV6/SmFWeBtrDdng==
Received: from MN2PR06CA0001.namprd06.prod.outlook.com (2603:10b6:208:23d::6)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 1 Jun 2026
 08:49:47 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:23d:cafe::35) by MN2PR06CA0001.outlook.office365.com
 (2603:10b6:208:23d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Mon, 1
 Jun 2026 08:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Mon, 1 Jun 2026 08:49:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 01:49:31 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Jun
 2026 01:49:29 -0700
From: Ender Hsieh <andhsieh@nvidia.com>
To: <jacky_chou@aspeedtech.com>, <andrew@codeconstruct.com.au>,
	<anirudhsriniv@gmail.com>
CC: <chiawei_wang@aspeedtech.com>, <joel@jms.id.au>, <molberding@nvidia.com>,
	<openbmc@lists.ozlabs.org>
Subject: =?UTF-8?q?Re=3A=20=5BFILL=20IN=20v3=20EXACT=20SUBJECT=20=E2=80=94=20e=2Eg=2E=20=22=5BPATCH=20v3=200/N=5D=20ARM=3A=20dts=3A=20aspeed=3A=20=E2=80=A6=22=5D?=
Date: Mon, 1 Jun 2026 17:49:09 +0900
Message-ID: <20260601084909.952938-1-andhsieh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <SEYPR06MB5134993F370A949CDC3A3C3E9D162@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <SEYPR06MB5134993F370A949CDC3A3C3E9D162@SEYPR06MB5134.apcprd06.prod.outlook.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 45194ae1-75f6-4f18-01c2-08debfbabbcc
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 kQAEAbAV8W+mP+HToNrI2jmp4W+m4qDeyAvgKcgQTpiYze8wj8f4Bx8qv98H2LEKWyPkNfKunmVcIOtDb13/yZgNjKn7zbRBbmHuS9u+dfMq4SlrX6+X6GHyl31zU1C80z0gY0oMfuv73yC9JMaOMhgk2olwSpPJ9z5DjtQl7N457458afo0QTLbFJ3AIS3IUCaNfFxK2StAIDLUySKoaJl0sRXnZqKO6Bpw7sQtQP03YR1CwJfrZxunVlHF48QWh71te1GMIysUuRNwYQtY5Bs8M9FG3BBTuwwEM7PeNFBz9GhR5zrbPapVhqj8+WOM+ZeqnIe6Vhn0iwlBdcsyBMCiFr9RJQIq2M9n3ul3hnbyPbeml8AlycBa5nOitBid9JJq7+e6npXvGEv72fAApe4dt6mhe6H8syCHzQBg8DPHJ9O8+hxoH/CktXkgyiImiK9uWZ88z1W/F0s69g1JxpDFadodqo2sVzrYXSTzToZlVqqz0K9vmlPs9U6c5PyeGoC4nLxnXmQtAnA/C6EQ5yjKyRd5ISs0fjiefS36XBGiYhvwBfRI9YCiMMGd/WkxmP539UJ1IZoezhxNN/XH4uSvea6Tb8O6Vp0MPcIdiE3eYn9fdxlIKQjfv5Z3yyM74GGwaSeB3HAAzkIMXVntNN5ejSDkg39Qg1TbINsVpFl74Z0WN6IYMfTSRPKCxOH/5JORoi+CuOnfc0ofT9EPmNh3HuVWsyxy9QQjEMsPKRs=
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 0jKTx4mfBEPNDhttYC1mK6/ystQf6LllxD/ZDabMAsGVrPV3hZpU8xBBXg00wlEqZsff0iphuBfpgoiMYJMesN0Dc+4UZojdYODfPPPHYwqEpM5iB1vzPKPgalQx46AhzFTjWhifO7IVG6JPIA2ZdwzjR7DHYqa39QFlae/X+6as6br2TBg5jLnCm7F1XzYrEDL7aZRKoIdjObRTH4qB6i3EqSPhh1+dNIyAAKK/QWfrHUJutIgs/16qBCNuVYZ2Sf0zVdUh9B2pzXLsu2EBvEpBFrv4xEZK7mHJWK5enRvCxPEF1W8z65H8q6/JrWMP3O3O+wx7XXJYL13BzVzVs2G8VyrlhPik1M1bT610Ok2YK6ZtRY8nLoRPdawRD8Tu0FrNf6hqQmTAqXCdXHnR0Jq/aWt/9lXktyxwohPgbcLt0IafpiBgoljc88rUZz+m
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:49:46.6784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45194ae1-75f6-4f18-01c2-08debfbabbcc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

> Ender, Marc: Have you had an opportunity to test this?

Yes — flashed an image with v3 applied onto our msx4 board (AST2600 +
Realtek RTL8211F PHY). It seems no problem on the msx4 platform with
this patch.

Tested-by: Ender Hsieh <andhsieh@nvidia.com>

Thanks,
Ender

