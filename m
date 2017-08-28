Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgdK251wbzDqMh
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 13:57:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZmBt4Xri"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="arlEI7T7"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 56F8E20B3E;
 Sun, 27 Aug 2017 23:57:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 27 Aug 2017 23:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=iba5dMFAIoPesV75iPmQHixtcXSQqlHSO/5Rf+nwm
 Q4=; b=ZmBt4Xri+ysv1kui9AXkWVYmGQDL4lPbxi26TpQAdxs/vZVuHWG0qs6q4
 /sqP54OAx/Y9oGBNJm7/6qvkHvUDkJvXYuiwWwOzn7CCdIjceXfhh1SwwjQJQrBn
 UojlhCLrgPez9eFyglkersDlKv9qd7dmd0ST4DJl3AFMwtYgkXgGGDmYlO2QyacR
 HyvjUmtEDkAei2KDZJn9oycR6PwxiRofs1W0vasDnrEpx25UweGF0HUAaLoSvavx
 KUk3i1DwHOAFYfAUGJb3w4sZSZQij1PAER3oZRTdoMUlkEGohKP25sQPhJN+SLHI
 oDFbmkiNGJmtFROCEdyP0AKrPZ+ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=iba5dMFAIoPesV75iP
 mQHixtcXSQqlHSO/5Rf+nwmQ4=; b=arlEI7T7QAaFhG7xUxe3vsxSPkzJ4fMkHs
 tpDrb638AVE1JiZpfFesQpR220N2MWTcVvx1gA+I2CXbeS3gFgvl87AbHGeKmPOL
 pXsXkCxJ2qPHKTiHRo3KHmleV7Btcj8IOl6oPA2bgsUT/N1Egf1ndG11gsGfBmjM
 zuHs+AevGn7lLe8rP/NWABzYD4JrAufa54EvYuXwMajjwmEh71+nzkZGL3fn4grF
 BckeHyf8xOEuSLgp3cgA4VOu+D9Y04JV4x+aqQl0bzZZZE1/uzIwlyl19gDQFwBn
 At3TnbBnIJaNBqNA1dWm0Oaqjqom4Dsgnk7pLl66zEKCnLGhh+LQ==
X-ME-Sender: <xms:xJSjWXbkNrO5fAtptYO8eQpQ2UsVWy_m6pm2z6SGpns6pHGUfcvoww>
X-Sasl-enc: E2gj6PENbwtXjcG1XTkLsNxRCELyDDfw7DCBGz7Pqy+y 1503892675
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C34E7E271;
 Sun, 27 Aug 2017 23:57:54 -0400 (EDT)
Message-ID: <1503892668.32695.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/2] leds: pca955x: sync with mainline
 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Aug 2017 13:27:48 +0930
In-Reply-To: <20170827164546.22903-2-clg@kaod.org>
References: <20170827164546.22903-1-clg@kaod.org>
 <20170827164546.22903-2-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-p2nyrHJNsnV5yNIlp29C"
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
X-List-Received-Date: Mon, 28 Aug 2017 03:58:00 -0000


--=-p2nyrHJNsnV5yNIlp29C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-08-27 at 18:45 +0200, C=C3=A9dric Le Goater wrote:
> The result should be in sync with kernel 4.14 once the gpio extension
> is merged in the pca955x driver.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks, applied to dev-4.10.

Andrew

> ---
> =C2=A0drivers/leds/leds-pca955x.c | 49 ++++++++++++++++++----------------=
-
> ----------
> =C2=A01 file changed, 19 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-
> pca955x.c
> index 0217bac2f47b..f062d1e7640f 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -342,7 +342,8 @@ pca955x_pdata_of_init(struct i2c_client *client,
> struct pca955x_chipdef *chip)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	pdata->leds =3D devm_kzalloc(&client->dev,
> -			=C2=A0=C2=A0=C2=A0sizeof(struct pca955x_led) * chip->bits,
> GFP_KERNEL);
> +				=C2=A0=C2=A0=C2=A0sizeof(struct pca955x_led) *
> chip->bits,
> +				=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> =C2=A0	if (!pdata->leds)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> @@ -430,16 +431,14 @@ static int pca955x_probe(struct i2c_client
> *client,
> =C2=A0			"slave address 0x%02x\n",
> =C2=A0			client->name, chip->bits, client->addr);
> =C2=A0
> -	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
> +	if (!i2c_check_functionality(adapter,
> I2C_FUNC_SMBUS_BYTE_DATA))
> =C2=A0		return -EIO;
> =C2=A0
> -	if (pdata) {
> -		if (pdata->num_leds !=3D chip->bits) {
> -			dev_err(&client->dev, "board info claims %d
> LEDs"
> -					" on a %d-bit chip\n",
> -					pdata->num_leds, chip-
> >bits);
> -			return -ENODEV;
> -		}
> +	if (pdata->num_leds !=3D chip->bits) {
> +		dev_err(&client->dev,
> +			"board info claims %d LEDs on a %d-bit
> chip\n",
> +			pdata->num_leds, chip->bits);
> +		return -ENODEV;
> =C2=A0	}
> =C2=A0
> =C2=A0	pca955x =3D devm_kzalloc(&client->dev, sizeof(*pca955x),
> GFP_KERNEL);
> @@ -458,12 +457,10 @@ static int pca955x_probe(struct i2c_client
> *client,
> =C2=A0	pca955x->chipdef =3D chip;
> =C2=A0
> =C2=A0	for (i =3D 0; i < chip->bits; i++) {
> -		struct pca955x_led *pdata_led =3D &pdata->leds[i];
> -
> =C2=A0		pca955x_led =3D &pca955x->leds[i];
> =C2=A0		pca955x_led->led_num =3D i;
> =C2=A0		pca955x_led->pca955x =3D pca955x;
> -		pca955x_led->type =3D pdata_led->type;
> +		pca955x_led->type =3D pdata->leds[i].type;
> =C2=A0
> =C2=A0		switch (pca955x_led->type) {
> =C2=A0		case PCA955X_TYPE_NONE:
> @@ -476,27 +473,20 @@ static int pca955x_probe(struct i2c_client
> *client,
> =C2=A0			=C2=A0* Platform data can specify LED names and
> =C2=A0			=C2=A0* default triggers
> =C2=A0			=C2=A0*/
> -			if (pdata) {
> -				if (pdata->leds[i].name)
> -					snprintf(pca955x_led->name,
> -						=C2=A0sizeof(pca955x_led-
> >name),
> -						=C2=A0"pca955x:%s",
> -						=C2=A0pdata-
> >leds[i].name);
> -				if (pdata->leds[i].default_trigger)
> -					pca955x_led-
> >led_cdev.default_trigger =3D
> -						pdata-
> >leds[i].default_trigger;
> -			} else {
> +			if (pdata->leds[i].name)
> =C2=A0				snprintf(pca955x_led->name,
> -					=C2=A0sizeof(pca955x_led->name),
> -					=C2=A0"pca955x:%d", i);
> -			}
> +					sizeof(pca955x_led->name),
> "pca955x:%s",
> +					pdata->leds[i].name);
> +			if (pdata->leds[i].default_trigger)
> +				pca955x_led-
> >led_cdev.default_trigger =3D
> +					pdata-
> >leds[i].default_trigger;
> =C2=A0
> =C2=A0			pca955x_led->led_cdev.name =3D pca955x_led-
> >name;
> =C2=A0			pca955x_led-
> >led_cdev.brightness_set_blocking =3D
> =C2=A0				pca955x_led_set;
> =C2=A0
> =C2=A0			err =3D devm_led_classdev_register(&client-
> >dev,
> -						=C2=A0&pca955x_led-
> >led_cdev);
> +							&pca955x_led
> ->led_cdev);
> =C2=A0			if (err)
> =C2=A0				return err;
> =C2=A0
> @@ -536,11 +526,10 @@ static int pca955x_probe(struct i2c_client
> *client,
> =C2=A0			pca955x->gpio.parent =3D NULL;
> =C2=A0			dev_warn(&client->dev, "could not add
> gpiochip\n");
> =C2=A0			return err;
> -		} else {
> -			dev_info(&client->dev, "gpios %i...%i\n",
> -				=C2=A0pca955x->gpio.base, pca955x-
> >gpio.base +
> -				=C2=A0pca955x->gpio.ngpio - 1);
> =C2=A0		}
> +		dev_info(&client->dev, "gpios %i...%i\n",
> +			=C2=A0pca955x->gpio.base, pca955x->gpio.base +
> +			=C2=A0pca955x->gpio.ngpio - 1);
> =C2=A0	}
> =C2=A0#endif
> =C2=A0
--=-p2nyrHJNsnV5yNIlp29C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZo5S8AAoJEJ0dnzgO5LT53L8P/3016QwocbuIEZEtkv4epROx
9m1xpm6uBT/BumYArAQKacCs6/7RiO4lWOV3LrKdvEc0wqMCaPUUdtBCt/6hgBY9
ow3fvUnFghrlpBWkF8dEbZkheorSIURmyOlVCMkILyqG9vvs0z3MGCzWDtkKYdHv
4KVvy1auszHyqdJjie+VY6VBrNECWNYWDL8h9PEgx/yStCuaOZB60ILDKCAAv5/k
Rc7YdITdn67zHeKm6R5U3t0/lD1CJVBfz9VNUyGnRCrENNogqZFEWgQoALy3xGFp
mFqxyhHgnVTZ8rT6YACcY0b/rc10rVQ4Z6CAbYhjAMAwy1mIsejZu0u40dvwH+d3
a8PxXwojMQ1pIOUA2uK65lItF4FIht3r7kfAieRWRQXGWVk0EdtGcsOiUTGy37HF
eUn888BomzhvsoGyw2CwGxGX4z1HWbrQCc+9WZ8hLMd+rihUXXu8+TdTEEz5h9aQ
/37rS/ssJVTBDqaG1vC0z2MH2wivZf4L3gFzD8vbqw2SnsFtJnJXjPEW1SLc2KsJ
DmtlItL2ajVmDXsJG1uoa4+NeYWua5Q3M4eYSO7l60m99Wgbfhyq5l5IYWcgnXSh
WzqIbC2WqR/NSILHpptk0fea3J9I3KYcda8chjl9H3AjDI8saRSd/0kDtlLdsa60
Ds5FNyTtHEIFS+R/sMLH
=pdZY
-----END PGP SIGNATURE-----

--=-p2nyrHJNsnV5yNIlp29C--
