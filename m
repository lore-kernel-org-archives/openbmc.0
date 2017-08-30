Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhrwR3y9xzDqGG
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 13:44:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WoiYr87X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VLz8dvfi"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EAA1420F78;
 Tue, 29 Aug 2017 23:44:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 23:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=0aNRSaeQWB/s/YR5cAc6XFIvl1luu/v/PJM4oGQTu
 UI=; b=WoiYr87XJ4sX3kGaaCZyvwc5Y+A0XGVB216PGuTfrheLKhL+YmpbV9ZvK
 ohLlP0jqW85fHxlEw6o/GzsypYEzQu4Hn7G+cKVpXfm1nHkzAhXRoBli0hKQBpH6
 eby4IG4WDNJ0TPAjs8NXJhN2l08gLUhmqsOwvxS5uCBFCKXUIV83HK+3hDjbqFnm
 F6K4SaSKFbfgpNL66zFSBQ4Ds9UvLyWckaDzjWUwYu6csxyY2ii8bwpX2npP+XlQ
 z8fTTUV5bHP9KU2H1orgTqmLWaYf60wxCOZYLx4lrBVA3JcCpuycvrle79ebo+zK
 dkY4J2kseV3l9t0JuzKX24mGSTszQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=0aNRSaeQWB/s/YR5cA
 c6XFIvl1luu/v/PJM4oGQTuUI=; b=VLz8dvficFVdyBsdAMgCfNPVwTaAWQdHhL
 rWa+DsZcrxRDyaMHK4MEOGqK63RcJjNM5j0Lad1TddfoTvT09VI8ucGAE6tHZc7H
 mClM15mUGiXkb9AooAFs67uv6i5QhCgGTDzi4ecMr8eHeaE5KCPEkE2/1SfvhRq6
 gxVZNi87no6rhXsMCtl5zz9lLuEZP8MuMfhTObIUy8rw+GJd55O+HvwmkfDeszAc
 3Jbr2vDlh0u0PoPOKOfpgL7OneyqPDPLnOk+EHwX4mBuYwkXT1VhtoWO00yyZjHf
 4sKE24J7Ri8/r/9lYLDbz2YZiLpa7r2PeJIFVirfUD8WkSnfczvA==
X-ME-Sender: <xms:lDSmWa3LTmA8nNwJa1tth-IorZ4Wxe9EYaix-TImlEqGTKRBnkA4lQ>
X-Sasl-enc: 5yI+ydeNRNgu9Io5xFkUnZk7IFGifN7R0lqa2Hm75mj9 1504064660
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0321624311;
 Tue, 29 Aug 2017 23:44:18 -0400 (EDT)
Message-ID: <1504064653.5933.16.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Wed, 30 Aug 2017 13:14:13 +0930
In-Reply-To: <20170829200813.66010-2-cbostic@linux.vnet.ibm.com>
References: <20170829200813.66010-1-cbostic@linux.vnet.ibm.com>
 <20170829200813.66010-2-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-i37srN1KaP7rJ5Wo+6In"
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
X-List-Received-Date: Wed, 30 Aug 2017 03:44:24 -0000


--=-i37srN1KaP7rJ5Wo+6In
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Chris,

On Tue, 2017-08-29 at 15:08 -0500, Christopher Bostic wrote:
> Add a struct gpio_chip and define some methods so that this device's
> I/O can be accessed via /sys/class/gpio.
>=C2=A0
> Present requirements only call for retrieving current state of pin
> values and their direction.=C2=A0=C2=A0No requirement at this time to swi=
tch
> modes between output and input within the device driver.
>=C2=A0
> Add capability to clear logged faults via sysfs.
>=C2=A0
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v5 - Clean up remaining branch return statements to !! non
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0branching method.
> =C2=A0=C2=A0=C2=A0- Clean up white space issues.
> =C2=A0=C2=A0=C2=A0- Add return codes to error messages.
> =C2=A0=C2=A0=C2=A0- Add comments describing assumptions of ucd90160 type.
> =C2=A0=C2=A0=C2=A0- Define gpio direction set methods.
> =C2=A0=C2=A0=C2=A0- Add unique id for each ucd9000 in system for gpio chi=
p.
> v4 - Change status check from branch to a !! non branching method
> =C2=A0=C2=A0=C2=A0- Remove usage comments on libgpiod for the struct gpio=
_chip
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0methods.
> =C2=A0=C2=A0=C2=A0- Clean up some text formatting.
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
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 250 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 248 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 3e3aa95..cfd7703 100644
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
> @@ -34,8 +37,19 @@
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
> > +#define UCD9000_GPIO_CONFIG_OUT_VALUE	BIT(2)
> > +#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
> > +#define UCD9000_GPIO_INPUT		0
> > +#define UCD9000_GPIO_OUTPUT		1
> +
> > =C2=A0#define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> > =C2=A0#define UCD9000_MON_PAGE(x)	((x) & 0x0f)
> =C2=A0
> @@ -46,9 +60,13 @@
> =C2=A0
> > =C2=A0#define UCD9000_NUM_FAN		4
> =C2=A0
> > +#define UCD9000_GPIO_NAME_LEN	16
> > +#define UCD90160_NUM_GPIOS	26
> +
> =C2=A0struct ucd9000_data {
> > =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> > =C2=A0	struct pmbus_driver_info info;
> > +	struct gpio_chip gpio;
> =C2=A0};
> =C2=A0#define to_ucd9000_data(_info) container_of(_info, struct ucd9000_d=
ata, info)
> =C2=A0
> @@ -119,6 +137,197 @@ static int ucd9000_read_byte_data(struct i2c_client=
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
> > +		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
> > +			ret);
> +
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
> > +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> > +			offset, ret);
> +
> > +		return ret;
> > +	}
> +
> > +	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
> +}
> +
> +static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
> > +			int value)
> +{
> > +	struct i2c_client *client =3D gpiochip_get_data(gc);
> > +	int ret;
> +
> > +	ret =3D ucd9000_gpio_read_config(client, offset);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> > +			offset, ret);
> +
> > +		return;
> > +	}
> +
> > +	if (value) {
> > +		if (ret & UCD9000_GPIO_CONFIG_STATUS)
> > +			return;
> +
> > +		ret |=3D UCD9000_GPIO_CONFIG_STATUS;
> > +	} else {
> > +		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
> > +			return;
> +
> > +		ret &=3D ~UCD9000_GPIO_CONFIG_STATUS;
> > +	}
> +
> > +	ret |=3D UCD9000_GPIO_CONFIG_ENABLE;
> +
> > +	/* Page set not required */
> > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> > +			offset, ret);
> +
> > +		return;
> > +	}
> +
> > +	ret &=3D ~UCD9000_GPIO_CONFIG_ENABLE;
> +
> > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
> > +	if (ret < 0)
> > +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> > +			offset, ret);
> +}
> +
> +static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
> > +					unsigned int offset)
> +{
> > +	struct i2c_client *client =3D gpiochip_get_data(gc);
> > +	int ret;
> +
> > +	ret =3D ucd9000_gpio_read_config(client, offset);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> > +			offset, ret);
> +
> > +		return ret;
> > +	}
> +
> > +	return ~(!!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE));

Why are we doing bit-wise negation after boolean double negation? That look=
s
wrong. I would expect to only do the boolean double negation.

The documentation says a return value of 0 is out, 1 is in, and negative is=
 an
error. With the bit-wise negation this would give values of either -1 or -2=
,
both of which are errors.

	2 13:07:24 andrew@keelia:~$ cat /tmp/bits.c
	#include <stdio.h>

	int main(void) {
		printf("%d, %d\n", ~((int) 0), ~((int) 1));

		return 0;
	}
	2 13:07:29 andrew@keelia:~$ make /tmp/bits
	cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/tmp/bits.c=C2=A0=C2=A0=C2=A0-o /tmp/bits
	2 13:07:31 andrew@keelia:~$ /tmp/bits
	-1, -2
	2 13:07:36 andrew@keelia:~$

> +}
> +
> +static int ucd9000_gpio_set_direction(struct gpio_chip *gc, unsigned int=
 offset,
> > +					bool direction_out, int requested_out)
> +{
> > +	struct i2c_client *client =3D gpiochip_get_data(gc);
> > +	int ret, config, out_val;
> +
> +
> > +	ret =3D ucd9000_gpio_read_config(client, offset);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> > +			offset, ret);
> +
> > +		return ret;
> > +	}
> +
> > +	if (direction_out) {
> > +		out_val =3D requested_out ? UCD9000_GPIO_CONFIG_OUT_VALUE : 0;
> +
> > +		if (ret & UCD9000_GPIO_CONFIG_OUT_ENABLE) {
> > +			if ((ret & UCD9000_GPIO_CONFIG_OUT_VALUE) =3D=3D out_val)
> > +				return 0;
> > +		} else
> > +			ret |=3D UCD9000_GPIO_CONFIG_OUT_ENABLE;
> +
> > +		if (out_val)
> > +			ret |=3D UCD9000_GPIO_CONFIG_OUT_VALUE;
> > +		else
> > +			ret &=3D ~UCD9000_GPIO_CONFIG_OUT_VALUE;
> +
> > +	} else {
> > +		if (!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE))
> > +			return 0;
> +
> > +		ret &=3D ~UCD9000_GPIO_CONFIG_OUT_ENABLE;
> > +	}
> +
> > +	ret |=3D UCD9000_GPIO_CONFIG_ENABLE;
> > +	config =3D ret;
> +
> > +	/* Page set not required */
> > +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config=
);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> > +			offset, ret);
> +
> > +		return ret;
> > +	}
> +
> > +	config &=3D ~UCD9000_GPIO_CONFIG_ENABLE;
> +
> > +	return i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config)=
;
> +}

Thanks for implementing the direction switch. With the early exits it is a =
bit
more involved than I was anticipating, but certainly we want to avoid the
double-write if we can.

> +
> +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
> > +					unsigned int offset)
> +{
> > +	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_INPUT, 0);
> +}
> +
> +static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
> > +					unsigned int offset, int val)
> +{
> > +	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT, va=
l);
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
> > +		dev_err(&client->dev, "Failed to clear logged faults: %d\n",
> > +			ret);
> +
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

We discussed splitting ucd9000_clear_logged_faults() and associated bits ou=
t
into a separate patch so it could be sent upstream for review. Can you talk
about why it's still included?

> +
> =C2=A0static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0			=C2=A0const struct i2c_device_id *id)
> =C2=A0{
> @@ -227,7 +436,44 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		=C2=A0=C2=A0| PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
> > =C2=A0	}
> =C2=A0
> > -	return pmbus_do_probe(client, mid, info);
> > +	data->gpio.label =3D (const char *)&client->name;
> > +	data->gpio.get_direction =3D ucd9000_gpio_get_direction;
> > +	data->gpio.direction_input =3D ucd9000_gpio_direction_input;
> > +	data->gpio.direction_output =3D ucd9000_gpio_direction_output;
> > +	data->gpio.get =3D ucd9000_gpio_get;
> > +	data->gpio.set =3D ucd9000_gpio_set;
> > +	data->gpio.can_sleep =3D 1;
> > +	data->gpio.base =3D -1;
> +
> > +	/*
> > +	=C2=A0* TODO: set ngpio for ucd9000 devs that aren't 90160 type
> > +	=C2=A0*/
> > +	if (mid->driver_data =3D=3D ucd90160)
> > +		data->gpio.ngpio =3D UCD90160_NUM_GPIOS;
> > +	data->gpio.parent =3D &client->dev;
> > +	data->gpio.owner =3D THIS_MODULE;
> +
> > +	ret =3D devm_gpiochip_add_data(&client->dev, &data->gpio, client);
> > +	if (ret) {
> > +		data->gpio.parent =3D NULL;
> > +		dev_warn(&client->dev, "Could not add gpiochip: %d\n", ret);
> > +		return ret;
> > +	}
> +
> > +	ret =3D sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
> > +	if (ret < 0) {
> > +		dev_warn(&client->dev, "Failed to add sysfs files: %d\n", ret);
> +
> > +		return ret;
> > +	}
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
> @@ -236,7 +482,7 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		.name =3D "ucd9000",
> > =C2=A0	},
> > =C2=A0	.probe =3D ucd9000_probe,
> > -	.remove =3D pmbus_do_remove,
> > +	.remove =3D ucd9000_remove,
> > =C2=A0	.id_table =3D ucd9000_id,
> =C2=A0};
> =C2=A0

There's no comment about pinmux, which is another one of the assumptions we=
're
making with this patch. In general I was trying to make the point that we
should document anything we're assuming. The mux state is another such thin=
g.

Cheers,

Andrew
--=-i37srN1KaP7rJ5Wo+6In
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpjSNAAoJEJ0dnzgO5LT5OigQAIdmwukUJB73pKrdrfZA8eE1
PIPwjHVLGYp2YviqrJ89kYRyXffzWeuJb64V/FY47lxOK83boks17/HQYyhMMGSL
wJGD9AC0O0Ba2ggntzHHpRyS+WU5Nm9vpsGmZyQ5992SE/fFItPzSFLbRjM+OaVs
gOC+p+8YB8+zQZln8MLzg2KEYfpaMbsw2ZT0iPM1eiV1E/SDdp7SqEiI6DBhIjMI
i/W8SXZ2K+aN/YHdaLaZ2ThaXYGEUb5J6mbI4b3WfiNlFlVd1AEhclsJX0taAzj9
CaFNIoivHwWEpWHEnUzKQN1cNuVTwD9ZSgGg8lDaOiDV5pewr4AkZNMxkKuLKgi4
3ccNTRpUOkpFcqn7fmpPOHscg1wkXVdPY6BO46V2cjWpkl0QRLK2z/+lBoP2INPa
OPdo6APNir3yAYbuNfCbSTyeXkX1P4/4nkrFRVOVSqpUV9eP3SPMCCl0+91u968c
HVc7RiRKwR9MWXSp1HoJj/ieWe55aXKB4+DeaADqdhP1hPJCopoTHmT0TDjN28Ig
BHbVy6YOq+UFM0NR7wIqXRjZjfzEHEYKYaaG5xu6kgPuR0MAPq8p0NMYLvJ9DbNx
irQ50sWKG5t0+rQbQUDrqFLGzOcQCfUFkncLiSBOI8a8RNowalCi/CGe2lelc8LQ
omPMFUb5Jdsk9VyIR0YB
=wa04
-----END PGP SIGNATURE-----

--=-i37srN1KaP7rJ5Wo+6In--
