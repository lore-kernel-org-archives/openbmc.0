Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyC1H2v7mzDqM6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 11:04:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Bb4AaGlL"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eo3LzWBQ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B796321AA7;
 Mon,  9 Jan 2017 19:03:58 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Jan 2017 19:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=6ADw3doJ4iPQVBlpdsLB/l5EjlU=; b=Bb4AaG
 lL/jJs+SXvb+2pB5blGmYoRLiGoIHJwqN4wu1Z3QlYXi90hb74JkCHhb6XJNkBeS
 FnRhklG0dYqkVc69c+i6d7sh1VEhGH6U2/Bjvs8nmzIoAyS5fW+YmMz5OoWhgNRc
 yyMGbjIbPpGKgiKOBlqLRsKEP/k+6P8PVSaQc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=6ADw3doJ4iPQVB
 lpdsLB/l5EjlU=; b=eo3LzWBQb++OXrRRbkA21SGlL1BufKyS4/4GYVAdEzEfGT
 VjZGs5smuJ1O9wpoYdeJ13qsw2xTW8MKJoYITlghg5QlskCECLuFMr5N/sCTYPHH
 +jPlS0AdiUhAxQYdvcboL6ER/p3JRUksVsh+rNfmSkKysmOsNiHr4uHf8TgAk=
X-ME-Sender: <xms:7iR0WMWDUiLXtjyi82dn4nM1DCo1vjKCg2cDKrK7EZ_0l4EWo5I7Vg>
X-Sasl-enc: jxAS50/qnfYvptgY4x6/DB79+eLOkhvhQg1DpbcP2KpQ 1484006637
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id C04277E397;
 Mon,  9 Jan 2017 19:03:56 -0500 (EST)
Message-ID: <1484006630.12800.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 0/4] SuperIO and Host Interface Controllers
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>, Cyril
 Bur <cyrilbur@gmail.com>
Date: Tue, 10 Jan 2017 10:33:50 +1030
In-Reply-To: <CAPH-5w7O7+65OWEWARC7ihwhoPnqBRe8z_4R3KWRS-nNHsBw-w@mail.gmail.com>
References: <20161110013556.8542-1-andrew@aj.id.au>
 <CAPH-5w7O7+65OWEWARC7ihwhoPnqBRe8z_4R3KWRS-nNHsBw-w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-TPomEmpIODUnFeF0P8qW"
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
X-List-Received-Date: Tue, 10 Jan 2017 00:04:04 -0000


--=-TPomEmpIODUnFeF0P8qW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xo,

On Mon, 2017-01-09 at 15:11 -0800, Xo Wang wrote:
> Hi folks,
>=20
> > On Wed, Nov 9, 2016 at 5:35 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Hello,
> >=20
> > This series adds some sysfs drivers exposing parts of the LPC controlle=
r. The
> > patches are pretty bare-bones in that they provide zero sanity checking=
 and
> > leave decisions entirely to userspace. They're also slightly tedious, s=
o I
> > expect (hope) their current form will be short-lived.
> >=20
> > Cheers,
> >=20
> > Andrew
> >=20
> > Andrew Jeffery (4):
> > =C2=A0 misc: Expose Aspeed SuperIO scratch registers (SCRxSIO)
> > =C2=A0 misc: Add partial Aspeed LPC Host Interface Control (HIC) driver
> > =C2=A0 arm: aspeed: dt: Add SuperIO scratch register nodes
> > =C2=A0 arm: aspeed: dt: Add LPC Host Interface Controller nodes
> >=20
> > =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi |=C2=A0=C2=A010 ++
> > =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi |=C2=A0=C2=A010 ++
> > =C2=A0drivers/misc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A014 +++
> > =C2=A0drivers/misc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +
> > =C2=A0drivers/misc/aspeed-hic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 198 +++++++++++++++++++++++++++++++++++++++
> > =C2=A0drivers/misc/aspeed-scrsio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 141 +=
+++++++++++++++++++++++++++
> > =C2=A06 files changed, 375 insertions(+)
> > =C2=A0create mode 100644 drivers/misc/aspeed-hic.c
> > =C2=A0create mode 100644 drivers/misc/aspeed-scrsio.c
> >=20
> > --
> > 2.9.3
> >=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>=20
> I noticed that this driver wasn't merged. Was there a change of plan
> to how LPC controller functionality should be exported?
>=20
> This is still useful for us to set up memboot and to listen for port
> 80 post codes.

Cyril has reworked the HICR parts of the memboot function here:

https://lists.ozlabs.org/pipermail/openbmc/2016-December/006089.html

It would be good to get your feedback the approach. Cyril is going to
send out another revision shortly and will Cc you.

As for the post codes these patches didn't expose the PCCRs in sysfs -
have you modified them?

Regardless, given Cyril now has a better approach for the LPC Host
Interface Controller we should probably rethink the approach for
SuperIO scratch registers and PCCRs. These patches were always just
hacks and Joel had to pushed me to send them out.

Andrew
--=-TPomEmpIODUnFeF0P8qW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIbBAABCgAGBQJYdCTnAAoJEJ0dnzgO5LT5h+gP92Kmc6j5U/flbRVENERLxkbf
YdGiceqCCRogzAdxss4so0LS3cfRUoremv4mrLtRuUDypoPfenjGGuU4cmYumY+n
CGGUg3D+1EnKGU0KDmhDcSIlQn0TGuYdJ6Smq/mcgNHKX/EiE/Jtii+/yf15Vfvp
gIq2WHwPMm9W07njc0Tg5YZ1N6pykKu6V1y09T7Hro6bu1LYAjnpxbRp9gr+5T8+
SBAVSaMqDBz1kqof6XES1RN6SPKhlnzt5r9m3nzyexPA3YeLLDnA54U70+AgoBPi
sUL9Jcm3e9+Xj88hZPZbagAw9kOMxIPdty8crdzCn5SC3JbCIMohb+WzsqlMybiH
bLZtxxNmvlTpKIUuJmAcDZcyI+Qd9hgp+XY8c/xX3sAKeuaBgwc+aJ4QItQ/Jfpc
fuBlMoeWOK4+pN3cIeMnGRHTLrBglLdiHWwO5wVxtskfF9+B9h7DQZJW/I13hY7t
dTiWcT/9nqNb094lT8cxFWEPWWD3KzWk9FiHbZJM+xZ0SZ4FK1G7j3YXp+v8HGnf
VciUqTEAlQd5ID9+mNP700Kd4Ps/pMFsvs4aUGy43OD8M3EqOnYfQSVyBbby0s/2
Rp8hX6aXCYyZLasAsJITT4/kXj5xEiF4OxI4ldCq60ng+Vy+ea3DJv3T0+TQg6D5
gWYjUcHTdQbbgcNoVo4=
=hSWS
-----END PGP SIGNATURE-----

--=-TPomEmpIODUnFeF0P8qW--
