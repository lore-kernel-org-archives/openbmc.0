Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sl6LT2vSszDsfg
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 17:55:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=MsmMRAxD; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=nePo0Zs1; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 30BE020567;
 Thu, 29 Sep 2016 03:55:10 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 29 Sep 2016 03:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=pyGXr
 GSko8A4lCpzkeBV+oEDr9A=; b=MsmMRAxDpciU5yJTIr6HDsis3EHSWJAQvT5lq
 VJWCXRa8oF8ksX92Bq+LYEi8Xzt0TQb8n7nSnS1nhMilid64JXUzgPoIC17SV8HS
 sasNUFVUCQhvrldb3moy7Q7NyLzpmfSh0HutP08gxnQ64XEGO7O0N0Gqeo1eoB6W
 7yFcLE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=pyGXrGSko8A4lCpzkeBV+oEDr9A=; b=nePo0
 Zs1WEKen+uRtgggn5faxYdN0GT/IU2t03xybAGDiOAgDOuGgUH2VoI8LGYV1A41+
 sfH0UJCOM6JU5AnQpEws8VC9WFbRtX8B0aH8yLFkSyEfQ1TKZn6t9zLe5WJFhmmf
 IzMArkJoIqaZquDSjrPE5cLEV7HO3TnKolcosk=
X-Sasl-enc: lgEfHUwn+Ewnv8kfmy+DOnmUoUKgyoQF5ijDYIxpWdMb 1475135709
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79533F29CC;
 Thu, 29 Sep 2016 03:55:06 -0400 (EDT)
Message-ID: <1475135699.24463.21.camel@aj.id.au>
Subject: Re: [PATCH 5/8] pinctrl: aspeed: Enable capture of off-SCU pinmux
 state
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 29 Sep 2016 17:24:59 +0930
In-Reply-To: <CACPK8Xc7y3GtcJCVYYs-JKTqBZvqVeZaz5MUk=UX151SX1xEFw@mail.gmail.com>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <a266046d34009e6e92c4c76699c550c2ba44bd5c.1474986045.git-series.andrew@aj.id.au>
 <CACPK8Xc7y3GtcJCVYYs-JKTqBZvqVeZaz5MUk=UX151SX1xEFw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Vy7UROloIyw7sybRF/wJ"
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
X-List-Received-Date: Thu, 29 Sep 2016 07:55:14 -0000


--=-Vy7UROloIyw7sybRF/wJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-29 at 16:15 +0930, Joel Stanley wrote:
> On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > The System Control Unit IP in the Aspeed SoCs is typically where the
> > pinmux configuration is found.
> >=20
> > But not always.
> >=20
> > On the AST2400 and AST2500 a number of pins depend on state in one of
> > the SIO, LPC or GFX IP blocks, so add support to at least capture what
> > that state is. The pinctrl engine for the Aspeed SoCs doesn't try to
> > inspect or modify the state of the off-SCU IP blocks. Instead, it logs
> > the state requirement with the expectation that the platform
> > designer/maintainer arranges for the appropriate configuration to be
> > applied through the associated drivers.
> This is unfortunate.
>=20
> This patch kicks the can down the road, but doesn't solve the problem
> for a user who wants to configure some functionality that depends on
> the non-SCU bits. Because of this I'm not sure if we want to put it in
> the tree.

I agree that there's not much functionality from a user's perspective,
but the "kicking the can down the road" assessment might be a little
harsh. Given the lack of user functionality it becomes more difficult
to argue for the patch's inclusion given the additional complexity, but
it does mean that the g4/g5 drivers can completely specify their
dependencies and not have the aspeed pinctrl core do the wrong thing
when it encounters the non-SCU IP offsets. It gets us half-way to
having the pinctrl driver actually configure the state (knowing what it
needs to configure), which I feel is more than a kick-the-can-down-the-
road boondoggle.

>=20
> However, I'm not sure what a proper solution would look like.

So if we accept that a proper solution includes specifying the off-SCU
dependencies, the remaining question is how do we tastefully apply the
desired state on register-spaces the pinctrl driver doesn't own.

>  Perhaps
> Linus can point out another SoC that has a similar problem?

Or failing that, an approach that is acceptable...

Cheers,

Andrew
--=-Vy7UROloIyw7sybRF/wJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX7MjTAAoJEJ0dnzgO5LT5xSIQAIgZqQDmsguxEVfI8v/zVJHA
UdIlOiLW8wUP5LToIF0JHqT0XgMDp6PlBVb7FCCbn10AknoQOG/1ogZpNoZebVX7
tuD5tldeSi+lLelpbvTrwue4m9gvRu8FwjnNJv44dIXBMFhm/Zs4enYnh9KaNeZv
gdqf0+ClCo6yLAm7TSK16Nc16BRct3YqSqaUrvytqT5PzGaycogJNRx8bc7o/Tx/
D14gH1arZOSzumvQRrpvq/URkRUsZDE9JH3sovDttbd/Mb9BqiXhd+kkRZcqeUsf
gUP8kuEHArfyAE7i4zZcsG9W8RHY2DGHLShOyXg7VuDRNPtgJYSkEHhypCzC0tnR
6zurYRu2bEZVnUgDspw6ACdfJVypkqIAfLIJUVf3u0rb2PLTkoDOcNAVJCyNC7LS
vIFrrZftonNpORwYoNmrzthL5CjLPLVw7T/XZMZrupxDmOV2QgCOOTrcxosqlxF4
K/od1reRhhfiCkDdjDLHSdNF5MRNb2snh99pu18G2ng6vDD7WOPnmFz25RljwQWi
zJC8XAv/ZJ2HaIqGq95b7v1Xp6uza2hMX3yPqEW1N6IFqifCLqWky/Ac9O3lmAM1
+Lgoz3YD+M2JSStBuqTQBHtsiHEAERMD032hFIE6dKzpkaITZaZT2VxwK04deUdx
bKAxH1NxY59RcrkKAfpk
=vVsy
-----END PGP SIGNATURE-----

--=-Vy7UROloIyw7sybRF/wJ--
