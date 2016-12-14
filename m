Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3thgWj2mNjzDwC5
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 10:40:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MLDMJLma"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RXXJSIai"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D07162099B;
 Sun, 18 Dec 2016 18:39:55 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 18 Dec 2016 18:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=m3kjF4AqL+gR0QXiQO5HePzkJw4=; b=MLDMJL
 maSN//sIKO094ApcQ2FHVso/fJQMlKzdApw6yAJQRi5SewQt0zAzCLB/kckFzbdg
 1F11Qdy8zh9BiweZqL3cy9h2jIfjDwVjtlxypzjSp9+Il9SQjbNTxeBPNM9NHSxH
 mjvM6K4Kox2ZFPs8KPXRjdcLSVHegtrvHBeRg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=m3kjF4AqL+gR0Q
 XiQO5HePzkJw4=; b=RXXJSIaiIyHYFJnY78KVHeVQpsdbxUMFEKrw3Fs6pdnlxy
 k6t6pgR6ZiyzQ3PihIlqB9kPhQ581iq8lYgxTQS60dH96LkqkYC0jR28yKVyV3jP
 TYAicFb1erHsMgamanmBFX11X1iCDT81cIETIEv/8elCRWTesxa2+G/v47KWQ=
X-ME-Sender: <xms:Sx5XWIMA8IqkeWUzdHaMiKjtKyOired12IFeNkmHOJRvXoOqBQ6orA>
X-Sasl-enc: nbaUP4d9qjNEiwWMz9cJVAH0jOf0rpEOBsUwPJ5o97Gp 1482104395
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B70A7EA42;
 Sun, 18 Dec 2016 18:39:54 -0500 (EST)
Message-ID: <1481757247.3112.57.camel@aj.id.au>
Subject: Re: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
In-Reply-To: <20161209054323.7320-3-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-3-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Q/Zy/bLK7BqWw6VMyRm+"
Date: Thu, 15 Dec 2016 09:44:08 +1030
Mime-Version: 1.0
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Sun, 18 Dec 2016 23:40:02 -0000


--=-Q/Zy/bLK7BqWw6VMyRm+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-09 at 16:43 +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> =C2=A0drivers/misc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A07 +
> =C2=A0drivers/misc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +
> =C2=A0drivers/misc/mbox-host.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
 326 +++++++++++++++++++++++++++++++++++++++++

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
er init time. Any other
> > =C2=A0	=C2=A0=C2=A0printf()-formatted message is valid with newline and=
 escape codes.
> =C2=A0
> +config MBOX_HOST
> +	depends on ARCH_ASPEED

Given we depend on ARCH_ASPEED maybe we should have 'ASPEED' in the
config symbol? ASPEED_MBOX_HOST?

Also, as Joel's pointed out in other patches, we should probably add ||
COMPILE_TEST as well.

Andrew
--=-Q/Zy/bLK7BqWw6VMyRm+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYUdJAAAoJEJ0dnzgO5LT5I8UP/1YIbJwC0cE2faeNEo4fifS2
xH2mvyZt7Tj/j3Btd2E0OQWvHVl1eXN8bWHzNlQTdOL5PxOpzgx3XG1fsPQKUaU/
hcG4t1eo0BveFQL4kNl1aMgHsryJEdVB6ldc5GD9HVIYLDoXOIELw1cSlwRu7bHv
3e9ViAud1K9eexzozYQZcnpu+nQC8N15FDp1MI46gz0VkpAQ55P/3VFZgmoeVRze
U1Cy7YJViAqrPNlFP5FdcoVi584iPBfQzSvu+rAIds7Kls6eZXquFY/470SB2uHy
bOZvBpdtIMETS3U6kRaQOtK9KRCFYJgYV8f3bHHff3EFV/XvnxnQlpZYOb3MfzHA
CdxAkqPt7abegdRzhwAqaDVn5qoIG6sXrXk+S2QP0f1K7NPCibKg+CnxBdCwHsqL
AxKveqMkS407J09jMl0In9vK6Rpk6Cl4mrjBC8d3/Zp+UUbREJy48RtgAprQwH7M
ETgph69Bkv2MFDRdwvBCDKWDcvxufv5oxQW4dXoKh4Kz+5ffkdW9yp7OgqHjofhf
p5mNAJlOBOQIPNaOIDiFYDAu/Pb2+l+BW+2ZShZKbZ6Hxe2a49KGlk5l/L5zE1XO
CBdKYqPcAcCvvscSb7uyruR5nRO37iAmKPyo9jzvXcd8M65xq3E0WILrVdA8XomK
S1MnUEBSishuGBb+cmDG
=xrIj
-----END PGP SIGNATURE-----

--=-Q/Zy/bLK7BqWw6VMyRm+--
