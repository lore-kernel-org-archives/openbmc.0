Return-Path: <openbmc+bounces-2301-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA36C44520
	for <openbmc@archiver.kernel.org>; Mon, 20 Jul 2026 12:16:03 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h3fcX0dDMz2ySN;
	Mon, 20 Jul 2026 22:15:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784529504;
	cv=pass; b=LTO80sqCC/6lahCQmP+sBHYZxNyn80s8kouabMiTaZs013sWfnKq30jOZxhuOYOywLGocuhXE6tCUnHry2TSHw71ee+rdOJ8aI9L43PsUZq3Pn49OEWFgvnxZo9Ws1arbktZA9mA9Donzb+cBGgzEsw17UtURfuTwdz58ilI59vCRjpJeePydY/zEOWuTBHYBBpCmz2yOPI+yRiM1vHgn0WbRSCiuZjBiIGLVTqL+HYk0rJ+Perqx4peI953UWxDyq1VildpPRQSMJ1Yv7OAdMLqOEPdZhXuQm6Yn1zi+YbdT1P9Jx6VYrOzURzGEKZCA457Vjkj871ePsll3oM/fg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784529504; c=relaxed/relaxed;
	bh=6vMpNo5JD18bTFWcrGka5R9G/KyfhmHzDeB/mgjYYJw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DpinlO8dpATj+iXrqhkQGZrvYNrOi7rmru9fWSPNXZQCcKdOR6FeOiH9OmxAtueVRIIQiWXKTtA2K7tJjcmAgs9NHJa851U7V9LgjqbmlnDHQfnXLGEwX1E/vBmWruR0Odj8UFrTcN+D4P87NogsWWlcU05DiWJ8EBDFrKamrpUBgLDhuJVukfgm5itIZjte6eaWTnS/Ev/ytx3fX5hnR6qR+/IMRhQf3LpPCREDtNHinG25J8ci77qL5BK2Q8UsNNjqFFPs7tpH0+T1/nBSKo22qNfmTyeTxRX2pl5XLpfMfObvSqHZ1OBiQoIOxVnUrdomj1Dkl6ZAv9nM374NHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=DN+xowyQ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=panchuang@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=DN+xowyQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=panchuang@vivo.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h3W720Y4pz2xF8
	for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2026 16:38:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJM8PBLOM6afokjWwKgtYRxkzohii+VrX0tBEpt7TdtjcG/UxdV/V8n3aeJuFfqS4x4SuOha76OOFfD3+rRAkn29X9VW1Y86aOOpjWJNx7QrvUJaVRFinh318AkxwB1YVFCPxwVyjhhaf3zNy2vPwoKqJ2yna4xoJ+I7+xj55/+b5R6wdBXawHwnl8BUQCGuYpur+YIXMwRiWUg0N9Fm20H/Efc6Ke4J1LVwEgfBtTO2dE6skHe+XgBh9mnp4jaddbPGzcKa9q58odTcugGJkQSBskSCt/u/Z0NmMp8tvuQedTBGVE3siX8JkQKBIlnM9vWAAXftDsarAJVMPvUJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vMpNo5JD18bTFWcrGka5R9G/KyfhmHzDeB/mgjYYJw=;
 b=ybrOygyxRn3mF3bvcYSgjyoGnG6/tRdurUpcrbk0PShv62/wfJ4p5B/hFAPYgQHD4NSQIUeSmsmYgiZ5UuqBJmdTdZPWenM2QuX+9ukGXeRR3cM07Gd8gdxFbCP/w6qhpPs5FztitMatTQQHql6RzxweydvzZHVljQ2x/9vhVaf7gD1InV+2u2aRsw3akVklluhuu4gl97JWcmlatYcszE7MZfyXReF8GKXEYThVSmCe188S16spK/bQfvJ1khVxA1XEnvYXIncwmmur1Y5aFyvQy/MjTgdoq5ZQVa4t/dCANWQZJQMmI9GVLfiKr5tPoi9/OjQCOSjvsIkcn/Bl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vMpNo5JD18bTFWcrGka5R9G/KyfhmHzDeB/mgjYYJw=;
 b=DN+xowyQm7Ckn4qr134MBvkJ3FA8kF6rG1UjbC7U/2rVbXEarsO9C3l3Yf5Nm+yHx37XzXNWZJTP9V8E//drBFjXeTYgjgSHGwTwO4kxjcafaoP6FMrVE+CBqEnmp8735Gl2N7VIgWOgXSuOrV+4dt0mYANqjPHR6MQ5l0V63IRpsDnVFWK+107MrbXbbI5iYQZ7LqwlNFphspACfqfaS2awFDva95BCqvbFPUWtx9dsFQpdkg//JaH33t31xwsR5wPDoTtTt7VSXS5foZCxTvp8tgtHlkwhctOC6TmcHTd1EL/75hUWT20hQwaRk1XA/W7tcPK4G+sg4bgA8K0+mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:37:56 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:37:55 +0000
From: Pan Chuang <panchuang@vivo.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-hwmon@vger.kernel.org (open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list),
	openbmc@lists.ozlabs.org (moderated list:ARM/NUVOTON NPCM ARCHITECTURE)
Subject: [PATCH v2 0/7] hwmon: Remove redundant error messages on IRQ request failure
Date: Mon, 20 Jul 2026 14:37:34 +0800
Message-Id: <20260720063745.309331-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc7eee0-697c-49b0-8535-08dee6296e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|7416014|18002099003|10067099003|56012099006|11063799006|921020|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	tss/JlNmrDUfrwDsZg9aOolgExswv8WnvHFRNAh+AXzl+GjXteaRDhojeHW3bKlcwrZ9KYNvyqAqH0KDnFZ2I9gpPADmF32VtsDxwUE/u42eHj8oHhtCEOBGXDkqfCOe1rnK7P4cTnnWb59k94hCoRwRWdzJcxBXpRbOTiP5raWXWGGQjutM1odSkmWl7nqPvZkmrmodEh/pa6poHj9XV1ANu9oqNakGzI4UyWKwGNopO2wfhG2vOpa8jDy1cNnZGIYa82/7RkCjGu+/JBQslvdmCWlGGsX5KuyInC2H5ldDSEupS8vps9cVbCURjEjS3h2BecdV8zKPvTDcyyfKDX2YTh7ZdTbfuDto/tX3KnBGmQxt3tLqcVY3IpW2w2yFm6qxbKX//Z02fkAonNugZbyWpPgnYuTDRV65SXbvV7NOfMH65vvGul1Y8k5oVSK2UCdsgwddXMLGEUvnAFampQ+ZS2/jB3TTEX17o7HQiJRzeiqjnO/h5Qb5Z/2K+MSrhzs4Lc/vKt7/ku1YLbcONOIsz0C6LxPWJLKkbMGtOckLpRfX7CE1bZXZncryBrWXG7eDqGtTfW+U1WUBbUW/NWXnZyyeNxuxp1mJ67OK9OKO4gYdmwkiYe24C0y7rJDBdSHBqKaPc8Ex+2yrbMqAyxk998n/cqIwkHdfHdBtOP8Q2HLAIWR/vWEc+x96C1B8py165WaRfluNBKPuxPeRp46hLV9hHZ5HfqMNN2/pOddsOWnHjPP0FaNW3GkZuyo9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(7416014)(18002099003)(10067099003)(56012099006)(11063799006)(921020)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7nP3G7wCiWk8I3cqDBLEHI9xhrSM1oC/Vzzvvc4iW1+9QVVR9vOc6JU9fBiN?=
 =?us-ascii?Q?TNuM8GOtAUjphl9ctyuINxIuwMKGPRBEg2kb5imQ9lqdfjLuZaq60OCZh2VQ?=
 =?us-ascii?Q?T8UFXqJrqRcl7K62RxVcTNna0nhA2Zh2/cqZQOwW/ENjw4ShqELFajrxPGoH?=
 =?us-ascii?Q?W+E1zCr6wCceRMb59JHaR/sc+XOFjxCWSXVHMNpACEWqQvOzeTSaKNryv4Xu?=
 =?us-ascii?Q?EvNYap/3oBRDcgzvLbuF0NfAXD0gxsa2uAgH9bDo2MEXn7oAoQ/lDtF9RRv/?=
 =?us-ascii?Q?01+T7+N/JMcogV75UDoXR2gR7UfWDLUEhO47q+67Q+usjlg8fwML5XBLyD11?=
 =?us-ascii?Q?w/ExQrGDPKJT9Uf0Nf1xZ3938UFl5VJvxLqod2eXI4kTOLzAJEV7mXebujtR?=
 =?us-ascii?Q?vjel2lnGh44eR59hZfP+VAOkSme8ORBX37GG6qIXzmDEOYR3GlaXIu3hiOi8?=
 =?us-ascii?Q?6GuYsR1tl2iQkqjAUJwqQBvVDPl9wItPAZmnfJCqqk/guIFUGpxW9ZRHNRgz?=
 =?us-ascii?Q?Wal+zx2hOC1z/6p5FXd5Jv0HTCrjs3NFnYBzPtrQHy2mOBiyuV3FAXe5gPAJ?=
 =?us-ascii?Q?JXCJcpWL0He+LrLh3Qu7RPXzTwRaxO53DI59vNwu6Z473fVjj7Dt+aQfa33f?=
 =?us-ascii?Q?0nnxykIkLKPCWUKSbRNqHqhFvuOPMkDjp0gAZf6MgKO4y2vEfg9xRXa1i0ki?=
 =?us-ascii?Q?dGOukxpzFZz5dibFPQ9EHtpk+1ar58t8601MetNbG/NUMA+2Y8nFsNTdv/VG?=
 =?us-ascii?Q?V0fEFLLDZzIkm5xZD6qiWHFJOM5Ep4YlmGxtnDSf0pxzJ9/itA6Br/yUuH2f?=
 =?us-ascii?Q?cAfndhUjeZwpSV9/j218nHHgUcRJ2rjN5Q1sMEarUZhB3497Cde2ZybsJuW/?=
 =?us-ascii?Q?kUXztqdXLs7mQEgRtzbTtmfxYZUgnu2hrRLr6C6QqLEe6qsRAKhs2P3JxSat?=
 =?us-ascii?Q?bbCuiUmBRzbsZr/L0XJ5NHnXI0MlFMgB58qgZf/a1sRVgyloTdsHYxR3Ri3J?=
 =?us-ascii?Q?C6KJjWsaLIb6kMlGQVnfzLi7GuSTTbHyKXs8tN0SoW4r+RUcarOo4eUf85Ty?=
 =?us-ascii?Q?eZbgGqAmsEz7QGmPQJgApwzqgm1mzuz3sx5wd7Sd7jk8UucpiOzUx0MFvw0W?=
 =?us-ascii?Q?DfdovCGV3IEDBZhe3Iw7vcCCfyjdREySNOgOdRNPJCeLbSozQqCyYK1rxJHb?=
 =?us-ascii?Q?V8k83uv4hVMBh9f9xc5I5e/n43ViPaDuSxpoHJblCQtH6SkJesT1/j48Qu+p?=
 =?us-ascii?Q?hUyB0kI5ho9C656IbXx9nKF+M78C4gCbeRoxeXwg1PE53vpoaL7fRVmSlguB?=
 =?us-ascii?Q?5OYwvzLHbiQRCRmH66OIyNG7/ZgIxCsyvdqkqvNfNXmnCNpFbk11CvzP5yIC?=
 =?us-ascii?Q?gNlUgo+1lqT8Bml7YZloDvj0SarKEiSUnB5zqrUb9qVgS4jTjnr15GUUTBRp?=
 =?us-ascii?Q?q7XQM/DAQWX+M9CY7vzAyy+xz+0QvvyqoGiLipqU1iHtVDTwyN8zHJHDx13E?=
 =?us-ascii?Q?tR5mfxk1tJPXhx0m2GsM9GREts2jItpGymqcYhK3+O9VY04Rdy9TQZEvAAUI?=
 =?us-ascii?Q?BF4Z6z2AW4WcXARfSDwfgubjLYeN1j9eul7lGytbOxnEFTJXh3zsels9x6XN?=
 =?us-ascii?Q?boeHcgJWUYAwQSUs2KiagQ/xPsIsSlwcLFltNP7OcmeFws9ydHaqDyP8qcXh?=
 =?us-ascii?Q?PcR3GY6EtXIvC3bQHEHvJKIzfpuh72CkGvvASfOg6Kfg2V6hXdlftTV/uGF0?=
 =?us-ascii?Q?JpUtyawzJg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc7eee0-697c-49b0-8535-08dee6296e57
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:37:55.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjRq/0wD73GHvRrrKPDiKoYChnuRnc8q6YJTXxZYaXdac1HKyKzZYo+BcbfgR5A5OGfeZ1/b1OUCsKaksaTtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()") added automatic error logging to
devm_request_threaded_irq() and devm_request_any_context_irq()
via the new devm_request_result() helper, which prints device
name, IRQ number, handler functions, and error code on failure.

Since devm_request_irq() is a static inline wrapper around
devm_request_threaded_irq(), it also benefits from this
automatic logging.

Remove the now-redundant dev_err() and dev_err_probe() calls
in hwmon drivers that follow these devm_request_*_irq()
functions, as the core now provides more detailed diagnostic
information on failure.

Pan Chuang (7):
  hwmon: (axi-fan-control) Remove redundant dev_err_probe()
  hwmon: (da9055) Remove redundant dev_err()
  hwmon: (lm90) Remove redundant dev_err()
  hwmon: (npcm750-pwm-fan) Remove redundant dev_err()
  hwmon: (pwm-fan) Remove redundant dev_err()
  hwmon: (sht15) Remove redundant dev_err()
  hwmon: (pmbus) Remove redundant dev_err()

 drivers/hwmon/axi-fan-control.c  | 3 +--
 drivers/hwmon/da9055-hwmon.c     | 5 +----
 drivers/hwmon/lm90.c             | 4 +---
 drivers/hwmon/npcm750-pwm-fan.c  | 4 +---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +---
 drivers/hwmon/pwm-fan.c          | 6 +-----
 drivers/hwmon/sht15.c            | 4 +---
 7 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.34.1


