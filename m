Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.2.57; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="FeKAjzAZ";
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20057.outbound.protection.outlook.com [40.107.2.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybkR50BydzDqlS
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 21:34:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YvlD1/CZAa++j6A8+fonkYuI/P1L488YoPaXfig7ToM=;
 b=FeKAjzAZl1msbqPZIKCEYs5JuOyWiMWxU8xja/22vdFOH6VISGvsb3G6iSmlwauLR2WRcSfISOgaYN15ulrWDMfu6Q+2ChwGWLyusSE/opE5GKbOzd7INaDJ+G/+cSPv2xSGZmuybtZ7vDgCifhJZxtKp1Urw1T70xSbdfn7tDc=
Received: from DB6PR0501MB2197.eurprd05.prod.outlook.com (10.168.55.142) by
 AM4PR05MB1745.eurprd05.prod.outlook.com (10.165.246.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.218.12; Tue, 14 Nov 2017 10:34:49 +0000
Received: from DB6PR0501MB2197.eurprd05.prod.outlook.com
 ([fe80::2d11:739a:2eff:7c50]) by DB6PR0501MB2197.eurprd05.prod.outlook.com
 ([fe80::2d11:739a:2eff:7c50%14]) with mapi id 15.20.0218.015; Tue, 14 Nov
 2017 10:34:49 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: 'Chip Bilbrey' <chip@bilbrey.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "jiri@resnulli.us" <jiri@resnulli.us>, "tklauser@distanz.ch"
 <tklauser@distanz.ch>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "mec@shout.net" <mec@shout.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Subject: RE: [v11,1/4] drivers: jtag: Add JTAG core driver
Thread-Topic: [v11,1/4] drivers: jtag: Add JTAG core driver
Thread-Index: AQHTVoYZEAkiZu03y0GEL/O3ci1kT6MTubmg
Date: Tue, 14 Nov 2017 10:34:49 +0000
Message-ID: <DB6PR0501MB219753AC43515148F39CC2D0B1280@DB6PR0501MB2197.eurprd05.prod.outlook.com>
References: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
 <8760aoz78q.fsf@bilbrey.org>
In-Reply-To: <8760aoz78q.fsf@bilbrey.org>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [82.166.227.17]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR05MB1745;
 6:+L57MhQ4GNMsHU6FFKEat98pI+rJgNoCfJwSgHcGPSzu0uCcBXXuX+l+b6ZBCfA96QEDhqolGHIe1fllE6nMrMRZG3Va8KuGwP53k0abH72ZnndtzbXr0Cd4SG2m1rZwvLCfDnCBxrkNN5Vp0uRvxZ0wcGf5Nu8WTF+TTj+fbjNtI0uCoGAZuuv8tPXKTW1dLxMGv1o6xplxNBZYSCLQ/3NPfWmB+UgRnwHq71sfSa503DBd3Gtq90IEXxnkeSJ4ZSc5VnYyAzlpjbFenbUYGt9nlFLFIC9eiNH+FoRoBJMlsnVHiSJD6lDzo9a2fk12Lg72hlkrsPT4zXMbdP/Ux2fMiCRGH/WAXIJ3+Hi1deY=;
 5:K3oJBJMRyq6Qa84aq9Nvq5Xob3lat+E1oUu0/hZ1gZj2HSpSNdTu3stifASLwMYGF3EK44/wNeOUTjCCOuKMgmylQzt0bM/Jexb3/lx3mTooKRXTfKPKXIXpWigtKoHE8mPq8WD9RHbyranpCxeB8l97tbzbFF57yv7toIjM8rI=;
 24:CE9rnAfLGv47j+obMAVJQ/uzvY6foNourUqEO5Te2xL4je8LOzXvMYFlRBT898UkpruSPNz7nBfbP8kNAGrDgiGMrtLlGOGTzVwOy3hVhug=;
 7:kNHq4WzorLIijpc2zL+N/jiI7fv1uIZUTxQ16yFQWeEw6azNpJI2g1Gn6K648B+rUMHNU2IKKxGFuiACEWW6ShhTUIlq0s1xGy8BTbpl2fZj5GiTlK09XaUVnZIyS0yKU0e3+GW/+vmXsCgN0I+/CmAfUxXTu8pLIWw1Vf+JM24es89JLV0BKf12ButFz3hmOsio/fZq1TyMkuINAazvyRuJXO77Xy3X5Owzi4Ez+udDi+84usdn+/qPttDsHzIl
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-correlation-id: 08132faa-9471-4599-286a-08d52b4b554f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
 SRVR:AM4PR05MB1745; 
x-ms-traffictypediagnostic: AM4PR05MB1745:
x-microsoft-antispam-prvs: <AM4PR05MB1745947EE52E67C715CFB439B1280@AM4PR05MB1745.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(42262312472803);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(10201501046)(3002001)(93006095)(93001095)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123555025)(20161123564025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:AM4PR05MB1745; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:AM4PR05MB1745; 
x-forefront-prvs: 04916EA04C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(346002)(376002)(39860400002)(189002)(199003)(13464003)(33656002)(53546010)(189998001)(68736007)(66066001)(2906002)(316002)(106356001)(105586002)(5660300001)(478600001)(86362001)(2900100001)(55016002)(7416002)(7696004)(101416001)(5250100002)(14454004)(74316002)(2950100002)(6916009)(6506006)(4326008)(54906003)(3280700002)(6436002)(9686003)(3660700001)(25786009)(81166006)(102836003)(50986999)(99286004)(3846002)(6116002)(81156014)(8936002)(229853002)(54356999)(53936002)(76176999)(6246003)(305945005)(97736004)(107886003)(8676002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR05MB1745;
 H:DB6PR0501MB2197.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08132faa-9471-4599-286a-08d52b4b554f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2017 10:34:49.5335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR05MB1745
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
X-List-Received-Date: Tue, 14 Nov 2017 10:34:58 -0000

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

[..]

> I notice the single-open()-per-device lock was dropped by request in an e=
arlier
> revision of your patches, but multiple processes trying to drive a single=
 JTAG
> master could wreak serious havoc if transactions get interleaved. Would
> something like an added JTAG_LOCKCHAIN/UNLOCKCHAIN
> ioctl() for exclusive client access be reasonable to prevent this?
>=20

Yes, it dropped by recommendation of Greg KH <gregkh@linuxfoundation.org>.=
=20

Greg, what you can suggest about it. May be better to add again single-open=
()-per-device lock with right locking way like:

>if (mutex_lock_interruptible(&jtag->open_lock)) {
>	return -ERESTARTSYS;
>}
>
>if (jtag->opened) {
>	mutex_unlock(&jtag->open_lock);
>	return -EINVAL;
>}
>
>nonseekable_open(inode, file);
>file->private_data =3D jtag;
>jtag->opened++;
>mutex_unlock(&jtag->open_lock);
>

Thaks.

> -Chip
