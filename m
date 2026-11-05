Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F914606A31B
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2026 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=gNKOcaSx
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jKvcH4MTcz2xyh;
	Thu, 05 Nov 2026 18:50:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793865023;
	cv=pass; b=AQg1spFh0D5XB6CeTt3vCRN3AR8WMLtD90/4XIWES8tXREwHjXT8eI8jeOKYoEKKTuJsZuhd4NdqsiJaBG8uedA4QtvwqKgQVQ5+7cNEp+dOaa0vXTOxdLdhGbu9xCmYDBzLIT9X7X82EVbiF6dxHdJbfuLT+U1lLJclBc84b7nJiW5Vw3zMGqe8QseqL6F+JAo4u7uxpTK98I9TOJ03XkNSrFh5aa7iIjII9EpJYjZEJUMkIdhooxlI6632oyPQkJfTLTm156OSP2TUbpe7X4dS1UV9ftmrjLTgXXB5HN2VspRAhUYa7Fsxe4LZ9knLX5Hv686UHqJ5i739JvK47g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793865023; c=relaxed/relaxed;
	bh=A5Z4ECIvLDAxlMg+2WVWJhL5vW+CYbt4RsEzpm0n5Wc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M9Wt2oBID0pg67CkwmJRO/M1mRLA4sSRxig5bS3DdySLLt0eFWPhje9CW8HXobWZ1KwlZCUiEbKVT0OV2rrvKwyjpp6LFuK5BQCJk0MKF8cYiKjPEPAIJx9eyMVn8Luzv5NllGFD/X4kD5JMUEesXkFNnjVRxE8knVyGvXi9rYWf+4u7BV+qwX1eg+cn7CRhH7lWPhdDBxdD7gK53zLtLj84HjLIid3KFppYKMMWa+avM5cMIzi7VMywuBGsBPyuXrituNleNzTRhdb1Q1SIFTa9wfaajHtv08CSq2w5Xd7eQmhugnMsJZB31O3vjeyMohCJLQNyuTJ707UJmkTvdw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=gNKOcaSx; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=gNKOcaSx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jKvcD5n6Kz2xGr
	for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 18:50:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK7VLB0Yqwi1gNmkKVJT9AcbBZjLYCJBRSfv85PxoumsYDBEMPqEFp4YBlvqG/uhkuB1MAxPhf1LCDWtjiQ9/Z/MZKoxG75OjWvGxtGmPO8HnLwFeruYM60a4BOgUTv6WJLfriH6jgghyWNSFMTYYTH4e3tSXCfRRVVT7UYmIyoUG9lGGl032gBHgp3Dk7yAONG/V03AzEz3VCyOgj1aKvC8DhL1Kl23uq0w7m+CGPG9HwW/hkeH9eoTPMbQyfMGGDFjuEFZ6mHFyuMNOmGB4vCeJjF0q1FoWylhzedbYsaSfe2X8GYRI3WIQE6aWoQ6vpEeBFaHhGMJ3zG6j8QLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5Z4ECIvLDAxlMg+2WVWJhL5vW+CYbt4RsEzpm0n5Wc=;
 b=Qow/pQt4GA3XHh2HT6YPwa4xtZgromIaKBb5xZuCn+QlJ/ACwRV6ju0BzDC9c1F8yAgQ84fS+jqcO4N0VpzWhitYuAGe6ooTYVfz4sYQgowRpRP2JVlYur3LAhTa9h44ElJJwlKKJXFYnqn5yY4ZYP0X+6Ak8eDtgpUy/c75UjVHOq6NcZF/4Zb5qDv3F7xXTuDbKJUt1jS+uI2QHyK+lHDlUgEvGM5xvbGYWswkHVpOwxz3CEmMHD0X/VRFTHPfWHdUzOKlRZcF9cGs5h9ILW5Xb8o8efvurb7bylHDLYOHyh32JHQQpf2JkLlqQzme8oAaECC4QkAgUm2oCRdreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5Z4ECIvLDAxlMg+2WVWJhL5vW+CYbt4RsEzpm0n5Wc=;
 b=gNKOcaSxQKgHNnpT9YZRyUvdqe/g1QjAr20IuGikYQF4x/UlORlGBqunx1VgX57KB9lS+kpws91/8lVhwEF7TUZhGGpa9JPMl8oj97DKR5DjCmJDVANKcnC2wJYbdu5l/eI3TIJCk0ZegqkHS8XdxoigUc0ln8at5pJ3rq6bp0FWy7up57rcROVW05F/bt1TFGZjzdYDfQdg0AJIbKa21DkFJZIL5NgJ2c/kxz8Gtunq+lxXN97VdfYqWTalN4kGN1TsgLwXiomXNsYRtEBSS2ZU0X9tZwTlQvr4ommYi3tyD4XGUG9kp5IfpDOa2R+YxphGzt+khBD7p1YInjeuhA==
Received: from SEZPR06MB5716.apcprd06.prod.outlook.com (2603:1096:101:ae::6)
 by SEZPR06MB6841.apcprd06.prod.outlook.com (2603:1096:101:191::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 07:49:54 +0000
Received: from SEZPR06MB5716.apcprd06.prod.outlook.com
 ([fe80::4ce8:9725:a5a3:74dd]) by SEZPR06MB5716.apcprd06.prod.outlook.com
 ([fe80::4ce8:9725:a5a3:74dd%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 07:49:54 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: Lee Jones <lee@kernel.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"tan.siewert@9elements.com" <tan.siewert@9elements.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>, "joel@jms.id.au" <joel@jms.id.au>, Rob Herring
	<robh@kernel.org>, Linus Walleij <linusw@kernel.org>
Subject: RE: [PATCH linux dev-6.18 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Thread-Topic: [PATCH linux dev-6.18 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Thread-Index: AQHdbImkyyQJLPaB2EaCOVGHV4CqsbcfGONQ
Date: Thu, 5 Nov 2026 07:49:54 +0000
Message-ID:
 <SEZPR06MB5716D22F69741B77829B2C4EE2772@SEZPR06MB5716.apcprd06.prod.outlook.com>
References: <20261029031552.515601-1-vince_chang@aspeedtech.com>
 <20261029031552.515601-3-vince_chang@aspeedtech.com>
 <20261104182342.GF1650678@google.com>
In-Reply-To: <20261104182342.GF1650678@google.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5716:EE_|SEZPR06MB6841:EE_
x-ms-office365-filtering-correlation-id: 45ef6fb5-c074-4a04-cee9-08df3b116184
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|38070700021|56012099006|261021123027099003|4143699003|261022105027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261009223027099003|261021121427099003;
x-microsoft-antispam-message-info:
 3xTsIFkHAdE3K+gEp9q2CZP4S4gPDGuPiysIrKvEOWNBfI47o5QMMV2FG0E4/cepWjslHxTxlLE1sKdTmaIFwAfQrufS57O1lIKxzJ7VdAaPI9UPCcRH6LPUB1hZuX2zpe8mzfDbbMgdNqTZMhOi3nVB8e7V6YYdXBrYiqvzD/yaaWVXhD04ggkBRw8wa7xpcAgwDMFeocaFmzXv0LcuGBLOcHnWHuU8VeLvJVIRT9NlRfKksiENM5lDUQyPhm8lazhXtwraS37LrETtEl99pKXnFOe6V7waYspw+DZkRFQGKc34+PoDvp4dSeZ8tUy75J8MNnYPpx9AyzWG28S7ppDlHqdhDMcH7V0fSCYfU6ZtTjuq2Mv5e3WM0NYONImbeQKt7kFZ9hpNqxGsPVc6zxnfGvE+Wv+OuYQOIrZbYJa96MA40UdURTPEFDQsfmy2eN7Nn0vYYd7zIY0523G9S39lXpqyHa2xlWRjU7EVTRv37CNo5AcGHm1nMorQ/oB1f9rQ4cc0+xhCh9/2rP+xbgsH5Kwjrf9qRWG8QUEF4crnV6pcKrogkaPS3BB1q4/WqRExv5RDu8BwTu17YEhGPSQFIHfyRKS5pWW5BjXWsQOGLVEt2UZdj1kWtnClxJM8TKEPITEDTTJZk1MbC3syRcX4ZahS+JkuAZPS90FL6OI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5716.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(261021123027099003)(4143699003)(261022105027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jGDRHad3b7l3U2QOw9ZQTTceTwpXZpfjMKZWO4FnB/Z21D0EblQYtf7mLitX?=
 =?us-ascii?Q?7ibdTzbQ0XPESdPjQs3KRrpjkRpjB2Ymwa4piB257JAnPG+QBg2Q1eVuc5MF?=
 =?us-ascii?Q?pVwtsyYDU4mO3lJn6B3qyPXTDzMZ/yIP/I5h05Bqtpl0+pNiPABv0pjXSwG8?=
 =?us-ascii?Q?GvO4ngISUAx242sz0zQ7ymIsgRhIhMefiTfg/WJ9qxF4U6YJbkiI2JOhjB1l?=
 =?us-ascii?Q?HJFhwrE6/DiwB+ZVa1jLQ33cXuQfvqSEt0FXc7FKO0TCtxIhgjR4kKi55KfV?=
 =?us-ascii?Q?5yImwyrZ6ofOr70vfzYqBiPgzj3g5q+93PzddToDnxbAHPIQlxngx16wvkTf?=
 =?us-ascii?Q?WjN2Uf6ht0nI95XW/V9jyA8kz8qScFwicV1bGsfIrbGI8AJFlBamLrljrvhJ?=
 =?us-ascii?Q?QB1zT0UyAwNH9mFfoisdGLDcCL8WEPuucof8KSJTGEAp/A6qejXZew5rA5m/?=
 =?us-ascii?Q?ZmimVG4CGCCZj3ZdPW3t4RBZjkYk2EMAIxoKMf4/MABV+umSdA0QE2TjMebu?=
 =?us-ascii?Q?z+XBsrIho+vDHOXYJaHgjq70XUmpQji4JtzOeYkU6fWMEljA/AshU7cLns6q?=
 =?us-ascii?Q?JteTf7cpaci+lXbB4oAkpEWls8KMOjpEvyYR3fSo/zmc9fX9Hq3zqwoi5aSX?=
 =?us-ascii?Q?oSPw8dH7J1NAbN+rs4aXYJpDherqsEJjPhAOdo1r4cf2LFyVpj/zRPlEYbeR?=
 =?us-ascii?Q?BL3tzom1JTQSQkMf5JPJJHzMbhTZr+IDJjCud+ldsrlbFrCxNUDjXyEi5DQr?=
 =?us-ascii?Q?fxlPH+WJjomvJo+0LNUX8sLovphfEXBw2nK8G/T7BoYnVX3FfzORTYwiZzvt?=
 =?us-ascii?Q?drsbu+PIN9dFmLxsEbqAlDUBuc7R2ksIljfeXNi7V9PpxJsdEPxn7SKNnJP4?=
 =?us-ascii?Q?GSI7yNoJzDxNRoMV/faG4qWo2ROa5kY5mcnPCispkBObCZ03JNVJ3BKhWLRl?=
 =?us-ascii?Q?wHVxHHvbyfx2KNEaF5Ns+wG0vD9N4FDI4FJ5iAih64B0TPZnTJ09itgO4qp2?=
 =?us-ascii?Q?40Dhy/JtAKD1eIUsudYMqr3nBfWmjAdILesxLgF4mgK5c9NSEhRLwOMS8kOQ?=
 =?us-ascii?Q?/A/X4HuuI7KbC1DAiKRC7welB6fOH5MD9HIhygn9AKH+loJbEYnWS01XFmYA?=
 =?us-ascii?Q?MXNQhKRFZdr5ea9J9cwHVeBy55xFU+ZpCmTskAsHZ0tV7FuKa1Fmd0OcCgI3?=
 =?us-ascii?Q?GMEqKUmz/JrNdgl+cr+qW4vIrb1LwN6U9K8HrDLCaWJwczZSR67Cm8sc4xaZ?=
 =?us-ascii?Q?lbCPMqAtqjphP16+zObIJ1bfS+2d8HAZxxxuI0K/T+cRul4/D6YLq88Kgg95?=
 =?us-ascii?Q?xHNQHqKFPD3z1gR+RJ0iWEKuVQWcvsldWJGGEUbl9jukl/nEshKXYsIiGqjE?=
 =?us-ascii?Q?/0pNQh8f/c86dJIlkVk4nnbbepjVENlixeAxwySgnz8iwBzOw/o9D6cwbM9w?=
 =?us-ascii?Q?vJSERWd8JEdTZGM9Y7l0Ma6ob0wn5O2glyChizGyunsW80eQPjW1ucw1fYvX?=
 =?us-ascii?Q?KvzMNDeay5rvcteSqqqQ0fP3hOhnrXvbJObDD+kaZ97KcIu3G4+N42yyR2sR?=
 =?us-ascii?Q?hjJGKrtZ2vWubJt84hj6yOOUslQB0IseQGZrAJ3KGZ4zyA76dcAolTQmo1aN?=
 =?us-ascii?Q?ErEK+oE0JVE6zncvecEbvMdeDsruJmN4gTClptziLMZtsY6gJwB2t+PS07dN?=
 =?us-ascii?Q?lU2mReED123L1sdDsRoQKG4GfjNu+JYSK4+7bvCnfdsjNHR8m7dozqM/RNUr?=
 =?us-ascii?Q?qAD+woQBEg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5716.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ef6fb5-c074-4a04-cee9-08df3b116184
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 07:49:54.5966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SUwInYRISBT/ZcsNsAJdrK1Cq+tiWGO36+I/MmoOz+LJxpUrHQbum0mKjZH460ZgLPFRXsQoLR5YEZ7cW/IdgZ6NLcH+7F1EuvJHpqgIRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6841
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee,

> Why are you sending downstream patches to upstream contributors?
>
> Please check your `git send-email` settings.

Sorry for the noise. This patch is a backport of an upstream commit to
OpenBMC's dev-6.18 branch. It appears git send-email automatically added
you to Cc based on the original commit's trailers.

I'll fix my git send-email settings to avoid this in future backport
submissions.

Thanks,
Vince


************* Email Confidentiality Notice ********************

DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, November 5, 2026 2:24 AM
> To: Vince Chang <vince_chang@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org; andrew@codeconstruct.com.au;
> tan.siewert@9elements.com; Billy Tsai <billy_tsai@aspeedtech.com>;
> joel@jms.id.au; Rob Herring <robh@kernel.org>; Linus Walleij
> <linusw@kernel.org>
> Subject: Re: [PATCH linux dev-6.18 2/3] dt-bindings: mfd: aspeed,ast2x00-=
scu:
> Describe AST2700 SCU0
>=20
> On Thu, 29 Oct 2026, Vince Chang wrote:
>=20
> > From: Billy Tsai <billy_tsai@aspeedtech.com>
> >
> > AST2700 consists of two interconnected SoC instances, each with its own
> > System Control Unit (SCU). The SCU0 provides pin control, interrupt
> > controllers, clocks, resets, and address-space mappings for the
> > Secondary and Tertiary Service Processors (SSP and TSP).
> >
> > Describe the SSP/TSP address mappings using the standard
> > memory-region and memory-region-names properties.
> >
> > Disallow legacy child nodes that are not present on AST2700, including
> > p2a-control and smp-memram. The latter is unnecessary as software can
> > access the scratch registers via the SCU syscon.
> >
> > Also allow the AST2700 SoC0 pin controller to be described as a child
> > node of the SCU0, and add an example illustrating the SCU0 layout,
> > including reserved-memory, interrupt controllers, and pinctrl.
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Acked-by: Linus Walleij <linusw@kernel.org>
> > Link:
> https://patch.msgid.link/20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@as
> peedtech.com
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > (cherry picked from commit
> 2611c4d623ba867e196a4146f1927c3c468ac2bc)
> > Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
> > ---
> >  .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 114
> ++++++++++++++++++
> >  1 file changed, 114 insertions(+)
>=20
> What is this?
>=20
> Why are you sending downstream patches to upstream contributors?
>=20
> Please check your `git send-email` settings.
>=20
> --
> Lee Jones

