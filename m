Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Z4oeUBDj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ux8mpzHF"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xs2ss1Cg7zDrJZ
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 21:40:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 01FAB20E73;
 Tue, 12 Sep 2017 07:40:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 12 Sep 2017 07:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=LZTza0UL7PBwr2XbniEvuttEd2smSxo1pAARNYhhp
 to=; b=Z4oeUBDjiAUcnBXcQasLX7X7WwewUD7LLj5LDWKiNjdz4eGdrjMoOFbKA
 hoKoppLfytdPmTPCrmsxhfGj8uh/HYczAfq3TZJs+dcwrGK3HTLfaUWw9UqsiVUJ
 aEupNaZrHQjskkIicNS2PlFFsbaZI6l2TGNUQzcd7hnOqopQEVX3QHHT/KXkt4om
 9c/i1en6bG3kOz0BwolWlAD1FpSBpvuOGM7LI8L6BaoVhkHUK92mng5pNyR2XdAx
 3vPBZ+KkPMne1D0FSLuIa/JaqyswOrbob3TgaVuJzGLiE6CTp0+VL4VLmLjGGa7e
 3nzybUNn+RRAQzbj44VILJjkL6+IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=LZTza0UL7PBwr2Xbni
 EvuttEd2smSxo1pAARNYhhpto=; b=Ux8mpzHF2HjmJhIImsVHogQk37FYH1tD+y
 NxgX0mNSCJSlWTqhPbM6PMfcHKnYj90vltGdJTSW2C9V5t11U9USKHLOrfwvw0Vr
 gWOjMBnGpR9wwsfP8a9YnPGAu496Hn7IpyG37jSC090c8lEcpHLm52geOjxDWfZQ
 I4VREbXm7cTRDuMLrVy9Xv6lfP6RKckNK8VbHcr2YKQxt/2stGZz4T8qgMbq3UrT
 qRSxWMrJw0X7ed6jJ67TNvL8cupG7C9Ajbz8QnOtFktDGHmrp8BD8wdPF4IleyA9
 xdbXg9hti4YK+vrqTleh5F2Muhe9aR+E/cYVIx6rlZK+FQyF5Pyg==
X-ME-Sender: <xms:rMe3WeOQNgGuYHeKgqCD1IvRvedy2k0BG0fbOppFevuU5bsO_n6R_g>
X-Sasl-enc: 4v7xM+xxt8xuu85/bzlY4mLekoQ72ZAziZY8VASzSNza 1505216428
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E583240B1;
 Tue, 12 Sep 2017 07:40:27 -0400 (EDT)
Message-ID: <1505216424.4080.7.camel@aj.id.au>
Subject: Re: QEMU 2.10.0
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Tue, 12 Sep 2017 21:10:24 +0930
In-Reply-To: <f4bc0c68-6fd9-0784-388a-f81e7006b07d@kaod.org>
References: <1505200336.4080.3.camel@aj.id.au>
 <f4bc0c68-6fd9-0784-388a-f81e7006b07d@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-h0H27qR4FWfcJo/HEf5t"
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
X-List-Received-Date: Tue, 12 Sep 2017 11:40:35 -0000


--=-h0H27qR4FWfcJo/HEf5t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-09-12 at 09:26 +0200, C=C3=A9dric Le Goater wrote:
> On 09/12/2017 09:12 AM, Andrew Jeffery wrote:
> > Hello,
> >=20
> > I've updated openbmc/qemu's master to 2.10.0. For anyone maintaining
> > patches on top of master I've merged the old master state into 2.10.0
> > with the --ours strategy, then applied the series C=C3=A9dric is mainta=
ining
> > on top. This means any patches you might have on top of master should
> > rebase easily due to shared history, whilst keeping our yet-to-be-
> > upstreamed patches in an easily identified set.
>=20
> Here are some updates on the QEMU wiki :=C2=A0
>=20
> 	https://github.com/openbmc/qemu/wiki

Thanks!

Andrew
--=-h0H27qR4FWfcJo/HEf5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZt8eoAAoJEJ0dnzgO5LT5rmIQAIkIJ2WjFc0+6XXVjd5Zka6/
aEdUQmvGf5EMQS/paUFvtgCUnibfKx28JdnHKvlLvUluDv3mllzbmgYaEvnmuupf
OG7C18fe3bKom0kWZg/zEgvgrFiX4ZVhTTdkKUxGHZDzGiPC6Npdvkmd4yk8vr91
HhnOsbEvVqxDYkpSBN16MrQng5ueTzoRE7FpTLHUrBZh9wwhaBVOsCpFADrmVVo1
9Yc5QHbV+10enKAFVIS9mqe97i1frATWG4/NJ9PecjnFIS2qyqdGIrND3ke2uD4c
/efihAubLjAYxBzZmuYRFI4r9fPc6Wzja0athhTBVR4Mb3hZ+2dmkGyuHztGApSB
kW8X0WPMVOLQw810QzRtOJXYP4P4D0gefC2NaBK1XXOEWScDw5y1KZ4IO4tfVPWU
gi/nQj2CitYumthNKTsspwXmCbufBI4nIc1TwdasXvL3lMzvZezIKGYwCnBpt3Mn
88xSaNhDfdbXbehTtnJyStiAViGOLomEwWe4u1VHWsN7QHB74kS10yuZGqCyOFr9
l6k1Oyve5Rr8IoFuXaNTWu7lWwBPyclS9o61+9dP4W3SrMuwv2J6KDTYBIjwasUL
IVM4+ycq07eni+9vooAvo6kXb3x2IY5hv0KzsoN4K/1nyvCIBh+brguCSb/CSc6L
Dbq+yZQXQNTW6wGtibOH
=ohFN
-----END PGP SIGNATURE-----

--=-h0H27qR4FWfcJo/HEf5t--
