Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNnxT2sYxzDqG5
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 10:34:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ukCbtRmi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fwqp4NNh"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4872D20BCD;
 Thu,  3 Aug 2017 20:34:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 03 Aug 2017 20:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=q8OXwfmjg9v/q9PWls7j7zqxZoJ8i+h950ZIr19ou
 uE=; b=ukCbtRmimGNuN3brFI2ypLWjQEjhWRAb35mKeR/2hjAXV0YrDm7uLemK0
 xN6RayYqwDPzDes9MISV0UOTZKvPN4kjKAb5AXgvrWqQoKv8z6HnnKpn436c+HoF
 i5Z5/BeVEUVEwS+3ml8Ml3wDXtefuwmcnuC0iRUetmHghKMMcLL5CiasWf/w6GW7
 q8cAiELWNMRUzQPkyOoigEzompenDUMdKj8YxpbDBiwVjfXWTyhpkMWIAe8Zi6+J
 bptNYhcBLpLwAXXVZbunuTN3FZvZ3fR9agOuU9+SzyX1wbB/6tGexItfYpbiN/jx
 8VKJGOISc8PNEaDnf/Ho0qCuaCedg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=q8OXwfmjg9v/q9PWls
 7j7zqxZoJ8i+h950ZIr19ouuE=; b=fwqp4NNhaoOWfLzItbMeIiot4NHsur5Fqi
 V95hdHEDScsNKTnTRT4eHUB2FJufBP1Cd6o/Se/6AfSryaMJTwibmGbgrdxvUqun
 kQxk1akzuo2GCTruzDjXeSt1yGbTCrCAs0DyZPNlN1G5Uqdyi67Gfj2x3qY69I7N
 zOBlxeUpXwJBV9DQYcdW4N78MCNQErNgFULnoYDk+DRPVyS67wN4LCH0lV+7t6DU
 dDFeBMdo1eE0m9AC9uBUz8RzluTJwDl6SONbkkAQVqKqD0LErfJR+nL50kt7pZJL
 a4B5oepW8UjkYf8/Ny0M42VFuJHjQEKICRwUx4cyOxsiErP7s48A==
X-ME-Sender: <xms:G8GDWSTfAYDO2wtfou-xOzLHDpWhCiw0mPfgIWEaYLyviZOgHNNoBg>
X-Sasl-enc: MRHT888jRLmB1Tdy79cwRqmPIBnN0f/XE/NZYGZJfVLD 1501806874
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3754B244AA;
 Thu,  3 Aug 2017 20:34:32 -0400 (EDT)
Message-ID: <1501806869.29409.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 1/5] drivers/hwmon/pmbus: Add IBM
 power supply hwmon driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Fri, 04 Aug 2017 10:04:29 +0930
In-Reply-To: <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HttfS/EM959nlN+0DjfI"
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
X-List-Received-Date: Fri, 04 Aug 2017 00:34:38 -0000


--=-HttfS/EM959nlN+0DjfI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-02 at 15:25 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add the driver to monitor power supplies with hwmon over pmbus.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/pmbus/Kconfig=C2=A0=C2=A0|=C2=A0=C2=A010 +++
> =C2=A0drivers/hwmon/pmbus/Makefile |=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/pmbus/ibmps.c=C2=A0=C2=A0| 164 ++++++++++++++++++++++=
+++++++++++++++++++++
> =C2=A03 files changed, 175 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/pmbus/ibmps.c
>=20
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 04f6baa..079a087 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -37,6 +37,16 @@ config SENSORS_ADM1275
> > =C2=A0	=C2=A0=C2=A0This driver can also be built as a module. If so, th=
e module will
> > =C2=A0	=C2=A0=C2=A0be called adm1275.
> =C2=A0
> +config SENSORS_IBMPS
> > +	tristate "IBM Power Supply"
> > +	default n
> > +	help
> > +	=C2=A0=C2=A0If you say yes here you get hardware monitoring support f=
or IBM
> > +	=C2=A0=C2=A0power supply.
> +
> > +	=C2=A0=C2=A0This driver can also be built as a module. If so, the mod=
ule will
> > +	=C2=A0=C2=A0be called ibmps.
> +
> =C2=A0config SENSORS_IR35221
> > =C2=A0	tristate "Infineon IR35221"
> > =C2=A0	default n
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 663801c..76d77e0 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -5,6 +5,7 @@
> > =C2=A0obj-$(CONFIG_PMBUS)		+=3D pmbus_core.o
> > =C2=A0obj-$(CONFIG_SENSORS_PMBUS)	+=3D pmbus.o
> > =C2=A0obj-$(CONFIG_SENSORS_ADM1275)	+=3D adm1275.o
> > +obj-$(CONFIG_SENSORS_IBMPS)	+=3D ibmps.o
> > =C2=A0obj-$(CONFIG_SENSORS_IR35221)	+=3D ir35221.o
> > =C2=A0obj-$(CONFIG_SENSORS_LM25066)	+=3D lm25066.o
> > =C2=A0obj-$(CONFIG_SENSORS_LTC2978)	+=3D ltc2978.o
> diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.c
> new file mode 100644
> index 0000000..1928dd9
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ibmps.c
> @@ -0,0 +1,164 @@
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

I think a comment is needed here to point out these bits are for
STATUS_MFR_SPECIFIC.

> +#define IBMPS_MFR_FAN_FAULT			BIT(0)
> > +#define IBMPS_MFR_THERMAL_FAULT			BIT(1)
> > +#define IBMPS_MFR_OV_FAULT			BIT(2)
> > +#define IBMPS_MFR_UV_FAULT			BIT(3)
> > +#define IBMPS_MFR_PS_KILL			BIT(4)
> > +#define IBMPS_MFR_OC_FAULT			BIT(5)
> > +#define IBMPS_MFR_VAUX_FAULT			BIT(6)
> > +#define IBMPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
> +
> +static int ibmps_read_word_data(struct i2c_client *client, int page, int=
 reg);
> +

This makes me curious.

> +static int ibmps_read_byte_data(struct i2c_client *client, int page, int=
 reg)
> +{
> > +	int rc, mfr;
> +
> > +	switch (reg) {
> > +	case PMBUS_STATUS_BYTE:
> > +	case PMBUS_STATUS_WORD:
> +		rc =3D ibmps_read_word_data(client, page, PMBUS_STATUS_WORD);

Feels wrong to return "junk" in the result for a PMBUS_STATUS_BYTE
query.

> +		break;
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
> > +			return rc;
> +
> > +		if (reg =3D=3D PMBUS_STATUS_FAN_12) {
> > +			if (mfr & IBMPS_MFR_FAN_FAULT)
> > +				rc |=3D PB_FAN_FAN1_FAULT;
> > +		} else if (reg =3D=3D PMBUS_STATUS_TEMPERATURE) {
> > +			if (mfr & IBMPS_MFR_THERMAL_FAULT)
> > +				rc |=3D PB_TEMP_OT_FAULT;
> > +		} else if (reg =3D=3D PMBUS_STATUS_VOUT) {
> > +			if (mfr & (IBMPS_MFR_OV_FAULT | IBMPS_MFR_VAUX_FAULT))
> > +				rc |=3D PB_VOLTAGE_OV_FAULT;
> > +			if (mfr & IBMPS_MFR_UV_FAULT)
> > +				rc |=3D PB_VOLTAGE_UV_FAULT;
> > +		} else if (reg =3D=3D PMBUS_STATUS_IOUT) {
> > +			if (mfr & IBMPS_MFR_OC_FAULT)
> > +				rc |=3D PB_IOUT_OC_FAULT;
> > +			if (mfr & IBMPS_MFR_CURRENT_SHARE_WARNING)
> +				rc |=3D PB_CURRENT_SHARE_FAULT;

> +		}

I wonder why it was done this way and not simply via the spec'ed bits?
Maybe some don't fit, but it seems there's a pretty direct mapping for
the most part.

Do the spec'ed status bits ever get set? As in, is there ever some
ambiguity about how the bits got set?

> > +		break;
> > +	default:
> > +		if (reg >=3D PMBUS_VIRT_BASE)
> > +			return -ENXIO;
> +
> +		rc =3D pmbus_read_byte_data(client, page, reg);

The alternative here is -ENODATA; not sure which is better though.

> +		break;
> > +	}
> +
> > +	return rc;
> +}
> +
> +static int ibmps_read_word_data(struct i2c_client *client, int page, int=
 reg)
> +{
> > +	int rc, mfr;
> +
> > +	switch (reg) {
> > +	case PMBUS_STATUS_BYTE:
> > +	case PMBUS_STATUS_WORD:
> > +		rc =3D pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
> > +		if (rc < 0)
> > +			return rc;
> +
> > +		mfr =3D pmbus_read_byte_data(client, page,
> > +					=C2=A0=C2=A0=C2=A0PMBUS_STATUS_MFR_SPECIFIC);
> > +		if (mfr < 0)
> > +			return rc;
> +
> > +		if (mfr & IBMPS_MFR_PS_KILL)
> > +			rc |=3D PB_STATUS_OFF;
> +
> > +		if (mfr)
> +			rc |=3D PB_STATUS_WORD_MFR;

This isn't set automatically by the device?

> +		break;
> > +	default:
> > +		if (reg >=3D PMBUS_VIRT_BASE)
> > +			return -ENXIO;
> +
> > +		rc =3D pmbus_read_word_data(client, page, reg);
> > +		if (rc < 0)
> +			rc =3D ibmps_read_byte_data(client, page, reg);

Is this really the way we should go about accesses?

> +		break;
> > +	}
> +
> > +	return rc;
> +}
> +
> +static struct pmbus_driver_info ibmps_info =3D {
> > +	.pages =3D 1,
> > +	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> > +		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> > +		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> > +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> > +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> > +	.read_byte_data =3D ibmps_read_byte_data,
> > +	.read_word_data =3D ibmps_read_word_data,
> +};
> +
> +static int ibmps_probe(struct i2c_client *client,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct i2c_device_id=
 *id)
> +{
> +	return pmbus_do_probe(client, id, &ibmps_info);

Is there anything we need to check before probe, e.g.
MFR_ID/MFR_MODEL/MFR_REVISION? Are there options that might need to be
configured (and exposed via devicetree bindings)?

I note we support fans: Is FAN_CONFIG_1_2 configured as needed? Or do
we need to enable the fan, configure PWM vs RPM and the tach pulses
value? If it is pre-configured, is this register always going to be
pre-configured? Or do we need a property like my proposed 'use-stored-
presence' for the MAX31785?

Have you had a look at my proposed bindings for the max31785? I think
it would be worth your input, as we have another case of fans here, and
it will help us shape a better picture of whether my generic properties
 and node structure are appropriate.

> +}
> +
> +static int ibmps_remove(struct i2c_client *client)
> +{
> > +	return pmbus_do_remove(client);
> +}
> +
> +enum chips { witherspoon };

This doesn't look necessary.

> +
> +static const struct i2c_device_id ibmps_id[] =3D {
> > +	{ "witherspoon", witherspoon },
> > +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ibmps_id);
> +
> +static const struct of_device_id ibmps_of_match[] =3D {
> > +	{ .compatible =3D "ibm,ibmps" },
> > +	{}
> +};
> +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);

p8_i2c_occ_of_match isn't right. Do we need both device tables?
"witherspoon" as a device ID also seems unusual. What's going on there?

> +
> +static struct i2c_driver ibmps_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ibmps",
> > +		.of_match_table =3D ibmps_of_match,
> > +	},
> > +	.probe =3D ibmps_probe,
> > +	.remove =3D ibmps_remove,
> > +	.id_table =3D ibmps_id,
> +};
> +
> +module_i2c_driver(ibmps_driver);
> +
> +MODULE_AUTHOR("Eddie James");
> +MODULE_DESCRIPTION("PMBus driver for IBM power supply");

So do we anticipate only ever having one power supply design? The name
feels a bit generic. In the device id table above you suggest it's
called 'witherspoon'. Is the design specific to Witherspoon? If so this
fact should be included in the driver name and description.

If there are other power supplies that are similar, then when we add
support we can rename the driver, and add any necessary module aliases,
and have a common device id table listing all of the supported devices.

Cheers,

Andrew

> +MODULE_LICENSE("GPL");
--=-HttfS/EM959nlN+0DjfI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZg8EVAAoJEJ0dnzgO5LT5cVwQAJ2yBKaAgUKNlnTDYd4VUvw9
ybgn+hiLDP/CNJVD8auoTuJh09YdG1fWXsM+OIv8GZkMZQuSmZlcEeiA7tF7Zk2A
WMGYWGQUvP6iWGb7Ve0FgtBOZKAePj44slAFlpgYgSqyseJKwqmAw7/Cl+60mZp4
QT9BLFKd04e6PCxM2GD2sIzjFgdQM0m2S3penLeU+MmXi8BRhax6WIqaoPKchuRi
KXac+R3u/W3UJyaU+fMdMlxvU4rAErU+carAY05i+PGFaQl4kUg06NCruptE/JR0
6xv3XvxCxTTmawcG4csXepx6MoDefRBIXZQH6QqyvT9UzopqjhEd4dhD9ZJePIRJ
+SMlPfztDGcOLJU8lp8vi1U7mps26Trl7IFPz6+97OAyLuzRvmoN0FXsEbbsl4AS
6bKrHeKzzXoB0ZIFmd1jQOpiHT/q4/Nl0tJPzgMoDHK6xIj6cIFPo0oJkHoRjgHT
IuF8XE0MZ1JiNEKJBHidk7L5DsgtvSHaXJdcQAKG5bWQwYKpx26aqdFULmNpFlTr
EgOlx/lEzgLAc7WYTrpuL28AsRRMNXszt9foOop9IMwnHrxQX4hGUFVS8bx+jjYB
fo2f+s88fAv9m+JmKzk3n/Q+/tLAr7Ssb0yS5gjjMPttriEBsegPDoi3A1BffaC4
bm80gWV3Lg4BZGx+Hvpw
=cLBY
-----END PGP SIGNATURE-----

--=-HttfS/EM959nlN+0DjfI--
