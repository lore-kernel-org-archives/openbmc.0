Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbv0w3WdszDqfx
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 12:01:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hRMlzfht"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iKWr2wTG"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 23E1320C56;
 Mon, 21 Aug 2017 22:01:02 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Aug 2017 22:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6MZvNAqkUlZdd7yUZ5dNoqZzqhG/RJtpYWhNIdoo6
 xc=; b=hRMlzfht++0xInTjcEyw4VqwkSsIeA9d9DRZINv3gUf6p19LLm2tPEaom
 SLmzmaA3GNpiK6oSxfHq3tg6doMwcWTYZpeN8Du56SC2KzIVGfMYH3qGclusIqMO
 qK1KmMI+JNXwYAX5aayxAcrM6u+qiNt0eDfRUOvwi6FsPlOpIa9uHmxHDxuQc/2L
 x7aHCWTKHH+XebbA02pk8+Q8iytrC9JlKocXulsjcMQm6Q2IkG7DQdZv095ncw0T
 vEu3D8RtXoTsXglT+9lnNLDfXE3tOgM/gEPrEYaZP05vYmpJ1MrOPVPSid4XJvRI
 6DRrG4ACxlibgfqfPQq2S7+LPaiPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6MZvNAqkUlZdd7yUZ5
 dNoqZzqhG/RJtpYWhNIdoo6xc=; b=iKWr2wTGRU1a6k4KWnv89XhjshOY9ptmUm
 5ff0CHsykzevmVJFOtOzsNiS/4EC7iI8nfZgZDTpmVYkA+goNVyp649Af2nMtCq1
 RzIHuGfpfaNAssRBfhxIY0D7KTVC3ueGUvHYhbl/F8l1+JZOz+RU/dEykELqhHVU
 JRdv1MA0hAZMeCZ2p5dUsbog+C6BgiVtC3GNztuT2vNdaO5wLVig2x3ZvJQHnCou
 kLrLKwonKfRmUy8qWs8EDrpOqQoettnHOfaeZqxdUljGaEAxw19b5ZWWgqzo9faj
 POIXSlT6Z1WjQN5p7oR5m7A0lNkf48bMoXYph0iT6KicIc9+BrFA==
X-ME-Sender: <xms:XpCbWeT-gpjQyLR0XcQ08yO0wRdv0BadSSw-cQcc00ltg94PhGRtjQ>
X-Sasl-enc: YL4a2Cf1aqRPYNzRypNiJ48qdv6pk10PHpV0quA2nY/7 1503367261
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6DE0E249CD;
 Mon, 21 Aug 2017 22:01:00 -0400 (EDT)
Message-ID: <1503367256.7266.17.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Tue, 22 Aug 2017 11:30:56 +0930
In-Reply-To: <20170821220946.85617-2-cbostic@linux.vnet.ibm.com>
References: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
 <20170821220946.85617-2-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MXLa1ArsMqonshTemVlW"
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
X-List-Received-Date: Tue, 22 Aug 2017 02:01:05 -0000


--=-MXLa1ArsMqonshTemVlW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Mon, 2017-08-21 at 17:09 -0500, Christopher Bostic wrote:
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
> =C2=A0drivers/hwmon/pmbus/ucd9000.c | 128 +++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 126 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.=
c
> index 3e3aa95..5cea5f6 100644
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
> +
> =C2=A0struct ucd9000_data {
> > =C2=A0	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> > =C2=A0	struct pmbus_driver_info info;
> > +	struct gpio_chip gpio;
> =C2=A0};
> =C2=A0#define to_ucd9000_data(_info) container_of(_info, struct ucd9000_d=
ata, info)
> =C2=A0
> @@ -119,6 +133,87 @@ static int ucd9000_read_byte_data(struct i2c_client =
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
> > +		dev_err(&client->dev, "failed to read GPIO config\n");
> > +		return ret;
> > +	}
> +
> > +	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);

I see you've fixed this case, but didn't audit the rest of the code to fix =
the
remainder. For example the return statement in ucd9000_gpio_get_direction()
still branches. Similarly there are error messages that don't report the er=
ror
return value*, and unnecessary line breaks in in dev_err() calls. In the fu=
ture,
can you please audit your code for classes of problems that are identified =
in
review? I'd hate to have to comment on literally every instance to get them=
 all
fixed, as that feels like a waste of my time and a bit patronising towards =
you.

* Where and when we do this needs some judgement with respect to taste, but=
 it
=C2=A0 certainly frustrates me when I'm reading logs and I see vague messag=
es like
=C2=A0 "Failed". What failed? Why?

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
> +static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
> > +					unsigned int offset)
> +{
> > +	return 0;

In your reply to my comments on v3 you said you'd implement the direction
switching, but this is still unimplemented. What happened? Also I spent som=
e
time discussing documentation of assumptions in my reply to Matt, but that
seems to not be addressed either. Why is that?

Did you look at a bare-bones pinctrl implementation so we can describe the =
GPIO
ranges appropriately? If you did and it was too much effort then it would b=
e
nice to know that, and why.

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

Joel requested the patch be sent upstream to get a decision from the
maintainers on this new ABI, and I suggested to you yesterday that it shoul=
d
probably be split out to address ABI changes separate to the GPIO problem, =
but
neither appear to have been done. Why was that?

Andrew

> =C2=A0static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0			=C2=A0const struct i2c_device_id *id)
> =C2=A0{
> @@ -227,7 +322,36 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		=C2=A0=C2=A0| PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
> > =C2=A0	}
> =C2=A0
> > -	return pmbus_do_probe(client, mid, info);
> > +	data->gpio.label =3D "gpio-ucd9000";
> > +	data->gpio.get_direction =3D ucd9000_gpio_get_direction;
> > +	data->gpio.direction_input =3D ucd9000_gpio_direction_input;
> > +	data->gpio.get =3D ucd9000_gpio_get;
> > +	data->gpio.can_sleep =3D 1;
> > +	data->gpio.base =3D -1;
> > +	if (mid->driver_data =3D=3D ucd90160)
> > +		data->gpio.ngpio =3D UCD90160_NUM_GPIOS;
> > +	data->gpio.parent =3D &client->dev;
> > +	data->gpio.owner =3D THIS_MODULE;
> +
> > +	ret =3D devm_gpiochip_add_data(&client->dev, &data->gpio, client);
> > +	if (ret) {
> > +		data->gpio.parent =3D NULL;
> > +		dev_warn(&client->dev, "Count not add gpiochip\n");
> > +		return ret;
> > +	}
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
> @@ -236,7 +360,7 @@ static int ucd9000_probe(struct i2c_client *client,
> > =C2=A0		.name =3D "ucd9000",
> > =C2=A0	},
> > =C2=A0	.probe =3D ucd9000_probe,
> > -	.remove =3D pmbus_do_remove,
> > +	.remove =3D ucd9000_remove,
> > =C2=A0	.id_table =3D ucd9000_id,
> =C2=A0};
> =C2=A0
--=-MXLa1ArsMqonshTemVlW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZm5BZAAoJEJ0dnzgO5LT59NsQAKMkwXpaFJTchvZDMQKyt8Mp
10BkhrsCvI3ya+NkQOB9uN+NJ5iEm0xL2hUdqn/5tscm5MIV4K+9YMCvoeCO5GoH
/VMsgOaw14fHjJLp1PGfk6JINGZaD5xXiwocux8jKhtAwRlCvrgQFYBvjZpzAvlf
qfhZoV0mg7R6KpjgVUpkr+bbVBEDiTKUVXGH98cjwJFgbc21mWeg/U8SUV2VNO6l
FGBKWwqYkWfNXMbMPVNmsNJUom/rZD6qKdWlFiIXRFUHggIwZFfCdLXvzZcIO6GM
Rl4VBxkr1m1yqUO0RiypArB1vu0PInvNjVJNLWd8NM0tWU3shOvV7LNtLszLu5WS
ZvwGEoEEgZX/uJjFRhzbnPAtKuyPokdHiI0gLPbQfbrmdCgUeKaIiLxTj0ckFg4I
J1HWlTyCODhfiSNxKWDklv0fa/ZC+ANgrTFYx6GlNt61SKWME3UsIPoLUqnpoJEA
XpDKpLufiCQ8Dy3oWAfWnGbDlcyjdfednYDNVWoQf9koCKo63C6Ltu4B5B4RFNho
63PSJH0Bcc7Py0rCkZwinopftDuzXQyxuR7dzmLKluRdOF4xEsT0uZpPEU39EdZz
OzRbe79ZtFNDx9IRL7EDH9GjXwfdtjIvb3HmRSRi2QhqywesM+KALZKMS600yUhI
G/06jLdPEa81woxDjEbG
=Eu0e
-----END PGP SIGNATURE-----

--=-MXLa1ArsMqonshTemVlW--
