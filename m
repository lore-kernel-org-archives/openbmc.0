Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW6ms53PqzDr6m
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 17:34:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jrzYDbxX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="am+fHMwI"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 88B6821004;
 Mon, 14 Aug 2017 03:34:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 14 Aug 2017 03:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=EIMlkXv3DASHLRoHM9wISWAXHsOfQxfmsakrrKzZq
 pQ=; b=jrzYDbxX4kovzWeuMGyrWOpj2bCVO8EcG91luTt+dXLxLrjJNNOR01ugu
 +dj95KJVRheX8GDgWOeKiy4rkqgVH4lf5uJcle1rWYBdmwIrNePcsmrg8AQgkDXz
 AUgo2oF2g00dM4nMYkTF6WWMH0xgBQiAplQqeDPvkbfy/EDcdsE89rXTp0OD7wiT
 ho6lBZLTWBaxy3R2TbcWDQ5zya3GRmwTLxOOj2QIraQPxs7Phn7BSwwKqGxtQBXd
 aUT8X3f2RrPzl3kQuTh5gqMriYfBEo5Er4XpXNA4zZZ5zy8IZ3n504F2OLSXn3+T
 MmIhhud1alS7MNkWcOu/D38fuvwoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=EIMlkXv3DASHLRoHM9
 wISWAXHsOfQxfmsakrrKzZqpQ=; b=am+fHMwIpaKXyQW1vI1p6QBcIzvvCzHfSE
 rCCCfu1P9lp4K97iP1VLqN6psmtyR/Dkls8puR1iVGKKRkknsytcANBrIUMlVGns
 QqzvgeRTcYE4gwVE4AgAQabWQ9nHG3mvVmD1nGfaMtaPPjmSY/RKBdZZJU3J2iaX
 zyOyO+4igyYJrdxuP5X1Xyv5KPfY/gYAnZ/tQSuQLUi8mR/ECG2bEWWkByfRpAp4
 wyqEBvF/fSqYm55eVAhTzGQ4s4SkR2KFIz6DbSmbfjF2ykasOUvZairadVpTOdAQ
 Xk4T4AVDH3FWxk5qm9MXGx0z87vgdtwUg9hwjVhqV2Cpis1gjFNQ==
X-ME-Sender: <xms:a1KRWdWk8fgKP6QkVF7J_1p7PVnjtSA4vAdWVuuu67ealxWonfiFLg>
X-Sasl-enc: 6UPdKtfBZf/jVAYDilqBh64J8IqwAz/4Fg1W0PJfamlG 1502696042
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 67AFA248A1;
 Mon, 14 Aug 2017 03:34:01 -0400 (EDT)
Message-ID: <1502696038.14932.21.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 2/4] hwmon: (pmbus): Add IBM Common
 Form Factor (CFF) power supply driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Mon, 14 Aug 2017 17:03:58 +0930
In-Reply-To: <1502474205-1557-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474205-1557-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-7qSoo5q1eQdUUWTVmSIA"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Mon, 14 Aug 2017 07:34:06 -0000


--=-7qSoo5q1eQdUUWTVmSIA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-11 at 12:56 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Add the driver to monitor IBM CFF power supplies with hwmon over
> pmbus.
>=C2=A0
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/pmbus/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A010 +++
> =C2=A0drivers/hwmon/pmbus/Makefile=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=
=C2=A01 +
> =C2=A0drivers/hwmon/pmbus/ibm-cffps.c | 151 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 162 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/pmbus/ibm-cffps.c
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 04f6baa..c05b264 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -37,6 +37,16 @@ config SENSORS_ADM1275
> > =C2=A0	=C2=A0=C2=A0This driver can also be built as a module. If so, th=
e module will
> > =C2=A0	=C2=A0=C2=A0be called adm1275.
> =C2=A0
> +config SENSORS_IBM_CFFPS
> > +	tristate "IBM Common Form Factor Power Supply"
> > +	default n
> > +	help
> > +	=C2=A0=C2=A0If you say yes here you get hardware monitoring support f=
or the IBM
> > +	=C2=A0=C2=A0Common Form Factor power supply.
> +
> > +	=C2=A0=C2=A0This driver can also be built as a module. If so, the mod=
ule will
> > +	=C2=A0=C2=A0be called ibm-cffps.
> +
> =C2=A0config SENSORS_IR35221
> > =C2=A0	tristate "Infineon IR35221"
> > =C2=A0	default n
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 663801c..d3d0b2e 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -5,6 +5,7 @@
> > =C2=A0obj-$(CONFIG_PMBUS)		+=3D pmbus_core.o
> > =C2=A0obj-$(CONFIG_SENSORS_PMBUS)	+=3D pmbus.o
> > =C2=A0obj-$(CONFIG_SENSORS_ADM1275)	+=3D adm1275.o
> > +obj-$(CONFIG_SENSORS_IBM_CFFPS)	+=3D ibm-cffps.o
> > =C2=A0obj-$(CONFIG_SENSORS_IR35221)	+=3D ir35221.o
> > =C2=A0obj-$(CONFIG_SENSORS_LM25066)	+=3D lm25066.o
> > =C2=A0obj-$(CONFIG_SENSORS_LTC2978)	+=3D ltc2978.o
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cf=
fps.c
> new file mode 100644
> index 0000000..1a6294c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -0,0 +1,151 @@
> +/*
> + * Copyright 2017 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +/* STATUS_MFR_SPECIFIC bits */
> > +#define CFFPS_MFR_FAN_FAULT			BIT(0)
> > +#define CFFPS_MFR_THERMAL_FAULT			BIT(1)
> > +#define CFFPS_MFR_OV_FAULT			BIT(2)
> > +#define CFFPS_MFR_UV_FAULT			BIT(3)
> > +#define CFFPS_MFR_PS_KILL			BIT(4)
> > +#define CFFPS_MFR_OC_FAULT			BIT(5)
> > +#define CFFPS_MFR_VAUX_FAULT			BIT(6)
> > +#define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
> +
> +static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0int reg)
> +{
> > +	int rc, mfr;
> +
> > +	switch (reg) {
> > +	case PMBUS_STATUS_VOUT:
> > +	case PMBUS_STATUS_IOUT:
> > +	case PMBUS_STATUS_TEMPERATURE:
> > +	case PMBUS_STATUS_FAN_12:
> > +		rc =3D pmbus_read_byte_data(client, page, reg);
> > +		if (rc < 0)
> > +			return rc;
> +
> > +		mfr =3D pmbus_read_byte_data(client, page,
> > +					=C2=A0=C2=A0=C2=A0PMBUS_STATUS_MFR_SPECIFIC);
> > +		if (mfr < 0)
> > +			/*
> > +			=C2=A0* Return the status register instead of an error,
> > +			=C2=A0* since we successfully read status.
> > +			=C2=A0*/
> > +			return rc;
> +
> > +		/* Add MFR_SPECIFIC bits to the standard pmbus status regs. */
> > +		if (reg =3D=3D PMBUS_STATUS_FAN_12) {
> > +			if (mfr & CFFPS_MFR_FAN_FAULT)
> > +				rc |=3D PB_FAN_FAN1_FAULT;
> > +		} else if (reg =3D=3D PMBUS_STATUS_TEMPERATURE) {
> > +			if (mfr & CFFPS_MFR_THERMAL_FAULT)
> > +				rc |=3D PB_TEMP_OT_FAULT;
> > +		} else if (reg =3D=3D PMBUS_STATUS_VOUT) {
> > +			if (mfr & (CFFPS_MFR_OV_FAULT | CFFPS_MFR_VAUX_FAULT))
> > +				rc |=3D PB_VOLTAGE_OV_FAULT;
> > +			if (mfr & CFFPS_MFR_UV_FAULT)
> > +				rc |=3D PB_VOLTAGE_UV_FAULT;
> > +		} else if (reg =3D=3D PMBUS_STATUS_IOUT) {
> > +			if (mfr & CFFPS_MFR_OC_FAULT)
> > +				rc |=3D PB_IOUT_OC_FAULT;
> > +			if (mfr & CFFPS_MFR_CURRENT_SHARE_WARNING)
> > +				rc |=3D PB_CURRENT_SHARE_FAULT;
> > +		}
> > +		break;
> > +	default:
> > +		rc =3D -ENODATA;
> > +		break;
> > +	}
> +
> > +	return rc;
> +}
> +
> +static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0int reg)
> +{
> > +	int rc, mfr;
> +
> > +	switch (reg) {
> > +	case PMBUS_STATUS_WORD:
> > +		rc =3D pmbus_read_word_data(client, page, reg);
> > +		if (rc < 0)
> > +			return rc;
> +
> > +		mfr =3D pmbus_read_byte_data(client, page,
> > +					=C2=A0=C2=A0=C2=A0PMBUS_STATUS_MFR_SPECIFIC);
> > +		if (mfr < 0)
> > +			/*
> > +			=C2=A0* Return the status register instead of an error,
> > +			=C2=A0* since we successfully read status.
> > +			=C2=A0*/
> > +			return rc;
> +
> > +		if (mfr & CFFPS_MFR_PS_KILL)
> > +			rc |=3D PB_STATUS_OFF;
> > +		break;
> > +	default:
> > +		rc =3D -ENODATA;
> > +		break;
> > +	}
> +
> > +	return rc;
> +}
> +
> +static struct pmbus_driver_info ibm_cffps_info =3D {
> > +	.pages =3D 1,
> > +	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> > +		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> > +		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> > +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> > +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,

I feel you should also be setting the format field where relevant. In some
spots the documentation suggests different formats are used across the
different capabilities. However as a fallback it states:

	The power supply will report all values using the linear data formats,
	unless otherwise specified. The power supply will accept values using
	only the linear data formats unless otherwise specified.

The "otherwise specified" cases aren't covered by the driver or the core, s=
o
you're out of the woods there.

However, it happens that the linear enum value is '0' and so the driver wor=
ks
implicitly due to the way you're initialising the structure. I think it's
better to be explicit rather than implicit, otherwise it just looks like an
omission.

I would prefer we add something like:

	.format[PSC_VOLTAGE_IN] =3D linear;
	.format[PSC_VOLTAGE_OUT] =3D linear;
	.format[PSC_CURRENT_OUT] =3D linear;
	.format[PSC_POWER] =3D linear;
	.format[PSC_FAN] =3D linear;
	.format[PSC_TEMPERATURE] =3D linear;

That said, it's a bit of a nit as it should work regardless. I'd be happy w=
ith
a follow-up patch adding the format assignments in.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>


> > +	.read_byte_data =3D ibm_cffps_read_byte_data,
> > +	.read_word_data =3D ibm_cffps_read_word_data,
> +};
> +
> +static int ibm_cffps_probe(struct i2c_client *client,
> > +			=C2=A0=C2=A0=C2=A0const struct i2c_device_id *id)
> +{
> > +	return pmbus_do_probe(client, id, &ibm_cffps_info);
> +}
> +
> +static const struct i2c_device_id ibm_cffps_id[] =3D {
> > +	{ "ibm_cffps1", 1 },
> > +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
> +
> +static const struct of_device_id ibm_cffps_of_match[] =3D {
> > +	{ .compatible =3D "ibm,cffps1" },
> > +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ibm_cffps_of_match);
> +
> +static struct i2c_driver ibm_cffps_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ibm-cffps",
> > +		.of_match_table =3D ibm_cffps_of_match,
> > +	},
> > +	.probe =3D ibm_cffps_probe,
> > +	.remove =3D pmbus_do_remove,
> > +	.id_table =3D ibm_cffps_id,
> +};
> +
> +module_i2c_driver(ibm_cffps_driver);
> +
> +MODULE_AUTHOR("Eddie James");
> +MODULE_DESCRIPTION("PMBus driver for IBM Common Form Factor power suppli=
es");
> +MODULE_LICENSE("GPL");
--=-7qSoo5q1eQdUUWTVmSIA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZkVJmAAoJEJ0dnzgO5LT5feAQAJE/L6hPmw1B42LcKBEZ2pjg
jeFqW4yFOHEkv91JIAUS7TMCiDv5BxWEkxhsE9EVWZtINj9qyhR5hnB01Umta2Pz
Om+lngYxFMZoVRKi1HqDjFwIjo8qm4KIrgEcDxcNRXP8COeVRkBtSacUOjg+i+/6
lYabWYdlee3Kv3P4oX6qakWlENhN7Yfn5e1X+aPEM686omt1tIuwe/5Vqh7lhvsi
kL9YxexlIWLR9WWrw64If2NEmQ1Eo+Ck+6UbHiUHfFarSKwG8wXGKzfc8z+RLbhR
qIPiv/mHapAVuLlA3nxXqVUbZ5b0NNJG7Rwi/ITejcHjXBykPnMPxfbEAUgqsl5q
1mqFVPHGwnPwg6nxCiKZlcfC1yCT2xwwlQfK5ls3K9lGpwodSVcnQkqIPx47xfAA
rqCeypeQeCFuEUBKo1PQuZUqtzlxjIcrqfKrQeXqJMbHJoPR+VbduFpUVG3y0EfR
fgn6fuvYXD4fdAXkm11GNCaqCuh4BtaKpg1x4P/JVuy9hcz9ggBL0wusUgbb22vk
oVGa6z7n1jfQ5gMdYFPcHCfnxp3TEGVJMqP3FFJgcffnwEi7g7pK7WaExkSksh1t
BS8AiSoNvb1ty9gxRb0tZUWXyhMtyKdiuQU/3uSfs6loaJIAkNAOSFyVEIM8tyH9
H5S/VXpmh5U7aiIVmY2r
=wbUy
-----END PGP SIGNATURE-----

--=-7qSoo5q1eQdUUWTVmSIA--
