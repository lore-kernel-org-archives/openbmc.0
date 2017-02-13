Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMhdk3Y6PzDq8t
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 10:31:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZKeeV5Af"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JgUhnr/2"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1AB1C2074E;
 Mon, 13 Feb 2017 18:31:36 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 13 Feb 2017 18:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=6uaTFTtLNiaVv6dpjBbPHKVzPAU=; b=ZKeeV5
 AfyvgKLHrZ1Tqokdj0iv64VlEGxOBSvusLCliXOulvaNpJgI9VISW09WhscE7QaE
 jdDBCaWBtFtsxcp7ovehz6Qun4QACC97/FXfatLZQK6WwQdmxur2RYZKtqJU6uYw
 z9uBTI+iAuVSX5VqVNQZ6/eHqjo84mz1qm918=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=6uaTFTtLNiaVv6
 dpjBbPHKVzPAU=; b=JgUhnr/2w/KkCAE8C4PzwUEhywDHWkIIn4U5x0VEPVfYap
 wAXSNeGHswcyKNYHUUIqsNKih6DT0Jb9zalQW7bpFKchgCSeOQloqGfcVcfFwGNv
 qbNYmEbTQ4FsR7ADQvfBB9d6FS414w1hMoUVKdrCNTsQOZjgTaxQTLGOJRG6Y=
X-ME-Sender: <xms:2EGiWIo9p4cRxUhiIvD5FwzAOcSEpySWd1mHVIoQN6B3kidfQr_rBQ>
X-Sasl-enc: lWYK08L3qzHM8OSihQrkBM79Kf2sLnWefISdzqPIersD 1487028695
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02F1524354;
 Mon, 13 Feb 2017 18:31:33 -0500 (EST)
Message-ID: <1487028687.3661.28.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Date: Tue, 14 Feb 2017 10:01:27 +1030
In-Reply-To: <CACPK8XetG6q3OLLMVOAhJVyL5jrm0JnOO1d8JwFAtJg+MicKxA@mail.gmail.com>
References: <20170213025851.6051-1-andrew@aj.id.au>
 <20170213025851.6051-2-andrew@aj.id.au>
 <20170213172440.lrqaf5v7jk66denq@asimov>
 <CACPK8XetG6q3OLLMVOAhJVyL5jrm0JnOO1d8JwFAtJg+MicKxA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4N+8WMTSUIWUfkaMDGdX"
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
X-List-Received-Date: Mon, 13 Feb 2017 23:31:39 -0000


--=-4N+8WMTSUIWUfkaMDGdX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-02-14 at 09:27 +1030, Joel Stanley wrote:
> > On Tue, Feb 14, 2017 at 3:54 AM, Patrick Williams <patrick@stwcx.xyz> w=
rote:
> > On Mon, Feb 13, 2017 at 01:28:49PM +1030, Andrew Jeffery wrote:
> > > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/asp=
eed-g5.dtsi
> > > index e1994c9e38c3..5ce0a7a65e77 100644
> > > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > > @@ -1005,6 +1005,12 @@
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x1e6e202c 0x4>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gfx: disp=
lay@1e6e6000 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "aspeed,ast2500-gfx", "sysc=
on";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <0x1e6e6000 0x1000>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg-io-width =3D <4>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > > +
> >=20
> > Is this valid to add on all G5 chips?=C2=A0=C2=A0I believe Zaius is usi=
ng a
> > variant of the 2500 that does not have the graphics engine.
>=20
> Andrew, do we need to fix this now? If so, can you please re-spin with
> this set to disabled, and enabling it in the .dts?

We should do that regardless. I'll resend. We should also fix that
upstream.

>=20
> How does this affect your pinmux driver?=20

I scanned the first two pages of the pinmux tables comparing the 2510
to the 2500: Many functions have been deleted for the 2510, but the
pinmux configuration remains the same. Further evidence for the
controller being the same is the 2510 claims to be pin compatible with
the 2500.

It appears that other chips are subsets of the 2500's functionality, so
in the easy case we just need a small mod to the bindings and to the
driver so we can selectively register phandles relevant to the hardware
(e.g. only the lhc phandle in the case of the 2520, which doesn't have
gfx).

If you want to make the driver more tedious but arguably more correct,
you could also advertise a restricted set of mux functions depending on
the matched compatible string. Given you need to know your hardware to
mux functions to begin with, I'd argue if you want to foot-gun by
muxing functions that don't exist in the SoC at hand, then go ahead.

> Can we still mux all of the
> pins on the 2510?

The way it works is you can enable deleted functions in the pinmux and
effectively disable the use of a pin as the function doesn't exist.
There shouldn't be any other side-effects.

>=20
> Cheers,
>=20
> Joel
--=-4N+8WMTSUIWUfkaMDGdX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYokHPAAoJEJ0dnzgO5LT5EUgP/3mOwJeB0zsK4p6uNgL+qApy
MjYMM82/rnirqsXV0qERrlI2sXRSb1Cdf1gStjWCyMMvJdUa09L23evRkxL8P5Ys
Awbr7lA9Oouu+UJLgQp6kgrRxCtiWoPv7LwJm085sw9MyCEt5UN5PHEz8wIaTQnt
lL+vednFph0zk7xUsmmdOTonEzdACc3FaWgdQZ4it+rfZx+Tcsa5mTln/M/+0oFI
reWB2ROEPqWy7LD0BO3eAT6wNZG+CBY+wEdvPBWRzQiW0VzRERKFSmNEGkj4SBP8
mHJq47tqhL95U/WkHh0Kcxqq/c913c6aknfP2RPz+nDRb0i1QQYc2NL8MJa8kdM+
Li62ZbTErsOT5P3K62bRTSFeEFL5n2zD55GSQ/lCa2ZcX4DnLfk1TUUsW1M4YT+L
iP5PXnWZZYTTHxhPa6nuv3TokYyRPd6ppAH/WdN+UJRZhtIABk8o8eVV2Guu4Uvz
ue+EUfOxFuq+WMQUNPVB2uHPL9AkFM2PmD6ChW2CBOqt+i4YJPyol7PPBnESxfDZ
wbYDSf1bi2hCwWGclalXdXDaTTVbH/1S1Fgmi545CdMwzgoAMKgC0W1hWfHDEcja
ZRqCnqyVCzEGVFQCatCxBUArn13e/UYgnSDXifmydNLWWtQk3IsbzCNN8iXLJyxM
M44f823C0ZAi6BKyuoDi
=/0iH
-----END PGP SIGNATURE-----

--=-4N+8WMTSUIWUfkaMDGdX--
