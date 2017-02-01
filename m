Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCn1621Q7zDqD0
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 13:20:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hDRQSo7B"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="p+2pg5Jn"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B4DC520B49;
 Tue, 31 Jan 2017 21:20:55 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 31 Jan 2017 21:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=By7jWE8QrOz8B8bvAyYJvZHxIWk=; b=hDRQSo
 7BhwSI0qTBp1Z8O8dZkU0/yJBWsi6CgY0fSgi/TR9qxvEzkX5gJ1xIRTei/8pe0M
 7FFLh2rh+O31Dlt5EOhjVYAIMYYKdgEZPKfX74wqALgCxKSXAnxrqlPDToI6h3hH
 YxgoJ2mxHEFyVB/xkBT+81Ownq5GgHSmTVaCY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=By7jWE8QrOz8B8
 bvAyYJvZHxIWk=; b=p+2pg5JntSzWndquqzeQZPhgz/+VlBm9FaqCeEmyXCxJvZ
 vn5ZksAEN8EnBDt+YslYgDUt8m13qIO3irmfAV4fZwTC23E7VSoGGg/d0mBCK8qG
 jWSLcanwhhwrUQSUckU98H6cKGfk7ReE+q1R6vDDqNgttNaCtPTYMHqmirsFM=
X-ME-Sender: <xms:B0aRWL_7UF7hFxBJ5r-V6HropUUi2kMmG-T9G97JQTZiBFnrsZk1Sg>
X-Sasl-enc: mxXb+3o6My3BA9+inkvKRWMHGJAOjrFKsp+OrhvVo7Yl 1485915654
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E715F245E2;
 Tue, 31 Jan 2017 21:20:53 -0500 (EST)
Message-ID: <1485915649.4137.37.camel@aj.id.au>
Subject: Re: GPIO offsets used by userspace
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Xo Wang <xow@google.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 01 Feb 2017 12:50:49 +1030
In-Reply-To: <CACPK8XeZeBhTMy4rtdXULuKbGYjYWtusaAfCoQuWx1qZoQMdEw@mail.gmail.com>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
 <1485825312.4137.25.camel@aj.id.au>
 <CAPH-5w5BgnQTZ+BA1Wvhb3yuc0OsbaKba95nKgHPndpbMvFqSQ@mail.gmail.com>
 <CACPK8XeZeBhTMy4rtdXULuKbGYjYWtusaAfCoQuWx1qZoQMdEw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Zw8QagtTnpQE+QE4xwNT"
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
X-List-Received-Date: Wed, 01 Feb 2017 02:20:59 -0000


--=-Zw8QagtTnpQE+QE4xwNT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-02-01 at 09:55 +1030, Joel Stanley wrote:
> > I mentioned this on GitHub, but in theory we should have at least one
> > /sys/class/gpio/gpiochipN directory, where N is the offset for GPIOs
> > provided by that GPIO device.
> >
> > On a BMC not attached to GPIO expanders this directory name could be
> > parsed by the Python currently in use. Not foolproof, but it could be
> > a working stopgap.
>=20
> You're right, we could find this one. This would break on Witherspoon
> though which will soon gain a driver for a GPIO expander.
>=20
> We could write some python to iterate through the gpiochipN
> directories, and match against the label:
>=20
> root@zaius5:~# cat /sys/class/gpio/gpiochip320/label
> 1e780000.gpio
>=20
> This would be a stopgap until we could get something saner, like sysfs
> files named after the net or function.

If we're going to change things so significantly we should move away
from using sysfs given it's deprecated, even if the alternative isn't
great.

Andrew
--=-Zw8QagtTnpQE+QE4xwNT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYkUYBAAoJEJ0dnzgO5LT5WPoP/0KGIeGnyqzJP8P5QXVus82z
A+JskH5Q1eNnL204OCxsu2+jDhR287dFAF5qK8rRoeKlL6oNgNSdXB8iKxYJh1dg
ScEQwzDDQQEyyxwwQCNC30xR0wGmAErlb3TZ4FpscNSIsrDaHSMpqRRIeME7OzqY
F3zcRynz3IdOdOI+6hHzYB310DH+Gb3HgXJr3uCLRJOpYmA184CireVdzy5p0Npk
cafDyr/nq0kwAYTzA7MR7xB+wU4tQlet1fbrI1laEIFvvVSjKmrcbywk0X42M/F4
lYap7NS+jeJ/3VmManYM6lPLmO/JUv0OPozA34u/TmZUvEzEV4AvTi20ta9Js2hf
ZU69nwa7N5IpgnMNfgmJKdCiCyIPA0rKKkfRYQbxGDQTXMAlS0t7FPUgtQR/TdXv
h7ihbIkLPiWn2HfvddQh9Yj7OmkzFTctQIN7bEerO3Jy2ahnFQazMju1UiQqSoJW
ni/1JGGnCX/S0dQvJRw/ZuVt094z83K3ZS1NTwmeu/gEwZeC/+tE3Z8eHyDvysmV
ojMf1rcUwntIdiy1yDmCR1qLP+xfuBAreh6Dptqd38ut7yaXPGFAP0VZDqdZ2k8l
2jMxoD9LtUMjDKPJYCq6vGKVrQdvPV2mKfnXAx2y6oaySV0WcozLhcXebM5Vkiat
f0yu0nAxGECuF9P/nhRF
=YcJ3
-----END PGP SIGNATURE-----

--=-Zw8QagtTnpQE+QE4xwNT--
