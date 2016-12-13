Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td4yg3HMhzDvk7
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 14:32:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="d2knI+V8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ojjO4cGe"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 67291207A1;
 Mon, 12 Dec 2016 22:32:25 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 12 Dec 2016 22:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=SODA7eKyX+DyXjsDG6KT+i37CwA=; b=d2knI+
 V8lmQ2S77HTLdcnxV7q2g2Iu3Oer5Ixt7qpU9zTMWB0qBCCFHQVNJI/aCZZqXPE1
 0gtabbuclQsT3R36tmSpoDYiI3p1QxaexQLqGB+E+NHc/l6n+9R4lsfNPHQdKPoV
 +hytVdrATbFW53M7fJ/cvw5g4Rq/E4SpMou6M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=SODA7eKyX+DyXj
 sDG6KT+i37CwA=; b=ojjO4cGeYUirY7IWjQNQvScmhi27WHjoL5yY02vjzPSSgN
 RgxM1+beBADSXT+bmsjVCE4y8a1DEE8ZxU9T7omGKdRGC7UgQsoaoHjPRK138ag3
 D0LNdsG/X0fTdIxE70+nB1KzkQWCxTdnxhVpGKoQP25hO2KXCE2hOd7/YRlUo=
X-ME-Sender: <xms:yWtPWC_xLjJa39rN7bZB2a0X861Gz8cUYe2i1dhtKj7xdpaEZURC_Q>
X-Sasl-enc: GBRg7DUC5MPPVlebPjbSgkEZqsCq83eIPFo2jWw0WIRY 1481599944
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 53D6D24CD3;
 Mon, 12 Dec 2016 22:32:23 -0500 (EST)
Message-ID: <1481599939.3112.28.camel@aj.id.au>
Subject: Re: [RFC PATCH linux v6 9/9] wip: hwmon: occ: Add sketch of the
 hwmon implementation for the P9 OCC
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 13 Dec 2016 14:02:19 +1030
In-Reply-To: <1480460682-29072-1-git-send-email-eajames.ibm@gmail.com>
References: <1480460682-29072-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-qjece6FqpAcdWu4XwKd1"
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
X-List-Received-Date: Tue, 13 Dec 2016 03:32:28 -0000


--=-qjece6FqpAcdWu4XwKd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 17:04 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20

We shouldn't include this patch until it is actually useful. I
purposefully crippled it so I could get it to compile, mainly as a
demonstration of how the architecture would work for the P9 case.

Andrew

> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A09 ++++
> =C2=A0drivers/hwmon/occ/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A01 +
> =C2=A0drivers/hwmon/occ/occ_p9_fsi.c | 93 +++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 103 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_p9_fsi.c
>=20
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index e690001..7e95876 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -26,4 +26,13 @@ config SENSORS_PPC_OCC_P8_I2C
> > =C2=A0	=C2=A0This driver can also be built as a module. If so, the modu=
le will be
> > =C2=A0	=C2=A0called occ-p8-i2c.
> =C2=A0
> +config SENSORS_PPC_OCC_P9_FSI
> > +	tristate "POWER9 OCC hwmon support"
> > +	help
> > +	=C2=A0=C2=A0Provide a hwmon sysfs interface for the POWER9 On-Chip Co=
ntroller,
> > +	=C2=A0=C2=A0exposing temperature, frequency and power measurements.
> +
> > +	=C2=A0=C2=A0This driver can also be built as a module. If so, the mod=
ule will be
> > +	=C2=A0=C2=A0called occ-p9-fsi.
> +
> =C2=A0endif
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index 05a84e9..77e47e1 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1,2 +1,3 @@
> =C2=A0obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o occ_sysfs.o
> =C2=A0obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) +=3D occ_scom_i2c.o occ_p8.o o=
cc_p8_i2c.o
> +obj-$(CONFIG_SENSORS_PPC_OCC_P9_FSI) +=3D occ_p9.o occ_p9_fsi.o
> diff --git a/drivers/hwmon/occ/occ_p9_fsi.c b/drivers/hwmon/occ/occ_p9_fs=
i.c
> new file mode 100644
> index 0000000..2f651d1
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p9_fsi.c
> @@ -0,0 +1,93 @@
> +/*
> + * occ_p9_fsi.c - hwmon OCC driver
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +
> +#include "scom.h"
> +#include "occ_p9.h"
> +#include "occ_sysfs.h"
> +
> > +#define OCC_I2C_NAME	"occ-p9-fsi"
> +
> +static char *caps_sensor_names[] =3D {
> > +	"curr_powercap",
> > +	"curr_powerreading",
> > +	"norm_powercap",
> > +	"max_powercap",
> > +	"min_powercap",
> > +	"user_powerlimit"
> +};
> +
> +int p9_fsi_getscom(void *bus, u32 address, u8 *data, size_t offset)
> +{
> > +	return -SCOM_READ_ERROR;
> +}
> +
> +int p9_fsi_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> > +	return -SCOM_WRITE_ERROR;
> +}
> +
> +static struct occ_bus_ops p9_bus_ops =3D {
> > +	.getscom =3D p9_fsi_getscom,
> > +	.putscom =3D p9_fsi_putscom,
> +};
> +
> +static struct occ_sysfs_config p9_sysfs_config =3D {
> > +	.num_caps_fields =3D ARRAY_SIZE(caps_sensor_names),
> > +	.caps_names =3D caps_sensor_names,
> +};
> +
> +int occ_p9_probe(struct device *dev, void *client)
> +{
> > +	struct occ *occ;
> > +	struct occ_sysfs *hwmon;
> +
> > +	occ =3D occ_p9_start(dev, client, p9_bus_ops);
> > +	if (IS_ERR(occ))
> > +		return PTR_ERR(occ);
> +
> > +	hwmon =3D occ_sysfs_start(dev, occ, &p9_sysfs_config);
> > +	if (IS_ERR(hwmon))
> > +		return PTR_ERR(hwmon);
> +
> > +	return 0;
> +}
> +
> +int occ_p9_remove(void)
> +{
> > +	struct occ *occ =3D NULL;
> +
> > +	return occ_p9_stop(occ);
> +}
> +
> +/* used by device table */
> +static const struct of_device_id occ_of_match[] =3D {
> > +	{ .compatible =3D "ibm,occ-p9-fsi" },
> > +	{}
> +};
> +MODULE_DEVICE_TABLE(of, occ_of_match);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("BMC P9 OCC hwmon driver");
> +MODULE_LICENSE("GPL");
--=-qjece6FqpAcdWu4XwKd1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT2vEAAoJEJ0dnzgO5LT5cpIP/jD6dp5lke5qSqVBuF73FWlk
oR0Bh5/XE6xC2c9wNkv9pS7zKTFQ57aWHFJjivYbyCFqfj6KKuvQgpFeo3f/adbZ
iYIkgnXyH1MeQWodE5vZvBHYtPk4ompoc5Q+UeMwSx3fJQKGBesp5ub1S3dN6y/L
XtUCUTwKr+38ZCryjaTTejGMFoRMNDxfwoQcB1XJUJnqwVoOE/cCm0ESAI1G2veV
C/F83+RzeWgOFe67U4Mr4/bn/vTZTXX/mXLfF/raDGzjYJikkka36vE8PzOxEZzW
zxYOhgijacUQUxIXeFZsSnsqpV9Lshe1Dy67PzTSCrOW6dHZrEY4310phVBmVwTk
1yjCSGjcBUXcQO37+l7HuyjViAzhkK0GdU+0rq8aCxj860BRsxJHRhkLbqk4r5bG
RxgplVshI3+Hig9RWFKPXcumJJDWxRKXgjp4B6qbNZn8nZICdW/dKYtFXVHTzM7Y
WDDAk7GZbnUBrmQGVyV3Zm/rJ6NZrEbRXfPNCXiC4ayqQWWWhrJIWpS6U1ihr2LS
1JQFGfbmd117fZCyiGpP0rh3mYCi5eOgqIppi2i2KxpcHwUqcQ5NqH9/WszSyjMe
5bDmwv/pF+v5rh+8HpRNOSKOkj0RragtmNbPUcPmq5cdVsatDp5mp8k1vCCfZoqr
FWaKqndqkkujOsx0cC1K
=oSj2
-----END PGP SIGNATURE-----

--=-qjece6FqpAcdWu4XwKd1--
