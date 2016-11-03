Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8SCr1mqgzDvNn
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 12:33:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=W1Gakme0; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=kt6kEniU; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D39820BC7;
 Wed,  2 Nov 2016 21:33:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 02 Nov 2016 21:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 R/jFrREV1GjtfVJiYkeEJdqH94k=; b=W1Gakme0NpZ/+8DbHIacKLzCW64G/NLs
 1UHzJAcf+/xlp5hdtK25EhO1Y8+QJkfWf6qjo2z/hSDvXaitavr0gbhSKL2xNCfw
 hTgXh8MQh0tXFC+JBVjJOwLtIDNxo26FdXGdffDPjosoe8z7huqp746URoB8h0mg
 pHXxciA54d8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:date:in-reply-to:references:content-type:mime-version;
 s=smtpout; bh=R/jFrREV1GjtfVJiYkeEJdqH94k=; b=kt6kEniU4l726lpxS
 HgIFYrTQzG5dxylf763uDgrOZABrOOxHHP33g/NrSk63y6RLSeSqL/zZBw9hxSxC
 dnAHFqRtHUJPUx+8KyhRIprBKMoNnDMj+hi3jR3lQAEdBgjKSzazouSr6Zu5Rl97
 wcRBqjRj3siuztQySGU5XDpA0s=
X-ME-Sender: <xms:45MaWA8ObTxjuYnvDGaPsXLTSxY4dnYbGTh6q-F1-s9gHjJpBXiCrg>
X-Sasl-enc: +U8PZ3oKvGer+G+buGxh5AoPygHpTDxXGzUIPZRrAMHO 1478136801
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A02A4CCF2E;
 Wed,  2 Nov 2016 21:33:19 -0400 (EDT)
Message-ID: <1478136791.27396.19.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v1 1/1] pinctrl: aspeed: Enable ASPEED
 pinctrl driver to modify SPI1 strap bits
From: Andrew Jeffery <andrew@aj.id.au>
To: Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Thu, 03 Nov 2016 12:03:11 +1030
In-Reply-To: <1478126380-3189-2-git-send-email-kunyi@google.com>
References: <1478126380-3189-1-git-send-email-kunyi@google.com>
 <1478126380-3189-2-git-send-email-kunyi@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-p4vQCUPzglJ1rWdwH10U"
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
X-List-Received-Date: Thu, 03 Nov 2016 01:33:29 -0000


--=-p4vQCUPzglJ1rWdwH10U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kun,

On Wed, 2016-11-02 at 15:39 -0700, Kun Yi wrote:
> Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only. Changi=
ng
> SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1, and keep
> other strap bits as read-only.
>=20
> Note: with this change devicetree default pinctrl settings for spi1 will
> effectively override any previous mode set by physical strapping or
> aspeed.c when Aspeed smc driver is probed.
>=20
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A02 +-
> =C2=A02 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index 21ef195..c647503 100644
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
> +			offset =3D=3D HW_STRAP1 && desc->mask !=3D SPI1_REG_MASK))

Maybe the mask comparison would be safer by rewriting as:


> +		if (is_scu && (offset =3D=3D HW_STRAP2 ||
> +			offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))

That way if (for whatever reason) we change the approach used in the
-g4 and -g5 implementations we still get the expected outcome.


> =C2=A0			continue;
> =C2=A0
> =C2=A0		/*
> +		=C2=A0* HW_STRAP1 bits can only be set to 0 by writing 1 into
> +		=C2=A0* bits of same offset in SCU7C. To configure different SPI1
> +		=C2=A0* modes, we write 1 to SCU7C[13:12] to clear SPI1 mask to make
> +		=C2=A0* sure later write to strap register can take effect.
> +		=C2=A0*/
> +		if (is_scu && offset =3D=3D HW_STRAP1 &&
> +		=C2=A0=C2=A0=C2=A0=C2=A0desc->mask =3D=3D SPI1_REG_MASK) {
> +			ret =3D regmap_write(map, HW_STRAP1_RESET, desc->mask);
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
> index 68315a8..46ba16d 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -268,6 +268,7 @@
> =C2=A0#define HW_STRAP2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xD0 /* =
Strapping */
> =C2=A0
> =C2=A0#define SIORD30		SIG_DESC_TO_REG(ASPEED_IP_SIO, 0x30)
> +#define HW_STRAP1_RESET	SIG_DESC_TO_REG(ASPEED_IP_SCU, 0x7C)

Maybe HW_STRAP1_CLEAR would be ... clearer? Also in this case the
SIG_DESC_TO_REG() macro is not entirely necessary as we're talking
about the SCU, but being explicit is good. As a note the macro(s) have
gone away in the v2 of the series I've recently sent upstream due to
feedback from the maintainer:

https://www.spinics.net/lists/arm-kernel/msg540082.html

Otherwise this looks good to me. Thanks for looking at the problem!

Andrew

> =C2=A0
> =C2=A0 /**
> =C2=A0=C2=A0=C2=A0* A signal descriptor, which describes the register, bi=
ts and the
> @@ -580,5 +581,4 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pc=
tldev,
> =C2=A0int aspeed_pinctrl_probe(struct platform_device *pdev,
> =C2=A0		struct pinctrl_desc *pdesc,
> =C2=A0		struct aspeed_pinctrl_data *pdata);
> -
> =C2=A0#endif /* PINCTRL_ASPEED */
--=-p4vQCUPzglJ1rWdwH10U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAABCgAGBQJYGpPYAAoJEJ0dnzgO5LT5Bi8P+NHMgFUj4S6Vgq1jo18c+qkN
/GwemEJW98Jvn+TG3HFgq4VUAM+BSE3MUmZcuF4SbbUjPriX607qBqeKbX+izhC7
IctC4u+ni84XZzviOsvE1qcz9FafBM3UXeUMtXV3Xqdv8/S2gpfUs2dlnfztKuQE
nhi3VPaD8DbkB3h0ZbPOKlycuNaXkKtq+X9ukrBUP9ddqvMkF+gAKwuRxl+mQaZI
+4G7a9boigTFo2fI8U1HGepy17l8kqG4E9/JqQxIUV+fJ1AWj+lqz1Tzh7blVz9s
fV+iLj311DBHa5ENa6zctgpP7nn2HAB0D69R6eLY8DJcgy4nlJoTjti1AZJ3k33e
mlaG0hEaUy9tZEHt7cLTTlOWXpPI/bAK7BZtfNlgvv9rVuWJMeDRBl34iaMne1vV
b+z3nJL7LOArbPqfSVXsHq9BHAoBEmXrnywfUO9iuVOV7GmvBMwe0NjwROPM/Q++
X+kFLnZnBggJkFza0XDbGv2RQsNDH3z6tBgtZIy4YgvEkXlokh3RBNQismuXMcJL
XFgxgcw1wIN6guk2QiJcUg4ROmuWFJ2C/nzeV4k/QP5DIzsKdpGReGlht3Mr45Zz
iP3rx+uWLjS+GfkzjovffZJ0ZHjVg5+3cyudchmxJarHyDmSgqY+WEqKBQSooFC9
tZvIdvbPlVwLlU3w3qc=
=uBOU
-----END PGP SIGNATURE-----

--=-p4vQCUPzglJ1rWdwH10U--
