Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0RVw4DskzDvYW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=IWzvwVY7; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=uYlQkLd6; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 35CED206D9;
 Thu, 20 Oct 2016 20:33:42 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 20 Oct 2016 20:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=AJC2c
 WVO2QYjaBTTsulG2eCbW3o=; b=IWzvwVY7Xuq5wzsVUBIZQ1/AGN3BEEgtAxALe
 TLBmMMWu1JPY0GorAwZ8Rz+ckjN4UHkpy6SdRaTkLAKMAWZGSfe1Bzcq2u7J9q+W
 HPSLF82dCtTsi9urh4gi0DTm+Fjlr/dd6/lwgSUhtNo6M0YR6kDyYAefCwHYeNgA
 qIb77k=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=AJC2cWVO2QYjaBTTsulG2eCbW3o=; b=uYlQk
 Ld6f+DLegcr5QUnhZWB4jSAgCJWhD7AwUstSBeRRUDIl+0ZrdvCEg/BrB50Om0s2
 dkxzBuHTJyjX+xBHGZZqPyy/jo/YIseaJ5d0AB+Iwcs19X77fA2Aq7+pQFqDH0r6
 WLXow+NZ7Mqo2/xwTRwShQHLIw2zjit7ckDGwo=
X-Sasl-enc: x/a+iYleTD0GAEwHeC0NMQNrxujhPXfb0/9/thXBr6zn 1477010021
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3EF8CF29CC;
 Thu, 20 Oct 2016 20:33:37 -0400 (EDT)
Message-ID: <1477010011.8917.20.camel@aj.id.au>
Subject: Re: [PATCH 6/8] pinctrl: aspeed-g4: Capture SuperIO pinmux dependency
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, openbmc@lists.ozlabs.org
Date: Fri, 21 Oct 2016 11:03:31 +1030
In-Reply-To: <CACRpkdYLDesENtq2cQBrWQeL6NH+mO_N5Z=e9=gsoZSCE85Jag@mail.gmail.com>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <b5f67ba76018314d08e240f95951751896687d37.1474986045.git-series.andrew@aj.id.au>
 <CACRpkdYLDesENtq2cQBrWQeL6NH+mO_N5Z=e9=gsoZSCE85Jag@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-oPinsIUqauI0jUa3FU3U"
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
X-List-Received-Date: Fri, 21 Oct 2016 00:33:45 -0000


--=-oPinsIUqauI0jUa3FU3U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 2016-10-20 at 13:53 +0200, Linus Walleij wrote:
> On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
>=20
> >=20
> > Two LPC-related signals in the AST2400 depend on state in the
> > SuperIO IP
> > block. Use the recently added infrastructure to capture this
> > relationship.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Patch applied for v4.10.
> (Tell me if I'm applying patches in wrong order or something, and
> I hope this doesn't clash with the fixes.)

Both this patch and 8/8 functionally depend on 5/8. I fetched the
pinctrl tree to poke around but this patch didn't appear in any of the
updated branches, so I'm not sure whether we have the right ordering.
Without it we should hit build failures from missing macro definitions.

Have you had a chance to look over patch 5/8? Joel wasn't keen on its
current form, so I would appreciate your input.

Cheers,

Andrew

>=20
> Yours,
> Linus Walleij
--=-oPinsIUqauI0jUa3FU3U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYCWJbAAoJEJ0dnzgO5LT55JIQAK2eix0Pvp1JBTEIZwRO8nRh
20y6FgW1A42yyaBrEzdLDA8XqOA7qWxvyw3ZQo/AK/6bKZVvHwtF2/xKbONENJ1y
mjhTsbYeJ7d32EAOzn+Qy0/3UFke3oZfxqRmPBL/O/qzKkMjQCl8C0YEP48T+WG1
vl517qskOW5x5aVdyyRQVHs8IeznLsLzHAPwnvIULycJYmp+7U/49DYiFvaDpwht
Dw3gep8zdwvmMScsHGCaGJHAchIjQzVCX4fNHEGO0RyFoOwHZkBU/++NjnQlz4Ou
wxzPgK3bZe7RwARVMwz0uBrQ0zxaSjiHA6RtwJWjpJWtnN5W6rY+CS7yS2Rp7XCW
gnb/Q5kUIGtgiFcXnfPQGFiAcEGUbSiDIIT0iZAxUqk/zTlWnzFoJu90FZ/In1G/
+4RNgngzMU9taJm7F0rJ1RNcEScRjSdpqf4IBEGojE6X8shraydmnI3pAR0/aKHa
DmS8bt5cTJmw6C0HD5Rwyq9fqgkdG09ZwsiNGhStIlwrUY8uYinpBPuue343ce0Z
3F/lBHSL3rSLUX8a8NqrFYA7iH4d0zWK/MLzQi5kGIIkY58W87NW1KTWFCpttK+n
B7HEgoL0LCCY9Flpa9F3XE4q+WX0SC8TgdBpdEHG4gVYkLNqto3VdIttLxE6xffY
n8hHPig+lH0tcuxOfBfz
=r6q5
-----END PGP SIGNATURE-----

--=-oPinsIUqauI0jUa3FU3U--
