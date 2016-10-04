Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sp0yj2zvCzDrKY
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 12:03:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=heDIQRdg; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=CxwGwQua; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 416EA206AE;
 Mon,  3 Oct 2016 21:03:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 03 Oct 2016 21:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=grLwW
 i3NOS4oCzDQxMJalgcCMZQ=; b=heDIQRdglUS/cpeHHNVpIy4Pq+0KWKs3TYkc0
 L+T0fkGXiv9wSj45iIA0cf7ywY9IkG0ucRArLDAppxAzli7kfx8qvKBoCGiFOuQ8
 jlnBURZY0+/+BNHhDzEjjrIUColjbf5qdJFYD6HVjvdBLSlTi8hxE8rXJvthpuIh
 2YAK7g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=grLwWi3NOS4oCzDQxMJalgcCMZQ=; b=CxwGw
 QuafyoRBRDT2Sz0eTB0dbKHFMLVdfpca1Yo5x2Q0zySn5fWjhPGx8/ZSkg5IfYAt
 Q7S+x/3fA7UbQPJOpsNosk1vUy652vD36SiPBAnCsweSeS+XaZ6jkNsZ8ZUL79A3
 DpSt8KdvAIONQx7jFNpzw1dHUD715ZOxWnMVW8=
X-Sasl-enc: urEctNXSTrmliuFfom2y7WYI2M9X9en893tuJGISgV/B 1475542984
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DCCDDCC084;
 Mon,  3 Oct 2016 21:03:00 -0400 (EDT)
Message-ID: <1475542973.5030.1.camel@aj.id.au>
Subject: Re: [PATCH 7/8] pinctrl: aspeed-g4: Add mux configuration for all pins
From: Andrew Jeffery <andrew@aj.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org, Timothy Pearson
 <tpearson@raptorengineering.com>
Date: Tue, 04 Oct 2016 11:32:53 +1030
In-Reply-To: <20161003190833.GA3065@rob-hp-laptop>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
 <20161003190833.GA3065@rob-hp-laptop>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-3NRTLbmWWQvYFjUXjHHe"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Tue, 04 Oct 2016 01:03:10 -0000


--=-3NRTLbmWWQvYFjUXjHHe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-03 at 14:08 -0500, Rob Herring wrote:
> On Wed, Sep 28, 2016 at 12:20:19AM +0930, Andrew Jeffery wrote:
> >=20
> > The patch introducing the g4 pinctrl driver implemented a smattering of
> > pins to flesh out the implementation of the core and provide bare-bones
> > support for some OpenPOWER platforms. Now, update the bindings document
> > to reflect the complete functionality and implement the necessary pin
> > configuration tables in the driver.
> We prefer bindings to be complete if possible where as drivers can be=C2=
=A0
> expanded over time.

Noted.

>=20
> >=20
> >=20
> > Cc: Timothy Pearson <tpearson@raptorengineering.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |=C2=
=A0=C2=A0=C2=A019 +-
> Acked-by: Rob Herring <robh@kernel.org>

Thanks,

Andrew

--=-3NRTLbmWWQvYFjUXjHHe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX8v+9AAoJEJ0dnzgO5LT5NE0QAKOQ4eHtmtADd4WH2zN9RKBi
GdKv5ia2zRKevryRrzc4hAGZHi3CFVOQgHxS7qurBSUng9qnrCx7UFBIBvhV4iRM
kdLEQuUjB4qurUeX2Ym3S8oLbgLWCiEDVsOg9DPC8+SiBpGXJc6jrd/h4IAI/js9
1NKTZQQiSAmpRuj3T8MhC+myo4OK56rEfalp30OEUnB8QnTiAtXk4DS7cmK2E2HX
HMv9BMREHBV5M4wSJByBNQ1+MPG0PFwfIp/eWkMxh3zJrf3ljPCX5iwZTlGS0qIX
zudvWMk3ffMblj6rhWVGUPMPhpsD6CafNHbGAe+K+7dNdY92ozmv6HBMEz8ug7lv
G97mtnYvDCUNHrDAsA5v1CHVre+hsiwMT9xj3fHzgBl4gkmFkGxhHa12TkqRWtL0
I+znNONJVanV5ETuYGVrVB3K04cnk8e4sqECdti0w19vLmdLMT0NQ0CO58JrQuJe
X8GyRMuLlf3R7meAXQCRf3jxD2umqDHm7XsLjAIbs60g07HBZBMHVihhR2mCHllR
LAUWzxg8j+kFTOJrWZlcrMfEg1/IWZppX2GiN+ya9rwq6AxsUGPClXvxfy4fMhB1
XlX7SIl7a3CLOiLJaGtVti7sQTbC9icID8SCZLHG18zbSQUpF2dv5CDU8Qf4uQ6q
ld+DrBwXYb5z3ZyBFpI4
=0/YM
-----END PGP SIGNATURE-----

--=-3NRTLbmWWQvYFjUXjHHe--
