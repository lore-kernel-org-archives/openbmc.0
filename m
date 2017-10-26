Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CbWj+2Oy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hgh850nz"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMnMx4LSPzDqmr;
 Thu, 26 Oct 2017 11:05:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8060520974;
 Wed, 25 Oct 2017 20:05:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 25 Oct 2017 20:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Z2aIEMI7qP1LsWu3CKztCtd1tpnuRpmfg0rTFpNT72E=; b=CbWj+2Oy
 dTVyDMdkYNN13cGGkUrJAp9Uc9mruNtRYTINxAuRIyugh5GdKH7J9Ziz8z0vUDx3
 boxduYd8fhJzWXy0erypFmMCS7bVjxQIKcysXy1OP7Qb0Uc94wOXht/vPCCbt9xQ
 sizabun0yB7tRcFXHqaVWJJhmv/CUrOj3+JsiqhPq+UmFdNOfPPimFrE8MaRYqWx
 /nguOp0SIPlHb1Ct222tf/RK1B2rjHdUC3D5tOLJTC3ft6p5BNm+jMrY9huArXmL
 hEmgOKEHvLnsiXl8Vh5BNj5HM1Qj8XA0Y9X20NFEGe6je+ObWvf5ZibpSWt7E8/4
 KBlrvoCPJHnx5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Z2aIEMI7qP1LsWu3CKztCtd1tpnuR
 pmfg0rTFpNT72E=; b=hgh850nzSQGFN/3LIeGl0ZDsvYPlP5CYbn2iFmenIu8fi
 GGu1PDhgA8104JxDVkIexNclcg77A+YA1BYo476f6JGdZrYHjZrcettA6mNQWirg
 3SuanPVFanYiSNJ3oJmi0QAjRhTqyBwptEgYjBZoPPOwx0YVYh8+llkrzmc9uGae
 yKYVRrjkCEeH6z4nyHIGbkzZ7s+TtrZURF58/8EEtvwSD6BqsI+OngVHE8F+OH2f
 vo24nJ+fk7mY1GPwjyWxlLGMXHOgSOsdZh4b7HEtfWyMtEmgt8YzwM7drNCN9izx
 EaliyOnxm2zB8YTzgdJMmNpxsPdvZhxwAh+sw9GrQ==
X-ME-Sender: <xms:2ybxWUzPxPU6AITOgwUcAH6jdb8rumDMTV7T86JUB3Q3_WyvArGVcA>
Received: from keelia40 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82CA37F955;
 Wed, 25 Oct 2017 20:05:42 -0400 (EDT)
Message-ID: <1508976339.13477.5.camel@aj.id.au>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
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
Date: Thu, 26 Oct 2017 10:35:39 +1030
In-Reply-To: <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-4-andrew@aj.id.au>
 <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
 <1508490173.24322.53.camel@aj.id.au>
 <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1vx4oX1vugrucEw+S5e1"
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
X-List-Received-Date: Thu, 26 Oct 2017 00:05:50 -0000


--=-1vx4oX1vugrucEw+S5e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-25 at 09:14 +0100, Charles Keepax wrote:
> On Fri, Oct 20, 2017 at 07:32:53PM +1030, Andrew Jeffery wrote:
> > On Fri, 2017-10-20 at 09:27 +0200, Linus Walleij wrote:
> > > I don't see it as helpful to give userspace control over whether the =
line
> > > is persistent or not. It is more reasonable to assume persistance for
> > > userspace use cases, don't you think? Whether the system goes to slee=
p
> > > or the gpiochip resets should not make a door suddenly close or the
> > > lights in the christmas tree go out, right? I think if the gpiochip s=
upports
> > > persistance of any kind, we should try to use it and not have userspa=
ce
> > > provide flags for that.
> >=20
> > Right. I guess the counter argument to your examples is if the gpio is
> > controlling any active process that we don't want to continue if we've
> > lost the capacity to monitor some other inputs (some kind of dead-man's=
=C2=A0
> > switch). But maybe the argument is that should be implemented in the
> > kernel anyway?
> >=20
>=20
> To me it certainly feels like decisions like this should live in
> the kernel, your talking about things that could cause very weird
> hardware behaviour if set wrong, so it makes sense to me to have
> that responsibility guarded in the kernel.

I feel that taking this argument to its logical conclusion leads to
never exporting any GPIOs to userspace and doing everything in the
kernel. If userspace has exported the GPIO and is managing its state,
then it can *already* cause very weird hardware behaviour if set wrong.
The fact that userspace is controlling the GPIO state and not the
kernel already says that the kernel doesn't know how to manage it, so
why not expose the option for userspace to set the persistence, given
that it should know what it's doing?

Cheers,

Andrew
--=-1vx4oX1vugrucEw+S5e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8SbTAAoJEJ0dnzgO5LT5qLEP/jd93Ahv7S0hlwakKByTLmxa
YMg+pf0g8EdII1IpX6UrL5TVxZhKLP+xa7gliK6ed/2FlkLHqzS4uOi3B8ihJ0KX
2+f8eAutg+/iCzqXPADNQWmG17ADTwDltnzuO9R0fmWBeL49nrgEvxaE7PN5tPOK
iG0WYLYb1CFHht0DM4fIvpRW7fYMK0MEVKZxsiOpIUSks+87EVkPd1aeKZdS037c
45FA9zzfO3vtKeUHB63iqho3uDnnBZOrwDmtrjnqTHkfspaBkkz0WIZ+Nf0LgCii
u3y034sAV5ZIY4uPfnag+QTllXciDfFHqkODr5u7aUgklfJWB/ddFsYNMqQ1Q9M2
1mqkO7pHvrl8imrtXVdAETDTrLTMZaODko+NkxoJRz9iusW/fAF6UXy55y70pfbs
fxNa5NAwk9b8P2zjhxSOLd2+T5yDm5b4V/VmjW3E7UgBjYmlhBk1PfaFP/xTWtUX
/aO9s3ugXhYmQDZTv1CSh1gq/dqIA1zb2mr7dUmpn19dMF5g4118B4qB7Y+d6Irb
9+JODzkBg3rsPvFeWO5PD/bWIH2E7QzNrthM+RdJW/3+MuU31MJOQ0IUWdvA0Ul0
5/005r7SHPgsutaaxgN1c5nVeMxbwohS4Ilsn8X6QNo+a/nhBd1Ymb97ZztxkhdF
p6LnTB+3V/A/O5MZ5zqW
=xNEy
-----END PGP SIGNATURE-----

--=-1vx4oX1vugrucEw+S5e1--
