Return-Path: <openbmc+bounces-1781-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C81EDB7FE
	for <openbmc@archiver.kernel.org>; Tue,  7 Apr 2026 20:52:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fqyzy3B9Nz2yhV;
	Wed, 08 Apr 2026 06:51:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c007::2"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775595118;
	cv=fail; b=Lp9XPxWNQ4VTMksjBv79lNDHKWc28hoZg7+MRQCmV1ARtLPGcpD35YwY0M8/H3DdDxoL2LIrFqj11fEvPy+5EZYbgbU965kr0HgUdJtaBN25sCE29rRRfsLiBHn4p6JY2Lo/N3ip2L11vovu6ilxAIvVQTuv1ut2RDm/9kgUw3h4w+3B7tWAAp1k9PxuDKlXlL0XGPfLibSAuluaB5seLBLkEyXBeZ4NX0dCWCfkRgoQ42e3DSYFtemButC1zvQSKuWVCO8AVzNt2Ad8JXhqhMQUV4oKKuJXBk774hiCh5bhVniztdTPgsqC553Trg+Dv8j8vWWeqkY1YJRnL0n7Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775595118; c=relaxed/relaxed;
	bh=CfLHX8ZJSHqGH6pRbhpkri1ha6BFL7xuRyoCTgvmgys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aDHYwhB/zlAEFWOogJBMnF7C1iRlEFFIyRnbFn2ochBjNX0hXx9sei0eHreYLGjTBgJR6EJ4B9Ae6wZiwRFRziHYmkUqc8PmZWN4QOR9jQg4ikz0RCy0yx6l5fVl+ntpQQFGaN364CdZLSFEgl3OTwXk4z+0iz9hBGqq9akBxyRBcURim9yH9gN1qaJ847leNhbNaIO34n+QLCDn9H0Q6gGXo75RYLLqpV0U62O4czp8OZJ3M+ePzW6T/VjTSQylLzdpUFxlH3giStY1G+3YloP53V9IRqmI/UYs8Kk3WsJQc/bkNQXfUb5l77tmPdN8kSD0BIEdK0MqeMiz04BNaQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=Z0WstHqr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=Z0WstHqr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fqyzw3pvHz2ygm
	for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2026 06:51:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGatLvWFIDNtrlIocsnn4VpHiE69CZSK4C/4JcCZ36ArvRdgKKsGFhhtz2EcJINXnWVwyzdMS7BTa6ckKLkyXS6ImltlhJMmE5HXQ1ojzbYG6FF4Xp1HMzAAhePwJwJ157wcntRrjojPFIi6N3nQeFpzf8uueN7AgHUSaMICXiFbmb1NUIk0qoKBEToAYU6ND86OpNw4mx4m3yx99fOLT61RmAQGmKgeNI2VQaVz5mGbAbNYSfLrTT3qMHcwO8arVzK2teIu9xAj24BZw8bQYsmI3JKGXgDKU4VRXOCsgYkUQdO45yz6bzDLIq0owB1R5Y2lK7nUe1TvVMFxDB5aDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfLHX8ZJSHqGH6pRbhpkri1ha6BFL7xuRyoCTgvmgys=;
 b=T33hNq5Xnw9oAwyLI5LkqrPLhr52cytvN+IVRAu6HmbkwcYhnwvdEIUpJCiB1+PgnZ/oihPpZXl830pz+NpPIaSCFNVV1/Pd1/Ll9g1Hz4xv+UHe3lcU6/Hb8Ju6UtQkdXVFH/kjjXmCwAq3sELvRG0sCmcYPEQi2xXMu8PMRKBhlAXm85ZXXmYrHSMYcJcQnQoT1/XtShp7Au0q17e00ifyIf47CTDDhKSQH4szLC0fea92o2N4AMv7vEFYlNj1RQQ5mpH5IXrI7KewYrGqDaDP/4j0qY9a0td/8cbZHS1l9sJXYRtA5qQx+LuIhpWx6yMcWBSiJc+1d98JdeL+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfLHX8ZJSHqGH6pRbhpkri1ha6BFL7xuRyoCTgvmgys=;
 b=Z0WstHqrolTR2xvVn7ivG+UthWwcxsEdHMxmrnTEMEvCsEuHcmoyBbYkLjXygw0bLlYwJGCL3iMjzGgVlkEueGoIqx+oASK48fDpxwdkK+MaOP5gMLax8uRYr8cxyLZgwksGKbfkOdgBLQN4S5uu2dDpr9aRWW6uzpEmZSkh6a4=
Received: from DS0SPRMB0144.namprd21.prod.outlook.com (2603:10b6:8:2f5::7) by
 DS4PR21MB6308.namprd21.prod.outlook.com (2603:10b6:8:307::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Tue, 7 Apr 2026 20:51:28 +0000
Received: from DS0SPRMB0144.namprd21.prod.outlook.com
 ([fe80::f349:4f34:6715:c0c8]) by DS0SPRMB0144.namprd21.prod.outlook.com
 ([fe80::f349:4f34:6715:c0c8%6]) with mapi id 15.20.9745.034; Tue, 7 Apr 2026
 20:51:28 +0000
From: Gary Beihl <garybeihl@microsoft.com>
To: Matt Johnston <matt@codeconstruct.com.au>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
CC: Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia
	<Sagar.Dharia@microsoft.com>, Giri Mudusuru <girimudusuru@microsoft.com>
Subject: RE: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Renode
 testing
Thread-Topic: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Renode
 testing
Thread-Index: AdzCHeFEproi04uzTniISUQ6MdiLVwAJ9MqAASJ0NCA=
Date: Tue, 7 Apr 2026 20:51:28 +0000
Message-ID:
 <DS0SPRMB0144E17B9D846259CD076C54A65AA@DS0SPRMB0144.namprd21.prod.outlook.com>
References:
 <LV2PR21MB6760DEE956E328854F20CE6BA650A@LV2PR21MB6760.namprd21.prod.outlook.com>
 <91704f59fe5c3ab763927f66b6582d32975a1764.camel@codeconstruct.com.au>
In-Reply-To:
 <91704f59fe5c3ab763927f66b6582d32975a1764.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f589bca7-86a1-4d7e-8347-4864843d8ff8;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-04-07T20:45:51Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0SPRMB0144:EE_|DS4PR21MB6308:EE_
x-ms-office365-filtering-correlation-id: 31a669c2-4219-4659-1e41-08de94e770ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|13003099007|7053199004|22082099003|56012099003|18002099003|8096899003;
x-microsoft-antispam-message-info:
 Js1UqkKaSdkrg+RYad1MYEv5ph6sygaB1wykHkDscLTQub4sEKLsCnLBZOQLt8tw+i7Z/bO9hqvymqcJlw2SkOFrLP0sibzhTNouP9A2pvURQaNLaLwe0YpusuxoL1y9vmzUR7YnqFO5dpgq3NRV1/4g58QVz2nWKW6x9pghYqhoHFmrwxPsbDUTtPkOe6ImwQckd+wLvPDP373shpyTbgnkX4zygfqK9xWYxb1HxRqXc26vTg7MRWhd2D5TMojnZaXzkzVnRiCO/LGRtLkWD6boBPZLjFA1Mh7VCYJH9EgDaML4bffmacdrdO4nNP6SXHGDD55PGHL/mTtWXkRnrofKekcGHWZKIT/3o/IpgvvTbrtdkvRABNSCB/vSFegVKMMKnbuy+0cHSTVXiGzFuuEyXDw+UglmGcLEE3h6wvbaSGKNvft702cfY20M7ZtcpIL5H5yRyvu4+0QrTvcqn0uCDeIUOFHkg/2KxLnUK1v0bJXIJUsmPpVNhxZZQYaShp4pCH/6SgBlYNMJ4S24Xl5ndwGuQP5AXwwS+0BMCZBz0zLy76eQNv00MJRH1BJsFIfgjmWNF2A2Vjk9uq3iwbpebMJV7okbtCv9CJLM4CB81rvDvalr54q69UmlfcaVc/yJXRiVajA+zUbikvB9X3Zb0uBKY6ZxC20aqM2Cm3plO4oTRKtOWvUrdLd9j99AxN0XleGEln0YAwBT+PEawsWX7xRMHVqzEhYmrInOo9xAEeBUCJdw1tLeVd9/3uSW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0SPRMB0144.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(13003099007)(7053199004)(22082099003)(56012099003)(18002099003)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4zzL50Aay8DaAEXc5qqX9v69XrUv6Cb50oUzKsrultI0gTTiyl2+7txIJfvr?=
 =?us-ascii?Q?9VyoZcUivLHETgVTYqkfIxKcrLIsrqvXBQ4T4EoKaVKEYjAKJEFV5MIZsn7d?=
 =?us-ascii?Q?jCTAtujMxKkKjUCG2TVDj+fgZJt5VRoRXNyofzhmvNlN0IX/LNbnm7ACz6Rm?=
 =?us-ascii?Q?xjv8J+g0Ioi5SGw7gBaGX42t2eyOfwVdO8WQsw923OgJSgJpBdbMOzV+5CqA?=
 =?us-ascii?Q?cucCdVmrR9rOX+9kwDOHEB+s81SZmD9uamjKVLztTs1Qgz9iL/anUeUWJncs?=
 =?us-ascii?Q?fF3KuhJamJH2nZGdiPXPnI0IZOtUbTQ2iNNEzr4YlP8w0cpV4cHcm5TC41zm?=
 =?us-ascii?Q?u05cOpmSbCLr7UQpHRMZUOoe0g0h/egltLQdpTgXfe5G5yAZk0NJ7ZkXZNdE?=
 =?us-ascii?Q?1QdBwIl6ghOLU2W7Htd9Qlusr81l2ef5gyhlRiS1cThPimtoJnYv8IA0iSVm?=
 =?us-ascii?Q?9za2x7NCTJjTlbUol9h52u8kOdcgKEBzLcp5lVUyaM0Gfc6JqhWg/au9/6O8?=
 =?us-ascii?Q?+uiL2cVq7AZU602Y2JlDQDkZJZIcHsLcakwp7h8yiAJMu/X5uYQS0Z2Ii+YM?=
 =?us-ascii?Q?Wfh9hzUsarDRnk71PH2f4gG9RuNRS6afUSrLDplYDjRVoV/r+SYON8gskaDa?=
 =?us-ascii?Q?ITOBj/W6NPN8cqnitWQ928OavqY9inA+mT0YGCkFCmC0iSEQ8CwTzHoKBA5v?=
 =?us-ascii?Q?fdy9EUpZOzT6xFS1pcaVv5B/eSdemeNW87BPvJxwpIo8A/SOE61z+ck4laX6?=
 =?us-ascii?Q?H+qlcTya13vfJ1R+Eg/Cy+3gq0t46EJZ87EDl1Sqs//ZKF4M8/dwFjV+XfjN?=
 =?us-ascii?Q?WhnOSHjeuMlLmVVRi2SBi2jg9SUYEyeSxvk2VpK+1MU8AGTyhKJm9mW/MVfw?=
 =?us-ascii?Q?AysrD/EjNRNFckLnLU708+HytsWWojGEczSg6sLkdP/Xp2n2c85lCkTJbQg3?=
 =?us-ascii?Q?TGuA5u5AItC/DTFztkcpokylFWk3KaLWhBPplmzo2zMPmcA1SpZaQXfHOzOw?=
 =?us-ascii?Q?mXkc7zq2b44gbwgZ7/yl8+iVQGlpCgRAgVIL2Krcc+9fcZul+DEQuwCbTpYG?=
 =?us-ascii?Q?y4bNVm21vhC2Fu0RPwIcYr7kPwxWQvkdkFTkXQzg7JhsHPtAcSm4Axuu72xz?=
 =?us-ascii?Q?0TjfZdO7YbnUrTTvJWkpUjvEGw6qnaOJqzjBz9yjvasDQL/DkoCqShSHgb6t?=
 =?us-ascii?Q?6/84OeCdPC5yQ3cuRw9ef1V3JBVJNk7zpLkzKu702v0ddt9PfXfUIDTbZZlt?=
 =?us-ascii?Q?VAIrnDFxlOCnB4dTgOCtl7os7ZS8TDc3pqCk6e3FbhPFoMymwqNL1gfshHRs?=
 =?us-ascii?Q?+jcbvCNofG8GJx53uEMgdIeDn05QU00L+iJMIJkVUBtngyEflF73xkabROwf?=
 =?us-ascii?Q?6I/UMX1SgtsaJajsHASpRZ2f0636zdoA0adNt31TFKiOxZ/q/7FbZG9Y7IRg?=
 =?us-ascii?Q?nGn8J6/g+ygxYNKBosi+iMlIP3fJESCSxwDyabkcuAEEXAX/AoMVme1+HAzX?=
 =?us-ascii?Q?PCYe2OX+SCJv3I7bnVJNtCdbFQgd80BrAmlFdoldkmE42uHpThfr7zbrc0UA?=
 =?us-ascii?Q?3SwTm2s2nz9Y/wiv8DgG7EzQ5eqyTkMVEJ5TV7R0e3M8fyfyveivUOsG1/Fr?=
 =?us-ascii?Q?7cAT2DTXtvjGO2BnNs7VSrx0b1hI+Xs+SfDWNgB2DH7XVHVm7EVGLjoyn4YL?=
 =?us-ascii?Q?au8wKg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0SPRMB0144E17B9D846259CD076C54A65AADS0SPRMB0144namprd_"
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
X-MS-Exchange-CrossTenant-AuthSource: DS0SPRMB0144.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a669c2-4219-4659-1e41-08de94e770ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 20:51:28.5810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0eDDh5Y3a03RgDye/HlXhxqmWogZy1cqaoVk4NP8WWT8d3BQIXVBWzL3qdFCWJVWYRxNlJ2NvECEejQ3po6HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR21MB6308

--_000_DS0SPRMB0144E17B9D846259CD076C54A65AADS0SPRMB0144namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

Thank you for the recommendation - I followed your suggestion and dropped t=
he call to bind() altogether. Since spdmd only does request/response (no as=
ync SPDM messages), regular sendto()/recvfrom() with SO_RCVTIMEO) works jus=
t fine. Each endpoint gets its own socket with no EADDRINUSE conflict.

All 14 SPDM E2E Robot Framework tests continue to pass with this change, in=
cluding the multi-endpoint scenarios that previously hit EADDRINUSE.

Per-endpoint bind() from Linux 6.17 is good to know about for future work i=
n case we need to handle async SPDM notifications (e.g, KEY_UPDATE).

Thanks,
Gary


From: Matt Johnston <matt@codeconstruct.com.au>
Sent: Wednesday, April 1, 2026 10:09 PM
To: Gary Beihl <garybeihl@microsoft.com>; openbmc@lists.ozlabs.org
Cc: Thirupathaiah Annapureddy <thiruan@microsoft.com>; Sagar Dharia <Sagar.=
Dharia@microsoft.com>; Giri Mudusuru <girimudusuru@microsoft.com>
Subject: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Renode tes=
ting

You don't often get email from matt@codeconstruct.com.au<mailto:matt@codeco=
nstruct.com.au>. Learn why this is important<https://aka.ms/LearnAboutSende=
rIdentification>
Hi Gary,

On Wed, 2026-04-01 at 21:35 +0000, Gary Beihl wrote:
(c) Shared AF_MCTP socket (affects 80311: mctp_helper.hpp)

Only one socket can bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).  When spdmd at=
tests multiple endpoints sequentially, the second   MctpIoClass::createSock=
et() fails with EADDRINUSE. The fix is a process-lifetime shared socket (si=
ngleton pattern), draining stale responses between endpoint attestations wi=
th recv(MSG_DONTWAIT).

Since Linux 6.17 it is possible to restrict a bind() to only receive from a=
 single remote endpoint [1]. Call connect() with the remote address before =
the bind().

Is the SPDM implementation using asynchronous messages sent by the responde=
r? (KEY_UPDATE, HEARTBEAT, END_SESSION)
If not, I think the bind() could be removed altogether.
bind() isn't needed in the case where the Linux host is performing a plain =
send() then receiving a response. A similar situation was fixed in pldmtool=
 [2].

[1] https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@codeco=
nstruct.com.au/
[2] https://gerrit.openbmc.org/c/openbmc/pldm/+/83626

Cheers,
Matt


--_000_DS0SPRMB0144E17B9D846259CD076C54A65AADS0SPRMB0144namprd_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
span.EmailStyle31
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Matt,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thank you for the r=
ecommendation &#8211; I followed your suggestion and dropped the call to bi=
nd() altogether. Since spdmd only does request/response (no async SPDM mess=
ages), regular sendto()/recvfrom() with SO_RCVTIMEO)
 works just fine. Each endpoint gets its own socket with no EADDRINUSE conf=
lict.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">All 14 SPDM E2E Rob=
ot Framework tests continue to pass with this change, including the multi-e=
ndpoint scenarios that previously hit EADDRINUSE.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Per-endpoint bind()=
 from Linux 6.17 is good to know about for future work in case we need to h=
andle async SPDM notifications (e.g, KEY_UPDATE).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gary<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;mso-ligatures:none">From:</span></b><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-ligatur=
es:none"> Matt Johnston &lt;matt@codeconstruct.com.au&gt;
<br>
<b>Sent:</b> Wednesday, April 1, 2026 10:09 PM<br>
<b>To:</b> Gary Beihl &lt;garybeihl@microsoft.com&gt;; openbmc@lists.ozlabs=
.org<br>
<b>Cc:</b> Thirupathaiah Annapureddy &lt;thiruan@microsoft.com&gt;; Sagar D=
haria &lt;Sagar.Dharia@microsoft.com&gt;; Giri Mudusuru &lt;girimudusuru@mi=
crosoft.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Ren=
ode testing<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td width=3D"0" style=3D"width:.3pt;background:#A6A6A6;padding:5.25pt 1.5pt=
 5.25pt 1.5pt">
</td>
<td width=3D"100%" style=3D"width:100.0%;background:#EAEAEA;padding:5.25pt =
3.75pt 5.25pt 11.25pt;aspect-ratio: revert !important;background:revert !im=
portant;block-size: revert !important;border:revert !important;bottom: reve=
rt !important;color:revert !important;color-scheme: revert !important;conte=
nt-visibility: revert !important;cursor:revert !important;direction:revert =
!important;display:revert !important;font-size:revert !important;height:rev=
ert !important;hyphens: revert !important;letter-spacing:revert !important;=
line-height:revert !important;margin:revert !important;opacity: revert !imp=
ortant;order: revert !important;outline: revert !important;overflow:revert =
!important;padding:revert !important;position:revert !important;resize: rev=
ert !important;rotate: revert !important;scale: revert !important;tab-size:=
 revert !important;table-layout:revert !important;text-align:revert !import=
ant;text-indent:revert !important;text-orientation: revert !important;text-=
overflow: revert !important;text-shadow:revert !important;text-transform:re=
vert !important;text-wrap: revert !important;top:revert !important;transiti=
on: revert !important;user-select: revert !important;vertical-align:revert =
!important;visibility:revert !important;white-space:revert !important;width=
:revert !important;word-break:revert !important;word-spacing:revert !import=
ant;writing-mode:revert !important;zoom: revert !important">
<div>
<p class=3D"MsoNormal" style=3D"mso-element:frame;mso-element-frame-hspace:=
2.25pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-el=
ement-anchor-horizontal:column;mso-height-rule:exactly">
<span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;=
color:#212121;mso-ligatures:none">You don't often get email from
<a href=3D"mailto:matt@codeconstruct.com.au">matt@codeconstruct.com.au</a>.=
 <a href=3D"https://aka.ms/LearnAboutSenderIdentification">
Learn why this is important</a> <o:p></o:p></span></p>
</div>
</td>
<td width=3D"75" style=3D"width:56.25pt;background:#EAEAEA;padding:5.25pt 3=
.75pt 5.25pt 3.75pt;aspect-ratio: revert !important;background:revert !impo=
rtant;block-size: revert !important;border:revert !important;bottom: revert=
 !important;color:revert !important;color-scheme: revert !important;content=
-visibility: revert !important;cursor:revert !important;direction:revert !i=
mportant;display:revert !important;font-size:revert !important;height:rever=
t !important;hyphens: revert !important;letter-spacing:revert !important;li=
ne-height:revert !important;margin:revert !important;opacity: revert !impor=
tant;order: revert !important;outline: revert !important;overflow:revert !i=
mportant;padding:revert !important;position:revert !important;resize: rever=
t !important;rotate: revert !important;scale: revert !important;tab-size: r=
evert !important;table-layout:revert !important;text-align:revert !importan=
t;text-indent:revert !important;text-orientation: revert !important;text-ov=
erflow: revert !important;text-shadow:revert !important;text-transform:reve=
rt !important;text-wrap: revert !important;top:revert !important;transition=
: revert !important;user-select: revert !important;vertical-align:revert !i=
mportant;visibility:revert !important;white-space:revert !important;width:r=
evert !important;word-break:revert !important;word-spacing:revert !importan=
t;writing-mode:revert !important;zoom: revert !important;align: left !impor=
tant">
</td>
</tr>
</tbody>
</table>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Hi Gary,<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">On Wed, 2026-04-0=
1 at 21:35 +0000, Gary Beihl wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #729FCF 1.5pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(c) Shared AF_MCTP =
socket (affects 80311: mctp_helper.hpp)</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Only one socket can=
 bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).&nbsp; When spdmd attests multiple=
 endpoints sequentially, the second &nbsp;&nbsp;MctpIoClass::createSocket()=
 fails with EADDRINUSE. The fix is a process-lifetime
 shared socket (singleton pattern), draining stale responses between endpoi=
nt attestations with recv(MSG_DONTWAIT).</span><o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Since Linux 6.17 =
it is possible to restrict a bind() to only receive from a single remote en=
dpoint [1]. Call connect() with the remote address before the bind().<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Is the SPDM imple=
mentation using asynchronous messages sent by the responder? (KEY_UPDATE, H=
EARTBEAT, END_SESSION)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">If not, I think t=
he bind() could be removed altogether.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">bind() isn't need=
ed in the case where the Linux host is performing a plain send() then recei=
ving a response. A similar situation was fixed in pldmtool [2].<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">[1]&nbsp;<a href=
=3D"https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@codeco=
nstruct.com.au/">https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6=
460c56@codeconstruct.com.au/</a><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">[2]&nbsp;<a href=
=3D"https://gerrit.openbmc.org/c/openbmc/pldm/+/83626">https://gerrit.openb=
mc.org/c/openbmc/pldm/+/83626</a>&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Cheers,<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Matt<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
</div>
</div>
</body>
</html>

--_000_DS0SPRMB0144E17B9D846259CD076C54A65AADS0SPRMB0144namprd_--

