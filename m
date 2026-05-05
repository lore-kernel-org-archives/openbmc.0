Return-Path: <openbmc+bounces-1893-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0895FF8855
	for <openbmc@archiver.kernel.org>; Wed,  6 May 2026 00:04:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g9FwT69KLz2yN8;
	Wed, 06 May 2026 10:03:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777963004;
	cv=pass; b=Ub6hZGkUaDpPo0yC/ltHdSS377RG9MlXfD7KmUmp1ZQxHpuWFNbK7ZJiPdA5Q/Nl1JcfEnYHF+u/fhm8+kTFC+CdheCVLgO3AMPyCsvctGEkm3u34xirzXDFKSM/VzxQHxIje0UqsV67Blh8G4zxs1+qo56rmUXK7ISecm9dQsIX3A3+3FMkgg9tWDAZGJPKLEze3Sp75I0IfSfCjWuMC4dDcxfrZqygTD15ffqQp9f2Z5ZxynpzPLpsbfTkqm9XpyrrmvcLhZgOIfzbGDWVYAI3yktOhLpY29xL4aE/ELgp6wM8AUY8K4TSXCNytUGMlBs8hzZVvexS3Nfgzs8AqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777963004; c=relaxed/relaxed;
	bh=KfSxdNYmNgkg+5z0UqbdnOVxDBUxyFjYlgRWmS/GfNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFJmO29Ux7WgTpOiAU7qcOgGHXAOq4ci7Lj5WzNbMvjoLusxjoYmnTJesmE862pPEfgeunqLx+F2OUuECrj1ZBfiIapw7fCZeQPS2hAouT1ZdR6MFu/woyB3xy6NaPFUGdS2lTbd3b/2B2/nVCIaTj8oHnYITRdvWnxy9tDG2YdzBAFm7M17ZmyTzRikkBxjqsgs34thEn4fm1ympCmx3w6qdoPXYaSbbxDTn5NUTHCqTmdc+128lYZ9SYPBOSn2yl7HcryqkqaReyH1ZypIKhhxZ8BxqJ4BVCbcwXtxpZOUD7KafMjT4pDhzxNzj+kv+qXUL/zb/08iP043p/tXpA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=Q/wh2bEZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=Q/wh2bEZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g8phB3Cg5z2xGc
	for <openbmc@lists.ozlabs.org>; Tue, 05 May 2026 16:36:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1f/NW/djUWu5/31Mjbv8A2oX348YvbT/yF0scGKoPqfAZXpw+pcJFxD/nuFrR7CQCvqkiGVLBFpHlwuuhmNBlaLoajxBiMD1efQd09Hcm1M9Og21kxqa4HhuRWY5ZppAEUAkE7U+k2Kf1szAoAuShs8hIB8haZMTf7tufv2FUMRP3KH9YHLZoHM+FJTr5Q4Pp/tEXJOWJ6mLU/73ItGzj+3t1WJ1dNCBCNCya/D38Z7ZlLzg+QZF7nmyZupd93p43s4gCTcE2uNS4Nk60tw1pUFgr0r3I7kb5OddospdBMbEQKKUK6zPfE2AIpIN3nXRa00Uyn6U7FHZt2yab/gCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfSxdNYmNgkg+5z0UqbdnOVxDBUxyFjYlgRWmS/GfNw=;
 b=REWYFJfiYzDShRsGi0lHiSzxWgBTZ82PSrS+M3sBQ/3WefnafZmL+UTYkpYzh8pUwosv9C8iVjzPJAA8t5QVlpULBQitKr4dQ7z4J5K9RohpNTw3WyGaxz3TaB0eE0Qr+9O/Og/qDErf+AZoPGTb5m5FSyGriaJptTj3v0a2LTxmE6kNnXTalqWWPj4lQcykTxAKpRWA6qa+Bh5lG5uoNzj9Zwsm521supfjhtbXFG0ekx0CujK9rZxIrmwCvWYkcHBzcA9MvloHe+hu7zEuFxbuG/OZuBXpNHz4SLADWCCZvpGxRRVq7DUyLlC8Xp9+RTfae5w3t8B8Pm3FBMelkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfSxdNYmNgkg+5z0UqbdnOVxDBUxyFjYlgRWmS/GfNw=;
 b=Q/wh2bEZU8xv+4j+Hyhc0EOTv5fewzR7DI9ZwDKcP+yu6TNTUq4LGO5hQLt7tAiSIaA7DDsRXgFgZ/ce0J+Qo2r2rky5drRpd2C98XflG2cshjGTWSuOwemBIshcfgw/LOBIQYo/2lqeVa0YgphSUwO5hcEHbVZnrqfRB9NZqB5YC9vpiFVVKHWKEAiJKQKe6M8OaxaK2BgBEN8hhRBfqUeir00pBbSFmIuYYdfQG7ttl8vdFj0DzmaM/QkqZ1I7cMVH6kd2lMZZbdoSQmRjAfbBRXu38DG9J2J3GdCP5PM/KcIebxvw0gg4e7R6vYB4jCLY4DNSkSRONLW0lqGZ4g==
Received: from BN1PR13CA0018.namprd13.prod.outlook.com (2603:10b6:408:e2::23)
 by BL4PR18MB6406.namprd18.prod.outlook.com (2603:10b6:208:5a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 5 May
 2026 06:36:15 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::22) by BN1PR13CA0018.outlook.office365.com
 (2603:10b6:408:e2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Tue,
 5 May 2026 06:36:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 06:36:15 +0000
Received: from [127.0.0.1] (vm-swbuild01.axiadoRD [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id C2F9F4186B5B;
	Mon,  4 May 2026 23:34:17 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Mon, 04 May 2026 23:26:44 -0700
Subject: [PATCH 2/2] i2c: cadence: Add support for Axiado AX3000
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
Message-Id: <20260504-axiado-ax3000-cadence-i2c-support-v1-2-97ed2fdc0b7b@axiado.com>
References: <20260504-axiado-ax3000-cadence-i2c-support-v1-0-97ed2fdc0b7b@axiado.com>
In-Reply-To: <20260504-axiado-ax3000-cadence-i2c-support-v1-0-97ed2fdc0b7b@axiado.com>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=syang@axiado.com;
 h=from:subject:message-id; bh=MK3OswMhVZmw/T7fK7dq9GX/ghxdskdK82VTH194LCI=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyf/fd+yrP4GTd2Ci0QjQu9ad/f4vL1OV+N3gTR2q628
 tM8Bs87SlkYxDgYZMUUWb7qfMs/mat9r3PvylKYOaxMIEMYuDgFYCKtmxkZbsnvu7wk2vXhvz8H
 NN1cHumXNTpf0lwlvlx1prTmZ5HwvQz/Y92Na1Lv63zwXvSvcvW/8qa55XM0l/7aNfWk9ec7a9a
 8YAYA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|BL4PR18MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c9320a-b336-417a-ca51-08deaa709b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|7416014|34020700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nstgBGbnYgGpZhthaTFsnoDmKH3UTROVRKUBj1c+g9/1QBhlJ+HOqPpMvOLyMsgdhGn7Glee/qFpjNFN+VfvkOTqvDX55FsfyglmMisT+WUi4esRXRckVHGaHyT+qjTIZ1lftp2iFtF3ePPUtqEFIygLre3vCIJaqt/yvW36P0TisIlWgKJXccf8B+t7DdEP0IFJFH0tJ9f/9RjMVBFDCnI2sbgec6CEOLeS0Yv4Ow51Txq7+C0PD4N4DrMCw+lKxohkzERsJe+g2dT6eqbTi/gLgUoZLXX9Ff5xOaKiHH7cV+6MpZSuxQVirVLGKzNnkiavRRKnDZahZQvGe9WUscXJkbTPFUPF4syO84FQkJJdZSLOkSMKROSYolG+VAx36j3a5wa4/RIL23rTyu3yNAORQaKmtk+XrFOrf6ABVOJlD2yZV6SEuDQ06BKxB6L+VRPe6WvTphU1RTxhaOLjmESTkSmLX9y7hibxI4CDMqxkeAGjw/GJRNR9xkzNyl155U6M8RHIjBUDN2xpUQ4A7bGQAm6GdUCcJMbCjabaenxfFRYVW6UFk4eQt2vtsQBj5OcpRbLEHI2q93etTW6g4+q8DBFy94ORvbea/kycTGNcgqSfLcQSjS+H+Aw63P97jo02o5/B4MPQdIvFQHDai+pA3wcl+mQX6Ovq8JTj3vFiztGXw/9fFma0VCfUaLAzdzF5TNpaqLQMKQqS+c2nREHlSszvxhHICrO2WWB9Y/Y=
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(7416014)(34020700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	twioRanEHxaeqXArftVSeTpqipyN//tyIn0AzD0QyjI8ty1APn6ZO2figXJewiaD7Vk3ceJVgxROrfQSHVx9lEo4mhdTPYLa/1BIJpEb3xT2c5PwBjVNZCu2b2KtucdHQ8DokvHC84g3mmAdtlsWvJLrs0/gAfPrFgvhmhlvyJhXYUs8munX9sFHqnvcu1iRmTQalDYFO9UoeBY7KpzzlRDbiwQvwWvcMUFEu5gRIcIfL7IMNZiq3tlbd7K3Q9grjPy+m4NytZkGx+dDKof0w1CFfofZ7KSeFgJlPLxhx+i+2LUcngZkYETJK4KBIlqeysEM6NoVS0alAilUOAl7TioCUHMYucDRZnXgz7lJ4cLgSVms9Nm85wNNJ5MDNT7IoOdnl3ysk9BsNPW15I9ofhphV3NkWTTUa7S1NkXfMxvpBQdZzv7DWu0wbN0IDKZ3
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 06:36:15.5279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c9320a-b336-417a-ca51-08deaa709b9c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR18MB6406

The Axiado AX3000 SoC integrates a Cadence I2C controller
that supports SMBus Quick commands.

Introduce the "axiado,ax3000-i2c" compatible string and
add a new quirk CDNS_I2C_QUIRK_SMBUS_QUICK to enable
this functionality. This allows the controller to support
I2C_FUNC_SMBUS_QUICK, enabling features such as bus scanning
via quick write commands.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 drivers/i2c/busses/i2c-cadence.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 0fb728ade92e..8079c045f936 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -128,6 +128,7 @@
 #define CDNS_I2C_TIMEOUT_MAX	0xFF
 
 #define CDNS_I2C_BROKEN_HOLD_BIT	BIT(0)
+#define CDNS_I2C_QUIRKS_ENABLE_SMBUS_QUICK_CFG BIT(1)
 #define CDNS_I2C_POLL_US	100000
 #define CDNS_I2C_POLL_US_ATOMIC	10
 #define CDNS_I2C_TIMEOUT_US	500000
@@ -1175,10 +1176,14 @@ static int cdns_i2c_master_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg
  */
 static u32 cdns_i2c_func(struct i2c_adapter *adap)
 {
+	struct cdns_i2c *id = adap->algo_data;
 	u32 func = I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
 			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
 			I2C_FUNC_SMBUS_BLOCK_DATA;
 
+	if (id->quirks & CDNS_I2C_QUIRKS_ENABLE_SMBUS_QUICK_CFG)
+		func |= I2C_FUNC_SMBUS_QUICK;
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	func |= I2C_FUNC_SLAVE;
 #endif
@@ -1442,9 +1447,14 @@ static const struct cdns_platform_data r1p10_i2c_def = {
 	.quirks = CDNS_I2C_BROKEN_HOLD_BIT,
 };
 
+static const struct cdns_platform_data ax3000_i2c_def = {
+	.quirks = CDNS_I2C_QUIRKS_ENABLE_SMBUS_QUICK_CFG,
+};
+
 static const struct of_device_id cdns_i2c_of_match[] = {
 	{ .compatible = "cdns,i2c-r1p10", .data = &r1p10_i2c_def },
 	{ .compatible = "cdns,i2c-r1p14",},
+	{ .compatible = "axiado,ax3000-i2c", .data = &ax3000_i2c_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, cdns_i2c_of_match);

-- 
2.34.1


