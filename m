Return-Path: <openbmc+bounces-2656-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F69C9833E
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2026 08:01:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4htYfC5mwGz30Wd;
	Mon, 28 Sep 2026 18:01:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::713" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790582466;
	cv=pass; b=WIpLyryH3nxUqVK/aN9dDenUnYdb9DnTMV5HhWNd9J0mXTD0AVH7HnZs3RuhS54um/IfKiBlBXqk8n4WQ7yCu8Jf/Cow/ps3MFEiTZMcZW89jrENV/1iHKWPYOYy1gCoVv7vOZu0a2VlYQEdINdczDYubVAGn/oM6ueAp91rl6MP6QODRyaCCSTrINtWzldVtI8I0spda2DuwY2bkvcN0Vi8lp8ZN9jhbm81iAHrNxORlvSI8OcrNqYuYqeHNcb1TLxpbt0mI4ymZDmAfSld8Tqcqe3bdUD4M/GjdDQbTeFg1MCHLgSy3UiVwLNYdGKNd+FHkCEphU3u1j6ddgKGfg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790582466; c=relaxed/relaxed;
	bh=eliiCfz7jA1y3//f0Mcd0ap9PofRfqXBxftJ61Z8wlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NzBAsrdrOeB7pxxGmyGfBi6T9/gVHs3ndyRAHHCjeXv0nTi+vlq2gekk45PtY+GoXdIrYCxKPBgwwM/OxkTqbCuyrcc09Y99bB+RLEuLds36RMQbDw43UfR7itsdiU5kLpe3p52haCE9TmFFcDiQPSsaaGX16DR4wE2rWjpgAlqvt3nUFVXUZ7UPKQ7k2fIp8jz8llpBbIb1D4ggrgN+3xDG8ydZtptxhmTDybkvgtlmoxw+k79610xEBoEh/gozD8ao+TxLJ5Vds3/kODfNENDHGF+adWuXNfEzHxmv8TrdEjhprMe8etvdFwU43n/m5Hardho/nM1u5w4fHVMDPQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4440:2::713; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4440:2::713; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on20713.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4htYf93RJJz30Vr
	for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2026 18:01:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYVHTinByLqGjWmqXsGJWAQkrPtHwSciwY6253LmNvOXx2wbHdH/KuZN4cv0h9qqKt4mTxyPO6ZQpJ1Fgs1nlK9R5keYxY1MMc4ZSgBuenLZG0cKXdxUwtevewfcdGRuKZOcIq8lCIvlwNlXUnrQXE0VM2jjTptO+4MhAj4RbdPgtppdCfLZ/6DB0mQiBZMS8LIJjM+97ru2mGrNRRifR2j9IVkTsFCW+fCQ52nCD3evgfvifwZdUKkJIODR5erIlLtPR0Oq8agLyugWzEJ4YRzupqgycKlXLDccKBNCsDIfVbhzRDK+z/BEq1i0I3NS5FHngFrR+PADd+8ZJhPIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eliiCfz7jA1y3//f0Mcd0ap9PofRfqXBxftJ61Z8wlI=;
 b=Ix8OXMXq4rVGIwsNpHgBurKX6LRc5qHfpvU8DtoU59WAxztylR6DRtVDYOQBQSEoOcFQwNmRKjzFla6jRVpHlYYsKLQNoRIipoLt92PMxq9ds9hVQkB5kEYOKaDRHOz/h4mP0y8jS2qPCLADNi77iu4tieuUEPKYDwpXi5uHZAtciZP3SR+llRpG2FtgA1h+0+7xJoh1wHv8m+ja+5ZkJ6oYlnThnK7+ToQvNrTtyfzXwWyuvEGax6jB0xLYu/83KwlwOkGzbUCHVq3oyKcVGQB1VHGGhmLZqIhO1UXtJ/i20YfR/lfykTO8t/ZKB70MXEHcTF9ZqyJLN3HTPtnOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:00:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:00:40 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 5/6] hwmon: (peci/cputemp) Add support for Granite Rapids (GNR)
Date: Mon, 28 Sep 2026 00:59:55 -0700
Message-Id: <20260928075956.62298-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
References: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ddfdc1d-cd20-4448-b3cd-08df1d3696c5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|366016|376014|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1hTyHLU8bm9bMePMek7DwOqTC7zdvKdS+ZxmfI/pf9T1UfES934byq1rfNr/OBL3ErI2f7R+3etUnmkRBYDwtjUcGJw5tayYzyghgA/8N/uw5tPr3CELyJ4d7IJaP/jh66yF0x3ueUw3kqgOmVT7NruD0gCd03vwUTEGYF0+YUcN7YQta4whF4S0KpqjeXzQ2LVSUE04aoEVGWRgVDXYe1jtUnMDuqlLJJKLXekbe/nb5CD100b2+QqHw2GO9b3yGg+mgxNUysYNozEbAXfauEAyDPDnEkrYctW33TJmubJwppTzI35rrrZABQIwg7TLprkzbjliiKoGy/rT7hF09LHkoHtl0wGfN+jbJV1kug+g4U5FveZiIbsUy4Dp+owTR8U/EKu7XqNNAjji+ZL4EE7pSzE9rhfVBV5js9kFCGN7rEumGtbQzwJmBJNd9N/yc/YCBUqJGxx6mVfYuNl3JKaRHIXdtY7G1crOqS2mPiw//JOkOEmpQ/wjmrrX2doNWpoNVO3ctHIMRNxMnz7IU3dfgBDhTBexeU92z0flKaNLK2ps2cBKP0C6rQMVyuyE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(366016)(376014)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w3PheVRcaKpZ7fvEagOOHwSfkmk3rW9ibXl7uGkmsppVwcbyKvml2Db41Oyk?=
 =?us-ascii?Q?0XUqNOjdE8uxxlatwVdABmHscrUOAYt9AgkrxaHzAUzDS2DMPj6xsS7b9yJq?=
 =?us-ascii?Q?D0FbUe9op8e7idNognfu4UTWU6yR4iE2JQUZM5J8wvfPeY+4PpdFKZU2qa7g?=
 =?us-ascii?Q?r548S+ZrWT9MZmN++Ev25A97ik8TDnj8mitQTQG3lvDrcNbmrSOaIwU8v9AW?=
 =?us-ascii?Q?aSOqA7ErQplTErcHyTkXvylmFUOwvmYRrU3/wUtjS0i4UimZPcTMH2k+23gc?=
 =?us-ascii?Q?dXEVf3QEZGkg8jJCxKh+e1NBqgCkeHcMAWea+bBime8O0Pi7DRxe0r4xRfgK?=
 =?us-ascii?Q?WdGeJosULzwuyQLMAP0U8HoJdUC0dj9mIclZ52R3uuT8mVOA05jxWvELyL2q?=
 =?us-ascii?Q?R0wn7G349R4YzL0JC7h/CUWaziFSMiRSs5fMUp+xeKnMsL0R0v8uQMuLc3eU?=
 =?us-ascii?Q?vAaDiubQh0M+LI2V+fYyFEhh8omICV6NM5HNwp3xVAgxreKl0phG9Q1CeCGo?=
 =?us-ascii?Q?UXEtXevQvfgCUZNP6HhwmnXFzxEK0yXyTdku+bWKWPb4yHHg8aqrFDW1bf5V?=
 =?us-ascii?Q?N8BsJdF9H75lUAjmG/Y2H80zK7m315EIX6tkWT9ljrvCWR2/3Q3ip7f0wkQS?=
 =?us-ascii?Q?27v8OP5fMDPODyiyyf7w1Qc4iKsLp2dpomPuciCKIlbc7qwdZZiFImTK/EKW?=
 =?us-ascii?Q?MhVOPsCM3N1woufwTng0ECtD1AMyMigugfxhAFCuy/li4P2+iBAO+Ar4aPHu?=
 =?us-ascii?Q?b471o2b5fvIiFP96l7ZcBuqMn9LYSEXIwnMtA9OZQcvPsCJwOIuMovbqekFs?=
 =?us-ascii?Q?7r6EbyAP5/zS5AUzg11nI/jDutcULmP0lfn5A41bHtuga9z0IHUmpyUKCQoN?=
 =?us-ascii?Q?WwidLpd3aatlrfGeMq8KUbSEsk9/ojItQmDok6v39ema7vCQO4KAV8xvWfSy?=
 =?us-ascii?Q?cJTRcuSPhnISSRZqchFAxBF8PQVinIsI6dKu9NKnce97AiuSyfZhiWkK4zWM?=
 =?us-ascii?Q?izqqWPU0hsBya1xz0OnhXfJSPhTZHPgYtokVC11O4UEqzVfZr4ZYoMXJVRAP?=
 =?us-ascii?Q?SGAMzuVgFVfn8YSgIJWxKtGtGUqTueGudwDrEDE8fx008CRpyCLiUNuiCFSi?=
 =?us-ascii?Q?O4QCLw30INVMkzfynNuVcfQW7Eq1J1CB79bBcwkGEIbfA/LLlzUrOnA6eFPo?=
 =?us-ascii?Q?xqjlrAOq7L1E+x5hgfQuPZaVLnFFljGleTB6LnYmUdPvB7SnXG1hkr4bykuY?=
 =?us-ascii?Q?sGB5Ht5rPCdBe/2aLEbUCQ26KQUlxfXO3pLUCOMSjXNbQOVNU6x4dCA+fFH0?=
 =?us-ascii?Q?jkBj/F8Lnoo+3Dtn4Fk04PRsedFp1jFGKRmiMi6AucGuCwgkQ13yW7SQ7cUf?=
 =?us-ascii?Q?HIY6/GuEwA4Bdg8c5LHNNg3E5whSE8YrFhNpwYqw0Rp1HnXyBfwFBKOYb/DT?=
 =?us-ascii?Q?Hcy4FdkJFfnjGhZL6gDpcwJh/0xKVMF56DdjH8IVXCONHHnrNEtbfI9rvcf9?=
 =?us-ascii?Q?uayO1PebCOj6x5+R0KRAZrPPI9Vj6okGMRmrxhNPCPwnQIuulehKJQ6q0hwc?=
 =?us-ascii?Q?av5l98wiejVA614yybNlexXuhQK9B4vCVV5v/6xYxs0uygfg0sPn4ECBr6m4?=
 =?us-ascii?Q?26Y7VtCQiJG7aSUQCABSCSQZIfFjIuJpCHW85ckRh1XeDPCWZQ8pmBclHJQ7?=
 =?us-ascii?Q?IeYVRBU7C+Oqz8YNFFeNKxRYhuCCn1MCJQLBy7qab4EOB1Nn1k1a07cjhuuq?=
 =?us-ascii?Q?y6Mjap4xoHKn9CHGzvJKJPITc8AEUu/lzEukXi4tfqGlmh7AWKZ3?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddfdc1d-cd20-4448-b3cd-08df1d3696c5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:00:40.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3U0/PijFpDTbn8Ma7Ynf8ix51w27rI1OGSnAbYgFsD5R+cpJ8PDivvk/mEIVUu/rZhaTE0CUJRW+femBwAkFMcUmwdAA/yybwhx1aB3gzeEtKam0sov/mbGVFzIDvnY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.

For Granite Rapids, the resolved cores mask must be collected from each
compute core. This implementation is relatively complex. Since we do not
use the resolved cores information for these CPUs, we can explicitly
state in the driver that the core mask is not supported for this model.

Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
the thermal margin conversion function dts_ten_dot_six_to_millidegree().

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/hwmon/peci/cputemp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 457089c561b4..69c4a07b99f7 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -339,6 +339,18 @@ static int init_core_mask(struct peci_cputemp *priv)
 	u32 data;
 	int ret;
 
+	/*
+	 * For Granite Rapids, the resolved cores mask is relatively complex to implement.
+	 * Since we do not use the resolved cores information for this CPU, the driver
+	 * explicitly does not support the core mask for this model.
+	 */
+	if (!reg) {
+		dev_dbg(priv->dev,
+			"resolved cores scan is not supported on vendor-family-model 0x%x\n",
+			peci_dev->info.x86_vfm);
+		return -EOPNOTSUPP;
+	}
+
 	/* Get the RESOLVED_CORES register value */
 	switch (peci_dev->info.x86_vfm) {
 	case INTEL_ICELAKE_X:
@@ -543,6 +555,11 @@ static const struct cpu_info cpu_emr = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_gnr = {
+	.min_peci_revision = 0x42,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -576,6 +593,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.emr",
 		.driver_data = (kernel_ulong_t)&cpu_emr,
 	},
+	{
+		.name = "peci_cpu.cputemp.gnr",
+		.driver_data = (kernel_ulong_t)&cpu_gnr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
-- 
2.25.1


