Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYX8L1LpSzDrCR
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 15:44:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ya0pjS2i"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qT10Dilq"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E59CF20BC4;
 Fri, 18 Aug 2017 01:44:15 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 18 Aug 2017 01:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=66qnuwlJTd3RFPLGRvJn9tM+81C+4orbS5yMGRcO/
 lA=; b=Ya0pjS2i0NWx4zu9QtX9YPdwYWKgWIYRU/vyu7Lk7MsuU/cGBtriX9c7X
 4Xz4fRbPIe83D/zRk+QtpvIZiL7lSJ3+HrnLHzDW2wnOhnI2bobTmrwEmGGbGpwK
 hmwkpI+5SjosKF3FnQmFNIIK3ssgL2rwe0Dh4XMMk7uFgRSTNsN0HLufzPfZrRos
 +b/IgJD4ePlsenDnZcSU013w0R6cQkTwix7Y66bpov53H7DMyOXqihMxgc8g8qwL
 mO+Miq9Q4yWn8Imc1Z0oAKyDT9DkJwf02XY3g2A/TDtKXzeaHWQJV7BF3MQ5tYvS
 S7oV9sbOw8xQ6zYGHtraNwnYsMTVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=66qnuwlJTd3RFPLGRv
 Jn9tM+81C+4orbS5yMGRcO/lA=; b=qT10Dilqj7DWKbDlu4E0lr9zZaMpR3sZyZ
 WUkYUS5fM8JhAOdFT/l5bGl/rR8J/PKuWoTbz15ePOfG2hD2DtX3yn8YZuMzRKxl
 qiKGwdNZiQja5PbulejEhyapiN6S7qT+bb2TibT+3RZIgkL74r+PtNf1vJcyz1Fy
 +LW90YC8Vu+XTE4j97utw7oLAYTOTrolUwp0xBZrJqRHhBO0AKv5QU0c8PMpPUPl
 ZyWwgUrdoXWx9fO3lQYhD62cOseZjq0MZy97/50NbBBQ0sWfAkqfDqYMZZsTgkNZ
 /a2aKppMzhNUdRg8NKz7zciKjGzFg+2S7vNSqqlIoDjTxMk4w+nQ==
X-ME-Sender: <xms:r36WWRXMIok7XN99CUXMEV_AI53g5r0jO_a_E3XxL1YnnpD5U5JUPA>
X-Sasl-enc: /FBQQYOrjb5A82C+kiKh/GQyaBFwrpJw9sglEeWx0wDJ 1503035055
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 36A20240A4;
 Fri, 18 Aug 2017 01:44:13 -0400 (EDT)
Message-ID: <1503035048.681.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Fri, 18 Aug 2017 15:14:08 +0930
In-Reply-To: <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
 <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-akadzZdooPY3Rbmp+aYk"
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
X-List-Received-Date: Fri, 18 Aug 2017 05:44:20 -0000


--=-akadzZdooPY3Rbmp+aYk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Thu, 2017-08-17 at 20:35 -0500, Christopher Bostic wrote:
> Add a struct gpio_chip and define some methods so that this device's
> I/O can be accessed via /sys/class/gpio.
>=C2=A0
> Add capability to clear logged faults via sysfs.
>=C2=A0
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v3 - Correct bug in gpio_chip get method.=C2=A0=C2=A0Wasn't retrieving
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpio config information correctly.
> =C2=A0=C2=A0=C2=A0- Remove old debugfs flag from previous pmbus core chan=
ges.
> =C2=A0=C2=A0=C2=A0- Remove all sysfs files for mfr_status command.
> =C2=A0=C2=A0=C2=A0- Add comments on direct i2c_smbus calls to clarify tha=
t no page
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set is required.
> v2 - Remove clear_faults file - redundant since all other sysfs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0core accesses result in an automatic clear =
fault.
> =C2=A0=C2=A0=C2=A0- Removed local status_word and status_vout register du=
mps and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0use the new pmbus core status facilities in=
stead.
> =C2=A0=C2=A0=C2=A0- Rename gpi<x>_fault to gpi<x>_alarm to better match c=
ore naming
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0conventions.
> =C2=A0=C2=A0=C2=A0- Add full register dump for mfr_status.
> =C2=A0=C2=A0=C2=A0- Add gpio chip to device structure and use gpio interf=
aces.
> ---
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 136 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 134 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 3e3aa95..af44c1e 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -26,6 +26,9 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/i2c/pmbus.h>
> +#include <linux/sysfs.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/gpio.h>
> =C2=A0#include "pmbus.h"
> =C2=A0
> =C2=A0enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd909=
10 };
> @@ -34,8 +37,16 @@
> > =C2=A0#define UCD9000_NUM_PAGES		0xd6
> > =C2=A0#define UCD9000_FAN_CONFIG_INDEX	0xe7
> > =C2=A0#define UCD9000_FAN_CONFIG		0xe8
> > +#define UCD9000_LOGGED_FAULTS		0xea
> > +#define UCD9000_GPIO_SELECT		0xfa
> > +#define UCD9000_GPIO_CONFIG		0xfb
> > =C2=A0#define UCD9000_DEVICE_ID		0xfd
> =C2=A0
> +/* GPIO CONFIG bits */
> > +#define UCD9000_GPIO_CONFIG_ENABLE	BIT(0)
> > +#define UCD9000_GPIO_CONFIG_OUT_ENABLE	BIT(1)
> > +#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
> +
> > =C2=A0#define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> > =C2=A0#define UCD9000_MON_PAGE(x)	((x) & 0x0f)
> =C2=A0
> @@ -46,9 +57,12 @@
> =C2=A0
> > =C2=A0#define UCD9000_NUM_FAN		4
> =C2=A0
> > +#define UCD90160_NUM_GPIOS	26

This is mostly true, though there are only 22 physical GPIOs, plus 4 GPIs.
We're additionally constrained on the UCD90160 by "Table 3. GPIO Pin
Configuration Options" in "16-Rail Power Supply Sequencer and Monitor with =
ACPI
Support datasheet (Rev. C)" (ucd90160.pdf, page 22) to 8/26 as GPIs and 16/=
22
as GPOs. It would probably pay to think about how these constraints would
impact the implementation.

> +
> =C2=A0struct ucd9000_data {
> > =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> > =C2=A0	struct pmbus_driver_info info;
> > +	struct gpio_chip gpio;
> =C2=A0};
> =C2=A0#define to_ucd9000_data(_info) container_of(_info, struct ucd9000_d=
ata, info)
> =C2=A0
> @@ -119,6 +133,92 @@ static int ucd9000_read_byte_data(struct i2c_client =
*client, int page, int reg)
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(i2c, ucd9000_id);
> =C2=A0
> +static int ucd9000_gpio_read_config(struct i2c_client *client,
> > +				unsigned int offset)
> +{
> > +	int ret;
> +
> > +	/* No page set required */
> > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, offset=
);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,

Why is there a linebreak here?

> > +			"Failed to read pin ID %d\n", offset);

The error message is confusing - it relates to the semantics of
ucd9000_gpio_read_config() and not the operation on which the error occurre=
d.

I feel strongly that we should also report the error code as well: It provi=
des
additional context on what went wrong.

As a consequence I would suggest something like:

		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
			ret);

> > +		return ret;
> > +	}
> +
> > +	return i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
> +}
> +
> +static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> > +	struct i2c_client *client=C2=A0=C2=A0=3D gpiochip_get_data(gc);
> > +	int ret;
> +
> > +	ret =3D ucd9000_gpio_read_config(client, offset);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"failed to read GPIO config\n");

Again, we don't need a linebreak above, but we probably should have one bet=
ween
the dev_err() and the return statement.

> > +		return ret;
> > +	}
> +
> > +	return ret & UCD9000_GPIO_CONFIG_STATUS ? 1 : 0;

We can avoid the branch with:

	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);

Interestingly it's not clear from the datasheet whether the status bit cont=
ains
a relevant value when the pin is in output mode, as there's a separate bit =
(bit
2) to set the value. Have you tested the behaviour?

> +}
> +
> +static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
> > +					unsigned int offset)
> +{
> > +	struct i2c_client *client=C2=A0=C2=A0=3D gpiochip_get_data(gc);
> > +	int ret;
> +
> > +	ret =3D ucd9000_gpio_read_config(client, offset);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"failed to read GPIO config\n");
> > +		return ret;
> > +	}
> +
> > +	return ret & UCD9000_GPIO_CONFIG_OUT_ENABLE ? 0 : 1;
> +}
> +
> +/*
> + * Defined so that libgpiod tool can access pin states.=C2=A0=C2=A0No pl=
an to actually
> + * change pin direction within this driver.

That's not true - the driver is general purpose. Lets not limit it too much=
 to
*how you intend to use it* vs the actual hardware capability.

> + */
> +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
> > +					unsigned int offset)
> +{
> > +	return 0;

I don't think we should do this for several reasons:

1) It's not that hard to implement the functionality
2) It's not true that all GPIOs are inputs with factory defaults
3) There will be uncertainty if custom defaults are programmed

Again from ucd90160.pdf, on page 34:

	7.5 Programming
	7.5.1 Device Configuration and Programming
	From the factory, the device contains the sequencing and monitoring
	firmware. It is also configured so that all GPOs are high-impedance
	(except for FPWM/GPIO pins 17-24, which are driven low), with no
	sequencing or fault-response operation. See Configuration Programming
	of UCD Devices, available from the Documentation & Help Center that can
	be selected from the Fusion GUI Help menu, for full UCD90160
	configuration details.

The FPWM pins are driven low, implying they are configured for output mode.
It's not obvious to me from this whether the other GPIOs are input or outpu=
t
out-of-the-box as the chip supports active and open-drain drive types. It d=
oes
say "GPOs" in the paragraph above, but I haven't found documentation on whi=
ch
pins are in what state from factory, and I don't know how we're configuring=
 it
for production.

Regardless, the driver shouldn't make assumptions about how the device is
pre-programmed - without further information there's already ambiguity as t=
o
whether the default settings are in play or whether the system integrator h=
as
configured the chip. We need information from the platform about how the de=
vice
is/should be managed.

Further, the note in section 10.43 (FBh) GPIO_CONFIG (MFR_SPECIFIC_43) says=
:

	Configuring a pin that is also being used by another function (enable,
	fan control, and so forth) may likely result in unexpected and unwanted
	behavior.

This suggests my favourite topic: pinctrl.

Twenty-two of the pins on the UCD90160 are GPIO-capable. Of these 22 pins, =
16
of them have alternate functions. See "Table 3. GPIO Pin Configuration Opti=
ons"
on page 22 of ucd90160.pdf. But a quick rundown:

1. 4 PWM pins (GPIOs 1-4, pins 31, 32, 42, 41)
2. 8 FPWM (Fast PWM) pins (GPIOs 5-12, pins 17-24)
3. 4 pins shared with JTAG (GPIOs 19-22, pins 36-39)

Now, in terms of devicetree we'd be breaking things in the future by specif=
ying
a GPIO controller that relies on a pinmux in hardware without also specifyi=
ng
the pin controller in the devicetree. This necessitates at least *some* pin=
ctrl
capability be baked into the driver as well, so we can point the gpiochip t=
o
the relevant pin controller (the same device, but the bindings are general)=
 and
map the pin spaces in the devicetree (the gpio and pin spaces are different=
).

> +}
> +
> +static ssize_t ucd9000_clear_logged_faults(struct device *dev,
> > +				struct device_attribute *attr, const char *buf,
> > +				size_t count)
> +{
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	int ret;
> +
> > +	/* No page set required */
> > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
> > +	if (ret) {
> > +		dev_err(&client->dev, "Failed to clear logged faults\n");
> > +		return ret;
> > +	}
> +
> > +	return count;
> +}
> +
> +static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
> > +		ucd9000_clear_logged_faults);
> +
> +static struct attribute *ucd9000_attributes[] =3D {
> > +	&dev_attr_clear_logged_faults.attr,
> > +	NULL
> +};
> +
> +static const struct attribute_group ucd9000_attr_group =3D {
> > +	.attrs =3D ucd9000_attributes,
> +};
> +

Joel's made a fair comment here regarding upstream. Please address that.

> =C2=A0static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0			=C2=A0const struct i2c_device_id *id)
> =C2=A0{
> @@ -227,7 +327,39 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		=C2=A0=C2=A0| PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
> > =C2=A0	}
> =C2=A0
> > -	return pmbus_do_probe(client, mid, info);
> > +	data->gpio.label =3D "gpio-ucd9000";
> > +	data->gpio.get_direction =3D ucd9000_gpio_get_direction;
> > +	data->gpio.direction_input =3D ucd9000_gpio_direction_input;
> > +	data->gpio.get =3D ucd9000_gpio_get;

I feel like it wouldn't be much effort to make this more complete and speci=
fy
the direction_output() and set() callbacks as well.

> > +	data->gpio.can_sleep =3D 1;
> > +	data->gpio.base =3D -1;
> > +	if (mid->driver_data =3D=3D ucd90160)
> > +		data->gpio.ngpio =3D UCD90160_NUM_GPIOS;

This might need some rework in the future as the other ucd9000 variants wan=
t
GPIO support.

In fact, what's the behaviour of the other drivers now given we're
unconditionally registering a gpiochip?

> > +	data->gpio.parent =3D &client->dev;
> > +	data->gpio.owner =3D THIS_MODULE;

At some point we should think about pinconf as well (push-pull vs open-drai=
n).

> +
> > +	ret =3D devm_gpiochip_add_data(&client->dev, &data->gpio, client);
> > +	if (ret) {
> > +		data->gpio.parent =3D NULL;
> > +		dev_warn(&client->dev, "Count not add gpiochip\n");
> > +		return ret;
> > +	}
> +
> > +	dev_info(&client->dev, "gpios %i...%i\n", data->gpio.base,
> > +		data->gpio.base + data->gpio.ngpio - 1);

Let's drop this.

Cheers,

Andrew

> +
> > +	ret =3D sysfs_create_group(&client->dev.kobj,
> > +				&ucd9000_attr_group);
> > +	if (ret < 0)
> > +		return ret;
> +
> > +	return=C2=A0=C2=A0pmbus_do_probe(client, mid, info);
> +}
> +
> +static int ucd9000_remove(struct i2c_client *client)
> +{
> > +	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
> > +	return pmbus_do_remove(client);
> =C2=A0}
> =C2=A0
> =C2=A0/* This is the driver that will be inserted */
> @@ -236,7 +368,7 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		.name =3D "ucd9000",
> > =C2=A0	},
> > =C2=A0	.probe =3D ucd9000_probe,
> > -	.remove =3D pmbus_do_remove,
> > +	.remove =3D ucd9000_remove,
> > =C2=A0	.id_table =3D ucd9000_id,
> =C2=A0};
> =C2=A0
--=-akadzZdooPY3Rbmp+aYk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZln6oAAoJEJ0dnzgO5LT5VkIP/0rl6yZi6Bc7+ACfIfgW2XcV
7CpTaqIMizCsFRQkAQzugnoQKR3btGcpPyukvghdfsRjeIn2f1NUSAPPAKtGlsJ+
cp3JTqE8tzz0R1Y6a0i+IK2+wSNhWgI+LV2FAOuBVyiXbfyeds23GsBV8bI/yz0L
RJPkRSpjeaPPGJrv/noXx8ajLxN2VduVndXgbjOcG2S71A/BZ0L9Hd/fZuhNG89u
lSiz7pNkTnL+MaBoMtqhkoObGH/s/7pgaDM/EbgEX7Eam6Q0dLLvEUYiX1tNqHZ2
WB7Q35qw2HWbgpOq3mkCRrheI/AjTN5n7gTspX6fBvkWRxTf7Dm8MvrTgke6bKk3
e7ow1BB2m5eM7jTkiQB7M5bjUunPCZamV5OHBBax6KLUK6q0KOwGJr9gQpPfBX05
K3rzHzE1yNORnW+EFH7Uu8xBpmHz6sUWHTyo72ajOdUQeN0krK3uUKIzZZFX2IwK
81h4Qn71VDGQlHsxooqn22Y/hekrxxMgzlJrv6l/+WN/5QAHc4Sr3tiTUXw3pfFa
RyY2HnMuDVVEH2nTliM3mqC0LenYcXe1XnPi/aLEqcbF0o3c9wRDobRDHdMGbOcL
VoBeISI8RAxr7IpRzx6nsTu1TpyH4vbI4QaBucpQTvbyKzPk2PMwOGB8htvW+dkZ
Sn4sGU74S3fhm1oN+1XM
=5Neo
-----END PGP SIGNATURE-----

--=-akadzZdooPY3Rbmp+aYk--
