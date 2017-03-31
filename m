Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvM9M5j9szDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 11:01:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JZQrNymw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="A073ohWM"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B1D1209A6;
 Thu, 30 Mar 2017 20:01:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 30 Mar 2017 20:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=4pfWu7Pkfb9s8wp4MIGXbsrQI3Zh1+fqAizTV9tlk
 wA=; b=JZQrNymwGaQdGwYeexFvoNaF71qgiRELT6AZ9rqWrm88MM464ONBWtg2y
 +QkiGNg9CHukv+HnJRU8BOODSsxd7D/OWnfaqEy7h3o5dqlmQpU3BHsvg8i3m4PU
 AOA+Ix1VVuJJTK2wiwfqulAQTmeWv1/KqJXduB9znjVtfvzZN/IGgJoZolIXr05Z
 OSl0S/IF0Du98LE4nkbu7Rh44nl2vAbHleJBT7uYbfYM4xiyeV4Z38aforirpPaq
 F633ic+eXCyaTilNl0fP+/JvZwUrc2/yfwf4uYsw7OtF8YVXdrI9y1rX1ePoif5H
 Ly+xqtpPKXvoUGUinFbsZTUklnLXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=4pfWu7Pkfb9s8wp4MI
 GXbsrQI3Zh1+fqAizTV9tlkwA=; b=A073ohWMCJpn6NG9FWQ1M51s54Epw8uUsI
 WYkTDJryHHItTD9cIbczRJK68BFkba1kfu2GCptrJ1CJnayJUCgI9wN4wFieKyjY
 5WDjB5BW+U6D+THa/gcPBpFWsylDZEdJ1ZYhJnNDix2qgEtehsA35mJRm1HJKv5I
 sIGjYfRqbvKMZbTJ1jeZMShmuDOI1wvMBTIZErcnJmi8f+kQP71JoBN5RJu5+6sw
 w7M94g56czRyvqbN0zCRjlb9Yb9U3H6v5vuKra7VIGXb5zaI4SK184WYcwLuUMUA
 yQrvoPOI2xW9qDBUemXjVNcfmRIWXxJ6RNrrIfppf7kWleJuy9pQ==
X-ME-Sender: <xms:VJzdWO1g5F6uV4zD3DqNRSq3cHM3EtNMOfquQhQzxmDzzHYxtvIUPA>
X-Sasl-enc: MVDalQpAYeibN7k+uDl6tcnOVVKyImkdx+EI4yoUB4kJ 1490918483
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2927E242B6;
 Thu, 30 Mar 2017 20:01:18 -0400 (EDT)
Message-ID: <1490918473.6823.1.camel@aj.id.au>
Subject: Re: [PATCH v6 0/5] i2c: aspeed: added driver for Aspeed I2C
From: Andrew Jeffery <andrew@aj.id.au>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de, 
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net,  marc.zyngier@arm.com, joel@jms.id.au, vz@mleia.com,
 mouse@mayc.ru, clg@kaod.org
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2017 10:31:13 +1030
In-Reply-To: <20170328051226.21677-1-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-VM3AeldSdseypz41TxCF"
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
X-List-Received-Date: Fri, 31 Mar 2017 00:01:30 -0000


--=-VM3AeldSdseypz41TxCF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-03-27 at 22:12 -0700, Brendan Higgins wrote:
> Sorry for the delay, I went on a long vacation prior to receiving feedbac=
k and
> got back in the middle of a hardware bring up that consumed all of my att=
ention
> for an extended period of time. I will try to plan upstream submissions a=
round
> my other responsibilities better in the future.
>=20
> Addressed comments from:
> =C2=A0 - Vladimir in: https://www.spinics.net/lists/linux-i2c/msg27387.ht=
ml
> =C2=A0=C2=A0=C2=A0=C2=A0and: https://www.spinics.net/lists/linux-i2c/msg2=
7386.html
> =C2=A0 - Wolfram in: https://www.spinics.net/lists/linux-i2c/msg27476.htm=
l
> =C2=A0=C2=A0=C2=A0=C2=A0and: https://www.spinics.net/lists/linux-i2c/msg2=
7483.html
>=20
> Changes since previous update:
> =C2=A0 - No longer arbitrarily restrict bus to be slave xor master.
> =C2=A0 - Pulled out "struct aspeed_i2c_controller" as a interrupt control=
ler.
> =C2=A0 - Pulled out slave support into its own commit.
> =C2=A0 - Rewrote code that sets clock divider register because the origin=
al version
> =C2=A0=C2=A0=C2=A0=C2=A0set it incorrectly.
> =C2=A0 - Discovered and fixed issue in implementation that caused certain=
 slave
> =C2=A0=C2=A0=C2=A0=C2=A0devices to misbehave; the cause was that the mast=
er IRQ handler would return
> =C2=A0=C2=A0=C2=A0=C2=A0control to the requesting thread after the last R=
X or TX command was handled
> =C2=A0=C2=A0=C2=A0=C2=A0such that the requesting thread would issue eithe=
r a repeated start or stop.
> =C2=A0=C2=A0=C2=A0=C2=A0This was incorrect because the time taken to comp=
lete the completion was too
> =C2=A0=C2=A0=C2=A0=C2=A0great. I fixed this by rewriting the master IRQ h=
andler so that it now
> =C2=A0=C2=A0=C2=A0=C2=A0manages the entire transaction only returning con=
trol to the requesting
> =C2=A0=C2=A0=C2=A0=C2=A0thread once the entire transaction is complete.
> =C2=A0 - Rewrote the aspeed_i2c_master_irq handler because the old method=
 of
> =C2=A0=C2=A0=C2=A0=C2=A0completing a completion in between restarts was t=
oo slow causing devices to
> =C2=A0=C2=A0=C2=A0=C2=A0misbehave.
> =C2=A0 - Added support for I2C_M_RECV_LEN which I had incorrectly said wa=
s supported
> =C2=A0=C2=A0=C2=A0=C2=A0before.
> =C2=A0 - Addressed other comments from Vladimir.
>=20
> Changes have been tested on the Aspeed 2500 evaluation board, as before, =
and now
> on a real platform with an Aspeed 2520.

Looks like there's going to be another revision of the series, but
regardless, I've applied and tested v6 and had no issues. So:

Tested-by: Andrew Jeffery <andrew@aj.id.au>
--=-VM3AeldSdseypz41TxCF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY3ZxJAAoJEJ0dnzgO5LT5SpUQAKzEsBbUHfSehE3tQehmNc5l
FKYc8CgZILDxm6IdGjS5uxi7dYhB1Ubg22N7so+wlfaucpOZMrizimTPIbuw8b/R
YCx1/H/LRaANRbqV0ROuxIzDaUD79vcDcS9PtITllZ7NYrfOGLSKdZF4+6a5WN4V
Zc/5bcDU1edh7NrDm+hrA7PZOn9bKGHE0wRcEaBcV/vSnuZxe9GPmQtrkJ+tQ5Hv
7xN4s81VwWjR+4QR73sWZkjKue4u01uvkApakM/nzUbMb3UhoXJnCwHGS5iMXh0k
W9N0bAIeKs1VOzzxXqsE9x/9OvKCrNBKlkrenJ9SOASH7mEBtpdhGAxhQz/zdT2O
sA44AuHOPmPGh0YlyhyTLensoNRFt14od/YVW6CIVc0krlgou79yJbC9hg7+A3aP
pt548UCtnzZdtZ8LKp+cLUsEDAV6rPyAlbwPBKndfgNKqYbQFS95R9gtt2ltC827
E4ufUd3ETQiOWTN4/3AXyAs/f/Un76HxSiZcEDpn73sFYnTDV6VCQZV/X7gckhao
oTMQo9xZNaE1J0Vb+/F5FEdudl/r2dMjZMenrEgXTKPJWkvu6YmVfpXgjExVFCf+
DWe+/96ugv9NZ7NYfm7pQTOng/HiyR8A26fRaG9s1a9dFyDQtmRW7WmPdeTSLSPD
rtg+77Pddb6ywr6iDMuS
=xKL1
-----END PGP SIGNATURE-----

--=-VM3AeldSdseypz41TxCF--
