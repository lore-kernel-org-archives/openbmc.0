Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSn6W5C0bzDqs4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 22:11:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Isiq9sHT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EYLoZB/Y"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F0DD21E1D;
 Thu, 10 Aug 2017 08:11:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 10 Aug 2017 08:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=3qT8cdy9HS3gimuuviPX/PmRsU2n78qAo42PtLZGB
 tQ=; b=Isiq9sHTGh3d2vKZZgl+5kdRGn9XJB4UuXgLM7PuMw4fLlBdQtfMo2M8u
 h//n2GQF9MQ/0kWST1Xp3W6KsAymBLE0LpXRYrW9W2ZDsKrrVBvjTuDPF6SIk/Z7
 0/fiqQPZQjlTL1fx3gCmV71pZry8LF3mM7TW8MWbNGPR107m11/bON214f7Giv2H
 iG1tmwHL+wg0bCZIOJ82ayM0Jg4gkw0Gnm5pErphABH0Hgcv3Q+/wpb8pjrX5fkV
 qEhudUe8pNcLqcNXrVxK4+mMk9HLI7dWDRGij5C/GNFcu8sbqdvpFr14G6BC87yJ
 1jNJ4/agnv7C69/G57/bI35ofchBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=3qT8cdy9HS3gimuuvi
 PX/PmRsU2n78qAo42PtLZGBtQ=; b=EYLoZB/Yd9eiuwRqLUQ37u7zUev8IvRRO2
 7mW2oCMG4+udL/kxgEy52Z70s55YVrk6aKa/eHsQi6h0RrAVG9pl2HraPRtKhfLP
 RD4XlFCcb8/z84/IKwwv9FB0Pn70L1wGy5/mUqu1qotVbHAO+Z+WmVH3JyoDGw0u
 Lvizj8Z3/Dtv+avUqKPdXWgTWJLHC11S4hUVuGOrFOM+suGcZBvhl5x6BBjdS1OB
 3HIM7IKmDs2V+TheQTfcEkdnN12L+3oRuuTZ/wNr65L/IK2tGSJSQKfW4N47DF3H
 /H41zwusCaz+NbCAl7mN9BNJUGn8GlH+OVBS4aHebo8vojLzYEVw==
X-ME-Sender: <xms:YU2MWdlUPSlOF0U-SXu2HQBfkm0hlvF-1fXbKF3a7BiqLpz5LQtZMw>
X-Sasl-enc: DBy4E2IE4enGPZePpkqQigoaDh21x1MKA1bZcZUiqCzt 1502367072
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 295AE7E300;
 Thu, 10 Aug 2017 08:11:11 -0400 (EDT)
Message-ID: <1502367066.7946.19.camel@aj.id.au>
Subject: Re: AST SOC gpio pass-through support
From: Andrew Jeffery <andrew@aj.id.au>
To: Yong Li <sdliyong@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 10 Aug 2017 21:41:06 +0930
In-Reply-To: <CADO9-pe3Q6ZrODj9cfPEYPBVoidN3Mgj9ek++vXMnTrH8JC_qQ@mail.gmail.com>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
 <1502353590.7946.15.camel@aj.id.au>
 <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
 <1502359910.7946.17.camel@aj.id.au>
 <CADO9-pe3Q6ZrODj9cfPEYPBVoidN3Mgj9ek++vXMnTrH8JC_qQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NfVkmYan5OQzX8AHPZXv"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Thu, 10 Aug 2017 12:11:18 -0000


--=-NfVkmYan5OQzX8AHPZXv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-08-10 at 18:55 +0800, Yong Li wrote:
> Hi Andrew,
>=20
> I am thinking about "DYNAMIC DEVICE TREE". Maybe we can use it to
> change the gpio pass-through dynamically?

I feel you're barking up the wrong (device!) tree here. It might work
in the end, but I expect you would be better off going with the runtime
pinmuxing or bind/unbind than invoking the complexity of dynamic
devicetrees.

>=20
> Let me study on these docs

Feel free to keep me in the loop.

Cheers,

Andrew

>=20
> Thanks again!
> Yong
>=20
>=20
>=20
> 2017-08-10 18:11 GMT+08:00 Andrew Jeffery <andrew@aj.id.au>:
> > On Thu, 2017-08-10 at 17:01 +0800, Yong Li wrote:
> > > thanks for your quick response Andrew!
> >=20
> > No worries!
> >=20
> > > i will read these info deeply. just a quick question, is it
> > > possible
> > > to enable/disable the pass through dynamically after kernel
> > > boots?=C2=A0=C2=A0how?
> >=20
> > So there is the concept of runtime pinmuxing[1]: It's possible for
> > a
> > device to have several pinmux states that can be
> > configured/selected
> > from process context. Alternatively, a naive approach might be just
> > unbinding the driver for the device you used to select the pass-
> > through
> > mux function(s) - this would free up the pins to be requested as
> > regular GPIOs. However, you'd need to request the mux on a device
> > node
> > other than the pinctrl node, as unbinding that would have
> > undesirable
> > consequences :)
> >=20
> > Hope that helps.
> >=20
> > Andrew
> >=20
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.
> > git/tree/Documentation/driver-api/pinctl.rst#n1385
> >=20
> > >=20
> > > > > > =E5=9C=A8 2017=E5=B9=B48=E6=9C=8810=E6=97=A5=EF=BC=8C16:28=EF=
=BC=8CAndrew Jeffery <andrew@aj.id.au> =E5=86=99=E9=81=93=EF=BC=9A
> > > >=20
> > > > Hi Yong,
> > > >=20
> > > > > On Thu, 2017-08-10 at 15:50 +0800, Yong Li wrote:
> > > > > Hi all,
> > > >=20
> > > > Welcome to the list!
> > > >=20
> > > > >=20
> > > > > AST SOC supports GPIOE pass-through function, I would like to
> > > > > know if
> > > > > the kernel provides such API/interface to enable/disable
> > > > > pass-through?
> > > >=20
> > > > Yes, the kernel's pinmux drivers can configure GPIO passthrough
> > > > for
> > > > you. In general, all the functions are documented in the
> > > > pinctrl
> > > > devicetree bindings:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0https://git.kernel.org/pub/scm/linux/kernel/git/t=
orvalds/lin
> > > > ux.git/tree/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > > > aspeed.txt?h=3Dv4.12
> > > >=20
> > > > Specifically, you are after functions/groups GPIE{0,2,4,6}. We
> > > > already
> > > > have these defined in the Aspeed DTSIs, so to configure them
> > > > you can
> > > > add something like the following snippet in your devicetree:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0&pinctrl {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
inctrl-names =3D "default";
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0p=
inctrl-0 =3D <&pinctrl_gpie0_default
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpie2_default
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpie4_default
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpie6_default>;
> > > > =C2=A0=C2=A0=C2=A0}
> > > >=20
> > > > Specifying the mux configuration in the pinctrl node is
> > > > probably as
> > > > good a place as any, though if you have somewhere more relevant
> > > > you
> > > > should probably use that. Naturally you can remove any of these
> > > > phandles to only select the specific pass-through
> > > > configurations you
> > > > need.
> > > >=20
> > > > If you want to pass-through the whole bank you can also set the
> > > > board
> > > > strapping to make it the case right from power-on. The
> > > > strapping
> > > > register *is* writeable, however the kernel's pinctrl driver
> > > > treats it
> > > > as read-only, as really, the system designer ought configure it
> > > > either
> > > > via pull-ups or in the boot firmware.
> > > >=20
> > > > The passthrough capability is a bit of an odd case - despite
> > > > being GPIO
> > > > I chose to represent it as a pinctrl function. Hope it makes
> > > > sense to
> > > > you.
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Andrew
--=-NfVkmYan5OQzX8AHPZXv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZjE1aAAoJEJ0dnzgO5LT5OREQAKzV/HRpRKyRQygmzqfPRruQ
NJZAhyTljlly34csApi6xxuhQaj9qvjG4/YNMpa8UvuZ0JY6dWp6ZA9F9jzf51de
sBMWPMCMaTziK0RSX8zFlMiXQ3mJQtMyzzawAOq/j/Yfnd3iejI50yunGXHFvjAt
2X98b01RdkyNhGnw7Cs2pXjGou/qHlRQNWxgOGjxeCbrpyR3fvtVPENZXQmcy/aB
S5VaHWoVfhu7N/UDzDF344HUB23Oaa1bsHt5fxJcl9tr4LgFX/FjbxBWcrlrZBs2
2n5rgnb/P+71cFNUiA4cVz+K3/UamIzmsroZJPJ+u08f7YJ8g3vO5gN33d/nX/1e
LEwkNjaSeS3ZxeK8wkzPSqzk7KGyjZ8fYnqiWnuSXTZC7VVCeqaRWvtmQcZ5/r5i
oCQi6zJyjqdpHz+IgeVJ4jMCTGTTuWA7dh7ay7CQcpd4oBzl5duwyduT2ECm1Z6b
pT9F8SnZtQlnS7SwIKrJM42wc1JQPbC/jHZf/7JwWUEkV8zMglqtSUr011loVd2i
Ry0JtXX1OpimiuBZ/miHFzWPXanIcoPAp+nrgAZVZYbOrnzlQarSuABv4jMWJBII
jg/oG7DXQyddK37iCQ+XOkvBygxS2+oge5mA3MjndTw5RNA66yMC6YYotMkzQQk3
wHeLn2rcRUWBGsl72b//
=slFM
-----END PGP SIGNATURE-----

--=-NfVkmYan5OQzX8AHPZXv--
