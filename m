Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhHfK0qLwzDqNc
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 15:45:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="a2SgukLD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kMfPTMtd"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D87F5209D1;
 Tue, 29 Aug 2017 01:45:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 01:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=0kI+2BndMh1LRBh+DvZ0OxjOukxX6Jt7xcXb5xThY
 c0=; b=a2SgukLDRYICHNIDpsXNEJpb7U0Pul1MOrhqhSCy4a4lKSZJRweE9nK9r
 yDGUPISnOcMU5W6m15rrd42yEKWh99JaYykrFRsmDKNXf4eR12gOfYCmuaJ+2gpo
 6OqrnkRD2FVkZN134diSPeaajrE3HxGuKaaLm9l4NGsdjNlqpABWvShUKjOraHdt
 hvem2p8OSpqgN04W3RHgjgxxhHzhb2xgySMKF1Rd7m+g/RVjti1LzfjbiOopjOrS
 ccGXvoBweoMqN+1ftEOU3trTremI1iT1hX4EUtwH86BpJ1toNzrXpZtTPGgkKHPp
 ILdlUzRu41noifKKVz7qJh7JC/SSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=0kI+2BndMh1LRBh+Dv
 Z0OxjOukxX6Jt7xcXb5xThYc0=; b=kMfPTMtdPeg0DvqO6corQr1etqvsiC/BiU
 S5n4qVuQCV0PZs7gia/HRnrVynowBGARVzKi4y2VO22nwqO/tsbwA1Ps/B2VtrBo
 WyaTSshiZdrarpP8GV+5Y0KiBXjku11pyrwrSEr26ROS90l/JAaVbCK2w/Cw+D98
 DfNstShRgdNUOhZ2vp3PzlCeb6azKiUQCP469GO1rhOr7m5sRLrgHloRugAzK/+g
 /RTPirvnwtp4FfVW0n+ToEGMDz75tMyTbO8nxKAAlfRZy81tI4NmTl8Mnk++U1dR
 i5IfOQdTWNwO5qH3UvNo+VWXdROlhUlM4kO/nnciAZ6/qxrgKqQw==
X-ME-Sender: <xms:Zv-kWX6ej-kEkbQsm5UpMmbm8ndrKxOZ0giiLIiQ7uLekqMcwzzcRw>
X-Sasl-enc: s4p+d402nvngCbYHInNWohuSZhn+9Ko0xFv8fn4/Mw/I 1503985510
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A563247A2;
 Tue, 29 Aug 2017 01:45:08 -0400 (EDT)
Message-ID: <1503985506.5933.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] leds: pca955x: check for I2C errors
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 29 Aug 2017 15:15:06 +0930
In-Reply-To: <20170828063705.21783-1-clg@kaod.org>
References: <20170828063705.21783-1-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-xcAyLq1NZ4Td/6PIEP5u"
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
X-List-Received-Date: Tue, 29 Aug 2017 05:45:13 -0000


--=-xcAyLq1NZ4Td/6PIEP5u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-28 at 08:37 +0200, C=C3=A9dric Le Goater wrote:
> This should also allow probing to fail when a pca955x chip is not
> found on a I2C bus.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks C=C3=A9dric. I've applied this to dev-4.10, fixing up the conflicts
with my series. I felt this was reasonable given we've both been
discussing the changes.

Andrew

> ---
> =C2=A0Changes since v1:
>=20
> =C2=A0- introduced a pca955x_set_value() routine returning an errno
> =C2=A0- modified pca955x_gpio_direction_{in,out}put to return an errno
> =C2=A0
> =C2=A0drivers/leds/leds-pca955x.c | 114 ++++++++++++++++++++++++++++++++-=
-----------
> =C2=A01 file changed, 83 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 09303fd1fdc6..905729191d3e 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -165,13 +165,18 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_=
num, int state)
> =C2=A0 * Write to frequency prescaler register, used to program the
> =C2=A0 * period of the PWM output.=C2=A0=C2=A0period =3D (PSCx + 1) / 38
> =C2=A0 */
> -static void pca955x_write_psc(struct i2c_client *client, int n, u8 val)
> +static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
> =C2=A0{
> > =C2=A0	struct pca955x *pca955x =3D i2c_get_clientdata(client);
> > +	int ret;
> =C2=A0
> > -	i2c_smbus_write_byte_data(client,
> > +	ret =3D i2c_smbus_write_byte_data(client,
> > =C2=A0		pca95xx_num_input_regs(pca955x->chipdef->bits) + 2*n,
> > =C2=A0		val);
> > +	if (ret < 0)
> > +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> > +			__func__, n, val, ret);
> > +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -181,38 +186,56 @@ static void pca955x_write_psc(struct i2c_client *cl=
ient, int n, u8 val)
> =C2=A0 *
> =C2=A0 * Duty cycle is (256 - PWMx) / 256
> =C2=A0 */
> -static void pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
> +static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
> =C2=A0{
> > =C2=A0	struct pca955x *pca955x =3D i2c_get_clientdata(client);
> > +	int ret;
> =C2=A0
> > -	i2c_smbus_write_byte_data(client,
> > +	ret =3D i2c_smbus_write_byte_data(client,
> > =C2=A0		pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + 2*n,
> > =C2=A0		val);
> > +	if (ret < 0)
> > +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> > +			__func__, n, val, ret);
> > +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> =C2=A0 * Write to LED selector register, which determines the source that
> =C2=A0 * drives the LED output.
> =C2=A0 */
> -static void pca955x_write_ls(struct i2c_client *client, int n, u8 val)
> +static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
> =C2=A0{
> > =C2=A0	struct pca955x *pca955x =3D i2c_get_clientdata(client);
> > +	int ret;
> =C2=A0
> > -	i2c_smbus_write_byte_data(client,
> > +	ret =3D i2c_smbus_write_byte_data(client,
> > =C2=A0		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n,
> > =C2=A0		val);
> > +	if (ret < 0)
> > +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> > +			__func__, n, val, ret);
> > +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> =C2=A0 * Read the LED selector register, which determines the source that
> =C2=A0 * drives the LED output.
> =C2=A0 */
> -static u8 pca955x_read_ls(struct i2c_client *client, int n)
> +static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
> =C2=A0{
> > =C2=A0	struct pca955x *pca955x =3D i2c_get_clientdata(client);
> > +	int ret;
> =C2=A0
> > -	return (u8) i2c_smbus_read_byte_data(client,
> > +	ret =3D i2c_smbus_read_byte_data(client,
> > =C2=A0		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
> > +			__func__, n, ret);
> > +		return ret;
> > +	}
> > +	*val =3D (u8)ret;
> > +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int pca955x_led_set(struct led_classdev *led_cdev,
> @@ -223,6 +246,7 @@ static int pca955x_led_set(struct led_classdev *led_c=
dev,
> > =C2=A0	u8 ls;
> > > =C2=A0	int chip_ls;	/* which LSx to use (0-3 potentially) */
> > > =C2=A0	int ls_led;	/* which set of bits within LSx to use (0-3) */
> > +	int ret;
> =C2=A0
> > =C2=A0	pca955x_led =3D container_of(led_cdev, struct pca955x_led, led_c=
dev);
> > =C2=A0	pca955x =3D pca955x_led->pca955x;
> @@ -232,7 +256,9 @@ static int pca955x_led_set(struct led_classdev *led_c=
dev,
> =C2=A0
> > =C2=A0	mutex_lock(&pca955x->lock);
> =C2=A0
> > -	ls =3D pca955x_read_ls(pca955x->client, chip_ls);
> > +	ret =3D pca955x_read_ls(pca955x->client, chip_ls, &ls);
> > +	if (ret)
> > +		goto out;
> =C2=A0
> > =C2=A0	switch (value) {
> > =C2=A0	case LED_FULL:
> @@ -252,26 +278,37 @@ static int pca955x_led_set(struct led_classdev *led=
_cdev,
> > =C2=A0		=C2=A0* OFF, HALF, or FULL.=C2=A0=C2=A0But, this is probably be=
tter than
> > =C2=A0		=C2=A0* just turning off for all other values.
> > =C2=A0		=C2=A0*/
> > -		pca955x_write_pwm(pca955x->client, 1,
> > -				255 - value);
> > +		ret =3D pca955x_write_pwm(pca955x->client, 1, 255 - value);
> > +		if (ret)
> > +			goto out;
> > =C2=A0		ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
> > =C2=A0		break;
> > =C2=A0	}
> =C2=A0
> > -	pca955x_write_ls(pca955x->client, chip_ls, ls);
> > +	ret =3D pca955x_write_ls(pca955x->client, chip_ls, ls);
> =C2=A0
> +out:
> > =C2=A0	mutex_unlock(&pca955x->lock);
> =C2=A0
> > -	return 0;
> > +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0#ifdef CONFIG_LEDS_PCA955X_GPIO
> =C2=A0/*
> =C2=A0 * Read the INPUT register, which contains the state of LEDs.
> =C2=A0 */
> -static u8 pca955x_read_input(struct i2c_client *client, int n)
> +static int pca955x_read_input(struct i2c_client *client, int n, u8 *val)
> =C2=A0{
> > -	return (u8)i2c_smbus_read_byte_data(client, n);
> > +	int ret =3D i2c_smbus_read_byte_data(client, n);
> +
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
> > +			__func__, n, ret);
> > +		return ret;
> > +	}
> > +	*val =3D (u8)ret;
> > +	return 0;
> +
> =C2=A0}
> =C2=A0
> =C2=A0static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned =
int offset)
> @@ -285,23 +322,32 @@ static int pca955x_gpio_request_pin(struct gpio_chi=
p *gc, unsigned int offset)
> > =C2=A0	return -EBUSY;
> =C2=A0}
> =C2=A0
> -static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int of=
fset,
> > -				=C2=A0=C2=A0=C2=A0int val)
> +static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int val)
> =C2=A0{
> > =C2=A0	struct pca955x *pca955x =3D gpiochip_get_data(gc);
> > =C2=A0	struct pca955x_led *led =3D &pca955x->leds[offset];
> =C2=A0
> > =C2=A0	if (val)
> > -		pca955x_led_set(&led->led_cdev, LED_FULL);
> > +		return pca955x_led_set(&led->led_cdev, LED_FULL);
> > =C2=A0	else
> > -		pca955x_led_set(&led->led_cdev, LED_OFF);
> > +		return pca955x_led_set(&led->led_cdev, LED_OFF);
> +}
> +
> +static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int of=
fset,
> > +				=C2=A0=C2=A0=C2=A0int val)
> +{
> > +	pca955x_set_value(gc, offset, val);
> =C2=A0}
> =C2=A0
> =C2=A0static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned in=
t offset)
> =C2=A0{
> > =C2=A0	struct pca955x *pca955x =3D gpiochip_get_data(gc);
> > =C2=A0	struct pca955x_led *led =3D &pca955x->leds[offset];
> > -	u8 reg =3D pca955x_read_input(pca955x->client, led->led_num / 8);
> > +	u8 reg =3D 0;
> +
> > +	/* There is nothing we can do about errors */
> > +	pca955x_read_input(pca955x->client, led->led_num / 8, &reg);
> =C2=A0
> > =C2=A0	return !!(reg & (1 << (led->led_num % 8)));
> =C2=A0}
> @@ -310,17 +356,13 @@ static int pca955x_gpio_direction_input(struct gpio=
_chip *gc,
> > =C2=A0					unsigned int offset)
> =C2=A0{
> > =C2=A0	/* To use as input ensure pin is not driven */
> > -	pca955x_gpio_set_value(gc, offset, 0);
> -
> > -	return 0;
> > +	return pca955x_set_value(gc, offset, 0);
> =C2=A0}
> =C2=A0
> =C2=A0static int pca955x_gpio_direction_output(struct gpio_chip *gc,
> > =C2=A0					=C2=A0unsigned int offset, int val)
> =C2=A0{
> > -	pca955x_gpio_set_value(gc, offset, val);
> -
> > -	return 0;
> > +	return pca955x_set_value(gc, offset, val);
> =C2=A0}
> =C2=A0#endif /* CONFIG_LEDS_PCA955X_GPIO */
> =C2=A0
> @@ -495,19 +537,29 @@ static int pca955x_probe(struct i2c_client *client,
> > =C2=A0				return err;
> =C2=A0
> > =C2=A0			/* Turn off LED */
> > -			pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> > +			err =3D pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> > +			if (err)
> > +				return err;
> > =C2=A0		}
> > =C2=A0	}
> =C2=A0
> > =C2=A0	/* PWM0 is used for half brightness or 50% duty cycle */
> > -	pca955x_write_pwm(client, 0, 255-LED_HALF);
> > +	err =3D pca955x_write_pwm(client, 0, 255 - LED_HALF);
> > +	if (err)
> > +		return err;
> =C2=A0
> > =C2=A0	/* PWM1 is used for variable brightness, default to OFF */
> > -	pca955x_write_pwm(client, 1, 0);
> > +	err =3D pca955x_write_pwm(client, 1, 0);
> > +	if (err)
> > +		return err;
> =C2=A0
> > =C2=A0	/* Set to fast frequency so we do not see flashing */
> > -	pca955x_write_psc(client, 0, 0);
> > -	pca955x_write_psc(client, 1, 0);
> > +	err =3D pca955x_write_psc(client, 0, 0);
> > +	if (err)
> > +		return err;
> > +	err =3D pca955x_write_psc(client, 1, 0);
> > +	if (err)
> > +		return err;
> =C2=A0
> =C2=A0#ifdef CONFIG_LEDS_PCA955X_GPIO
> > =C2=A0	if (ngpios) {
--=-xcAyLq1NZ4Td/6PIEP5u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpP9iAAoJEJ0dnzgO5LT5sIsQAJvpMFQ8wXRNiOQvVk0K4yVi
uK1OtY/H1orYxGltqDtqTFYTrWT1DgRHgi1C8d68DEHbLDhdiTSMlkGbcu1Z1LKy
LKSgluMmVI28IMYwCaGLakC6n9ZujJT5KROVerGPrhQ8qNKjEC9dcSoi8YXawT3q
Xba7wHCpyKKN7Yxfwajqn/GlDKbhavnZF1s069lJgBFvxYLrdLkHN1/NIJdSvelK
XBxneAMdfL57QqrFur8Pcz7CqzPnPnbFfWH3+gjiwGkTzskHVXNlkDSLV7TYnWfR
N89vPz4ljssvjTTzkBLi8uHPa4Vh+KSgpS0B/nLXq1XL9ttZZTVRKCm2ZORE7H3k
EdlTi9VKc+RSH31RuQGMBawy+8DREsSmc9wun3Loi836sxfQjnANaNAzvi6XEFQU
4QVtYCum3bop12ke5rn3T6eGkpuAaGV8tiiLJzl/k9I6xzGVyKMPUkE6Qt35NhPp
sfumzX4oFtZ61jDPWX/x3XnujQMdiMv5xeQBG1ZgZIQWKLgVeuV+RkoImbOCbCRx
6ls8SBbVWyVziMmB4ljkS3A0u4QFJCRxEpcfynjC02/AtgbWdObC6xfJdqaUz4SW
eV3tT1P59QTBwwwbdFMYt93fVwaAsgShvfu9sDCS1lMdxoPV/uQu4soHGdoIzy9f
L+1voGqhJmsxUsFvylgS
=6koe
-----END PGP SIGNATURE-----

--=-xcAyLq1NZ4Td/6PIEP5u--
