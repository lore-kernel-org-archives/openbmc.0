Return-Path: <openbmc+bounces-2548-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A76C624D6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 23:48:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbbrH1v3Tz2yvK;
	Fri, 04 Sep 2026 09:47:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::730" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788443421;
	cv=pass; b=E/CkFfu/DxS7YQv9u8OgQjjXtjtQ7LTwIjcFSUGwrxVV7kHcWnq1w98ZmhPfWcY78qov8uuimDgl5ZpWzAau5NNa4gis81wAieciw/Bcb2Ml8ZKN3awy9c7DwlKkxn6wY7n2Hxt/PrWHaQabtel0InZ1o8BtS7r1jx+atMnHZzmbU8CVqOUTM2vi15p+8Z4UotL+iIU2w+1HS2OaeYhAAT3itbKL7O+P9T9cOK3+GbWFZoge1N4bNc9B3IfCt7FWFMCk5L5Jmcvx/YdZu0+ph1baRGkdyToiCG5N1ltYp1okNcRoZqaAJllUDHGQyE87OxYj4j1UpqefW1qbBE1d4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788443421; c=relaxed/relaxed;
	bh=PgsshksB7oidWvpa0dusU5HX1hlwopRi1hmDN+gOsVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fb5oA+evn2OsIzIm5hrRNhuCX8Rtruq/XQSu1dX37haQ04lQEeo0e8mPcBr2Iv4yZEPdpWvGTFQg0Fl/Xrf606frK3NSkN/TqvkrKlRrHXjrfmen0stRJJ/NTrNjGc0etJuA3fF2hzQoNTn6/w7ZmGMOBoKU0Vr2XU20Q8KhfxGMBJeMLt+nnLJJzLCUHIrvm3eSFGjJHeOpRekwUXAhuu8ew6FUuM6aLXHfCE2iRqmSG1SToLdyx7tih3erxLQFOvs75EngoF4EDxrB/Ebr/vgLr/S6oRwz8Jlc6j3qJr+2I9vdl/rNp8xGS3+fA59c4O36Fns5pBu8xEr413RHrw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4440:2::730; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4440:2::730; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 907 seconds by postgrey-1.37 at boromir; Thu, 03 Sep 2026 23:50:19 AEST
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on20730.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbLZg3WSSz2xHK
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 23:50:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCN0ksyDjj9Hz+nGvRm3w2t8Cmx7HWFOngewyA09N+iioOe8SB/BpzSAdHkJkk383It1OJmNDg14UKTdxQy5HO7y5OQyu63aKfRlc/soF+V5X/+QobmTfEohreKJXODiveVJOOSM+kHT9ANs+lRjdMwW+qAwzDyyVZNRFaIIwzFr2tGRhsg9IEhJgJZCVzL0VIcbPEuqVkcjNIgIfKA85jpo7KbraQQssQU8XAwu3HNqK0VxCwa2imQCam7N4DKbMuhseAVaRPR6TvgThk9kWo+taR1gEwOp44IkP6udoH0qrL4vpNoSVLaneP3jiwttQ4JyI+S/11J8TCHp4isVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgsshksB7oidWvpa0dusU5HX1hlwopRi1hmDN+gOsVc=;
 b=lV/L+wutGCPPikpQGPR2y6vCLsFGjc6RTgzT+K7s8TfEAJesQgTr0GQiSGxAUGcUlO+CCsvU80igmf6u6Nw7JdGH3ngRldt88sW8A+4WmutxhQORofyYZIB0V1EHAO2HSeoC1RrBtGvIUdC3U1MlKKHvMrjKyLH0W5rzt7pHRKuI9hTOBBEjhePirNK8kh99mojN0L15+RHAYQYMZlmOH1ac9Ot3Ukb3Pt1euliz4ImRO2eGCyBQfPLoCBtF6BDhHlmn4jDqWHWujXt8jm+2HE7nMRb4QT1jiV/MW/RFVjdgirm4ZEGvyj5KDJPWw+fDs878JlyuKpzk1Q6mMFuDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn (10.2.1.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 3 Sep 2026 13:35:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 13:35:28 +0000
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
Subject: [PATCH v1 3/6] peci: Add support for PECI CC 0x83 retry condition
Date: Thu,  3 Sep 2026 06:34:05 -0700
Message-Id: <20260903133408.110847-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: c34e7a6c-e743-4cd0-7ddb-08df09c037d6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|52116014|376014|22082099003|38350700014|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	BDZjS27fnjTkOLiLW2K4Iec7dyJie/54mRfvRmX4W5wpuOr4xBUlTWxj0S9H2Cyv8Hpu+a1kSCElZPHBvbHwskETg0i3t2Al7OO0hOylNfcIizSNsH8S3hIPrk81Bxhu8TVUSUtZLugdB5JcImtXlWa5KEU9ELu8+3b0ZT71eGAbrJwpiI1MW0zR7yg17mslz8nUZPjxvAoJe2adgva/vX76lSvEeNp+KwB+Jr2/4SLu97VMnUU6avTGBYhgqe1B1UQqOf6J2CRiT0r3ePcL8mbBq8hysmCrVGZNkjKWxizoJIhzDTsz94FKeGQKcQuw48ILHIZrOIESk9EZkT2qHqa8pRSNIcFfZv21BdBb0fxAMwzIBoUWsTJkUW0B3VOkeMaJhtaER01BEogg8ebVerjUzb9L2PbyCTUUlymzoAPBORbxdISD+Wtq8aQ6lacuO3U2aZU9pZpofR/zREp0zcrkEMxTZFtrACXSXneCC4mxy2OUSphp3uzZhD5F99trZRgg2PbzJrVh096324BB8r3nUYrvuq92eIhE7BNu2lv9hMb83/yKCv0nLRLwKeRP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(52116014)(376014)(22082099003)(38350700014)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tKQLJ8COvGWQBoHSqj2FXUuy4wEt8w8jUe/fGilBUn151AjK0kp41vQ7tEB7?=
 =?us-ascii?Q?3Zn4v5QTOHio3yFs/CGi0GfrqAu2oA7bk1PvgikvAxT2lEjgOQnHuJCI25Ja?=
 =?us-ascii?Q?UHGUcRtKfZTA6kI/8DuflBPSA6HKRvidvejU5Oc/UgP5TwDi+C0Zk7CXLBoI?=
 =?us-ascii?Q?Upi8XsCS9XQ4855jnJ3+WG+p1ZPDlW386guG2FoiXon4VkJC6d9WZrc2tAtK?=
 =?us-ascii?Q?0LCk0i2k7qBrOnVMlDGTFlJOTzTyvcPHeA9t+HdKiOvkviw3iyqDakyTmkzz?=
 =?us-ascii?Q?nh4ShYZp+qmQ/ZJsOJDiKAU34A8tZGuQx3KeakDpuK3a5qdlnDyzLSivZ20R?=
 =?us-ascii?Q?MS8RmZrA1c3ejeI4/M3uLgXGF8xgkA434tX+HeWUEILeSC18jBmptqZvXWnH?=
 =?us-ascii?Q?yjzpyTDBdQjszNlMKD1ztUQ2WpK69xh/lbO8xOVSc2owUF7px0SX1VxXuULC?=
 =?us-ascii?Q?b9RmByvD3Rkskv+3l8n5ywTYSlaeHtkbniHrBFKhf+njuNS19P5AswsPYWKY?=
 =?us-ascii?Q?UZxM0PitYxey1EKaIzkMaqrSgGnEhMTKdJ2hSGqJnE6ZSxAihHEoIEyK7Cim?=
 =?us-ascii?Q?5sW7NDMGKyrTveVDCFPMNnT1OBjrqJQKtd5DYeRu6tJCntZVEF4sIalDnqbB?=
 =?us-ascii?Q?2oRjmMFtjSP7Y/QiMY0V0IirUa/D90P+MY5Z344eD7WFJ9wMxp9c4CbH6ie0?=
 =?us-ascii?Q?FnPs/IAE9WJDBEBCg3iPAo8tRdh9s8ZaJlbedste40wFoWiYqUDnnMcW+EGx?=
 =?us-ascii?Q?m7xUbykWrtb7FmS5SLypGHrFwhDxO3LYSAqfNCOlGM3SM8Sa58EBNPMKwMH/?=
 =?us-ascii?Q?7Fy63Nc4Yf0/B6MbJWEurFaVtdMSm8N23SfIIq52FvzRFRjvnD37JcDusuKD?=
 =?us-ascii?Q?WtwtvnEJO9nBDS6X0VFD88GJROY228px4QZ5HlvsD7eBjK0csl8I+hpq6xEn?=
 =?us-ascii?Q?NzyLO6dB21vovHWpmxAkO/xuIGiZzvU3Euj1V4CcYEgYNiZZ1nkEJ81JU0qd?=
 =?us-ascii?Q?xfYma8sL7dMOz8otQTv/7WF/ontrD78U/2iB73oSumgGabdajFZ8QahX9IcQ?=
 =?us-ascii?Q?O1M+4YJEhZZY1bsktrhKOp/m+kpOmfA2HWRT8XqDEAyeTj/8VlWQKnySKyCz?=
 =?us-ascii?Q?vFY28ufm97GnrogXr51mCy7ORGVp2cTF9JSSfCj4RvD7X9AoYzCpOdj2L72f?=
 =?us-ascii?Q?PiDeDoNQpxy//5FX7vXnDT7MDuIyniU/+uE09RolYCwxI4BDxvUTQcqS5cmN?=
 =?us-ascii?Q?PbONiks6iD36qJEPU182u4brFn9LPTEfzk8sLypp33xNhjhCzO4ohVrJmGC7?=
 =?us-ascii?Q?+9ivdGlfbBibZR86oAtlfU7Nv7BiyVQeejwW5sCXtuhop0XvZNDtG+pFkl7W?=
 =?us-ascii?Q?m7tgCeNTaFLI0v1aF1MxuJisuZyWTOyhCNeefKqcq91Hd4UKt2ysfampyHGh?=
 =?us-ascii?Q?C53YFz5o2gQGmFvVpScO4sHGM91LqWcvLjesO7E+BJTXTXCKmUc3s5ULVoN3?=
 =?us-ascii?Q?mJ+EmMI9p464daalql7zUXR54G/RHaUL951DZaF2IX9qLJ1h3W05CbJaBGK4?=
 =?us-ascii?Q?8BNtg7+h4O15TYbbiqJT3xoCQUB0l5YdUA5hs0K1b1vnldhXlBHXufpisb6T?=
 =?us-ascii?Q?JjPd/ewMGf4BDRLf1kknmun5rpQv4V/LLbUnPCdKprzOs42eYg9xJNl7jgtL?=
 =?us-ascii?Q?TMrYE0Y4frWeOfs4+Xa1QacXQUFioMLRenGjjkUAEsdsQib+JzuHG4caWAf+?=
 =?us-ascii?Q?drqEvHOUMNyqeR6BpRDJi2sJKjToN/tUeoBmt8q7yiFS1TcTEt9O?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34e7a6c-e743-4cd0-7ddb-08df09c037d6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:35:28.6830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzCS0qk/rWxwsXD8NPLQcB+GEwllH4xa0r0KE/FvBnySZ5jSGV6AAPMhqBkDt5fUcHhfgpWfvKeNZsnByPJ/OK/TjqykhuGNDvpwrvyM7Wj3WJqlhU5G6RLAeILntpxf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

Some PECI client devices may return completion code 0x83 (CMD_TIMEOUT)
under certain conditions, which is not currently handled by the driver.

Add PECI_CC_CMD_TIMEOUT definition and map it to -EAGAIN so that the
request will be retried appropriately, similar to other retryable
completion codes (0x80, 0x81, 0x82).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/peci/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/peci/request.c b/drivers/peci/request.c
index db2cc30a42a4..2bf8b6a255d4 100644
--- a/drivers/peci/request.c
+++ b/drivers/peci/request.c
@@ -71,6 +71,7 @@
 #define PECI_CC_NEED_RETRY			0x80
 #define PECI_CC_OUT_OF_RESOURCE			0x81
 #define PECI_CC_UNAVAIL_RESOURCE		0x82
+#define PECI_CC_CMD_TIMEOUT			0x83
 #define PECI_CC_INVALID_REQ			0x90
 #define PECI_CC_MCA_ERROR			0x91
 #define PECI_CC_CATASTROPHIC_MCA_ERROR		0x93
@@ -112,6 +113,7 @@ int peci_request_status(struct peci_request *req)
 	case PECI_CC_NEED_RETRY:
 	case PECI_CC_OUT_OF_RESOURCE:
 	case PECI_CC_UNAVAIL_RESOURCE:
+	case PECI_CC_CMD_TIMEOUT:
 		return -EAGAIN;
 	case PECI_CC_INVALID_REQ:
 		return -EINVAL;
-- 
2.25.1


