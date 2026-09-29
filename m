Return-Path: <openbmc+bounces-2666-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48273C9832A
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 07:33:35 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hv8zs6T5Pz30Vb;
	Tue, 29 Sep 2026 17:33:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790667209;
	cv=pass; b=ff7xAm8G54U0Nvw/xynW5nn5/zPsR29dh+bn/2ToXgzBc9es/Si9SovYIBDavR5o12SLjpnUuEB2ZlK5xBlC+DY8ykSPP2V9HpShK9lJfrpHWPNx/IVV3/X2QtW3TTDaMeXm4LaRPgDSLGXe+HAOpdr9bgqdPDVC/yiJ1ttBph5EfZSa3//8fuJp1MijobHotTrnSnExps95uMtETJC/faFk2xxE3Ae5PtMwfx94Ruc1WUAkq62QvZcXHIJP5087m87eFJHs3/qcYMjjVpc5VFRLziFSCxSsmnObsllPUO1DKAABjZNjDDy9wbBHfEizj6HQ0YOkCOJ/GdlvIkwXMw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790667209; c=relaxed/relaxed;
	bh=r+0zx9XWjxxofZ89jMM1wb3wMI39lG0q0vZKgjjMi2k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BrI2QWzowT688kPk//QYRRlJNDQNL9xRFz8D6Vjh/dAZ/IyUD7pHd3KwrRGxtAp2T9zCRM6gMCF84a+WH32YBi+L/EcQZ7YvXdkVOMEL0/IOmyWqWP7zZEZzzlBbE23BcwPqDqK5fFlDtr64DSenazeaaCf7bx90mKVFxHaZpCmvNMR6ppZdt7KscM5ZFm0AZ3LXxigYnRPHxif1K0EL4PwzyrgNNhcrg5W5SN970GHvwngqj/KtaSQvN3idn3d2KqqXn9k80BjDPh3nFlZNqh4V8viKGYLjRqMFuJJ9afRzoGVUA8dldha2FQlFkxJNfSo933NNd0RpcVLXAT3eSA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=4rDhffUn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=bounces+srs=sj1uc=hv@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=4rDhffUn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amdcloud.onmicrosoft.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=bounces+srs=sj1uc=hv@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hv8zr1q4Yz2xbQ
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 17:33:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrvZO1OZk02sj3u8kZAQ76NnRaUCXGwpB1fNE01RnRW7wPTZ2oxkrDJPB08HC26AjS74iowel4ezUbsDobPyL+q0teNfQdflNUfxTpjmCni2h+uR02JQA+BZg3MoxKoU0S7WsSCb0Q2JLYLCSvw9bjooLewbuY69usrgkzLMeqwzNzc8z53yHFLVH2If8moN6R+ZUiKrBu30YhCAGmm/E+PpuHeiggVXlpMxCf4NZjKV5L3Fhv7vCRmybD2iGJsiPuTdExEPC0dBnyAug0G41fDHfqKEeSZLE+/eqitlLnCFzZX2ojRN+bKDRDul7B+ksmOhC3jDJR2DqypIAFAXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+0zx9XWjxxofZ89jMM1wb3wMI39lG0q0vZKgjjMi2k=;
 b=qbaXrZ07ERDVpmbFAKyN432ubEEQWQzkyhwgUSnsJ9HEZgm6uhzidvv9ZBrbQmsbYDyAslTpRRs1mGtY+COa2R6fiuVeJ6eZfM9LE7yvRvg7k2oze0uLEze9wh+2WPXRTNK2wEMlWnSjE6GNQDXFb2EylsbG3i9XLi3q4ZVjg98jCJDsu2El1aHEnI/j0ehaR2ybo53PmLeF4XfoeTb5gRTgUkeploh1w9RZKB6IWxdFiTPna2c1mXog34lmNf/+YcsOlO85l/etD12yutZ/dNLr7QHQeHgl9UaHS2yDzWrI6uHlMR6AcDZTsL+ToFnhjuwcGp+wUTMJ2uqSwa4+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+0zx9XWjxxofZ89jMM1wb3wMI39lG0q0vZKgjjMi2k=;
 b=4rDhffUn2/iI3MPBpSaIrdUjznsQqUK3kngMIh2/t/rKtUkN5mhUXYkV60RceMdAxf5rmL6RBMpRRbuE+qPqRrywMhNv8CCiDgeI7MLDWrmYpBcr0YWDWSW2uu3LY6x5c+QwumDoyDXBGnED3o3TWq7a99IMYWuj6dm2oAcsSqxi1a4b10dqwlWNyIzHWm/8uM2tRybf5X58eWUz8oTb21G6CPzzRWPWkP5USnMI1I/jR4vhQyJigtncDzM60lxu1w2b91xrs0TrwkNVdloB3b+O+oBLila9IeR8EUQdZGqL9qiok7jDd/T360LxbYwI/lIv3fCqqZCr3RNdGrLcpg==
Received: from SJ2P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::17)
 by SJ5PPF8AECCE022.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 07:33:04 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:a03:5db:cafe::47) by SJ2P221CA0005.outlook.office365.com
 (2603:10b6:a03:5db::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.25 via Frontend Transport; Tue,
 29 Sep 2026 07:33:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 07:33:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:33:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:33:02 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 02:33:01 -0500
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH linux dev-6.18 0/2] Support RAA229639 and RAA229640
Date: Tue, 29 Sep 2026 15:29:44 +0800
Message-ID: <20260929-openbmc-add-raa229639-and-raa229640-v1-0-de693c0a6ecb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAOhou2oC/z3NQQqDMBBA0auEWXdKTGRIepXSxdSMdqCNkqAI4
 t0buujybf4/oEpRqXAzBxTZtOqcG7qLgeHFeRLU1AzOOrLRRZwXyc/PgJwSFmbnIvmInP/qLQo
 RsQ8yhuihlZYio+6/yx3emtfdJNmQrl2Ax3l+AdUvt8eFAAAA
X-Change-ID: 20260929-openbmc-add-raa229639-and-raa229640-e666a38ef893
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, Colin Huang <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790667009; l=593;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=ep4ygSpC+mwCrhkgFdw4zaeCNO6tYFoXhwRsshzctxg=;
 b=bjYD1+zv9EWGtFVEVpLBfD8SGcSgIiSxasNDklB6CU92P3/Fih8RGc1PrtRfAlbyMrv/PT6xf
 zY9uRttTof/CG3U45HMv+kfsLuO8c8O44GUyVUNZKzJPxp1251faRO5
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|SJ5PPF8AECCE022:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfee838-7b47-4f48-2139-08df1dfbe5b7
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|48200799018|82310400026|7093399015|35950700016|61400799027|16102099003|18002099003|4128699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	W8LDLhQyOsMsIjoTO3R1Y74qH68i8Cx0/aPem8LGqLCSRW7i+ClnByTpJ+O2h54yBjwVxsHV26xQFC0FxpLJjE+TJboehpZJFSEWJRlnF1pu03n42j3CMphpsrdpGdU3Bgif86aLLPHg0z3Fpr64u1c0bA4QDJfZhZGIQES0GY3VPLuTjea+bF17kKmOsXOs1OVwVNgDSFtjmbXa2OOhrhdF09BrrnGPyug2aWZY+dZzfkt1rnV2+iVBK0cIR0bZ/nu7IJ5fvJ16tDenUaxfu/9LgPgZYPgjocjA4IXgS+dTIC2YjMuSyGiEpnzgDn88f4T8P5ZsTJzxtCx7ta/cGQw2mHiGkr7qeQawlMHiC9FOPraYbaF3FRfmXOYXGamgxfq+MLJcLjGpndAzZSrpnrvN/QVnsTKW8ZW96Gm0/SG6YlsmunSxA3v466iSilbhI7fmY1u32e4uhC6ThS94ofTIMJw1VJwjeaWOUJ40rn3KJH29QXBYissWFPXw6Gli5rDMGTKKl1tIuyyGDMEtpmG6DnyMhy/7vlFlDDEhN9fsOLWW5SA7IrHNGk7h3KXjCZpICXcBXTt6Xs/PkirH8anwyDJ6o7cmVZi1U5ZesddUOP/BS/HZ1wKBTT44Qcyaesg6PjpSsgg6G2TOheo7xsGQL3IS+6FdRnmcDiABqbQINz1Ejas9WDdh4Sy34mevT6oZuf+cA53z6rSvQP8XcQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(48200799018)(82310400026)(7093399015)(35950700016)(61400799027)(16102099003)(18002099003)(4128699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VTsdcoFAEghgYe63b4I5H0RTX08ZLe5d1dNKd7vn36DZbUvcgiM+dyz0x/r7wZWDBiDGxPfI85yr+y2L/GiF5Q5oxvNySW9D1C5/itkxmbOoiVugKHP4753N/dXkJ3KjHzLQ/N463RiN5WYq+NPfrMIkjb7HK4yTkJMUrfS1bbW7gdNUXc1Lf0H9k1JFiBTzYz14tRvNRitj63G34XKCCBoiz+Kd2N3yFe66n+Ss8yrO/j2tGaq9DhmoT6htGGdba1cQjTTNOCraoQcI3ELwzRWcr2NkiOXtQP9IVmO1Q59AboGjCwp/uj/AOKHzYzJMmihDEqDxQdBkDEqgOVxfyZ2RXJzgi7g5p+Dg7z/tmldpnumMqKib2/8jydbeNubFH3D+zHe76eoDnWXc3jhQmWvBHuQx4RrdWWwUdgsEbiK6n3yd+qqjqB9UJ2tmU28O
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 07:33:03.6845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfee838-7b47-4f48-2139-08df1dfbe5b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8AECCE022

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (2):
      dt-bindings: hwmon: pmbus/isl68137: Add Renesas RAA229639 and RAA229640
      hwmon: (pmbus/isl68137) Add Renesas RAA229639 and RAA229640

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
 drivers/hwmon/pmbus/isl68137.c                                   | 6 ++++++
 2 files changed, 8 insertions(+)
---
base-commit: 35b7027e04b340039ca9acc6edc77b9b2253b358
change-id: 20260929-openbmc-add-raa229639-and-raa229640-e666a38ef893

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


