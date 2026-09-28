Return-Path: <openbmc+bounces-2657-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AACC9832F
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2026 08:01:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4htYfD33Ggz30fh;
	Mon, 28 Sep 2026 18:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::713" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790582467;
	cv=pass; b=a+qpwiEs+8DtUyiTCTYpSkVoUkjNVymzt5NKyQ8FQBjZxsSRpOpYDcXhPXjDhwMEOW0/BsgTFTYHF7VhH215WUJJIAsNoEJX7gZrW/Bszk2mRXPatd9bkdhBuGwylsZWUbOpHbyQgNlrURPUMwCXavYDrQdmdbLst+vgTud4+0FihW/93TBgHU237tN/XTzegN6ueTm8Z0o5kXYAJwELAgGur/Xbygenlz0Z2kVFVfq1IxxgXr3bKxAglNCpkLcV25U1VmUYgmHNK4ZagmY+RUgfWD1djSx2xBZiCwSdu33uo5XCPsda9Cozx8fyIVmUTuKrASGYPfPmGw9yJBLbTw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790582467; c=relaxed/relaxed;
	bh=GsZlNFElQBkfATT25y909k7hh0N7JQGguSlekbFosTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nIVNE4NjzStLfl+6p8DDW+qtqjbJqC6CvWVTMx4wSK62Hj5SM2Fhbqed0BJ2LwXuuYaTYYBxpJ5dqbYP+LZNbrN0Tny6TfIqbwFLIE+tdMhTV6HaGQNOxNfCVObL+haVPWHB2rQX6H1gt/Fustm76KnPvQgenGkvArZUpuA5Q5ZxFD9wp2N0o/1Hli2JNgnrhHrgB0n3R85BqmZ2is4zFnf3wT4tFVmabQKP3q11f8lupPWOLsu4LC25BJ6aC//1hzoy3Z1gbhKT8WKyCLiDNLepBPIZck6XyVL1dwDTH1+iCP2YVV/qWfhfMZCOJaTWaaXl6h+mi0mhAJxL1w53zg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4440:2::713; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4440:2::713; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on20713.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4htYfB6c4Zz30WQ
	for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2026 18:01:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGK9jrd0tTvFFDw8bjyx85lWD7Xn5DxrDqHfq22LnMV7gXrvGeaZKe+k1sc0B0dp+BKmQB31Te1JKWSSscPtDAhFrBzeFVEKQ9Z0d6Dek6Fz0EEUXTlCXwoU7gjn1IqJKqic1SHTp6+BDQypL0ymH4Rrom50KCrNvjslodl/rWp0dcv1y+GcDhwQhBk9A3raZm0TykOchu8GmtA3SD2g37nE0/dbUXfijLTyQLQ3G3gZ7kb3XmSc2cRrJ0mi3k1eUaLN7M1E7zEktlkku8lYpX90ZrF7WatM0/9dKrlCFMNdi/XfuwIyAxm9/7qYnAM5IJluHEszxRvI/SHTg8WCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsZlNFElQBkfATT25y909k7hh0N7JQGguSlekbFosTw=;
 b=HcGaLCY+2YPH5ixx+BrtRHueQA+KJpJIUT+2yPxlTEOZrmfK42XDux2AoI5OdutK6HmqzWmN7WFem8gZJHPRDbiVfKfCEMDucSqvIKw7BeNi17Ffmc05OHbRjkjnCUAhGAxolhZkMN8S+bjXYaaKDFj9jom5vrHS/RvQXO9pwEDs0K7+cSOupOZwZYk3MP+BYpvPO8uJ76RZC1G2JUEUByuLc9HZvlMm1BeZ3LTKB5R1pWJpUpEHNU1h3WO4KGrBu17EEUFYxMtVZFQXrdsCLuZmUzEZuc6SmE2K89wWyzfBdoyg6quzRZeRyW3CuDCoWV0acSqCreSRGD2Bv5xDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:00:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:00:41 +0000
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
Subject: [PATCH v2 6/6] hwmon: (peci/dimmtemp) Add support for Granite Rapids (GNR)
Date: Mon, 28 Sep 2026 00:59:56 -0700
Message-Id: <20260928075956.62298-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 60f2f98f-b1fc-40b7-28f3-08df1d36975b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|366016|376014|38350700014|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YziWayi4e8cb/ytuniIkPqU0Sy3+j23+w2msrAMTS3C2A1apRv7thSEOvY5WzQeBecKnzM433fJF8zQ4/ciyzuf+VDxtmROX2jRJdUD6zP0b6fE6s3B6KKuPrOoWIuQwl+l0cblESCqPn0s438Hqls7a/AaDMAzI2LIAfWFCyb4k1me/HvZ/bTK8Ap2Q2CfqvN282K/h2g30qtJDu1WuFvpIk3GQf3cgXB4RxxRnehG2/1oThWw/PDkcquu8Z8XjQRUwFgd29IT/XmvKEkQhxS7Nmo4hmhd/ETy8bJWabqnu/If0OTfnSDBql0cvLKQl238PxPtfz5Uo0FCI/NFLVlmKF/N3nQPbOfRIu0ZMsyn/rSKEwmAWAWAbID4Jag3YvkvAQT7gIozXchU8FPCtYT/lbH7Eg+ga1+Wm9JgPLvuwao/qVSRKwZpMjQJkOtcGHkCbeuy0hCmeDd/LcHI/kyv8KaDUFf81sxdZ/gcG3tLCPlgODsJQHDj2eVEoLZr/YTdgJSJi5Y8WG5r/eAPB93y0nNpJseYCqmdJdzA/cm9qKRHP2AqxPrKES4W6WVMj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(366016)(376014)(38350700014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eVITFclPIUjX0WIetypB6qkznva9ByzJ9IDZnYHQm06QrG9WaMGsyEl+Mkod?=
 =?us-ascii?Q?uERrKtw73CbZ50rR7jDncx1GqQDQPkCjd/Z8qC6/hGEwbYbokUVIPzQCrU97?=
 =?us-ascii?Q?XqxlGhzpBgkjISeC1u0TsLryAyxVFSE+Kg7Eov1OHuVvwngnj3KHQuAk0oKD?=
 =?us-ascii?Q?mZlUcKasQNMlHxihNhLAGb+l1NVbz7dCM9GVL69PlzbswcNuQgaEPW5eOmFS?=
 =?us-ascii?Q?yUPvUv0/BT8FJ+HAnw+DmoLYiPr3TV29M336vxowvtEp+xeLPuIpCIwi9yqE?=
 =?us-ascii?Q?4+nojKlW5B2RE0X4KrXcC1OBf6rDmEWC/EZRhl/Ud/wRTBvm7YpdfrRHZncp?=
 =?us-ascii?Q?qazlBMt+ZKMDKJZh6ObiQNQDXj+Y0me7cHBE6B3Lr43DhnXCxDrtoJfFB/m2?=
 =?us-ascii?Q?50DbaqXyDj2trbUMFWptSRxuVZkKxa4aT484lhns8/l2Lp8qX69AIcbM86fJ?=
 =?us-ascii?Q?OJzvTM4b8qBIv0FOtbuerRJfy6d/yTL97FsBvnklK7OKJnGT+T552s2YlaFb?=
 =?us-ascii?Q?rBsGddXVxaigq0dvhpOFZcfHOB+ANWtbcmyn2by8YAcmBFqF0QMCZc91FIJQ?=
 =?us-ascii?Q?J4JcOZ2RscEaM1yO4bBZHhpiZ9ssSoAHTQ93znF8TgziTu62b9v9LtJperSN?=
 =?us-ascii?Q?IJA9lpZMGpk7QPlLZUl2PB694enbcuvuhLMeh+oXida8ghcuOOraCtU8vjwx?=
 =?us-ascii?Q?2iX5AWO6VE5jlYhiGwAdfArr4QCVE8V+GsCNeV7x+Yu1XlZbo91fOCAbSqP0?=
 =?us-ascii?Q?4Vx39+oJqjQL2HwtqcaSs0KU9VVyplJETljK0a1X58hcdh1oxinouSF4yJ5o?=
 =?us-ascii?Q?yaQ8ZTMh9OFFiwUY/eghf3A8dewA4ORUIkIWm4AtfRQThjypGZj7cikUCaaU?=
 =?us-ascii?Q?h1rKKxB8fdMDWTUZLJW8qZcMlQFe4qqNJ/7ljQ3CkFi+CNkhz/Cm96Eh6gyZ?=
 =?us-ascii?Q?N5plJXBSEsmKb0F37clvASGTmEIyJtx2Lf30m1o/SaitHlD8Lo8EpnJ58xyd?=
 =?us-ascii?Q?RTYFqHjGoRsLrnyDWMmXZEi6yQ9GS98OlU1xucr/iklKuK29ECvZROtRAWvf?=
 =?us-ascii?Q?jzNr/4o0KVY9GXHWkq8e2l2pVtbeBOfdXk0PBFrthSRKoE7WzCPNIdyRaCyB?=
 =?us-ascii?Q?W6S3CRDntJ3W2C2uwC/Q8G/kjFSkLNw+mmsHIBirWLLpdHVY/bgmbY0tYsog?=
 =?us-ascii?Q?PNKc4iVfmNNfNThIXLfxrZahZiUs/F88D//IH0CiW9nraoADiAm1IWMpRYUX?=
 =?us-ascii?Q?0UosJzqAal+1xxUDNKg0ydxbmNbyIu3so6TZEf2VnaDtpQTebhliauPhWpRh?=
 =?us-ascii?Q?J5VBYMlwsbVaKH27AfmQEhinvup2Mf88MttI7Qt8eu+49V+Q3rUZZTeZIzIl?=
 =?us-ascii?Q?nOL41cboiYyziwWliypDDtYfcl7J9FIknrkCRdiZbDnWYmUSu+toX9HOyEvI?=
 =?us-ascii?Q?rgggC85GQ3RnIuvW0rGXp3riYhfJm5VG303usXHgEq4FDnOcpjHgpZ6n3qjL?=
 =?us-ascii?Q?zoyslHf/rrdzxGapS04kNm1i3NHf0WMVkrEy0evfi9vebNTGnmRiP0+4AK5q?=
 =?us-ascii?Q?6nniQ5NAsIYZI/fb0dRANCYhaeFQgtA3fBPducwDszjUALmUkomYviTilb6L?=
 =?us-ascii?Q?8d9pKFvNfKIjTxIjlYazxOAhXf2ajIARQUBy+ljNmRANlekqpGhDvMjOwFdN?=
 =?us-ascii?Q?N3Il9DsrxG8Km7qAOwchKBbzZfm0uY61O3mIMHUcJZyoYtf057VMMa/ThXLb?=
 =?us-ascii?Q?sFR8bqanKJNxxNwA415hzN5SAxMq6gQw252AoKSjmrFs+q1N2+MN?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f2f98f-b1fc-40b7-28f3-08df1d36975b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:00:41.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+gQPEekY7jWNrXs5UpdippFU+xp+JCJBOOv93fR2h1uPR02xff4dQFnZTEBYsIBp+2mDCQFeHLN4n9AFIpGJeB8k5stO6v+yFMdI0oUY8ImPeJb5Pj3UTHgk2HEqOna
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
monitoring driver.

The GNR platform has different DIMM topology from previous generations,
with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
channel. Define these new constants and update CHAN_RANK_MAX to use
the GNR value since it represents the maximum across all supported
platforms.

Since the current peci core does not support domains, accessing GNR's
DIMM_TEMP_MAX and DIMM_TEMP_CRIT via PECI commands will be rejected
and return completion code 0x90 (invalid request). To handle this, the
read_thresholds callback is not defined for GNR, and the visibility
logic is updated to skip exposing the max and crit temperature
attributes.

The minimum PECI revision required for GNR is 0x42.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/hwmon/peci/dimmtemp.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index bd3e8715dfec..791a8e866081 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -34,8 +34,10 @@
 #define DIMM_IDX_MAX_ON_SPR	2
 #define CHAN_RANK_MAX_ON_EMR	8
 #define DIMM_IDX_MAX_ON_EMR	2
+#define CHAN_RANK_MAX_ON_GNR	12
+#define DIMM_IDX_MAX_ON_GNR	2
 
-#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
+#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_GNR
 #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
 #define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
 
@@ -198,10 +200,18 @@ static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types typ
 {
 	const struct peci_dimmtemp *priv = data;
 
-	if (test_bit(channel, priv->dimm_mask))
-		return 0444;
+	if (!test_bit(channel, priv->dimm_mask))
+		return 0;
 
-	return 0;
+	/*
+	 * Some platforms do not provide the DIMM temperature thresholds over
+	 * PECI - do not expose the corresponding attributes there.
+	 */
+	if ((attr == hwmon_temp_max || attr == hwmon_temp_crit) &&
+	    !priv->gen_info->read_thresholds)
+		return 0;
+
+	return 0444;
 }
 
 static const struct hwmon_ops peci_dimmtemp_ops = {
@@ -626,6 +636,17 @@ static const struct dimm_info dimm_emr = {
 	.read_thresholds = &read_thresholds_emr,
 };
 
+static const struct dimm_info dimm_gnr = {
+	.chan_rank_max	= CHAN_RANK_MAX_ON_GNR,
+	.dimm_idx_max	= DIMM_IDX_MAX_ON_GNR,
+	.min_peci_revision = 0x42,
+	/*
+	 * Reading DIMM_TEMP_MAX/DIMM_TEMP_CRIT over PECI is answered with
+	 * completion code 0x90 (invalid request) on Granite Rapids, so the
+	 * threshold attributes are not exposed on this platform.
+	 */
+};
+
 static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 	{
 		.name = "peci_cpu.dimmtemp.hsx",
@@ -659,6 +680,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 		.name = "peci_cpu.dimmtemp.emr",
 		.driver_data = (kernel_ulong_t)&dimm_emr,
 	},
+	{
+		.name = "peci_cpu.dimmtemp.gnr",
+		.driver_data = (kernel_ulong_t)&dimm_gnr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
-- 
2.25.1


