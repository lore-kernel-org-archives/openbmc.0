Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSPFZ0D3czDqcx
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 11:15:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Bmc4eTBH"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YCX0ow/q"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF3CA20B1E;
 Mon, 28 Nov 2016 19:15:11 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 28 Nov 2016 19:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=gdrvcDURDmndhmRztrNT5+lW1c4=; b=Bmc4eT
 BHqM0ui34vqthDD1RhpUunCsfDrxk9CPDjDMNJ9i9m2xvj7uG4A8EAZjQ4YKc1nx
 FbU+Xn9abA1L+QZK/TYIDnIA2isPVVQRfU/IsgD6b+6fXgW9p0KJXLnplc7cPd0D
 FFPd74GIJW2Edz359SEVpBQil8n4WK2pyaBm0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=gdrvcDURDmndhm
 RztrNT5+lW1c4=; b=YCX0ow/qKpwnWNduaj3X/vPUOaDKDPaaD8hkltfaThebgH
 R7kjLvFolAv1YXXujEFscb6JZfrmfl1zohp/AQxHy9PjFMVCxwReF1pXheJzoTQq
 q1TB39MMF6KeJj5KpbJ1ZAb1wZe44hwrZjQGzMMwvOhIh6+rQ3fGqJvBo9iKA=
X-ME-Sender: <xms:j8g8WE94fEjFb7HIO1mvHnizA_pwfjd-icXHH7hUsGCWFcMwVxPnig>
X-Sasl-enc: i9q5tBlpuC+sJPWairTYoLGEFMBFYNrP/WP0R1IjlBOJ 1480378511
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B55F24731;
 Mon, 28 Nov 2016 19:15:10 -0500 (EST)
Message-ID: <1480378504.2503.87.camel@aj.id.au>
Subject: Re: Palmetto GPIO pin configuration for Voltage Translator Control
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <christopher.lee.bostic@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Tue, 29 Nov 2016 10:45:04 +1030
In-Reply-To: <CAA0LjjUbmBkFU2YDpvSK01uBGrLyK_H2Dvt3UdG-LC09uWg_9w@mail.gmail.com>
References: <CAA0LjjUbmBkFU2YDpvSK01uBGrLyK_H2Dvt3UdG-LC09uWg_9w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HIv+c6dJyusVUbgb3wBj"
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
X-List-Received-Date: Tue, 29 Nov 2016 00:15:15 -0000


--=-HIv+c6dJyusVUbgb3wBj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-28 at 14:56 -0600, Christopher Bostic wrote:
> Note that this is not directly related to the GPIO hog updates that
> are in process of being added to the palmetto device tree.

So, to clarify:

The patch I sent to the list a week or so ago isn't in the process of
being applied in any way for two reasons:

1. Per Joel's reply it will not be carried in the OpenBMC kernel tree
2. The OpenBMC bitbake build process *already* applies it to the kernel
during its build process, as of September. The patch is carried in the
OpenBMC tree[1].

[1] https://github.com/openbmc/openbmc/blob/a103a3723b4329225d9316393bf0620=
027d02aa6/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/li=
nux-obmc_%25.bbappend#L3

> This issue exists without that change.

You can confirm the presence of the hog at runtime either from dmesg or
sysfs:

    # ls -1     /sys/firmware/devicetree/base/ahb/apb/gpio@1e780000     | g=
rep h6
    pin_gpio_h6
    # dmesg | grep -i h6
    GPIO line 382 (H6) hogged as output/high

If you are booting your own kernel built directly from the OpenBMC
kernel tree with your patches applied and are still seeing the pin in
use then that's certainly odd. The existence of the hogs patch can be
ignored and we need to investigate what is going on.

However, if you are booting the kernel produced from the OpenBMC
bitbake build process, then seeing this pin in use is expected
behaviour as the hogs patch will have been applied.

Can you please detail how you are building the kernel you are testing?
I want to make sure we're not sneaking in the patch when you weren't
expecting it.

Cheers,

Andrew
--=-HIv+c6dJyusVUbgb3wBj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPMiIAAoJEJ0dnzgO5LT59uMP/RsN6U5mM/Yvx8F4s63ygy/1
WF4Q0FwTo5boLyAMS7Phh9TrYXf1fOtBZzHjfjP8aTeF3O4EVL7LU7aiK+C57hUW
WyeZdSKL9Y9N2kovhqd8WLOCAj+/0wMK191aEIcsosYg4wPH9d/nNHjSPEUI95XN
7cW5+lWKLC12pkaIf5PgKi0x/55v+Yd+i9RYJifN89Qr49ViX/CbKi5wy5oaCKZa
c8EriYsJfJpZsxCstHvF0SClvyOHr+Xnnc76jJzo4XVY1rR1DW3JPTpw9IBdJEXC
wkakwbcg4KJWv++UOr1fR3jMl0R2u9KpPUxvYm6G/1BvcDkSz2WTzvcWcTDTZQyP
P9lhdOSADUjpAdtfjUCTOCjSYG3WtzC8qz7scMlqA0azHeZfQQnIB1s5bWuUKpUc
92WGZE+MFNERzJs12BCdzecnXvTHB1i4aDmDAVctL797axDUMtGmvrXL/stYvyo5
J7aNoL9yeDzleH+uU/yGJ0C5XdP9ZPiGp4daVSq6xyH0UzZvbXpSUJ30pFCLfKOe
HnRSME2UaJuK52Cp0dcchEOGtOJ2YWaDtClEnGFjndXhiDgO6b6zh1BpyGyX77nu
4QbYRzVNSTgmxaWaDoXBNfBVhnE4n0tvJFF/jPGew+f0/2y6XvGwnlxM1swcEhje
oi5r0WIQ5x0qrchFZKDl
=aUtH
-----END PGP SIGNATURE-----

--=-HIv+c6dJyusVUbgb3wBj--
