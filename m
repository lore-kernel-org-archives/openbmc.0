Return-Path: <openbmc+bounces-2665-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB9CA5FAE
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 06:59:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hv8DY0HnQz30Pp;
	Tue, 29 Sep 2026 16:59:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790665164;
	cv=pass; b=EBCfO17XQN4u7RC/TXHzzf2CM5Hym+m6v4rnBVMbMM5f441Sb3nwf1bAxjRLSQUk5z6WaS1ca4JHUCh5EMqZMachdm8H8dlAQpARu5/hlsQfLdVdpCmq+kEoIc5FUp6MhaA6XVpvSS8KgkmveOfEF2V3cEzPuJexbGuytqUe06D9Pyc8NHTkZDFHuq8AFGM7zyO7+B0Fq8KwNQud1iudIpHoffa/jcIk9jTKnEJPFOgERXYJSiuLT1niqBkAJrInRvtwwfDSu9YinA5bxlwXl0waIIrSha0Npv3aRhwnUup6KfVro8/slLZ/k53x7rB/swBITH5OOZ3nx6+W/W2VoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790665164; c=relaxed/relaxed;
	bh=Z6FVwTmoB5NVVWiWfGwGZ7Adx4p0uUUfMQhUopZqa40=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IhmXuneQ2v+askzyV70BWu4kXrEjKfQhCj7FflQ97HzdGMvM8joB2hov/793sHIqB4cRxp3rkpFw8caBgrkL1I5amcoUqI1vjo785hMfN6ocU9nAgBvXmpcz3keyI0lJ4lTsQYV+UGLAO9+7uFrug5dLKSyA6/v1O4UNxQ21ka4b3olLB9qnpTRtQNU17Htxp64gjehCBySxgAlK+IQQ9XKzH0Tdk5iu86vX2UU72SmvxhXKzx13xGJMBigzNBwb2edNbXs0dLvN5jJrZ6YdB3zBe7EcW6JueGZoSXZXNZvW1jC5+OPZ5m6FzfgTgE9OMogW/xLVfPF9xzXwVT+7+g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; dkim=pass (1024-bit key; unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=selector1 header.b=eJOapunD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=vivekanand.jha@einfochips.com; receiver=lists.ozlabs.org) smtp.mailfrom=einfochips.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=selector1 header.b=eJOapunD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=einfochips.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=vivekanand.jha@einfochips.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hv8DV44p7z2yDD
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 16:59:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWbAV8XgzxuhE69XWT5qWJEzqVQYqF48lju8AzkBrI4noR9RATmiHrP/KjxPDvXJ+vi0fqAdoG87KkFx/CxCU8ZFjcycwtGovBaQ9BBO4gWCaxvDTNXAgbQduYQE7pLyFjNCNlADaoGlao23eHwGuM9G5lgFcxxPSSgWduWfFJbjNAPTd6Do8DEPRB0R1Og4DUPIHgo7JcPpgUd2oaJk5dSql8NYQN8SHafUgOofkVbe2SUKg6OWRdWN97lu57wi+hz7TpcQDTO7NQQ9viJYcv24y8AR1woI6vxPzVz0F2BUwcLFnEQceApV8eg4ebSvflH7G+zaYeJvQfSMVc3yFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6FVwTmoB5NVVWiWfGwGZ7Adx4p0uUUfMQhUopZqa40=;
 b=DPQgBdy5pms6kMC1PE9ULDUJHg0CPXlxUmkjc5eSCUMHEOx3GT1itsy3uej8WxjQYBFDGWZEuTITlUxqcZyz6GFtO8sreR46lBq3ZKChZWijRWPfm0+xWxoql5m/SeE1v8nOLxatLfiHcUnDUxnIL1C35sAA5smtaRR0WMhBHO5mtWxEzgwpMrAj1CdjMtulDzP/VstywdgAw4Nlb2ZtzqsNdToXTP3j4jyKGGGahZRi8ZzCGd/n1hlEFn1KW5vlRZpR842OS3vgjACMl5PP5M4ZwKHM7Y+27E8V9+CWuPyTZyJzOV1QI4H2BJeGHhHI9+DSwczwGNDKtECdEhqaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6FVwTmoB5NVVWiWfGwGZ7Adx4p0uUUfMQhUopZqa40=;
 b=eJOapunD/NlyD2UkTzQrxd6OY49WaCYJaIn+AYSnt2Z7h9rB7jo2/4+2LMXGsOe1X9+T2KesfHwH/pFum2exCD77TL1k5hfQ1JMfxhr0NEEa9kmHeaNNr0Jjmgv5gscPgC/nODAGzJxW2fxaMJMSEN+NsY+rG3vf0PwG1/thEJs=
Received: from SA1PR04MB9802.namprd04.prod.outlook.com (2603:10b6:806:4a7::8)
 by DS2PR04MB994675.namprd04.prod.outlook.com (2603:10b6:8:3c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 06:58:58 +0000
Received: from SA1PR04MB9802.namprd04.prod.outlook.com
 ([fe80::9226:1fa:1cc0:92b9]) by SA1PR04MB9802.namprd04.prod.outlook.com
 ([fe80::9226:1fa:1cc0:92b9%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:58:58 +0000
From: Vivekanand Jha <Vivekanand.Jha@einfochips.com>
To: "geissonator@gmail.com" <geissonator@gmail.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Vivek kumar <Vivek.kumar@einfochips.com>, Krunalkumar Darji
	<KRUNAL.DARJI@einfochips.com>, Krupal Ka Patel
	<krupal.kapatel@einfochips.com>
Subject: Clarification on BSP Support and Linux Kernel Approach for NXP SoC in
 OpenBMC
Thread-Topic: Clarification on BSP Support and Linux Kernel Approach for NXP
 SoC in OpenBMC
Thread-Index: AQHdT97uIDY2IRkY30+KA51rUgnGJg==
Date: Tue, 29 Sep 2026 06:58:58 +0000
Message-ID:
 <SA1PR04MB98025B61B31179557A85D097F18C2@SA1PR04MB9802.namprd04.prod.outlook.com>
Accept-Language: en-IN, en-IO, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=True;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-09-29T06:58:57.874Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=Public;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=1;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR04MB9802:EE_|DS2PR04MB994675:EE_
x-ms-office365-filtering-correlation-id: 5c104fd9-48c4-4512-f1f2-08df1df7226a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|6049299003|31052699007|39142699007|366016|4053099003|38070700021|10067099003|11063799006|56012099006|8096899003|18002099003|55112099003|6133799003;
x-microsoft-antispam-message-info:
 h5Ak1avRyiMc+F1U8mowptcJ1lfYI2+6huv48eDDiUh5VeUMlxr6VUAiTVfd+hS3YJOhsUVk9hvQKCZptm1nUE2LIV19W5ENLVq7v+tBnTnkX9Grb+KY23fSamfddYc1f6CAO4m9JLAY8WYZX9uAEyn53CzEo5HndiZipu7y3K2jiwb72+U7shMtWlxHEpjny/VZN8PnBB2SZlJKmpDHHHaN1vbdiCK06AbiwRJTDUX6S26Ipyv6mnuHPd+tQcH67YTfbbqAvO8EI/eHjMpByfvqXNrwyzNkTb2Kya1CDS94Sx8Dzk9WI4jPk4mt4jtfS+EV7+m1dJk3nthS7HlfN1iuiXDma6vUnbyw3eJBNYG4BbeyOUI0xMZzVdYH0UMee0EhHi+Ilt4YQZA4rgOfVlA/Klg3MEuscT+Ys7ZjwcOSTRgD2czfhaaZWoq3CX3gGGOgfzyGQ2508vO4YFG0GbkkqlJg1WNQCpErzibXkMu4sKdjrNwCq909eoO4jt2KhzVrC3mQGL6EC5WdE8LbXCqdziWtt1mZkBpuUeyVcyWtKEdA415SBTucGlAd76BtDkFqoQWyfMqmsS4iGeFWj2D9QL2cxUKyyVwW5gUyUPZH6SV+cU8TXNQdd6xpkR0ZHL0nrVBjXDLR72kujKnFGz6rA6tKuFOmCvEvlp5tjhY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB9802.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(6049299003)(31052699007)(39142699007)(366016)(4053099003)(38070700021)(10067099003)(11063799006)(56012099006)(8096899003)(18002099003)(55112099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f5Mt7DEUtEiDzV/WuyIOzjYzEJTzStSH1AsFVty5O3Ja/xJsnp3cyBSoka?=
 =?iso-8859-1?Q?8smG/e/XXQu819jbXiRB3QviFQZBvIcE1fF6a7xS8WrXV/dQyjGVKKIUlz?=
 =?iso-8859-1?Q?gWOC2ct+bAoqneqgcOe9sRrndmTZHLQyALq/0CzVFzX7EQ/lElZriPy5cC?=
 =?iso-8859-1?Q?QnInZqE/s+XC6RZV+wiAhyhwY1f5IH1O4LUBdc/5VvxTSjObK8DpuB4RXG?=
 =?iso-8859-1?Q?4L/vbgH5P8u1OLP+8y3vB6MZ0eHQIWdRpcKIbprhDjWu1fnOdUO8tqr5i+?=
 =?iso-8859-1?Q?b5LxKVz78eLaC4Nfx72O12KmRvmjqfQPSI4gmVKPdrZDh6lh/magJ+kNPi?=
 =?iso-8859-1?Q?h4e040QyIcZrwucms50XcgLaRB4TGrb+aMOMSPcAtVj09yVa+FdQO1K679?=
 =?iso-8859-1?Q?Hr3xJsxKOKN+qTYsnr37+X3sNX3OOc1ClHF4IKUOcwfecUkKYsaJ2PmZkM?=
 =?iso-8859-1?Q?H23BjylH+Zr5e7qqNlg1yYoq8Dq+sB9su0kSzS2LqvRPJkpVMgKbxVh18m?=
 =?iso-8859-1?Q?XqCbWPgEsorXv7FKCfUY20bCUvc9nq8WP1pU2/j5hvAgTuixxaWfsBKc4f?=
 =?iso-8859-1?Q?so/gMKI26iGsOPtMhMQmcle3pW+UxFsIyGpUNYF8ev4rdMYLKq+nad88r3?=
 =?iso-8859-1?Q?fB/EP1Fjpg55FC4V+kMoZ6CcmEFmahs0C7oeuGzAYGpYq1U7RQHNtAc+Ri?=
 =?iso-8859-1?Q?+CnZ2vo6TSa+Gh/OAlalOVz0KuHRCxkhS8y37FyvuhP49A0ogyfcQjjkrx?=
 =?iso-8859-1?Q?qTd/r5B2ScbXksbILJq3CxIXrdxhFyOtMhCXbaobeFCyVXvKIZIGIRXmxt?=
 =?iso-8859-1?Q?wrqCKIz/+R/OJfqg6N3vvCq02MtH/vAEU/CaA98vPGumQKjv++NdmvRXS+?=
 =?iso-8859-1?Q?t+FbuGouFHJ9Nlt6H7SsoUKW33SRRRK5dsqnaP0Y0Wi8v8e/k3SymnKKm2?=
 =?iso-8859-1?Q?+SEyfZQmEbm+hV2RaAbhxGS0jV8B00pZ9pTPvjXgukvfsWqPFt+1H8GHda?=
 =?iso-8859-1?Q?0a44L/FVtWnnd7OzdxMht52oIqxXffw1f+TCaHMby0NnZSybgPdlRgxuBw?=
 =?iso-8859-1?Q?XxkXJpCzd/m21WL9+Fp8EyL4+4TzSIjeahBf1DqpzBsRziON5nsghXryaQ?=
 =?iso-8859-1?Q?xhwIaXVqMBa4QXKfycbd23fQfinirDJH+zhSxciPgL7sunWYSXp7KVAiwd?=
 =?iso-8859-1?Q?wi2pjofUY9JZGDTsDLBb2MSSpJERv/d2VeRbakKrlyC0RmaUnt2d78wUup?=
 =?iso-8859-1?Q?aPlPR56NaM6XXak+odfygC+pypzZo65J0IrrF2BoNtXLLYHfMxshwYLHcG?=
 =?iso-8859-1?Q?h1UzOXixPXbbNmoSv+dzWrdXDy4DRzQhigvQS5im4W3h9YWNV/Cxuwb4Ln?=
 =?iso-8859-1?Q?Zz16z74vzxNFBz0bg46kyeIT6HqutD/OHNMk1DoD4S9OlGcJtKAYgezfjG?=
 =?iso-8859-1?Q?clcWqaWwVzy0W3qtm0jHlIEBwuDGl9oqMQbtC6/VzWbdBAlCJjmzDgwGsA?=
 =?iso-8859-1?Q?MwPa4OQLUe/0oSGGht031946HFlCC8FnwW/8zrclIS2Y2wfPQ+BlIAqJO/?=
 =?iso-8859-1?Q?5n29UFPr3Djxip8/RpKP28WpKGAYa48FIRLdJnV7wg4ZBv04oFZokef//j?=
 =?iso-8859-1?Q?zV+ZNmTNqqJxKwGT5kFR4+y2CmPcCmRoV0Hg5G2x1sxyGapJFQN9sftSxT?=
 =?iso-8859-1?Q?ma5OaXGk4oU5e0igU3nmzy2Y8pGiBw4acHbXH7e5LajLYus8fKDOI3L1Gt?=
 =?iso-8859-1?Q?Ox28ynG6dRj6LbqR7PlehsEhr+fegpu4osaqyFeLLs3nRYcTLEF4LqZjhI?=
 =?iso-8859-1?Q?neJLKlGji4GVSm8RZAm1fw5OB9KnUBE=3D?=
Content-Type: multipart/related;
	boundary="_004_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_";
	type="multipart/alternative"
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
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB9802.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c104fd9-48c4-4512-f1f2-08df1df7226a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 06:58:58.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiCDPKzM+xmLs2zWZ+EoeZOCU+D9Oz0+UHpzEyHO4gVn5aYjbsqMkgrr3iUA4kYpNzBnxW87hvzm6tffiJxzJDna8ynnAHnhFsavBAf80vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR04MB994675

--_004_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_
Content-Type: multipart/alternative;
	boundary="_000_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_"

--_000_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hii Andrew,
I am currently looking into contributing BSP support for an NXP SoC to the =
OpenBMC project.
As I understand it, OpenBMC provides BSP support for platforms based on SoC=
s such as ASPEED, where the required Linux kernel support, device trees, dr=
ivers, bootloader configuration, and other platform-specific components are=
 integrated into the OpenBMC build.
For the NXP SoC, I would like to clarify the expected approach and scope of=
 the contribution.
Specifically:

  1.  Linux Kernel
     *   Should we use the NXP-provided linux-imx kernel, which already con=
tains the necessary NXP SoC support?
     *   Or should we use the OpenBMC Linux kernel and upstream/port the re=
quired NXP SoC support into it?
  2.  BSP Components
     *   What components are expected to be provided as part of the NXP BSP=
?
     *   For example, should the contribution include:
        *   Linux kernel and device-tree support
        *   U-Boot/bootloader configuration
        *   Yocto machine configuration
        *   SoC-specific drivers
        *   Board-specific device trees
        *   Firmware configuration
        *   OpenBMC platform configuration and recipes
        *   Any required patches or layer changes
  3.  Kernel Maintenance
     *   If linux-imx is used, what would be the preferred way to integrate=
 and maintain it within the OpenBMC build?
     *   Is there a preferred OpenBMC kernel version or branch that the NXP=
 BSP should target?
  4.  Upstreaming Strategy
     *   Should the NXP-specific kernel changes first be upstreamed to the =
Linux kernel and then integrated into OpenBMC, or can the initial BSP contr=
ibution maintain the required patches within the OpenBMC/NXP layer?

I would also like to understand the expected directory/layer structure for =
an NXP-based OpenBMC platform so that the contribution follows the existing=
 OpenBMC conventions used by other SoC vendors.
Could you please provide guidance on the recommended architecture and contr=
ibution approach, particularly regarding the choice between linux-imx and t=
he OpenBMC kernel?
Thanks,

Vivekanand Jha
Associate Engineer

vivekanand.jha@einfochips.com<mailto:vivekanand.jha@einfochips.com>

[eInfochips | Enriching Lives Through Engineering Excellence]<https://www.e=
infochips.com>





--_000_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hii Andrew,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I am currently looking into contributing BSP support for an NXP SoC to the =
OpenBMC project.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
As I understand it, OpenBMC provides BSP support for platforms based on SoC=
s such as ASPEED, where the required Linux kernel support, device trees, dr=
ivers, bootloader configuration, and other platform-specific components are=
 integrated into the OpenBMC build.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
For the NXP SoC, I would like to clarify the expected approach and scope of=
 the contribution.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Specifically:</div>
<ol start=3D"1" data-spread=3D"true">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>Linux Kernel</b></li><ul data-spread=3D"false">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Should we use the NXP-provided <code>linux-imx</code> kernel, which already=
 contains the necessary NXP SoC support?</li><li style=3D"font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Or should we use the OpenBMC Linux kernel and upstream/port the required NX=
P SoC support into it?</li></ul>
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>BSP Components</b></li><ul data-spread=3D"false">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
What components are expected to be provided as part of the NXP BSP?</li><li=
 style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cali=
bri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
For example, should the contribution include:</li><ul data-spread=3D"false"=
>
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Linux kernel and device-tree support</li><li style=3D"font-family: Aptos, A=
ptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0);">
U-Boot/bootloader configuration</li><li style=3D"font-family: Aptos, Aptos_=
EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Yocto machine configuration</li><li style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">
SoC-specific drivers</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFon=
t, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
Board-specific device trees</li><li style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">
Firmware configuration</li><li style=3D"font-family: Aptos, Aptos_EmbeddedF=
ont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; =
color: rgb(0, 0, 0);">
OpenBMC platform configuration and recipes</li><li style=3D"font-family: Ap=
tos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-seri=
f; font-size: 12pt; color: rgb(0, 0, 0);">
Any required patches or layer changes</li></ul>
</ul>
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>Kernel Maintenance</b></li><ul data-spread=3D"false">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
If <code>linux-imx</code> is used, what would be the preferred way to integ=
rate and maintain it within the OpenBMC build?</li><li style=3D"font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Is there a preferred OpenBMC kernel version or branch that the NXP BSP shou=
ld target?</li></ul>
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>Upstreaming Strategy</b></li><ul data-spread=3D"false">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Should the NXP-specific kernel changes first be upstreamed to the Linux ker=
nel and then integrated into OpenBMC, or can the initial BSP contribution m=
aintain the required patches within the OpenBMC/NXP layer?</li></ul>
</ol>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I would also like to understand the expected directory/layer structure for =
an NXP-based OpenBMC platform so that the contribution follows the existing=
 OpenBMC conventions used by other SoC vendors.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Could you please provide guidance on the recommended architecture and contr=
ibution approach, particularly regarding the choice between
<code>linux-imx</code> and the OpenBMC kernel?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div id=3D"Signature" class=3D"elementToProof">
<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
<tbody>
<tr>
<td colspan=3D"2" style=3D"padding: 0.75pt;">
<p class=3D"elementToProof" style=3D"margin: 0cm; font-family: Aptos, sans-=
serif; font-size: 12pt;">
<span style=3D"font-family: Pacifico; font-size: 11.5pt; color: black;">Viv=
ekanand Jha</span><span style=3D"font-family: Calibri, sans-serif; font-siz=
e: 10.5pt; color: rgb(0, 75, 118);"><br>
</span><span style=3D"font-family: Calibri, sans-serif; font-size: 11.5pt; =
color: rgb(85, 85, 85);">Associate Engineer</span><span style=3D"font-famil=
y: Calibri, sans-serif; font-size: 10.5pt; color: rgb(0, 75, 118);"><br>
</span></p>
<p class=3D"elementToProof" style=3D"margin: 0cm; font-family: Aptos, sans-=
serif; font-size: 12pt;">
<span style=3D"font-family: Calibri, sans-serif; font-size: 11.5pt; color: =
rgb(70, 120, 134);"><a href=3D"mailto:vivekanand.jha@einfochips.com" id=3D"=
OWAae721e54-042d-c40a-5deb-e530e3b2a8ac" class=3D"OWAAutoLink" style=3D"col=
or: rgb(70, 120, 134); margin-top: 0px; margin-bottom: 0px;"><u>vivekanand.=
jha@einfochips.com</u></a></span></p>
</td>
</tr>
<tr>
<td style=3D"padding: 0.75pt; vertical-align: top;">
<p class=3D"elementToProof" style=3D"margin: 0cm; font-family: Aptos, sans-=
serif; font-size: 12pt;">
<span style=3D"font-family: &quot;Times New Roman&quot;, serif; color: blue=
;"><a href=3D"https://www.einfochips.com" id=3D"OWAab90f8e1-1847-f05c-40c8-=
948545f37766" class=3D"OWAAutoLink" style=3D"color: blue; margin-top: 0px; =
margin-bottom: 0px;"><u><img alt=3D"eInfochips | Enriching Lives Through En=
gineering Excellence" title=3D"eInfochips" width=3D"250" height=3D"53" styl=
e=3D"width: 250px; height: 53px; margin-top: 0px; margin-bottom: 0px;" size=
=3D"9472" data-outlook-trace=3D"F:1|T:1" src=3D"cid:8fdcbf77-33d0-44ff-90b4=
-b47c21fd8a5c"></u></a></span></p>
</td>
<td style=3D"padding: 0.75pt;"></td>
</tr>
</tbody>
</table>
<p class=3D"elementToProof" style=3D"margin: 0cm; font-family: Aptos, sans-=
serif; font-size: 12pt;">
&nbsp;</p>
<p class=3D"elementToProof" style=3D"margin: 0cm; font-family: Aptos, sans-=
serif; font-size: 12pt;">
&nbsp;</p>
</div>
</body>
</html>

--_000_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_--

--_004_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=9472;
	creation-date="Tue, 29 Sep 2026 06:51:20 GMT";
	modification-date="Tue, 29 Sep 2026 06:51:20 GMT"
Content-ID: <8fdcbf77-33d0-44ff-90b4-b47c21fd8a5c>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAaIAAABaCAYAAAD6vVKvAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDkuMS1jMDAyIDc5LmE2
YTYzOTY4YSwgMjAyNC8wMy8wNi0xMTo1MjowNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRm
PSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNj
cmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6
c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHht
cDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDI1LjkgKFdpbmRvd3MpIiB4bXBNTTpJbnN0
YW5jZUlEPSJ4bXAuaWlkOkIwQjkyNkM5Mzg0MTExRUY5Q0I1QTY1Njg3MUI5OUFBIiB4bXBNTTpE
b2N1bWVudElEPSJ4bXAuZGlkOkIwQjkyNkNBMzg0MTExRUY5Q0I1QTY1Njg3MUI5OUFBIj4gPHht
cE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QjBCOTI2QzczODQxMTFF
RjlDQjVBNjU2ODcxQjk5QUEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QjBCOTI2QzgzODQx
MTFFRjlDQjVBNjU2ODcxQjk5QUEiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94
OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6C+n3FAAAhcElEQVR42uxdMYwsSXmuQ08yweGb
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
AABJRU5ErkJggg==

--_004_SA1PR04MB98025B61B31179557A85D097F18C2SA1PR04MB9802namp_--

