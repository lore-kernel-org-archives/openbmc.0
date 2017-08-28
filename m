Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgbcG1R31zDqF7
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 12:41:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GsDauTG8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OdgG5U23"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EB82820DEA;
 Sun, 27 Aug 2017 22:40:59 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Aug 2017 22:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=lBIwQ4ImHDK6JLu6KSk2QvFlJDKAGQarmWDJ8lfs2
 JU=; b=GsDauTG801wUXnjw52i9xECWdpowKEd6VcA0hS/NOuq8W2rbJ2e/CC3xQ
 jli6BS1+4p4WwlNF5tETiKV8qCxNQ9Bi6sMzeMn6nYtcAEcdieUTugg5J3kwEOvs
 L2EuoyD+FTxkAQQ5QPXNVrYmhu0c+iznsyOxjl/YxMfWp4M21xZyEl++ri0LkT+4
 46vprGnlH+lF79bHqvOhqDbMi1Hy/y9DYUukFhtCVOYRJcx0OPduYeOR4tIbUCw4
 lLB6v2QFB7UOmjTSnu+rfMuXLuAuOkMfo4YQL1UzU+/4qjFJhy/PGM/aK5t/r0AT
 sGqttYsqaxSfu7pBOY2K6bWj5ugCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=lBIwQ4ImHDK6JLu6KS
 k2QvFlJDKAGQarmWDJ8lfs2JU=; b=OdgG5U23TfdBQDzQdOgNwzhbx3/71ldfcK
 Vi+3rVbbXtNnQKMrWQSHv1aOoZe73p+f7OlYpqVuMmyFWJGHUX5XQq2EPo75U6gp
 gss7q8mbChT9YqVOFp58U+XjgsyU4tOkSGt6vr2toP36EplU5J/Tj891qWi+OY+J
 z+ChzXQsSuCNcFGiCWtHgZN4RSScpfLBFDc57gec0JxojNjleJBvNHiiqJLY9jAm
 zpyS0S4hQEV8PE5htK2VJE/7b66ubPWWka2L61oYS+rV++Khx0KfDDzx8/b9I6p3
 AVerNa3VWl8dnwI7PPWnlw5r9Q3YWj0UlgWPYhsTjty0ea/aJWjw==
X-ME-Sender: <xms:u4KjWRI8LF3xV8yJrIwpaxofEu7T9Q9e_4Fv-GY2tGy_PbYA-R66fg>
X-Sasl-enc: S4EZYHOHhmYHAKeLAmJ9W724++b1wsBkeNyVtKOK7x8S 1503888059
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C086248E6;
 Sun, 27 Aug 2017 22:40:57 -0400 (EDT)
Message-ID: <1503888051.32695.13.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/2] leds: pca955x: check for I2C errors
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Aug 2017 12:10:51 +0930
In-Reply-To: <20170827164546.22903-3-clg@kaod.org>
References: <20170827164546.22903-1-clg@kaod.org>
 <20170827164546.22903-3-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-JIAQl+NmJ1w+0ii4qajq"
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
X-List-Received-Date: Mon, 28 Aug 2017 02:41:04 -0000


--=-JIAQl+NmJ1w+0ii4qajq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi C=C3=A9dric,

On Sun, 2017-08-27 at 18:45 +0200, C=C3=A9dric Le Goater wrote:
> This should also allow probing to fail when a pca955x chip is not
> found on a I2C bus.
>=C2=A0
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0drivers/leds/leds-pca955x.c | 93 ++++++++++++++++++++++++++++++++++=
+----------
> =C2=A01 file changed, 72 insertions(+), 21 deletions(-)
>=C2=A0
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index f062d1e7640f..5f12d55550a4 100644
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
> @@ -181,38 +186,57 @@ static void pca955x_write_psc(struct i2c_client *cl=
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
> +
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
> > +	*val =3D (u8) ret;
> > +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int pca955x_led_set(struct led_classdev *led_cdev,
> @@ -223,6 +247,7 @@ static int pca955x_led_set(struct led_classdev *led_c=
dev,
> > =C2=A0	u8 ls;
> > > =C2=A0	int chip_ls;	/* which LSx to use (0-3 potentially) */
> > > =C2=A0	int ls_led;	/* which set of bits within LSx to use (0-3) */
> > +	int ret;
> =C2=A0
> > =C2=A0	pca955x_led =3D container_of(led_cdev, struct pca955x_led, led_c=
dev);
> > =C2=A0	pca955x =3D pca955x_led->pca955x;
> @@ -232,7 +257,9 @@ static int pca955x_led_set(struct led_classdev *led_c=
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
> @@ -252,26 +279,37 @@ static int pca955x_led_set(struct led_classdev *led=
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
> > +	*val =3D (u8) ret;
> > +	return 0;
> +
> =C2=A0}
> =C2=A0
> =C2=A0static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned =
int offset)
> @@ -301,7 +339,10 @@ static int pca955x_gpio_get_value(struct gpio_chip *=
gc, unsigned int offset)

I don't see a corresponding change to pca955x_gpio_set_value(), though give=
n
it's hooked up as the gpiochip set() callback we would have to reimplement =
that
interface. We should do that and return the error code rather than swallow =
it.
This flows on to pca955x_gpio_direction_input() and
pca955x_gpio_direction_output() where we currently just blindly return 0.

I think that's it though, looks good otherwise.

Andrew

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
> @@ -491,19 +532,29 @@ static int pca955x_probe(struct i2c_client *client,
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
> > +	err =3D pca955x_write_pwm(client, 0, 255-LED_HALF);
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
--=-JIAQl+NmJ1w+0ii4qajq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZo4KzAAoJEJ0dnzgO5LT5JBsP/11rzk6kds+mWWGlVb38PMzj
/Y/G5P7YRUGvTEDVRs72F/MEh+HByz2w8bqE5v73pO/I5wpwMkUbhiUSUzyASU5F
VWTvuokHLC4nnLxwd9ZS85EkhjjcNJW52rnM/AgIpX306N8YsHbKo+J6rIhGh1gw
f5EN5VrU4y+UnF5CU1kL/2NU6BF6d5jbmLYLpZNbXtOhX2to7XRwxS9q0e2hQyB+
M301nTswiqS1ptJ0bxp9HEfTMeLnhY1wGoBX2iK3Hms2nm1OpzoNhO5UtNzkCh/6
SoF1xI2cJcj2kQvWKKxale22t+uhfBC66TB0q+YCfudxo74ZGKRyep55i7I2JYbn
z/t1+Ky+sIMCK8Qnf3pQWtLGP1BJpjzIzqg3wIAfcgaAdQt2PJbnH99/ZOYR2mtE
eJpRsUn1ghDStuL1CnKZ29Xu6mZsm5u/mEISx/g3OzDPGABBsrydokCPzXwsXscN
Bw+B2cjZwjsbPKK5SETdNHiBP4Lpq9c3cX5QFR6YClq4mefGCzQFqifiDWTMtC6h
NwdOdCzEvUexrHSeS1NIk6i0jN1bum0/S4qtWFp5khGxt9LKDBoGaYSl8KdNNptQ
euzkpOoh4DxZpfeQ2tC2JSrR4ZphIMe1Jn8pVZuZah/u5QRXLs1NVeG/x19Ato6G
HbucnKSpUNA1Cpy/X0fp
=CxY2
-----END PGP SIGNATURE-----

--=-JIAQl+NmJ1w+0ii4qajq--
