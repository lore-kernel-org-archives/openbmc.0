Return-Path: <openbmc+bounces-1772-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8398610FCAE4
	for <openbmc@archiver.kernel.org>; Wed,  1 Apr 2026 21:35:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fmJFH2RHJz2xYw;
	Thu, 02 Apr 2026 08:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c10d::3"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775079347;
	cv=fail; b=HAmqPs+Q72xKw6jCN/LkoWbNRHDQDOjN3TKLuGzrrfyvhc5VE0wzSYboc5XvAGeDziApXFCPallsLjo+w/TKIQpAUwO7RWGXJL6byrXsdgdvKO5fbrzwXBsfLbDt6+K7cJ7uJ4bNvm8CJANzTMO7IbHNxZF2i2UHdsz51PQ4r457Q5130vapxrbqvP0m9yNNXUr2hJlRdM4kM6kQi5Xr6XUaj6Ehrpc47KmX1BcoTaIfb3zTb/yYdtRVva2P781DD99fu0R3lRXDAXZqXCYI4/UYM3056m9mF4Vt9QBp1+/hETC72s7RYEQTERP0LJG8LKSaun2JPlupvgpMYpA5nw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775079347; c=relaxed/relaxed;
	bh=cu6yjwpItxtLW0mFvystGM5F+SmFmNewDIgTmdtZy6A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NwcUoO6SU9v0jSYdO74C56T0XdnlEqEGB7Pt8HYmO8wt4Jl4dQJ1Pd+bwkaqSTR8ARDpHPDvbDtjLgGHf6pzIXY2m6saaK49PZArVT1ZWztOxEz1guLXCcBrdSaHkhOnQ/EmzhG9Tm0QEwNUdsiNfVh74fuCkNZB0pZMmDt5UlOvdti0Fj5GxgeQ63AI8n16TfRAUZfHqLBkUyObVZyLKNn6AxoDBSNmBtsJDtgWC0IDC0B+FyAwoFz9tZdM7p5ONo4+OjWwbLUDUntNBOUjQz8yb52yhuGX+euRNqvev5BcjxkeoPZSzJOrEYfaSz0c2YmPPYOuD1o3ZHy4t3dktw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=ccT1TZ2m; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=ccT1TZ2m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fmJFF5cGcz2xS3
	for <openbmc@lists.ozlabs.org>; Thu, 02 Apr 2026 08:35:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHXbSrWLPi8eT0Zh0Zo/ZTzQFggI0ki6nAPk+osl8Z4exAAnx5qT9haiyDcszkT66d1ey6KJwBZp518w/v/Jt/70XYlVtJv6qeWxze5CZPMRQQRxoNILGpM+IgN84hF42I/9WHBQylG+fa1rUjJk3d+2O2zmbXw7qQNVdoWW4twQFuKvGHwXc/OHYZyvemGLkkk6QyJhf6aBeDStlUOgmQtCEyDW7Zj7Pk76+ouW4TPSz7s9UYXwn9IoXNMEeT+gmcJsZN9YrZ+owH/Dv6MLvmjaATSC+T4LLW4/weSTS2dBbSJZ3tYHAG/uqv7VFI583oaFTkozA9msm+zBNMZkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu6yjwpItxtLW0mFvystGM5F+SmFmNewDIgTmdtZy6A=;
 b=mjRVDlEbgVHQoLwxB5H6MmaCNkxUaGHb8sEEeIXb2O5pvbSrsASSK40YiwifhZRv31PiO0EdfVVsfCo7RPErUPEjQkMYnhVjDPPsqzCNNTtT+DQ2wJf688BuQ5bhPrZDEBZWKBYQeqSKr1vV3kxYoQeUJjCyhWu2Q9dG8L30mGQR3rtvh1vx2iUEuYTdfhfqfnivTbe+eNfW3dgh/l5CM77bp41iG1hUqArD28UhPbRqOTmsLtqYgjtsI6OANyb+FnHQAKwVJSjyYzX4MaqhP4x3TsmUo/G4d2t4/3WYJJuBRhB4OJLTKL2ZccParb1YY4/xjv0fPVW0NDjOQceuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cu6yjwpItxtLW0mFvystGM5F+SmFmNewDIgTmdtZy6A=;
 b=ccT1TZ2m3OjwDAnRd+NGxfAN2G+vcDbsaeobeZTtSOZi/42Z+YXpmFnmOmhIo12YxPKFjRl90Odo/1drbqeoNrVdbo+8GpcNtLIfuMuFajtxDk6hAIZWsQgcoGUhBQSr4MPb2yeG3Er96tmafspPPzconR7LiXJpMuJ2fn0NdnY=
Received: from LV2PR21MB6760.namprd21.prod.outlook.com (2603:10b6:408:350::10)
 by LV0PR21MB6832.namprd21.prod.outlook.com (2603:10b6:408:32f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 21:35:21 +0000
Received: from LV2PR21MB6760.namprd21.prod.outlook.com
 ([fe80::dd7d:5598:a56c:893b]) by LV2PR21MB6760.namprd21.prod.outlook.com
 ([fe80::dd7d:5598:a56c:893b%6]) with mapi id 15.20.9654.022; Wed, 1 Apr 2026
 21:35:21 +0000
From: Gary Beihl <garybeihl@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia
	<Sagar.Dharia@microsoft.com>, Giri Mudusuru <girimudusuru@microsoft.com>
Subject: [RFC] SPDM attestation E2E findings from Renode testing
Thread-Topic: [RFC] SPDM attestation E2E findings from Renode testing
Thread-Index: AdzCHeFEproi04uzTniISUQ6MdiLVw==
Date: Wed, 1 Apr 2026 21:35:21 +0000
Message-ID:
 <LV2PR21MB6760DEE956E328854F20CE6BA650A@LV2PR21MB6760.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=9df06ed1-6d13-4cda-9f4a-89a42b6b771b;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-04-01T20:51:17Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR21MB6760:EE_|LV0PR21MB6832:EE_
x-ms-office365-filtering-correlation-id: 8f42f84f-c552-4ee0-0180-08de903693ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|8096899003|13003099007|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 lWFC42Ouz15IjIXUf932/Hu6I6YE/JNbYq+tnagVHIV3UeylB8cwKgLXmuAAfHYlqcY/pstf3X9gI/5RpeoxOw4hk/zCEOvnw22A1FsEGvPHsdM67bEMQCqkchxKzxC3YPTjSmeFY/EDnp7GGmP3Mwr0UE96ZvUuiFTRJay4151xqEtdinI4ki6DIFzFF6TNBeqwHfYq0QHHItQlUjvOSEsDGv2YSgptIcA8vmSplfCl0eRF1rtTLJ1l2+wTEN3gFgiCqy25TUF/VHJFLrs2qHzKnWRyWfhvBi+C2QwT5csvwwIUs+18XcPa2aoVhL0clqiJ5ic+UBMY2cuMh0f6bRWFqQjjhEubl39JG/rNaQruOe3PkGXMb0U3V7WLncWRsc936Nf4H6l50q0UNzjNxB2BR0zmr97FStdHO/CVMc5XDHmrm4y2OEABdZIGPbz/0u/m+Z3dredj1A4c07CLuyeOI0wQSm/cMqDI1lBsCZY2QD9l7lm+y1mk0CCjLUbl2HAMPUmCFhpnqkXcoYpFJe8XOHglr9E3OQxrJ2gE/8clEKTLPMBPioKYcAgcnEP2YaB8IDfitoGcaIibpnBHZoya6vlOWPGXIgA5tp3f2CYzjdMdgjujzmH28GAyyOTsEYTK5J4TjDFTG2oYJediajh5XtrKd3mTTa1KxdRrswper5oVPgMEFy9FEFiSmkCvg7O4/04vSmmfwamIRAPtY09F/fqFL3JF2eHB28Gw9TgHAQ/tM8ilwpgUplMenB4l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR21MB6760.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(8096899003)(13003099007)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?aFFSMUJlMFRBTWM0ZTB5MDVRbndRVmFJeFpGTXJRbVEzYmw0OStBbU1o?=
 =?iso-2022-jp?B?UmtyWkpwaFRxZ3dSb1VmZjNVaFIrN2xVSWpLY1lSQnFVNC9uUjBWRWhy?=
 =?iso-2022-jp?B?dlNDdDl1cldJdjVjVXJGSnk2c2V0b1dPZzBxM3gwSEFWSUZPQ0t0c3Vm?=
 =?iso-2022-jp?B?WDhzcTE3dmMrSzF4NGV0SHk4WkNsaGVabWZHNWtLeDlpSWpHOE4wMXBR?=
 =?iso-2022-jp?B?bWFDVmNiaDJORm9mbGhmdDI0ZVQ5MXZKNnV4RXlhZkd5YnU2K1A3SHVm?=
 =?iso-2022-jp?B?STljcTF2SlMxaVhlczltWTk5WVJNNUlYSzcxU245Q0pQWEh2NGRSYkZk?=
 =?iso-2022-jp?B?aU5VSURJaExjRWN4SklucU0xTXBVc3owT29kMUNZTUpXRDY0T3Z5cC8z?=
 =?iso-2022-jp?B?d0w4L2NNTHc0dDl0MXBIN0YwUzA5eDZSVitpU08xNFlaYWlObE1qQ0dJ?=
 =?iso-2022-jp?B?ZWp1d0pLa3RDU1Q0UDFzejVzREZBcDh5QkV3WmxCMGIvZElZQzQrNFph?=
 =?iso-2022-jp?B?RXJJeExOMHBaRmdobFNiRlJvOWNlVEpHVEc2TFpGN2NBY2Fna1RhYWxF?=
 =?iso-2022-jp?B?bzNxL256UEtDUzI0anZzS0V2M0d5N3p3YWhMemxRQVc1U0ZtT2QwcEY2?=
 =?iso-2022-jp?B?SnVYMGt6VklMejVBNVN2Y2krWk5ZVlhFSE05aWZnaTBpSE5PdWlDRkNw?=
 =?iso-2022-jp?B?YjR6M3VtK1B1ZEg1R0p0UmttbHRrT1YzK3lJaVBXU05qYVNOdENqR24y?=
 =?iso-2022-jp?B?SlFKMnMwNXJrSVh2ZHdqR00yN2lzOFRrOHkwT3J5bWRhWDhLNzMrVGdp?=
 =?iso-2022-jp?B?djA4Z0FsckpnK3piTXpobWpvRDN1M1c1MHZ1akZXaFpGMk4rZ2tDdTJl?=
 =?iso-2022-jp?B?czhnb1R4VHN5N2sxTlp2YkhLcDBqQ0E0OUc5cnNvVkxlZWhpUmN3VjJx?=
 =?iso-2022-jp?B?eWNSbEVQRUpXTnhQYmcrSUt2cmZsdG5OZlFZTmVXM3J0TWdlTElhRUsw?=
 =?iso-2022-jp?B?RWcrQWMwSktwMENtdDVjaVlDSnRUUEtEYS9zQ2VXeUEyemd5WXlraDly?=
 =?iso-2022-jp?B?dXJ3QUpENzBNM3VQMFhQNm1rc1J0dnQwVGphaTVlZnowdTZUUlk0UTlj?=
 =?iso-2022-jp?B?NS9IQlVaYlptbmowS3Ird0hSSFl5NTQ5Tkp0WS94OW5Jb3V0bkVKRlh1?=
 =?iso-2022-jp?B?QUd4S1p1UTlmNnJ1UkJCcVlrZVM3b3dBZHB4aFl1S01iWnJxQ2c0d3E4?=
 =?iso-2022-jp?B?UVZmMHJlZWJSVjhJR1VlTmJsQzgrdDJaT1E4TmQ4am1jenZWY2FER0FR?=
 =?iso-2022-jp?B?eGFqRlFYU1d1WXVYblFjaU1lcnBrWUs0WGg0OVEwWGF3UXRVbWRuelZl?=
 =?iso-2022-jp?B?a2NhQ00yeW1GRS9aeGdGeGE2RTMvYnQyZ0dFTklEb0NKOHJkNHUvRkFr?=
 =?iso-2022-jp?B?SHNjSEk1ZkkrL2RINEtlckJZY0pUekxzT1ZpTDZBQ2s3V1FGTGFnT3BJ?=
 =?iso-2022-jp?B?VzRsVTVNRjAwOEVqT1ovMVhUemloNUZHdnJBR2RPKzE0RnZQNWxEbnhm?=
 =?iso-2022-jp?B?Qi9IOFB1RzRPdSsrUmljRVg1djZla2ZZT291MVh4UE1DaU9YK1A0bnBH?=
 =?iso-2022-jp?B?VmplckxCTlhaOFNEbENLeW9RYXpvdmJnOENtODZwbDRrLzNvWDRPQlls?=
 =?iso-2022-jp?B?L0xVWnhYaW9pL1FHc1Z0dUlXZnoxMTBVajY4WU9DQTVoNGFPN0dacUlX?=
 =?iso-2022-jp?B?TGcyZWVlcXpvOWwydUY5WlU5N3dFa0dwSThVeHlmQTFKUmdvcG5aQVdY?=
 =?iso-2022-jp?B?d2hjNVowYUswQXlTbGw2alZvVTNKZlpjcDRDbTJPaHBzcENGNzV6L29M?=
 =?iso-2022-jp?B?MDF1S0dGUDNjRTI3dVJaNGtXQSttL3Z4OCsvRnNCU2lycm15ZlZLTnQz?=
 =?iso-2022-jp?B?L0N2bS8rY2RsZVoxbW8zUE5McTdhWjAzRUhkVjdYRExOK1FFVUhGZ2J5?=
 =?iso-2022-jp?B?OVQrQlV3bzRDbDVoMWQyTVlHcGgvaWdtVjk0NUt2Nkl3TWlVVlhkTjJB?=
 =?iso-2022-jp?B?Qm13VGR1S2tZR1lmZlpHdzlRRDFRQlZqS3ptUGJhRmJNdUpzRnBWdFJ2?=
 =?iso-2022-jp?B?YW9KZTloVi9UcjM1MTFDZkhZTEI1ZVppcTBHbmh2N0lMZFpieTZFMUEx?=
 =?iso-2022-jp?B?TGZaUnYrcjgxV1V4WnVQcjZpNVJHNUQ0dGVrRXVQcjNiL0l5czR4eEs5?=
 =?iso-2022-jp?B?RmMrdFQxc1RlQ2xUYUEySG1xeGhkRTczKzkxL09tS0NHMDRVZFZqQW1O?=
 =?iso-2022-jp?B?b1dXdDFTa1J6cEdsb1locG1ReThOMjZhckZKMWowSTV1a3BvYnV2MXQ1?=
 =?iso-2022-jp?B?d1BKR2loajlKUURBTmJ0c29qTWhYLzdsU053VzlWMk9pYy9BNEE5WjFM?=
 =?iso-2022-jp?B?S3hSL0tDSTdkUkhCczkrcFF6a3RZT1hLSjZIMzJudGROeGxIS1ZqVlZv?=
 =?iso-2022-jp?B?WnFCOCticzlPMWJCSDRzR245d0dLd1UzcllFUT09?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR21MB6760DEE956E328854F20CE6BA650ALV2PR21MB6760namp_"
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
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR21MB6760.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f42f84f-c552-4ee0-0180-08de903693ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 21:35:21.5068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0MbPAEpp+m/EyTebKCvswb35kdCrhG1PRzmeIgIiMzhbGAZloZqLzZuteYmVlOMXk9lE5hAXbh0ARtXYsKSxCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR21MB6832

--_000_LV2PR21MB6760DEE956E328854F20CE6BA650ALV2PR21MB6760namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Following up on my earlier ComponentIntegrity route email - I've completed =
end-to-end SPDM attestation testing using Renode (emulated AST2600 running =
a full OpenBMC image with spdmd + bmcweb). The Renode SpdmResponderDevice f=
unctions as an SPDM 1.1/1.2 responder over MCTP-serial and the tests cover =
the full flow:

MCTP discovery =1B$B"*=1B(B VCA =1B$B"*=1B(B GET_DIGESTS =1B$B"*=1B(B GET_C=
ERTIFICATE =1B$B"*=1B(B CHALLENGE  =1B$B"*=1B(B D-Bus property updates =1B$=
B"*=1B(B Redfish ComponentIntegrity

I cherry-picked the MCTP transport series (80355, 80358, 80311, 80267, thro=
ugh 80359) and built against libspdm. The tests cover 14 scenarios includin=
g successful attestation, wrong-key rejection, unreachable devices, multi-e=
ndpoint, SPDM 1.1-only devices, version mismatch, and mid-flow disconnects.

To get these E2E tests passing, the following changes were needed on top of=
 the current patchsets:

(a) Missing CHALLENGE step (affects 80359: spdmd.cpp) [Security]

The VCA flow does GET_VERSION =1B$B"*=1B(B GET_CAPABILITIES =1B$B"*=1B(B  N=
EGOTIATE_ALGORITHMS =1B$B"*=1B(B GET_DIGESTS =1B$B"*=1B(B GET_CERTIFICATE, =
but stops before
CHALLENGE. Without CHALLENGE, the responder never proves  possession of its=
 private key - a compromised certificate would pass attestation. Adding lib=
spdm_challenge() after  GET_CERTIFICATE completes the proof-of-possession v=
erification.

(b) D-Bus path and version extraction (affects spdm_dbus_responder.cpp, spd=
md.cpp)

ComponentIntegrity D-Bus path uses CamelCase: /xyz/openbmc_project/Componen=
tIntegrity/ but phosphor-dbus-interfaces and bmcweb expect snake_case: /xyz=
/openbmc_project/component_integrity/

Also, version extraction from connection_info.version needs  SPDM_VERSION_N=
UMBER_SHIFT_BIT before extracting major/minor  nibbles.

(c) Shared AF_MCTP socket (affects 80311: mctp_helper.hpp)

Only one socket can bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).  When spdmd at=
tests multiple endpoints sequentially, the second   MctpIoClass::createSock=
et() fails with EADDRINUSE. The fix is a process-lifetime shared socket (si=
ngleton pattern), draining stale responses between endpoint attestations wi=
th recv(MSG_DONTWAIT).

Also needed: SO_RCVTIMEO on the socket so recvfrom() doesn't block forever =
when a device is unreachable or disconnects mid-flow.

(d) Certificate verification callback (affects 80359: libspdm_mctp_transpor=
t.cpp)

libspdm_get_certificate() fails without a registered cert chain verificatio=
n callback, and the current code doesn't register one. For initial bring-up=
, a trust-on-first-use callback that accepts any valid chain works; product=
ion should verify against a provisioned trust anchor.

Also needed in configureContext():
  - Register all supported SPDM versions (1.0/1.1/1.2) to enable negotiatio=
n (current code sets only one version)
  - Set requester capability flags (CERT_CAP | CHAL_CAP)
  - Register measurement hash algorithm

I'm happy to submit these as follow-up Gerrit changes on top of the series,=
 or if preferred, I can provide the diffs to fold into the existing patchse=
ts. The Renode E2E test suite (14 scenarios) is also available if it would =
be useful for CI validation.

The bmcweb ComponentIntegrity routes are up for review at [1] and consume t=
hese D-Bus interfaces.

[1] https://gerrit.openbmc.org/c/openbmc/bmcweb/+/88828

Best regards,
Gary Beihl
Firmware Engineering
Microsoft Corporation


--_000_LV2PR21MB6760DEE956E328854F20CE6BA650ALV2PR21MB6760namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello everyone,<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Following up on my =
earlier ComponentIntegrity route email &#8212; I've completed end-to-end SP=
DM attestation testing using Renode (emulated AST2600 running a full OpenBM=
C image with spdmd + bmcweb). The Renode SpdmResponderDevice
 functions as an SPDM 1.1/1.2 responder over MCTP-serial and the tests cove=
r the full flow:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">MCTP discovery =1B$=
B"*=1B(B VCA =1B$B"*=1B(B GET_DIGESTS =1B$B"*=1B(B GET_CERTIFICATE =1B$B"*=
=1B(B CHALLENGE&nbsp; =1B$B"*=1B(B D-Bus property updates =1B$B"*=1B(B Redf=
ish ComponentIntegrity<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I cherry-picked the=
 MCTP transport series (80355, 80358, 80311, 80267, through 80359) and buil=
t against libspdm. The tests cover 14 scenarios including successful attest=
ation, wrong-key rejection, unreachable
 devices, multi-endpoint, SPDM 1.1-only devices, version mismatch, and mid-=
flow disconnects.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">To get these E2E te=
sts passing, the following changes were needed on top of the current patchs=
ets:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(a) Missing CHALLEN=
GE step (affects 80359: spdmd.cpp) [Security]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The VCA flow does G=
ET_VERSION =1B$B"*=1B(B GET_CAPABILITIES =1B$B"*=1B(B&nbsp; NEGOTIATE_ALGOR=
ITHMS =1B$B"*=1B(B GET_DIGESTS =1B$B"*=1B(B GET_CERTIFICATE, but stops befo=
re<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">CHALLENGE. Without =
CHALLENGE, the responder never proves&nbsp; possession of its private key &=
#8212; a compromised certificate would pass attestation. Adding libspdm_cha=
llenge() after&nbsp; GET_CERTIFICATE completes the proof-of-possession
 verification.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(b) D-Bus path and =
version extraction (affects spdm_dbus_responder.cpp, spdmd.cpp)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">ComponentIntegrity =
D-Bus path uses CamelCase: /xyz/openbmc_project/ComponentIntegrity/ but pho=
sphor-dbus-interfaces and bmcweb expect snake_case: /xyz/openbmc_project/co=
mponent_integrity/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Also, version extra=
ction from connection_info.version needs&nbsp; SPDM_VERSION_NUMBER_SHIFT_BI=
T before extracting major/minor&nbsp; nibbles.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(c) Shared AF_MCTP =
socket (affects 80311: mctp_helper.hpp)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Only one socket can=
 bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).&nbsp; When spdmd attests multiple=
 endpoints sequentially, the second &nbsp;&nbsp;MctpIoClass::createSocket()=
 fails with EADDRINUSE. The fix is a process-lifetime
 shared socket (singleton pattern), draining stale responses between endpoi=
nt attestations with recv(MSG_DONTWAIT).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Also needed: SO_RCV=
TIMEO on the socket so recvfrom() doesn't block forever when a device is un=
reachable or disconnects mid-flow.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(d) Certificate ver=
ification callback (affects 80359: libspdm_mctp_transport.cpp)<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">libspdm_get_certifi=
cate() fails without a registered cert chain verification callback, and the=
 current code doesn't register one. For initial bring-up, a trust-on-first-=
use callback that accepts any valid
 chain works; production should verify against a provisioned trust anchor.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Also needed in conf=
igureContext():<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; - Register a=
ll supported SPDM versions (1.0/1.1/1.2) to enable negotiation (current cod=
e sets only one version)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; - Set reques=
ter capability flags (CERT_CAP | CHAL_CAP)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; - Register m=
easurement hash algorithm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I'm happy to submit=
 these as follow-up Gerrit changes on top of the series, or if preferred, I=
 can provide the diffs to fold into the existing patchsets. The Renode E2E =
test suite (14 scenarios) is also available
 if it would be useful for CI validation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The bmcweb Componen=
tIntegrity routes are up for review at [1] and consume these D-Bus interfac=
es.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">[1] <a href=3D"http=
s://gerrit.openbmc.org/c/openbmc/bmcweb/+/88828">
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/88828</a><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best regards,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gary Beihl<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Firmware Engineerin=
g<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Microsoft Corporati=
on<br>
<br>
<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_LV2PR21MB6760DEE956E328854F20CE6BA650ALV2PR21MB6760namp_--

