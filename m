Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.0.64; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="b0/im4O2";
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0064.outbound.protection.outlook.com [104.47.0.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLLmz57W0zF0XK
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 18:04:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EnwwplQWHgTWJaKCaaQyaFKVtoarxpPO5bDbEnjSuq8=;
 b=b0/im4O2BH3C4O12KLquZQHJ7u9/dvj68JZVQY+Oh32YBnpAnVC8xyi6pAfgYN9KBCOsNf1Gtm94EdgPTEsnAp1VdwTu08ILchMZfypsN2PF0Ca8kChPn/bm4Kuf7BA5cF/49cvFM4DRbh0fCu+Kh7LwO4t8k7KMKEvVe7SGp0k=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 AM4PR0501MB2642.eurprd05.prod.outlook.com (10.172.215.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.407.7; Tue, 16 Jan 2018 07:04:09 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::bca2:72f5:8623:b9b6]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::bca2:72f5:8623:b9b6%18]) with mapi id 15.20.0386.012; Tue, 16 Jan
 2018 07:04:09 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Julia Cartwright <juliac@eso.teric.us>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "jiri@resnulli.us" <jiri@resnulli.us>, "tklauser@distanz.ch"
 <tklauser@distanz.ch>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, Vadim Pasternak <vadimp@mellanox.com>,
 system-sw-low-level <system-sw-low-level@mellanox.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Subject: RE: [patch v16 1/4] drivers: jtag: Add JTAG core driver
Thread-Topic: [patch v16 1/4] drivers: jtag: Add JTAG core driver
Thread-Index: AQHTi8gAQk/zPk1po0qpb7vtMqL/o6N1bbsAgACmTjA=
Date: Tue, 16 Jan 2018 07:04:09 +0000
Message-ID: <AM4PR0501MB2194BD3F84A1E944EF335ECAB1EA0@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1515776909-29894-1-git-send-email-oleksandrs@mellanox.com>
 <1515776909-29894-2-git-send-email-oleksandrs@mellanox.com>
 <20180115205142.GD2818@kryptos.localdomain>
In-Reply-To: <20180115205142.GD2818@kryptos.localdomain>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [79.135.198.29]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR0501MB2642;
 7:dmJx1U0Z/Z2dLIgpR0at2B9d0AEGpchF80HVd/hSpDtqgZkwBSTaLU/dKrioNxymlbIMPth26lmsHAJHBIYzBll+23zW1WaxdEXccEBwVrgCiwhl7qHo/9mF5A8sS7hpOs54ECuKMp+sQ4jApv6bUBT6vhDlv2vuBYqzid9tkHXCiJuxyxdI1DTiEIVzl5YrN/muioPHZP5+jxElMQAaZf2LPGN0Bp9l4vnjImi1AHWnPBolqw1CsYqGbcKWr22i
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-correlation-id: 4305f632-4dd0-4875-22ff-08d55caf574e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(48565401081)(2017052603307)(7153060)(7193020);
 SRVR:AM4PR0501MB2642; 
x-ms-traffictypediagnostic: AM4PR0501MB2642:
x-microsoft-antispam-prvs: <AM4PR0501MB264234EC6E4D7425E646B482B1EA0@AM4PR0501MB2642.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(42262312472803);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231023)(944501161)(6055026)(6041268)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
 SRVR:AM4PR0501MB2642; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:AM4PR0501MB2642; 
x-forefront-prvs: 0554B1F54F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39380400002)(39860400002)(366004)(376002)(189003)(199004)(13464003)(24454002)(7736002)(5250100002)(106356001)(6436002)(2900100001)(9686003)(3660700001)(8676002)(97736004)(74316002)(2906002)(105586002)(68736007)(305945005)(5660300001)(316002)(8936002)(102836004)(54906003)(55016002)(26005)(3280700002)(86362001)(81166006)(81156014)(229853002)(76176011)(53936002)(14454004)(478600001)(53546011)(4326008)(33656002)(7696005)(66066001)(3846002)(7416002)(59450400001)(25786009)(6916009)(2950100002)(99286004)(6116002)(107886003)(6246003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0501MB2642;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: xcYOY7jRcQPHKNzrF8tDGbUoXGKlwe3XCSfoFaOMRGmrPv9q5hwck5F+6lQz7qXE0sU9SFH/rT22c5y7ZvEQ/g==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4305f632-4dd0-4875-22ff-08d55caf574e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2018 07:04:09.5313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0501MB2642
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
X-List-Received-Date: Tue, 16 Jan 2018 07:04:21 -0000

Hi Julia

> -----Original Message-----
> From: Julia Cartwright [mailto:juliac@eso.teric.us]
> Sent: 15 =D1=CE=D7=C1=D2=D1 2018 =C7. 22:52
> To: Oleksandr Shamray <oleksandrs@mellanox.com>
> Cc: gregkh@linuxfoundation.org; arnd@arndb.de; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; joel@jms.id.au;
> jiri@resnulli.us; tklauser@distanz.ch; linux-serial@vger.kernel.org; Vadi=
m
> Pasternak <vadimp@mellanox.com>; system-sw-low-level <system-sw-low-
> level@mellanox.com>; robh+dt@kernel.org; openocd-devel-
> owner@lists.sourceforge.net; linux-api@vger.kernel.org;
> davem@davemloft.net; mchehab@kernel.org; Jiri Pirko
> <jiri@mellanox.com>
> Subject: Re: [patch v16 1/4] drivers: jtag: Add JTAG core driver
>=20
> Hello Oleksandr-
>=20
> I have a few comments below.
>=20
> On Fri, Jan 12, 2018 at 07:08:26PM +0200, Oleksandr Shamray wrote:
> > Initial patch for JTAG driver
> > JTAG class driver provide infrastructure to support hardware/software
> > JTAG platform drivers. It provide user layer API interface for
> > flashing and debugging external devices which equipped with JTAG
> > interface using standard transactions.
> >

[..]
> > +		break;
> > +
> > +	case JTAG_IOCXFER:
> > +		if (!jtag->ops->xfer)
>=20
> Are all ops optional?  That seems bizarre.  I would have expected at leas=
t one
> callback to be required.

You right. But I'm preferred to check pointers before use it.

>=20
> [..]
> > +static int jtag_open(struct inode *inode, struct file *file) {
> > +	struct jtag *jtag =3D container_of(file->private_data, struct jtag,
> > +					 miscdev);
> > +
> > +	if (mutex_lock_interruptible(&jtag->open_lock))
> > +		return -ERESTARTSYS;
> > +
> > +	if (jtag->opened) {
> > +		mutex_unlock(&jtag->open_lock);
> > +		return -EBUSY;
> > +	}
> > +
> > +	nonseekable_open(inode, file);
> > +	file->private_data =3D jtag;
>=20
> These two can be moved out of the lock.

Agree.

>=20
> > +	jtag->opened =3D true;
> > +	mutex_unlock(&jtag->open_lock);
> > +	return 0;
> > +}
> > +
> > +static int jtag_release(struct inode *inode, struct file *file) {
> > +	struct jtag *jtag =3D file->private_data;
> > +
> > +	mutex_lock(&jtag->open_lock);
> > +	jtag->opened =3D false;
> > +	mutex_unlock(&jtag->open_lock);
> > +	return 0;
> > +}
> > +
> > +static const struct file_operations jtag_fops =3D {
> > +	.owner		=3D THIS_MODULE,
> > +	.open		=3D jtag_open,
> > +	.release	=3D jtag_release,
> > +	.llseek		=3D noop_llseek,
> > +	.unlocked_ioctl =3D jtag_ioctl,
> > +};
> > +
> > +struct jtag *jtag_alloc(size_t priv_size, const struct jtag_ops *ops)
> > +{
> > +	struct jtag *jtag;
> > +
> > +	jtag =3D kzalloc(sizeof(*jtag), GFP_KERNEL);
>=20
> Did you mean to allocate: sizeof(*jtag) + priv_size?

Thank, it's a mistake.

>=20
> > +	if (!jtag)
> > +		return NULL;
> > +
> > +	jtag->ops =3D ops;
> > +	return jtag;
> > +}
> > +EXPORT_SYMBOL_GPL(jtag_alloc);
> > +
> > +void jtag_free(struct jtag *jtag)
> > +{
> > +	kfree(jtag);
> > +}
> > +EXPORT_SYMBOL_GPL(jtag_free);
> > +
> > +int jtag_register(struct jtag *jtag)
> > +{
> > +	char *name;
> > +	int err;
> > +	int id;
> > +
> > +	id =3D ida_simple_get(&jtag_ida, 0, 0, GFP_KERNEL);
> > +	if (id < 0)
> > +		return id;
> > +
> > +	jtag->id =3D id;
> > +
> > +	name =3D kzalloc(MAX_JTAG_NAME_LEN, GFP_KERNEL);
> > +	if (!name) {
> > +		err =3D -ENOMEM;
> > +		goto err_jtag_alloc;
> > +	}
> > +
> > +	err =3D snprintf(name, MAX_JTAG_NAME_LEN, "jtag%d", id);
> > +	if (err < 0)
> > +		goto err_jtag_name;
> > +
> > +	mutex_init(&jtag->open_lock);
> > +	jtag->miscdev.fops =3D  &jtag_fops;
> > +	jtag->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> > +	jtag->miscdev.name =3D name;
> > +
> > +	err =3D misc_register(&jtag->miscdev);
> > +	if (err)
> > +		dev_err(jtag->dev, "Unable to register device\n");
> > +	else
> > +		return 0;
> > +	jtag->opened =3D false;
>=20
> Well, this code flow is just confusing.
>=20
> I suggest a redo with:
>=20
> 	err =3D misc_register(&jtag->miscdev);
> 	if (err) {
> 		dev_err(jtag->dev, "Unable to register device\n");
> 		goto err_jtag_name;
> 	}
>=20
> If you need to initialize 'opened', do it prior to misc_register.
>=20

Thanks

> Thanks,
>    Julia

Thanks for Review.

Br,
Oleksandr
