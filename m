Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjJv25gfvzDwRt
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 11:43:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="k/ympGk/"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TTPdFbGD"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 84C59206E8;
 Mon, 19 Dec 2016 19:43:56 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Dec 2016 19:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=LP3kSuO8azMsQ4wZYj3/bZxkP90=; b=k/ympG
 k/pY0GS2MQJAiTFV8BV7xlnSBasaEsIh0JwG2skhHe6CICOjiMk4nfoiLBnK1ABi
 hlJJ/d05bVMij/sv2u8fQBzhdOhKOs5LVtikxuQbVbgk/ZurQgQuHZmBwmCxiP6+
 t28sgOhbH4Zck+PAUzGHx+gVSUvr87jIvEzWg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=LP3kSuO8azMsQ4
 wZYj3/bZxkP90=; b=TTPdFbGDVevpOMDsP5W7wQUgKdHlhye+sUpwcJ9DTXcPVf
 ciq3ZN6lfIj7FkdjwbnfasxgKVZdGrV2L/pFAncCSm4whf4DtfFoda+FQQQzZE9h
 83+SSDbolbVoYVU89orCK7nQ9W4DiLspR1ieYNVbOwX2muMtd7yftpBtg1CMA=
X-ME-Sender: <xms:zH5YWEeeJWDCNcEMtmxCfSfhcvAyOqAH2DQA6aolXeuSBChANlNGcA>
X-Sasl-enc: NdCoe5CqO+Wv0MmD3RxffXUHwTYRFkYexSHap86jvE3Z 1482194635
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C3137E057;
 Mon, 19 Dec 2016 19:43:54 -0500 (EST)
Message-ID: <1482194631.3419.12.camel@aj.id.au>
Subject: Re: [PATCH linux 4/7] hwmon: occ: Add callbacks for parsing P8 OCC
 datastructures
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 20 Dec 2016 11:13:51 +1030
In-Reply-To: <1481920535-6914-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920535-6914-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9bgxRGcK849/0Mnax021"
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
X-List-Received-Date: Tue, 20 Dec 2016 00:43:59 -0000


--=-9bgxRGcK849/0Mnax021
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

On Fri, 2016-12-16 at 14:35 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add functions to parse the data structures that are specific to the OCC o=
n
> the POWER8 processor. These are the sensor data structures, including
> temperature, frequency, power, and "caps."
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Looks good, considered it tagged Reviewed-by.

Similarly for the last reviewed-by I sent, as I've already supplied a
Signed-off-by tag here don't worry about adding the reviewed-by tag to
the patch.

> ---
> =C2=A0Documentation/hwmon/occ=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A09=
 ++
> =C2=A0drivers/hwmon/occ/occ_p8.c | 217 ++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/hwmon/occ/occ_p8.h |=C2=A0=C2=A030 +++++++
> =C2=A03 files changed, 256 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_p8.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_p8.h
>=20
> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> index 1ee8689..a6b3dd6 100644
> --- a/Documentation/hwmon/occ
> +++ b/Documentation/hwmon/occ
> @@ -25,6 +25,15 @@ Currently, all versions of the OCC support four types =
of sensor data: power,
> =C2=A0temperature, frequency, and "caps," which indicate limits and thres=
holds used
> =C2=A0internally on the OCC.
> =C2=A0
> +The format for the POWER8 OCC sensor data can be found in the P8 OCC
> +specification:
> +github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
> +This document provides the details of the OCC sensors: power, frequency,
> +temperature, and caps. These sensor formats are specific to the POWER8 O=
CC. A
> +number of data structures, such as command format, response headers, and=
 the
> +like, are also defined in this specification, and are common to both POW=
ER8 and
> +POWER9 OCCs.
> +
> =C2=A0sysfs Entries
> =C2=A0-------------
> =C2=A0
> diff --git a/drivers/hwmon/occ/occ_p8.c b/drivers/hwmon/occ/occ_p8.c
> new file mode 100644
> index 0000000..812df16
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p8.c
> @@ -0,0 +1,217 @@
> +/*
> + * occ_p8.c - OCC hwmon driver
> + *
> + * This file contains the Power8-specific methods and data structures fo=
r
> + * the OCC hwmon driver.
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
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <asm/unaligned.h>
> +
> +#include "occ.h"
> +#include "occ_p8.h"
> +
> +/* P8 OCC sensor data format */
> +struct p8_occ_sensor {
> > +	u16 sensor_id;
> > +	u16 value;
> +};
> +
> +struct p8_power_sensor {
> > +	u16 sensor_id;
> > +	u32 update_tag;
> > +	u32 accumulator;
> > +	u16 value;
> +};
> +
> +struct p8_caps_sensor {
> > +	u16 curr_powercap;
> > +	u16 curr_powerreading;
> > +	u16 norm_powercap;
> > +	u16 max_powercap;
> > +	u16 min_powercap;
> > +	u16 user_powerlimit;
> +};
> +
> +void p8_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int snum)
> +{
> > +	switch (sensor_type) {
> > +	case FREQ:
> > +	case TEMP:
> > +	{
> > +		struct p8_occ_sensor *os =3D
> > +			&(((struct p8_occ_sensor *)sensor)[snum]);
> +
> > +		os->sensor_id =3D be16_to_cpu(get_unaligned((u16 *)&data[off]));
> > +		os->value =3D be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
> > +	}
> > +		break;
> > +	case POWER:
> > +	{
> > +		struct p8_power_sensor *ps =3D
> > +			&(((struct p8_power_sensor *)sensor)[snum]);
> +
> > +		ps->sensor_id =3D be16_to_cpu(get_unaligned((u16 *)&data[off]));
> > +		ps->update_tag =3D
> > +			be32_to_cpu(get_unaligned((u32 *)&data[off + 2]));
> > +		ps->accumulator =3D
> > +			be32_to_cpu(get_unaligned((u32 *)&data[off + 6]));
> > +		ps->value =3D be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
> > +	}
> > +		break;
> > +	case CAPS:
> > +	{
> > +		struct p8_caps_sensor *cs =3D
> > +			&(((struct p8_caps_sensor *)sensor)[snum]);
> +
> > +		cs->curr_powercap =3D
> > +			be16_to_cpu(get_unaligned((u16 *)&data[off]));
> > +		cs->curr_powerreading =3D
> > +			be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
> > +		cs->norm_powercap =3D
> > +			be16_to_cpu(get_unaligned((u16 *)&data[off + 4]));
> > +		cs->max_powercap =3D
> > +			be16_to_cpu(get_unaligned((u16 *)&data[off + 6]));
> > +		cs->min_powercap =3D
> > +			be16_to_cpu(get_unaligned((u16 *)&data[off + 8]));
> > +		cs->user_powerlimit =3D
> +			be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));

Conservative, but reasonable with the get_unaligned()s. From the
perspective of the function we can't guarantee the value of 'off'.

> +	}
> > +		break;
> > +	};
> +}
> +
> +void *p8_alloc_sensor(int sensor_type, int num_sensors)
> +{
> > +	switch (sensor_type) {
> > +	case FREQ:
> > +	case TEMP:
> > +		return kcalloc(num_sensors, sizeof(struct p8_occ_sensor),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	case POWER:
> > +		return kcalloc(num_sensors, sizeof(struct p8_power_sensor),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	case CAPS:
> > +		return kcalloc(num_sensors, sizeof(struct p8_caps_sensor),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	default:
> > +		return NULL;
> > +	}
> +}
> +
> +int p8_get_sensor_value(struct occ *driver, int sensor_type, int snum)
> +{
> > +	void *sensor;
> +
> > +	if (sensor_type =3D=3D CAPS)
> > +		return -EINVAL;
> +
> > +	sensor =3D occ_get_sensor(driver, sensor_type);
> > +	if (!sensor)
> > +		return -ENODEV;
> +
> > +	switch (sensor_type) {
> > +	case FREQ:
> > +	case TEMP:
> > +		return ((struct p8_occ_sensor *)sensor)[snum].value;
> > +	case POWER:
> > +		return ((struct p8_power_sensor *)sensor)[snum].value;
> > +	default:
> > +		return -EINVAL;
> > +	}
> +}
> +
> +int p8_get_sensor_id(struct occ *driver, int sensor_type, int snum)
> +{
> > +	void *sensor;
> > +	int i =3D snum;
> +
> > +	if (sensor_type =3D=3D CAPS)
> > +		return -EINVAL;
> +
> > +	sensor =3D occ_get_sensor(driver, sensor_type);
> > +	if (!sensor)
> > +		return -ENODEV;
> +
> > +	switch (sensor_type) {
> > +	case FREQ:
> > +	case TEMP:
> > +		return ((struct p8_occ_sensor *)sensor)[i].sensor_id;
> > +	case POWER:
> > +		return ((struct p8_power_sensor *)sensor)[i].sensor_id;
> > +	default:
> > +		return -EINVAL;
> > +	}
> +}
> +
> +int p8_get_caps_value(void *sensor, int snum, int caps_field)
> +{
> > +	struct p8_caps_sensor *caps_sensor =3D sensor;
> +
> > +	switch (caps_field) {
> > +	case 0:
> > +		return caps_sensor[snum].curr_powercap;
> > +	case 1:
> > +		return caps_sensor[snum].curr_powerreading;
> > +	case 2:
> > +		return caps_sensor[snum].norm_powercap;
> > +	case 3:
> > +		return caps_sensor[snum].max_powercap;
> > +	case 4:
> > +		return caps_sensor[snum].min_powercap;
> > +	case 5:
> > +		return caps_sensor[snum].user_powerlimit;
> > +	default:
> > +		return -EINVAL;
> > +	}
> +}
> +
> +static const struct occ_ops p8_ops =3D {
> > +	.parse_sensor =3D p8_parse_sensor,
> > +	.alloc_sensor =3D p8_alloc_sensor,
> > +	.get_sensor_value =3D p8_get_sensor_value,
> > +	.get_sensor_id =3D p8_get_sensor_id,
> > +	.get_caps_value =3D p8_get_caps_value,
> +};
> +
> +static const struct occ_config p8_config =3D {
> > +	.command_addr =3D 0xFFFF6000,
> > +	.response_addr =3D 0xFFFF7000,
> +};
> +
> +struct occ *p8_occ_start(struct device *dev, void *bus,
> > +			=C2=A0struct occ_bus_ops *bus_ops)
> +{
> > +	return occ_start(dev, bus, bus_ops, &p8_ops, &p8_config);
> +}
> +EXPORT_SYMBOL(p8_occ_start);
> +
> +int p8_occ_stop(struct occ *occ)
> +{
> > +	return occ_stop(occ);
> +}
> +EXPORT_SYMBOL(p8_occ_stop);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("P8 OCC sensors");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_p8.h b/drivers/hwmon/occ/occ_p8.h
> new file mode 100644
> index 0000000..b44cdd4
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p8.h
> @@ -0,0 +1,30 @@
> +/*
> + * occ_p8.h - OCC hwmon driver
> + *
> + * This file contains Power8-specific function prototypes
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
> +#ifndef __OCC_P8_H__
> +#define __OCC_P8_H__
> +
> +#include "scom.h"
> +
> +struct device;
> +
> +struct occ *p8_occ_start(struct device *dev, void *bus,
> > +			=C2=A0struct occ_bus_ops *bus_ops);
> +int p8_occ_stop(struct occ *occ);
> +
> +#endif /* __OCC_P8_H__ */
--=-9bgxRGcK849/0Mnax021
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYWH7HAAoJEJ0dnzgO5LT5ryoP/1EFcw4oB4iHoIls/N0Z5OKa
9pz3MSqPCI0EzzPQfk7226+kx7CHlfFbxglR6HiJy6KrAAdubwmU/X67BKupu/Du
b9KlHCUUNM5UPc4T+xO8wGsUewDuR4/fWJbzOfi1HT9Acjqf8jD1Mzijsmzp3e48
JspeyDRNmIVT6tu9NMSD/RrQfoI6BZcdrmbZ3BRas+tFUk7mT5H/UdL84ebEJTb1
MdkleAQi/Umm55rQmWrTVC+Oldx1bFsd9PWrbfaKe4VQsb3ktYMCg4nQz3gTTS29
e0/FxN8cygr+HbXdtEraDoizDcgLrG7PYhUSQXa3XauIV8zh8aF5cImAWKxJj0zt
uLjliW149C3RAamKi6CadXJSa2rDAzyaE1TMVkWUACtujsadeGq0xNFGJ8j4iq0p
bjOeSQgblLTYIhvetlBNvModHr95GPGPPkW1YHbG8mlqhE46+UBdmao5jZrp+giR
C44/5+UHCIyvDC3tPFa0txdVeRUTs4jbROyQSNSpFrObmTXFz0TbHWIoD+KJovH0
296ACH7HEomtRh7D+TPNhrt022SQSkWWQs05Xdqwd+EvHhsqKJqcCOSjFJmmdkvc
1ySptjRZwKRBSmEdZc+xG8rnFJU4CRXIUMs0H4ERdl0pWdhpI/ywtVAS8jNEIE3V
r7kEQXFfzzdT/2n6fYxg
=XkbQ
-----END PGP SIGNATURE-----

--=-9bgxRGcK849/0Mnax021--
