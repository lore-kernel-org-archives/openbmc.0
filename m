Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t93cm1kkVzDvM2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 12:08:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RndxH1eG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cUtJmYv3"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 398A4206F4;
 Thu,  3 Nov 2016 21:08:38 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 21:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=4mdfjNHXs+ZmKwyGt4EJFCxDDes=; b=RndxH1
 eGa8lcUDPFWcdczc/y8uJxfU+Xtnyb69x7k9mKVubNFGhn0qcOkXrhrXecBfVKU5
 aQd/QqNvdLt2olF/7a0kKTi0zFdcT+g1svxtXGnWjC5/oVtb1YgLMulZ3FrAY7Uv
 IKfFo1oUSpQY6Zabca71/9/deDEoMQFzXyh9A=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=4mdfjNHXs+ZmKw
 yGt4EJFCxDDes=; b=cUtJmYv353nOeYrEPbS1yPfzIsru7bf2pL/JQH4+/Oa2oZ
 Cps0lIQV+k8zu55avO1oKEvGaXMft6ypzakFlqI1nIXCc2UOR2lWuEtJxYc7bXz+
 w6REUdtm0kg7KlzPC9VJ+TzLGZ9ICO8Y83BK+0wIdPsEQJkKGVZJDk/AHiLyo=
X-ME-Sender: <xms:lt8bWHoifnVFKiYCeArnziZTRny5XBOQ925bTXTxFJf67Ak3AcOJbA>
X-Sasl-enc: J0xno5Bu+aDRU0SBa/+SGK8oNQJLR6rjylQhylj2vTyW 1478221715
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8887CC0C3;
 Thu,  3 Nov 2016 21:08:34 -0400 (EDT)
Message-ID: <1478221709.27396.39.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v2 1/1] pinctrl: aspeed: Enable ASPEED
 pinctrl driver to modify SPI1 strap bits
From: Andrew Jeffery <andrew@aj.id.au>
To: Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Fri, 04 Nov 2016 11:38:29 +1030
In-Reply-To: <1478195018-132099-2-git-send-email-kunyi@google.com>
References: <1478195018-132099-1-git-send-email-kunyi@google.com>
 <1478195018-132099-2-git-send-email-kunyi@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FxfrBsyVA64h3Szc9UiD"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Fri, 04 Nov 2016 01:08:40 -0000


--=-FxfrBsyVA64h3Szc9UiD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-11-03 at 10:43 -0700, Kun Yi wrote:
> Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only.
> Changing SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1.
>=20
> Signed-off-by: Kun Yi <kunyi@google.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Joel: So lets drop your patches to the board file and apply this. We
can switch the devicetrees over to pinctrl_spi1_default later.

Cheers,

Andrew

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A02 +-
> =C2=A02 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index 21ef195..ce1399d 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -16,6 +16,8 @@
> =C2=A0
> =C2=A0const char *const aspeed_pinmux_ips[] =3D { "SCU", "SIO", "GFX", "L=
PC" };
> =C2=A0
> +#define SPI1_REG_MASK=C2=A0=C2=A0=C2=A00x3000
> +
> =C2=A0int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> =C2=A0{
> =C2=A0	struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pctl=
dev);
> @@ -178,6 +180,7 @@ static bool aspeed_sig_expr_eval(const struct aspeed_=
sig_expr *expr,
> =C2=A0 *
> =C2=A0 * @return true if the expression is configured as requested, false=
 otherwise
> =C2=A0 */
> +
> =C2=A0static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
> =C2=A0				bool enable, struct regmap *map)
> =C2=A0{
> @@ -197,15 +200,30 @@ static bool aspeed_sig_expr_set(const struct aspeed=
_sig_expr *expr,
> =C2=A0
> =C2=A0		/*
> =C2=A0		=C2=A0* Strap registers are configured in hardware or by early-bo=
ot
> -		=C2=A0* firmware. Treat them as read-only despite that we can write
> +		=C2=A0* firmware. With the exception of SPI1 interface bits, treat
> +		=C2=A0* them as read-only despite that we can write
> =C2=A0		=C2=A0* them. This may mean that certain functions cannot be
> =C2=A0		=C2=A0* deconfigured and is the reason we re-evaluate after writi=
ng
> =C2=A0		=C2=A0* all descriptor bits.
> =C2=A0		=C2=A0*/
> -		if (is_scu && (offset =3D=3D HW_STRAP1 || offset =3D=3D HW_STRAP2))
> +		if (is_scu && (offset =3D=3D HW_STRAP2 ||
> +			offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
> =C2=A0			continue;
> =C2=A0
> =C2=A0		/*
> +		=C2=A0* HW_STRAP1 bits can only be set to 0 by writing 1 into
> +		=C2=A0* bits of same offset in SCU7C. To configure different SPI1
> +		=C2=A0* modes, we write 1 to SCU7C[13:12] to clear SPI1 mask to make
> +		=C2=A0* sure later write to strap register can take effect.
> +		=C2=A0*/
> +		if (is_scu && offset =3D=3D HW_STRAP1 &&
> +		=C2=A0=C2=A0=C2=A0=C2=A0(desc->mask & SPI1_REG_MASK)) {
> +			ret =3D regmap_write(map, HW_STRAP1_CLEAR, desc->mask);
> +			if (ret)
> +				return false;
> +		};
> +
> +		/*
> =C2=A0		=C2=A0* Sometimes we need help from IP outside the SCU to activat=
e a
> =C2=A0		=C2=A0* mux request. Report that we need its cooperation.
> =C2=A0		=C2=A0*/
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/as=
peed/pinctrl-aspeed.h
> index 68315a8..602b260 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -255,6 +255,7 @@
> =C2=A0#define SCU3C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x3C /* System Reset Control/Status Register */
> =C2=A0#define SCU48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x48 /* MAC Interface Clock Delay Setting */
> =C2=A0#define HW_STRAP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x70 /* =
AST2400 strapping is 33 bits, is split */
> +#define HW_STRAP1_CLEAR 0x7C /* Bits written 1 to are cleared from HW_ST=
RAP1 */
> =C2=A0#define SCU80=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x80 /* Multi-function Pin Control #1 */
> =C2=A0#define SCU84=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x84 /* Multi-function Pin Control #2 */
> =C2=A0#define SCU88=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x88 /* Multi-function Pin Control #3 */
> @@ -580,5 +581,4 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pc=
tldev,
> =C2=A0int aspeed_pinctrl_probe(struct platform_device *pdev,
> =C2=A0		struct pinctrl_desc *pdesc,
> =C2=A0		struct aspeed_pinctrl_data *pdata);
> -
> =C2=A0#endif /* PINCTRL_ASPEED */
--=-FxfrBsyVA64h3Szc9UiD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG9+NAAoJEJ0dnzgO5LT5fNMQALFXYg1WLsh5CjYxcZVh4SW9
MP8tDBl5bcRcl7cKFvWN9HSEEbm+WVdJaMlh7abhi5RLHYr7o5Jw8dMBRHkT6pJI
J8kTcp8BU3CQUjqD/KrxQw+0O+4zEFiShRCba/fr4Ezt9IdQ6p8MdHRznjgKPRW9
vzp8P2ifOV00o009sr23/U52hvYNK+qQgeD3SDXI2Z3zMLrWijn0ArYWexpOhvpe
FACu86W2PVYTijfIW1ZJzR+EF8dAfYN4cfgnFn+g2AakK+fikHP4S9Q/PUxPgQQD
qZwTiTXbqW+I4XBamGM+rI/buRwf95sk06aU655nfBjnKaBp2Tv9l8lyUvZdPaKH
NJkbs7JCi+BSbeQaaJaJt2k7Whul9V9681eOZSo0Mwydvd9fMN0Kba/J9cTQ2E9f
aHachOY56YlANxvE4LMbgo27EAuYxg4Txuchp9VCFt6hprcFIXetlofqg/YiBxb8
Pi9WG7rU6amK7cNG+j7VsziXw822tl6nKtdnIHESKkKefH38xqyewZ3KAyVdVbXV
BY33AGIfwvYuk+UTGEd17favyLoMif5FDW2BszGW+dt/ERaYyvzKgPB7Erl2my1s
ecbMhGrCfFpQXDU9sgcVE3zFmM4Nh5wURSoeeg63gEy4tZSeqOz722zzsFZrSw2U
jSg9qQYhG9wmHHRwLj51
=pOcC
-----END PGP SIGNATURE-----

--=-FxfrBsyVA64h3Szc9UiD--
