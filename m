Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t93XN0ctSzDvM2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 12:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="H09Z+fs9"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="l3CapPYI"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 08CE92053F;
 Thu,  3 Nov 2016 21:04:49 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 21:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=WLnHBpWMVHojk5PjkSnxxjbVGp0=; b=H09Z+f
 s9pXICg7GBbc2CCtmhGurmYKDchPnD9JZOZlfzE6efrD/zprAXNwhDqn96t6gTMx
 dFsTba1jXujRrdLEukr1BYBpdKBrAX5PdqJ2jHo9uQjMA9VNoaDrhKTRU1XLeEQL
 nzfio71q4/Wzgvlvni23I6w2KY1AsIdnY/V0w=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=WLnHBpWMVHojk5
 PjkSnxxjbVGp0=; b=l3CapPYIyRuPKRsN5gIJyCX5n3fijV/EogqCiqW7Wmdbvs
 mp9+3wIEJNxjSq18Ws8sjp0iyysSl/NxwgJ3RGVafwJla0Q0YC75yDZ48QbOuosO
 NMOMZ/Ls4H49XunGCJUTsBEFkSc6WNbKrZSwJS6XOg5hAkJa6PoTtIx77Uu2Q=
X-ME-Sender: <xms:sN4bWCoHjZl0OL7dJxAk0mYwEIV2zmYMa_HPrQxSGGBAvlJSaqR5Zg>
X-Sasl-enc: 2QN2Nc0yNPt9tFUzZ6SZIiChiwXniwBwvj3CXFRhkX7m 1478221487
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D4B1CF29C9;
 Thu,  3 Nov 2016 21:04:46 -0400 (EDT)
Message-ID: <1478221479.27396.36.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v2 0/1] Enable pinctrl to modify SPI1
 strap bits
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Kun Yi <kunyi@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 04 Nov 2016 11:34:39 +1030
In-Reply-To: <CACPK8XdU_2Hb+NWDU4eO41Eqk5B_oBn=Z5Z9tDLsuL2gsFfoWQ@mail.gmail.com>
References: <1478195018-132099-1-git-send-email-kunyi@google.com>
 <CACPK8XdU_2Hb+NWDU4eO41Eqk5B_oBn=Z5Z9tDLsuL2gsFfoWQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-a0rSA4t7jE/UGULEN74S"
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
X-List-Received-Date: Fri, 04 Nov 2016 01:04:53 -0000


--=-a0rSA4t7jE/UGULEN74S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 10:10 +1030, Joel Stanley wrote:
> On Fri, Nov 4, 2016 at 4:13 AM, Kun Yi <kunyi@google.com> wrote:
> >=20
> > Hi,
> >=20
> > Context: re. Andrew's suggestion to a previous RFC proposal[1].
> >=20
> > To modify SPI1 mode at runtime, pinctrl subsystem will need to add exce=
ption to
> > the read-only HWSTRAP rule. This patch does precisely that.
> >=20
> > Sending this out as a standalone patch since it seems to me this change=
 could
> > also make boot time SPI1 mode configuration easier. Instead of configur=
ing
> > the strap bits in mach-aspeed/aspeed.c AND make sure device tree pinctr=
l
> > settings match what was configured, with this change device tree entry
> > should dictate default SPI1 mode regardless of what's set previously. E=
.g.
> > following node will be able to configure spi1 in master mode.
> >=20
> > &spi1 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-names =3D "defa=
ult";
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pinctrl-0 =3D <&pinctrl=
_spi1_default>;
> > };
> >=20
> > I saw Joel sent out a patch that configures SPI1 to master for every AS=
T2500
> > machine, do we not have any uses currently for other modes?
> >=20
> > [1] https://lists.ozlabs.org/pipermail/openbmc/2016-October/005194.html
> Not presently. All of the other systems have the BMC as the owner of
> the flash, and any operations go through the software on the BMC.
>=20
> For instance, booting will be done by copying the relevant parts of
> flash into SDRAM and pointing the LPC mapping at this location. We
> call that 'memboot'.
>=20
> I like your patches; it's much cleaner to put the desired
> configuration in the device tree and have the software do the right
> thing than to have hacks in the board file. If Andrew and yourself can
> agree on an implmeentaiton, I will remove the setting of the mux from
> the board file and go with your patch instead.

Absolutely agree here.

Andrew

>=20
> Cheers,
>=20
> Joel
> >=20
> >=20
> > Thanks,
> > Kun
> >=20
> > Changes since v1:
> >=20
> > - Allowed modifying partial bits of SPI1 strap bitmask instead of stric=
tly
> > =C2=A0 allowing only bitmask =3D=3D BIT[13:12] to go through
> > - Rename HW_STRAP_RESET to HW_STRAP_CLEAR and removed (to be obsoleted)=
 macro
> >=20
> > Kun Yi (1):
> > =C2=A0 pinctrl: aspeed: Enable ASPEED pinctrl driver to modify SPI1 str=
ap
> > =C2=A0=C2=A0=C2=A0=C2=A0bits
> >=20
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++=
--
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h |=C2=A0=C2=A02 +-
> > =C2=A02 files changed, 21 insertions(+), 3 deletions(-)
> >=20
> > --
> > 2.8.0.rc3.226.g39d4020
> >=20
--=-a0rSA4t7jE/UGULEN74S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG96nAAoJEJ0dnzgO5LT5BwQP/2+FMfqsNzLvNazvJ47zzbbC
nirkQsI85ed0M3dQz0EMZpfck9N2+xDyHJUqOU+o4LD2DNbTQP2NlyTCd5i5CLFi
W292WuaKFfHUrYbxZ+T03vR1pfBcrVHC8RQSmGAAIYYH7PvevNyZAWuSPEnWJL38
CYjiChb9IuAgWkZUrQxrUYff+pXfEJQ7lzm/uhVbo6v+o3s1mBqyMERmYoOLlNOG
EphYACHcWAoCPLhgSInRRbgyeVsmUeKfgH++cChwNMIkNzui2JQUQ91C/1LBEXf0
JPcCPtMo2/7bE70t34Q1frnuzZCdf4nwJ46IzmWVbjN+KfwMynldpZHNaJLW8KPA
E25X8nwTKu7guIrbdYzC0fCi4+MYlIckVNEoFW6LHeGgPN3fPBEkufNZHUh1wjZi
Khji8l0fA1mdcIzI0rE+kVEurd6PxutXTjn3ZzlpRDCkpMlovgOYv9nEnUJpFGnd
z3t3YmfLXSbNddooo7qvZ98PQ9aNQ4YMu2gTfafAeyayteRresZmLbgR+z9MCScu
18EdobwRP79qOVlUo4ORGZ2G/ecLSy2gSSCWzNsRE6u9AyPUG0u3ANXEMrQiP0MD
ibNXFJu5djKlBUN6OYeOL8J9NO1psj/MWgzCCBAhde6lY6Ef4EzePmc8LBlhN0jk
YwM/5aytztK3oB33Mcvd
=FZBr
-----END PGP SIGNATURE-----

--=-a0rSA4t7jE/UGULEN74S--
