Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hJ5VXXBY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZuPGVzVT"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMnGD0M3gzDqnN;
 Thu, 26 Oct 2017 11:00:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 15C2420BDA;
 Wed, 25 Oct 2017 20:00:48 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 25 Oct 2017 20:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SlsbduBu5IAVBSTUw7sSGxpCPQaNEZWRrLxfaldwvNE=; b=hJ5VXXBY
 vm3+we96flmzbhdsAzm4KkME8IOqcgJXbtxpyUrOrRLCWdt5XAdlBlDi37XBmZGJ
 WKLmgqoaH7L6s44ngQQPDqK1PqI9y0+uadTawMgpri2vsrp3yQmK1o0uSsQ1gbDw
 7fyOrDb0k4lQC6ehYp+Vlqnp8zK/ZE+o41AR8B3DsEQZGVVmwe3X4io78hD6Ay7o
 dzxgOFIaX+REP9QGF+A1G0Ie1GcjEkQnJnW181lT8l46LOSupieIbz7qvVejzY5q
 rhXsB6C0uVnuaFG4U9bW5xBMcx7hCkA+wB5mP6HtDIWC0tl/H+zBdWRssEhbOZeK
 2AL07sAvGAgqiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=SlsbduBu5IAVBSTUw7sSGxpCPQaNE
 ZWRrLxfaldwvNE=; b=ZuPGVzVTIWq63JL4tW3zoJ8MvHr8H3sWcz5IGqS1Lz6CB
 QOA4VDP9JBCiZvFDx9y67vK8gF8eJ+aocZJEgSSLksca3j7cJTKEPv9HCLszGPNm
 BZX8hUXVt/Unri9niA4u9hMhspgI3nCLFnG6wFbFrhhSRnewqH83KKnPSRhSFeHr
 15i3mmIkNbpER/8Aeg+gTBAWxlmfUiBvq+20gYMz0eIl4ovsbpXuBcoFA1BVzxQa
 milYpnD5FQ5QP5XSJZfnkoBik01wi6EU9bC5WpYjW2Dr84J4JIHZwLrKOgkOpqJY
 I1+QR2XuQUxRvm45vkau7lVvivaWKlw2Vx4BCNNuA==
X-ME-Sender: <xms:ryXxWRSFG6T46dlZFFr38YeeGnT6jaCpWfzl3RXwzsQV6IXb5DPOig>
Received: from keelia40 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0973E7F967;
 Wed, 25 Oct 2017 20:00:42 -0400 (EDT)
Message-ID: <1508976036.13477.3.camel@aj.id.au>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
From: Andrew Jeffery <andrew@aj.id.au>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Charles Keepax
 <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan
 <ldewangan@nvidia.com>,  "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>,  linux-aspeed@lists.ozlabs.org
Date: Thu, 26 Oct 2017 10:30:36 +1030
In-Reply-To: <20171025081141.uczvbfstmt3jcisw@localhost.localdomain>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-2-andrew@aj.id.au>
 <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
 <CACRpkdaW5jMEh_OR2oiy_Bc-6Cb+GM1Uap+1u2T2hw85CwBh3g@mail.gmail.com>
 <1508488347.24322.51.camel@aj.id.au>
 <20171025081141.uczvbfstmt3jcisw@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-aw/Ol/GUAsa/IMnjh/7q"
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
X-List-Received-Date: Thu, 26 Oct 2017 00:00:53 -0000


--=-aw/Ol/GUAsa/IMnjh/7q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-25 at 09:11 +0100, Charles Keepax wrote:
> On Fri, Oct 20, 2017 at 07:02:27PM +1030, Andrew Jeffery wrote:
> > On Fri, 2017-10-20 at 09:43 +0200, Linus Walleij wrote:
> > > On Fri, Oct 20, 2017 at 9:17 AM, Linus Walleij <linus.walleij@linaro.=
org> wrote:
> > > > > > On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.a=
u> wrote:
> > > > > GPIO state reset tolerance is implemented in gpiolib through the
> > > > > addition of a new pinconf parameter. With that, some renaming of =
helpers
> > > > > is done to clarify the scope of the already existing
> > > > > gpiochip_line_is_persistent(), as it's now ambiguous as to whethe=
r that
> > > > > means on suspend, reset or both.
> > > >=20
> > > > Isn't it most reasonable to say persistance covers both cases, rese=
t
> > > > and/or sleep? This seems a bit like overdefined.
>=20
> Seems reasonable to me to just expand the existing stuff to cover
> reset as well, I don't think that should cause any issues for the
> Arizona stuff.

Great. I addressed this in the non-RFC series.

Thanks for the feedback.

Andrew
--=-aw/Ol/GUAsa/IMnjh/7q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8SWlAAoJEJ0dnzgO5LT5W4MQAJxWfNFjoqzWSR7SAQqX9XPw
Avk/BBnlqsYEtjb3yVJY1gCn2JafP4V9EmiShLaUN0gqVONOxGix7gLRJXVr59N+
dMjbxc83iz7xz+KS2N4wFFJk134zuw0olkpmonMyxcSkLheRm7FODjg1CysYg5ys
t67DLyXjq2zs2ikBIO18qnL0gn1wB0l8K9WkEV5St+w1lwlYc6ekgEvF07ERXxvp
65aVjyVXF66dUsP5W0DidxTxxxU1N5h0aRh9uhELXscmCopXo8xqJrksPnLwJaO2
SN2jBeWen+GRJlQA3H+6+32G2vIqXJ4PoRUxL6PhsRBu42j80hpgSA9A3ztVpj1M
p485dd7IljFD7V+HGdoDv5rZ2Kx0p+A0IVubxE4NsDZvLYJNHvfqsDP+7Cs/HaLE
ZAL+UOpcwWT4A/gqISwpxfpt7r4SJj4e6RSdb3Fc7rWTaZpy7LXQPci0hQS8qXg6
ZRPD3l8ji0Q0r6mGPaU0sIbAYiwm8tp+cJWaBHBslF/Xixd58f5XAI0HDo20+HVR
QlUALHwsb7Di0NWV4eXedSk8kuE8m9FxD8kuZsCM5njPag6Dqvi0MGpYPm8IVYVI
9tys6RrSMnMS9QQnub1Jzq1D7Cv4EE84pWVPd6tsl3Y8okeavn/gulYartRSWE90
KWjWDqN9sdBemHBxXyG5
=e34t
-----END PGP SIGNATURE-----

--=-aw/Ol/GUAsa/IMnjh/7q--
