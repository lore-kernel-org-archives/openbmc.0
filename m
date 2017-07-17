Return-Path: <c_mykolak@mellanox.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10082.outbound.protection.outlook.com [40.107.1.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xB0ng3SyNzDrD6
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 21:05:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="hApZ9EHP";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UFZEnQDVECL2bs9QcA4vGSdOf+gHH+6q1E8nDOjCMIc=;
 b=hApZ9EHPo/2TC9aSaeC4bhnZGIQ4H/irRNsthBCiNuf35HYzTM7bxgkjXt2ttzLmrZ63S3TcpQ0BGGov3r0ID2b1XJLv/0//clq08c1pBUqAZtMawkqhAod5eZxniH04U5yj5t/Q4slFadP2QBEyEvptzcbwPl+PgDLlgLw+LbQ=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 DB5PR05MB1253.eurprd05.prod.outlook.com (10.162.157.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1261.13; Mon, 17 Jul 2017 11:05:19 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::21e6:bfbb:dbbc:3bd5]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::21e6:bfbb:dbbc:3bd5%14]) with mapi id 15.01.1261.022; Mon, 17 Jul
 2017 11:05:19 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Rob Herring <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, Jaghathiswari Rankappagounder Natarajan
 <jaghu@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>, Vadim Pasternak <vadimp@mellanox.com>,
 Ohad Oz <ohado@mellanox.com>
Subject: RE: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Thread-Topic: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Thread-Index: AQHS/Qpq7QjVIxTwTUm2aiS7t12uwaJX3Zyg
Date: Mon, 17 Jul 2017 11:05:19 +0000
Message-ID: <DB5PR05MB1224B743F33DFA632EC08DD9EFA00@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170711131827.64045-1-c_mykolak@mellanox.com>
 <20170715013346.fgqysvlu2prts7zn@rob-hp-laptop>
In-Reply-To: <20170715013346.fgqysvlu2prts7zn@rob-hp-laptop>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR05MB1253;
 7:wXCtqvZ3EWzF6YQbwtcAXkw8HnoW8QoVxFNyYkJgrRwiQnet9ddr2+xHq2eDYAfu4GPH/s7uK+YCuJWpv2LDfkCSDyySWnjJwJPQUwJU54yukFkj/1TlNyoxdTYUH0o010/zs+583w9HOROkX2m9O1TvmMRP4behZxQ0Zm2RTK2OkbpAXYURtpNF5cWNeA0TGbaXJNfMx46oRR25b83o9fXt5VOKP6GdkDXdUUsqLdzQU0pC/r1daX69eSBEBIYZaUjeM2X1KXWxLHmHD0gIGnw16c6/KratpSfOrRSa/ZvnQuH42tHGsKwJQRAijzqPHKdkAyn73Ys5esF3UuJCFHNrticxcW6CqnIvvJ3u3boc4t2a08peYtF2Ei0OJ8DJh+DpPSMRbwBkk2WBlIQC6Q906Fx/SxWtbRWOvfPBaMhsM6Z3x+VTXQ16YltwZS6T8nH+7HrqWcwefMDivk36R0xpA7c0+4slqCq83s3AEWq8ZVbR0IsD3vM7PyvcfddyNSbtBzSU3PGUKV50KnfEIag0ecqidsCAxItTVPXCPG6q7M8+8W5gK6SLQ9LZgViu+9hoDqzs9zoQLP/cAOWhem4xDjPJwhvHrvbgwGlpX4TAej1whbx/r7OkeqSoueIiTt/kepq5XLZvcwGg//jHuS9lBnWRd4N0N8ZjxqH24HLBfoQdCNgwLSpNh48a5xb/8x+nng75uZ+VQyNcHQ/75pMBtLaPasXxbisjYMX30b8HdQW8UEW0YglpXUv7xcCpsMdeqnxBRJNFQxObIQXaNkpYrkaFnKHJdFvqxkhLwVM=
x-ms-office365-filtering-correlation-id: 176fd814-f459-4618-2108-08d4cd03b690
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:DB5PR05MB1253; 
x-ms-traffictypediagnostic: DB5PR05MB1253:
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(9452136761055)(65623756079841)(211936372134217);
x-microsoft-antispam-prvs: <DB5PR05MB1253B2BC05973D83341EFCDBEFA00@DB5PR05MB1253.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(2017060910075)(5005006)(8121501046)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(920507026)(6055026)(6041248)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:DB5PR05MB1253; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:DB5PR05MB1253; 
x-forefront-prvs: 0371762FE7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39410400002)(39850400002)(39400400002)(39450400003)(39840400002)(39860400002)(377454003)(13464003)(24454002)(8676002)(50986999)(54356999)(8936002)(305945005)(7696004)(74316002)(230783001)(53546010)(14454004)(81166006)(76176999)(2900100001)(5660300001)(66066001)(86362001)(102836003)(6116002)(3846002)(6436002)(25786009)(55016002)(478600001)(33656002)(5250100002)(99286003)(6246003)(6506006)(7736002)(54906002)(4326008)(9686003)(189998001)(3660700001)(3280700002)(6916009)(53936002)(2906002)(229853002)(2950100002)(107886003)(38730400002)(110136004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1253;
 H:DB5PR05MB1224.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2017 11:05:19.6386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1253
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
X-List-Received-Date: Mon, 17 Jul 2017 11:05:29 -0000

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Saturday, July 15, 2017 4:34 AM
> To: Mykola Kostenok <c_mykolak@mellanox.com>
> Cc: devicetree@vger.kernel.org; Guenter Roeck <linux@roeck-us.net>;
> Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>;
> openbmc@lists.ozlabs.org; Patrick Venture <venture@google.com>; Vadim
> Pasternak <vadimp@mellanox.com>; Ohad Oz <ohado@mellanox.com>
> Subject: Re: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho
> cooling device.
>=20
> On Tue, Jul 11, 2017 at 04:18:27PM +0300, Mykola Kostenok wrote:
> > This binding adds description for interface supporting
> > aspeed-pwm-tacho driver cooling device creation.
> > This cooling device could be bound to a thermal zone for the thermal
> > control.
>=20
> Bindings are for devices, not drivers.
>=20
>=20
> > It adds extra level of hierarchy -  for tachometer channel with fan
> > subnodes and pwm channels with pwm subnodes.
>=20
> Why this binding was just added and now it is changing?
>=20

Hi, Rob.
Thanks for reply.
=20
This controller supports fan tacho channels and pwm channels. In the previo=
us dts version, only tachometers channels were configurable.
We need to set pwm channels as cooling device, since we use it for the ther=
mal control. So, these channels are added to dts as well.
And it added extra level hierarchy in dts.

For now this driver is used only by 2 two platforms: our Mellanox and Quant=
a (openbmc project).
We sent first this patch to openbmc first the for approval from the Quanta =
owners (Patrick Venture <venture@google.com> approved this change).
=20
The support of this change in dts is introduce in the patch for drivers/hwm=
on/aspeed-pwm-tacho.c, which has been sent to hwmon maintainers.


Best regards. Mykola Kostenok.

> >
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> > ---
> >  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56
> > ++++++++++++++++++----
> >  1 file changed, 47 insertions(+), 9 deletions(-)
