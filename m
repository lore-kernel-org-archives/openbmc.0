Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Y3uW90Gf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BO/s8HAj"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNN8t0Q9GzDrbl
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 10:13:16 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9223820BFF;
 Thu, 26 Oct 2017 19:13:14 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 26 Oct 2017 19:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=kG1E6Q5wngF0/ZEKN+HOoGBdKMvtNqLC+YMd+UZwJmY=; b=Y3uW90Gf
 Cr6p4K4JDbfU1Uu6uis2dkjUnlmpWWhoxTFynj39WRG+mosU+PROwTZCOtssjcam
 GxB/QSO9a+RZRtW+GrOO71tK8EFA9nbIzqJk5bjA6XE/XDLb36H0kE5IJhLGszYs
 iDCWizLjC/P9Wrnahyxg9YJXWy1OA85G9/aLYPGzxjBHz0SLx/PZins/m0kzMrp2
 7A6VghMd92NFVFtVDCiuask9qfgd9kcGTnGWXLAP5WbSNe8NiRrl6zG4E2V6YEl8
 X7pEA9aNfjrcTLYL3HDCJ/QVy76/c3oshRGl3owhvnCEy6cYHOtcn1SflDJgr/6Y
 ytKK9f3Qk/SE+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=kG1E6Q5wngF0/ZEKN+HOoGBdKMvtN
 qLC+YMd+UZwJmY=; b=BO/s8HAjjXdJ/nH71ruHRfiTPqppttgZ/Y4NynPydv2Xe
 WsEfsmq8A7VM22UOyS0+nYMSA0je2b3t+nFUiWQbr8YuHNcMrOa4l1wmpwubRIZu
 7PgB5HfykQaNC2nc6nsIkG+KJSSGejEGG8qrAFIBZ2ukD5tNJ3xjcHJAAN0E5lxV
 tI29h2Bvsa6a/3owSREVgxC3/fZOnK3HMmZaUI+S5BFUSffjeG0JV793xdUNA+lh
 8ukC7il5ggC4gRyLwNDVhe8X3dbeURfuatT7j4ID2JnsLL9gdGQss9Gq921CZacY
 7mwWyk7axDAcZMTNbSOgYZQKbsmZaTqSpU8QHDl6Q==
X-ME-Sender: <xms:CmzyWdC_zJaTAOimX3r-yUsCUsX_UcAvxEefy9FFulWWhvShyDuHXw>
Received: from keelia40 (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 367627F97C;
 Thu, 26 Oct 2017 19:13:12 -0400 (EDT)
Message-ID: <1509059586.13477.10.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/3] pmbus: Misc work-arounds for the
 PAGE command
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Date: Fri, 27 Oct 2017 09:43:06 +1030
In-Reply-To: <20171026061940.25364-1-andrew@aj.id.au>
References: <20171026061940.25364-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RIj3iQBvPiCPyvnAUTi5"
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
X-List-Received-Date: Thu, 26 Oct 2017 23:13:20 -0000


--=-RIj3iQBvPiCPyvnAUTi5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-26 at 16:49 +1030, Andrew Jeffery wrote:
> Hello,
>=20
> Occasionally the MAX31785 NACKs setting the page on the device. The conse=
quence
> is the PMBus core either thinks some functionality is unsupported by the =
device
> or it inspects features on the wrong page after swallowing the error.
>=20
> The most obvious side-effect is that some hwmon attributes are not create=
d when
> they should be, often causing issues for fan monitoring and control in
> userspace, preventing the host from booting.
>=20
> The series introduces a one-shot retry in the PMBus core for the PAGE com=
mand.
> This is generally terrible, but the alternatives seem worse. Also this is=
 not
> yet appropriate to upstream as I haven't succeeded in getting the MAX3178=
5
> driver applied there. As a result this dirty secret can live in the OpenB=
MC
> tree until we properly understand the problem.
>=20
> The first couple of patches help avoid setting PAGE to values that never =
make
> sense. Again this involves a questionable change to the PMBus core, but I=
 think
> we can live with it.
>=20
> Some brief testing of the series indicates that all one-shot attempts suc=
ceed
> in the face of a previous failure, much like the FAN_CONFIG_* issues.
>=20
> Let me know what you think!
>=20
> Andrew Jeffery (3):
> =C2=A0 hwmon: pmbus: core: Add virtual page config bit
> =C2=A0 hwmon: pmbus: max31785: Mark virtual pages as virtual
> =C2=A0 hwmon: pmbus: core: One-shot retries for failure to set page

I've applied these to dev-4.10 with Matt Spinler's Reviewed-by tags.

Cheers,

Andrew

>=20
> =C2=A0drivers/hwmon/pmbus/max31785.c=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/pmbus/pmbus.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A02 ++
> =C2=A0drivers/hwmon/pmbus/pmbus_core.c | 23 +++++++++++++++++++----
> =C2=A03 files changed, 22 insertions(+), 4 deletions(-)
>=20
--=-RIj3iQBvPiCPyvnAUTi5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8mwCAAoJEJ0dnzgO5LT59igQAKwN6vfRuAePU0r9UOsRGeiF
1j6psEg+FJ3PEhRY1Aop7dAdwlNykQJhcGUKd2rfNwoXyN6TNpsxdhjx40kGSVG/
9m/0Tsa0K9MYvuv7apgiwO5d2Ff7z13m6x+0diFRwCS589y55R3IGpW7RLI1JuJT
A0vTcedGHytHLwdqAwR9z2FxgXjwwKyINtSgUxTXKd4bXuj0XSSW1+961Cqa2Xm+
zkwfAOqiXFymuUfFtK/fD1TU/c8ReKV7tDYb/QilKMQ+0Opuhxwj7uLEoxsLPU0Q
pJgnO9N0qSgMrmKwfD7NVqXs1ZpnHoYk8hxvbk1Bb7ahcLyrraOxVNXvJTudyE6j
jlEqd4kgP3c0dcYzSFWNlzL1xWVPTpniEZt2CeoHuJJtMh6nFWXJu1zw8UqEzqs4
uge3WLEzedyH6gLlKAxoBE6UBaFa2p/3i+/QYRBOxGfJGa4mFgQ/v+rbPlqeFXDI
E2krUgs2hC8csPYEtPTCTZEkLJd3GKovPDMAkdD+yyftSdq+7yr9azqtI9PXzBoP
1Qf9iD0r/T/kQzOOdCqYGCyV2p/7OyFlMuaEhv4UFTN9DI9sdMJLkclR3M2kee5h
+qi98wq7I+aMrHnN39ErxvyzO9gd3iFQ/U1LEGP2ihlg8dduDY4rNVsOfPx9QEny
doAu7Z8b1MR6yOT7Ixul
=ckW3
-----END PGP SIGNATURE-----

--=-RIj3iQBvPiCPyvnAUTi5--
