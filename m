Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzJsB0bSQzDr5W
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 11:31:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Kj0qyvSz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hCZHZAJX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CC9F92094B;
 Thu, 29 Jun 2017 21:31:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 29 Jun 2017 21:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=wI6YTaQO7+jTleRRwPb/FHmvavAxGC50EpKq0tOi1
 x0=; b=Kj0qyvSzkRNXeA0D5Oc84h0g8OT/fJlJ/lN8y5VWcZYgSduybDsVxjK5d
 UhbPqaGmeH+SfIs31n1D79Me48x6QpEVw5LE5sHPiHZBT97F4sQsA07ATr8lTsZF
 DsSo+oE8cepTF6D1eNTGRF3bEHYOekerKjoPkUmN9o1BV9l674vMMWs6fgvxSKC3
 j1lZ/CtzvTI1m+lEarxbSFrsmIa74Uf5d8BO3FNWmEkGZnLserCaa+/s40SwTELo
 vop6qCc9VVSHq2KPL6XnI58GqG5to8+Pa84ryH3DmTYiGeBxXvux9XKydpmxEQXL
 dsio9DU6bi8qNNxRgKIWZZ2vYMQ9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=wI6YTaQO7+jTleRRwP
 b/FHmvavAxGC50EpKq0tOi1x0=; b=hCZHZAJXnPQRlWFgsAcIIuByhuXB3YD7cX
 SEB2zpn8lBgRJFIBxkelZNXX7ViNlt1F7w9AuBEIXn+g/lqt5tQQgia6E/Y2yX0x
 73hI71CSJN8VDpBfEUgRinoOZhqu0wG0hg5doLVkv2y6tVFi0kkBEq6ckT29c+Lt
 0Vg64CagzLP9XHsIWguoEzkylLVxk+YUwUso+Tjf0LC3iQ2W7rb+IG2vanFEo+zn
 1n+6O5BMMpRvOBhOqmrxZ0YgdFihwV6bGHYoKAP40amHr/gZL2d+LE9huhJfLSSa
 qPrdvD2Tv13tZFlROm+dTHNaZtvyl6cOpq01jBRATyUFDVj7T6MA==
X-ME-Sender: <xms:66lVWZsoheTG79d1WZgTubynM5IhMLEryoq-0mrgmwtQ2Z7RYr5gMw>
X-Sasl-enc: oopU01hJvppX+r01SQrPXtHowk78j7uDuFRalpdwRx9P 1498786282
Received: from keelia (ppp118-210-130-225.bras1.adl6.internode.on.net
 [118.210.130.225])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3F0424426;
 Thu, 29 Jun 2017 21:31:21 -0400 (EDT)
Message-ID: <1498786277.5203.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] aspeed: Set max gpio num.
From: Andrew Jeffery <andrew@aj.id.au>
To: Milton Miller II <miltonm@us.ibm.com>, Mykola Kostenok
 <c_mykolak@mellanox.com>
Cc: openbmc@lists.ozlabs.org
Date: Fri, 30 Jun 2017 11:01:17 +0930
In-Reply-To: <OFC401AD1C.D9F923CA-ON0025814E.007AD5AE-0025814F.000332A5@notes.na.collabserv.com>
References: <20170629133008.13045-1-c_mykolak@mellanox.com>
 <OFC401AD1C.D9F923CA-ON0025814E.007AD5AE-0025814F.000332A5@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gY0u/Y9/mwVAUB/FH8gj"
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
X-List-Received-Date: Fri, 30 Jun 2017 01:31:26 -0000


--=-gY0u/Y9/mwVAUB/FH8gj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-06-30 at 00:34 +0000, Milton Miller II wrote:
> On June 29 2017 at 8:31 in some time zone, Mykola Kostenok wrote:
> >=20
> > Set maximum number of gpio for ARCH_ASPEED.
> >=20
> > > > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 186c4c214e0a..9d373685c628 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -1492,6 +1492,7 @@ config ARCH_NR_GPIO
> > 	default 352 if ARCH_VT8500
> > 	default 288 if ARCH_ROCKCHIP
> > 	default 264 if MACH_H4700
> > > > +	default 232 if ARCH_ASPEED
> > 	default 0
> > 	help
> > 	=C2=A0=C2=A0Maximum number of GPIOs in the system.
>=20
>=20
> This is a bad idea.=C2=A0

I agree.

> =C2=A0This sets the maximum total number=C2=A0
> of gpios supported by the kernel, and setting it to this=C2=A0
> value would not allow any space for the various pca=C2=A0
> expanders to define additional gpios.
>=20
> The logic in asm-generic/gpio.h says if the CONFIG=C2=A0
> number is 0 use 512 else use the supplied value.
>=20
> I'm guessing this was motivated to make the gpio numbers=C2=A0
> match with the controller.

Right; what's missing is any mention of the motivation.

Mykola: What problem are you trying to solve with this patch? As Milton
mentions it might be making the GPIO numbers align with the controller,
but why do you need that? It should already be possible to describe the
system without this patch.

> =C2=A0=C2=A0Unfortunately the gpios from=C2=A0
> the device tree are assigned numbers from the end of=C2=A0
> the number space.
>=20
> If we need to assign a specific range, we should try=C2=A0
> to define an optional property in the gpio chip binding=C2=A0
> and assign the value to gpio-chip.base in gpio-aspeed.c,=C2=A0
> but I am doubtful that such a patch would be accepted=C2=A0
> upstream.=C2=A0=C2=A0

I tend to doubt it as well. Describing GPIOs in the devicetree always
uses the GPIO controller phandle for a base reference and the pin
numbers are mapped at runtime as required.

If it's a userspace problem, then there are means via sysfs and the
chardev API to discover which controller you're talking to (e.g. chip
labels, named gpios). Either of those approaches should suffice.

Cheers,

Andrew

>=20
> milton
>=20
--=-gY0u/Y9/mwVAUB/FH8gj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZVanlAAoJEJ0dnzgO5LT5OWcP/AzgFpWqXQKZzrR+e1ncWCmZ
Lfj+o9Ktu5LNPlo0VXNLhP7boaETu7h11H4Tlt4meUmWu7O1HFM+ZSqN9tr8L+kV
ecLIXtFE9XDNJQAhBHKIkbNwXXOnSGTD2S/FzhUFuvWuWapxwH/RoFshWlG2S5J5
6u4vyuJzdMcBpDCnUT2phaMNrx8ZNxvkwCGfOeBb3lZastJBtKhxXP0La2gZ2Kcg
cR4hg4c/IweaDwH6DKuxwvfb6o5vcvjEYHbiQLFJJQcFaG9WhngC/jsKCnxkTZDH
6q7Z9vZFXIddAvYgCRzpmuoV3rUkoTS6uKzZdWRQA41UbSWgzevom6lFyWefofOt
x+k/LKqdUohPBpR4ucPXKkKwsYdvRuvvxcrv/xnKskRGfSb23g2AZkko1MOYxT66
fECBkaekBGLJwZTXJYK0iimi3rE7YzguyjpEOeH6gWNsYFsgaxpA6AcfT6Od7IdN
OJnQ0Pf5toCmiQfZOHVk66n9vQn9/k7TOjvZSThT3KYHZsXxMIruHL/Aca/ULpJR
g9Ab5IVudmOtMZyzibBs9ALaxRi/oe0GC3JTVe/jbzJWObhP3GgM8awnbE1PtdkP
Aln8k9G4+YC4vKzXeOSm8vsfWhJEtq2ijMQl74ljlMC1yNWkImNx8PAnXZZ1OFOo
y/tA1p/MYQfl+hZYVuat
=GhW0
-----END PGP SIGNATURE-----

--=-gY0u/Y9/mwVAUB/FH8gj--
