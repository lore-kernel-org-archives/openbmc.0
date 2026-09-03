Return-Path: <openbmc+bounces-2545-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5B3C61DD3
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 23:47:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbbqt2TvPz2yrM;
	Fri, 04 Sep 2026 09:47:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::72c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788443514;
	cv=pass; b=RXY4EuyC0DqJSiuu1rdi5OZYlicVoBo0l/DTmMIGu3VhGysOiIXdqPo+tr4BcxAQ+y8b1Xg0mCEZlxcrKCkQps5RAaQiWyqZ/eib5aBXSB3QI/05rBpa0LeVHtGwtBCWyOBo/zuzLjVvrPDyReD7t0+uGaUY6kHor3tHpZwxaI0Um5ivV//jMRT6VJWjV6lad9eXQ2G8t2K13eJIx1uP9YgNkiOjMpxp+OTkNSB0VtcYJQwvTnJy2KcSboNYoI9NEOYT86SBLIG3fwpkXIVlTQlPKpEj3kiv+Sbd2hCAYMnNEJxbzW2VCRsau5Ad1MJjyctyFMU45uC5EklkWMSekw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788443514; c=relaxed/relaxed;
	bh=NHOV+v2dK4K4jpCQTj8A8iBYYEiLpqg/rPZ0jrltHOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BJl06l/l/MAn+kjPFllje95COv9TWh0KLxkAjoMa1NEShK/5TpXx0FwosGw+f/WCSG3lXadRpYvU8sLuDMAP9kLLb69TCqox0/CYtXJU9pugWZ7oCZYotAATrQsUB3R1wwKL/fKwMejIcIB8jSQ7HD6V3xLda7seVJIvDC/nECcyR9Cn7VENW2DefXagEx2gu0Y2DXy4WsrQPZLRL8ToTYb10VVpahQKaBDrzgLbohQ6097g3jeUOGpgzxLMKPChQk9pdgalMDkl2r8CTUTWd11XR53w5oTfxHPQQKqY9eZTb1My5YdZn66tYk6bdOdfcyUDH6Av9zGJAlIVLL+rGA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4440:2::72c; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4440:2::72c; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2072c.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbLcV1GHqz2xHK
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 23:51:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I18Fa+plAb4LfrWxbPRqsOm13d/axsQSwrj6fqNRegnYCzFMmzQxxavgYQOwHG1iSu65wJwPpffMJbto2UA4qHa66QDSx0ygxM2kU/mbbktLpPwroloiX2wjM8Asj6IleizEEoG+qnjJtOXTLVftyUhRXwP7z09vhLBdamtso3zYqp+Ryl34o9Vg+nDRIzDpROo4X6EgJs85jIqIW407wmmvIiXk95MUUjiHNtQKw/HQNmpiH/ZMmayAA4PkBNSVx4MfUrn6t/5NQs7AjuaIT6nS/qe+bZbz1stN7UWlp2TqeK+MNuXDgHtNx63KrRCFynL/ne+LwlzL66TT2w0Aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHOV+v2dK4K4jpCQTj8A8iBYYEiLpqg/rPZ0jrltHOw=;
 b=nsjIEEFDRn3nBvu5cXbeLifuupnkh5wf7jLScqI7UGBz7cRBxRVyOuO/DUL4stA8vWh1cT8CWXhHCmrt0XgvU6UjXEQrze9A1j4dTiqb7Tpk2uQxlDNDggJKYCVWtpHymmMsi3JS+KHuHuIa7hXSTVTYIVbKGtwIKzw4wEmkEWeE4AB1q36RQj2Nscexx/94w1rFgYewLr/9Mj0WyAbHAdBQ78ZCEQ3YRrgY8dROFFq5A8BMGqjJFcHKD+T0mdnG3Eoxhz5NNzSVbzvlOwlRSnHrVvTyyAfJEj0xetSd+Tg/FkKEwfvXie+16LtpT5aPHddkXOWplAf5xenbe8OC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn (10.2.1.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 3 Sep 2026 13:35:30 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 13:35:30 +0000
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
Subject: [PATCH v1 5/6] hwmon: (peci/cputemp) Add support for Granite Rapids (GNR)
Date: Thu,  3 Sep 2026 06:34:07 -0700
Message-Id: <20260903133408.110847-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1608e3c6-1b19-4c78-e88f-08df09c03921
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|52116014|376014|22082099003|38350700014|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	2SVGDZg5lbM7692BYAd2vPfVQJyMehV/5edPM2D9sNSwiUUqCaoQ6Gwn6qYwh/QYAplma47f1jWxerJDlpXc0ylnZNXTGr8uNbI54aYfyv9YKl1ocZCrR6pspEbcXWM+xOCFGz0cnxy0aHANVfd9vOiBzdMrGhua+jW4Eo/zMnxO1e3NCc7MWtBFP0kLQsr5O2HQDGi2QUnGrDIgHEDoKNKWPxGLLmsRvnquvLWOXKD8DpFDP/fBQrv9tPZ/sWiaEtTLb4uGFLhvEmS93fj+FKbz5+sgVwIyokm9az3Nl0smk1z7JWU7XvCzTC13WZOD9vATaXN6rx4hPT7/UYpZQeMTAfV+DIi6l+Ce4a286zz2vUZ4BfKxyX5wj7nosAGQqdMRTd2mCI6BqqHVa40tpeC86/ae7JPErC6BRPxe0I7IEVfNPz8g8a25dwwJLyDUjZYFm6ekMrT/EmfCdXeBhyqfX7zfLEJk05teNsbRC7xsAWw5LDuRR2ob+GPRWQw4ZJHH2nwW+AE6rDmk3/KZ0XQGcx4TQkl0lJec/BhJWhVjRG4tZfHlUUGYJ+CV2Kh+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(52116014)(376014)(22082099003)(38350700014)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ts9X437p0o/HX0DWbqnUU7MiMVCpO2vcGxg/0AdGp6FaxBrQB5qhVW5IJ2Kh?=
 =?us-ascii?Q?yihzMLV2BnoJi7l/BRMB9IPfqR03B+VZtr80pbn5ivcq6B70iEFORNRv/dJQ?=
 =?us-ascii?Q?L+xQolWE/LOObRg405pkLX7kefnA4lmO+smjTyN6SkoTtkJXHP3vhhaHW1IM?=
 =?us-ascii?Q?/UJJM7yWHHYjuXOUK87WC/cGxGJKuhjbMsb4TC6bPErR972r8mqi7Cn6uoKM?=
 =?us-ascii?Q?7RDyVthafM8me3KaDUo90t/pkWbSpVcTUs3bRbfvQzR60giwn6zdwgq7TM0x?=
 =?us-ascii?Q?a3DF4KRUHDdbsKk93Rb+c+7Sn3QV45JTlCz68q9RVVbkByu7ys8pjcDT93Xq?=
 =?us-ascii?Q?9J+vTDmg/tlM6ezLZXd7a85K6UYYcg0SBNqzYMjb90G2sYHmN6rN1V+rMp1t?=
 =?us-ascii?Q?aWqPub4Gkk6Uk0tnt6TvjJk/VmBlRA77o1mkoMFAjXaqz7z0Cuzxk2DGg89k?=
 =?us-ascii?Q?G2XUnGPix8CXLyz1msVXio2LVViPWN4NHDXpipR8fDuo3lHWD87Vl3kiD2mZ?=
 =?us-ascii?Q?TiAShkLtTZV3j1+i+BW12uTtUCyEUcVgKW+Hz6IRwW76/43J+48w/szAp75X?=
 =?us-ascii?Q?WLQhQW9d8nufehCgZnGP3dfcFv0k29shJYld0LoEnKIOTJT4uX32n3B9dSfB?=
 =?us-ascii?Q?EipqEU1TK/Dwe1i/1YuNKP02J0tFC7vosMas3FgmyyL8W2W64EvNNNchd4PF?=
 =?us-ascii?Q?qq6P4cqwQ8AbQDvK2etzI/OE1yf+03xO8eW0mUq6+Nxf1mlR1Tgc85tW08J9?=
 =?us-ascii?Q?3Pq5QI11odl+bJ7yA/H9/noLrvca9VAU+TRNd/nbn64BLPfYUH2sIlJOee0A?=
 =?us-ascii?Q?n9gU3wQUFaCxe09e5yzXcdelaJj8X6xdA5PAHb45rzRMhCmblCWTPxlbakLf?=
 =?us-ascii?Q?j88Vk/I105cK0Ke7Dn7LTjkek6XKdKqeqljbzJMhWSH7PUSLCzEokmaNkBbz?=
 =?us-ascii?Q?MSy5f6ATf4/lyZJi784wRSdRwxrZg/WEcTC3V8IkMaYE504f9F7qqSQSRIE3?=
 =?us-ascii?Q?2EuTTFS/RLowAafpo/juO4jvzt8qn774F/n927mC4Rwt3C3z+bRMFiG/k5jm?=
 =?us-ascii?Q?mTwmbaXAdpHPzlP+yd2OGotozUV4P3GaEG4JCuGpLoKTqmU8UC+CO03zwBof?=
 =?us-ascii?Q?GEKn82jEUW/B87wEqWx5Icpu0/OHVBxgo+Rga2pBrTuP4dZU+yyanbSgjSEf?=
 =?us-ascii?Q?KSwHmAotfqW9EqKaZfe8ZLw21k/HJNsCkZiYce6CMudH8qjKam3PilHAjyHH?=
 =?us-ascii?Q?ntAoheEmqZke5RmRvvXMsPCwRpMqlc6EkdlkWBebiOWgHeBZwRBZnwzO6kqv?=
 =?us-ascii?Q?fPsYgVcrCqYoSUIRXiyqOlvPZW9lPunt+fraGIu6wVU2rgLpID9RcI8yfreh?=
 =?us-ascii?Q?6SPa0EPhRXNKoi2MkTigqrc1BSVO3v5bJYJiBZnl4BsB1lF7IjTIRlwYHsE6?=
 =?us-ascii?Q?dfmgzr8avaqwep6uEcskFQ00EsYR1pvTEopViALg9552NUI9CSK1xFYGQSBp?=
 =?us-ascii?Q?EHB/1iqvBH5KageabhJnw7hO+NRnbwxdSCxoKNyyPasrgILAtMkgrrucpgzk?=
 =?us-ascii?Q?ZAdqKIxN4s+kkJgaUOCH1WyYRBRRk4xryyz08vPbtUOgSu+kYbFvX6SWmiIA?=
 =?us-ascii?Q?MUECjezor1e0iCR1ps492gNTONU7hAdHgRl2s61jw3lqhj2bw8GKTlE5LgNP?=
 =?us-ascii?Q?WIoW1lolIWQ4Wb02GpTXUauAWVNDHYfdeLD+miMK3WAyHq3mBjcQCDEbV5GC?=
 =?us-ascii?Q?dJ17rBTMpPd5Yqe5sZGAzn1aSpB1aVfH251tmOi9hIP8314EqXuP?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1608e3c6-1b19-4c78-e88f-08df09c03921
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:35:30.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+nmngIIQg9+l5wnjguEGTeMk+qUi1pF3dED0zVOg+5SXnCO+rIWfgbw7yotPvYE61lxEPy6cWacbRi4dyUvXFfabfpeBuxNwzemCHjbzbMWcWOQMNT38oUd58cH6epA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

Add Granite Rapids (GNR) CPU support to the PECI cputemp driver. The GNR
platform does not support the core mask scan via PCI local read, so
handle this case explicitly by returning -EPERM and skipping the core
mask initialization.

Define new cpu_info structure for GNR with minimum PECI revision 0x40 and
the thermal margin conversion function dts_ten_dot_six_to_millidegree().

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/hwmon/peci/cputemp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 457089c561b4..43e52a6db79b 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -339,6 +339,17 @@ static int init_core_mask(struct peci_cputemp *priv)
 	u32 data;
 	int ret;
 
+	/*
+	 * Some platforms (e.g. Granite Rapids) do not expose the RESOLVED_CORES
+	 * register over PECI - per-core temperatures are simply not available.
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
@@ -543,6 +554,11 @@ static const struct cpu_info cpu_emr = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_gnr = {
+	.min_peci_revision = 0x40,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -576,6 +592,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
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


