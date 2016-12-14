Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfC8Y2YTzzDvk5
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 10:14:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cJogZvLk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="opLV4VwS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CF0AC206BF;
 Wed, 14 Dec 2016 18:14:48 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 14 Dec 2016 18:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=rhut0Yg56DBXcSyTcyRfjq+0Mew=; b=cJogZv
 Lk5bBD1YWTyy2fNmoUQeIwQ7HE7NeImxv22QHhKsms/R7lIOsy6qjRdoy8SNCDYY
 KSgQ2nTBjFcu12yeXHL8GiKFpYC31t3BT2NPHTPzf+4I5SUWHCcvKgRHATF+lCmo
 PQ3xZdx4qZMk9SILXFnPiPI+BUY3pPe2ztYOY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=rhut0Yg56DBXcS
 yTcyRfjq+0Mew=; b=opLV4VwSBFlmCl0xNA4D2FwMrEhH7X1k3YIH/Pt0g1jPsi
 aYt0Yt9F3aQ2e/I9ntXK3R1yD6LpCGSjT8zQ9f4P6HawQWV7ZkfMLF+f4/YAMUkF
 s2danjseI2cWrF2kENAoQXvtMHwgwACNlr2f3K95rYwObleEeb2ZOwKrk8ct0=
X-ME-Sender: <xms:aNJRWMTkc0e1XptQR3FMR5_jycWEAWpf19im10AKme7zQArrX17kjg>
X-Sasl-enc: PfTT6Hnt4ok6zETQj5aJvqubLQd7lKsxnVROlz71DF9w 1481757288
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4ACFC7E330;
 Wed, 14 Dec 2016 18:14:46 -0500 (EST)
Message-ID: <1481757283.3112.58.camel@aj.id.au>
Subject: Re: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 15 Dec 2016 09:44:43 +1030
In-Reply-To: <20161209054323.7320-3-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-3-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-J3brdVM7jbYi4bnqoS+3"
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
X-List-Received-Date: Wed, 14 Dec 2016 23:14:54 -0000


--=-J3brdVM7jbYi4bnqoS+3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-09 at 16:43 +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
>=20
> ---
> =C2=A0drivers/misc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A07 +
> =C2=A0drivers/misc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +
> =C2=A0drivers/misc/mbox-host.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
 326
> +++++++++++++++++++++++++++++++++++++++++

Is drivers/misc the right spot? drivers/mailbox seems to be a thing -
is there any reason it doesn't live there?

> =C2=A0include/uapi/linux/mbox-host.h |=C2=A0=C2=A018 +++
> =C2=A04 files changed, 353 insertions(+)
> =C2=A0create mode 100644 drivers/misc/mbox-host.c
> =C2=A0create mode 100644 include/uapi/linux/mbox-host.h
>=20
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index a216b46..44f191d 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -804,6 +804,13 @@ config PANEL_BOOT_MESSAGE
> > =C2=A0	=C2=A0=C2=A0An empty message will only clear the display at driv=
er
> > init time. Any other
> > =C2=A0	=C2=A0=C2=A0printf()-formatted message is valid with newline and
> > escape codes.
>=20
> =C2=A0
> +config MBOX_HOST
> +	depends on ARCH_ASPEED

Given we depend on ARCH_ASPEED maybe we should have 'ASPEED' in the
config symbol? ASPEED_MBOX_HOST?

Also, as Joel's pointed out in other patches, we should probably add ||
COMPILE_TEST as well.

Andrew
--=-J3brdVM7jbYi4bnqoS+3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYUdJjAAoJEJ0dnzgO5LT5JskP/0Tyt5m/zWR0Nl+F1vCy6IPn
AKWQiTlkrIOXsihNQI94lnb23KvYy4OnBhVOWIW/muGLIZXgznMiPPaQNMXwUxDk
xht4FvGM+qnuplnmiXmq+882bUg3knC78YdYgGen/jzo9Me01Cd3qtauUKZcTWy4
94DMlIbjxHKT6WWjamZ00zFA7p17rpTtqnlItDldXsutosZhKKfLinBwqI/Nzxli
CxHGValJITGRCTPWJl4S29jx7F3JUD0ALf/3HhXoRzggrZNsod85I07L99WUFAgM
wA9mvyx9miRdx9s5zGUfhHlcQx+xwmhAqt/HGChdctTegtSU+ntjRbTVjalmKnvU
5y6XBtqYXnAcSSOzArYWS3M7FmHXxx348KrLLZkbddElMaFyYSlmsGdEC09RC91W
ZHcUb7PYPY8KvFB4b4C7a0vvBjuHUq62oThIuFIrMk7d/dxojPi8Cqgp9//88oHu
GFgRsNmacfn+ZqKoSQzVQKGTK9S3VzvcVfMaXKQ7vhuhMoJeehCRWMFB3keQE7qj
iUE4/1R0QLG4gu9sXtcpMSxsLfhZtPfEXBA3LjLd+v5+IyrkEk+4cXkoFjxzvLN2
gIOxQ2ApFlMZlbMHpqD2sVwbJ4K3oyzIEPk/ZSl1RMBVPGfnMGXbR3FQGanFz5rz
quSZYOh9plHIJIvZsN8t
=Swrz
-----END PGP SIGNATURE-----

--=-J3brdVM7jbYi4bnqoS+3--
