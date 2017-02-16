Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNzDR6g4ZzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 12:32:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W1slMUeI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PptiizeO"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B09C207DA;
 Wed, 15 Feb 2017 20:32:37 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 15 Feb 2017 20:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=s9Ao/ET3lV0jMUMnoYZA/3KIjY8=; b=W1slMU
 eIVXuy582q1zlbYgSusser2sX6EWBxYipxiKLa/MpJO0DfP+0duW0Hge3Uu+l8Xs
 AXDbOJ2bHs4Ajnc67AdvU4aq2gSA6f9ZHxO7wxwn+0RG2fQ8mB1K847JdFHUxaPT
 Q/UIj5da1sCOnXsoVcF935a+ilamWJzkPy9FY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=s9Ao/ET3lV0jMU
 MnoYZA/3KIjY8=; b=PptiizeOTxC63VAA5YAfWkxvbnakfoWPFVQP7Rte79Gt8O
 PH+o5DkUSqXHndPaKPjSXQbYmGEkCrrIUenJCWTwKM+Gdru7uBr9LnF30HsmKcD5
 hl+FLy5vINUvgIboJwejbFzV85IhmtR1zkHpcmJ1M9eyKkdh5iDR3q1NC7FQE=
X-ME-Sender: <xms:NAGlWMiOKBSNiHRdI2tmPv8DzGUsStwMgFqZZfyRMLJpM1rEYSu0GA>
X-Sasl-enc: l5bgW+TdRz6M5KzRwCxZGV0fK0yzrnUThlEzPZCl9Gc9 1487208756
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30E6B7E050;
 Wed, 15 Feb 2017 20:32:33 -0500 (EST)
Message-ID: <1487208750.3661.34.camel@aj.id.au>
Subject: Re: [RESEND PATCH linux] aspeed: pinctrl: Allow disabling Port D
 and Port E loopback mode
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>, linus.walleij@linaro.org, 
 joel@jms.id.au, arnd@arndb.de, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Thu, 16 Feb 2017 12:02:30 +1030
In-Reply-To: <20170215065514.16673-1-raltherr@google.com>
References: <20170215065514.16673-1-raltherr@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-s7ddElXhuJh8TxBf6Zs0"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Thu, 16 Feb 2017 01:32:40 -0000


--=-s7ddElXhuJh8TxBf6Zs0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-02-14 at 22:55 -0800, Rick Altherr wrote:
> Port D and port E GPIO loopback modes are commonly enabled via hardware
> straps for use with front-panel buttons.=C2=A0=C2=A0When the BMC is power=
ed
> off or fails to boot, the front-panel buttons are directly connected to
> the host chipset via the loopback to allow direct power-on and reset
> control. Once the BMC has booted, the loopback mode must be disabled for
> the BMC to take over control of host power-on and reset.
>=20
> Disabling these loopback modes requires writing to the hardware strap
> register which violates the current design of assuming the system
> designer chose the strap settings for a specific reason and they should
> be treated as read-only. Only the two bits of the strap register related
> to these loopback modes are allowed to be written and comments have been
> added to explain why.
>=20
> Signed-off-by: Rick Altherr <raltherr@google.com>

For the record this is one of at least two awkward cases. The other is
runtime switching between the using the SoC as an SPI master, and
simply performing SPI pass-through for an external controller (e.g. to
allow either the BMC or the host to reprogram the host BIOS image).

If the list of exceptions continues to grow we should pull the tests
out to a separate function so we can keep the condition readable.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 14 ++++++++++++--
> =C2=A01 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index 76f62bd45f02..5b49952e5fad 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -198,9 +198,19 @@ static int aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
> > =C2=A0		=C2=A0* them. This may mean that certain functions cannot be
> > =C2=A0		=C2=A0* deconfigured and is the reason we re-evaluate after wri=
ting
> > =C2=A0		=C2=A0* all descriptor bits.
> > +		=C2=A0*
> > +		=C2=A0* Port D and port E GPIO loopback modes are the only exception
> > +		=C2=A0* as those are commonly used with front-panel buttons to allow
> > +		=C2=A0* normal operation of the host when the BMC is powered off or
> > +		=C2=A0* fails to boot. Once the BMC has booted, the loopback mode
> > +		=C2=A0* must be disabled for the BMC to control host power-on and
> > +		=C2=A0* reset.
> > =C2=A0		=C2=A0*/
> > -		if ((desc->reg =3D=3D HW_STRAP1 || desc->reg =3D=3D HW_STRAP2) &&
> > -				desc->ip =3D=3D ASPEED_IP_SCU)
> > +		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1 &&
> > +		=C2=A0=C2=A0=C2=A0=C2=A0!(desc->mask & (BIT(21) | BIT(22))))
> > +			continue;
> +
> > +		if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP2)
> > =C2=A0			continue;
> =C2=A0
> > =C2=A0		ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
--=-s7ddElXhuJh8TxBf6Zs0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYpQEuAAoJEJ0dnzgO5LT5XAsP/3fexO6vNuUV9WJRJWuAc6az
TVz6UVyUZ3Wb+SZ0UQiLy8WhXOvGtR0lh0Yqsff/bDzJYzMPw4QvYMwH/a2uM7od
ckxTXPuI2PytSbF5TdtuAjamSyyflVTWST5Cx3GV8wFcNF0dYZfskOGBspdiSVAA
Ki/VHsE8NOfZ1SZbiNpWLeZimfvTWcZdFc8Y+9/IORlgKv4f+3eFTApk6ulwQDwm
V5mORhy0H0D3534i/H2W6ofR/d05UqYrSVYlmT0aQjs3sAGwEpg9nPs5S4nfUDj8
WMUZZZl4xSKbNoba9mn8IPPHTFQkCfGIeQ7VHN/4FDlxJqudWyfKxp0WSusI4tm2
FwtaKPX5K8ORVx4RzAtNN6+4cu/1b1RetRg939aVqqxJQABRrLCse4gRjfcGaKdV
kfHCZaxxCPQQr3IuxB9Sx+iCe+yY84RWnG9v2pfb+fwLqqWqnHJqwmctvLujvcaT
T4tV9D9ff6j1ueW1ycbWuXYff3PNSJQmPjaO8MTP9IOI28TfEL95TBTczCFJADWP
Y1DIKEWaj27rE9aAKQDr34SOVNMQPmM/1DuTwFG1ZaREhzPOd9UFKtN8BHUx59Ho
iAuN/yw+SUeGUgamiREowEOPzy3NRKDp8Trw0El1lpSOwI6yPr/SQvi/pjcrJCN9
SoItf5AguuOvNGvYxtNs
=K6Y+
-----END PGP SIGNATURE-----

--=-s7ddElXhuJh8TxBf6Zs0--
