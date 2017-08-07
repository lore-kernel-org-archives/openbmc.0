Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xQpMk56rnzDqpp
 for <openbmc@lists.ozlabs.org>; Mon,  7 Aug 2017 17:00:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="luxxN7Te"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LHtgqJsB"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8224C20AAD;
 Mon,  7 Aug 2017 03:00:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 07 Aug 2017 03:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=BW6u/eFc1IGylRyLRnniUt5dttbMFtH0xHwna6nFY
 CI=; b=luxxN7TeEXOwTu1XORCbiXPHbRtWws2l8AWHq6iQ+QoL7i+AIXbD8X8zN
 mpGShQ17PHCdT8EtxYpMumeaZoAwZRms4lXrQtUyGIld9jnVf6dBqzwlldKrkq5O
 QatiFXghpm6AkMK4dkNrOhOg0/Ipm42iHMMdCbKu9GeuLsFeUs1D+HKzHDREmkfV
 lYmIYGyf1VnXghqKLGRtdwwmJLMJ1YAR3cbSc/jCaudXvjJ8TewcWNdgSlnQH+vo
 z/7xT7V18OVgoPjHjblxc3kf0AC2DARGvJBQE8pr4pNvTb6I9fK6zG5RXQpQZtsn
 VXKmbrrB9v2Y5BAIwpCrVRNdYUNoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=BW6u/eFc1IGylRyLRn
 niUt5dttbMFtH0xHwna6nFYCI=; b=LHtgqJsBuQxfpE3Oo2PAoKgOOUJZFednNh
 jvooyYKoF0Kp13R/meB60VHNloTnL9UsVp0ct1XrC4365JszRtjHo9WzzoY6KYe/
 mm9WTXDvbPAwBEJh9q4pqIw1Sj69nmsAs9ouaVA1ILaHvBODADx2jtgVWdr5MBvM
 bJZHf2UEYnpEhQMymOgb64BbLhTDtec2PYdna0t+kJXJQJYhxFzs0L0lWimgk9zw
 d6zAo8IwumL4K2H6SWxcIO1OQ2zPKbthVG+dC9QxAS9RoILyIQIgIdMFukp+gRoT
 d4FqqxoI95+tdOWMJeZwoq/k2xsBda+1q5OAy1PlXXbzI/b+L93g==
X-ME-Sender: <xms:HxCIWb2HcGCsJQuSlEL4UkLyKtkSupnx9m3wiesHOCISIN6JcF66Ow>
X-Sasl-enc: yOuN0maVpCIEj48iEdLDeUAGnYr9EEk112YJYOir1Y7Q 1502089246
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28B8F7E542;
 Mon,  7 Aug 2017 03:00:45 -0400 (EDT)
Message-ID: <1502089242.7709.6.camel@aj.id.au>
Subject: Re: openbmc query
From: Andrew Jeffery <andrew@aj.id.au>
To: "R V, Rashmi" <rashmi.r.v@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Mon, 07 Aug 2017 16:30:42 +0930
In-Reply-To: <3C172728F540394F8A2EF3E1015F59312BED48@PGSMSX105.gar.corp.intel.com>
References: <3C172728F540394F8A2EF3E1015F59312BED48@PGSMSX105.gar.corp.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4NukCQSb+b0sXgDpCe+P"
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
X-List-Received-Date: Mon, 07 Aug 2017 07:00:52 -0000


--=-4NukCQSb+b0sXgDpCe+P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rashmi,

On Mon, 2017-08-07 at 04:50 +0000, R V, Rashmi wrote:
> =C2=A0
> Hi
> =C2=A0
> I am trying to learn about openbmc.

Great! Welcome :)

>  I have gone through the link given below and tried to use the image
> to build on AST2500 EVB. But it doesn=E2=80=99t work for me. Can you plea=
se
> guide me on how to run the built image file(build number 1016 in the
> link) and the test cases for it?

Okay, it's not clear to me what is and isn't working for you.

Have you successfully built an image but qemu is failing for you? Or
have you not yet successfully built an image?

Hopefully the following isn't confusing more than helpful: To build an
image to run on the AST2500 EVB, you should run:

    $ TEMPLATECONF=3Dmeta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-ev=
b-ast2500/conf . openbmc-env
    $ bitbake obmc-phosphor-image

Note that sourcing openbmc-env will drop you into a new directory,
./build. Paths referring to artifacts will be relative to the build
directory.

Once this completes (hopefully successfully) you should have a flash
image at tmp/deploy/images/evb-ast2500/image-bmc

As this image is built for writing to the EVB, this may not work with
the qemuarm configuration in the job you linked to. However, if you're
running a modern Linux distro the packaged qemu may already have
support for the EVB. For instance Fedora 26 packages qemu 2.9.0, which
has enough support for you to successfully run:

    $ qemu-system-arm -M ast2500-evb -m 512 -nographic -drive file=3Dtmp/de=
ploy/images/evb-ast2500/image-bmc,if=3Dmtd,format=3Draw

If you don't have at least qemu 2.9.0 handy you can build our fork
hosted here:

    https://github.com/openbmc/qemu

Once that's built you can invoke the commandline above to boot the
image.

It's been too long since I've built and booted something that would
work with the `runqemu qemuarm`-like configuration that the CI job
uses. Others might be able to chime in, but from your question I think
the EVB-specific build is what you're after.

Hope that helps! The docs repository might also give you some insight,
but be aware that some of the information is out-of-date:

    https://github.com/openbmc/docs

Cheers,

Andrew

> =C2=A0
> https://openpower.xyz/job/openbmc-test-qemu/
> =C2=A0
> Regards
> Rashmi
> =C2=A0
--=-4NukCQSb+b0sXgDpCe+P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZiBAaAAoJEJ0dnzgO5LT5pgUP/jfHPbyZEvhmhGYLeXys1MHu
WskzpRyXhBxheRABbRLq7W3m9pwBn9D6h5iq2Qwh3sdfkK2OFrFBJRw0fhFNcnL4
Px4vfMwP6h4MZap+ThuONyOc/Rp3qfGmga0ogSLuC7FbKpbc05KV79vsdq3AHWrj
9KdJdArVsDA7jrWuNJf+0s6IYeJwvz70tZMcae0UnnXxWQKZX1tinS88SJxeKKRr
uwLJOtuLHZ1KG+Hr0mOEGeE4JXn1P1F/4jZRZc8wcnIvVkPxX80SDPOIZK3QT+3A
j+WKy0ywDBwIhxaR7LPq0qQbwmllV75sldvDneb1f8HSeBEOtqNX57kROF0iOyyI
HOIsVyBNKZ38bSMzkqbQYo21umLKFmInjeHTSO9dwa6mlvBh9+LN1JxiZde+xPoV
rPWa4t0h9WOtD6of5mu6xwIkys0ZifFD+MB+Jx+cIlyt1g8aFcJkemZIF2AEdaF5
rmAX1KdChqyE9swYBpemC92HS2n3BgVGAQC0T3GtLzV519DvW4QPQ1V2unwxow+d
Bje1xSG4oik6uD02//b7SwO6Jbz5aNIjOv3P5TZAMPE1oy9/QY3ICiYuI9iggCQ9
rx97WZodmEjIBp3Bac2JKES8ccAQXuYAJvIvXLNgrH6jejOYgAsb7wQ/ThLjVbCQ
A9RnkcIFWVmRtr8Onla0
=yQyT
-----END PGP SIGNATURE-----

--=-4NukCQSb+b0sXgDpCe+P--
