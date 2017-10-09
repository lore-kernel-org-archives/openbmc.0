Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NsEFhZp8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C8Vb+p22"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9VyJ1JjKzDqlv
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 17:41:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 428C120E83;
 Mon,  9 Oct 2017 02:41:23 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Oct 2017 02:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=TzF5PBNHjJLAxHMatTbOcZNCSiE52US2saNaiUPGh
 qQ=; b=NsEFhZp85xT21fX82txw65i+z9SuR0VaI7FmG55JoDtbPuuv+JckiT4HG
 bdvE3xFgRm2VKcEJpJxutWRGCGJS2Zr+4Io/L/w8XJB8M/5IxjBpKcMZ7x5Ls84b
 35Kfc/8dZZdsJXmTNrVSx0yQxhasfE6EykixBozjyKoK6YUhO0y5DYsELzh6UHw3
 zJR/2u1Qxmu2UfmonYTxctc4XyGQwK6FdWgZgWCU5Hvku8SnjhBuKYqptDgRTvvw
 b/CJHNMmr/glIVCEjWQmUN+nkVnhe/dgRpsLYkIY9N9PraG8mLnEjHDQ4JBN7/eR
 0PJnv6BBlzHsF/O46oKBvzHQa/Szg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TzF5PBNHjJLAxHMatT
 bOcZNCSiE52US2saNaiUPGhqQ=; b=C8Vb+p222ONCNwQwxboKBH0ZECVq9A5e9T
 PwUmxDJ21HMDpc3pVsl4B8qSxE/B7ekceRZOLwyMKr6IFRLHkoKxKIHEcGnI4oJY
 S5qVCVBoDYwtwDzuMBtnjcQ74A2WEiuPqwc5Z6LxpxKsgYRm51E3i2TyYBlCBIML
 RRfuIGTRVRTSDEt00mvG/LsiajhKx/oJtJ2UjbqLUlJKW5gvVgKjkmW4OY1UiHiD
 2ym/NS2+yYm+nZ9duTG069mSRRmxYloXT641rtDnOc2F441NYoFCa0QeO9xiJ6pV
 WQEKhBwfsVQ2DwziezzaJVp2yodHk5DI30H1h/7I5AZiljyudmdw==
X-ME-Sender: <xms:ExrbWcZ3G9c9U9cQyw7zDGX8d2UmQV2frzswJ-2aHPXTLS06BFz-0w>
X-Sasl-enc: LjYoHLkqkxcvb/GfObjrIunyg9LQHg9aEErlwyJmdFQC 1507531282
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 805067E3DC;
 Mon,  9 Oct 2017 02:41:21 -0400 (EDT)
Message-ID: <1507531274.5452.154.camel@aj.id.au>
Subject: Re: OpenBMC on Raspberry PI 3.
From: Andrew Jeffery <andrew@aj.id.au>
To: Javier Romero <xavinux@gmail.com>
Cc: Rick Altherr <raltherr@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 09 Oct 2017 17:11:14 +1030
In-Reply-To: <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tw5NP77axzJX2tKVPMbz"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 06:41:30 -0000


--=-tw5NP77axzJX2tKVPMbz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-10-08 at 23:57 -0300, Javier Romero wrote:
> Andrew,
>=C2=A0
> Thans for your answer.
>=C2=A0
> Bug reported:=C2=A0https://github.com/openbmc/openbmc/issues/2434
>=C2=A0
> I`d like to try to cook up a patch, but do I need to know a specific
> language programming to do this ?

Hmm, good question. This is probably a bug in how a bitbake
configuration/recipe configures the kernel. As such I'd suggest getting a
handle on Yocto, which is the build and configuration system we use. Here's=
 the
quick start guide:

http://www.yoctoproject.org/docs/2.1/yocto-project-qs/yocto-project-qs.html

There's also a rather daunting Mega Manual, which is useful as a reference
(rather than reading the whole thing):

http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html

Back to the bug itself, from the output that you gave I expect it's some is=
sue
with the following directive:

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf/distro/op=
enbmc-phosphor.conf#L57

i.e. the issue is that that linux-raspberrypi (the kernel recipe used for t=
he
raspberry pi[1][2]) doesn't have a 'phosphor-gpio-keys' feature. The implic=
it
assumption is that the configuration will be using the linux-obmc tree[3][4=
][5], which
is our fork of the kernel (primarily for Aspeed SoC support).

More generally, knowledge of Python (Yocto/bitbake, some OpenBMC userspace)=
, C
(u-boot, kernel, qemu, also requires a some comfort with assembler) and C++=
 (most
of the phosphor reference userspace applications) is useful.

Hope that helps.

Andrew

[1] https://github.com/openbmc/openbmc/blob/4f2d85233d23eedaf1d4846d3d861ba=
28bc49b00/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspber=
rypi_4.4.bb
[2] https://github.com/openbmc/openbmc/blob/4f2d85233d23eedaf1d4846d3d861ba=
28bc49b00/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-raspber=
rypi.inc
[3] https://github.com/openbmc/openbmc/blob/4f2cddf103aaca6df26ddb766655fdf=
49c56a6ae/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.10.bb
[4] https://github.com/openbmc/openbmc/blob/4f2cddf103aaca6df26ddb766655fdf=
49c56a6ae/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
--=-tw5NP77axzJX2tKVPMbz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIbBAABCgAGBQJZ2xoKAAoJEJ0dnzgO5LT5NTAP93Q/2WoM16MmaOdkx798V2ct
vefdH0CygMawwRpAvzx1vx+Yktdtq3PXdFF83+hrLaND5gAYahV8pjxQoEfJo97s
4/gLrZIdhyP8OzJBO6OioJmfd/bWpg05ftNVVszXJ0oZ47Ot6QUo8nRRJIHVSCbn
dys7k6L22gKJIwfaD9wArTz8tH2IEMM6SonI3kfzYzCnQQx91DcQWpxqj2epQcDZ
ndoOBP0O3gzlNjUqQ5baKLvEGeHhdsoPtfslLNObe3YW9gM5FZSbQXLrovaj0H5z
e/1EiQiRKwd58smu+ntzTxmZO5G8ZUudjL11GqGFlaJ051whfMdJ0EQBU9QVNLiS
8ml8l1a5O/llnk5VDYxxEb5aOPT6k/ozgmklOpsC98A2YPkV9SjvwTa0xCCMH779
RQgTOiczj0QNaVMYNc09wushkZ8kVUUNu3YMi8/sL7bYzyCbXs/K8nvPtNrLwrOt
wTq0gF3v4DczP6nNV8iRaFb7du9rr/iMe8E3C+NKA0TWHfhqGKJPPlgiRHNEJack
2+Xvluu1T6KL1hHAGHJLtMYtzJEQGs/d+7didT+kQwS9Nocq37/8ERFEbKMrbwIs
ifahDJDH+TM5lhJNJPGgR4JLCigCQ2KP2Do3tsw10pC4C53UxPXdNOVyHOYRir0X
kzG9KDUXneRDM0eh8zU=
=2Ohu
-----END PGP SIGNATURE-----

--=-tw5NP77axzJX2tKVPMbz--
