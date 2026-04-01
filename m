Return-Path: <openbmc+bounces-1768-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D411B10F9310
	for <openbmc@archiver.kernel.org>; Wed,  1 Apr 2026 00:16:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fllsJ1wX2z2yYY;
	Wed, 01 Apr 2026 11:16:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775002596;
	cv=pass; b=k4M/hkTqihY+oymdSVfKkDtxPkVRshTEzfMEvfjfrF1av4x5aHiceSwA3ZCjKIiqzAzF1k/aTzJShQtJaJO/IW0OKF6Zus/LWnGUswg8lsph4Hx4uSx0ZLUB8wmGpnHfV106I5siEsGFTG36MQkKsBIg8OD4FZhJZkqJIVWQ1Py7cc+tB10X/U7M6V78lSIis1oWAJh12kFrrQvwzU6E1qxdtNgSAYt7z0Z1qsW/K/NlfU1l8LYz63n8NS+vfukDLRsicuV20w5Qva91eCmqHYeF1yjSNPm4bc8GRl7tXeVJX4RWXn0TC0tSZWGQzKB7kxOUmdF7tdsOU8Vlr7H11Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775002596; c=relaxed/relaxed;
	bh=NY12DAAm6IXaW6gB8PD9x4q4Et/anMU4r0Mw/dbEKSY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GEe6X7rV5G1l/Cygnm6VDaCCXpZI9SolmuSPI4aYwHpFgTIJkw4C8VCYQpb/dKnryremCyNk1R5bH7QUifFQ1dzuzS41DZVYiqiTImsbtQFVgmqG/OhLCgX29KOl+KgBI+fOB/kph5eYw8ume4PUHrwFw8RHwIcZL/U1CbvU5sd32OU8Xebu09QqmBC3v8Hp8rBto6sClEbrQjS5DXG1oKy6ovghdlVs4LNib25LAm3IGaUpXqBaFDhObVnDHXd6oOZd+09NmWyc25hvSLBOhnXd1//WUr1PbVo/dZqIqmb0zolfdaIh/CSfrqxWDoJXlXp4/QN2IKpjvNT7BcRofQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=QwXTZuoD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=QwXTZuoD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fllsF27jYz2yVT
	for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2026 11:16:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaeLSvF9bEH2+nmSNTdVTE3720Oh4H06CtlVwYCAhGRjte+4eA+yvsvLMWuvdahDgYLqE1J97LHtr74Erev5DcVt2Hlf+PWbmwfn0gGKFCbcALuzxzp2hM4xZYt+fVit+NDqYgFQlg75kBFIbwXsGdJEhQmFRrIxTSWIgGVmcTeQO4CMk226Z8v4cN6BzVZVi7m/TU/RhId5x0J9PjU8JC3FUJtREr2tYnuQxT596RU0PV7/oky3RYU4lqb9Ppc+e/0h7yLqRon3cKega/pkceJ2WY5Ya9Xj7t0pNpPqSGflHgyj3qKyavSB7tUhPzq76KqaPQ/h8S8AxnpMZDA/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY12DAAm6IXaW6gB8PD9x4q4Et/anMU4r0Mw/dbEKSY=;
 b=PslzLJqAxQHwpdB7RNGGitVI0C3qYsZHrYo8s2glo4C1MAFNjW8o3GidakOUBn8mjyMAfEHQjqEQCf1iILkoUJQT8AhoKMrsUkVhNZkBKxt68P4RGMrauNPhc/TiZ5vfGAwGoHdyR0lbmkBqDS6IFck4mCZZ5Lex6hMJg8huic9qCoxaOC3/R/m+hHe18g+/JQFcxw3GcThdlXt2qRZfnVsyGJhTj/amOv1rhjX2Bpl4g9+pvGB4OZmUWFJY2hSoiSoTaBNonFRq4zgyuCXBkdxJHlWLbA4s4NXZht087ySAge2/6qNraHSXkzHTywnh7ccUcg29rXCyh1arRvXVzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY12DAAm6IXaW6gB8PD9x4q4Et/anMU4r0Mw/dbEKSY=;
 b=QwXTZuoDP2xKxYXGPl86LPEIKfOLkG4EMqTaa5WucGnEjvrbTjEBQbeT4g1iay7cmd1uvw6mNVVGGypDx8Ji/0OpkIMUQ7YfCwVDallFsN3OoGwGtjrXZYF2p4Rtl8eCIAz60e9QWbsFBSEEXS3Hdo8OWe0O/JH64/ZEdwigVQ0Wa9rUv8HoHX+dZ3b1MvS6d4z3i90VumEqGvU+OGdb8aKHI81uh1U9d0+xDO/tkYJeBpexJXQNxUfLh30WR9iFWLOoFsCjpnc8gAr5AdJUV6mYcuG8XNdOvYoPxFLXBOmV5H/hgM3mrSR9ADfmlH5veIZDAXM/R66YwktVeYNajw==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by KL1PR0601MB5797.apcprd06.prod.outlook.com (2603:1096:820:b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 00:16:03 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::70ce:4bec:2757:dc37]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::70ce:4bec:2757:dc37%7]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 00:16:03 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: Patrick Williams <patrick@stwcx.xyz>
CC: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>, Troy Lee
	<troy_lee@aspeedtech.com>, Hugo Hsu <hugo_hsu@aspeedtech.com>
Subject: RE: OpenBMC add meta-zephyr for AST2700 A2
Thread-Topic: OpenBMC add meta-zephyr for AST2700 A2
Thread-Index: AdzAs3wlPGH6U7dNRZ2OrBTpqXi3BwAh7jSAAAxSZjA=
Date: Wed, 1 Apr 2026 00:16:02 +0000
Message-ID:
 <TY0PR06MB5707D97A634B913704396D96E250A@TY0PR06MB5707.apcprd06.prod.outlook.com>
References:
 <TY0PR06MB5707D3F95D8E083E479A5FD9E253A@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <acwQr0d53omz_2Rl@heinlein>
In-Reply-To: <acwQr0d53omz_2Rl@heinlein>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|KL1PR0601MB5797:EE_
x-ms-office365-filtering-correlation-id: cdf1c1db-96c3-4e6b-435d-08de8f83dc3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 eLdQCqSCYro9I2tytSXIMET1zCBwl6ldKWaT0rdoOZfAvD343HWvteEPnCvES9lS6fws7/IMrjhLOgYDrMrnpg0kA526iinQnUWV0KKYNQQynnhaevdFA4anM6thG/ARkxOB6bU23EUWWHvGvSxIwOaHCBBMEwsJYPMQHGe3a5O8onog+W/2IrCso3vJy2ld5//S11FzkIzgntgS5Pv2Z2mPoiEEuzbWVRfgnbn1t3x0LkXmZMDvGM1Yya5k/GLH/NBEJ7H6VkEsn/PdlChdoEo9SYLOa5KHgX2Ct4pjaPXjA1AibvlDHXmn0GpO4qajMHOWOVmwF6LYRMDPqvPBEu21DFQI6myRsY2hkJcJ7SxPjmZvRbyUq8zOZmpd0D/7ulDBhi+CmO7VPA4+AZ0JixfLZCMpU62r022jwtipqA7cgphOCizF+b8sA7vqdNDxknpESgS6lXe6WA5Nf5DXzOrnjnFi3YcVO0SXvubWbiZ+1TJ5yLXV72V7jDr2psTZo/Zib3j2woOmOJqWS8KBtmJcFZGkB5Vz3njrIB6HFmLUhWZM/BlmGulpOgr6tTIpT4+aU6IumnyXhWCOQsE5KAf+a5c+OcvxNjR+6uGOWfy1qgIbWiqtZT0azz4g/tzMF2JEhefIdc6ML1OXMIMEMVdpina3htuxQfDAqmu7oj03SoeXpkuKrSkAk0NiXsI26LJY2IluD1/FQnf/IA0qe9wWiD6W2vFzUekx2GiC1aoCbZn8GewH9ycW6zuzj/tn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7jtpjG0WCTT/W5oq3Htn94GxUgmYJjFmpv8+Ki2Go1an3IqUOdU7Va0FrzL9?=
 =?us-ascii?Q?N2fNV70Mxz2Ia0TFxy8W0175+JIaggSZ/jzEwC1WcI7Amq4aqNcB3/xZP8bZ?=
 =?us-ascii?Q?KtF7BZP+4pkoD8pK3wkeXgsA8tsOPAzpu8meWxoLtMBlYDqned8mNN8G1xgy?=
 =?us-ascii?Q?qsW3rxnJtB+ofn+RAbICz/CHTI7bMqq0iP0FLA2lM7/21UFbBscz0u/ccGrw?=
 =?us-ascii?Q?14Z0IZmPm2Z6fJNcqlqGnrfAfhZRyM/pRjGfHaUKIfi3vXXx3MalmzOsXNVf?=
 =?us-ascii?Q?6Sjc5TNrkqh11cKLyYy/ZEoczd0PK/1e4oiDLZUvKWzEa7uasNwcuBdWCvL8?=
 =?us-ascii?Q?6Mp43wqauFhMREGLrqCGywaqOjDE0GxT1tLvwjtVS6VqGJbtSxw5y4HAXSp4?=
 =?us-ascii?Q?+xwfblMOLzHUGKH/7D+GCu6KfH55ZNw4zxiliI/wlU5oc+gnqgcFZjP83F8z?=
 =?us-ascii?Q?jmAD/F+DO6YZk/Ui1+d11PYDSo4hyhJ8qgQInDP+MXktni76KOtz0/aLB0Z7?=
 =?us-ascii?Q?huINpMFHfGEqs1hhpIdKGTrO3wo5dSOHAn0n+9itnBh5oyBmtq3jrwPukpNh?=
 =?us-ascii?Q?4lH4AqvXT2qPek8La1UhpnwXDz6ZDNyBaIiQjVswR3Qns5+Ao22mx0Fb6TjW?=
 =?us-ascii?Q?boftMDvXiK6GqaInM7DvAtwEt5xgabUBJiWGpo6jU8KXtMhEAacl8gb6CbDJ?=
 =?us-ascii?Q?6vbGRakoo6E8/xrf09jFYTyS5Eu84yMufUgevxYDqHzfUXVPpczgbqe2XY9p?=
 =?us-ascii?Q?AL7o35DkWd4pBE1Dix5thb7MUGlCYT3esXmNR2g6BMB6nHNlotbhpew1zolq?=
 =?us-ascii?Q?M22s8UojpJ/j/GmTAdz4XjN7Ok53Hm84I96c0szW/RrBxcW3wdc8l2s7kRWC?=
 =?us-ascii?Q?B+/GyZZgrgHo52ezq7uErpnLrRaWrfLV7zL3uCNQCUHPKIsL+KsXrbSnyTvz?=
 =?us-ascii?Q?JyUrFUO6Ob/+Uw4pP6xsES/uxAsidcpXgsDNd7q9zCnSuLb6G0LzwZQqkPCV?=
 =?us-ascii?Q?nhMlzbnw9LOFGdoLLq6fhWYk8CwS66oyf5pF56JAH5SVn8m2Mtne695deBft?=
 =?us-ascii?Q?gNBbBYfFdqh80hztA2TPIz9j9Qc1KvR1jinYRldQ9taVSIb+8P1XAbYD/uE7?=
 =?us-ascii?Q?YzykuWXQq499eaPndpjJmKD0RUBM7O6IkE82dsSXJXf3vdOpkw6AqVWadV27?=
 =?us-ascii?Q?xF5yEJzT8a31glVuFB+pu9u9Y6KApekxYMK9umm0AiScHITWbdUNqLnJvoii?=
 =?us-ascii?Q?PBwcMnUmZzk1UEMy4FkMI42nTMrWfm2CXn0zJxgkZxhXcjnf2wxh9+GLUfRT?=
 =?us-ascii?Q?LLfBiOBHr845mXgbFZV8fwnDGuXCnMHKFsaGmwJV3GLWdt3uT3UFJAn4pAmH?=
 =?us-ascii?Q?krg/tgPzg9O0+/XniUi6Sb7QdXBDgt8m2aFxJL2jejfBjhprKSMebDFx2MEJ?=
 =?us-ascii?Q?xqZMrz/S5gIHOuL4QDFNo01E1vii7du9JedxmwwPZDGGV8QvvCrx+624nydh?=
 =?us-ascii?Q?qtG2aSKYW581y00A8PFykiqOqrHOoo43N6NeCyPNRUsY6V/ZNtAJtRwDzexn?=
 =?us-ascii?Q?SwjI+Jbl6LzcXrmtYovHHaApS3bOj3HYNmcgOmFKuoand9M8X4cAgRThUKYb?=
 =?us-ascii?Q?kJ4hKKOk1mUWHT7LjWpPhUDcdkFAV8+Oy4PCSAjepGzWV2uhqyxiroUzSP6I?=
 =?us-ascii?Q?J5nD/7HY4cnh9cp076qrSJFz7S3+M/szoJBCT8s2lez6rwseLuyhr8ie7pNB?=
 =?us-ascii?Q?zr/0tn2vRg=3D=3D?=
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
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf1c1db-96c3-4e6b-435d-08de8f83dc3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 00:16:03.1310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xelB2UOSo/3e7UXh8D6UwMfMFaVc4hS5BsNIJMSKJ/AvXicblI6W+TjuP9QKUmgz/EAR/Z+Dgmt/R4Lmr/c1es1Qv28R0uV0HhUhufqx79w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5797

Hi Patrick

> We can probably do that.  Which recipes (and/or Gerrit changes) are
> going to leverage this?

https://gerrit.openbmc.org/c/openbmc/openbmc/+/88044

Thanks,
Vince

> -----Original Message-----
> From: Patrick Williams <patrick@stwcx.xyz>
> Sent: Wednesday, April 1, 2026 2:22 AM
> To: Vince Chang <vince_chang@aspeedtech.com>
> Cc: 'openbmc@lists.ozlabs.org' <openbmc@lists.ozlabs.org>; Troy Lee
> <troy_lee@aspeedtech.com>; Hugo Hsu <hugo_hsu@aspeedtech.com>
> Subject: Re: OpenBMC add meta-zephyr for AST2700 A2
>=20
> On Tue, Mar 31, 2026 at 02:11:07AM +0000, Vince Chang wrote:
>=20
> Hi Vince,
>=20
> > Could you help us add meta-zephyr into OpenBMC?
> > AST2700 A2 the BootMCU changed from SPL to Zephyr. Because of this
> change, we need meta-zephyr integrated in the OpenBMC build.
>=20
>=20
> We can probably do that.  Which recipes (and/or Gerrit changes) are
> going to leverage this?
>=20
> --
> Patrick Williams

