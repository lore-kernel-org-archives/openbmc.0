Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhHcJ29hnzDqNc
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 15:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eJZI5AvD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="o2tYo43m"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DAE4C20BCB;
 Tue, 29 Aug 2017 01:43:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 01:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=/CdTJPmdMeMrDDKDM663AV0x6CLI1HMahRT3LHjDk
 PU=; b=eJZI5AvDe9KtJE1dVO9eEMlFQniFcJKdz6g29B836QFZ76WFHBiQnA0BH
 utHQJnIPrceCeLGtQC81lWTxLTYqjxkWZ4ZRhJJFOH1NGos8JIEpZU6v7AuiV0EJ
 1eWjwbczXfsF6H+msic0WCxP83vBkp4DYFDHg4J9WhCAIOGRVowRdz6yHhbt2fOr
 kuyMD0fQXfyKOMP343ItBy/Ong5yOpxe/f2pc9q3kvh0zPKtvJ8HYdq78M/jjpKS
 2DKIRVtyJWL0Bm4//E+lVt33YULkUzFUlIqgI+IU37/2i7gYSti6+mdcDJiY4lSw
 ppWpznScEgc3rXcvudtZD3Rv0H5vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=/CdTJPmdMeMrDDKDM6
 63AV0x6CLI1HMahRT3LHjDkPU=; b=o2tYo43mO7CLeB1vD3XZErfoP39dzUxSi6
 bEf+SC1otjwS+gb//KMUpnv4+ag3TKty09bWknh+Hw7gG+rvv4J2lhR3dELt1naA
 6Ik3nKp0zoyrnoZ3ai8rAqXlyBe2aDkKh0RreW6NdEYKLeZUMcx0nP9THHz3HsJi
 TdOLUD8pIPu8xMmiammn2XIPlnzJe7gHeBldKMKxUIjEToq2scwn5GTFd8k+/JCV
 UOzTUtcTNnUYmmyNQcCNjK7W39HTbMleDl+nK6kuSBJHOFzde/Z8uEzopx252h+X
 9BR2/PCxrpKz3xAC6cd0vbGTFNFQ2QBts3Ez0+OOwMwKSuvh3QMw==
X-ME-Sender: <xms:_f6kWZqvfJXbnZAbWjxnfVxaX87OLSDIXIoZvuH6CtH1WTrkXVzskw>
X-Sasl-enc: I8+U3hBLpm92RSjnbB1hr98swbNcL6aRhHX5dfOT1YuZ 1503985405
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E3CE224434;
 Tue, 29 Aug 2017 01:43:22 -0400 (EDT)
Message-ID: <1503985397.5933.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/5] Retain front LED state on Witherspoon
From: Andrew Jeffery <andrew@aj.id.au>
To: Brandon Wyman <bjwyman@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, vishwa@linux.vnet.ibm.com, geissonator@gmail.com, Eddie
 James <eajames@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Tue, 29 Aug 2017 15:13:17 +0930
In-Reply-To: <CAK_vbW3gssQkZWTWk-_o-tCFP=SXyVEwNJ3LK5M_E=73RGJzOQ@mail.gmail.com>
References: <20170825065244.488-1-andrew@aj.id.au>
 <CAK_vbW3gssQkZWTWk-_o-tCFP=SXyVEwNJ3LK5M_E=73RGJzOQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-KqAO6nn9q1kcyLqWV0xG"
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
X-List-Received-Date: Tue, 29 Aug 2017 05:43:29 -0000


--=-KqAO6nn9q1kcyLqWV0xG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-28 at 16:11 -0500, Brandon Wyman wrote:
> > On Fri, Aug 25, 2017 at 1:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > Hello,
> >=C2=A0
> > This series fixes witherspoon to retain its front LED state across BMC =
resets.
> > It was noted in issue 2156[1] that the front LEDs came on solid during =
a BMC
> > boot. This appears to be the result of several bugs which are addressed=
 in the
> > following patches.
> >=C2=A0
> > The changes to leds-gpio have been sent upstream:
> >=C2=A0
> > =C2=A0 https://lkml.org/lkml/2017/8/25/44
> >=C2=A0
> > The pca955x patch depends on changes we appear to only have in the dev-=
4.10
> > tree (i.e. they haven't been applied upstream). There's some discussion=
 at [2]
> > but I'm not aware of a follow-up patch from C=C3=A9dric. Certainly appl=
ying my patch
> > to upstream lead to signifiant conflicts, so I haven't yet tried to sen=
d it on
> > its way.
> >=C2=A0
> > C=C3=A9dric: I know you're undecided on how I've approached the pca955x=
 patch - I
> > figured we could argue about it on the list in case anyone else had hel=
pful
> > insights to settle the dispute :)
> >=C2=A0
> > The final two patches clean up the leds nodes in the Witherspoon device=
tree and
> > add the new retain-state-shutdown property to the necessary LEDs. I do =
wonder
> > if we want to retain the state on the rear LEDs as well, but that requi=
res more
> > features to be added to the Aspeed GPIO controller.
> >=C2=A0
> > The patches have been tested on a Witherspoon system, albeit remotely. =
I can't
> > put eyes on the LEDs in question so it would be good for someone who ha=
s the
> > ability to do so. I used the test outlined by Vishwa at [3].
> >=C2=A0
> > Please review!
> >=C2=A0
> > Andrew
> >=C2=A0
> > [1] https://github.com/openbmc/openbmc/issues/2156
> > [2] http://patchwork.ozlabs.org/patch/760006/
> > [3] https://github.com/openbmc/openbmc/issues/2156#issuecomment-3241018=
28
> >=C2=A0
> > Andrew Jeffery (5):
> > =C2=A0 dt-bindings: leds: gpio: Add optional retain-state-shutdown prop=
erty
> > =C2=A0 leds: gpio: Allow LED to retain state at shutdown
> > =C2=A0 leds: pca955x: Don't invert requested value in
> > =C2=A0=C2=A0=C2=A0=C2=A0pca955x_gpio_set_value()
> > =C2=A0 aspeed: witherspoon: Tidy and unify LED nodes
> > =C2=A0 aspeed: witherspoon: leds: Retain state across BMC resets
> >=C2=A0
> > =C2=A0.../devicetree/bindings/leds/leds-gpio.txt=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A03 ++
> > =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts=C2=A0=C2=A0=C2=
=A0| 32 ++++++++++++----------
> > =C2=A0drivers/leds/leds-gpio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A07 ++++-
> > =C2=A0drivers/leds/leds-pca955x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A07 +++--
> > =C2=A0include/linux/leds.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A03 ++
> > =C2=A05 files changed, 34 insertions(+), 18 deletions(-)
> >=C2=A0
> > --
> > 2.11.0
> >=C2=A0
>=C2=A0
> > Tested-by: Brandon Wyman <bjwyman@gmail.com>

Thanks Brandon, I've applied the series to dev-4.10 with your Tested-by tag=
s.

Andrew
--=-KqAO6nn9q1kcyLqWV0xG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpP71AAoJEJ0dnzgO5LT5I8sQAKpdhA3oZZkAoqi3JGzcIXFE
94m0gc5l68BZPNiRVicD+qK1fdLiCSd3O1X0MoUiaQgaT2eR0BfB0dtslodWUNmX
oxkK+aHMJrBILtjW8Hz5Sfk17sx9jFheTxu+zZ4cUFFmC8iQS/1dW+4tvkiEuLyt
qZ9GRnMbt2/Ota1fRvp/0Q1wjFaYyn9FQrnqduMdwrHdwd/tAlcLFocfpdGhaWHs
PAMIi7y9jtL7x45DjoW6CTBYcZaaBfu1Ug5awqrWp/4w0DH6ftw0JKmqN2JFf8WR
3AWjMq4qZXQshpYx7jVJzE45nxCU8Wrn/7XhyWOwfOa72re1jz/KLobnwqOeo6Ao
VXeuXN1lHY1NgchQSnNCyeFi2LFbnMh237fyyM38WoNMq/NvDPoCrHLuHoLBAOI6
xv+ysVpDIaqgBvRG6ZUOrIUcq/W9IDwPC4myUw4JKwJg9N+Gn44uS0JRz5/JjgTm
oqWRulcH7vXntXMYHkFCutoiqUgii14poa21BlrI75ejVzTIjsX0V5tSTVhAYyWy
3dHarsK7y0PtZNe9BBzm5+/2rBnC6ni3Ogdp467BVXCAKXy9DwJvE4EcFl8yYujt
jxK4sPzgXm93RtQkGXxV5aCb2niIk7mDV4wvK+OmsiGfRCRH62F2pRC8U/m3NIKu
mpJ3ZzJRTc59Y/2S4FGg
=e2Qw
-----END PGP SIGNATURE-----

--=-KqAO6nn9q1kcyLqWV0xG--
