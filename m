Return-Path: <openbmc+bounces-2632-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B52EC982E6
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 23:36:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpfkX6jzkz2yqx;
	Tue, 22 Sep 2026 09:36:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789971528;
	cv=pass; b=OgFvq+bVJ5hGTWNYBp5elUOrqdC9BqQsoZ0PApA+1XEwE5ugdlpUfO/mGcPtljQ5Pnjbkr78BmtJoOvJ9hM8HDVSflF1YSSVsgAian5uPM4vtT3bFciuyUC9AYEOHcBeFa8H+25hn1i8J8kFN5tLjzUvsaePcv+eKh0lYjaToCipqh/kcssY4z77EvxjjepTO0oCW8xlGLrOiYsExUP0+yPML9jylqYWAXCUhcBZn9uPKUgbtnIOkuHDgulmkvnzb7+2XhV8qVzYAJOVaAzf7v9veQtnnqjX7JySVBtXfyXRdf3HTdySZ775lW5zPDAe5a3T/qUMa2lqKgt929fcLw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789971528; c=relaxed/relaxed;
	bh=jxNhAEZBsI8QYGDaHjHTNZLN6vqOZJB3vbZOm2C7O9c=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hJK5/Dworxj0GgssInwNjpWiG+6sdvus6HwBEeNDlOkQZwxRUHnmp7hZiBuEwzAEE6Cj3840JihkzsC36lzlp8YxslbMmFY/6uMitevoAW1QwCo0IIijTD53ivGMToz1hyksaa5UD0cnwLm5iwXH1OMphFPfWQTCQa3gberZ3yBQT83QOVNvomuFO6hFu5YUPjyv4mW9igmTOzfEGWLGG1unDhWV0X/0UZfxKOFWZTNZNFLDm1s3KLdFdg7YfzHygyheLA8AAOj03w15gMB/pqvImjlAaV9zGd++zuqgVn2anIQ7/pC25x67g2C1MtuPtxu9b3EkkLgjDv6myhBbpw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=e5CLDKzd; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=bounces+srs=mbqrd=hn@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=e5CLDKzd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amdcloud.onmicrosoft.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=bounces+srs=mbqrd=hn@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpCjL6gjtz2xM9
	for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 16:18:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2YU+9GPaa2P8FX7LgXeBZ2ArX8CBcdZsRQ0iXoIM7tuQrFHEtvKZvnGmlchU13jewit55IlceybGJRrtE6XbUmG6gDwsPpFz526Hu/D7utHCQ8pSIAVwqVEnVYjoXUGtjdB1EICO004/xh19hgGj51gkRNKTI6y3OxbBZ33aCtEQDnt+KtCyC+9xXzgjrQzulfIzojsFMvjIR2TT/BuyixqFcSKirIzb0ZJ7H94/BputmEe+e6fgvW9fCspWw7qr49eCMq5zV6j9iV1e69dgW7rjk5bAZ22PcYlzV+b+LpoU9CRqdl2EL/NIEYPzPITi01aOfJh1CBLCrZXBt8tPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxNhAEZBsI8QYGDaHjHTNZLN6vqOZJB3vbZOm2C7O9c=;
 b=lxmqTCq0oB8WYKJJaXT94+/La7MYsY0Llrh7SeA8jOPJQvdiSQ7feGmDKtmTawEqNlhVwAza3qo7IhZmSOuOt2G/Rsb6WZgnQXrlS67llzHhx1O4CVyd4aADc2e+uIs3m1YhZROO0raY4+F+zl7bWd6JqFQP723UENwSAhPBOyIrReW7TIY+Qv9y9fPOUtFs7ZbArQ4hMeKNiMSQXkP3twvTD5VspM/lYUKZRm+p4xGFZv3O1l4QYNTJ1KAIwuACyWk5DV1Dz467Qdm7RFLnghWJGMC/uRNiq6NMAPJEYeJd8SsdcgI6rlAPo78cBKVXlXyut6tH2kTU7YGON2WXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxNhAEZBsI8QYGDaHjHTNZLN6vqOZJB3vbZOm2C7O9c=;
 b=e5CLDKzd5qmKhVhIO4I92Xc38EVeTAJkm859p8Yu0fcHRuhkPQOuWvm5F3FNym9YaUBZimWC/uOKLiVYJqDqLabz5bAwSFCnQ3zYra3uK5iFt6XcBY/XGl/XJnPhVxZUAcpKkU4GtDfaU4+O0NMtVfMOo1Phm9vxr8bZyetkXSDCBBZr3jjovbwMnxBGtok8yzmLE3FzHlGwQgmrw+uPsOskGnpuzousYBCTGxuZWbbdak9+suubfFM6kIrHPjXwIi6IDJ7eXhURnZoFlcRlz2X95MVTqL5Ko1CnRPdSNbN6Q11ZFL1FF6hydG9KP25AwMi0Y40wdUx3fvgVPczScg==
Received: from ROAP284CA0309.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f4::11) by
 DS8PR12MB949492.namprd12.prod.outlook.com (2603:10b6:8:449::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:18:22 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10d6:10:f4:cafe::8e) by ROAP284CA0309.outlook.office365.com
 (2603:10d6:10:f4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 06:18:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 06:18:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:18:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 01:18:18 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 01:18:16 -0500
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH linux dev-6.18 0/2] Add driver for Infineon
 TDA38740/TDA38725
Date: Mon, 21 Sep 2026 14:18:01 +0800
Message-ID: <20260921-dev-6-18-tda38740-driver-v1-0-f9fd35faf911@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABrMsGoC/x3MQQrCMBBG4auEWTuSiZpGryIuSvOrAxJloqFQe
 ndDl2/xvYUqTFHp4hYyNK36Lj1k52h6juUB1tybgg/Rn4NwRuPIkvibx0Majp6zaYNxDEkmHwG
 cBur8Y7jrvK2v9NLym91m95Lotq5/XdPIH3oAAAA=
X-Change-ID: 20260921-dev-6-18-tda38740-driver-6281c06eee57
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, Colin Huang <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789971497; l=848;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=FHHrYmA0X4bmhpnLFGeiFr+Gzwj3Y56Zya9uX8dybqM=;
 b=oGQgkshgBGscIEnEwxm/NHXf3CpD5Qmp9EfU8UBk7SMIoMVhPygoKPlPpFaio+2DpK+QdpsBH
 WJEGNe2XWPKCjjJyk5hSoeIgYPZuDw1KhZpwsScJABPiJengJ5vAyy5
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|DS8PR12MB949492:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f73d74b-4f58-42e4-903f-08df17a8217f
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35950700016|376014|61400799027|48200799018|7093399015|82310400026|4128699003|10067099003|56012099006|11063799006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KfLEXZS2mEKchBr8JLhCMjkxrtX57ByynIzFozCi8hTlaL9Nwe6Wt1ZyrR83I248uIsWxlIVwdw6U8GnHAJ33ISCt91e6afqO2pilHnDx44L2f7q4Xr4rv+S0UEWHcYwIkDyD85cU0VMGZ8z+VleFa7Iypb3+vVOE88uDd/lYJnH2aVr/2i8RE8UwySQjn6EHF7k24DiBEZ3O/0Gy06IQLLx4xVN2KyEvkPXrb/3J9/3g3h4bJeAIoqJSrGcM3Ucq9k7xvbvRs7fpM9XveLWGi07NOQy3vx62BvEkatU1SzKdAH220zaY1HC8T3ANhfNmdMCxxcQFgRkhWoeE7MZ/piO7b9NmrpKu2N0yUxLDGE2wj+mklvKAeQptMcLmJNpBodhp76rsMFgnChvb6RR6pkM9lDVG6+kQRlnrjozrAvYk51utTKBiQndM/+i/c4B8Y1x8FaqmNsw3D4OqIGnbbas9Y1fDf+NMO014BLXYMZsfEdc+nS8GyeaiOFde+dabwdeThqn/3syl06mWCOnpyI44/qoYuEXuS570L5he0SJBLEiVfldgn9Xv76B7j2nPgAB9j1cEn83bjqrv2cqTVe4D1dcDQGt+QiQmoYsSz7Xf4gaZKdByLWd+OJxG7ppvIclbg3+SQG1DTk67/1MiFXXJ6SBoc9nZ4Y7LtQB/Sc7M1yYgupeXnA6tQkMZudqdnvIBHQhLlWCbX6tu5rLeg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(376014)(61400799027)(48200799018)(7093399015)(82310400026)(4128699003)(10067099003)(56012099006)(11063799006)(16102099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7COEcPkIXRiNywuwT0QpjUqvwBUar4LBH6vEgBHHe1Nj61PgneHQVW0heLiaozUUEYgxZIlHZ9RjHSXy8Kyr5mwxZfal2rjilcVk9p3HItsQF0VrV1YQJO3T19SgpgW0JmN2CB+KQIsBAsK6+DQ7KJmwOCHuidWNcC8P23Tbh9FiZ/OQtXslD+znaaxGi8KAOr2KWCwCocAsbhPX2GWMS+H9mbMSnP4RygOG0Y0CacuVpLE35LvByQFGf96T2K2LyihLMXpdYWZ2M/MV1puiSSuqgiexB8SOS4cFBLfaXM4sHnqpS/g+Cf2KPMvpxKmfn4s6Zkm5hzLSI8hBc+vly5QYoALsFRsroQurV3efuDyKnP3pzbKn3Wdd1ClPlruPLmbvdQTd0CmgFaJFIv+O6KNSv48w/QOJHPtdATi40+TZlnk0EjWpRs+fu4bgZav4
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:18:19.2504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f73d74b-4f58-42e4-903f-08df17a8217f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB949492

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (2):
      dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725
      hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 55 ++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 Documentation/hwmon/tda38740.rst                   | 65 ++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/tda38740.c                     | 64 +++++++++++++++++++++
 6 files changed, 195 insertions(+)
---
base-commit: 3251283a15fe04e03381eac149843d839adf2c75
change-id: 20260921-dev-6-18-tda38740-driver-6281c06eee57

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


