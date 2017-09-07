Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="izN+9/1s"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XA4KGqDb"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnhHr2mQ8zDrVy
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 10:32:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B86AD21A7F;
 Wed,  6 Sep 2017 20:32:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 06 Sep 2017 20:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=kXaDQszdhqE+3WrADbF4rvt7lt1J+ofocF3JLkVRW
 0U=; b=izN+9/1sgtQXKXNS9i7NURKfBIoU17a+u5oOzdwEX5AauNSz/qFvue2Xz
 Lc3N1J6ueQgp/CErBtQnXGUsPn8vPko4OwCgwJUBJtW1xWRvc3iOhKFtTUYozt8T
 YuO6+ctyJMPWPI5R3HSLdtJoCmZ/O70z3gCEAejpzWuJV/AlydZWi1my9AdBu8As
 CAj+4YIICs0vFUSvovYMp0+3RJyT5v2SH6p/OZxE5pxd12mk63ipYwAPX6Wpme+I
 sDApg1+2Fa5HXminY2Nv4NmvaYKPDbUHm79kAqyWb0n6zwxFMmfcOpLw8tNlZxep
 p87dXO8pGZFyfBzngQxjj6cYkInGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=kXaDQszdhqE+3WrADb
 F4rvt7lt1J+ofocF3JLkVRW0U=; b=XA4KGqDbW0WJSQTq8yF+QwRKuQcy8GWJIL
 zlcrfL3I1Uf8cU0PufGapp/NfaKij0t3tZgPjhHHz1eowoIB9Z7aiTDl5xSZM9S8
 nFRIYxxV6hjsxBawsNIKNA2HNOA+6Ygz5GKTyR00JjGLMqmDmfhL9Ovy7SvROlgM
 KrgX9l/MseYwead22CAwnKPK/7XG+JF74bX4gJX393KgMhfD/8oxDXf/jy03zI3T
 s1ndPVYCfoAvyzvxZgXi6P4HNh+NB+1fuss+QNykNfM3WzqzBo+BiSt5IKSBDl/m
 4lTAuX9U0NWbUIDz4sy8Y/VASLPXFFQpemhovG/0iwzhDzO1VVnA==
X-ME-Sender: <xms:sJOwWRLgA5UPsSLIvzr5l1TnvfX6HcCrDWhav-hsiRAzTC0lsnGdPQ>
X-Sasl-enc: /ZFMKq/cxft8JBrHsff1QE8SA1/ugzC3WAu6MGk5X5YR 1504744367
Received: from keelia (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id E801C240A4;
 Wed,  6 Sep 2017 20:32:46 -0400 (EDT)
Message-ID: <1504744069.5042.6.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v7 1/2] hwmon: (ucd9000) Add gpio chip
 interface
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
In-Reply-To: <20170906210041.22533-2-cbostic@linux.vnet.ibm.com>
References: <20170906210041.22533-1-cbostic@linux.vnet.ibm.com>
 <20170906210041.22533-2-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-O2JYco2d97AXNkh6ISXh"
Date: Thu, 07 Sep 2017 10:27:50 +1000
Mime-Version: 1.0
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Thu, 07 Sep 2017 00:32:59 -0000


--=-O2JYco2d97AXNkh6ISXh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-06 at 16:00 -0500, Christopher Bostic wrote:
> Add a struct gpio_chip and define some methods so that this device's
> I/O can be accessed via /sys/class/gpio.
>=C2=A0
> Present requirements only call for retrieving current state of pin
> values and their direction.=C2=A0=C2=A0No requirement at this time to swi=
tch
> modes between output and input within the device driver.
>=C2=A0
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v7 - Reorder this patch from #2 in series to #1
> v6 - Break out sysfs clear logged faults into separate patch
> =C2=A0=C2=A0=C2=A0- Fix logic bug that was bitwise inverting instead of !
> =C2=A0=C2=A0=C2=A0- Add further comments about assumptions related to pin=
 mux.
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
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 206 +++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 206 insertions(+)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 3e3aa95..9a82e88 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -26,6 +26,7 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/i2c/pmbus.h>
> +#include <linux/gpio.h>
> =C2=A0#include "pmbus.h"
> =C2=A0
> =C2=A0enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd909=
10 };
> @@ -34,8 +35,18 @@
> =C2=A0#define UCD9000_NUM_PAGES		0xd6
> =C2=A0#define UCD9000_FAN_CONFIG_INDEX	0xe7
> =C2=A0#define UCD9000_FAN_CONFIG		0xe8
> +#define UCD9000_GPIO_SELECT		0xfa
> +#define UCD9000_GPIO_CONFIG		0xfb
> =C2=A0#define UCD9000_DEVICE_ID		0xfd
> =C2=A0
> +/* GPIO CONFIG bits */
> +#define UCD9000_GPIO_CONFIG_ENABLE	BIT(0)
> +#define UCD9000_GPIO_CONFIG_OUT_ENABLE	BIT(1)
> +#define UCD9000_GPIO_CONFIG_OUT_VALUE	BIT(2)
> +#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
> +#define UCD9000_GPIO_INPUT		0
> +#define UCD9000_GPIO_OUTPUT		1
> +
> =C2=A0#define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> =C2=A0#define UCD9000_MON_PAGE(x)	((x) & 0x0f)
> =C2=A0
> @@ -46,9 +57,13 @@
> =C2=A0
> =C2=A0#define UCD9000_NUM_FAN		4
> =C2=A0
> +#define UCD9000_GPIO_NAME_LEN	16
> +#define UCD90160_NUM_GPIOS	26
> +
> =C2=A0struct ucd9000_data {
> =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> =C2=A0	struct pmbus_driver_info info;
> +	struct gpio_chip gpio;
> =C2=A0};
> =C2=A0#define to_ucd9000_data(_info) container_of(_info, struct ucd9000_d=
ata, info)
> =C2=A0
> @@ -119,6 +134,166 @@ static int ucd9000_read_byte_data(struct i2c_client=
 *client, int page, int reg)
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(i2c, ucd9000_id);
> =C2=A0
> +static int ucd9000_gpio_read_config(struct i2c_client *client,
> +				unsigned int offset)
> +{
> +	int ret;
> +
> +	/* No page set required */
> +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
> +			ret);
> +
> +		return ret;
> +	}
> +
> +	return i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
> +}
> +
> +static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct i2c_client *client=C2=A0=C2=A0=3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret =3D ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
> +}
> +
> +static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			int value)
> +{
> +	struct i2c_client *client =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret =3D ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return;
> +	}
> +
> +	if (value) {
> +		if (ret & UCD9000_GPIO_CONFIG_STATUS)
> +			return;
> +
> +		ret |=3D UCD9000_GPIO_CONFIG_STATUS;
> +	} else {
> +		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
> +			return;
> +
> +		ret &=3D ~UCD9000_GPIO_CONFIG_STATUS;
> +	}
> +
> +	ret |=3D UCD9000_GPIO_CONFIG_ENABLE;
> +
> +	/* Page set not required */
> +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return;
> +	}
> +
> +	ret &=3D ~UCD9000_GPIO_CONFIG_ENABLE;
> +
> +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
> +	if (ret < 0)
> +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> +			offset, ret);
> +}
> +
> +static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
> +					unsigned int offset)
> +{
> +	struct i2c_client *client =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret =3D ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	return !(!!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE));

Why are we triple negating? One is enough. This will work, but it's unneces=
sary
and excessive.

> +}
> +
> +static int ucd9000_gpio_set_direction(struct gpio_chip *gc, unsigned int=
 offset,
> +					bool direction_out, int requested_out)
> +{
> +	struct i2c_client *client =3D gpiochip_get_data(gc);
> +	int ret, config, out_val;
> +
> +
> +	ret =3D ucd9000_gpio_read_config(client, offset);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	if (direction_out) {
> +		out_val =3D requested_out ? UCD9000_GPIO_CONFIG_OUT_VALUE : 0;
> +
> +		if (ret & UCD9000_GPIO_CONFIG_OUT_ENABLE) {
> +			if ((ret & UCD9000_GPIO_CONFIG_OUT_VALUE) =3D=3D out_val)
> +				return 0;
> +		} else
> +			ret |=3D UCD9000_GPIO_CONFIG_OUT_ENABLE;
> +
> +		if (out_val)
> +			ret |=3D UCD9000_GPIO_CONFIG_OUT_VALUE;
> +		else
> +			ret &=3D ~UCD9000_GPIO_CONFIG_OUT_VALUE;
> +
> +	} else {
> +		if (!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE))
> +			return 0;
> +
> +		ret &=3D ~UCD9000_GPIO_CONFIG_OUT_ENABLE;
> +	}
> +
> +	ret |=3D UCD9000_GPIO_CONFIG_ENABLE;
> +	config =3D ret;
> +
> +	/* Page set not required */
> +	ret =3D i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
> +			offset, ret);
> +
> +		return ret;
> +	}
> +
> +	config &=3D ~UCD9000_GPIO_CONFIG_ENABLE;
> +
> +	return i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config);
> +}
> +
> +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
> +					unsigned int offset)
> +{
> +	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_INPUT, 0);
> +}
> +
> +static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int offset, int val)
> +{
> +	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT, val)=
;
> +}
> +
> =C2=A0static int ucd9000_probe(struct i2c_client *client,
> =C2=A0			=C2=A0const struct i2c_device_id *id)
> =C2=A0{
> @@ -227,6 +402,37 @@ static int ucd9000_probe(struct i2c_client *client,
> =C2=A0		=C2=A0=C2=A0| PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
> =C2=A0	}
> =C2=A0
> +	/*
> +	=C2=A0* Note:
> +	=C2=A0*
> +	=C2=A0* Pinmux support has not been added to the new gpio_chip.
> +	=C2=A0* This support should be added when possible given the mux
> +	=C2=A0* behavior of these IO devices.
> +	=C2=A0*/
> +	data->gpio.label =3D (const char *)&client->name;
> +	data->gpio.get_direction =3D ucd9000_gpio_get_direction;
> +	data->gpio.direction_input =3D ucd9000_gpio_direction_input;
> +	data->gpio.direction_output =3D ucd9000_gpio_direction_output;
> +	data->gpio.get =3D ucd9000_gpio_get;
> +	data->gpio.set =3D ucd9000_gpio_set;
> +	data->gpio.can_sleep =3D 1;
> +	data->gpio.base =3D -1;
> +
> +	/*
> +	=C2=A0* TODO: set ngpio for ucd9000 devs that aren't 90160 type
> +	=C2=A0*/
> +	if (mid->driver_data =3D=3D ucd90160)
> +		data->gpio.ngpio =3D UCD90160_NUM_GPIOS;
> +	data->gpio.parent =3D &client->dev;
> +	data->gpio.owner =3D THIS_MODULE;
> +
> +	ret =3D devm_gpiochip_add_data(&client->dev, &data->gpio, client);
> +	if (ret) {
> +		data->gpio.parent =3D NULL;
> +		dev_warn(&client->dev, "Could not add gpiochip: %d\n", ret);
> +		return ret;
> +	}
> +
> =C2=A0	return pmbus_do_probe(client, mid, info);
> =C2=A0}
> =C2=A0

In the interest of expediting this:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
--=-O2JYco2d97AXNkh6ISXh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsJKFAAoJEJ0dnzgO5LT5RygP/RbOx/o9aDoyEPyEbKX+cWpI
09U6olcqnQIYThIggQLdoMUhpjaXGQe4yJUyPghRQ9aDq5g83yVWtNZT78Wn7PpB
VsGk7hKPmWMOpWZ/OOZsMELyLXHXmjbth+5TQm3Bb7Y8bDjtH8qOu3aLGIWLIQ51
6Em8jfkz5sMUdrDR53mMamlSr55BPbGr2u68Na7d3VXzcsZtxtQ3RbF4b2zRxRQI
FMzQISwcazfkplETu0zodFTpbZSbbrlEndCkGZPowq0hhbQE+t4u+p88G7HmfLcT
xeGapkk7rWEtRV2/qNNcm/5jY8nG+UNZ3hOv2eUT878dgYfXaR/Z6bzG3pPPtySS
wOruAu1q97uPC20av5KgAW7R5A5/ZORZqFnaNldtAQMZVvWGT4q5rV8ymVrjIac3
mqBX7LhLLuAX6IsswNUQNf4+Cy1kgvfw/JoD/A0voihjt/s5V5I5o3CxjoE/WHO2
7nXQ9D6DBnvVAxSp+SyI1Jmw/Nv1BG1qxTwb/pKu7+928uDa3r6q9dJbNJJQjEpF
g/FBD9TG08ZoZ3LyCAOuXLIC0nbarNlBW+GaNmV0mFeeAfj9mrpyJOMtxC2lvI4S
UP2E5yITd3Dykk8Mg1vKp1zxmam/7yG5mWi2K15tTIIQ+E7AZeaUmAp3JXdTj7/O
lWw5UyYXWOfAwFkBNlhW
=hEP0
-----END PGP SIGNATURE-----

--=-O2JYco2d97AXNkh6ISXh--
