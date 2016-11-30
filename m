Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT2Ll05N0zDrBx
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 12:06:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CFK7Mv7G"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bjWIObe8"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 68C2A2067C;
 Tue, 29 Nov 2016 20:04:45 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Nov 2016 20:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=ljqWgs9GQh1AQtq7oUyjJwPNRCA=; b=CFK7Mv
 7GbKDfyLpI+5l3zySru6gbA6jih0IB2f1S26CJGgCOXmlEEkjRN5yJ53TOUOQf+5
 ucaRI2TTzIEyx9c96weE2JRRVogyCQQnjjODiTB0LUMs3iMnEoZw3KsdmMyd/bOD
 ljfM9VU7VbU1JE1TO+gsdQkH03ONcjPSMlnpk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=ljqWgs9GQh1AQt
 q7oUyjJwPNRCA=; b=bjWIObe8Tuxx4CtCUGuyVy8B6zn2VnuHLt+EmCtSnsYO0f
 usCJmLu3SQr9NZ2IbnD9NjFUls8m8iZTuVnOqQ6kWSXU9SIByzsoSU+dVY9ly7tO
 tSs9Vjipxdaj/ux9GeatHN9gZ6YUvaHmCWxdGwckcsLEx2OqSgMZI1GUeM7Jc=
X-ME-Sender: <xms:rSU-WN9A--v8UP1NhV8mbclpu_Rrf51v7UjIlOI6kpMniXOMLN5nCw>
X-Sasl-enc: DkM5ofrfcOMwtE2STxdQMu+9tr3GUG/YYbLGRRI32+d+ 1480467884
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6C4DD2461E;
 Tue, 29 Nov 2016 20:04:43 -0500 (EST)
Message-ID: <1480467880.2503.98.camel@aj.id.au>
Subject: Re: [RFC PATCH linux 9/9] wip: hwmon: occ: Add sketch of the hwmon
 implementation for the P9 OCC
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames.ibm@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 30 Nov 2016 11:34:40 +1030
In-Reply-To: <CALpMbdnqzBsmEnGV6vZCQkxTFH8z57OnGsG5Sz2+UwSKhMfQfg@mail.gmail.com>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <89c567400dbd58b02a90720004eacb27d5c58ed1.1478835488.git.andrew@aj.id.au>
 <CALpMbdnqzBsmEnGV6vZCQkxTFH8z57OnGsG5Sz2+UwSKhMfQfg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FEO1UqFKi4bG4QAswUCu"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 30 Nov 2016 01:06:59 -0000


--=-FEO1UqFKi4bG4QAswUCu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 17:00 -0600, Eddie James wrote:
> Hi Andrew,
>=20
> Looks pretty good. Do we need to get this finalized before getting
> into our kernel or submitting it upstream? I don't think the SBE or
> FSI interfaces are nailed down, are they?

This patch is a complete hack only to illustrate how the abstractions
would work for P9. It doesn't actually work in any way. So yes, we
definitely need to finalise it before it goes anywhere.

FSI is coming together but we don't yet have it in the tree.

Andrew

>=20
> Eddie
>=20
> On Thu, Nov 10, 2016 at 10:12 PM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A09 ++++
> > =C2=A0drivers/hwmon/occ/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A01 +
> > =C2=A0drivers/hwmon/occ/occ_p9_fsi.c | 93
> > ++++++++++++++++++++++++++++++++++++++++++
> > =C2=A03 files changed, 103 insertions(+)
> > =C2=A0create mode 100644 drivers/hwmon/occ/occ_p9_fsi.c
> >=20
> > diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> > index 085e1f370c42..97b97b391bf9 100644
> > --- a/drivers/hwmon/occ/Kconfig
> > +++ b/drivers/hwmon/occ/Kconfig
> > @@ -26,4 +26,13 @@ config SENSORS_PPC_OCC_P8_I2C
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0This driver=
 can also be built as a module. If so, the
> > module will be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0called occ-=
p8-i2c.
> >=20
> > +config SENSORS_PPC_OCC_P9_FSI
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "POWER9 OCC hwmon s=
upport"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Provide a hwmon =
sysfs interface for the POWER9 On-Chip
> > Controller,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exposing tempera=
ture, frequency and power measurements.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0This driver can =
also be built as a module. If so, the
> > module will be
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0called occ-p9-fs=
i.
> > +
> > =C2=A0endif
> > diff --git a/drivers/hwmon/occ/Makefile
> > b/drivers/hwmon/occ/Makefile
> > index 05a84e987127..77e47e10195e 100644
> > --- a/drivers/hwmon/occ/Makefile
> > +++ b/drivers/hwmon/occ/Makefile
> > @@ -1,2 +1,3 @@
> > =C2=A0obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o occ_sysfs.o
> > =C2=A0obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) +=3D occ_scom_i2c.o occ_p8.o
> > occ_p8_i2c.o
> > +obj-$(CONFIG_SENSORS_PPC_OCC_P9_FSI) +=3D occ_p9.o occ_p9_fsi.o
> > diff --git a/drivers/hwmon/occ/occ_p9_fsi.c
> > b/drivers/hwmon/occ/occ_p9_fsi.c
> > new file mode 100644
> > index 000000000000..2f651d1b16bf
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/occ_p9_fsi.c
> > @@ -0,0 +1,93 @@
> > +/*
> > + * occ_p9_fsi.c - hwmon OCC driver
> > + *
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > modify
> > + * it under the terms of the GNU General Public License as
> > published by
> > + * the Free Software Foundation; either version 2 of the License,
> > or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See=
 the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/err.h>
> > +#include <linux/of.h>
> > +#include <linux/kernel.h>
> > +#include <linux/device.h>
> > +
> > +#include "scom.h"
> > +#include "occ_p9.h"
> > +#include "occ_sysfs.h"
> > +
> > +#define OCC_I2C_NAME=C2=A0=C2=A0=C2=A0"occ-p9-fsi"
> > +
> > +static char *caps_sensor_names[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"curr_powercap",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"curr_powerreading",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"norm_powercap",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"max_powercap",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"min_powercap",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"user_powerlimit"
> > +};
> > +
> > +int p9_fsi_getscom(void *bus, u32 address, u8 *data, size_t
> > offset)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -SCOM_READ_ERROR;
> > +}
> > +
> > +int p9_fsi_putscom(void *bus, u32 address, u32 data0, u32 data1)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -SCOM_WRITE_ERROR;
> > +}
> > +
> > +static struct occ_bus_ops p9_bus_ops =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.getscom =3D p9_fsi_getscom,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.putscom =3D p9_fsi_putscom,
> > +};
> > +
> > +static struct occ_sysfs_config p9_sysfs_config =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_caps_fields =3D ARRAY_S=
IZE(caps_sensor_names),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.caps_names =3D caps_sensor_=
names,
> > +};
> > +
> > +int occ_p9_probe(struct device *dev, void *client)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ *occ;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_sysfs *hwmon;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ =3D occ_p9_start(dev, cl=
ient, p9_bus_ops);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(occ))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(occ);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hwmon =3D occ_sysfs_start(de=
v, occ, &p9_sysfs_config);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(hwmon))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(hwmon);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > +}
> > +
> > +int occ_p9_remove(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ *occ =3D NULL;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return occ_p9_stop(occ);
> > +}
> > +
> > +/* used by device table */
> > +static const struct of_device_id occ_of_match[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "ibm,occ-p=
9-fsi" },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
> > +};
> > +MODULE_DEVICE_TABLE(of, occ_of_match);
> > +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> > +MODULE_DESCRIPTION("BMC P9 OCC hwmon driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.9.3
> >=20
--=-FEO1UqFKi4bG4QAswUCu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPiWoAAoJEJ0dnzgO5LT5IUYP/j4BzxrKAnL1zoxVCj6Y6nCR
hD/WgtaMEIvCC6hJp4r41Zt2O7XcmxtqC+RyF1qe4EQ4M0fteT2MOlNhQT8PTVKh
GyvOdI3jWQPqoCmfNMTvzA7p7JYjVQ2HxB8bljdPWD8Y3LZPaJNTP2QT4IZ1/vQo
W8gUbA+HwYM17RoBT7bIZXsBvtPpjJiTflFMI8xhqSbtg1HViHX4YMMt02zk50OT
Ewlsn36wuGu0ktMN+hhAWkoNdHSgrReF+A5ymuf6eM/dCCP0yp+8yjDE+hThoPxt
gtNWydHWAcry5aIUn7fBeZ1I/jjdIE3Ny96r4t0OHR4HrbD3+5FDcmZcdusvYsYV
3Lvx2LGQBG1XC4J/fxmkbFIRPbWB1Xi5Liz+IrITZSqZm8/s27IR+bwaUHxtlIov
nnz0O2739prJnXB2LIi/vOXnMmAyb2Ns5UHJJwbEKEFYYK/bmmUnNCM/MyFadNBX
1zH94g8z895+cKdlq4eLeaVJan1de04JhxnzDHSjM1EUPFNDTiLRe0+efwdLISYA
8kR/GH+ekGu80/73qLdFS+BGhY7Y1uWm6+EN1tNl8QIqWKc1PDxUEvdqzdnYn9S3
K63G3hXtwnfjkFslYfdNVxVxhLtidgUJAVsTYAjeqhskTeri6y5MXazFSM/tE6oS
lW+b/6s/FtWIb9gv1Axd
=lqAW
-----END PGP SIGNATURE-----

--=-FEO1UqFKi4bG4QAswUCu--
