Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6B5R63LSzDqGp
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 10:50:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M+ndeyjF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="txsfkGcP"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E541A20763;
 Sun, 22 Jan 2017 18:50:16 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 22 Jan 2017 18:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=MRZSpKjeKuxSbkh3NLgpjnG0lrA=; b=M+ndey
 jFt4aNwMF5Z6LQRxDEFq3WpgyW8OgWbfD+1FZV7E+DL7ZQ0M8tIAopn4L/YSC/YJ
 7a0odyfcPxYuGOqZsjxGMRQ+NzYGkT8ULuZ7YDbqufjEqOCtCBSPOxA9+wEeqxyw
 fTvOi6TjfQn9KU1nSxFqRWMjSkjWQrPPTp8Aw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=MRZSpKjeKuxSbk
 h3NLgpjnG0lrA=; b=txsfkGcPpLAUgyOvSSunw+lTHyHrrXfmJUd1Xn+CnQBcaI
 GXZAyP0HSjZXGZWm8F+vuF1bke9MiJK/gReeuZWI/UzIogbsXYOZXS1w2IAkknEy
 EXs1iAknm52QqVF0PIQlfa04+sQnY1bELlkH2IwSqmkIEnBuILFGH4fGQs0Ec=
X-ME-Sender: <xms:OEWFWFZyjMPIduu0a4eL2IkNwBxnHQM1KgN1wrHdy0LiXEgcB6UU6g>
X-Sasl-enc: +/tYZdNc2DO9mA1/R7NXveyBitDy9DJWABt0JKe9f0M6 1485129016
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C249F7E330;
 Sun, 22 Jan 2017 18:50:14 -0500 (EST)
Message-ID: <1485129009.4137.1.camel@aj.id.au>
Subject: Re: Does anyone tftpboot the userspace image?
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Mine
 <mine260309@gmail.com>, Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 23 Jan 2017 10:50:09 +1100
In-Reply-To: <c4e8de61-cca0-ab23-f1ac-fb5d52b0e7b8@kaod.org>
References: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
 <CAARXrtmP1i4NZNO+jE5WmS7QRLd3d7E_yR8dDu8qrx82QnOX9Q@mail.gmail.com>
 <c4e8de61-cca0-ab23-f1ac-fb5d52b0e7b8@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-7L8HiAKbchg+uPUXyWgx"
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
X-List-Received-Date: Sun, 22 Jan 2017 23:50:21 -0000


--=-7L8HiAKbchg+uPUXyWgx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2017-01-21 at 16:54 +0100, C=C3=A9dric Le Goater wrote:
> Hello,=C2=A0
>=20
> On 01/21/2017 11:10 AM, Mine wrote:
> > Hi Xo,
> >=20
> >=20
> > > > On Sat, Jan 21, 2017 at 9:59 AM, Xo Wang <xow@google.com> wrote:
> > > Hi folks,
> > >=20
> > > I noticed from this discussion
> > > https://lists.ozlabs.org/pipermail/openbmc/2016-April/thread.html#273=
8
> > > that kernel developers were tftpbooting the userspace image from a
> > > obmc-phosphor-image-<machine>.cpio.lzma.u-boot file.
> > >=20
> > > 1. How does/did that work? I guess you needed a custom init in the
> > > initrd to load the u-boot container (?) instead of from mtd?
> >=20
> > In uboot, we can use tftp to load the kernel and initrd to specific add=
ress,
> > and use `bootm` command to start the kernel.
> > E.g. for witherspoon:
> > tftp 0x80001000 kernel
> > tftp 0x81000000 initrd
> > bootm 0x80001000 0x81000000
>=20
> yes. There is nothing more to do to use these images. Just replace
> initrd by obmc-phosphor-image-$platform.cpio.lzma.u-boot

Yes, I use this a fair bit. In the past there were image overlap issues
when trying to netboot a kernel using the on-flash userspace, so I was
relocating the generated cpio (with a new u-boot header) and netbooting
that instead.

>=20
> > >=20
> > > 2. Are you still using this? Building the extra .cpio.lzma.u-boot is
> > > kind of slow, with an extra ~45 seconds to do 'find | cpio | lzma;
> > > mkimage' every build, and it can't be parallelized.
> >=20
> > I believe someone uses this, since it does not require to flash the ima=
ge to
> > the NOR flash, and make it easier to test new build.
>=20
> yes. You can also use it to test an older build to check for=C2=A0
> regressions or to restore a system that was trashed by a buggy=C2=A0
> kernel. I have used it a few times and I still do to boot=C2=A0
> openbmc-1.0 images. It would be nice to keep these images.

I agree.

Andrew

--=-7L8HiAKbchg+uPUXyWgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYhUUxAAoJEJ0dnzgO5LT53g8P/2fssevo9wsngfFahjFvh+IS
RRX1fXt7HoaXHvkGtoHkmV70N9NRtVHk1+ruKeqTa7tlU+RZyz+9anvAw9gciVpf
fmxYwUEtWGBDzVxRm4ez8TfcIDX5NeaWC+EixGLggIUKcS/GflL17zyvAaQMYvzU
5DqVLcMfYMp7crlPvp7UQLOIClUsP/TI+aTm3ibYI5N7bKlsLx0QP7WjdPki2WiG
zQWYG7V3CSjrs56yKQSAoEYIV1KQUsy/eR0b6vAtUFZc/T018bC/8gkD3NFeZWd0
KprH3MtGWfTi7f4ptNy6+nbf1BXr+hvXH2bZg+lkdYfHN03BRldWoMZD7VanhhXt
KXDAqXTpBnUrgFxLjN5b/o5tBnBFv0clKlayStQUA4jaidP+NhFLi7WumGy8EArW
J8n8CfP2TAmv0Sb6GAerpwfclKnTzuyYQpAQN7TINErW8DdABy3yIFFwPVGflV9n
a/MqBoA5qER97EkAFGPTuvVDV+zO/404qjjeeubFnxpmogQyZKypzhyqvSL8BPiN
OYHm++jVEG5Ob8/NAbV3pbMWaZrRAtc+nVeeJtfEy/yCqNmMiqxnN2IH6JgZOfz1
AqLBZlni9I7P5qbUac1B4ZlnDef+7uauBC9L/1dt6jvaZvkIJiHB0FW3yJMYS54q
wz8m5lVP/xiV03lwfd4X
=zvMp
-----END PGP SIGNATURE-----

--=-7L8HiAKbchg+uPUXyWgx--
