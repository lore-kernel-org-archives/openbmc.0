Return-Path: <c_mykolak@mellanox.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10085.outbound.protection.outlook.com [40.107.1.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3nlx0PcpzDr5N
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 18:27:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="X0e0KKXD";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P4wQpUXHvp1hLXm4H5x9HLI+GC8lD9hw7odKkrRSCI8=;
 b=X0e0KKXDRdp/R4nve8keBTbo1HrjLX0t/sBNmENbrhJUesWwd3xQgonCed8qRBxfgUzyn8S5K9B216PlwURZw7q5c5q76zD7hWBjKoNuH8C5SQznvrRTuknI8BHhAPZ0aHC5on6QU7xu4/jF3UBsB+S3kozxGkr+n8smRCFsQBg=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 VI1PR05MB3344.eurprd05.prod.outlook.com (10.170.238.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1220.11; Fri, 7 Jul 2017 08:27:18 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::21e6:bfbb:dbbc:3bd5]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::21e6:bfbb:dbbc:3bd5%14]) with mapi id 15.01.1220.018; Fri, 7 Jul 2017
 08:27:17 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Patrick Williams <patrick@stwcx.xyz>
CC: Joel Stanley <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Patrick Venture <venture@google.com>, "Vadim
 Pasternak" <vadimp@mellanox.com>
Subject: RE: [PATCH linux dev-4.10] hwmon: (aspeed-pwm-tacho) cooling device
 support
Thread-Topic: [PATCH linux dev-4.10] hwmon: (aspeed-pwm-tacho) cooling device
 support
Thread-Index: AQHS9M1X9FGE7ZwyPka7wlPSgVXFFKJG92yAgAESYgA=
Date: Fri, 7 Jul 2017 08:27:17 +0000
Message-ID: <DB5PR05MB1224BF58423D413356E858C2EFAA0@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170704135608.12334-1-c_mykolak@mellanox.com>
 <20170706155705.GA22100@asimov.austin.ibm.com>
In-Reply-To: <20170706155705.GA22100@asimov.austin.ibm.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3344;
 7:/2wdDD2ZLvymZVRYEIrpJCvrW3hIur2aC2Ml4kByem7dRHZG5te55eTjEodSyIJRSZcM917SrGucMc9WaGdeUPUKG/5WD6Cp3zpKvNee03n2CymfpmtyO0pmd/QfxEc2MVmG6Fz44DC2jRQ2pbqJGjuGTbtTBnicaufDyCoD4n/OVC51Z8OxAsI5PtockobKqfG+MhqbSjK0+I7jUSxOEr5LHyjbR3HzTYu2Z9asASbleuP2ifjx51hfiItqr/AYvEYWng8O9QAe1rLa2Ai86ttuQrDNVY6WXu5EM2fILie764x9+6Cl+vAL10FxMObAq+T5aui9DDpyKXZYVyEQoxJZzdnaCrNR+FnQr2DHc1ibMnnZmFDcD5thbH/Jx25F7W4HfV6uQfMYW+0gHprlJikDGoEjHH7A0+CXh/1bxgQ2oO8Fn5Tqd9yAKQRLpH+eR9KvPLx5RRQvajdBnCHewQj8kRs5fC30gn2ZQ/gYzQy0kQcb+M1qgUR2qoBMrRO4KIXZ3/NeMySbRmfev84zp/Zl+4N5q9DoQOeV3SJGCV5QndfiFkZmupa3K11rDg1ZNoqyOZnK45oQy2NLblYyVs1i7LG9HppIJUYWG5sLbt3RtgkoscnGzXbQMXADhJkolorEH92Gp2wJ1LC2gcuxfvuPyqvTiQrfBXUCTQBYX3xAFmQXyrN6OBG0J6JpbYy7WL9Ku5TOvg3uVuc+yesynuryKusvQqby6z1evyUAtx44qNRRSAsiomTqj024Q8EmFC2817eqAgZTrMLXUEblx8cmJkos0W49vtaNdGxCmb0=
x-ms-office365-filtering-correlation-id: ab63e466-77b2-47e4-5be6-08d4c511fabc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:VI1PR05MB3344; 
x-ms-traffictypediagnostic: VI1PR05MB3344:
x-microsoft-antispam-prvs: <VI1PR05MB3344C41130872ED453964056EFAA0@VI1PR05MB3344.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(166708455590820)(236129657087228)(65623756079841)(48057245064654)(211936372134217)(148574349560750);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(2017060910060)(3002001)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB3344; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB3344; 
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39450400003)(39410400002)(39400400002)(39850400002)(39860400002)(39840400002)(24454002)(377454003)(13464003)(40764003)(229853002)(5660300001)(74316002)(76176999)(305945005)(86362001)(66066001)(33656002)(7696004)(50986999)(6916009)(2950100002)(7736002)(8936002)(2900100001)(81166006)(14454004)(230783001)(189998001)(8676002)(54356999)(102836003)(6436002)(55016002)(99286003)(38730400002)(110136004)(3846002)(53936002)(9686003)(54906002)(3660700001)(6246003)(2906002)(6116002)(6306002)(6506006)(3280700002)(53546010)(478600001)(25786009)(5250100002)(45080400002)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3344;
 H:DB5PR05MB1224.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2017 08:27:17.4384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3344
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jul 2017 08:27:27 -0000

Hi Patrick,

Ok I'll send driver patch to upstream.
And when it will be accepted. I will send separate patches for driver and d=
ts to openbmc.

Thanks for your help.

Best regards. Mykola Kostenok.

> -----Original Message-----
> From: Patrick Williams [mailto:patrick@stwcx.xyz]
> Sent: Thursday, July 6, 2017 6:57 PM
> To: Mykola Kostenok <c_mykolak@mellanox.com>
> Cc: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org; Patrick
> Venture <venture@google.com>
> Subject: Re: [PATCH linux dev-4.10] hwmon: (aspeed-pwm-tacho) cooling
> device support
>=20
> On Tue, Jul 04, 2017 at 04:56:08PM +0300, Mykola Kostenok wrote:
> > Add support in aspeed-pwm-tacho driver for cooling device creation.
> > This cooling device could be bound to a thermal zone for the thermal
> > control. Device will appear in /sys/class/thermal folder as
> > cooling_deviceX. Then it could be bound to particular thermal zones.
> > Allow specification of the cooling levels vector - PWM duty cycle
> > values in a range from 0 to 255 which correspond to thermal cooling
> > states.
> >
> > Add basic pwm-tacho-controller node to ast-g5 dtsi.
> > Add basic pwm-tacho-controller node to ast-g4 dtsi.
> >
> > Change pwm-tacho in aspeed-bmc-quanta-q71l.dts according new pwm-
> tacho
> > structure.
> >
> > Add pwm-tacho to aspeed-bmc-mellanox-msn.dts.
> >
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts |  61 +++++++++++
> > arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts  | 103 +++++++++---------
> -
> >  arch/arm/boot/dts/aspeed-g4.dtsi              |   9 +-
> >  arch/arm/boot/dts/aspeed-g5.dtsi              |  17 ++++
> >  drivers/hwmon/aspeed-pwm-tacho.c              | 139
> +++++++++++++++++++++++++-
>=20
> This commit is both modifying a set of device trees and adding support to=
 the
> hwmon driver.  Don't we need these as two separate commits?  The hwmon
> driver changes should go upstream first to get feedback from the hwmon
> subsystem owner and then we can backport them into the current
> OpenBMC kernel.
>=20
> https://github.com/openbmc/docs/blob/master/kernel-development.md
>=20
> --
> Patrick Williams
