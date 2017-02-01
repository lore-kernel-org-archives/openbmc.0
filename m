Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCl2q0zLkzDqBj
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 11:52:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dhOAM5nX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Mzc9v3m2"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D5EB209ED;
 Tue, 31 Jan 2017 19:52:16 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 31 Jan 2017 19:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=FWqRcw9SWMzrY0mcgocvJjlyVVs=; b=dhOAM5
 nXS2RaBppA9HLIczE3tcDO8lQy8FYfhbwExlDbmfUOp5hQzRBkMbCAXhNxuleq3N
 6aHBbc4Us3kRUGi35vQywBN5wB1q/tYETl1JzPidewPlpR54osBrwdgJxD8kthNU
 TrJH8OuuhIpIQquNHvFVdnvd/jcTSst8/ZHKM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=FWqRcw9SWMzrY0
 mcgocvJjlyVVs=; b=Mzc9v3m2h7Hc38IFMo0vvEJ6JqPI50Wwtd//zU9jg4l6/E
 UEebudZreT0akAXtZ3AVBKU3259VnXdGs8ze+pwgA7qk6Wo4d0V5ctkokCVq0d+n
 yei47on9AnNNBMgxMSm3KqKiz5X3TE5Rq8zzqUt8hrriGPWIS1HIyaYpCqTcM=
X-ME-Sender: <xms:QDGRWHVLxH39lrbnJHJfzBtR3IGDHZfC6kO2ENvwZC6CScp2auIKSQ>
X-Sasl-enc: GyI3BxcJFmJiy7lQZ1gb+selSxdp9IuQAKiB3XwJi0lB 1485910335
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3E042457B;
 Tue, 31 Jan 2017 19:52:13 -0500 (EST)
Message-ID: <1485910329.4137.34.camel@aj.id.au>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 01 Feb 2017 11:22:09 +1030
In-Reply-To: <CACRpkdbQu9KkR5_dfKk=1-LWLdQ3dyZdtW1JD3SeZZD1s=X3fg@mail.gmail.com>
References: <20170127042442.28994-1-andrew@aj.id.au>
 <CACRpkdbQu9KkR5_dfKk=1-LWLdQ3dyZdtW1JD3SeZZD1s=X3fg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-la8e7fYaMZ3DauAZ2YlT"
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
X-List-Received-Date: Wed, 01 Feb 2017 00:52:19 -0000


--=-la8e7fYaMZ3DauAZ2YlT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-31 at 15:50 +0100, Linus Walleij wrote:
> > On Fri, Jan 27, 2017 at 5:24 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
>=20
> > This is less straight-forward than one would hope, as some banks only
> > have 4 pins rather than 8, others are output only, yet more (W and
> > X, already supported) are input-only, and in the case of the g4 SoC ban=
k
> > AC doesn't exist.
> >=20
> > Add some structs to describe the varying properties of different banks
> > and integrate mechanisms to deny requests for unsupported
> > configurations.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >=20
> > Since v2:
>=20
> Patch applied with some patch -p1 < fuzz
> please check the result.

Have you pushed the tree with the fuzzy patch applied? I can't find it.
I fetched the gpio (and pinctrl) trees just now, but all I'm seeing is:

    $ git log --all --author "Andrew Jeffery" --committer "Linus Walleij" -=
-grep "AA, AB" --oneline
    1736f75d35e4 gpio: aspeed: Add banks Y, Z, AA, AB and AC
    8ccb6dc6e999 pinctrl: aspeed: g4: Fix mux configuration for GPIOs AA[4-=
7], AB[0-7]

and=20

    $ git show --stat --pretty=3Dfuller 1736f75d35e4
    commit 1736f75d35e47409ad776273133d0f558a4c8253
    Author:     Andrew Jeffery <    andrew@aj.id.au    >
    AuthorDate: Tue Jan 24 16:46:46 2017 +1030
    Commit:     Linus Walleij <    linus.walleij@linaro.org    >
    CommitDate: Thu Jan 26 14:45:43 2017 +0100

v3 wasn't sent until Friday the 27th, and the diff of 1736f75d35e4
still drags in <linux/gpio.h> which v3 removes.

Regardless, I'll try to recreate it myself and inspect the fuzz damage.
--=-la8e7fYaMZ3DauAZ2YlT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYkTE6AAoJEJ0dnzgO5LT55KkP/RDY7rZPVAlqCwzjeYjna7br
uaTnAhwXx8Bgf2WGe8fDeXW6r+cBOtKjflp5lQcyPg7Ji2U+YvMR1+3DbwRelWFW
cnEV6DijgLF7dv7hpWPL8DgDYcR4xi7T84jZBJ+c9IAeNrPOGLcLNE121e/l0c0E
Dm4hdgC96oSDFzzio/K2fuvnSs0t+Ge+KdMpBFUJ8GAYATX+Ls6J/2S/oh/vEYly
cqPAHM085eXpjMdwQVmv8LHSNiZXis5jz79CPpFZiQWH1wUS9gbYKbt0jF2pLjYM
79tJ2juKK6pLfVtSEr4hvoRSpdID3gfq+hmS964h33/AM0+qVrzS5j3Gu2j+Wm4l
UqrGwUao8EgwvD8NJ4LyoLDRjE0sGft4+IcpU5IjeBoKKIE06AIYlg6pWYX7WeN0
LBttMGQyiJTgDNXFWXtxj+d6olmqRi4CcgDkxC8BChTgxl6eFIENL/i1jkRHxp8c
bXx6tsERO87a6eZV4txxYb7ozx19dsD40fyjQa8w/dDiOjpQ4DQm79Don6zZFHVf
yms0MMP/EEOXCOstYkJZm8E72NRiYce0rRn+E9PKgOsJYfxuEhKEEZtTDUrknNtp
0aKpABiRAy5zqB99m+NrmXRftUAiHH91/rSISAfLBvwPzc/61PBQ/W8ZYKwvYQQE
/UQmr1yTtrO2ZZr2VtAD
=ZtDw
-----END PGP SIGNATURE-----

--=-la8e7fYaMZ3DauAZ2YlT--
