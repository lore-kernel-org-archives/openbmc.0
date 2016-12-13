Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td4bp4W9JzDvjw
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 14:16:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dg6peCMD"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hPIh7IDA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 89DDB207AB;
 Mon, 12 Dec 2016 22:16:04 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 12 Dec 2016 22:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=rSgfpIv2JUohJVm1gPr62B4FW4Q=; b=dg6peC
 MDv+uaBCeJI7Do3Gf6zamRr+rslGW1quEeY6sMgEHumOzRtBzFkgfxsN82T+tAWh
 lvXEx8m2BACJtaaXPjD0x9ey4tz4KspPlEYfqIcI7Z4oo+AQxepyGjcP1FxKRwNN
 6eyKTFnTSPlhCEDQPC/pUAoclRKEyKdeUgec4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=rSgfpIv2JUohJV
 m1gPr62B4FW4Q=; b=hPIh7IDAC/waMTf6ZJlO2Z9G3ziJpeOL7bNus0wWMdejz6
 9mWf8LINOEOgtKZFf+Xc42pLZe9GI8A78mfS7uiiGPgTfHtcca1AbLyFZPaQeWjs
 iD0R7ekd0+Y19wfuOOTTp10WbfxRHuopsjOGUz1p47se2bbFmeNTiEB8Hev2s=
X-ME-Sender: <xms:9GdPWHuNXj6eEb4hHKntKeSZyX-_LUsV7fRjw6SHI-7_HZIGTiYH1A>
X-Sasl-enc: QzY8hPTb9NPBGNxwGKWSZ67a0tuYnPmJUZuUpU26LJHM 1481598963
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78A5D7E808;
 Mon, 12 Dec 2016 22:16:02 -0500 (EST)
Message-ID: <1481598959.3112.22.camel@aj.id.au>
Subject: Re: [RFC PATCH linux v6 6/9] hwmon: occ: Add hwmon implementation
 for the P8 OCC
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 13 Dec 2016 13:45:59 +1030
In-Reply-To: <1480460646-28877-1-git-send-email-eajames.ibm@gmail.com>
References: <1480460646-28877-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-bYVkvDLaa4xjF3vWSRUB"
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
X-List-Received-Date: Tue, 13 Dec 2016 03:16:07 -0000


--=-bYVkvDLaa4xjF3vWSRUB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 17:04 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20

As on the previous patches, I'd like to see some more words here.

Also like the previous patch I think we need to give some consideration
to consistent naming, but otherwise this looks good.

Andrew

> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A014 +++++
> =C2=A0drivers/hwmon/occ/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A01 +
> =C2=A0drivers/hwmon/occ/occ_p8_i2c.c | 133 ++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 148 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
>=20
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> index cdb64a7..e690001 100644
> --- a/drivers/hwmon/occ/Kconfig
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -13,3 +13,17 @@ menuconfig SENSORS_PPC_OCC
> =C2=A0
> > =C2=A0	=C2=A0=C2=A0This driver can also be built as a module. If so, th=
e module
> > =C2=A0	=C2=A0=C2=A0will be called occ.
> +
> +if SENSORS_PPC_OCC
> +
> +config SENSORS_PPC_OCC_P8_I2C
> > +	tristate "POWER8 OCC hwmon support"
> > +	depends on I2C
> > +	help
> > +	=C2=A0Provide a hwmon sysfs interface for the POWER8 On-Chip Controll=
er,
> > +	=C2=A0exposing temperature, frequency and power measurements.
> +
> > +	=C2=A0This driver can also be built as a module. If so, the module wi=
ll be
> > +	=C2=A0called occ-p8-i2c.
> +
> +endif
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> index a6881f9..05a84e9 100644
> --- a/drivers/hwmon/occ/Makefile
> +++ b/drivers/hwmon/occ/Makefile
> @@ -1 +1,2 @@
> =C2=A0obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o occ_sysfs.o
> +obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) +=3D occ_scom_i2c.o occ_p8.o occ_p8=
_i2c.o
> diff --git a/drivers/hwmon/occ/occ_p8_i2c.c b/drivers/hwmon/occ/occ_p8_i2=
c.c
> new file mode 100644
> index 0000000..54a673e
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p8_i2c.c
> @@ -0,0 +1,133 @@
> +/*
> + * occ_p8_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the OCC over i2c bus.
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
> +#include <linux/i2c.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +
> +#include "scom.h"
> +#include "occ_scom_i2c.h"
> +#include "occ_p8.h"
> +#include "occ_sysfs.h"
> +
> +#define OCC_I2C_NAME=C2=A0=C2=A0=C2=A0"occ-p8-i2c"
> +
> +static char *caps_sensor_names[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"curr_powercap",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"curr_powerreading",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"norm_powercap",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"max_powercap",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"min_powercap",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"user_powerlimit"
> +};
> +
> +int p8_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* P8 i2c slave requires addre=
ss to be shifted by 1 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0address =3D address << 1;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return occ_i2c_getscom(bus, ad=
dress, data, offset);
> +}
> +
> +int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* P8 i2c slave requires addre=
ss to be shifted by 1 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0address =3D address << 1;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return occ_i2c_putscom(bus, ad=
dress, data0, data1);
> +}
> +
> +static struct occ_bus_ops p8_bus_ops =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.getscom =3D p8_i2c_getscom,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.putscom =3D p8_i2c_putscom,
> +};
> +
> +static struct occ_sysfs_config p8_sysfs_config =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_caps_fields =3D ARRAY_SIZ=
E(caps_sensor_names),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.caps_names =3D caps_sensor_na=
mes,
> +};
> +
> +static int occ_p8_probe(struct i2c_client *client,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0con=
st struct i2c_device_id *id)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ *occ;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_sysfs *hwmon;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ =3D occ_p8_start(&client->=
dev, client, p8_bus_ops);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(occ))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(occ);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hwmon =3D occ_sysfs_start(&cli=
ent->dev, occ, &p8_sysfs_config);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(hwmon))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(hwmon);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_set_clientdata(client, hwm=
on);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +static int occ_p8_remove(struct i2c_client *client)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return occ_p8_stop(i2c_get_cli=
entdata(client));
> +}
> +
> +/* used by old-style board info. */
> +static const struct i2c_device_id occ_ids[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ OCC_I2C_NAME, 0 },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
> +};
> +MODULE_DEVICE_TABLE(i2c, occ_ids);
> +
> +/* used by device table */
> +static const struct of_device_id occ_of_match[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "ibm,occ-p8-=
i2c" },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
> +};
> +MODULE_DEVICE_TABLE(of, occ_of_match);
> +
> +/*
> + * i2c-core uses i2c-detect() to detect device in below address list.
> + * If exists, address will be assigned to client.
> + * It is also possible to read address from device table.
> + */
> +static const unsigned short normal_i2c[] =3D {0x50, 0x51, I2C_CLIENT_END=
 };
> +
> +static struct i2c_driver occ_p8_driver =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class =3D I2C_CLASS_HWMON,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.name =3D OCC_I2C_NAME,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.pm =3D NULL,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0.of_match_table =3D occ_of_match,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe =3D occ_p8_probe,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove =3D occ_p8_remove,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.id_table =3D occ_ids,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.address_list =3D normal_i2c,
> +};
> +
> +module_i2c_driver(occ_p8_driver);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
> +MODULE_LICENSE("GPL");
--=-bYVkvDLaa4xjF3vWSRUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT2fvAAoJEJ0dnzgO5LT5CCIQAK8M0gAFjPoW38GWw9+p3OSU
Wl9jfOnYKo/Qjj2jNY1H9bWCuR4mXon3QycMUYp0GVkKG1hZQSp4bTS39Tc/Evkj
if2TSmtS1PF6CZoznAlRmkqjbRCwVwboH2kMi70cJnMctfjr0H70S4KwaWLwlJSW
GF+xBWEWOb0oDqwxtjivo44QWFy+MR8AD20kLaF7w9ZtrKUKsC67keeWOFTkDf46
unVmyj8mJP8hvqE6QDY7AehY7igmCxHmsA9/cijehfe1p7Sl0cOBMRL91RtAjuQb
OAbfdDfzwSJ9YASsPU1OdyGpwqxk5Tds8AtqcUw+1MoTjV3jUMYtGIW5zZr32glQ
aDTGxuemRWJMlzjnAWsCWmsB+/rJugIQfXDQAlKJWIQeML9AAlNGrSB/1qRRQ6eV
fUZY/h+J1hBGepaAdFsaxG+4UpfUFp3jswCBv5KEtb1vy2eekkDW4m4P4JdKz7pK
DkmUHAa4h8UzQZBkA5hMUCNJSRo35xRzBTsC4o/pRErxBx6YJcJG0AuW6xqWLSeh
1iUMtOSceDrqYElGJ95AIGFk5Ba6GbyeAeufqhj7yWaag7x8reBtyWyjQl+0+UZq
ZnKvj9WSDlkNCEXHbNG96sQXkNyI1VF9giVk2JxTM9OZe0Hm/qjQ9C3vxKHBx1eI
hE2TcvIu2uQWxfdvwLDn
=cLSn
-----END PGP SIGNATURE-----

--=-bYVkvDLaa4xjF3vWSRUB--
