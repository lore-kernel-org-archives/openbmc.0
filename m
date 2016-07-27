Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rzvTr6qY0zDrFc
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 22:30:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=gUbx6nUW; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=VlAO1BRl; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49F281681;
 Wed, 27 Jul 2016 08:30:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 08:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=1e16r
 E5yN+yYHtoiyCReOGKFip8=; b=gUbx6nUWgcaxVjv0HLfsr/QF/Ypsh/cU3fSpq
 EaRU2ISlJR0tDWEn23fJDZ0zgbR7v2m8WOgm69F8Xw/XqcuGNxCoWB+CWXPyZQQD
 A2oAcPt6MUEh7amPqRQ+HnejcNxOpyVGh5dI7NDteEGKvaKhVf7QX5iUrEPWPtvP
 Mh6Jho=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=1e16rE5yN+yYHtoiyCReOGKFip8=; b=VlAO1
 BRlG8U/V8F8KZuX8NivCnX56d/PYXr5xm4lksbrfndYj7xnyuqpWUyefHm8rZ+Pl
 pUGbfEwA5NdxraHLWP9OsY27BfSxEIMVYqHHRoIE8Qts8IJe7wrJK40vznM0DvuH
 syfw7rl5p8H7AONE7h0zn54QFNjHkOJIMjzbNg=
X-Sasl-enc: UfJcEAsGJ6UNhR75DZ6OkqsnQzAhQV5ntZN2kBsgxnUB 1469622636
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC7FECCD26;
 Wed, 27 Jul 2016 08:30:34 -0400 (EDT)
Message-ID: <1469622628.5468.64.camel@aj.id.au>
Subject: Re: openbmc qemu vs Cedric qemu is different
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Chris Austen
 <austenc@us.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Wed, 27 Jul 2016 22:00:28 +0930
In-Reply-To: <ce634cab-6594-3876-7517-d35bae40bb1d@kaod.org>
References: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
 <1468546975.5679.32.camel@jms.id.au> <1468577985.954.22.camel@aj.id.au>
 <OF920CED31.64D6B88A-ON86257FF1.00579A2D-86257FF1.0057B9EA@notes.na.collabserv.com>
 <ce634cab-6594-3876-7517-d35bae40bb1d@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ovGBp9KooloVawfaILS5"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 12:30:42 -0000


--=-ovGBp9KooloVawfaILS5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-07-27 at 12:26 +0200, C=C3=A9dric Le Goater wrote:
> On 07/15/2016 05:58 PM, Chris Austen wrote:
> >=20
> > Sounds like you have a workable plan. Thank you. The test team will run=
=C2=A0
> > off of https://github.com/legoater/qemu=C2=A0=C2=A0(branch:aspeed) unti=
l the=C2=A0
> > openbmc/qemu gets the needed updates.
>=20
> FYI, I just updated this branch. Changes are :
>=20
> =C2=A0 - rebase on v2.7.0-rc0
> =C2=A0 - end of n/w support for linux 4.4. the fgtmac100 now uses=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0the aspeed end of ring buffer bits to be in sync =
with=C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0linux 4.6=C2=A0
> =C2=A0 - rework of ast2500 support to remove duplicated code. I should
> =C2=A0=C2=A0=C2=A0=C2=A0send to mainline shortly for review.

I've just merged Cedric's work above into openbmc/qemu master. Tested
with a Palmetto flash image and kernel/rootfs from Witherspoon,
everything looks good.

Chris: Any documentation you have can now point there. Let me know if
there are any issues.

Cheers,

Andrew
--=-ovGBp9KooloVawfaILS5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmKlkAAoJEJ0dnzgO5LT5HmcP/3dlIVlleOo7U7GUB25oJrFm
/KNwMasK3T8FMzfTO3rum1+mlykNs33kaus7Ho9Mv6jSWOIwgiDZm15g1g9V0pkO
x3aIelaIdTjdtza/G6m9xpoCeVToWLg4YqQsi0u0DlFZKTG5UUCmI7TpdYAuqr+k
N/QnwC5+ZzHZdAc0f1EW1PgmNaXPluPYBUzbuh9JR2jKSob9DV376M8sP0j90w60
NBi5czPXs+WQDnxip9jXJcDPcKcAXp5xB6KfV3CwcZX/UjKWZDsPeAmiZLzBR9o+
wgwSRs23EQLrmgg7jY+4ek2vVtgUamOiuaYLqGDxiRvuHzgLJOIOuv+cFyqI67gK
8M4OIo3qFKxWaHzYfo0zPzUauzooViviaO/CTFsz5KIQPW8VDOrCyK/Ghtwrsi2t
xYmdFfuzgn1a5Rdr+YaNslAmr5awdWMheHs/+62QwGfk9NEejWzVAFdKzTRaBC0i
nr1J2i1yJdmd+IM7YUfCVG/IHSA+d8M4augTI9QbOssxpQrgqrejDNpfdHUJ3Lx3
Ic2WYg1qrT9JAI1uRtgpNje5Vxha7V8vC1wZrbgQ6ODpfALetDDuLyEGCLYbIPdI
7s/689g3/mqEV+jr6TYiqAUmYnewS/xHcNbVMipfRa9S86XG6DW7HaPgAQXziU/w
i+YGXAe2MzT3EhjZ/4sm
=B6Hg
-----END PGP SIGNATURE-----

--=-ovGBp9KooloVawfaILS5--
