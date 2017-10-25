Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.2.51; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="FqOiz4gd";
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0051.outbound.protection.outlook.com [104.47.2.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMZZ86HzlzDqln
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 02:58:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eNHgtBicbgOFkkBPNPWxWm+dfkXDdjiQxBKBrkoKKrY=;
 b=FqOiz4gd+GaM+X4AaoQ3041mwtEYGEaDEjkQvepZBrd8Nk2a+gr8LLD3UT8RYapFVKR1tjwTODKuDfkUcQuBk6YxyP6N6BhzlZuKVUAcHLzUOrx0S5XSX/8fg5t/m4F4Z9YF93pMTBQkzZesq16sSxMr1cGYX3xKbAxnb7wpx+U=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 HE1PR05MB1756.eurprd05.prod.outlook.com (10.169.120.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.156.4; Wed, 25 Oct 2017 15:58:42 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::b02a:703f:24d5:1193]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::b02a:703f:24d5:1193%18]) with mapi id 15.20.0156.007; Wed, 25 Oct
 2017 15:58:42 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
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
Subject: RE: [patch v9 1/4] drivers: jtag: Add JTAG core driver
Thread-Topic: [patch v9 1/4] drivers: jtag: Add JTAG core driver
Thread-Index: AQHTMru5yoecjoOKkEeYBkPR/vITOKLszxoAgAAGBCCAACwFgIAH2fow
Date: Wed, 25 Oct 2017 15:58:42 +0000
Message-ID: <AM4PR0501MB21942F65C3F28F8AE9B22504B1440@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
 <1505985932-27568-2-git-send-email-oleksandrs@mellanox.com>
 <20171020115512.GA2073@kroah.com>
 <AM4PR0501MB21940531802FC14EDE8C3F75B1430@AM4PR0501MB2194.eurprd05.prod.outlook.com>
 <20171020145417.GD8965@kroah.com>
In-Reply-To: <20171020145417.GD8965@kroah.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR05MB1756;
 6:6pH5gR+V5H6qUhYXMqJCd23d09OATvqlQjV2KB8WC8s4D54I0g3GmQAfO6fhP00lIdKZ2XfdmnKaGI8saaLJqdH7hzUJaNd61OCvjRusXofBIp81EnbOgZuM1A0derVxE8A6CQ1eq5YeRJW6K+ABrzEAGC1bZhmikU0cT8VClyEVFSQsGehKYjh4Q64cz7QabHavq+eWpcrMsRJfnoWlZGrLxLlVxvFKIGdtOr209Pf1Ho4IAw1oqa4/1swXb5S6PeJ8G/cA4D5bSgoWyI4No+Xy9fK7WjDgXrc578uyCb8cQ1jAVI8GBMf7Vp9JcgfIO6cZTmjpqp/pVQL8jt0+Kg==;
 5:I9Va1Ux3fo8b8NGHFmQhXUphjWkXwlvQ5dhT0VzBRsYbyXrx0WTSbIwZU4RI4T5NGbRlDCyttpewxsTKM/SUIaEmvzUN/Ckdj/pP7OZjdy+Pdp5qzoaGRtzUuI7f1N2aeDYH3uwLEkD0waxUjV0y6w==;
 24:ku3mxYI4JWZF0nR7+5Fin93gXi9RCgLx+AMTGIJVo+X2eFzzMV0wUYTTne/NeMP+OhsLZfiOYWKgqswXO7AJZr1jB2Yt56syBrnRVpgAcZs=;
 7:vrafflJEzH2R7GkQQdsi0pdy6xuWqomTSEDU5TV8JNDaAkjjftptTqSVh8gslTlbG/p5BMp9WI+Sx83rFVI7TZemnri6PYcUdkTZS93XTiDzZwA5xawFFS8+Khj+5P4oqD7oQQhvBdzHzewpEgPoi6NdnRRcOFa0MDFI5J059hkaR5jocXjn0SKUkLgHmPzaQcYsAFS7dgEBGUPGT8JiWmoqpHmRerkH0YBZXYF+UqU=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-correlation-id: a93cf6bd-d920-4b6d-a2cb-08d51bc143e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(48565401081)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
 SRVR:HE1PR05MB1756; 
x-ms-traffictypediagnostic: HE1PR05MB1756:
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(42262312472803);
x-microsoft-antispam-prvs: <HE1PR05MB1756674151E477C3DB2E8B4BB1440@HE1PR05MB1756.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(3231020)(6055026)(6041248)(20161123558100)(20161123555025)(20161123564025)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:HE1PR05MB1756; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:HE1PR05MB1756; 
x-forefront-prvs: 0471B73328
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39860400002)(376002)(346002)(199003)(189002)(24454002)(13464003)(105586002)(6436002)(74316002)(68736007)(2950100002)(6506006)(66066001)(54356999)(6916009)(14454004)(76176999)(25786009)(305945005)(229853002)(97736004)(3280700002)(50986999)(101416001)(2906002)(3660700001)(33656002)(86362001)(106356001)(7696004)(53546010)(5660300001)(7416002)(3846002)(102836003)(93886005)(2900100001)(7736002)(6116002)(55016002)(8676002)(9686003)(54906003)(107886003)(478600001)(53936002)(99286003)(4326008)(8936002)(81156014)(81166006)(5250100002)(6246003)(189998001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR05MB1756;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93cf6bd-d920-4b6d-a2cb-08d51bc143e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2017 15:58:42.2729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB1756
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
X-List-Received-Date: Wed, 25 Oct 2017 15:58:59 -0000

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Friday, October 20, 2017 5:54 PM
> To: Oleksandr Shamray <oleksandrs@mellanox.com>
> Cc: arnd@arndb.de; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org;
> openbmc@lists.ozlabs.org; joel@jms.id.au; jiri@resnulli.us;
> tklauser@distanz.ch; linux-serial@vger.kernel.org; mec@shout.net; Vadim
> Pasternak <vadimp@mellanox.com>; system-sw-low-level <system-sw-low-
> level@mellanox.com>; robh+dt@kernel.org; openocd-devel-
> owner@lists.sourceforge.net; linux-api@vger.kernel.org;
> davem@davemloft.net; mchehab@kernel.org; Jiri Pirko <jiri@mellanox.com>
> Subject: Re: [patch v9 1/4] drivers: jtag: Add JTAG core driver
>=20
> On Fri, Oct 20, 2017 at 02:34:00PM +0000, Oleksandr Shamray wrote:
> > Hi Greg.
> >
> > > -----Original Message-----
> > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > Sent: Friday, October 20, 2017 2:55 PM
> > > To: Oleksandr Shamray <oleksandrs@mellanox.com>
> > > Cc: arnd@arndb.de; linux-kernel@vger.kernel.org; linux-arm-
> > > kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > > openbmc@lists.ozlabs.org; joel@jms.id.au; jiri@resnulli.us;
> > > tklauser@distanz.ch; linux-serial@vger.kernel.org; mec@shout.net;
> > > Vadim Pasternak <vadimp@mellanox.com>; system-sw-low-level
> > > <system-sw-low- level@mellanox.com>; robh+dt@kernel.org;
> > > openocd-devel- owner@lists.sourceforge.net;
> > > linux-api@vger.kernel.org; davem@davemloft.net; mchehab@kernel.org;
> > > Jiri Pirko <jiri@mellanox.com>
> > > Subject: Re: [patch v9 1/4] drivers: jtag: Add JTAG core driver
> > >
> > > On Thu, Sep 21, 2017 at 12:25:29PM +0300, Oleksandr Shamray wrote:
> > > > +struct jtag {
> > > > +	struct device *dev;
> > > > +	struct cdev cdev;
> > >
> > > Why are you using a cdev here and not just a normal misc device?
> >
> > What the benefits to use misc instead of cdev?
>=20
> Less code, simpler logic, easier to review and understand, etc.
>=20
> Let me ask you, why use a cdev instead of a misc?

As I know misc device more applicable if we want to create one device f.e. =
 /dev/jtag.=20
But in current case we can have more than one jtag device /dev/jtag0 ... /d=
ev/jtagN. =20
So I decided to use cdev.

>=20
> > > I forgot if this is what you were doing before, sorry...
> > >
> > > > +	int id;
> > > > +	atomic_t open;
> > >
> > > Why do you need this?
> >
> > This counter used to avoid open at the same time by 2 or more users.
>=20
> But it isn't working :)
>=20
> And why do you care?
>=20
> > > > +	const struct jtag_ops *ops;
> > > > +	unsigned long priv[0] __aligned(ARCH_DMA_MINALIGN);
> > >
> > > Huh?  Why is this needed to be dma aligned?  Why not just use the
> > > private pointer in struct device?
> > >
> >
> > It is critical?
>=20
> You are saying it is, so you have to justify it.  There is a pointer for =
you to use,
> don't make new ones for no reason, right?
>=20

You are right. Will remove.

> > > > +};
> > > > +
> > > > +static dev_t jtag_devt;
> > > > +static DEFINE_IDA(jtag_ida);
> > > > +
> > > > +void *jtag_priv(struct jtag *jtag) {
> > > > +	return jtag->priv;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(jtag_priv);
> > > > +
> > > > +static u8 *jtag_copy_from_user(__u64 udata, unsigned long bit_size=
) {
> > > > +	unsigned long size;
> > > > +	void *kdata;
> > > > +
> > > > +	size =3D DIV_ROUND_UP(bit_size, BITS_PER_BYTE);
> > > > +	kdata =3D memdup_user(u64_to_user_ptr(udata), size);
> > >
> > > You only use this once, why not just open-code it?
> >
> > I think it makes code more understandable.
>=20
> As a reviewer, I don't :)

Ok, I will fix :)

>=20
> > > > +
> > > > +	return kdata;
> > > > +}
> > > > +
> > > > +static unsigned long jtag_copy_to_user(__u64 udata, u8 *kdata,
> > > > +				       unsigned long bit_size) {
> > > > +	unsigned long size;
> > > > +
> > > > +	size =3D DIV_ROUND_UP(bit_size, BITS_PER_BYTE);
> > > > +
> > > > +	return copy_to_user(u64_to_user_ptr(udata), (void *)(kdata),
> > > > +size);
> > >
> > > Same here, making this a separate function seems odd.
> >
> > Same, I think it makes code more understandable.
>=20
> But it doesn't.
>=20

Ok, I will fix :)

> > > > +
> > > > +		if (jtag->ops->freq_set)
> > > > +			err =3D jtag->ops->freq_set(jtag, value);
> > > > +		else
> > > > +			err =3D -EOPNOTSUPP;
> > > > +		break;
> > > > +
> > > > +	case JTAG_IOCRUNTEST:
> > > > +		if (copy_from_user(&idle, (void *)arg,
> > > > +				   sizeof(struct jtag_run_test_idle)))
> > > > +			return -ENOMEM;
> > > > +		err =3D jtag_run_test_idle_op(jtag, &idle);
> > >
> > > Who validates the structure fields?  Is that up to the individual
> > > jtag driver?  Why not do it in the core correctly so that it only
> > > has to be done in one place and you do not have to audit every indivi=
dual
> driver?
> >
> > Input parameters validated by jtag  platform driver. I think it not cri=
tical.
>=20
> Not true at all.  It is very critical.  Remmeber, "All Input Is Evil!"
>=20
> You have to validate this.  I as a reviewer have to find where you are va=
lidating
> this data to ensure bad things do not happen.  I can't review that here, =
now I
> have to go and review all of the individual drivers, which is a major pai=
n, don't
> you agree?

Agree.  I will add input parameter checking here before call device driver.

>=20
> > > > +		break;
> > > > +
> > > > +	case JTAG_IOCXFER:
> > > > +		if (copy_from_user(&xfer, (void *)arg,
> > > > +				   sizeof(struct jtag_xfer)))
> > > > +			return -EFAULT;
> > > > +
> > > > +		if (xfer.length >=3D JTAG_MAX_XFER_DATA_LEN)
> > > > +			return -EFAULT;
> > > > +
> > > > +		xfer_data =3D jtag_copy_from_user(xfer.tdio, xfer.length);
> > > > +		if (!xfer_data)
> > > > +			return -ENOMEM;
> > >
> > > Are you sure that's the correct error value?
> >
> > I think yes, but what you suggest?
>=20
> A fault happened, so -EFAULT, right?
>=20

Right.


> > [..]
> > > +       .unlocked_ioctl =3D jtag_ioctl,
> > > +       .open           =3D jtag_open,
> > > +       .release        =3D jtag_release,
> > > +};
> >
> > add a compat_ioctl pointer here, after ensuring that all ioctl
> > commands are compatible between 32-bit and 64-bit user space.
> > [..]
>=20
> And if you do not, what happens?  You shouldn't need it as there is no fi=
xups
> necessary, or am I mistaken about that?

Yes, you are right. In code compat_ioctl called same function as in unlocke=
d_ioctl.=20
So I can remove compat and system will always call unlocked_ioctl.

>=20
> > > > +static int jtag_open(struct inode *inode, struct file *file) {
> > > > +	struct jtag *jtag =3D container_of(inode->i_cdev, struct jtag,
> > > > +cdev);
> > > > +
> > > > +	if (atomic_read(&jtag->open)) {
> > > > +		dev_info(NULL, "jtag already opened\n");
> > > > +		return -EBUSY;
> > >
> > > Why do you care if multiple opens can happen?
> >
> > Jtag HW not support to using with multiple requests from different user=
s. So
> we prohibit this.
>=20
> Why does the kernel care?
>=20
> And again, your implementation is broken, it's not actually doing this
> protection.  I recommend just not doing it at all, but if you really are =
insisting
> on it, you have to get it correct :)

I will follow your recommendations and remove it.=20

>=20
> thanks,
>=20
> greg k-h

Thanks.=20
Oleksandr S
