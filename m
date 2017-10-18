Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="sfjzuCpX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ejoxnWI4"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGtt66BtfzDrJq
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 11:56:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BA84D20E48;
 Tue, 17 Oct 2017 20:56:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 17 Oct 2017 20:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=BGAh8PAuLO7XbbVCHQKQK18OePSK6RLHg6cdn73VMrE=; b=sfjzuCpX
 sHC1OWDy0F2cY6fIKD3CJF9mlyIhbpDanGQHOtyCX68y1AsgeJY52xjY+2gBw60R
 mmfCg9WucBhoan9MbOeR+xwVXUCM4RLPgGJa1juXgkiRK8SgCULCxn7D+XUvblpX
 ks9bJHLQmKN2i6nimI0/0vDmUPjyjRA960JMrAwlJI5O7nptE/FGyiYWS89Wwvcr
 rxOA/hAvaiN9yZXNX3ZBxtoo6G4vaV2tNvKi8XYa/Bex04/O7Cqr4fORIddsKas5
 EYYNYzC+cT9ZPG0k7v6btELhSgwZODcZCBHw5Ma94NWYrh/Bw0vyLvf0EB+YMZky
 Uy3omw6QZvP8kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=BGAh8PAuLO7XbbVCHQKQK18OePSK6
 RLHg6cdn73VMrE=; b=ejoxnWI4PaKiCuHlvjy2h3N+sfmBXIVVm4CtchXBPcXIr
 B2PG0hzODyyyNWbrkFQkyRAH0Y67YT9bppm6pmPOcsOrbrkCYmIaWHVrhlZP1a4K
 jlvP6wowK7wB1N6CxAbit4HxwcasL8UVda+FvIizxeiUg6fZ5U+rE/x2wHMYHk77
 P7wtZ4ksiPf4fhzxtM8aHWgzwoWaG4v/LXRBnjtBW6V5wy7//NV8rVMvJ8AprllL
 Bdefqak5LZ3UUY9tA9YUqTUjjXrgrn4dlkAbZXQByyaJkHZ1M9I4g3abAHS2wWYz
 7c/3vug57uXmIqrFYipXJA2Z09IRU5lcbhoq45LSw==
X-ME-Sender: <xms:vKbmWZtRNQPDOHszbNS5YTcKDjJrjtav2U9lBAK1IgRoVfEb-csViQ>
Received: from keelia26 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A29F8241D9;
 Tue, 17 Oct 2017 20:56:24 -0400 (EDT)
Message-ID: <1508288180.24322.21.camel@aj.id.au>
Subject: Re: Machine-scope maintainers for OpenBMC
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Yi TZ Li <shliyi@cn.ibm.com>, Joel
 Stanley <joel@jms.id.au>, Mykola Kostenok <c_mykolak@mellanox.com>, Patrick
 Venture <venture@google.com>, Rick Altherr <raltherr@google.com>, Xo Wang
 <xow@google.com>,  Andrew Geissler <geissonator@gmail.com>
Date: Wed, 18 Oct 2017 11:26:20 +1030
In-Reply-To: <CAARXrtkrQtpdkCxp+Oqf-HUBttY6sv2+BEr3gAknXNXq=SGyAg@mail.gmail.com>
References: <1507868164.5452.192.camel@aj.id.au>
 <CAARXrtkrQtpdkCxp+Oqf-HUBttY6sv2+BEr3gAknXNXq=SGyAg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-DdrRwORMumgK9h9vBFUA"
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
X-List-Received-Date: Wed, 18 Oct 2017 00:56:31 -0000


--=-DdrRwORMumgK9h9vBFUA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-17 at 09:23 +0800, Lei YU wrote:
> Hi Andrew, Brad,
>=20
> I would like to bring a question about how do we welcome system
> vendors' systems.
>=20
> Background: in gerrit we already have some system vendors' machines
> under review:
> * meta-inventec/meta-lanyang: https://gerrit.openbmc-project.xyz/#/c/3888=
/
> * meta-yadro/meta-vesnin: https://gerrit.openbmc-project.xyz/#/c/6429/
>=20
> They both contain a "large" commit that introduce a machine.
>=20
> I know we have suggestions to split the commit into separated smaller
> ones, but this
> seems a bit hard:
> * The work is based (referenced) on a similar machine, e.g palmetto or
> zaius, which
> =C2=A0=C2=A0=C2=A0means the base code (meta-xxx) is already big;
> * The change is submitted as a "squashed" one after it's built and
> tested, which means
> =C2=A0=C2=A0=C2=A0not each "internal" commit can be built successfully.
>=20
> In such case, how do we handle this case? Is it possible to accept a
> large squashed commit
> if and *only* if the change is to introduce a new meta-machine?

I think that depends. What are you comfortable reviewing? Personally I
*much* prefer small, obvious patches than a hulking diff in the
magnitude of thousands of lines. I find it *much* harder to track
what's going on in the latter type of change. Bear in mind that this is
code that could/will be executing on any number of people's machines,
and we have a responsibility to the community to ensure it's not doing
anything too crazy.

If you're comfortable reviewing large patches like that and signing off
on them then you may have just won yourself a lot of work :D Otherwise,
my view is contributors should help themselves by helping those
reviewing the code say yes to their contribution, which means at least
self-contained changes which are hopefully small.

However, we do run into one of my favourite topics: essential vs
accidental complexity[1]. Sometimes it's not possible to break things
down further. In this case reviewers might have to just deal with large
patches, but contributors should be willing to bend to their judgement
on whether the patch has been reduced to deal with only the essential
complexity of the problem. If it hasn't, the patch should probably be
split.

I'm hesitant to provide a blanket rule like "all new system additions
can be a patch bomb" without ruling out accidental complexity from the
problem.

[1] https://en.wikipedia.org/wiki/No_Silver_Bullet

Sure, this all raises the bar to contribution a bit. However I feel it
does so in a way that leads to positive long-term contributions to the
community by demonstrating some commitment, rather than just having
code dumped over the wall with the risk that it gets neglected.

Maybe this could be seen as being exclusive. That's true to an extent,
but I feel it's principled exclusion: That we should weight exclusion
for the quality of the implementation of the contribution (i.e. whether
the patch can be understood with confidence, the quality of the design,
quality of the code code, whether it has tests, etc), but we should
heavily weight *inclusion* for the requirements and concepts driving a
contribution (adding support for previously unsupported systems,
alternative implementations of DBus interfaces if they meet new
requirements, etc).

To clarify, saying no to a patch adding a new system should probably
not be interpreted as "no we don't want to support your system", rather
"thanks for your effort to contribute support for your system! However
I think you can help us help you by arranging the patch differently".

To finish, these are my personal opinions on the matter, and may not be
reflected by the community at large. I'm keen to hear what other people
think. Hopefully it addressed your query somewhere in the wall of text
:)

Andrew
--=-DdrRwORMumgK9h9vBFUA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5qa0AAoJEJ0dnzgO5LT5oXUP/1YVJHLuJ+8rSp8MVJ2j6eLp
bU49lp19N6Y/oVzKUaiiENS0vlF2KenCscczfdJ0FNmKqtyVzDx2csGlByuBtLwb
m8pSbrD/WfaGtFgjUfZeVTJcownBChuOg6CTOa8L0yiqQZpe63CcowGISaxDkyH1
67a6msB2CYfk++m8BC6aBdGOhqeDfsI1xfIRbeTItV2lcrrXSaLS4g0ZIB06Pp+P
RHTdw6d0iXKL454/mnYGmtA7gHQHuVUysBujOSaSBzXnLg38gZ4c3IaMXaip6tjy
qVAEREaR4RYuEqEqo2i51OWJZH7pJ4hBJVk0BmpySzkru28Kz4kc5v8OF+rbeJEA
5+x173PIkeUdx0hgInXAyfLSL76Q7W06LkZw94Dkh4l+1dZn5YKCGrnaJRglPDOl
UV8Qzm956s7H9Muce7qxrqzOE8k/8ZCh5YadvD6O7iJvzxI/1pni+3zml/l5AeuT
Qmrzb2HDa0b3AVwgcK9F55l8fT83JJXOUMJ8dsPVFn68tvwfPf25/0PESOXXRk0d
cwdnswASCARGg+gnrZqti0SBCKpNsldaR5ZThv7W7XLuILPfNU/K9rBtydtdC/KG
HbNFlC570vR/rjK7NixRsYXeg3XPm54sW6GnkyrxHvXFMCKbCVNaGuX9D2vv02td
A/D3VZ9GzeR3z5OvGdDj
=f3Gg
-----END PGP SIGNATURE-----

--=-DdrRwORMumgK9h9vBFUA--
