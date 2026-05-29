Return-Path: <openbmc+bounces-2013-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB4ECD5BD2
	for <openbmc@archiver.kernel.org>; Fri, 29 May 2026 03:43:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gRThz6nCvz2ybR;
	Fri, 29 May 2026 13:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780026195;
	cv=pass; b=L8s1B2Gd/8DoB98LcohSrrhhXvGt9agFwVh0ECHrN9QwgHeA0BtSt8ff+cXZINSqQ6ZdlEwMDV0AcVgNcwWXTfyoDxXG0Bbgq9ruqF4p1bjw9bZYinTtTVXPkuNErAOukX+grojP9wbQ0p6PYbaN+elBw271aceKQkXYpDr45phdCp/DiivxpeBbN29nlCq7yxc2sXgZp5M87kRyJ1HaHb2J0EuBG25Qsm6ziOKo7X7FOK/WaeaVbD/kC2h5KdWS8wlesbUsTlAOKFt/OnRrjw1zo3ZXd022OnJ1xY7YzylYa1AuqjJ4erBE2qIGZ0DtM5b12nLHf2ehFRm2olZFmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780026195; c=relaxed/relaxed;
	bh=VNbD5KhJgvYDpLoMgDsK3j7FinDGz4T4u7GMU/ksoBw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VUzBhISqlf4KZ1LyTGqJWGNgOI2esnv8Ds3zwBg0IWyuwbwGiPFqaQJ13CduSqGasyZTUyzHc5AmGJFD5GESMd00EhbzwN32CGDgVOY45KLWrr0BEQJ/fN2vIES03t6QNsyaXnUzIQ2l8UzgWwH+Vl6xP3Ge+S5Jo7LDOJMA76V6+J6THJQGKgzc8vfDWjcgqpO+8uIPOaIKXSmlTtn1lNcBu1ti4DgHRMko7hcsiH/tCkw17nR/SsbQ7VoGvQ4hRhHNBBxuCTlVH3CUc85okey/KCgc4+hdx8inhTi3xc6HLWxo0PGEBzEFMlA48ohx7ipLd0+0joNoCEXZUPlDZA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Y5bzykBr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Y5bzykBr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gRThy1KgNz2xf8
	for <openbmc@lists.ozlabs.org>; Fri, 29 May 2026 13:43:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAc93Pm8Zq+8x7/j101Bb/4mC3IaKf5hiN1317KYeu5vqdG6AJZSE8SC8/1jUerXAYE7Ew1fvAAafvQDJ+c1NBdl+Zo4Kr/u49NeKmZNJ15CH+egZAyEhXAowc0RE3HxA06ru4v7JyRrmxSF927U6Sew2Kb5u2FmbEg8K0H1jx+hnJbsDw325KZ+8grcdkaL2nQrG3etyDLFPQhf3C+5ilzuex15HejaRHlPuNqgjV0D9aJ27lF0XB00pGEsG4kcEmjuo29F3iZAz178ACHmmeBu9/vsvgDKr1WOgTXbZ7U5SA+pzCNFYTLUxNiNIj0HVlSPRbVmmZkSkwM/FuuSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNbD5KhJgvYDpLoMgDsK3j7FinDGz4T4u7GMU/ksoBw=;
 b=web3KMd/p21vqxqVuOvFZkIc2l4aaFHw9G70jYXkqZE42P23jOcM0KfWJ2NbJ7ZqJBlah+69Y2UD0hkxPMrjjbHioTJKhAbJeJBk9toMDRVA2RUhgYvw/3W+35oAhbvhA/Y2qbMQSSUykFudbXfAoe/ZbPF94bj9cDQizTTcfJlg/03MvUhobyGscp65r0sOThrR0Z4ivNd4vwWsvIg8ttzUxMo5AVDjJKs7+qaq9Wy0ZISzN0jfmT9VO97S6QaPL+a82Ij2YjHMkv1vnrVO0z0gnf3j8l2IK8N1ONUQIgfzaAaU635Y5GXWxtcRwy7H2kb9NYbBN1d79VOwoQv2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNbD5KhJgvYDpLoMgDsK3j7FinDGz4T4u7GMU/ksoBw=;
 b=Y5bzykBrlU0yuxyb5HhUy9M/QlrHfhAxgtsBsfBKxNV95vDsFSW9q2MzeXZ8LD2CwHd+ySmJ6AssNz4vPAdlJ5F6UYxkCwqmkOJsGaJWF7U4EoYwtEFrdKF9krIveyCcwXAX2ReRF4JgQX6INeNXLfjN4pfpmabuApwNT/KsKiVoOHnM/3FqbHFzUZ/pagb5FTxAngPrhNzQ2vkZPviDGiMV14EJoYV1r+hs6JWG91Ac8g7u76CuD2pBfqVs3YTSXzVuUiveLMTjQB2woZLd3fDikXigsnHehcYm/bBBTH8hRGIpI+Rho5wwqZ3jJMFGtgL61t2qDxRfmJXF1VLuFg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TY0PR06MB5330.apcprd06.prod.outlook.com (2603:1096:400:213::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 03:42:48 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::f53d:547a:8c11:fc6c]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::f53d:547a:8c11:fc6c%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 03:42:48 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Ender Hsieh
	<andhsieh@nvidia.com>
CC: Anirudh Srinivasan <anirudhsriniv@gmail.com>, "joel@jms.id.au"
	<joel@jms.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Marc
 Olberding <molberding@nvidia.com>, ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: [PATCH u-boot v3 1/2] clk: ast2600: set default clk-delay for all
 ethernet macs to 0
Thread-Topic: [PATCH u-boot v3 1/2] clk: ast2600: set default clk-delay for
 all ethernet macs to 0
Thread-Index: AQHc7LPmizavYn5TAUuM5Qu9CY9ex7YkPvoAgAAXwmA=
Date: Fri, 29 May 2026 03:42:48 +0000
Message-ID:
 <SEYPR06MB5134993F370A949CDC3A3C3E9D162@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
	 <20260525-asus-kommando-v3-1-e6a0ca1b4a3e@gmail.com>
 <610af357c6a0acfeec2d4efaa3ae17ce973bc102.camel@codeconstruct.com.au>
In-Reply-To:
 <610af357c6a0acfeec2d4efaa3ae17ce973bc102.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TY0PR06MB5330:EE_
x-ms-office365-filtering-correlation-id: 5ae1bd44-1340-491c-844e-08debd345a4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|38070700021|56012099006|4143699003;
x-microsoft-antispam-message-info:
 dNBtPIKVfSdce8CvWSjVs7pat9a/tsjGujFgPNdrOWSCO5Sb9fYNxPExuwyBRCK2bED6BV9Pm13JOTi5xIBCJLq9Y/2V+abPn09dJkd6BPuEzGrFIQyJN7oE8lhHN+duWReJvLjiiI4kN+H0fYI5T/QbinDGjecP+2UIiEJDNe68cZxk5xKBC1mE8NownlVi0YgxL8sT83MHDIz1Xw9S4k4xMeHYVmTvDFwuOe9Ynj/6Wo/TgAuwS9KM4rIUUcf7hNBP6cr4v2utlSv6F42f/bUNULUZCLjmrZ77ZCIV8yIqQUZz6KtmtyAZ4cH/jPCFTr5qLD9iteKNIfvu/vM1hwRCkLwifvluklLwXl2f9zJF958Oo+j6yjuZwRdu/4gj/gSMRvoaG500xBXFR2MbBglGipQjqhvntr3ih0cRXcnGlW6XL1CagY1GaTbwRr5KjrllRpyiQIfJY3h1VpBfgJjyHU54bbeJq/OWqv+0RWoyJlqIUJo07R+nsVctmHDJbPkRVr5DS1G/wGhbtesafWXSADZW37KzuSpTemstPRvXVgencvB7JS+oEHFxQrek4/Ou8dQs+aP0hdoNyYHRdfh0PjTzqCGRcpsUEtRwVyYAt7TNSW+NR/GIUdH9bjQDWJ/B+1qaxWhp6XcWVBjaEuE0GO9u5vdM/t59iiDd7gxX58r1E1ZThkP40UFmJWryfj0bTm2DpoF5/0c40Ksdr48O0Jxdc7cb1/C5zwo7/v+xw5SE4ggWzx2UHXM++qW0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TktDSDFnUEd2d2ZHNXFNSVlycXAyNEE0WlRPTTN4M0RnVHhnWTBHcGI3RDQ4?=
 =?utf-8?B?VE9aZFJ6WWlBL3V4cmRHVmF2eEN6RXYxcWhiOEZHV3hKTWlxZDBzcFh0OTRj?=
 =?utf-8?B?azcxcTRZN0tJblNHWVkvWGUwRFMzanRieXZ1QnJqV1NaRnJjbVR0b2NCZTM0?=
 =?utf-8?B?aFBWNklkSVBteXNXd2hhWmtKZkVudk1iK3YrajRncER0VjBncTl1cGZtZTlv?=
 =?utf-8?B?L0QyUGc0cDc4VDJoY2JaWGpHREdDeTFVRHQxQk1yWHRWWGRGSU82MGlMbHJl?=
 =?utf-8?B?TjRVMXcrdnhvdHBHdkQ3SXNVVmZib3lsVjdJNm9ncEY0VEhuTXJUQVh1Q1NQ?=
 =?utf-8?B?dE0wWGFFRW1OeGw5TmRiZnFCcFBxT3FCbEhVYnFwVU5yaFd4RXp2NWpJTWVW?=
 =?utf-8?B?Y2EvSVF4QmlnUTFrQTgzb3I4WkdoK3dXODN4QmtOaGdmQ2JNWXIrQVdqOW5M?=
 =?utf-8?B?cG5kSVF3dHZkaUFRc2xZRlhKVThDYXpKclE4SENSM1NtaUtvNmpwZzBKeU82?=
 =?utf-8?B?ZHFEWksyemwvZHBhVkVDR04valpwMUFZOW5BV2lJbVpCbmdOdGxKZ29rM1dM?=
 =?utf-8?B?WEc4NE92T0ZqOHFPZTkweTE4NkZHVWdHT2NwV0tuaGp4WmFibE0zWm5tVTFN?=
 =?utf-8?B?L01Qd1hPdlQyWE1sQ25RNFZja1JpNGw3U2N3TVROQjBZcEVDcURqM3k3c1VX?=
 =?utf-8?B?SUZwTkxNVExFNDhWM2g4cEZpUUVyVUdxdzZZemR0QklnalYwYmgrUmRvWVBN?=
 =?utf-8?B?RjI0ZE5qakJtQVhVbVVPWlhLNkVXL1NlL2x3SHBjRVI1WG9zOTVheVFMcExW?=
 =?utf-8?B?cE1LRmVnbkdiNjl0RXU2aWhqNGR1WjZBdXJDYmZLMkRTRmVwM0NtRlNrc25T?=
 =?utf-8?B?UWZMN2VkcWZXbGhnZWVjZU1nbk8xUzVvcDZ4QmRrallsTkwyYitjTU5BK2ZR?=
 =?utf-8?B?Q0daRCtrVlBjKzRCcFdwU2k2SVJka3ZiRzBiQTBBUWZaZDhhd3BZNXVSSk9l?=
 =?utf-8?B?bGJ4eHIxRE5tRE8zcnFQc2ZndGxjL3FwcUJwczJXTjZLdVFHT3BHME1Yaktw?=
 =?utf-8?B?VVJWUjNVVktZNUJxdWIrZGlHRjl0c2llQTNER2xKUnhtMHVENlBjVlU3N2JY?=
 =?utf-8?B?NGFsT3JEMUFIZnVqekpHNno0R0RRZVF4RllLL2grNEYzK0xEL1daK3NEQ0pt?=
 =?utf-8?B?S0RzcGROZkUyUjRhbkl0OVBraTFqd2piS2lReU9raDl3dGhKQk9hV3RWcmVN?=
 =?utf-8?B?b21VOC9WaVdsaUtYSWFzRDNtL1RaUmNnTFgwNVZUeXh0MXN1ckFjaEtMUm5I?=
 =?utf-8?B?RWdnV0d1Wm5EL2pNYVgzRU1LMiszMVBBY0kvU3crT3padm50Z0thV1FkYk1Q?=
 =?utf-8?B?SU5UazlTTGhNZG5EV2t6anFYanZGcTl0OUYxYXhoYjVIOStwSUZSeXJQVUMy?=
 =?utf-8?B?ZXo5K3RtQmljYWhaVjgyVUlQR2puM2k5T2NwSFl4NVg1V1lmUExxVXdhU1hy?=
 =?utf-8?B?RmtXYVMybXMxVlNtY0xTT05YQ3pTYmxGSGxwN1ExRnZFSjJuSWMzKzYzeFBo?=
 =?utf-8?B?cCtPYmRwMGsxMTUzSVl6SEgyQlh4VUc1b0plT1pObWhseDhDcXJqeWt3N0U5?=
 =?utf-8?B?eTFrSjA5bmJzU2Q2VlJzNEh3WXVZMXNXT3R2N3I2d0pqN2xSR3FObU9UNUN3?=
 =?utf-8?B?dk94aEdmUjdtdjh4RzdpWkVFemlwekFqRnlIT2k2L3NvRHNXYXJCUk53MG9h?=
 =?utf-8?B?Y2xCOHRTNTZGN3Y1eTRRZDdxRU5jaDZHcFZJQk5BRzdtaTNSQzNBazhjWDZY?=
 =?utf-8?B?a29rZGUyVVB4M1VSNWF1eHUybUFtUmg3M3VCK0x4aDJrTDdBQnBxRmJyTkxv?=
 =?utf-8?B?ajNVSFExM3hnQVJvdXp2c3EydmZnT2tGZGQ4VEJmUGtaeDNIUnFlS1RWL3c4?=
 =?utf-8?B?Vk81NVpwN25xTTAveEV0V2p0ell1VHh0QVc2dnZNTkgycGdYSGJLUWUwUDJt?=
 =?utf-8?B?UGx3TU9MK0h2TXgwOVQ5MWh1a3NzRnlubnJOS0lVcjczZU5rZ1MvUDU4VjZr?=
 =?utf-8?B?NzNDYlBIUm1Dak9Ea0s3dGVSSmZBSmR2T1UrWFNqaTZBRW4rSHlLVEFqVUpC?=
 =?utf-8?B?dEgwaXVOM3UwRkpJc1RSZGQ5VXdheldIM09VY3cxbFJLM1hKd2dqUS8wK1V5?=
 =?utf-8?B?Qm8vVzU4MmNjTndvdCtBb3ZlN29mVFdycG9Ga3hkK2Y0NUw0R0x5cXVYOW9R?=
 =?utf-8?B?cGpqRFZkVnFlQzVNTmMxWWMvVjJCQUhYVW1zRFlHNnp3NWsrTVRHQk9MWTBW?=
 =?utf-8?B?T0VMR1U5eVQySHg1am51MkNoYW5NdldBZVlLTjE4TElKejhCcEJnQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-Exchange-RoutingPolicyChecked:
	YUb/k+L0Whv7lSVu4uUNNrGB/c6N/QWYRq7NBKtPsGzRE/O5PrcUfTXMXZO90w8l33htOwe+krY+MnQTL+TOraRaTXSuWrDDU4ZUKNsAThBL9+OoMJI+G3zcu+hdxw+UmV6x6b0BSCQLARwr6Vpedl/ulCDlrLAcnmZGIvx6yXoKhGNO9Co45WyP/HFa+oFTXyG+o33L/toWE4Vb5Yz4ap+nJAQ3wvwWwmApe5fbVdxM7imtfPSeYC1ubF0rVqCi2jPoy02MK/UEhuTERiW1bsJU9eNTUNfqlUl1bxIGoph8PqFpECnAHdOVLbyxPAmvMpiG3hNcHLpQDioiS3DKdw==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae1bd44-1340-491c-844e-08debd345a4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 03:42:48.3802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKbF8WaoArKTPEGZzvFewNWgO8LfCtis5JdLEMFXWKdQrUIWy/lBrjiG44EkYtYh9G53o7Qb6e2S7/5jbGUG0o0ug9XMAyChFclJXF90Qtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5330

SGkgU2lycywNCg0KPiA+DQo+ID4gU2hvdWxkIHdlIHRlc3QgdGhpcyBvbiB0aGUgYXNwZWVkIGZw
Z2EgYW5kIHNsdCBwbGF0Zm9ybXMgdG9vPyBXb3VsZA0KPiA+IHNvbWVvbmUgZnJvbSBhc3BlZWQg
YmUgYWJsZSB0byBkbyB0aGlzPw0KPiANCj4gQXNwZWVkIHBlb3BsZTogc2FtZSBxdWVyeSBoZXJl
Lg0KPiANCg0KSXQgc2VlbXMgbm8gcHJvYmxlbSBvbiBhc3QyNjAwLWZwZ2EuZHRzIGFuZCBhc3Qy
NjAwLXNsdC5kdHMgd2l0aA0KdGhpcyBwYXRjaC4NCg0KVGhhbmtzLA0KSmFja3kNCg0K

