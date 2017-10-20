Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JPuiKJNK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="R/66A0GO"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJHW20zdKzDqRQ;
 Fri, 20 Oct 2017 18:29:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C69F20E52;
 Fri, 20 Oct 2017 03:29:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 03:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zLeu+gz1Ta+SqOGJXAN2RlLxyk0p4JR3uTEKy8snY+M=; b=JPuiKJNK
 OfeHPrHfKZ41t57cL7LILc/VcnXvTAsaA9+cJ3Nca3kP+sHQqDYtphRocrpFnrah
 RlcG2idwPZrwXRvXk6goK/2eeoUY6UQ8vWKWhnwStWU6izbiSFDKPBEGQVIsiC+P
 84GofZvUSRgJCF6wC7/fQbRlxIX/rM5i5m7Qg/V6MKWcUlxTg6B6dfP1TMlrgzMp
 OknAE9t8dy81qY5Gx9om2p1bshL19pBkn1LBXzysNdXNlp3EiAnFyjw2hEAdSRlU
 lmkmIHKBfh9a5uPgUvofs0rtlXcag1w8QbW15xFAzNVm1vzgUjcJlFuXsUZh7St6
 2ZYrzs1qE48V7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=zLeu+gz1Ta+SqOGJXAN2RlLxyk0p4
 JR3uTEKy8snY+M=; b=R/66A0GOOQzE8IxXy6epkLXSEtEc/4RqKK1lszrbJjibv
 WRCaQtg/EENDQO2PdAntl1niR7JVudALx9/U8aRgvESHHD/j2rJ0RJuwARLiH3WS
 cBtPVa9U9jqawejgLtXVL6ccfdxmxJWQoVZOn3NNUAn6a5HTlMJkjcy3dQrJ1IxT
 wg6ulQh+8rUnjNCAyb9TWSislvkKLc5IuXQaSUSrl3YJGWMXDpS87rzRxe6Pjc3G
 DV2tSZGtmhOrn3iZq+8Jw/rgmgkwsUnauF2YcvIXJmO2nQOXShHJRAqrQt9+nwQS
 /i8+wJKwX0yqgjKvsCz3qa83rIDorFKq5/gYAMhlg==
X-ME-Sender: <xms:66XpWaC1XllNE24Cqy9TknOCGyVY3lxZpQlhoxLaqRNOrkaA_oD4Bg>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB44E247DC;
 Fri, 20 Oct 2017 03:29:42 -0400 (EDT)
Message-ID: <1508484575.24322.43.camel@aj.id.au>
Subject: Re: [RFC PATCH 2/5] gpio: gpiolib: Add OF support for maintaining
 GPIO values on reset
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Charles Keepax
 <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan
 <ldewangan@nvidia.com>,  "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>,  linux-aspeed@lists.ozlabs.org
Date: Fri, 20 Oct 2017 17:59:35 +1030
In-Reply-To: <CACRpkdbxOen3ohwmDc8ZNWkirn3mNHaGiZq1O-6VnOjhvFcw+w@mail.gmail.com>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-3-andrew@aj.id.au>
 <CACRpkdbxOen3ohwmDc8ZNWkirn3mNHaGiZq1O-6VnOjhvFcw+w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BCytwq9eSiP4jHVTrvre"
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
X-List-Received-Date: Fri, 20 Oct 2017 07:29:52 -0000


--=-BCytwq9eSiP4jHVTrvre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:18 +0200, Linus Walleij wrote:
> On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
>=C2=A0
> > @@ -32,6 +32,7 @@ enum of_gpio_flags {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_SINGLE_ENDED =
=3D 0x2,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_OPEN_DRAIN =3D =
0x4,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_SLEEP_MAY_LOSE_=
VALUE =3D 0x8,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OF_GPIO_RESET_TOLERANT =3D 0=
x16,
>=C2=A0
> Now you're mixing up decimal and hex.

Ugh. Whoops.
--=-BCytwq9eSiP4jHVTrvre
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6aXfAAoJEJ0dnzgO5LT5CVcP+QEkSzpGSdgHTFWo1m8kUNxl
+aDVPbfR1xNybZrDRtMoiMnAHHqepqMqskRV8khGX6UabnPvUZjHMf1WGoJM1Alu
Q3xxyVUXu788++RsJPP7ByVMfS1Tjju6EYJOeKMbhouflcrArKYakquKkGyd7W/2
4h8sjx9pVICn+Gy0PZKjU/VTfCmQBKymyvJOIs32YXyupCN5LSxSIaeVQ4UJD18a
U0dXN8fa7JyiQdoI9VYqdU1Y8RBX1TjX8XN1iFqojy3J5MOpgN/DaMIFZKwlR3OC
+7TToQXoRHkfZTCf7mJUPpxYxlef8oTqAEC6PrHnnmq4FzfJBamta9km0NWri+4C
wKMLqRQO6btuNkCL3uOIEna1YsdYrA8A884nel8HWb8eP/7xrwT+Srh54bYCGaUo
lFm3ppBT2jG2VOadjxzPJAIlZRfHgDNryr/BO+QLYftIPBOuP77l19iLOVSXHGDS
VVt6CARmXCtWAI9guvgnugHA+2OlnVtoab4qZJISQsjKIRMd3WX1TmMgOlvKwD8y
Y0lNIsa6UpgIUPfoaSEC47APrOsBTId74wd1mUQaLnYpBDQjIuvn5vR/lyXSUPto
5crMFyO0bZBGToIsUKVEx44s4RdbD7wSfz8lDx+XsXOPi1xpI2RiOnW/4vt+Hsw8
hYqxksWxCTYiGYFn5G8l
=xe2g
-----END PGP SIGNATURE-----

--=-BCytwq9eSiP4jHVTrvre--
