Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6ZnX3rRXzDvW8
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 11:22:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=GE1URjhA; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=E071Ib46; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F6F020422;
 Sun, 30 Oct 2016 20:22:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Sun, 30 Oct 2016 20:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 ApEp65WhKhmIowypWHLkYwKU/Kk=; b=GE1URjhAsZ5NWf6HF1HK7UGp72Zv7454
 xOKakNHaVfvXcQtCRSJRKFX77L0zFkKWYDBoV80ynmzW1HkHiBPBIQazPm6m+0Kh
 N1qUJ3CuHUaIL2YL9/Gaeo8zaIHXgKmMnNHO3JV4/T+H8Cw5H5x1pE0xmjF6zL6W
 x34rEczSoz4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:cc:date:in-reply-to:references:content-type
 :mime-version; s=smtpout; bh=ApEp65WhKhmIowypWHLkYwKU/Kk=; b=E07
 1Ib469XYeSiKbczHXerCOo7CA7aH3+KjNGKBNPHzcO+kwjCo11LfdVUrYa3aYZj4
 RbEyzcjfidwY4ua54Qucigg2UNxdZxYfRwo646oy9/w82L502Qny6RkZw9t0n8zl
 lDSY9Dl3PxjXc6E1Ar7fz7Kg+7it+atowgkpQjfI=
X-ME-Sender: <xms:zo4WWNWGP4f0JZ4PLtn5bFbwC0omAqHUF2g-ItJoLVMyvPpm9KYxEg>
X-Sasl-enc: bme2rOca7S95/rLSPTj8MAecYm/YGoK8WkYhH1xYmzJh 1477873357
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A513F29CD;
 Sun, 30 Oct 2016 20:22:35 -0400 (EDT)
Message-ID: <1477873349.6373.202.camel@aj.id.au>
Subject: Re: [PATCH 0/3] Add QEMU support for the Epson rx8900 RTC
From: Andrew Jeffery <andrew@aj.id.au>
To: Alastair D'Silva <alastair@au1.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: clg@koad.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 31 Oct 2016 10:52:29 +1030
In-Reply-To: <1477542811.2176.93.camel@au1.ibm.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <CACPK8XdUpYOF_jgRhzwvUp=P7eemgYYgY7UJW-2TOP+YJnRUHg@mail.gmail.com>
 <1477542811.2176.93.camel@au1.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2IDgwRFzv8cwKgBH2XFF"
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
X-List-Received-Date: Mon, 31 Oct 2016 00:22:41 -0000


--=-2IDgwRFzv8cwKgBH2XFF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-10-27 at 15:33 +1100, Alastair D'Silva wrote:
> On Thu, 2016-10-27 at 14:52 +1030, Joel Stanley wrote:
> >=20
> > Hi Alastair,
> >=20
> > On Thu, Oct 27, 2016 at 12:57 PM,=C2=A0=C2=A0<alastair@au1.ibm.com> wro=
te:
> > >=20
> > >=20
> > > From: Alastair D'Silva <alastair@d-silva.org>
> > >=20
> > > This series adds preliminary support for the Epson rx8900 RTC.
> > >=20
> > > Setting and retrieving time is supported, and the chip temperature
> > > is hardcoded.
> > I commented in the patch about setting the temperature with a
> > property
> > so we can adjust it at runtime with the monitor.
> That sounds like a good idea.
>=20
> >=20
> > >=20
> > >=20
> > > Other features (in particular, those that require the interrupt
> > > line)
> > > are not implmented.
> > Do you intend to implement these features?
> Only if necessary. I need to understand how to wire the virtual non-i2c=
=C2=A0
> interrupt line from the RTC to the SOC before these could be
> implemented.

There are two parts: One is to add a qemu_irq member to your device's
state struct, and initialise it in your realize() with
sysbus_init_irq().

The second part is to wire up the interrupt at the machine level: This
time in the machine's realize(), invoke:

    qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->vic), irq_nr)

to grab a qemu_irq, and connect it with

    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), 0, irq)

In this case, your magic irq_nr value is 22. The interrupt controller's
default configuration matches the requirements for irq 22, so there
shouldn't be anything further.

Hope that helps,

Andrew

>=20
--=-2IDgwRFzv8cwKgBH2XFF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYFo7FAAoJEJ0dnzgO5LT5ud8P/22YYK51qNAa72lY429g6zQ6
5+3jr1ZTurmuObPV3yQeQm6edkE3up4KoD/KkIPWjAS4NvlMth7rbPpZ6e45DRSa
Ctau4az4jlWjStOgmHeyqVrt4EelNf04ui77QJ3GGptt/gJG2qOM58DZZ0l3SAsb
rTFGowy44uJplxdZ0qf+f1BoI/BpZd0RAO9osBYh3tprF/KXHCM2A+pgay8s9ibS
/aSjmrm/o0hXIEvZPsAMQ9fA9f/hR+Npw/CNHuJn9wN0JTdToT15klzE0P8tgbNf
4zS8vvHJIq1IVz4zYP0MV9geGYO6/6qlRuXw5AvMbAlr1FyjCjb4u002pf/MMJeJ
nLb2snLIYMQugiiPgEhBSp5a29Mx3iW1qtXYuBYhV02yyBafQpzHJecLO1/pDmRy
eU/aQJzkT+0T63Ipl82YRb6BAE+K03dolUIQOyuwlp3+NUyA4lRiZT7n/d0SVb56
/FuX53//1BFmj41cSlj9UhaUx0PYIG/ogK05RTf9pSdeb/kICTeznP9A9Kin+mDy
eweDwDZaDekjW38wJUWRYDqrwYoyNBwn6dfKEvAff1aBgKaHeZtebFDlnrlWhxFL
oKUqSPH6VK7iYke6D7kLmQwJD8qSzOgC1mFgFKP3fNeWLYlcr6n8kZnhGaAP3J3/
QAbZl0e398DWbVozilMS
=ewA1
-----END PGP SIGNATURE-----

--=-2IDgwRFzv8cwKgBH2XFF--
