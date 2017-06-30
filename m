Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzQWp28ywzDr5y
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 15:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Cc21B1B1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TkkswqAS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 95D12204E8;
 Fri, 30 Jun 2017 01:46:43 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 30 Jun 2017 01:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=9EYwCCVPdedJy6F/Drd3hkN0Q0PxdQMt/aYzIksbU
 6s=; b=Cc21B1B1eas3zM2tS/GxJzefmT4XlmAU1Pxd2bGP2+KaWAP0BT2iKX4ah
 xI+gfEZBXrE2hGTvcZPkADQkFfuDV5cBk0XpEpyOJ3yhbgO+p06cAq0OAUDfVpT7
 jCxYvWu9hYu2gO6veOpfvt3Y3MNmbvIAiCKFI6dCz1DVfJ9ox7Zy2nasdnSuTxQy
 ReH3IFWQExQrBa4+FlmUo8d/kb2JGJOsbMImD6lQpZINYfhls8ObBXxFAdE3bEni
 dNrz6VSP/wQVe3x1shUPgasTX4O14E3BBK805JPENqwL6c/VHuA5IsuKG9upvArc
 7NN/7BS/2AwwQotVy5FfkfPuFEs6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=9EYwCCVPdedJy6F/Dr
 d3hkN0Q0PxdQMt/aYzIksbU6s=; b=TkkswqASdymp4xtrNL8Pv9+21ppxBde30o
 jpZsk6w2AehGhZqn7jBQvxafSfsnul1KQuwKjzea7yZysYW5dUSyy/TzcTQ9CWm2
 d5dRVCtYUlqjjQoqj3wSJO+9872er7DVwlxx/wOD46ISADbMrsdK8uexOR7qbsdV
 aFeIYgpCQIGFNOw+p0foSmF5CrhBiHMMrSKJk0SlEYhm8dGMzqkHLuBkXeUixGal
 c7GvJ9X8DWP3d2+INz8ALaffmO1cy5m3lq22u6jHKzbRBJHqjy78rCpHJnwulNTk
 i5Qn1GljB92M0WoxAwIH972M7s+n+OZ5DNUiZBEFzSHZJlEfgx1w==
X-ME-Sender: <xms:w-VVWfiVabyDTNdP_WRoNgjGExwjQz-GYm6gVzby8vb-VP6kG9dPWg>
X-Sasl-enc: FbtbF9AAOGWNRlku4JtI6c/YKjp0Gay6gCkatBUzWk2T 1498801602
Received: from keelia (ppp118-210-130-225.bras1.adl6.internode.on.net
 [118.210.130.225])
 by mail.messagingengine.com (Postfix) with ESMTPA id BCA8A7E070;
 Fri, 30 Jun 2017 01:46:41 -0400 (EDT)
Message-ID: <1498801595.5203.19.camel@aj.id.au>
Subject: Re: [PATCH] ARM: aspeed: palmetto: Deconflict FSI trans line and
 hog of GPIOH6
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, spotthur@in.ibm.com
Date: Fri, 30 Jun 2017 15:16:35 +0930
In-Reply-To: <20170630054302.20162-1-andrew@aj.id.au>
References: <20170630054302.20162-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-j888GLWsc0lGGm30BEH0"
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
X-List-Received-Date: Fri, 30 Jun 2017 05:46:46 -0000


--=-j888GLWsc0lGGm30BEH0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Whoops, I missed adding "linux dev-4.10" in the subject prefix, but
hopefully there's enough context :)

On Fri, 2017-06-30 at 15:13 +0930, Andrew Jeffery wrote:
> The hogs are left-overs from the Bad Old Days of Palmetto development.
> The specification of the trans GPIO for fsi-master-gpio conflicted with
> one of the hogs.
>=20
> Remove the hog to allow fsi-master-gpio to allocate the GPIO.
>=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 7 -------
> =C2=A01 file changed, 7 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index f7a7cbf77aba..a171e41790c1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -295,13 +295,6 @@
> > =C2=A0		line-name =3D "SYS_PWROK_BMC";
> > =C2=A0	};
> =C2=A0
> > -	pin_gpio_h6 {
> > -		gpio-hog;
> > -		gpios =3D <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> > -		output-high;
> > -		line-name =3D "SCM1_FSI0_DATA_EN";
> > -	};
> -
> > =C2=A0	pin_gpio_h7 {
> > =C2=A0		gpio-hog;
> > =C2=A0		gpios =3D <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
--=-j888GLWsc0lGGm30BEH0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZVeW7AAoJEJ0dnzgO5LT5RZgP/1E/uKKjokUDYuPPFkzdrWUq
Z7kOXNavVmuNZtHdgUhE/H947yEBT/Jnp5PqRoQkCIccbHJfdsuPAGjA23wfzdp2
63XOUm+GTc1sKotNvjB1vzq0PvLOSoDwvYpowpUAqzPXFpgraFGliarPsfb3TZge
tiwc/P93wYxNOr14XFErSB/UD3sa6nbaE1BCTsphdAnmqJ3zboxJuoPz4xfm7xqw
RFs6AAtlfsHJu2BdawHIbBq+XojNQQJD/GxwAvgk+YxlfNs1vns42s9/OBZuWpJr
YJJgR+kvqhXI2Lx3RWF7ZHeLoTHyoCpkIpZaEQzgQLOVg/9MLKh8iPSxRFfxtyWQ
Khph9X99fQTV4oIbNqjsRC7vqhRBHhG2npJnMWC5+3U1dwMLRDkpFNZvaHfpMDRS
8veK3xqB+hlJoNQ6NjPxrtJPN54h4ZH594c0Ek3RWMsUgr17ROfMidRwPe7cIoHR
9Z8//RtusPnp5uvjg5ZRkCgHVpl28hUt2Dlmm4dxol2xNpIOStkluky9m7cHrCca
vZIJ8rj01vBnQJDWDo2OcxvjOOoO1Cko6qe4nGBhWWy/g7Tzef2T/3UFwvSMmtxa
e9+eorK0PeYUt+5cFQaHwaQ/Wi+QdMdswkowujraD0Wq4lhRPZoF7mVLd/lrkTF7
0p88AGkDfa8p8NbfyS+F
=pWvk
-----END PGP SIGNATURE-----

--=-j888GLWsc0lGGm30BEH0--
