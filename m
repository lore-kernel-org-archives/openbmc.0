Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMdsH1LxPzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 08:26:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h1zF9jeI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cbeu6ONv"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BA30120945;
 Mon, 13 Feb 2017 16:26:23 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 13 Feb 2017 16:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=van0QCQ2wZL+xWgNbEqnL6sBAT4=; b=h1zF9j
 eItTZKok9UQpPVmxCFLbh22oVZmD66pl7qLZ1wXXQW6RnLFd7qobb4kVKvGxk4oP
 M0uAePTEUea/mch46LrEyoogg5AOVzsPbVO18ftrJXCe+yqgWXQK+iFV24UvxbMW
 /UVTXE+1oQ8bhn/AY54EMYjCqqYRnAysusv1k=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=van0QCQ2wZL+xW
 gNbEqnL6sBAT4=; b=cbeu6ONvAbGeqGFUYuhpFvPALQ61oYlXCeEJG7FNpmAmrL
 FLMfCeVAwlqVVWy8MFJfrl3ibEu453iyLJYJd52OU7nzdGRhluj3ZbqpCLFjZ9PI
 CDBLbWxzguxjae8SjsuZ2mGngZnmS/of6vC82rDEAa9Q2Q0Iw4PRw/beUS+Xo=
X-ME-Sender: <xms:fySiWOEtu6DyCr8yXigOzJf9GM0JNXIuknGsHxvVk6-hvHs2tlSC-A>
X-Sasl-enc: 2EnYyf0NN+OkgXbguLF+pKJiptXkILA7s4OBYo/nd0a1 1487021182
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A0DB7E050;
 Mon, 13 Feb 2017 16:26:20 -0500 (EST)
Message-ID: <1487021173.3661.24.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>,  Xo Wang <xow@google.com>
Date: Tue, 14 Feb 2017 07:56:13 +1030
In-Reply-To: <20170213172440.lrqaf5v7jk66denq@asimov>
References: <20170213025851.6051-1-andrew@aj.id.au>
 <20170213025851.6051-2-andrew@aj.id.au>
 <20170213172440.lrqaf5v7jk66denq@asimov>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-EW0eCwHZ7esQ3CtnzwBv"
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
X-List-Received-Date: Mon, 13 Feb 2017 21:26:28 -0000


--=-EW0eCwHZ7esQ3CtnzwBv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-02-13 at 11:24 -0600, Patrick Williams wrote:
> On Mon, Feb 13, 2017 at 01:28:49PM +1030, Andrew Jeffery wrote:
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspee=
d-g5.dtsi
> > index e1994c9e38c3..5ce0a7a65e77 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -1005,6 +1005,12 @@
> > > > =C2=A0				reg =3D <0x1e6e202c 0x4>;
> > > > =C2=A0			};
> > =C2=A0
> > > > > > +			gfx: display@1e6e6000 {
> > > > +				compatible =3D "aspeed,ast2500-gfx", "syscon";
> > > > +				reg =3D <0x1e6e6000 0x1000>;
> > > > +				reg-io-width =3D <4>;
> > > > +			};
> > +
>=20


>=C2=A0=C2=A0=C2=A0I believe Zaius is using a
> variant of the 2500 that does not have the graphics engine.

According to Rick, Zaius is using the AST2500 for the EVT but in the
future they will be looking at moving to a chip without the graphics
engine.

> Is this valid to add on all G5 chips?

Not on the AST2520 according to the marketing material[1]. I would
prefer to use the datasheet for the SoC as a reference though, and I
don't have an AST2520 datasheet.

The fix *should* just be a matter of a small change to the pinctrl
bindings, and we can do this when we come to support the AST2520.

Andrew

[1] https://www.aspeedtech.com/products.php?fPath=3D20&rId=3D456


>=20
--=-EW0eCwHZ7esQ3CtnzwBv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYoiR2AAoJEJ0dnzgO5LT5AKwP+QE0fubifN1JipgSE88kyKaC
oZGX27GYUHYiaKbSj2/GiCItPKxIlED3ShpGKIrk6IDwlS9y8bBR4MPGclccBplw
59fQsnxhAdt96ly3eeEkO/qMXJ9mFPC/nbk7RJxg27SlzFevRYuoAeggvQ0HNSFI
obckhSBwkHeSEEZn1Kr/UFdzl2HxC+c/YHMgFYYW00F6MwytKLfXHaF6DrG7xyJt
J/SjSd7u1w7wUuqdTNMCcXAvMaxDGL6g9Q7e7q4P5pX1jeDbS9otPIF2VsZXMUL1
fMj695S4IZYBqzZYKiY6YhZD5jdJB29REJbt65KL3v9uCtA3zCg9vo7G0ATLytrf
XzDL701JVtsE7t7jfB+2HlGx38sSVqM1teQ2o315zShl7+z1q9u07E8v387DpsQW
CUTcCFOGcePx6N40FVyzFvSKPWoZdDl81hvuc07jVHGBEttKPTcQdKLoc52+ic3I
Kstrcoi2qu1O2M9mhYiJLLIvCIhOzK4pO3lGAvxYAq4V6j3by5xqg7Mps+hkWkVe
oVTnr6+wiV5avaP7sVFR2f25dXBA8nR20kn0cd8HFBknbceEHTHBt98zNj1wuRMT
eu+9tyTHNW2ecmjBVWHK3f7vxDEKz92vfSRTvnWzJZP5ZUZ5BH4z2bjWArqsVbMj
BR+zHee+0sHacPmltgqZ
=0p5b
-----END PGP SIGNATURE-----

--=-EW0eCwHZ7esQ3CtnzwBv--
