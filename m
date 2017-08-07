Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xQmcR07VQzDqps
 for <openbmc@lists.ozlabs.org>; Mon,  7 Aug 2017 15:41:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YpRcCl77"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cBcmkXGX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E7F22207D7;
 Mon,  7 Aug 2017 01:41:37 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 07 Aug 2017 01:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=EYoteA9pBQ74dP0bhl6uTD4dxkvqYlE+hESaofvAk
 Ng=; b=YpRcCl77nurAr+rpZ7gDiKIadajV6QtLX0r1K8IhEAoJmWNherDkbcg+Z
 46PmL41NfhnVWZTTEdKZDlmmCGmPDNc0HRnUYpG7+8d8pQOGOlbnYMOaSdw6JZer
 XEdIZ4QJ1FKwjI9IEeGdPxYl7qJxCiTQ+QIXShs7kHEkiZsTXRPu2OL6vW72nm2t
 7v80R76kH51ccMUMtbX6I9eWz16jN6EEAbed87taODAPsorBGWsr6pO4j2ROuxrX
 vgdv1gHFrV6Ruh1KQ8a4S3Ad6IRq9aBt1fuBeMNJqIrJmLGrcX6jEqGOzNt6WBu9
 ZZKHydeXcgR5imzKKaSx4L2lKDvVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=EYoteA9pBQ74dP0bhl
 6uTD4dxkvqYlE+hESaofvAkNg=; b=cBcmkXGX1VbIS49HONryBk1XkE8sXmP92b
 hynK4BysYY6vWW7J7DhlkeVSWT9sBGqNGSJM9M8m011u6YihDNqDpDT5Xw/V/slm
 0NhnAw+nMukeX/zoIy8f8mR0KgG1YJ8nRhQdCtXQquwsXFkz6CzZKboGw5/wwMeI
 HtwP3qJmnS3P0ulYjwBYMxj4jUBtrZ2EF+RN1WF4IvJ1bpG2mOnprjGKv+GICmtZ
 jRdfBdI4dtauLkYZrYAQQ/Ahg8DEaFkfjdkS10WMXN99rEuSeDYlj1lvcsHqMMCW
 TB7qmCpkqpumPOQnXUn2SNOpmWOEa46aebD5ahX4JbKE+4TMzQOw==
X-ME-Sender: <xms:kf2HWQzemGbrCASSEyhObmp4NhQiR7krwolGhLC88czrWay6CtfQwQ>
X-Sasl-enc: OZYVBNxFzItd/zjacypYvQ2jPNZhujbn0wMaoMAnlzBQ 1502084497
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1044F7F9D0;
 Mon,  7 Aug 2017 01:41:35 -0400 (EDT)
Message-ID: <1502084490.7709.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 1/5] drivers/hwmon/pmbus: Add IBM
 power supply hwmon driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Mon, 07 Aug 2017 15:11:30 +0930
In-Reply-To: <80c3981a-b3b3-f9da-2fcb-f64dd06ac9b8@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1501806869.29409.14.camel@aj.id.au>
 <80c3981a-b3b3-f9da-2fcb-f64dd06ac9b8@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WMPGqSHcFaadkzhPPqOC"
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
X-List-Received-Date: Mon, 07 Aug 2017 05:41:44 -0000


--=-WMPGqSHcFaadkzhPPqOC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-04 at 10:03 -0500, Eddie James wrote:
>=20
> On 08/03/2017 07:34 PM, Andrew Jeffery wrote:
> > On Wed, 2017-08-02 at 15:25 -0500, Eddie James wrote:
> > > > From: "Edward A. James" <eajames@us.ibm.com>
> > >=20
> > > Add the driver to monitor power supplies with hwmon over pmbus.
> > >=20
> > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > >=20
> > > ---
> > > =C2=A0 drivers/hwmon/pmbus/Kconfig=C2=A0=C2=A0|=C2=A0=C2=A010 +++
> > > =C2=A0 drivers/hwmon/pmbus/Makefile |=C2=A0=C2=A0=C2=A01 +
> > > =C2=A0 drivers/hwmon/pmbus/ibmps.c=C2=A0=C2=A0| 164 +++++++++++++++++=
++++++++++++++++++++++++++
> > > =C2=A0 3 files changed, 175 insertions(+)
> > > =C2=A0 create mode 100644 drivers/hwmon/pmbus/ibmps.c
> > >=20
> > > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfi=
g
> > > index 04f6baa..079a087 100644
> > > --- a/drivers/hwmon/pmbus/Kconfig
> > > +++ b/drivers/hwmon/pmbus/Kconfig
> > > @@ -37,6 +37,16 @@ config SENSORS_ADM1275
> > > > > > > > =C2=A0=C2=A0	=C2=A0=C2=A0This driver can also be built as a=
 module. If so, the module will
> > > > =C2=A0=C2=A0	=C2=A0=C2=A0be called adm1275.
> > >=20
> > > =C2=A0=C2=A0
> > > +config SENSORS_IBMPS
> > > > > > > > +	tristate "IBM Power Supply"
> > > > > > > > +	default n
> > > > > > > > +	help
> > > > > > > > +	=C2=A0=C2=A0If you say yes here you get hardware monitori=
ng support for IBM
> > > > +	=C2=A0=C2=A0power supply.
> > >=20
> > > +
> > > > > > > > +	=C2=A0=C2=A0This driver can also be built as a module. If=
 so, the module will
> > > > +	=C2=A0=C2=A0be called ibmps.
> > >=20
> > > +
> > > =C2=A0 config SENSORS_IR35221
> > > > > > > > =C2=A0=C2=A0	tristate "Infineon IR35221"
> > > > =C2=A0=C2=A0	default n
> > >=20
> > > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makef=
ile
> > > index 663801c..76d77e0 100644
> > > --- a/drivers/hwmon/pmbus/Makefile
> > > +++ b/drivers/hwmon/pmbus/Makefile
> > > @@ -5,6 +5,7 @@
> > > > > > > > =C2=A0 obj-$(CONFIG_PMBUS)		+=3D pmbus_core.o
> > > > > > > > =C2=A0 obj-$(CONFIG_SENSORS_PMBUS)	+=3D pmbus.o
> > > > > > > > =C2=A0 obj-$(CONFIG_SENSORS_ADM1275)	+=3D adm1275.o
> > > > > > > > +obj-$(CONFIG_SENSORS_IBMPS)	+=3D ibmps.o
> > > > > > > > =C2=A0 obj-$(CONFIG_SENSORS_IR35221)	+=3D ir35221.o
> > > > > > > > =C2=A0 obj-$(CONFIG_SENSORS_LM25066)	+=3D lm25066.o
> > > > =C2=A0 obj-$(CONFIG_SENSORS_LTC2978)	+=3D ltc2978.o
> > >=20
> > > diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.=
c
> > > new file mode 100644
> > > index 0000000..1928dd9
> > > --- /dev/null
> > > +++ b/drivers/hwmon/pmbus/ibmps.c
> > > @@ -0,0 +1,164 @@
> > > +/*
> > > + * Copyright 2017 IBM Corp.
> > > + *
> > > + * This program is free software; you can redistribute it and/or mod=
ify
> > > + * it under the terms of the GNU General Public License as published=
 by
> > > + * the Free Software Foundation; either version 2 of the License, or
> > > + * (at your option) any later version.
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/jiffies.h>
> > > +#include <linux/module.h>
> > > +
> > > +#include "pmbus.h"
> > > +
> >=20
> > I think a comment is needed here to point out these bits are for
> > STATUS_MFR_SPECIFIC.
> >=20
> > > > > > +#define IBMPS_MFR_FAN_FAULT			BIT(0)
> > > > > > > > +#define IBMPS_MFR_THERMAL_FAULT			BIT(1)
> > > > > > > > +#define IBMPS_MFR_OV_FAULT			BIT(2)
> > > > > > > > +#define IBMPS_MFR_UV_FAULT			BIT(3)
> > > > > > > > +#define IBMPS_MFR_PS_KILL			BIT(4)
> > > > > > > > +#define IBMPS_MFR_OC_FAULT			BIT(5)
> > > > > > > > +#define IBMPS_MFR_VAUX_FAULT			BIT(6)
> > > > +#define IBMPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
> > >=20
> > > +
> > > +static int ibmps_read_word_data(struct i2c_client *client, int page,=
 int reg);
> > > +
> >=20
> > This makes me curious.
> >=20
> > > +static int ibmps_read_byte_data(struct i2c_client *client, int page,=
 int reg)
> > > +{
> > > > +	int rc, mfr;
> > >=20
> > > +
> > > > > > > > +	switch (reg) {
> > > > > > > > +	case PMBUS_STATUS_BYTE:
> > > > +	case PMBUS_STATUS_WORD:
> > >=20
> > > +		rc =3D ibmps_read_word_data(client, page, PMBUS_STATUS_WORD);
> >=20
> > Feels wrong to return "junk" in the result for a PMBUS_STATUS_BYTE
> > query.
>=20
> Good point, I'll mask the byte one.
>=20
> >=20
> > > > > > +		break;
> > > > > > > > +	case PMBUS_STATUS_VOUT:
> > > > > > > > +	case PMBUS_STATUS_IOUT:
> > > > > > > > +	case PMBUS_STATUS_TEMPERATURE:
> > > > > > > > +	case PMBUS_STATUS_FAN_12:
> > > > > > > > +		rc =3D pmbus_read_byte_data(client, page, reg);
> > > > > > > > +		if (rc < 0)
> > > > +			return rc;
> > >=20
> > > +
> > > > > > > > +		mfr =3D pmbus_read_byte_data(client, page,
> > > > > > > > +					=C2=A0=C2=A0=C2=A0PMBUS_STATUS_MFR_SPECIFIC);
> > > > > > > > +		if (mfr < 0)
> > > > +			return rc;
> > >=20
> > > +
> > > > > > > > +		if (reg =3D=3D PMBUS_STATUS_FAN_12) {
> > > > > > > > +			if (mfr & IBMPS_MFR_FAN_FAULT)
> > > > > > > > +				rc |=3D PB_FAN_FAN1_FAULT;
> > > > > > > > +		} else if (reg =3D=3D PMBUS_STATUS_TEMPERATURE) {
> > > > > > > > +			if (mfr & IBMPS_MFR_THERMAL_FAULT)
> > > > > > > > +				rc |=3D PB_TEMP_OT_FAULT;
> > > > > > > > +		} else if (reg =3D=3D PMBUS_STATUS_VOUT) {
> > > > > > > > +			if (mfr & (IBMPS_MFR_OV_FAULT | IBMPS_MFR_VAUX_FAULT))
> > > > > > > > +				rc |=3D PB_VOLTAGE_OV_FAULT;
> > > > > > > > +			if (mfr & IBMPS_MFR_UV_FAULT)
> > > > > > > > +				rc |=3D PB_VOLTAGE_UV_FAULT;
> > > > > > > > +		} else if (reg =3D=3D PMBUS_STATUS_IOUT) {
> > > > > > > > +			if (mfr & IBMPS_MFR_OC_FAULT)
> > > > > > > > +				rc |=3D PB_IOUT_OC_FAULT;
> > > > +			if (mfr & IBMPS_MFR_CURRENT_SHARE_WARNING)
> > >=20
> > > > > > +				rc |=3D PB_CURRENT_SHARE_FAULT;
> > > +		}
> >=20
> > I wonder why it was done this way and not simply via the spec'ed bits?
> > Maybe some don't fit, but it seems there's a pretty direct mapping for
> > the most part.
> >=20
> > Do the spec'ed status bits ever get set? As in, is there ever some
> > ambiguity about how the bits got set?
>=20
> Yes I believe some are set by the "normal" status bits, but I'm not sure=
=C2=A0
> the coverage is complete, so we definitely need to add the MFR register=
=C2=A0
> bits as well.

Okay, I'll have a look at the datasheet.

>=20
> >=20
> > > > > > > > +		break;
> > > > > > > > +	default:
> > > > > > > > +		if (reg >=3D PMBUS_VIRT_BASE)
> > > > +			return -ENXIO;
> > >=20
> > > +
> > > +		rc =3D pmbus_read_byte_data(client, page, reg);
> >=20
> > The alternative here is -ENODATA; not sure which is better though.
> >=20
> > > > > > +		break;
> > > > +	}
> > >=20
> > > +
> > > > +	return rc;
> > >=20
> > > +}
> > > +
> > > +static int ibmps_read_word_data(struct i2c_client *client, int page,=
 int reg)
> > > +{
> > > > +	int rc, mfr;
> > >=20
> > > +
> > > > > > > > +	switch (reg) {
> > > > > > > > +	case PMBUS_STATUS_BYTE:
> > > > > > > > +	case PMBUS_STATUS_WORD:
> > > > > > > > +		rc =3D pmbus_read_word_data(client, page, PMBUS_STATUS_W=
ORD);
> > > > > > > > +		if (rc < 0)
> > > > +			return rc;
> > >=20
> > > +
> > > > > > > > +		mfr =3D pmbus_read_byte_data(client, page,
> > > > > > > > +					=C2=A0=C2=A0=C2=A0PMBUS_STATUS_MFR_SPECIFIC);
> > > > > > > > +		if (mfr < 0)
> > > > +			return rc;
> > >=20
> > > +
> > > > > > > > +		if (mfr & IBMPS_MFR_PS_KILL)
> > > > +			rc |=3D PB_STATUS_OFF;
> > >=20
> > > +
> > > > +		if (mfr)
> > >=20
> > > +			rc |=3D PB_STATUS_WORD_MFR;
> >=20
> > This isn't set automatically by the device?
>=20
> I'll have to check on that.
>=20
> >=20
> > > > > > +		break;
> > > > > > > > +	default:
> > > > > > > > +		if (reg >=3D PMBUS_VIRT_BASE)
> > > > +			return -ENXIO;
> > >=20
> > > +
> > > > > > > > +		rc =3D pmbus_read_word_data(client, page, reg);
> > > > +		if (rc < 0)
> > >=20
> > > +			rc =3D ibmps_read_byte_data(client, page, reg);
> >=20
> > Is this really the way we should go about accesses?
>=20
> The power supply seems to mix up byte and word accesses. For example,=C2=
=A0
> the actual data regs are words, but the status_* are bytes (except=C2=A0
> status_word, obviously). This was basically the only way I could get=C2=
=A0
> everything working.

I don't understand - even if you read a word register with a byte-
accessor everything should still work (aside from not reading the
amount you're *meant* to).

So this still seems odd to me. Can you rephrase or expand on what
you've said?

>=20
> >=20
> > > > > > +		break;
> > > > +	}
> > >=20
> > > +
> > > > +	return rc;
> > >=20
> > > +}
> > > +
> > > +static struct pmbus_driver_info ibmps_info =3D {
> > > > > > > > +	.pages =3D 1,
> > > > > > > > +	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAV=
E_IOUT |
> > > > > > > > +		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
> > > > > > > > +		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_=
VOUT |
> > > > > > > > +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> > > > > > > > +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> > > > > > > > +	.read_byte_data =3D ibmps_read_byte_data,
> > > > +	.read_word_data =3D ibmps_read_word_data,
> > >=20
> > > +};
> > > +
> > > +static int ibmps_probe(struct i2c_client *client,
> > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct i2c_devic=
e_id *id)
> > >=20
> > > +{
> > > +	return pmbus_do_probe(client, id, &ibmps_info);
> >=20
> > Is there anything we need to check before probe, e.g.
> > MFR_ID/MFR_MODEL/MFR_REVISION? Are there options that might need to be
> > configured (and exposed via devicetree bindings)?
>=20
> Nothing in the spec that I see.

Okay.

>=20
> >=20
> > I note we support fans: Is FAN_CONFIG_1_2 configured as needed? Or do
> > we need to enable the fan, configure PWM vs RPM and the tach pulses
> > value? If it is pre-configured, is this register always going to be
> > pre-configured? Or do we need a property like my proposed 'use-stored-
> > presence' for the MAX31785?
>=20
> I believe they are all configured internally. FAN_CONFIG_1_2 is listed=C2=
=A0
> in the spec but doesn't state that anything needs to be setup.
>=20
> >=20
> > Have you had a look at my proposed bindings for the max31785? I think
> > it would be worth your input, as we have another case of fans here, and
> > it will help us shape a better picture of whether my generic properties
> > =C2=A0 and node structure are appropriate.
>=20
> Sure, I'll take a look.
>=20

Thanks.

> >=20
> > > +}
> > > +
> > > +static int ibmps_remove(struct i2c_client *client)
> > > +{
> > > > +	return pmbus_do_remove(client);
> > >=20
> > > +}
> > > +
> > > +enum chips { witherspoon };
> >=20
> > This doesn't look necessary.
>=20
> Agreed, it's somewhat of a pmbus convention, but maybe since there's=C2=
=A0
> just one I'll remove it.

Right, at least IMO it's better to add it when we come to needing it.

>=20
> >=20
> > > +
> > > +static const struct i2c_device_id ibmps_id[] =3D {
> > > > > > > > +	{ "witherspoon", witherspoon },
> > > > +	{ }
> > >=20
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, ibmps_id);
> > > +
> > > +static const struct of_device_id ibmps_of_match[] =3D {
> > > > > > > > +	{ .compatible =3D "ibm,ibmps" },
> > > > +	{}
> > >=20
> > > +};
> > > +MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
> >=20
> > p8_i2c_occ_of_match isn't right. Do we need both device tables?
> > "witherspoon" as a device ID also seems unusual. What's going on there?
>=20
> Uhh, not sure how that got in there... How does this compile?? I'll fix=
=C2=A0
> it. The power supply doesn't have any device id or anything, so I just=C2=
=A0
> went with witherspoon...

My issue is "withersoon" identifies a class of machine, not a power
supply, even if the powersupply is specific to Witherspoon.

>=20
> >=20
> > > +
> > > +static struct i2c_driver ibmps_driver =3D {
> > > > > > > > +	.driver =3D {
> > > > > > > > +		.name =3D "ibmps",
> > > > > > > > +		.of_match_table =3D ibmps_of_match,
> > > > > > > > +	},
> > > > > > > > +	.probe =3D ibmps_probe,
> > > > > > > > +	.remove =3D ibmps_remove,
> > > > +	.id_table =3D ibmps_id,
> > >=20
> > > +};
> > > +
> > > +module_i2c_driver(ibmps_driver);
> > > +
> > > +MODULE_AUTHOR("Eddie James");
> > > +MODULE_DESCRIPTION("PMBus driver for IBM power supply");
> >=20
> > So do we anticipate only ever having one power supply design? The name
> > feels a bit generic. In the device id table above you suggest it's
> > called 'witherspoon'. Is the design specific to Witherspoon? If so this
> > fact should be included in the driver name and description.
>=20
> I was told it is specific to witherspoon. I just hate to make it so=C2=A0
> specific when I'm pretty sure there will be future similar power=C2=A0
> supplies (in fact there was another compatible one that's buggy, present=
=C2=A0
> on some older witherspoons). But that will work.

Right, but if we can't really claim support power supplies that don't
yet exist. I think we should scope ourselves to what we currently have.

Cheers,

Andrew

>=20
> >=20
> > If there are other power supplies that are similar, then when we add
> > support we can rename the driver, and add any necessary module aliases,
> > and have a common device id table listing all of the supported devices.
> >=20
> > Cheers,
> >=20
> > Andrew
> >=20
> > > +MODULE_LICENSE("GPL");
>=20
>=20
--=-WMPGqSHcFaadkzhPPqOC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZh/2KAAoJEJ0dnzgO5LT5luEP/2Q1hb7xqLn/peCC4voYzUjG
GP1PtOp1Pgi8hKtrxTdLeUsaXtrxWJikji3eEmtqrsJ0bX/mE0UKsAih2hQzw2p+
JCVqpXRsGlo/nauXMv0mVtkDlIu/EFIpLVZCemRJehjHqVuPDoZRz1MZPO3QNC2v
WVZKUXexwyFPwe3cPj09H5iqZ7jco8UzT8CWphqmAMKmO4kqqZIUFkNt7owwR48Y
tYQ6v+VA/DHHrw3hXvb0okXj4wlbtWbV4UOxFWYzp+QcbRzQUyOR83aBE2msL0xi
8g6INxrBtSAEtKXHNWpCq371p9ESZebLGUHGwjxpo6TMHd020soQb4tYZovHKSlE
K7DOBHr1xTxyZLwJnzlS+v2oJC2SCYU4faEGKdJoK0txJPQ9jwfhktzBQ2rLzYys
cyIxdKVb5+EtLPxCesKR72OAurraKVnqwr1CVjvQ5vkgkEey0Js4SukRFzjEOnz1
gKDQpsraM0JEw+KT405Zk3qfKCo6BA+SwFhaqaJsbhjcXPf7AakPtfeb2y7fPB3r
0aQsJ+emmPyJTBoOVVp8PkbbEbk6vNU5Szf7z8B6Wxr8F5dlXh1RrWoubgiVorub
EATDCw2sBNLQnO5N1tal+TVlEr7a2RkXI55Gq+ACJQ2JRysQSHDoP6XnqJdeovVq
RhEWIiXV7gnsnAPC/xkk
=toql
-----END PGP SIGNATURE-----

--=-WMPGqSHcFaadkzhPPqOC--
