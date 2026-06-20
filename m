Return-Path: <openbmc+bounces-2115-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD19CD4F26
	for <openbmc@archiver.kernel.org>; Sun, 21 Jun 2026 00:46:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gjXh26gYbz2yb9;
	Sun, 21 Jun 2026 10:46:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:d405::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781950599;
	cv=pass; b=WtZJyH6EY/5c8XsRMgVQVnUGjjuPhkS7PCS1hufabH8eOMqgfp/u1Np0tgV9NEjJESZuBC0VjHnrDsPKtXy+v4b1X2MCYc/QCLAea7sepsuii2qhD9Ih6rafx6ZiEI3gXNkczNj2zHfC2Wt4dbGX02pXGj9iccR/OjX13dYzjohAP218ZISmlpPlCLGH6K54Mc3RFic/IdJEuhNh7AvRnDY9EiAJggm+ESlnN0IJq1w6XFska8k0/fRfgKXDI+MC8TJjnHlCiQ2jlBehjpruanH3F4bi2MxA3NX9kgbNnrOMWFpmRLzl3QN8ja7NNvEw+8c6zxmV7J8RxBre1FrV/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781950599; c=relaxed/relaxed;
	bh=QMZ+tvEW0rNdfwJLFLFbZHGMjkFTNq8RAiV+EfAU5no=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bR1sMh4uuRKTSn6TwLhUGgz07xFciucqJmw3tTt+uRFDBBXr823UWL5YPT5dgD4OnVJRyMdHIgHS7V7LgBdr4/Xgp/ZS4IX2Br2ejZdXI5N73XxUMv2fOFgSR8UmArWmg2osLtcnbeadVdpHaMA/mU15jjTfjZjYTKz1xqHMUp2TDyKZC1fD5VsDQQhb3Xztx2Lk1i0gMQh5JlMW63aLwXhRAZ4McCzideJSf5zxL/Q7kGAFGLHBdBq+UcrJFDjHmOsBvb4J6p+6AsC33KkQgLKI5G2R15g1RoDMx7gaJ3qHR0CuBPLGmVuZgRxXUvHZq3DvL2eQfzWiiUVzeUEdjw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com; dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=gLCTtcA6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:d405::1; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=zhangyj2007@outlook.com; receiver=lists.ozlabs.org) smtp.mailfrom=outlook.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=gLCTtcA6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:d405::1; helo=tyvp286cu001.outbound.protection.outlook.com; envelope-from=zhangyj2007@outlook.com; receiver=lists.ozlabs.org)
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn190110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:d405::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gj9Nj1M4gz2xwL
	for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2026 20:16:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZddlvzFJKSwifVf2MWaS7Bv2ERY15J2Et3lzs2bNyjbBCnKpkxBeERiuaIcK6mopy57GmhvulSOw71ZMfI9Jtv75ApoOhcSZP6yMVFE1aeaioKmbGp6efEQHfJ9QBYvOasXi/r9giYPseV90iwKA1L86URDU9ppW3eKSDzOMfcJVpEnuEqfN/qrgS4dvKCs6vfnG/5Sw29M9wqS3NhmcPcz0YhAtvnjDH7W3lgzOid8ehiRGLp8ue1JpAb6Si1RRZu8Pb6+msMpdd7S3CJ2dWfzEWdHAN/9Q8/2idn6gYLqkSLLVf1Js3j+mNJt+q+XjYUSSenNkBOnrkoDeHXtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMZ+tvEW0rNdfwJLFLFbZHGMjkFTNq8RAiV+EfAU5no=;
 b=LEjskNzgChZ+7ejRTYier8hG203at2B1y+dZnZ3/4qvz4oWCQV69OCsMH5ptRDOvIEa0DNqUgIoXtuQOfq2GLZOSjdW5YRbALTM+gIHGIvmwqhb9s8Y6ZehIK6gJYF4iA5/fsmdYNFYeLKnKjqK2DR8T7V5EA0tykGLvTsyRcfvfrasT/hQfTScqEAR0MOJqFWRyHw7R9vkM64BketG9pYC3sxLZBctD/8/ioiXP4oWHIBMBO9j/kQ/yVpqhQt+l6VA6ON/zLmiupn0Qck+Q4OfvvEI7HvQLYWPkXdU2opAq4zVLdsUcSHx0/g1W0LLKJFeuubNJKumXknxnQuu+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMZ+tvEW0rNdfwJLFLFbZHGMjkFTNq8RAiV+EfAU5no=;
 b=gLCTtcA69/qxPCQCEJpROBV04AOPBbWDvWUxh9/S/m9Di9GrP4C9lhyb2nzFJqHuKurI53zLPhZvfcDez+19LrCtmbxnOmGHL96VMir8GZtCRX/HzWhqDEOr4bqLfHfgHRmxFFOG+j2bTLv+QVODCf7LGxybhVlkfz1L9z5j64zaIUXFe5mDDsBz2scyxmHmdCKhUrXQrA38UUgiMrIOMMYXZQmuaoUX5vDEMEZdvfZgRzDitNcz3LjMU6AzLA6m/W3mWgc8B4u/rrlYcVBxSrUKmmOi/UaIwA8J4CvEZJjstOFpBHoCAVubeJHN6hrlQMS5sEsU8+xAlKBXWLrX6g==
Received: from OS3PR01MB10008.jpnprd01.prod.outlook.com (2603:1096:604:1df::7)
 by OSCPR01MB14887.jpnprd01.prod.outlook.com (2603:1096:604:3aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Sat, 20 Jun
 2026 10:16:13 +0000
Received: from OS3PR01MB10008.jpnprd01.prod.outlook.com
 ([fe80::f8d1:1736:87f0:7f73]) by OS3PR01MB10008.jpnprd01.prod.outlook.com
 ([fe80::f8d1:1736:87f0:7f73%5]) with mapi id 15.21.0139.018; Sat, 20 Jun 2026
 10:16:13 +0000
From: Zhang Yingjie <zhangyj2007@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Zhang Yingjie <zhangyj2007@outlook.com>
Subject: Update BMC version fail-20260620
Thread-Topic: Update BMC version fail-20260620
Thread-Index: AQHdAJk2c9bSi58LN0WDKwl9+7NGIA==
Date: Sat, 20 Jun 2026 10:16:13 +0000
Message-ID:
 <OS3PR01MB100080DB03D4F9074A91726E4B0E12@OS3PR01MB10008.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB10008:EE_|OSCPR01MB14887:EE_
x-ms-office365-filtering-correlation-id: ba468b01-2e98-46dd-813c-08deceb4f510
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|21061999006|41001999006|8060799015|15080799012|15030799006|12121999013|8062599012|5062599005|19110799012|8022599003|31061999003|25010399006|12091999003|3412199025|440099028|26104999009|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?gb2312?B?bEhBeVVvUFYybGw2SmExZXNRTlNQaGF4VTVZZWVYd0tnMm9tZDFwRGUzRWMx?=
 =?gb2312?B?UlZWSUZ3UXM4NXFxSy9yYVlyNUc3cjdzNDJKWGRBUENDMDZCRjRlc29pZUFr?=
 =?gb2312?B?SEVxRENUNkl5UFF6SzZlSFZueXNWSFdiZWpqNjg0emxzRnNRM2JpKy83bTdN?=
 =?gb2312?B?M3orN1oxV2owU2Y0NDhDVmg5K05qdHlrR3Q4R21HR21lR1ZUS2tqekdVcEF3?=
 =?gb2312?B?bGFtZHJ5SElqdTliWURtTTJsNkkycC9ZQjRVSEZwTmtXc0tCdkRIOGd1YUhp?=
 =?gb2312?B?S0JXZXpKUnRha0NVSjU0MzVhTWQ3VHpnQ2U5dmVIRGd1R0kwR1IvUURjcW9P?=
 =?gb2312?B?ZnVkTVVTQmVPMUdpNnA2Z2FjNW05KzJsNk5VVVdSUjBRM3ZMRm42SWhBNkFR?=
 =?gb2312?B?b1Y3SmxHcytWcm5kUlNZUXNqdHEyMjlpTjFhRTBQemJzTFZhTyt3MUVEdTRG?=
 =?gb2312?B?cStkamJEcFJkOEZ6VitiMkw0ZzdEbGplUGhkaTU4QWZaSjhzVWVrZ3FUMU4z?=
 =?gb2312?B?Ym5HOFd2dngzV3o1TDM0cld6YldjaFBTQjc4QnZPNk9LaGhQUk5vaWxOOW9N?=
 =?gb2312?B?bDFadE5LN0hwak5iUEcyN3NOdVNQRjJZNWhIRnlqV05CS3E1bUtzam0zRllP?=
 =?gb2312?B?blRhL3QxOUxuMm9CbjhrMUh2NmV0bTZRTjNSVDlCazdmanN1U2FyQnI0VlBY?=
 =?gb2312?B?ak1MTHIvZ1BxK1JkdXNSeE9lYTFQL3NPWThxWURSYUptNk9vUEVSdTBGZGJ4?=
 =?gb2312?B?djFvcXBpYTNOL3RYYUxWaXZYWU91enFRdThqTms2czNMYzZwUEhLK252U2ta?=
 =?gb2312?B?OTJLUWhvVkxwTktFZGxJcVZLZWY1QUk4a1p2L3E3dkNxeEVoblhUbExPS3RQ?=
 =?gb2312?B?cUl5SVdrTlRxMWN5VGtQVEdYbHhMOWZHUHBvK1M2dVgwalJSekMxSkh5TENE?=
 =?gb2312?B?eG5teEcxbnNQaUNiU0t5eWsralMzS29FNVNBOFBEN3FKV3U4RVo3aDdJemI4?=
 =?gb2312?B?bEU5QlcxL1BqYk4zaU0xa3p0cnpLSVVpWU5xUlF3Zno3dGQ1NEVxZGlOZGhz?=
 =?gb2312?B?NGUyUjIrK1lTc2k2REtoeUVTdlVzTVUyb0dMRWlESWZ3MEQwUDh4N0JIMVZ2?=
 =?gb2312?B?VlVWMEZCQzhMdjRoM3piY3RieWZKMjIzR3E4ODA0bnloMmwxdEJ1WFBlVXIw?=
 =?gb2312?B?Y3R3VEgrdGJreWIwYWl4cDhSL1FUWk9BeFVQWFNOakE4UStsNlpaQ1VFYWpq?=
 =?gb2312?B?UEYxbDA0VmFtMDhzd2NQNjBrNkR4bm9YMWVja0lIV3F1eVp0MHhDcEtFa0h3?=
 =?gb2312?B?blp4TFY1dFNUdE4yZUJ6VjBHSlpiMVlTZFI3dTZSQndZT1R6UElWZHg3MUt4?=
 =?gb2312?B?NVdPOGFManVNK1N4MHl5NkNNSTc1NkVsY3JqZnljc2lkb1ZyeTZTS0FJdzA3?=
 =?gb2312?B?VTdIcVJlSGN5Tm1vZGovNno4S3NROG5IV3JCSkRQem5mcWxXWWVQUUtUK29Z?=
 =?gb2312?Q?mTGu7LRTgm736/sZ0l7AtQM//pV?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?c0dzTkdFYnpSN0lwSTVwREhHbG1PVnZEc3FyRHp3NXZRUVFDNFg5dUZxc21q?=
 =?gb2312?B?QlN0c1MydUR6RUJRdCsrU3lyWDMvcEN5bndJK3dzTzV0VWhkcU9mc0ErVm9q?=
 =?gb2312?B?MWFPWHUvb1RPakpPYXh0NStUMnRYY2EwNThqY1FoMTVWUVNjZEd3RWl3U09N?=
 =?gb2312?B?cVFNNVl3alNJdWpod0pPYlRudVJPT29qSXhqM1Z0Y0o3K0NLMWFkOE1oaW1w?=
 =?gb2312?B?T2hUSTVOeWtTbkFrejU3SmhINHgyQW5wMnZoOGVLSk94N1JWaTN1eUZOMU5y?=
 =?gb2312?B?U1g0WEFlYkNhUHpQdS9IQXVTdXkvSWlHRUFKMzFjWDRRMUhaRUduaVBXZ1p0?=
 =?gb2312?B?dFRIRW9veGR3Y0NTTSs0ZjNEZGc0YTA5Z2tDb2pmQmZaWVZnOUZFVVAzMDhn?=
 =?gb2312?B?ZnVKQnVodzVxUzFITVZMaVlwTk82V3ZlZmc4NzZZMmFKQWdzekdFVStnV04y?=
 =?gb2312?B?eXkrN0M0VjVNMUhkNjBPK2VRUGZDbThWWjRhU3d4Rm83TFVGL0FiSVp2cmhV?=
 =?gb2312?B?SDFETG5VOXpUb2tWOEFDWVI5blltTU1mOUdWblpqRjVtZkdEVm9TNzV6V0xm?=
 =?gb2312?B?bU5aT2Z0VjFXYTZPSUwxVUV5b0tLdlI1aGpzRWdFcUJKYlBNNUVMdlU4L1Uv?=
 =?gb2312?B?bjg3MTVnT25DdVd2eWxtUnlKeVozdHRlU0hoTUVsSEpBdlJuemdFNHFPR09D?=
 =?gb2312?B?VFlLUDVXYkh6VE1VV1VrZlhmUEI0NlFoYTlaOG1HYk54TkRtKzdDb21FaDg5?=
 =?gb2312?B?Z1VzdTRiWmVtalRud3d3S1drc2NUemdFNzdnYjh5TmE2Zy9mQzdTZmdQdlIz?=
 =?gb2312?B?Zm1mUVdZSUVjOGgyejVLdDcrY2w0QmpIbjZJajVwdUJoQm8yUldVK2JFVDFl?=
 =?gb2312?B?Sk9yTm12WmF2QmV5VDR4dEsxZmJxbzRZcEVqWDl5WEF5ajArNVYrNTZGT0dH?=
 =?gb2312?B?cm9VbmVHQzNUM0tCU01NTFg4M1ZzT245YjJUc0Q5RlJRN2VST25kSCtFNkp6?=
 =?gb2312?B?VnpTSFlKS1VlTFM3RHZIZVVjbUVqMk82NTZDLzMwczZjOU1nNlV2QXlwVG5I?=
 =?gb2312?B?V0FtU0MvUEVlSW5HMm80WVhlL090VGoxWjhubEdaS2lNVHlFanFodmRweTlN?=
 =?gb2312?B?S2txL3dkQVRLdWhGNzlHT0RsOW1iVkZaUVNOMjk2TURKK3U3VXA3VFpySnBN?=
 =?gb2312?B?THBJQnk2Z0luREN6UGpnT1Z0OWRmZFR3S0lMNldkeGJ0TEowYUdRL3ZKNkgz?=
 =?gb2312?B?OHVjRDNTTDNLYy95NGpIUU5ZUTRTbitCVklnZlVzbHRvNkx6TksxVmsweUNH?=
 =?gb2312?B?V2JEMnRKK1FhVDNzbmVMV2ZlT244bkFHSmVudXFhWUN4NXNsam1laWV0RmQx?=
 =?gb2312?B?T0paazg5SkQ3cHpLVEk0akhReGdQWDViU2lVajNDSVVHZklUYlhTclRDWUg1?=
 =?gb2312?B?TWFBajJQRkN1UmV3eXZjOSsvT0pGSDErWlprTlN0VSt0YmY3blg1Q1JVNEhN?=
 =?gb2312?B?cFZZT2NuaW05azVEdVhMUHR1S09CcGczNHowWUltUlE3WGN6OHJwN0E2ZG9L?=
 =?gb2312?B?ZGk3VWZDQjZzbDM3S0tSY2tPR2pZc3k2Y2JUMWlZQ3FwUVRtTTFjVWlMNVlE?=
 =?gb2312?B?dlRQcGs0VGhXc3ozY29CeEJESGtxWnRBTUxWeWpjaG5YWjNVWXA0OFpCMkQv?=
 =?gb2312?B?cjR2TEF0RGs1VGJhNlVYNmszSVp4VTBoaU40K2xZb3dtNmxXcEYzV3pzQzNQ?=
 =?gb2312?B?RlhoNDJTYlN4bTIwb3p6ekhGNVIyTWd3WGkydmhTVlRFUjhjRXBXbFBLRlhh?=
 =?gb2312?B?MTB2OW4wcUVqZEU0VTdyOWVQSWcyUDY4TStGQ293ODBpVDRyUmZHRHVyTkhs?=
 =?gb2312?B?blVpaEUrSkd3QkR3c2g5ajc4elBDTFFGN0pMSFp4RlVXWlFpSkFIZ3dtVzd5?=
 =?gb2312?Q?O8fd4rTp6Cvc9mYqhUOIsKSTej6YxbUs?=
Content-Type: multipart/alternative;
	boundary="_000_OS3PR01MB100080DB03D4F9074A91726E4B0E12OS3PR01MB10008jp_"
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10008.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ba468b01-2e98-46dd-813c-08deceb4f510
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 10:16:13.3629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14887

--_000_OS3PR01MB100080DB03D4F9074A91726E4B0E12OS3PR01MB10008jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGmjrEFsbKO6DQoNCiAgICAgICAgSSB1c2VyIEFtZCBTZXJ2ZXIsYm10IHVwZGF0ZSB0aGlzIGRl
dmljZSBibWMgdmVyaW9uIGZhaWwgYXQgQk1DIHdlYix0aGUgb2xkIHZlcnNpb24gaXMgVjYuNDAu
Mywgd2FudCB0byB1cGRhdGUgbmV3IHZlcnNpb24gaXMgVjguMDYuMS4NCiAgICAgICAgYXQgdXBk
YXRlIGNhbiBjaG9zZSBCTUMgaW1hZ2WjrG9ubHkgdXBkYXRlIG1haW4gQk1DIGltYWdlLG9ubHkg
YmFja3VwIEJNQyBpbWFnZSxvciBtYWluIEJNQyBpbWFnZSBhbmQgYmFjayBCTUMgaW1hZ2UsIGJ1
dCBjaG9zZSB1cGRhdGUgYmFjayBCTUMgaW1hZ2Ugb3IgbWFpbiBCTUMgaW1hZ2UgYW5kIGJhY2sg
Qk1DIGltYWdlIHRvIGlzc3VlLg0KICAgICAgICBJIHNlZSB0aGUgQk1DIGNvbnNvbGUgbG9nLHJl
Y29yZHMgc2hvd2luZyAiRW52aXJvbm1lbnQyIGlzIGNvcnJ1cHRlZCIgY2FuIGFsbCBiZSBvYnNl
cnZlZC5XaGVuIHVwZGF0aW5nIGFuZCB1cGdyYWRpbmcgdGhlIHByaW1hcnkgQk1DLCB0aGVyZSB3
YXMgbm8gbG9nIGVudHJ5IHNob3dpbmcgdGhhdCBFbnZpcm9ubWVudDIgaXMgY29ycnVwdGVkLg0K
ICAgICAgICBJIHRoaW5rIHRoZXJlIG1pZ2h0IGJlIGFuIGVycm9yIGluIHRoZSBzeXN0ZW0gc3Rv
cmFnZSBibG9jay5JIGhhdmUgdGhlIGNvbXBsZXRlIHNlcmlhbCBwb3J0IGxvZyBmaWxlIGFuZCBs
b29rIGZvcndhcmQgdG8gZGlzY3Vzc2luZyB0aGlzIGlzc3VlIHdpdGggeW91Lg0KDQpzb210aGlu
ZyBsb2c6DQppbml0IHJjIDogc3RhcnQgL2V0Yy9yYzguZC9TNTFzdG9wZ2MuDQppbml0IHJjIDog
c3RhcnQgL2V0Yy9yYzguZC9TNTJpbml0Y29tcGxldGUuDQpbICA2NzguMDExMDY1XSBjMSBbIFQ2
MTE4XVtleGVdIGV4ZSAoNjExOCk6IGRyb3BfY2FjaGVzOiAzDQpbICA2NzguMTUyNTU2XSBjMCBb
IFQ2MTIyXVtybW1vZF0gVW5sb2FkaW5nIFVTQiBEZXZpY2VzDQpbICA2NzguMTU4MTc4XSBjMCBb
IFQxNzU0XVtVU0JEUENdICBbS0VSTldBUk5JTkddIFsvaG9tZS9ndW9jaGVuL1dvcmtzcGFjZS9y
NjI1MGEwMTExL1Byb2plY3QvZzUwX3Nhbmdmb3JfY2tzYi9kZXZlbG9wbWVudC9CdWlsZC8uYnVp
bGQvdXNiZS0xMy4xLjAuMC4wLXNyYy9kYXRhL2xpbnV4LmM6MTUyXVRlcm1pbmF0aW5nIEtlcm5l
bCBUaHJlYWQNCnJtbW9kOiByZW1vdmUgJ2hlbHBlcic6IFJlc291cmNlIHRlbXBvcmFyaWx5IHVu
YXZhaWxhYmxlDQoxMzA1NiswIHJlY29yZHMgaW4NCjEzMDU2KzAgcmVjb3JkcyBvdXQNCjY2ODQ2
NzIgYnl0ZXMgKDYuNE1CKSBjb3BpZWQsIDEuNzEwODUxIHNlY29uZHMsIDMuN01CL3MNClsxOTM4
IDogMTkzOCBJTkZPXVt1dGlscy5jOjQ0ODVdDQogU3dpdGNoaW5nIHJvb3QgdG8gUkFNLi4uLi4N
ClsxOTM4IDogMTkzOCBJTkZPXVtDUkZTVFIuYzoxNjZdUm9vdCBGUyBNVEQgQmxrIGlzIC9kZXYv
bXRkYmxvY2szDQpbMTkzOCA6IDE5MzggSU5GT11bQ1JGU1RSLmM6Mzc3XUNvcHlpbmcgUm9vdCBG
UyB0byAvaW5pdHJkLi4uDQpbMTkzOCA6IDE5MzggSU5GT11bQ1JGU1RSLmM6Mzg1XURvbmUNCkZp
bGUgc3lzdGVtIC8NClsxOTM4IDogMTkzOCBJTkZPXVtDUkZTVFIuYzo0MDVdTW91bnQgZGV2bmFt
ZSAvZGV2L210ZGJsb2NrNyBmaWxlIHN5c3RlbSBqZmZzMg0KWzE5MzggOiAxOTM4IElORk9dW0NS
RlNUUi5jOjQwOF1Db3B5aW5nIC9kYXRhIHRvIC9pbml0cmQuLi4NClsxOTM4IDogMTkzOCBJTkZP
XVtDUkZTVFIuYzo0MTddRG9uZQ0KWzE5MzggOiAxOTM4IElORk9dW0NSRlNUUi5jOjQwNV1Nb3Vu
dCBkZXZuYW1lIC9kZXYvbXRkYmxvY2s4IGZpbGUgc3lzdGVtIGpmZnMyDQpbMTkzOCA6IDE5Mzgg
SU5GT11bQ1JGU1RSLmM6NDA4XUNvcHlpbmcgL3Jhc3JlYyB0byAvaW5pdHJkLi4uDQpjcDogY2Fu
J3Qgc3RhdCAnL3RtcC9tbnQvLyonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQpbMTkzOCA6
IDE5MzggSU5GT11bQ1JGU1RSLmM6NDE3XURvbmUNClsxOTM4IDogMTkzOCBJTkZPXVtDUkZTVFIu
Yzo0MDVdTW91bnQgZGV2bmFtZSAvZGV2L3JhbTMgZmlsZSBzeXN0ZW0gc3F1YXNoZnMNClsxOTM4
IDogMTkzOCBJTkZPXVtDUkZTVFIuYzo0MDhdQ29weWluZyAvdXNyL2xvY2FsL3d3dyB0byAvaW5p
dHJkLi4uDQpbMTkzOCA6IDE5MzggSU5GT11bQ1JGU1RSLmM6NDE3XURvbmUNClsgIDcwMS43NzIw
MTNdIGMxIFsgVDYxMzddW3NoXSBzaCAoNjEzNyk6IGRyb3BfY2FjaGVzOiAzDQpbMTkzOCA6IDE5
MzggSU5GT11bQ1JGU1RSLmM6NTYzXVVubW91bnRpbmcgL29sZHJvb3QvdXNyL2xvY2FsL3d3dy8N
ClsxOTM4IDogMTkzOCBJTkZPXVt1dGlscy5jOjQ0OTFdDQogU3dpdGNoZWQgcm9vdCBzdWNjZXNz
ZnVsbHkuLi4uLg0KU2VjdXJlIFBvcnQgaXMgZW5hYmxlZCBmb3IgW3NzaF0gd2l0aCAyMg0KWzE5
MzggOiAxOTM4IElORk9dW3V0aWxzLmM6MTY4Ml1WZXJpZnlJbWFnZQ0KU2lnbmF0dXJlIHZlcmlm
aWNhdGlvbiBzdWNjZXNzZnVsDQpbMTkzOCA6IDE5MzggQ1JJVElDQUxdW3V0aWxzLmM6MTA4MF1G
V19SRUxFQVNFSUQ9UlI5DQpbMTkzOCA6IDE5MzggQ1JJVElDQUxdW3V0aWxzLmM6MTA4MV1GV19D
T0RFQkFTRVZFUlNJT049NS5YDQpbMTkzOCA6IDE5MzggQ1JJVElDQUxdW3V0aWxzLmM6MTA4Ml1G
V19ERVNDPURIMl9DMDFfMTM0XzBTMDVfVTAxDQpbMTkzOCA6IDE5MzggQ1JJVElDQUxdW3V0aWxz
LmM6MTg3Ml1uZXcgaW1nIG5hbWUgPSBhc3QyNjAwZQ0KWzE5MzggOiAxOTM4IENSSVRJQ0FMXVt1
dGlscy5jOjE4NzNdbmV3IGltZyB2ZXJzaW9uID0gOC4wNi4wMDAwMDENClsxOTM4IDogMTkzOCBD
UklUSUNBTF1bdXRpbHMuYzoxODc0XW5ldyBpbWcgc3RhcnQgPSAwDQpbMTkzOCA6IDE5MzggQ1JJ
VElDQUxdW3V0aWxzLmM6MTg3NV1uZXcgaW1nIHNpemUgPSA0MDAwMDAwDQpbMTkzOCA6IDE5Mzgg
Q1JJVElDQUxdW3V0aWxzLmM6MTg3Nl1uZXcgcHJvZHVjdCBuYW1lID0gREgyX0MwMQ0KWzE5Mzgg
OiAxOTM4IENSSVRJQ0FMXVt1dGlscy5jOjE4Nzhdb2xkIGltZyBuYW1lID0gYXN0MjYwMGUNClsx
OTM4IDogMTkzOCBDUklUSUNBTF1bdXRpbHMuYzoxODc5XW9sZCBpbWcgdmVyc2lvbiA9IDYuNDAu
MDAwMDAzDQpbMTkzOCA6IDE5MzggQ1JJVElDQUxdW3V0aWxzLmM6MTg4MF1vbGQgaW1nIHN0YXJ0
ID0gMA0KWzE5MzggOiAxOTM4IENSSVRJQ0FMXVt1dGlscy5jOjE4ODFdb2xkIGltZyBzaXplID0g
NDAwMDAwMA0KWzE5MzggOiAxOTM4IENSSVRJQ0FMXVt1dGlscy5jOjE4ODJdb2xkIHByb2R1Y3Qg
bmFtZSA9IERIMl9DMDENCkZVTEwgRmlybXdhcmUgVXBncmFkZQ0KWzE5MzggOiAxOTM4IElORk9d
W3ViX2Vudi5jOjU4XUluaXRFTlY6IHUtYm9vdCBlbnZpcm9ubWVudCB2YXJpYWJsZXMsIEVudk9m
ZnNldCA6IDB4NDBmMDAwMA0KDQogRW52aXJvbm1lbnQyIGlzIGNvcnJ1cHRlZA0KIEVudmlyb25t
ZW50MiBpcyBjb3JydXB0ZWQNCiBFbnZpcm9ubWVudDIgaXMgY29ycnVwdGVkDQogRW52aXJvbm1l
bnQyIGlzIGNvcnJ1cHRlZA0KIEVudmlyb25tZW50MiBpcyBjb3JydXB0ZWQNCls2MTY4IDogNjE2
OCBJTkZPXVtQcmVzZXJ2ZUNvbmYuYzoxNTAyXUVudGVyaW5nIFByZXNlcnZlIENvbmZpZ3VyYXRp
b24gLi4uICEhIQ0KWzYxNjggOiA2MTY4IElORk9dW1ByZXNlcnZlQ29uZi5jOjIxODddUHJlc2Vy
dmluZyBCSU9TIGZpbGVzIC0tDQpbIDEwNjIuNzg1NTI4XSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNm
Z10gdHJpZ2dlciBsZXZlbHMgKHNpemUgMTk4NCBLaUIsIGJsb2NrIHNpemUgNjQgS2lCLCAzMSBi
bG9ja3MpDQpbIDEwNjIuNzk1NDY3XSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gQmxvY2tzIHJl
cXVpcmVkIHRvIGFsbG93IGRlbGV0aW9uOiAgICAyICgxMjggS2lCKQ0KWyAxMDYyLjgwNDMxNV0g
YzAgWyBUNjE2OF1bcHJlc2VydmVjZmddIEJsb2NrcyByZXF1aXJlZCB0byBhbGxvdyB3cml0ZXM6
ICAgICAgMyAoMTkyIEtpQikNClsgMTA2Mi44MTMxNjBdIGMwIFsgVDYxNjhdW3ByZXNlcnZlY2Zn
XSBCbG9ja3MgcmVxdWlyZWQgdG8gcXVpZXNjZSBHQyB0aHJlYWQ6IDUgKDMyMCBLaUIpDQpbIDEw
NjIuODIyMDAzXSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gQmxvY2tzIHJlcXVpcmVkIHRvIGFs
bG93IEdDIG1lcmdlczogICAyICgxMjggS2lCKQ0KWyAxMDYyLjgzMDg0N10gYzAgWyBUNjE2OF1b
cHJlc2VydmVjZmddIEJsb2NrcyByZXF1aXJlZCB0byBHQyBiYWQgYmxvY2tzOiAgICAgMCAoMCBL
aUIpDQpbIDEwNjIuODM5NDk1XSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gQW1vdW50IG9mIGRp
cnR5IHNwYWNlIHJlcXVpcmVkIHRvIEdDOiA4NTg1MiBieXRlcw0KWyAxMDYyLjg0ODMzMV0gYzAg
WyBUNjE2OF1bcHJlc2VydmVjZmddIFZlcnkgZGlydHkgYmxvY2tzIGJlZm9yZSBHQyB0cmlnZ2Vy
ZWQ6IDUwDQpbIDEwNjMuMzU2MjQ3XSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gdHJpZ2dlciBs
ZXZlbHMgKHNpemUgMTk4NCBLaUIsIGJsb2NrIHNpemUgNjQgS2lCLCAzMSBibG9ja3MpDQpbIDEw
NjMuMzY2MTk0XSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gQmxvY2tzIHJlcXVpcmVkIHRvIGFs
bG93IGRlbGV0aW9uOiAgICAyICgxMjggS2lCKQ0KWyAxMDYzLjM3NTA1NV0gYzAgWyBUNjE2OF1b
cHJlc2VydmVjZmddIEJsb2NrcyByZXF1aXJlZCB0byBhbGxvdyB3cml0ZXM6ICAgICAgMyAoMTky
IEtpQikNClsgMTA2My4zODM5MDRdIGMwIFsgVDYxNjhdW3ByZXNlcnZlY2ZnXSBCbG9ja3MgcmVx
dWlyZWQgdG8gcXVpZXNjZSBHQyB0aHJlYWQ6IDUgKDMyMCBLaUIpDQpbIDEwNjMuMzkyNzUyXSBj
MCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gQmxvY2tzIHJlcXVpcmVkIHRvIGFsbG93IEdDIG1lcmdl
czogICAyICgxMjggS2lCKQ0KWyAxMDYzLjQwMTYwMF0gYzAgWyBUNjE2OF1bcHJlc2VydmVjZmdd
IEJsb2NrcyByZXF1aXJlZCB0byBHQyBiYWQgYmxvY2tzOiAgICAgMCAoMCBLaUIpDQpbIDEwNjMu
NDEwMjUxXSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gQW1vdW50IG9mIGRpcnR5IHNwYWNlIHJl
cXVpcmVkIHRvIEdDOiA4NTg1MiBieXRlcw0KWyAxMDYzLjQxOTA5NF0gYzAgWyBUNjE2OF1bcHJl
c2VydmVjZmddIFZlcnkgZGlydHkgYmxvY2tzIGJlZm9yZSBHQyB0cmlnZ2VyZWQ6IDUwDQpbNjE2
OCA6IDYxNjggQ1JJVElDQUxdW3V0aWwuYzo0MzhdQ2Fubm90IG9wZW4gZGlyZWN0b3J5ICcvbW50
L2Z3dXBkYXRlL2Jpb3Njb25mJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KWyAxMDYzLjkz
MDE3NV0gYzAgWyBUNjE2OF1bcHJlc2VydmVjZmddIHRyaWdnZXIgbGV2ZWxzIChzaXplIDE5ODQg
S2lCLCBibG9jayBzaXplIDY0IEtpQiwgMzEgYmxvY2tzKQ0KWyAxMDYzLjk0MDE0NF0gYzAgWyBU
NjE2OF1bcHJlc2VydmVjZmddIEJsb2NrcyByZXF1aXJlZCB0byBhbGxvdyBkZWxldGlvbjogICAg
MiAoMTI4IEtpQikNClsgMTA2My45NDg5OTRdIGMwIFsgVDYxNjhdW3ByZXNlcnZlY2ZnXSBCbG9j
a3MgcmVxdWlyZWQgdG8gYWxsb3cgd3JpdGVzOiAgICAgIDMgKDE5MiBLaUIpDQpbIDEwNjMuOTU3
ODMxXSBjMCBbIFQ2MTY4XVtwcmVzZXJ2ZWNmZ10gQmxvY2tzIHJlcXVpcmVkIHRvIHF1aWVzY2Ug
R0MgdGhyZWFkOiA1ICgzMjAgS2lCKQ0KWyAxMDYzLjk2NjY3NV0gYzAgWyBUNjE2OF1bcHJlc2Vy
dmVjZmddIEJsb2NrcyByZXF1aXJlZCB0byBhbGxvdyBHQyBtZXJnZXM6ICAgMiAoMTI4IEtpQikN
ClsgMTA2My45NzU1MjVdIGMwIFsgVDYxNjhdW3ByZXNlcnZlY2ZnXSBCbG9ja3MgcmVxdWlyZWQg
dG8gR0MgYmFkIGJsb2NrczogICAgIDAgKDAgS2lCKQ0KWyAxMDYzLjk4NDE3N10gYzAgWyBUNjE2
OF1bcHJlc2VydmVjZmddIEFtb3VudCBvZiBkaXJ0eSBzcGFjZSByZXF1aXJlZCB0byBHQzogODU4
NTIgYnl0ZXMNClsgMTA2My45OTMwMjVdIGMwIFsgVDYxNjhdW3ByZXNlcnZlY2ZnXSBWZXJ5IGRp
cnR5IGJsb2NrcyBiZWZvcmUgR0MgdHJpZ2dlcmVkOiA1MA0KWzYxNjggOiA2MTY4IENSSVRJQ0FM
XVt1dGlsLmM6NDM4XUNhbm5vdCBvcGVuIGRpcmVjdG9yeSAnL21udC9md3VwZGF0ZS9iaW9zY29u
Zic6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCls2MTY4IDogNjE2OCBDUklUSUNBTF1bdXRp
bC5jOjQzOF1DYW5ub3Qgb3BlbiBkaXJlY3RvcnkgJy9tbnQvZnd1cGRhdGUvb2xkY29uZl9hY3Rp
dmUvcmVkZmlzaC9iaW9zJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KWzE5MzggOiAxOTM4
IElORk9dW3V0aWxzLmM6Mzk5NV1Eb0ZsYXNoIFNVQ0NFU1MNClsxOTM4IDogMTkzOCBJTkZPXVtt
YWluLmM6MTUzOV1zdGFydCBmbGFzaCB3aXRob3V0IG9wdGlvbnMNClsxOTM4IDogMTkzOCBJTkZP
XVttYWluLmM6MTA5OF1Qb3N0Rmxhc2ggSW52b2tlZCBSZWJvb3RTdGF0ZTogMSBmbGFzaGVkaW1h
Z2U6IDINCk5vIGlwdGFibGVzIGNvbmYgZm91bmQNClJlc3RhcnRpbmcgc3lzdGVtLi4uDQpbIDEw
NzQuMTg5MjgyXSBjMCBbIFQxOTM4XVtmbGFzaGVyXSByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVt
DQpbIDEwNzQuMTk1NDQ3XSBjMSBbICAgIEMxXVtzd2FwcGVyLzFdIChCTUNfTUVNX0RVTVApOiBj
cHUtLS0gMHgxLS0tLQ0KWyAxMDc0LjIwMjU4MF0gYzEgWyAgICBDMV1bc3dhcHBlci8xXSAoQk1D
X01FTV9EVU1QKTogY3B1LS0tIDB4MS0tLS0gY3Jhc2hfbm90ZV9zYXZlIGNvbXBsZXRlDQpbIDEw
NzQuMjExOTI5XSBjMCBbIFQxOTM4XVtmbGFzaGVyXSBhc3BlZWRfd2R0X2VuYWJsZSBjdHJsMTog
WzNdDQpbIDEwNzQuMjE4NTM3XSBjMCBbIFQxOTM4XVtmbGFzaGVyXSBhc3BlZWRfd2R0X2VuYWJs
ZSBjdHJsMjogWzNdDQpbIDEwNzQuMjI1MTQxXSBjMCBbIFQxOTM4XVtmbGFzaGVyXSBhc3BlZWRf
d2R0X3Jlc3RhcnQNCkJQMGMwMA0KDQoNCllpbmdqaWUNCiBaaGFuZw0KTW9iaWxlDQogbnVtYmVy
o7orODYgMTU1MDc4NTM2MzANCkUtbWFpbA0KIGFkZHJlc3M6IHpoYW5neWoyMDA3QG91dGxvb2su
Y29tDQoNCg0KDQo=

--_000_OS3PR01MB100080DB03D4F9074A91726E4B0E12OS3PR01MB10008jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre class=3D"elementToProof"><div class=3D"elementToProof" style=3D"font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><code>Hi=A3=ACAll=A3=BA=
=0A=
=0A=
	I user Amd Server,bmt update this device bmc verion fail at BMC web,the ol=
d version is V6.40.3, want to update new version is V8.06.1.	=0A=
	at update can chose BMC image=A3=AConly update main BMC image,only backup =
BMC image,or main BMC image and back BMC image, but chose update back BMC i=
mage or main BMC image and back BMC image to issue.=0A=
	I see the BMC console log,records showing &quot;Environment2 is corrupted&=
quot; can all be observed.When updating and upgrading the primary BMC, ther=
e was no log entry showing that Environment2 is corrupted.=0A=
	I think there might be an error in the system storage block.I have the com=
plete serial port log file and look forward to discussing this issue with y=
ou.=0A=
=0A=
somthing log:=0A=
init rc : start /etc/rc8.d/S51stopgc.=0A=
init rc : start /etc/rc8.d/S52initcomplete.=0A=
[ &nbsp;678.011065] c1 [ T6118][exe] exe (6118): drop_caches: 3=0A=
[ &nbsp;678.152556] c0 [ T6122][rmmod] Unloading USB Devices=0A=
[ &nbsp;678.158178] c0 [ T1754][USBDPC] &nbsp;[KERNWARNING] [/home/guochen/=
Workspace/r6250a0111/Project/g50_sangfor_cksb/development/Build/.build/usbe=
-13.1.0.0.0-src/data/linux.c:152]Terminating Kernel Thread=0A=
rmmod: remove 'helper': Resource temporarily unavailable=0A=
13056+0 records in=0A=
13056+0 records out=0A=
6684672 bytes (6.4MB) copied, 1.710851 seconds, 3.7MB/s=0A=
[1938 : 1938 INFO][utils.c:4485]=0A=
 Switching root to RAM.....=0A=
[1938 : 1938 INFO][CRFSTR.c:166]Root FS MTD Blk is /dev/mtdblock3=0A=
[1938 : 1938 INFO][CRFSTR.c:377]Copying Root FS to /initrd...=0A=
[1938 : 1938 INFO][CRFSTR.c:385]Done=0A=
File system /=0A=
[1938 : 1938 INFO][CRFSTR.c:405]Mount devname /dev/mtdblock7 file system jf=
fs2 =0A=
[1938 : 1938 INFO][CRFSTR.c:408]Copying /data to /initrd...=0A=
[1938 : 1938 INFO][CRFSTR.c:417]Done=0A=
[1938 : 1938 INFO][CRFSTR.c:405]Mount devname /dev/mtdblock8 file system jf=
fs2 =0A=
[1938 : 1938 INFO][CRFSTR.c:408]Copying /rasrec to /initrd...=0A=
cp: can't stat '/tmp/mnt//*': No such file or directory=0A=
[1938 : 1938 INFO][CRFSTR.c:417]Done=0A=
[1938 : 1938 INFO][CRFSTR.c:405]Mount devname /dev/ram3 file system squashf=
s =0A=
[1938 : 1938 INFO][CRFSTR.c:408]Copying /usr/local/www to /initrd...=0A=
[1938 : 1938 INFO][CRFSTR.c:417]Done=0A=
[ &nbsp;701.772013] c1 [ T6137][sh] sh (6137): drop_caches: 3=0A=
[1938 : 1938 INFO][CRFSTR.c:563]Unmounting /oldroot/usr/local/www/ =0A=
[1938 : 1938 INFO][utils.c:4491]=0A=
 Switched root successfully.....=0A=
Secure Port is enabled for [ssh] with 22=0A=
[1938 : 1938 INFO][utils.c:1682]VerifyImage=0A=
Signature verification successful =0A=
[1938 : 1938 CRITICAL][utils.c:1080]FW_RELEASEID=3DRR9=0A=
[1938 : 1938 CRITICAL][utils.c:1081]FW_CODEBASEVERSION=3D5.X=0A=
[1938 : 1938 CRITICAL][utils.c:1082]FW_DESC=3DDH2_C01_134_0S05_U01=0A=
[1938 : 1938 CRITICAL][utils.c:1872]new img name =3D ast2600e=0A=
[1938 : 1938 CRITICAL][utils.c:1873]new img version =3D 8.06.000001=0A=
[1938 : 1938 CRITICAL][utils.c:1874]new img start =3D 0=0A=
[1938 : 1938 CRITICAL][utils.c:1875]new img size =3D 4000000=0A=
[1938 : 1938 CRITICAL][utils.c:1876]new product name =3D DH2_C01=0A=
[1938 : 1938 CRITICAL][utils.c:1878]old img name =3D ast2600e=0A=
[1938 : 1938 CRITICAL][utils.c:1879]old img version =3D 6.40.000003=0A=
[1938 : 1938 CRITICAL][utils.c:1880]old img start =3D 0=0A=
[1938 : 1938 CRITICAL][utils.c:1881]old img size =3D 4000000=0A=
[1938 : 1938 CRITICAL][utils.c:1882]old product name =3D DH2_C01=0A=
FULL Firmware Upgrade=0A=
[1938 : 1938 INFO][ub_env.c:58]InitENV: u-boot environment variables, EnvOf=
fset : 0x40f0000=0A=
=0A=
 Environment2 is corrupted =0A=
 Environment2 is corrupted =0A=
 Environment2 is corrupted =0A=
 Environment2 is corrupted =0A=
 Environment2 is corrupted =0A=
[6168 : 6168 INFO][PreserveConf.c:1502]Entering Preserve Configuration ... =
!!!=0A=
[6168 : 6168 INFO][PreserveConf.c:2187]Preserving BIOS files --=0A=
[ 1062.785528] c0 [ T6168][preservecfg] trigger levels (size 1984 KiB, bloc=
k size 64 KiB, 31 blocks)=0A=
[ 1062.795467] c0 [ T6168][preservecfg] Blocks required to allow deletion: =
&nbsp; &nbsp;2 (128 KiB)=0A=
[ 1062.804315] c0 [ T6168][preservecfg] Blocks required to allow writes: &n=
bsp; &nbsp; &nbsp;3 (192 KiB)=0A=
[ 1062.813160] c0 [ T6168][preservecfg] Blocks required to quiesce GC threa=
d: 5 (320 KiB)=0A=
[ 1062.822003] c0 [ T6168][preservecfg] Blocks required to allow GC merges:=
 &nbsp; 2 (128 KiB)=0A=
[ 1062.830847] c0 [ T6168][preservecfg] Blocks required to GC bad blocks: &=
nbsp; &nbsp; 0 (0 KiB)=0A=
[ 1062.839495] c0 [ T6168][preservecfg] Amount of dirty space required to G=
C: 85852 bytes=0A=
[ 1062.848331] c0 [ T6168][preservecfg] Very dirty blocks before GC trigger=
ed: 50=0A=
[ 1063.356247] c0 [ T6168][preservecfg] trigger levels (size 1984 KiB, bloc=
k size 64 KiB, 31 blocks)=0A=
[ 1063.366194] c0 [ T6168][preservecfg] Blocks required to allow deletion: =
&nbsp; &nbsp;2 (128 KiB)=0A=
[ 1063.375055] c0 [ T6168][preservecfg] Blocks required to allow writes: &n=
bsp; &nbsp; &nbsp;3 (192 KiB)=0A=
[ 1063.383904] c0 [ T6168][preservecfg] Blocks required to quiesce GC threa=
d: 5 (320 KiB)=0A=
[ 1063.392752] c0 [ T6168][preservecfg] Blocks required to allow GC merges:=
 &nbsp; 2 (128 KiB)=0A=
[ 1063.401600] c0 [ T6168][preservecfg] Blocks required to GC bad blocks: &=
nbsp; &nbsp; 0 (0 KiB)=0A=
[ 1063.410251] c0 [ T6168][preservecfg] Amount of dirty space required to G=
C: 85852 bytes=0A=
[ 1063.419094] c0 [ T6168][preservecfg] Very dirty blocks before GC trigger=
ed: 50=0A=
[6168 : 6168 CRITICAL][util.c:438]Cannot open directory '/mnt/fwupdate/bios=
conf': No such file or directory=0A=
[ 1063.930175] c0 [ T6168][preservecfg] trigger levels (size 1984 KiB, bloc=
k size 64 KiB, 31 blocks)=0A=
[ 1063.940144] c0 [ T6168][preservecfg] Blocks required to allow deletion: =
&nbsp; &nbsp;2 (128 KiB)=0A=
[ 1063.948994] c0 [ T6168][preservecfg] Blocks required to allow writes: &n=
bsp; &nbsp; &nbsp;3 (192 KiB)=0A=
[ 1063.957831] c0 [ T6168][preservecfg] Blocks required to quiesce GC threa=
d: 5 (320 KiB)=0A=
[ 1063.966675] c0 [ T6168][preservecfg] Blocks required to allow GC merges:=
 &nbsp; 2 (128 KiB)=0A=
[ 1063.975525] c0 [ T6168][preservecfg] Blocks required to GC bad blocks: &=
nbsp; &nbsp; 0 (0 KiB)=0A=
[ 1063.984177] c0 [ T6168][preservecfg] Amount of dirty space required to G=
C: 85852 bytes=0A=
[ 1063.993025] c0 [ T6168][preservecfg] Very dirty blocks before GC trigger=
ed: 50=0A=
[6168 : 6168 CRITICAL][util.c:438]Cannot open directory '/mnt/fwupdate/bios=
conf': No such file or directory=0A=
[6168 : 6168 CRITICAL][util.c:438]Cannot open directory '/mnt/fwupdate/oldc=
onf_active/redfish/bios': No such file or directory=0A=
[1938 : 1938 INFO][utils.c:3995]DoFlash SUCCESS=0A=
[1938 : 1938 INFO][main.c:1539]start flash without options=0A=
[1938 : 1938 INFO][main.c:1098]PostFlash Invoked RebootState: 1 flashedimag=
e: 2 =0A=
No iptables conf found=0A=
Restarting system...=0A=
[ 1074.189282] c0 [ T1938][flasher] reboot: Restarting system=0A=
[ 1074.195447] c1 [ &nbsp; &nbsp;C1][swapper/1] (BMC_MEM_DUMP): cpu--- 0x1-=
--- &nbsp;=0A=
[ 1074.202580] c1 [ &nbsp; &nbsp;C1][swapper/1] (BMC_MEM_DUMP): cpu--- 0x1-=
--- crash_note_save complete =0A=
[ 1074.211929] c0 [ T1938][flasher] aspeed_wdt_enable ctrl1: [3] &nbsp;=0A=
[ 1074.218537] c0 [ T1938][flasher] aspeed_wdt_enable ctrl2: [3] &nbsp;=0A=
[ 1074.225141] c0 [ T1938][flasher] aspeed_wdt_restart=0A=
BP0c00</code></div><div class=3D"elementToProof" style=3D"white-space: norm=
al; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div><div=
 class=3D"elementToProof" style=3D"white-space: normal; font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0);"><br></div><table cellspacing=3D"0" ce=
llpadding=3D"0" border=3D"0" style=3D"white-space: normal; width: 665.43pt;=
 height: 78px; box-sizing: border-box; border-collapse: collapse; border-sp=
acing: 0px;"><tbody><tr><td style=3D"white-space: nowrap; border-top: 0.5pt=
 solid rgb(0, 0, 0); padding-top: 1px; padding-right: 1px; padding-left: 1p=
x; vertical-align: middle; color: rgb(0, 0, 0); width: 665.4pt; height: 15.=
6pt;"><div class=3D"skipProofing" style=3D"white-space: nowrap; font-family=
: &quot;Times New Roman&quot;, Times, serif; font-size: 12pt; color: rgb(0,=
 0, 0);">Yingjie
 Zhang</div></td></tr><tr><td style=3D"white-space: nowrap; padding-top: 1p=
x; padding-right: 1px; padding-left: 1px; vertical-align: middle; color: rg=
b(0, 0, 0); width: 887.2px; height: 15.6pt;"><div class=3D"skipProofing" st=
yle=3D"white-space: nowrap; font-family: &quot;Times New Roman&quot;, Times=
, serif; font-size: 12pt; color: rgb(0, 0, 0);">Mobile
 number=A3=BA+86 15507853630</div></td></tr><tr><td style=3D"white-space: n=
owrap; border-bottom: 0.5pt solid rgb(0, 0, 0); padding-top: 1px; padding-r=
ight: 1px; padding-left: 1px; vertical-align: middle; color: rgb(0, 0, 0); =
width: 887.2px; height: 15.6pt;"><div class=3D"skipProofing" style=3D"white=
-space: nowrap; font-family: &quot;Times New Roman&quot;, Times, serif; fon=
t-size: 12pt; color: rgb(0, 0, 0);">E-mail
 address: zhangyj2007@outlook.com</div></td></tr></tbody></table><div class=
=3D"elementToProof" style=3D"white-space: normal; font-family: &quot;Times =
New Roman&quot;, Times, serif; font-size: 12pt; color: rgb(0, 0, 0);"><br><=
/div><div class=3D"elementToProof" style=3D"white-space: normal; font-famil=
y: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans=
-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div></pre>
<div id=3D"Signature">
<div style=3D"background-color: rgb(255, 255, 255); font-family: Calibri, A=
rial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgba(0, 0, 0, 0);"><button lang=3D"en-US" =
style=3D"box-sizing:border-box;border:none;font-size:16px;margin:0px;appear=
ance:button;background:rgba(0, 0, 0, 0);cursor:pointer;text-align:left" cla=
ss=3D"ContentPasted1">
<div><br>
</div>
</button></span></div>
</div>
</body>
</html>

--_000_OS3PR01MB100080DB03D4F9074A91726E4B0E12OS3PR01MB10008jp_--

