Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJWtZ0njrzDrLw
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 11:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="O9UGRAr5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GLqseipl"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C5BDD20A93;
 Thu, 27 Jul 2017 21:47:15 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 21:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=rdU7lcKs2E1e3OWQTY0cYjS8Plra49hdU7VHzNMfx
 Ak=; b=O9UGRAr5WCDRTavMqO7J1X6kpp3Ry3u22miCJzTY0/svI92YQC447oTjR
 smfnq1Q1aEcnjC77Wwww49iEjrm2N8kjVinpPAZni0y3tl2UHRZr+CYSiztgyui+
 CepFOCjmQay2/t70tdncqrK6ws7S1JizcqhmbY1Ec4GlsNGIS5D6iXQ94+WjH25O
 hwpOeOwEOXuALx03TOfMNcREU4JLHYLmv9Pioa1i1TvvNIfpMyY6nlXqVipXrxig
 mRvZrrxY9CGgsiWYk4Mi94ajoHYfS0xn15jhHO6oVtsC6q4Sz47Y7ynGybW5MONV
 /3O1fx2Bh7+EQUfsmqncIodBZ4+Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rdU7lcKs2E1e3OWQTY
 0cYjS8Plra49hdU7VHzNMfxAk=; b=GLqseiplZS0UKPZJVN2Kb3vLM3udNlDgLG
 E+8Unx83SszjW6fIzP+w9if6jSxLkN452h/LUvRfaRSswIjXMH7Zlg+Eqghs9MOr
 wJfbwqpx8c70iFKdnVKX0g3cwkSKjBWnduuDtGVv4Qy2AqAlnaIvRDi3JRh8K20J
 Kf5VorhHLMJGYMdoueSPqrbGz8Mx97JVRkPTRj79tfTb2oInomDkYmdZSnMEWp06
 eDWmZJ90YchrkJJxDErxU5ekNrysG06hy7B7H8+eqsOn472JiWlB0aFirY3RhEEG
 dLfc70imQiuSCadqOBcIaCiNmp1MDeIhnlU+fope68MB6KdT5NyA==
X-ME-Sender: <xms:o5d6Wc0eiTACIswGYqLHoUyx-7zL7Khx-4_petPUVQiuPAup2260cw>
X-Sasl-enc: AtX464vwxEfUexq//pw/b5VALzqyre69nsmis+uciPdg 1501206434
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id B10727E1BE;
 Thu, 27 Jul 2017 21:47:13 -0400 (EDT)
Message-ID: <1501206427.5179.24.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 2/4] dt-bindings: watchdog: aspeed:
 External reset signal properties
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, msbarth
 <msbarth@linux.vnet.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 28 Jul 2017 11:17:07 +0930
In-Reply-To: <CACPK8XeAF5bDPbi6Z5MOv0d-xD8Fj2YyVSNFdVa0P4o32FYMYw@mail.gmail.com>
References: <20170727101647.26960-1-andrew@aj.id.au>
 <20170727101647.26960-3-andrew@aj.id.au>
 <CACPK8XeAF5bDPbi6Z5MOv0d-xD8Fj2YyVSNFdVa0P4o32FYMYw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-SMm5wX0+CITAqd4Oa4U/"
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
X-List-Received-Date: Fri, 28 Jul 2017 01:47:19 -0000


--=-SMm5wX0+CITAqd4Oa4U/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-07-28 at 11:11 +0930, Joel Stanley wrote:
> > On Thu, Jul 27, 2017 at 7:46 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > For the AST2500 and compatible watchdog controllers the external reset
> > signal can be configured for push-pull or open-drain drive types, and i=
n
> > the case of open-drain driving, active low or high.
>=20
> In addition to this we should document the pinctrl phandle: the fact
> that it exists, but more importantly how that interacts with the
> hardware.

Yeah that's a good suggestion. I'll make a separate patch augmenting
Chris' words for aspeed,external-signal, and I'll hold off on resending
the series until I get some feedback from Matt Spinler on whether it's
fit for purpose.

>=20
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 ++=
+++++++-
> > =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > index f526b003b2e0..7aa885f620ef 100644
> > --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > @@ -36,10 +36,18 @@ Optional properties:
> > =C2=A0 - aspeed,interrupt:=C2=A0=C2=A0=C2=A0If property is present then=
 interrupt CPU.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
If not specified then don't interrupt CPU.
> >=20
> > + - aspeed,alt-boot:=C2=A0=C2=A0=C2=A0=C2=A0If property is present then=
 boot from alternate block.
> > =C2=A0 - aspeed,external-signal: If property is present then signal is =
sent to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
external reset counter (only WDT1 and WDT2). If not
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
specified no external signal is sent.
> > - - aspeed,alt-boot:=C2=A0=C2=A0=C2=A0=C2=A0If property is present then=
 boot from alternate block.
> > + - aspeed,ext-pulse-duration: External signal pulse duration in micros=
econds
> > +
> > +Optional properties for AST2500-compatible watchdogs:
> > + - aspeed,ext-push-pull: If aspeed,external-signal is present, set the=
 pin's
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
drive type to push-pull. The default is open-drain.
> > + - aspeed,ext-active-high: If aspeed,external-signal is present and an=
d the pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0is configured as push-pull, then set the pulse
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0polarity to active-high. The default is active-low.
> >=20
> > =C2=A0Example:
> >=20
> > --
> > 2.11.0
> >=20
--=-SMm5wX0+CITAqd4Oa4U/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZepecAAoJEJ0dnzgO5LT5OEsQALi9WiS9JhxGt0cCAfxQcrtM
MmUt6GgT0Kf6AFucgK+546FJdk4ZWkd8SpYMTQuBBxLLy/rvqmvBUVskEi3sRmfP
BVoqSIxAoVsq1jLutSjK13EGdLNmy86dybwDfGT39U/NHr9F7wa7as58WjPw2UAG
p1LlKpQ6rCZgtAQlIVy5PnCeGQN0ylCpsq8mn4FIzDRNt6S6Ie8wFDa94IhGXF2w
CwcRZDuwFCLUWWXOZKgTqU1/R9+w9OIGAB2AnrF3bhU91EUPgcB8h79lgm1Xhy/J
9MmpFp9keEQO0VzERMl/KeIofNNp/BJvWbgS4pQjmhBPn/WaNcJIIeeIkB8Br2QT
BI6J8QIVqRjgD04AsZ2qAe0MEQmxhfUYVrxNs7wAe+Sdyi+KxREYNJeCr+CxFks3
q+0hXLSt26t/AKXSYhz7x8sW4pAanpHhxSIq7TL3CryjAbczuZaoC571Rpx1iRDV
h+/6Qtmlv/cpAI09pTmKgxYt4NNosXYUyiCM2dKgAlbCrQufILG6JviC/Bnz3Q4I
R1D9PER3p0JJPe3w44lcYoY2SOMP+OP64yBdce1r2XpU8D+/P+PaLTTJbn9uEc1Z
liyJNoBKPWK2wWhBrxzVck4jyKllYx7EV/r6nz+QjFO+L5kMiWE1MskPjak6G3t8
LBq5EdN/Sqso2yOBFd2L
=aEZS
-----END PGP SIGNATURE-----

--=-SMm5wX0+CITAqd4Oa4U/--
