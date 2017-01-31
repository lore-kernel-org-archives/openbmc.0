Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC7Xv02xRzDq60
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 12:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="f8oQsVgC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="R6/wqrf+"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C153C207B3;
 Mon, 30 Jan 2017 20:12:44 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 30 Jan 2017 20:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=aMYvJN9fHFvk4xIzU5I0LV6ImbQ=; b=f8oQsV
 gCth0a6iWHUrzCQ4YN+UqxZ7xNhOE/sb4usXB/nfdPnMlwRWFzlvsIUDMWM/Phbr
 5dbjZ4ouWd+gqwegd/0edWOW2vpxg+QLIH0SoAyltD0n5eZWIdtoWBJbt3YfvkMS
 Pf8ZxWi438ePkFEiJLYw5TNbBb9lBAhvQzlkM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=aMYvJN9fHFvk4x
 IzU5I0LV6ImbQ=; b=R6/wqrf+8ejsN3Y6e8qjlQlhVZbS1+Ge33cgpOC8bdWqcl
 I1nlv0As7B2NJWzKJ6sxki2AYviMZR06VSLBXyaCFzgriq340/C1K26pl2iYmWan
 SjAu9kWsDJLMTMytHWX2qKZZN40Rp9Jo7+n49fkepCy3bI37EgXpWnfkIYFcg=
X-ME-Sender: <xms:jOSPWG0OS2UgKZ5F5Ks1LKSdzHFMEv4zn_iFluku9J8XFu78QvOqiQ>
X-Sasl-enc: 2UlBcjD1A9bVkIXdwagFc7RIEr4tPhByxsFQT1qMzWv0 1485825163
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D1407E271;
 Mon, 30 Jan 2017 20:12:41 -0500 (EST)
Message-ID: <1485825155.4137.23.camel@aj.id.au>
Subject: Re: GPIO offsets used by userspace
From: Andrew Jeffery <andrew@aj.id.au>
To: "Hergert, Nolan" <nolan.hergert@intel.com>, Joel Stanley
 <joel@jms.id.au>,  Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 31 Jan 2017 11:42:35 +1030
In-Reply-To: <20F6DE8D093BC149AEF7D895510943F51447A0ED@ORSMSX101.amr.corp.intel.com>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
 <20F6DE8D093BC149AEF7D895510943F51447A0ED@ORSMSX101.amr.corp.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-mYWVt65Inplnnyv5Jeiu"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Tue, 31 Jan 2017 01:12:48 -0000


--=-mYWVt65Inplnnyv5Jeiu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nolan!

On Tue, 2017-01-31 at 00:50 +0000, Hergert, Nolan wrote:
> Correct me if I'm wrong, but I think the maintainers are moving away
> from literal gpio numbers to named descriptors ("disk_led") in the
> device tree, as we're moving to more dynamic hardware
> https://lwn.net/Articles/533632/. Linus Walleij's talk was
> helpful=C2=A0=C2=A0for me too:
> http://elinux.org/images/9/9b/GPIO_for_Engineers_and_Makers.pdf=C2=A0

You're right, and that's what we should be aiming for if someone has
the time to do the work. In the short term, we *can* just change the
hacky offset numbers that already exist in the userspace to work around
the problem. It's distasteful, but not worse than what we already have.

Patrick: Did you have any plans for reworking the userspace bits?

Cheers,

Andrew

PS: please try to reply in-line rather than top-posting, that way the
context of the conversation is a bit easier to track.

>=20
> Nolan
>=20
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+nolan.hergert=3Dintel.com@lists.o
> zlabs.org] On Behalf Of Joel Stanley
> Sent: Monday, January 30, 2017 4:26 PM
> To: Andrew Jeffery <andrew@aj.id.au>
> Cc: OpenBMC <openbmc@lists.ozlabs.org>
> Subject: Re: GPIO offsets used by userspace
>=20
> On Mon, Jan 30, 2017 at 12:04 PM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
> > Hi all,
> >=20
> > Just a heads up that when the linked patch is pulled into the
> > OpenBMC=C2=A0
> > kernel it will break our userspace. We will need to synchronise
> > the=C2=A0
> > kernel bump with the fixes for the machine configs to update the
> > magic=C2=A0
> > GPIO offset number.
> >=20
> > https://lkml.org/lkml/2017/1/26/786
> >=20
> > The magic offset is essentially 512-(ngpios) (I don't know why,
> > but=C2=A0
> > that's the behaviour), and this now varies between AST2400 and
> > AST2500=C2=A0
> > systems due to the AST2500 having an extra bank, and also because
> > the
> > AST2400 has a "hole" at the end of its GPIO number space.
>=20
> Can you suggest a way to detect this from userspace?
>=20
> Would using the chardev api make this easier?
>=20
> Cheers,
>=20
> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
--=-mYWVt65Inplnnyv5Jeiu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYj+SEAAoJEJ0dnzgO5LT5frwQAJ7Hpujr9549zoYkqgc3Zpu8
kKPk7yhCVKX7oyn2Ri9z3omIQVoonTEI4R4MdmINyH74Kda9spVxMKa/8ENhsgjv
7Gr8eW6pGd+Y8LTjwUpW035BKSeJ4hQ8eUX0IQKKPgmSHXLpZpVbUzplJjPaiqOM
q9zSKaX207m3ixBCbSZheuqVMdApPCihGFluJkJ324w/WMhePhtv8u1YTYk8wCXX
Da5xspYyMjc0rAcyj7ISQ6k3rYOgq5zqHSC14o+REmQY/M0cpd2HS0j2ys3tDsht
BdkJNI4ZjdWe5CuyATdJfbCNEG/BV1oyTCkGjlW7IkkfNN9Hg/iNUpgGZoeiLODn
K4wFCGSHzMPQx9LbWY8jqiP24Tc0O6/VU18ZEgUcwPF/lgHYbb3WE03oE33VSjJK
e1t86U3rY1dMCE4ASNqRRXtAI3JcKko4SIP8MeBjmHEMwa2jqbFRXDeakH5ZwEWE
Pudg3/7izieQYc+DZuuSGL+Sx1+JA043oFNx9t2k2A2RKGnFkzvsmbTOLlgTTcjs
9NXYf3NnoBaFKBI0LaVuWwY+ErrEIedfRc5oGgR2VOyidxiNlbh7wQIXcGd+M+M0
2qEQ7KOPEel6jXBaZq3fe08bmI7jw8hqYZx911BSmbL//nXyRS5Q+vKHJXOVr1K7
1Gq5kb6wbBi+8F5cA+ub
=HXel
-----END PGP SIGNATURE-----

--=-mYWVt65Inplnnyv5Jeiu--
