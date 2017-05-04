Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJZqC4XLPzDqBJ
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 22:59:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RDdxjU4g"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WCVLPh9T"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7690220828;
 Thu,  4 May 2017 08:59:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 04 May 2017 08:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=utxeCO3oN0BaM64Qe/MxRjtSi5Fb/vGFNg9JfV/TF
 Tk=; b=RDdxjU4gXX3MncXjC/FdsSalnwDpG4NHl0DBncaoReThubUqP515zWHQ5
 hcARMZtOSwbhHInhY9qxdUPHKXFIZQotqnhvSRYdcUYEDJK4ZbqLCcRE7u7Z7XdQ
 OxHNMqN871j2tQD8qFULV1GN+uDazxXNTZmmJzYHlwzqgP6/7naAuCkwsP/cOeeF
 BMdLRUx73J+EGTuNWCUtHPM0ok+OYBUcPStRebYycnsXO/8lx9xVhlJbaf8Mpu/w
 zQ+NeTmOeSuGqbafSMReNfoSTB/67lwMkBYsMAfXrnNHNjVxL9IW8NdvhHsfQWPb
 yqZCeDd/yJV3IIq7nEwq4FcPwIxqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=utxeCO3oN0BaM64Qe/
 MxRjtSi5Fb/vGFNg9JfV/TFTk=; b=WCVLPh9TI0yTCAhF7eW9mGnTMM/sK+oPAS
 dVi9C38R5jkeJwoE5wv9rZI3105v69399U0lGYoc98VWILPBSTYjf9DmzjC/91G9
 iDaz7Xdx+JmLT0JEtpQrCzqnw25wCvLIox95S40weTp9vhiPbcHQ0o+TtpvBg4gs
 hXRMvdup5KFr1YB9jO4dggmL9glscDZg89jBSrOsq6kP6osOZ+nhuWk67XymDkA5
 o7VR66VF8fONWfHvyyxzgPCJ1t9BxIqcCvP/vX7A6FybyjSMXkNa6AkF/l+Tt0Yy
 z2Q7isa+3ofXWvDdixELF7ZFOMIJFESQkgLHbfpoiXHH+cIf8tKA==
X-ME-Sender: <xms:pSULWekuSIwsuEORWph8BeTSJ0SPyr1sWsdOBowytmdiGD3hbPruyw>
X-Sasl-enc: ZneszYrsAxCHBSKrkD8uZlpeqVCaI/DScvCG2J+SZQy9 1493902756
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA17D2436D;
 Thu,  4 May 2017 08:59:15 -0400 (EDT)
Message-ID: <1493902748.4433.24.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] spi-nor: aspeed-smc: Fix flash window
 size message
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Thu, 04 May 2017 22:29:08 +0930
In-Reply-To: <316ff8db-35d4-7645-3ca2-17a24f227dd6@kaod.org>
References: <20170504023416.25653-1-joel@jms.id.au>
 <1493898773.4433.23.camel@aj.id.au>
 <316ff8db-35d4-7645-3ca2-17a24f227dd6@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-U0sBP1C8tySC+ESU8O7F"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Thu, 04 May 2017 12:59:21 -0000


--=-U0sBP1C8tySC+ESU8O7F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-05-04 at 14:13 +0200, C=C3=A9dric Le Goater wrote:
> On 05/04/2017 01:52 PM, Andrew Jeffery wrote:
> > On Thu, 2017-05-04 at 12:04 +0930, Joel Stanley wrote:
> > > When booting we see something like this:
> > >=20
> > > =C2=A0aspeed-smc 1e620000.flash-controller: Using IRQ 17
> > > =C2=A0aspeed-smc 1e620000.flash-controller: DMA support disabled.
> > > =C2=A0aspeed-smc 1e620000.flash-controller: mx25l25635e (32768 Kbytes=
)
> > > =C2=A0aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000- =
0x22000000 ] 32MB
> > > =C2=A0aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000- =
0x2a000000 ] 128MB
> > >=20
> > > The lack of space after the first hex number haunts me every time I
> > > boot a BMC.
> > >=20
> > > With this fix we see the pleasingly symmetrical:
> > >=20
> > > =C2=A0aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000 -=
 0x22000000 ] 32MB
> > > =C2=A0aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000 -=
 0x2a000000 ] 128MB
> > >=20
> > > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > >=20
> > > ---
> > > =C2=A0drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/a=
speed-smc.c
> > > index 875b029198fc..23622bf62b6b 100644
> > > --- a/drivers/mtd/spi-nor/aspeed-smc.c
> > > +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> > > @@ -709,7 +709,7 @@ static u32 chip_set_segment(struct aspeed_smc_chi=
p *chip, u32 cs, u32 start,
> > > > > > > > =C2=A0		size =3D end - start;
> > > > =C2=A0	}
> > >=20
> > > =C2=A0
> > > > > > > > -	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %=
dMB",
> > > > +	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
> > >=20
> > > =C2=A0		=C2=A0cs, start, end, size >> 20);
> >=20
> > NAK! I want *no* spaces!
> >=20
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> ah ! as you wish, I have no strong feeling on the format :)=C2=A0

Sorry, that was a stupid bikeshed joke. I'm happy that someone's done
anything with it :)

Andrew
--=-U0sBP1C8tySC+ESU8O7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIbBAABCgAGBQJZCyWdAAoJEJ0dnzgO5LT55igP+NtfW5uwmygKJJVu/nxX8Ru/
zB0rASTO/BPxswrdkiCjvNN401+YDP5PcckWGGDNlrr1fjDiD/wcNLyzgzN0wxuM
ixzV3O0rpmgXNKPD4oPj6RBcM4H/VYhlK/jkH5wp5hS7RB2TUHhP6AONIbse/eMn
vPGNIZ6fY+xeiE1UNW04Cu6JTD8xmXWcjDWoD4QIxbONC05acqXgkQDn4NDPmFlO
U5PoHxAF/grM9mPaGNWb9Bhflf91WPEbWbFciVs9IlvuLvsYBnWLQSnZBStsKhCV
UY2u1wjpxnYD/+/IBZMc/ieNK05HT9pmVqLR1yGOnRIgsyLhTHO2uKYDvfPQ5MgO
hN7GKR5ytJYnQ+DHivPqHb8c7LBeCwFUZGfaj4nE4EVXzRBlJ0s0puJE4BAHN7k6
47rG9qybONN0QBeeUbqE+g1n7ParBkcT+JloII19bzn+zJ53y9/YDfxtZL6Cmgqu
YECJ32Ppd2QZyfzj23t7dXc7lv/JUuQj5nfp8xEZYyMIwjIP6498olVpSsxBe8a+
VNnisXXDJTDi2gzkpu3b+PAtC28H6GdhJuAa+No87Ltyu2n0NRzufnKyugZi1MRH
hufT+4BslOYwdG6fB07O2WN3iawCD5pgrrltbySAWJjIirsc3qJKGD1gc3rZLnX8
oysP6OJquAqwa3508qQ=
=3J3w
-----END PGP SIGNATURE-----

--=-U0sBP1C8tySC+ESU8O7F--
