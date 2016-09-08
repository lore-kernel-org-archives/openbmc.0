Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sV9k056V3zDrq3
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 16:42:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=B/ds7ENB; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=QXPJpukG; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B5E8C20597;
 Thu,  8 Sep 2016 02:42:13 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 08 Sep 2016 02:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=4CipZ
 XxvqxinITu+RUcwwHyO6+4=; b=B/ds7ENBSVB+Jm67CWtLalqu0qHZUb3xD/kZ7
 7FCoISDD0fl5OY2vlFc16y9xN5/6WnUez/HBZJLnO2q0EKwc8CUnLsxQgJ1qv6AF
 +rvPTHOxy1yoVW3/mF8nPT9WZFiFz9DYnHtq9pl0Zdwt5JIp1GzstQePE5AYMoHw
 uOVlpc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=4CipZXxvqxinITu+RUcwwHyO6+4=; b=QXPJp
 ukGya85PIrHKeM8T9L7riBkw8CyGRuSHphEG2q2d833ETSNNyXIPzc0ae96wDSQA
 ldUe+GW67gIurGYFF5sAbfz802uK0/52LyKvXSfNyt43vCekDE1DnIoZyec/enWz
 afsjsGSmTB8+88TB9W9mpfor9oE0U0K4Oma0A4=
X-Sasl-enc: d8ywU/7aQk2PD84C4XV4rZ9toraxrlxezv6wMeYB5dTb 1473316932
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E8E21CCE88;
 Thu,  8 Sep 2016 02:42:11 -0400 (EDT)
Message-ID: <1473316921.10397.32.camel@aj.id.au>
Subject: Re: Celebration in the streets (aka pinmux is merged)
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley
 <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 08 Sep 2016 16:12:01 +0930
In-Reply-To: <1473315093.8689.90.camel@kernel.crashing.org>
References: <CACPK8XeJpNJHaYYEja_BQoh5mvBnFPyaQTB5btDjCj3tP5boYA@mail.gmail.com>
 <1473315093.8689.90.camel@kernel.crashing.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jH3btg/VABBu//BmTta7"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 06:42:18 -0000


--=-jH3btg/VABBu//BmTta7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-08 at 16:11 +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2016-09-08 at 14:54 +0930, Joel Stanley wrote:
> >=20
> > Congratulations Andrew and everyone who has helped with design,
> > testing and review.
> >=20
> > This is a major component of the Aspeed SoC support that is now
> > complete. It allows us to configure the pads (pins) of the SoC using
> > the device tree and/or from other drivers, instead of looking up
> > registers in the datasheet and sticking values all over the place.
> >=20
> > The driver is in the subsystem tree and on it's way to appear in
> > Linux 4.9.
> Congratulations guys ! This was probably the single most challenging
> kernel component of the stack !

I think this taught me a valuable lesson about volunteering for random
work...

>=20
> Beers on me next time you're in town :-)

I'll take you up on that! Does Canberra have enough beer? :D

Andrew

>=20
> Ben.
>=20
> >=20
> > Cheers,
> >=20
> > Joel
> >=20
> >=20
> > ---------- Forwarded message ----------
> > From: Linus Walleij <linus.walleij@linaro.org>
> > Date: Thu, Sep 8, 2016 at 12:20 AM
> > Subject: Re: [PATCH v3 5/8] pinctrl: Add core support for Aspeed SoCs
> > To: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot
> > <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring
> > <robh+dt@kernel.org>, Benjamin Herrenschmidt
> > <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
> > "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
> > "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
> > "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
> >=20
> >=20
> > On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au>
> > wrote:
> >=20
> > >=20
> > >=20
> > > The Aspeed SoCs typically provide more than 200 pins for GPIO and
> > > other
> > > functions. The signal enabled on a pin is determined on a priority
> > > basis, where a given pin can provide a number of different signal
> > > types.
> > >=20
> > > In addition to the priority levels, the Aspeed pin controllers
> > > describe
> > > the signal active on a pin by compound logical expressions
> > > involving
> > > multiple operators, registers and bits. Some difficulty arises as a
> > > pin's function bit masks for each priority level are frequently not
> > > the
> > > same (i.e. we cannot just flip a bit to change from a high to low
> > > priority signal), or even in the same register(s). Some
> > > configuration
> > > bits affect multiple pins, while in other cases the signals for a
> > > bus
> > > must each be enabled individually.
> > >=20
> > > Together, these features give rise to some complexity in the
> > > implementation. A more complete description of the complexities is
> > > provided in the associated header file.
> > >=20
> > > The patch doesn't implement pinctrl/pinmux/pinconf for any
> > > particular
> > > Aspeed SoC, rather it adds the framework for defining pinmux
> > > configurations.
> > >=20
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Patch applied! It's not getting better than this through iteration,
> > it is better
> > to get the system up and develop inside the mainline tree from now
> > on.
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
--=-jH3btg/VABBu//BmTta7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX0Qg6AAoJEJ0dnzgO5LT5e2wP/3C4M54HniiyrTOqmFbhvOjP
MMq9MyoaEbavieuHFtP2pBP5a3E9G+kZKMTofh9OQc706q4K5hziHEeQ5ScwitOD
2Amy86VMGYuWMbyYFMocezMUqF4qoP40sF5H4hwigWztfc/sboLOlAOwlg49nTG/
mnf4YNT33YVU27lyeDa4zQoiXGhSP9ZedsULt8xlqLLikvQbcLZk8Pw5ZDSRLByF
F73GxRTQc4qhkmNTH8JRMPrehhyW7ZJn6Qv16eB3PsA0xrr1KtSwq2EXkCbKQc0J
bgiXeqcSLJP4xeAmUIWaYfSC3Sk2Kqo402xjyaUKeExg3et3yHuIyGvCdoGs8Ind
5+HUYwlfWh09yiF2WTcH0MYS0c9E4Okrpro0GveKjpMxlVpewYmibGyZZYm8EauP
wWKqVasA/Yp0HT67pYx+sWlGYkFFlLg1jJ2WqUVDIFFOl14tEzssC/l7ECc9RpnU
pNeFrL7+ZpxTzxiuAGd9k7jWeSwb+TgSclOV7dP809ioUbgSZ5be9rBj4uKkXsQp
LjyHxgNCLj5G16RZPCgASXqcnUd/hBFlMpJ70P94CIBHvddFZIMlqZ2gfSKHm3Pr
bVkDW9HzHnUgNleDzvRienQHXUQaNvRNDMvEAmy1jZY7J05Yv90f9oicI4z9WMSC
WNaUNLp9ZykWy/LzrxKt
=oMc1
-----END PGP SIGNATURE-----

--=-jH3btg/VABBu//BmTta7--
