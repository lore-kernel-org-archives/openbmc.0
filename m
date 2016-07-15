Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rrT8V4SBQzDqFR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 20:19:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Wk1MZctE; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=D0ldAtKn; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C3041456;
 Fri, 15 Jul 2016 06:19:52 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute5.internal (MEProxy); Fri, 15 Jul 2016 06:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=0gPSK
 paa2hHAKtfbbFsuxUpeKjk=; b=Wk1MZctEe6FQG3AQJrx3ojudGMsSZzZt/1caP
 4Yn+huL/v7hlFI4inmHluMH5cBRaSFqUdXQj9UbUwzO39AjtW/8DaXW166JCQUWb
 hAmfXxmxFVhpy4GPGcgd2nLYyAYB+zTyXYW5HMNH5gNWhw1BPBWLo8Tw6HS/vHew
 Kbnu+M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=0gPSKpaa2hHAKtfbbFsuxUpeKjk=; b=D0ldA
 tKngJhKMEBzQcSOzir1T5GqjRbwb97QiRI7g4F8mx1p9p391XsPLCQ9hHOPjkLIu
 kSvoHRLv0SstBetM1TR9cVgg3/1rzKiRP1e2X3I7ImQMzLdX7LTsnJ9XDRqgEeXA
 nYVmv28jCVmCWblTwcjGXyAmNRrlDyR/XgNT7s=
X-Sasl-enc: qu5D1U0kiuNg2YcTMArK+C9s2b9n4JmO3ELkc0st/t6r 1468577991
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA64CCCD26;
 Fri, 15 Jul 2016 06:19:49 -0400 (EDT)
Message-ID: <1468577985.954.22.camel@aj.id.au>
Subject: Re: openbmc qemu vs Cedric qemu is different
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Chris Austen <austenc@us.ibm.com>, 
 openbmc@lists.ozlabs.org
Cc: Cedric Le Goater <clegoater@fr.ibm.com>
Date: Fri, 15 Jul 2016 19:49:45 +0930
In-Reply-To: <1468546975.5679.32.camel@jms.id.au>
References: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
 <1468546975.5679.32.camel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-bcQAa+L9EucFM14agi03"
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
X-List-Received-Date: Fri, 15 Jul 2016 10:19:56 -0000


--=-bcQAa+L9EucFM14agi03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-07-15 at 11:12 +0930, Joel Stanley wrote:
> Hello Chris,
>=20
> On Thu, 2016-07-14 at 13:27 -0500, Chris Austen wrote:
> >=20
> > Hi Joel,=C2=A0
> > last night you indicated that our openbmc/qemu had enough for
> > networking the palmetto-bmc. I don't think that is 100% true. I
> > believe Cedric's repo has some additional changes that should be
> > integrated back in to openbmc/qemu. Hopefully you two can figure out
> > what commits are needed to get us back to one working repo.=C2=A0
> I don't recall claming that. I think you're confusing me with Andrew.

Sounds about right.

>=20
> I'll let Andrew clarify the situation.
>=20
> Cheers,
>=20
> Joel
>=20
> >=20
> >=20
> >=20
> > causten@causten-VirtualBox:~/gitstuff/obmcqemu/build/arm-softmmu
> > $ ./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> > >=20
> > > -drive file=3D~/palmetto-qemu/flash-palmetto,format=3Draw,if=3Dmtd \
> > > -net nic,macaddr=3DC0:FF:EE:00:00:02,model=3Dftgmac100 \
> > > -net bridge,id=3Dnet0,helper=3D/usr/lib/qemu-bridge-helper,br=3Dvirbr=
0
> > qemu-system-arm: Unsupported NIC model: ftgmac100=C2=A0

Cedric's outlined the differences between his github repo and
openbmc/qemu, but I wouldn't have thought the differences would account
for this. Have you confirmed you're running the right qemu-system-arm
binary?

I believe I tested the networking before pushing Cedric's changes to
openbmc/qemu around 3 weeks ago, but I could be mistaken. Having said
that, as Cedric outlined, there may be some broken behaviour due to
fixes for ASPEED's movement of the EDO[RT]R bits in the MAC, so we
should resolve any issues as soon as possible.

Unfortunately I haven't kept pace with Cedric's work as I've been
distracted with other problems, but I intend on making up what ground I
can after I send my kernel patches upstream.

Cheers,

Andrew
--=-bcQAa+L9EucFM14agi03
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXiLjBAAoJEJ0dnzgO5LT5NbEP/jeSr9hXH3EXByF4kQeJhH/m
OG9u7zsqEEVbGiHtd4pDpi97bqC8Ndb4ZjGGb87ONPMi74jFb8l5wEJ4w4m5rhh8
wef3cpqn5X8Xui/5lMO1jEjrSD2PIX7ZMZ8chtLE+/h1VggBEs58Tb25m8CeYZP/
VemH1wEWiFLbll0jUBQVGjSQYP802qVuNP5mikiKXQS9j+uvdD9Ea7Az4T6s3ie9
GDqMpJLtaLGR5ABlE9IIyRGb07/IRaOx6zOru6qLKh6rkhZjr4iHnr1dCX58AJCH
6bl5+2U/EgV9+X8fKdj8vtsxLLT6F/zu97NHMtA4feuPaUJDm28BtJla+fGsLMnf
G6XUtbVLIV8VTUpGyhSOz3RKM0Ukk7YYC1WlQplCPYLfl7yqZtVIVFT3pMHQElKO
RIkUcOeEO+tUHhOBGlUBT0VzA8cXKGdS/acswMK08Ug7mOJmDubsdmpSWb8YiYYP
r00y2LhmIpEuV0nsGLz1buyVDZ4qah3l72CUJu5Gy1Ud+vqfISxhJeFhoMNryrz6
u/kplRyn+F2gJsJz6NCFkx5O3HjcXjCJWfjy9W+edRA0Pa9cseLtFmshsQYOvq/X
QqPYA5vsiQZ7wAm6ot6wuAaB5PWLOPXeavygMBttxmZr3ov3IdoNfoINopjPgrEI
w8YLEBDXYzfbP+Jp6/SW
=xiBK
-----END PGP SIGNATURE-----

--=-bcQAa+L9EucFM14agi03--
