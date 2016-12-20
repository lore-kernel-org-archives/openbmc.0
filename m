Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjKL00Xk8zDwGv
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 12:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JkfX8PQr"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KRefmFi3"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D0DBC207D3;
 Mon, 19 Dec 2016 20:03:49 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Dec 2016 20:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=8UBIPb3U9RJ0NeydMy7M9twRMlM=; b=JkfX8P
 QrBZqN0JG8h2OJapl8VnYnv8xnOlwDOnUHAEgHPe1fs27ucXXieTr1HbXk/+dEyU
 2r8/lLGv6Qq7G2hFcogLHiAQc32zOOh/G+xl9h/3A3XCgS7EQ6H9AFEpryuDL5Vh
 m6VSHbGOpzpP1GW7bAH9gFa9yRsrrOFuduqYg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=8UBIPb3U9RJ0Ne
 ydMy7M9twRMlM=; b=KRefmFi3frLIkonObP0LHNqu8dPApss7CkQ2KzEZ+UMhkx
 e0MIpu7Zud5A1oAQpeZl0BgrC59Gk+5yZ4qvfeTH4ZwA0ToQLep98hu8jXwhQ2NZ
 5qzVUh1Bfr3b6htmfBSSXtVCEmbkKfI0HqwpaCz1f6/tcCidbdfwPYn0XZLag=
X-ME-Sender: <xms:dYNYWESiN4P8j4qyR-tITPpTDyjrH-0-pwxhjPWQcC1px6X3lX6iEQ>
X-Sasl-enc: 1bwYRntGIp+oNJOoxeesJiBoLd7A+x+ZtzkXDX6rxa4t 1482195829
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B87E77E7C5;
 Mon, 19 Dec 2016 20:03:47 -0500 (EST)
Message-ID: <1482195824.3419.18.camel@aj.id.au>
Subject: Re: [PATCH linux 7/7] hwmon: occ: Add callbacks for parsing P9 OCC
 datastructures
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 20 Dec 2016 11:33:44 +1030
In-Reply-To: <1481920586-7165-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920586-7165-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-odM4oCGSTEXVAIJ8oXqQ"
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
X-List-Received-Date: Tue, 20 Dec 2016 01:03:52 -0000


--=-odM4oCGSTEXVAIJ8oXqQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-16 at 14:36 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add functions to parse the data structures that are specific to the OCC o=
n
> the POWER9 processor. These are the sensor data structures, including
> temperature, frequency, power, and "caps."
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0Documentation/hwmon/occ=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A03=
 +
> =C2=A0drivers/hwmon/occ/occ_p9.c | 243 ++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/hwmon/occ/occ_p9.h |=C2=A0=C2=A030 ++++++
> =C2=A03 files changed, 276 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_p9.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_p9.h
>=20
> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> index a6b3dd6..0f17c2f 100644
> --- a/Documentation/hwmon/occ
> +++ b/Documentation/hwmon/occ
> @@ -34,6 +34,9 @@ number of data structures, such as command format, resp=
onse headers, and the
> =C2=A0like, are also defined in this specification, and are common to bot=
h POWER8 and
> =C2=A0POWER9 OCCs.
> =C2=A0
> +There is currently no public P9 OCC specification, and the data structur=
es
> +defined in the POWER9 OCC driver are subject to change.
> +
> =C2=A0sysfs Entries
> =C2=A0-------------
> =C2=A0
> diff --git a/drivers/hwmon/occ/occ_p9.c b/drivers/hwmon/occ/occ_p9.c
> new file mode 100644
> index 0000000..98fd729
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p9.c
> @@ -0,0 +1,243 @@
> +/*
> + * p9.c - OCC hwmon driver
> + *
> + * This file contains the Power9-specific methods and data structures fo=
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
> +#include <linux/i2c.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <asm/unaligned.h>
> +
> +#include "occ.h"
> +#include "occ_p9.h"
> +
> +/* P9 OCC sensor data format */
> +struct p9_temp_sensor {
> > +	u32 sensor_id;
> > +	u8 fru_type;
> > +	u8 value;
> +};
> +
> +struct p8_freq_sensor {
> > +	u32 sensor_id;
> > +	u16 value;
> +};
> +
> +struct p9_power_sensor {
> > +	u32 sensor_id;
> > +	u8 function_id;
> > +	u8 apss_channel;
> > +	u16 reserved;
> > +	u32 update_tag;
> > +	u64 accumulator;
> > +	u16 value;
> +};
> +
> +struct p9_caps_sensor {
> > +	u16 curr_powercap;
> > +	u16 curr_powerreading;
> > +	u16 norm_powercap;
> > +	u16 max_powercap;
> > +	u16 min_powercap;
> > +	u16 user_powerlimit;
> > +	u8 user_powerlimit_source;
> +};
> +
> +void p9_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int snum)
> +{
> > +	switch (sensor_type) {
> > +	case FREQ:
> > +	{
> > +		struct p8_freq_sensor *fs =3D
> +			&(((struct p8_freq_sensor *)sensor)[snum]);

Looks like your search/replace might have gone wrong here, as this is
referencing a *p8* type, not p9.

> +
> > +		fs->sensor_id =3D be32_to_cpu(get_unaligned((u32 *)&data[off]));
> > +		fs->value =3D be16_to_cpu(get_unaligned((u16 *)&data[off + 4]));
> > +	}
> > +		break;
> > +	case TEMP:
> > +	{
> > +		struct p9_temp_sensor *ts =3D
> > +			&(((struct p9_temp_sensor *)sensor)[snum]);
> +
> > +		ts->sensor_id =3D be32_to_cpu(get_unaligned((u32 *)&data[off]));
> > +		fs->fru_type =3D data[off + 4];
> > +		fs->value =3D data[off + 5];
> > +	}
> > +		break;
> > +	case POWER:
> > +	{
> > +		struct p9_power_sensor *ps =3D
> > +			&(((struct p9_power_sensor *)sensor)[snum]);
> +
> > +		ps->sensor_id =3D be32_to_cpu(get_unaligned((u32 *)&data[off]));
> > +		ps->function_id =3D data[off + 4];
> > +		ps->apss_channel =3D data[off + 5];
> > +		ps->update_tag =3D
> > +			be32_to_cpu(get_unaligned((u32 *)&data[off + 8]));
> > +		ps->accumulator =3D
> > +			be64_to_cpu(get_unaligned((u64 *)&data[off + 12]));
> > +		ps->value =3D be16_to_cpu(get_unaligned((u16 *)&data[off + 20]));
> > +	}
> > +		break;
> > +	case CAPS:
> > +	{
> > +		struct p9_caps_sensor *cs =3D
> > +			&(((struct p9_caps_sensor *)sensor)[snum]);
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
> > +			be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
> > +		cs->user_powerlimit_source =3D data[off + 12];
> > +	}
> > +		break;
> > +	};
> +}
> +
> +void *p9_alloc_sensor(int sensor_type, int num_sensors)
> +{
> > +	switch (sensor_type) {
> > +	case FREQ:
> +		return kcalloc(num_sensors, sizeof(struct p8_freq_sensor),

p8 again here, should be p9.

Other than that, looks good. Consider it tagged reviewed-by when you
have applied these fixes.

> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	case TEMP:
> > +		return kcalloc(num_sensors, sizeof(struct p9_temp_sensor),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	case POWER:
> > +		return kcalloc(num_sensors, sizeof(struct p9_power_sensor),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	case CAPS:
> > +		return kcalloc(num_sensors, sizeof(struct p9_caps_sensor),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +	default:
> > +		return NULL;
> > +	}
> +}
> +
> +int p9_get_sensor_value(struct occ *driver, int sensor_type, int snum)
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
> > +		return ((struct p8_freq_sensor *)sensor)[snum].value;
> > +	case TEMP:
> > +		return ((struct p9_temp_sensor *)sensor)[snum].value;
> > +	case POWER:
> > +		return ((struct p9_power_sensor *)sensor)[snum].value;
> > +	default:
> > +		return -EINVAL;
> > +	}
> +}
> +
> +int p9_get_sensor_id(struct occ *driver, int sensor_type, int snum)
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
> > +		return ((struct p8_freq_sensor *)sensor)[snum].sensor_id;
> > +	case TEMP:
> > +		return ((struct p9_temp_sensor *)sensor)[snum].sensor_id;
> > +	case POWER:
> > +		return ((struct p9_power_sensor *)sensor)[snum].sensor_id;
> > +	default:
> > +		return -EINVAL;
> > +	}
> +}
> +
> +int p9_get_caps_value(void *sensor, int snum, int caps_field)
> +{
> > +	struct p9_caps_sensor *caps_sensor =3D sensor;
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
> > +	case 6:
> > +		return caps_sensor[snum].user_powerlimit_source;
> > +	default:
> > +		return -EINVAL;
> > +	}
> +}
> +static const struct occ_ops p9_ops =3D {
> > +	.parse_sensor =3D p9_parse_sensor,
> > +	.alloc_sensor =3D p9_alloc_sensor,
> > +	.get_sensor_value =3D p9_get_sensor_value,
> > +	.get_sensor_id =3D p9_get_sensor_id,
> > +	.get_caps_value =3D p9_get_caps_value,
> +};
> +
> +static const struct occ_config p9_config =3D {
> > +	.command_addr =3D 0xFFFBE000,
> > +	.response_addr =3D 0xFFFBF000,
> +};
> +
> +struct occ *p9_occ_start(struct device *dev, void *bus,
> > +			=C2=A0struct occ_bus_ops *bus_ops)
> +{
> > +	return occ_start(dev, bus, bus_ops, &p9_ops, &p9_config);
> +}
> +EXPORT_SYMBOL(occ_p9_start);
> +
> +int p9_occ_stop(struct occ *occ)
> +{
> > +	return occ_stop(occ);
> +}
> +EXPORT_SYMBOL(occ_p9_stop);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("P9 OCC sensors");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ_p9.h b/drivers/hwmon/occ/occ_p9.h
> new file mode 100644
> index 0000000..8130873
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_p9.h
> @@ -0,0 +1,30 @@
> +/*
> + * occ_p9.h - OCC hwmon driver
> + *
> + * This file contains Power9-specific function prototypes
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
> +#ifndef __OCC_P9_H__
> +#define __OCC_P9_H__
> +
> +#include "scom.h"
> +
> +struct device;
> +
> +struct occ *p9_occ_start(struct device *dev, void *bus,
> > +			=C2=A0struct occ_bus_ops *bus_ops);
> +int p9_occ_stop(struct occ *occ);
> +
> +#endif /* __OCC_P9_H__ */
--=-odM4oCGSTEXVAIJ8oXqQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYWINwAAoJEJ0dnzgO5LT5CPkP/0jq0sNqfvb50A21RPnu8nRC
I1LzXhfoAGTI/z82O2CBtVkilGw3KNZH7kbWpdmJHqnCqtaFETwTcV++Xpu41xaq
dB1IQd2Jox/vNsdTBxJ15O/po4bkCT8PQf26760jHi0NAmID7no/igHtxW9lDLPo
z2idRcHafwusaeGkriFlrN0yr9/EhElHsy83VW+YnYIkIGxEk6/91cle13Uwphcv
BDfHYipTvogVShu72qAdCCneYDFkKmtQSWw1sXz6Ess1oJ/Wt7no0OJhXdWfsXPc
Y9HR8f3oSZEHCX1Y7uZtvfI4DBDbP8/IK8/hee0tOZ/PHTddIE3lSgyYkRtxLHUc
L1EUlBmqFvF2hb0pVwaEM4WrSk8JDKuNfHAoB/ZNiJlZjD9ZzyK/iUBFLUMbjYvR
JLCiqxTAuHmWuF01P3wLKAOiBzb9g5xwfuSJHqPlpPWf7789vccSWUsnhWtLZlAP
z2bJHZe7g9QcLz6LyhFfwPj4Dlv069GkEDF51HwZVW03lfuf4ECmUP/aqziqsymQ
hlNUEIOAnrGOLO385DS0r6QEf5AIbH/X1n9u4+5wlvGiaLqh1y55gWcSoOo7G7b6
fwOBTJJAI0S1hpB1xhwdTKznZcAiyf9/ZoyHGURF+2qKFiq1vOw0kAtqGXcrLE8O
FcTqHo0eE3+zMJb0PlF9
=nyLy
-----END PGP SIGNATURE-----

--=-odM4oCGSTEXVAIJ8oXqQ--
