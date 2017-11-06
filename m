Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.1.63; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="IFnSND8V";
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0063.outbound.protection.outlook.com [104.47.1.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVw024Q7yzDr6m
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 01:28:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LARZJpw96CZ7ifWrzzilsKvdj9cqKefpNhXGxNkCFIQ=;
 b=IFnSND8V3pLx+w8DKPEc4BFcz/RcevRNu2SbIg4RaPRJXcZlxEz9VOd7lWAJc9E5y3sl526xq9Mt/Csy66ttpFZEf6u2kuK5jzIESm4qJTM+qnl9Gfj8KKeMifPRm7+DOyZ2y/bm/B3mBch8TKr/9IuLTh70M7lmrzloSlEC8OE=
Received: from DB6PR0501MB2197.eurprd05.prod.outlook.com (10.168.55.142) by
 HE1PR05MB3339.eurprd05.prod.outlook.com (10.170.243.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.197.13; Mon, 6 Nov 2017 14:28:08 +0000
Received: from DB6PR0501MB2197.eurprd05.prod.outlook.com
 ([fe80::2d11:739a:2eff:7c50]) by DB6PR0501MB2197.eurprd05.prod.outlook.com
 ([fe80::2d11:739a:2eff:7c50%14]) with mapi id 15.20.0197.017; Mon, 6 Nov 2017
 14:28:08 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Chip Bilbrey <chip@bilbrey.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "jiri@resnulli.us" <jiri@resnulli.us>, "tklauser@distanz.ch"
 <tklauser@distanz.ch>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "mec@shout.net" <mec@shout.net>, "Vadim
 Pasternak" <vadimp@mellanox.com>, system-sw-low-level
 <system-sw-low-level@mellanox.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Subject: RE: [v11,1/4] drivers: jtag: Add JTAG core driver
Thread-Topic: [v11,1/4] drivers: jtag: Add JTAG core driver
Thread-Index: AQHTVoYZEAkiZu03y0GEL/O3ci1kT6MHUhTw
Date: Mon, 6 Nov 2017 14:28:08 +0000
Message-ID: <DB6PR0501MB2197286DFD9801F6C78D638DB1500@DB6PR0501MB2197.eurprd05.prod.outlook.com>
References: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
 <8760aoz78q.fsf@bilbrey.org>
In-Reply-To: <8760aoz78q.fsf@bilbrey.org>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR05MB3339;
 6:5W0JQj9X1dDZYPzTTKhV9tGDUZlxFAV4VEGBAEC2Pm7GU9cg5jbAXofqGPS07kkFwwB1rvvXreXW7tLGmKlnDd9+6ofgpwB+PhfmbRI4/gKr+86mBWsbpnoAMHhzPvQWXacviZWj5Ch3y7HAGfhTpq++XckXONXIL69AUEcJ6HOw0aqyxam9J1Y6wxDkNCj5yEAOR6srfJgxtnw1dQ4uAPlXK1mTFKrjlQSQrZJdleXIdHyp1KiUajSjvML6vo1WDeAIexZVxxQBX06ZQP9rR4SoeYvlnAtdKDcBjbgx+iR7TD0BI1JVq1/vbwhbC2igbs+Ei+CbQydVZ+S2uWN5f4JTwUCOlXNSg74MTmg5DhU=;
 5:v7/5ZM+IvhdU67dCZ9W9VscvcxbMn7DsQUtzsQgn+0yttbU/aZ8kpDZ84o+vfLVNPZ2czopQuIjsjdGpa6LG3d69YjS6/rPmiCAXLlUArrcd0mwrq3fwhgkLt1Y3vcp77+utyia9OUAu294Y0m6VDuNg9IUL9iqYE+3UpaABd9o=;
 24:JG4imfq1ErQ4/5JDPz9XsYbe211/cs5C2AdFhG8pHEosI3RP9KmmCUXxcfc5mjtoxmWBdLyOsLk0flrzJkQH8U+XckqFFt0j5XItBIZXLSQ=;
 7:UVPYW29ZBG30pnKLXrkPBGjPlShC+/ACmZ6AnHmQteLmL0P9f6St2CVJudTKNtIV2aaraARAB6dfENpuwiIcdN+R4RssEzXWXm95SnABvV69At/7L7rDqCl9XCAWCxSYeb0W6iLabd52cwuYJ0wKWOkRhUOrYDYcL55tJBVreD+RPzD9emQ/OyT6pOuK/5X0UOw+gdcVk4Ak2ZSc5SEEx8DIK1zVD1rqzmqExbXKOp2vAu0MCIdWRYbyeHg2Nilo
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-correlation-id: dbdd934b-d5ec-4b9c-df12-08d5252299d3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
 SRVR:HE1PR05MB3339; 
x-ms-traffictypediagnostic: HE1PR05MB3339:
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(42262312472803);
x-microsoft-antispam-prvs: <HE1PR05MB33393345F6F0C37C5C0809CDB1500@HE1PR05MB3339.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3231021)(100000703101)(100105400095)(3002001)(93006095)(93001095)(10201501046)(6055026)(6041248)(20161123564025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:HE1PR05MB3339; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:HE1PR05MB3339; 
x-forefront-prvs: 048396AFA0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(346002)(39860400002)(376002)(199003)(189002)(13464003)(478600001)(8676002)(97736004)(66066001)(55016002)(316002)(53936002)(33656002)(81156014)(14454004)(81166006)(53546010)(8936002)(189998001)(7736002)(68736007)(7416002)(74316002)(7696004)(5660300001)(305945005)(9686003)(106356001)(105586002)(25786009)(229853002)(6916009)(2900100001)(2950100002)(6116002)(6506006)(3846002)(102836003)(6436002)(2906002)(3280700002)(54356999)(76176999)(101416001)(5250100002)(99286004)(4326008)(575784001)(50986999)(3660700001)(86362001)(54906003)(6246003)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR05MB3339;
 H:DB6PR0501MB2197.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdd934b-d5ec-4b9c-df12-08d5252299d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2017 14:28:08.1301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB3339
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Nov 2017 14:28:20 -0000

Hi,=20
Thanks for review>

> -----Original Message-----
> From: Chip Bilbrey [mailto:chip@bilbrey.org]
> Sent: Monday, November 6, 2017 12:33 AM
> To: Oleksandr Shamray <oleksandrs@mellanox.com>
> Cc: gregkh@linuxfoundation.org; arnd@arndb.de; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; joel@jms.id.au;
> jiri@resnulli.us; tklauser@distanz.ch; linux-serial@vger.kernel.org;
> mec@shout.net; Vadim Pasternak <vadimp@mellanox.com>; system-sw-low-
> level <system-sw-low-level@mellanox.com>; robh+dt@kernel.org; openocd-
> devel-owner@lists.sourceforge.net; linux-api@vger.kernel.org;
> davem@davemloft.net; mchehab@kernel.org; Jiri Pirko <jiri@mellanox.com>
> Subject: Re: [v11,1/4] drivers: jtag: Add JTAG core driver
>=20
>=20
> Oleksandr Shamray writes:
> > diff --git a/include/uapi/linux/jtag.h b/include/uapi/linux/jtag.h new
> > file mode 100644 index 0000000..0b25a83
> > --- /dev/null
> > +++ b/include/uapi/linux/jtag.h
> > [...]
> > +/**
> > + * enum jtag_xfer_mode:
> > + *
> > + * @JTAG_XFER_HW_MODE: hardware mode transfer
> > + * @JTAG_XFER_SW_MODE: software mode transfer  */ enum
> jtag_xfer_mode
> > +{
> > +	JTAG_XFER_HW_MODE,
> > +	JTAG_XFER_SW_MODE,
> > +};
>=20
> Is this essentially selecting between bit-bang mode or not?  Is there a g=
enerally
> applicable reason to select SW mode over HW (or vice versa)?
> This sounds like it's tied to device-specific capability which shouldn't =
be exposed
> in a generic user API.

It is a mode of working some JTAG master devices. F.e Aspeed JTAG core can =
work in fully automatic mode when all StateMachine=20
transitions and pin control done by hardware and in the more simpler mode w=
hen JTAG pin control does by the user (like bit-bang).=20

It HW defined feature and can be applied not in all cases.=20

Seems it can be deleted from xfer option and controlled by separate like IO=
CTL_SET_PARAM command.
>=20
> > +/**
> > + * struct jtag_xfer - jtag xfer:
> > + *
> > + * @mode: access mode
> > + * @type: transfer type
> > + * @direction: xfer direction
> > + * @length: xfer bits len
> > + * @tdio : xfer data array
> > + * @endir: xfer end state
> > + *
> > + * Structure represents interface to Aspeed JTAG device for jtag sdr
> > +xfer
> > + * execution.
>=20
> Probably should remove the reference to Aspeed here.

Thanks, will remove it.

>=20
> > +/* ioctl interface */
> > +#define __JTAG_IOCTL_MAGIC	0xb2
> > +
> > +#define JTAG_IOCRUNTEST	_IOW(__JTAG_IOCTL_MAGIC, 0,\
> > +			     struct jtag_run_test_idle)
> > +#define JTAG_SIOCFREQ	_IOW(__JTAG_IOCTL_MAGIC, 1, unsigned int)
> > +#define JTAG_GIOCFREQ	_IOR(__JTAG_IOCTL_MAGIC, 2, unsigned int)
> > +#define JTAG_IOCXFER	_IOWR(__JTAG_IOCTL_MAGIC, 3, struct
> jtag_xfer)
> > +#define JTAG_GIOCSTATUS _IOWR(__JTAG_IOCTL_MAGIC, 4, enum
> > +jtag_endstate)
>=20
> I notice the single-open()-per-device lock was dropped by request in an e=
arlier
> revision of your patches, but multiple processes trying to drive a single=
 JTAG
> master could wreak serious havoc if transactions get interleaved. Would
> something like an added JTAG_LOCKCHAIN/UNLOCKCHAIN
> ioctl() for exclusive client access be reasonable to prevent this?

Yes, it dropped by recommendation of Greg KH <gregkh@linuxfoundation.org>.=
=20
Uer app should care about it.

>=20
> -Chip

Thanks for review.
Oleksandr.
