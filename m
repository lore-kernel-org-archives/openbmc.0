Return-Path: <oleksandrs@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0069.outbound.protection.outlook.com [104.47.2.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNYmk58pmzDqjf
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 01:26:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="V0M3MVNe";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Uaw7r/yB3+5kTsm2Uh1N8DLT1xzq49ORguIzK/vVjZc=;
 b=V0M3MVNe76SBvATACxxhH3y2D0WgRgzkW9Dg5pR7PooZZntymnXWS7YZyDfvKoFN1vfqyK7ciSM/l1srMwRp/B7zVVmi7MLNFGBuYGMWs1U4kk5IHNofVMCx/LnPHj+tXrq2EirnP1/0X4ofOx843OZTKfJt5b/DXLC7iLJ0v3Q=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 AM4PR0501MB2196.eurprd05.prod.outlook.com (10.165.82.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1304.22; Thu, 3 Aug 2017 15:26:08 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::7443:520e:1c48:c518]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::7443:520e:1c48:c518%17]) with mapi id 15.01.1304.025; Thu, 3 Aug 2017
 15:26:08 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jiri@resnulli.us" <jiri@resnulli.us>, system-sw-low-level
 <system-sw-low-level@mellanox.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mec@shout.net" <mec@shout.net>,
 "joel@jms.id.au" <joel@jms.id.au>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "vadimp@maellanox.com"
 <vadimp@maellanox.com>, "tklauser@distanz.ch" <tklauser@distanz.ch>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [patch v1 0/2] JTAG driver introduction
Thread-Topic: [patch v1 0/2] JTAG driver introduction
Thread-Index: AQHTC5HpwjY7Y89MaE+A05tg+Fzq7aJxG4SAgAGjUkA=
Date: Thu, 3 Aug 2017 15:26:08 +0000
Message-ID: <AM4PR0501MB2194E6B8D14EC15356C1C0BFB1B10@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <20170802141209.GB25781@lunn.ch>
In-Reply-To: <20170802141209.GB25781@lunn.ch>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR0501MB2196;
 6:GGsiWsyprXF+H7LwlhPLlHhKzk4IQwvkXZc3edu7b9Bk3k2PiFDJM86kJzSxh1/JKfjNvUze3Ynmjc3ParAn4+XORikoihTSOoe4cLHTghZbjbllTe0i5FZpEYzBi7xF74/3mU207HYJylQwScaMUeebyk5e28ni8SQUMfU4YZS8dsCKswPFy9f3IloiTwtQG42/GjGAEyMAwVgi2vIhmNLqDc/HQ8Plgg2QST+FrQ5ndw4WA81OjIlPlxm5SGUhPK/tuPofo5eOI2xif/zIoN1EfgjhdWaLlVAC2iToWS4lMN/r3Iw+EUA8Xk80ty9tL303wf9fIUqTnOJldWZ8yQ==;
 5:apwzQq73uQd1NykbJAvmpvlyhmf2CdZa1jg3G7GWoQVPjKxpF8DXtI4KiPmHd5hZPVYYprAvKKAgLGqXzMl9lEeksyNV6D4MmgA0FgHBRbafss+T5ZMIv8GRKQTPJxuly85Ijsxb7v8SrsXrHhfipQ==;
 24:z+WkWwQTXHz1GUrCiO/b8OkytvWQIghB7I3496eUnLnrup+blVzAXvzcYtT0lwRwXGMQ5nOyVMFSGm4YZMQHEhISlY/yOmdBzXzR+zykoLw=;
 7:2fido++sMAfuXLlcD/Jg5pxs2YLvFBXBGghTp9pF1Wv9ESqDkqHRDW/fVOiFdUY1OSSiw1cnkIH6aZgj7PwJeul1CmKaycvpqplTxgL3lJ1lUWWTuQ8BWNtznoOsqTtvon+/zlMIYmcs69DLodZK/6Tf6ZVd8nek6hkBc+ZosXdZBtNM8FI+0C+7YvD7iCuA+zazYzmdpu7QuIPRtahe1m5euMur3h1SnmpR5Ze5vk8=
x-ms-office365-filtering-correlation-id: 79a3992f-0166-482e-a0b0-08d4da83f70b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:AM4PR0501MB2196; 
x-ms-traffictypediagnostic: AM4PR0501MB2196:
x-exchange-antispam-report-test: UriScan:(166708455590820)(9452136761055)(65623756079841)(258649278758335); 
x-microsoft-antispam-prvs: <AM4PR0501MB219691556BE6D58C5795CEE4B1B10@AM4PR0501MB2196.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123564025)(20161123562025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:AM4PR0501MB2196; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:AM4PR0501MB2196; 
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39400400002)(39850400002)(39410400002)(39840400002)(39450400003)(39860400002)(189002)(377454003)(13464003)(24454002)(199003)(101416001)(3846002)(6116002)(102836003)(25786009)(478600001)(4326008)(6306002)(86362001)(54906002)(9686003)(55016002)(6436002)(99286003)(53936002)(38730400002)(6246003)(110136004)(305945005)(8676002)(81156014)(7736002)(7416002)(7696004)(6916009)(2950100002)(81166006)(66066001)(74316002)(5660300001)(229853002)(8936002)(106356001)(105586002)(189998001)(6506006)(2900100001)(33656002)(97736004)(966005)(2906002)(3280700002)(54356999)(76176999)(50986999)(68736007)(5250100002)(3660700001)(53546010)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0501MB2196;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2017 15:26:08.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0501MB2196
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
X-List-Received-Date: Thu, 03 Aug 2017 15:26:15 -0000

> -----Original Message-----
> From: Andrew Lunn [mailto:andrew@lunn.ch]
> Sent: Wednesday, August 2, 2017 5:12 PM
> To: Oleksandr Shamray <oleksandrs@mellanox.com>
> Cc: gregkh@linuxfoundation.org; arnd@arndb.de; devicetree@vger.kernel.org=
;
> jiri@resnulli.us; system-sw-low-level <system-sw-low-level@mellanox.com>;
> openbmc@lists.ozlabs.org; linux-kernel@vger.kernel.org; mec@shout.net;
> joel@jms.id.au; linux-serial@vger.kernel.org; vadimp@maellanox.com;
> tklauser@distanz.ch; linux-arm-kernel@lists.infradead.org
> Subject: Re: [patch v1 0/2] JTAG driver introduction
>=20
> On Wed, Aug 02, 2017 at 04:18:36PM +0300, Oleksandr Shamray wrote:
> > When a need raise up to use JTAG interface for system's devices
> > programming or CPU debugging, it could be done from the external JTAG
> > master controller.
> >
> > For such purpose, usually the user layer application implements jtag
> > protocol or using a proprietary connection to vendor hardware.
> > This method is slow and not generic.
> >
> > We propose to implement general JTAG interface and infrastructure to
> > communicate with user layer application. In such way, we can have the
> > standard JTAG interface core part and separation from specific HW
> > implementation.
> > This allow new capability to debug the CPU or program system's device
> > via BMC without additional devices nor cost.
>=20
> Hi Oleksandr
>=20
> Do you have patches for OpenOCD? Or maybe i should ask it another way, wh=
at
> user space tools are you using?
>=20
> Thanks
> 	Andrew

Hi Andrew

Thanks a lot for review.

We used user space tool for that, which is an adaptation of some Lattice to=
ols, which allows programming of SVF files. We are using it for Lattice CPL=
D burning, since we have for such devices on our system, but this tool coul=
d be used for programming other devices from other vendors as well.

https://github.com/mellanoxbmc/mellanox-bmc-tools

Thanks
Oleksandr
