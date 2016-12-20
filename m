Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjK5k6Vk7zDwRt
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 11:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lBJ4K3BZ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Vx2NU6pb"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C4EBD206F9;
 Mon, 19 Dec 2016 19:53:12 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Dec 2016 19:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=IY2Lc6LO3kBz2MyJ5Yx1tnyCIZg=; b=lBJ4K3
 BZgizI7Tm7OUlH/jIPib/hrdob6FTFqxkLYvnHrZqpYzo0obbUR37z472Kc5rRoi
 x8SfTdK3TKKm0G3RvoxE7bE2AoGIUmRA/NFY4No7/STci8xeAGkhz+YyRh9xL8vX
 a30WzB6CCIOoBHJoKl+Kj9/qhibQ3TDdlNz8s=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=IY2Lc6LO3kBz2M
 yJ5Yx1tnyCIZg=; b=Vx2NU6pbSlcnfuGICAl+545kdBXuacJZUbc4WNmKwKaphV
 mhf4vdjxLysSSKOG6EqzjAZHMJfe0liTYQU5qUHyCwSq7DNQmhBw0oGCU3wy9nHU
 GqZ3ABkr6cTK18NXX3XG7JWo1IF/X2QfHI9n3lchwGY3ZfGjCDrbgV/MvZl/w=
X-ME-Sender: <xms:-IBYWDity5ZawIYaZeG0dswDoS1CUhkYiCOfFUlw_dqeSE2JPeob4g>
X-Sasl-enc: 19kk4ZOA2zUFbU+i/BCF7APaxTRHdfZgMf1zS3zVyYjL 1482195192
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 96DAC7E808;
 Mon, 19 Dec 2016 19:53:10 -0500 (EST)
Message-ID: <1482195187.3419.14.camel@aj.id.au>
Subject: Re: [PATCH linux 5/7] hwmon: occ: Add hwmon implementation for the
 P8 OCC
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 20 Dec 2016 11:23:07 +1030
In-Reply-To: <1481920552-6995-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920552-6995-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8prodqYAbN+Eoiz+HfLn"
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
X-List-Received-Date: Tue, 20 Dec 2016 00:53:15 -0000


--=-8prodqYAbN+Eoiz+HfLn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-16 at 14:35 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add code to tie the hwmon sysfs code and the POWER8 OCC code together, as
> well as probe the entire driver from the I2C bus. I2C is the communicatio=
n
> method between the BMC and the P8 OCC.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0.../devicetree/bindings/i2c/i2c-ibm-occ.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A013 ++
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A014 ++
> =C2=A0drivers/hwmon/occ/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/occ/occ_p8_i2c.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 141 +++++++++++++++++++++
> =C2=A04 files changed, 169 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ibm-oc=
c.txt
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt b/Docu=
mentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
> new file mode 100644
> index 0000000..b0d2b36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
> @@ -0,0 +1,13 @@
> +HWMON I2C driver for IBM POWER CPU OCC (On Chip Controller)
> +
> +Required properties:
> + - compatible: must be "ibm,p8-occ-i2c"
> + - reg: physical address
> +
> +Example:
> > +i2c3: i2c-bus@100 {
> > +	occ@50 {
> > +		compatible =3D "ibm,p8-occ-i2c";
> > +		reg =3D <0x50>;
> > +	};
> +};
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
> +	=C2=A0called occ-p8-i2c.

I think this should be p8-occ-i2c by the #define below and your
compatible string. Though the C file is called 'occ_p8_i2c.c' as well;
maybe it should be renamed? Other than that, consider it tagged with
reviewed-by, these are minor issues.

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
> index 0000000..a151b3a
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p8_i2c.c
> @@ -0,0 +1,141 @@
> +/*
> + * occ_p8_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the P8 OCC over i2c bu=
s.
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
> > +#define P8_OCC_I2C_NAME	"p8-occ-i2c"
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
> +int p8_i2c_getscom(void *bus, u32 address, u8 *data)
> +{
> > +	/* P8 i2c slave requires address to be shifted by 1 */
> > +	address =3D address << 1;
> +
> > +	return occ_i2c_getscom(bus, address, data);
> +}
> +
> +int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
> +{
> > +	/* P8 i2c slave requires address to be shifted by 1 */
> > +	address =3D address << 1;
> +
> > +	return occ_i2c_putscom(bus, address, data0, data1);
> +}
> +
> +static struct occ_bus_ops p8_bus_ops =3D {
> > +	.getscom =3D p8_i2c_getscom,
> > +	.putscom =3D p8_i2c_putscom,
> +};
> +
> +static struct occ_sysfs_config p8_sysfs_config =3D {
> > +	.num_caps_fields =3D ARRAY_SIZE(caps_sensor_names),
> > +	.caps_names =3D caps_sensor_names,
> +};
> +
> +static int p8_occ_probe(struct i2c_client *client,
> > +			const struct i2c_device_id *id)
> +{
> > +	struct occ *occ;
> > +	struct occ_sysfs *hwmon;
> +
> > +	occ =3D p8_occ_start(&client->dev, client, &p8_bus_ops);
> > +	if (IS_ERR(occ))
> > +		return PTR_ERR(occ);
> +
> > +	hwmon =3D occ_sysfs_start(&client->dev, occ, &p8_sysfs_config);
> > +	if (IS_ERR(hwmon))
> > +		return PTR_ERR(hwmon);
> +
> > +	i2c_set_clientdata(client, hwmon);
> +
> > +	return 0;
> +}
> +
> +static int p8_occ_remove(struct i2c_client *client)
> +{
> > +	int rc;
> > +	struct occ_sysfs *hwmon =3D i2c_get_clientdata(client);
> > +	struct occ *occ =3D hwmon->occ;
> +
> > +	rc =3D occ_sysfs_stop(&client->dev, hwmon);
> +
> > +	rc =3D rc || p8_occ_stop(occ);
> +
> > +	return rc;
> +}
> +
> +/* used by old-style board info. */
> +static const struct i2c_device_id occ_ids[] =3D {
> > +	{ P8_OCC_I2C_NAME, 0 },
> > +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, occ_ids);
> +
> +/* used by device table */
> +static const struct of_device_id occ_of_match[] =3D {
> > +	{ .compatible =3D "ibm,p8-occ-i2c" },
> > +	{}
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
> +static struct i2c_driver p8_occ_driver =3D {
> > +	.class =3D I2C_CLASS_HWMON,
> > +	.driver =3D {
> > +		.name =3D P8_OCC_I2C_NAME,
> > +		.pm =3D NULL,
> > +		.of_match_table =3D occ_of_match,
> > +	},
> > +	.probe =3D p8_occ_probe,
> > +	.remove =3D p8_occ_remove,
> > +	.id_table =3D occ_ids,
> > +	.address_list =3D normal_i2c,
> +};
> +
> +module_i2c_driver(p8_occ_driver);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
> +MODULE_LICENSE("GPL");
--=-8prodqYAbN+Eoiz+HfLn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYWIDzAAoJEJ0dnzgO5LT5esAQAIQgbcV0kWE1dJPaas9lvxgS
hyAQuKqI1zR5FXXACj2iqWFAmavM6xjrhEJKzj6QvcVdsjQW6tlP0Thc1jIAQBPl
SkTDr+sfJlAAZ+xwGawqHJQh7AFlcCZkfUV3CVdwt+3vQ4rAiQjSciU9Nplew0vv
AJAh1p/Sm/w2deatm4tVZySq0law5k7/dkJZ47wFH+n/KiPtYA8DWJPP67x1Jkax
CrXplfYLCZKR7lvSMVgK8eFQT4cJ2+SfkH4+P1M8QhCNWADXXx2JIovtkfm0Kx8i
kJq4DFELZcA8qyNacCNvgsgDrKGEEMqB8+uCBdzFETvrFf+SJJvycZ5+6luq7Vn+
Va0qejvXOH/ICFES66UU1d/zkdFt6BSDhYTU9uKX7E3mnQAVqJQPARQ755xPqpaB
fM5timOAnB7pdO5RqHhaORlZNzHfqsXLCtVcZXtEfGl5rjyZSMx/oajCpO/g0Rml
KjisaVZYf+EkaL+7YAEOpbBBGJvaF8m8grShUsyv5REcmIp3LbPSsNEzdNn8vSTx
ojUGYVqiSJ/L9Us7zshVy21ADIMI+aBTurXO/YdKHFN5N77Qna80ydIdDoiIxYBz
gfgYz+0WEHaOxbO4au5v82wDnrr1eZuJXQFaln78yMAZ3L3TfOO1z4isVW71+eM0
8TQuMcmXNdulUykHK9Jf
=nzwM
-----END PGP SIGNATURE-----

--=-8prodqYAbN+Eoiz+HfLn--
