Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYcPy4bhkzDqMG
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 13:55:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QzQr8ua1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RUL82ZAU"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B885620834;
 Wed,  1 Mar 2017 21:55:47 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 01 Mar 2017 21:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=QSFIU+O5FEwkVhZJ8FsdM/HTCZE=; b=QzQr8u
 a1nFGue0/EKy7LWQAvWpLOD6VztTzHe3ZIGR1PlSXLExBI7Eo7GFm3tORNl1Zkqo
 mgJrThpOMSdstcUMXR8Ct/+w4hRKpZKpa5qFmMg/vBYMKN5GUJ6fL7uzGzfJp0kN
 8JfuEmd0+Kg4K197qwyQoDNdQyyKZDdtpsylg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=QSFIU+O5FEwkVh
 ZJ8FsdM/HTCZE=; b=RUL82ZAUv2Vi9iT1Q1lUxQVn57rNpbhLhlAWp2RmIOtero
 IEhWPcPWZtYfpYl505MJzRUim/8HzTopd/5h3Koaq82NFp+vdwftItQj3DKTS6H7
 DorfhSXfQNyV0u9pwkO2OHs+pVY5pUYA1mEMrB7I8X8iPgdBA43c4tqv1baT0=
X-ME-Sender: <xms:s4m3WLXYcU0Kctvg6eLIQASUWQOn4zT3v7V_ZXVTidNIp9mfatzQVw>
X-Sasl-enc: w/00ZFenhRjn1fbQcnVQuU99vJiHluu0uXo0aVkpITsI 1488423346
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 253A724242;
 Wed,  1 Mar 2017 21:55:44 -0500 (EST)
Message-ID: <1488423338.4258.11.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI
 address mapping
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Lei YU
 <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 02 Mar 2017 13:25:38 +1030
In-Reply-To: <9f4dc608-fe29-10bc-08d5-d9fd4f36d167@kaod.org>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
 <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
 <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
 <1488285610.4258.3.camel@aj.id.au> <1488337524.4258.9.camel@aj.id.au>
 <9f4dc608-fe29-10bc-08d5-d9fd4f36d167@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4JOn71DkkXtenH49whTR"
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
X-List-Received-Date: Thu, 02 Mar 2017 02:55:51 -0000


--=-4JOn71DkkXtenH49whTR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-03-01 at 08:26 +0100, C=C3=A9dric Le Goater wrote:
> On 03/01/2017 04:05 AM, Andrew Jeffery wrote:
> > Replying to myself again... I think I've learnt the lesson not to email
> > whilst in bed.
> >=20
> > I've done some further investigation after jumping on a Romulus
> > machine:
> >=20
> > On Tue, 2017-02-28 at 23:10 +1030, Andrew Jeffery wrote:
> > > On Tue, 2017-02-28 at 20:27 +0800, Lei YU wrote:
> > > > Hi Andrew, Joel,
> > > >=20
> > > > This patch is for issue https://github.com/openbmc/openbmc/issues/1=
214
> > > >=20
> > > > Here's what I have tested:
> > > > 1. rom1-19 with updated OpenBMC (c85f23e1), which has mboxd enabled=
;
> > > > 2. Do a power cycle;
> > > > 3. Once BMC is ready, check the registers by devmem:
> > > > =C2=A0=C2=A0=C2=A0```
> > > > > =C2=A0=C2=A0=C2=A0root@romulus:/tmp# devmem 0x1e630034
> > > >=20
> > > > =C2=A0=C2=A0=C2=A00x70640000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<=3D=3D Wrong, expect 0x70680000
> > > > > =C2=A0=C2=A0=C2=A0root@romulus:/tmp# devmem 0x1e630030
> > > >=20
> > > > =C2=A0=C2=A0=C2=A00x64600000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<=3D=3D Wrong, expect 0x68600000
> > > > =C2=A0=C2=A0=C2=A0```
> > > > I can see the two registers have the unexpected value.
>=20
> These are the default values :=C2=A0
>=20
> SPIR30: SPI1 CE0 Address Decoding Range Register Init =3D 0x6460 0000
> SPIR34: SPI1 CE1 Address Decoding Range Register Init =3D 0x7064 0000
>=20
> We should let the driver configure these values I think.
> see below.
>=20

Agreed.

> >=20
> > Looking at the driver[1] the only time we touch the segment register is
> > to read the window start, we don't ever write the segment mapping
> > configuration.
>=20
> yes, not in 4.7 yet. It is a little "complex" to configure the=C2=A0
> segments up to 5 chips handling the possible overlaps, the=C2=A0
> different chip sizes, which might be bigger than the maximum=C2=A0
> window size, and the HW bugs. AST2500 SPI controller has a bug=C2=A0
> when the CE0 chip size exceeds 120MB.

Yeah, I appreciate it's a finicky problem.

>=20
> Also the controller only really makes use of them in command=C2=A0
> mode. In user mode, the start address is mostly used to=C2=A0
> identify the chip when writing commands on the AHB Bus.=C2=A0=C2=A0=C2=A0=
=C2=A0
>=20
> > C=C3=A9dric: Have you looked into supporting configuration of the segme=
nt
> > mapping?
>=20
> yes. QEMU (openbmc and mainline) supports them already.=C2=A0
>=20
> As for the kernel, here is an initial commit :
>=20
> =C2=A0=C2=A0=C2=A0https://github.com/legoater/linux/commit/c08765882b4091=
cb1b9998d872415c072ecfe8af
>=20
> which I will send with a bunch of improvements when we switch=C2=A0
> to linux 4.10. I can eventually rebase on 4.7 but I would have
> preferred not maintaining too much branches.

That's fair enough. If we apply Lei's patch to 4.7 as a hack it means
that we can ignore the issue from then on. Any new systems will be
based on at least 4.10, which should have your improvements.

>=20
> > We could configure the mapping if we know the chip sizes, however
> > looking at the device's bindings documentation[2] we find:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0...
> > =C2=A0=C2=A0=C2=A0=C2=A0Required properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- #size-cells : must be 0 corresponding t=
o chip select child binding
> >=20
> > and
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0...
> > =C2=A0=C2=A0=C2=A0=C2=A0Child node required properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- reg : must contain chip select nu=
mber in first cell of address, must
> > =C2=A0=C2=A0=C2=A0=C2=A0be 1 tuple long
> > =C2=A0=C2=A0=C2=A0=C2=A0...
> >=20
> > I think we need #size-cells to be 1 in the parent so we can define the
> > mapping ranges. I don't know that its going to be an easy change to
> > make though given the bindings are already upstream. Thoughts?
>=20
> In the aspeed-smc bindings, the mapping range is for the overall=C2=A0
> AHB window. This is a HW constant you can not change.=C2=A0
>=20
> As for the settings of the each chip window, I would let the=C2=A0
> driver discover and configure them as you can ruin the controller=C2=A0
> behavior in command mode if they are wrong.=C2=A0

I wasn't concerned about the overall AHB window so much as the chip
windows. Letting the driver discover and configure them was what I was
hoping for, and was investigating providing the information via the DT.
If we have an alternative approach (querying the chip?) that would be
great.

> =C2=A0
> What is the specific need ? Is it to have a window covering all=C2=A0
> the SPI CEx chips ?=20

In this case it was to have CE0 window cover 64MB rather than 32MB.
Supporting more than one chip would be a nice-to-have rather than
something Lei needs as far as I understand.

> If so, my tree should have that support=C2=A0
> already. But, please note that the HW is broken for chips > 128MB,=C2=A0
> on witherspoon for instance.
>=20

I guess the question is about what support is going to be in which
branch of openbmc/linux. As it stands it looks like dev-4.7 will not
have chip window configuration support in the driver, and dev-4.10
will.

Andrew
--=-4JOn71DkkXtenH49whTR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYt4mrAAoJEJ0dnzgO5LT5GWsP/jXXXrWj5zHk5Z8CnmptjB3J
JiMY6k3tc+LPdJ8R3/gsboXU09ZaeJChK9Q9pf4UY4Lwts/pVATvwLR3bqpR+SqK
5++d7oNki0tzjH4na+gyq+bxOXT7Wp/H4waRJZdM5GXACw63k7QgwZ9bkJ8qaUCT
gMjaYVOkuwjnMx5nIDaE5PDYG0sNRJYNZJGyQIxfTA5FEPpWMISlztGpsbeNWHky
Z66UkVD9u06huXmdKJiVkhLoivq2koditbeYO1hgKHAYAGtHe+SLRW7Nwp9ZxSI4
TdbVUXhvQRoO/f57ay22iq2exT5uzSzzyITWnOoA2gfHY7Q1sjbVw50h26KMZpwo
UaiRLc4d5QCfp/QE3oIjjSAHtQLPPZMDZdqzqZWzIpTLUvU6+VdHGvDCvbp+Fk+U
S7QXM+IFBqZP9/2u6IRuPpTgk7J+PZ/0hWcWYD+Qel0Bu+8JBtCsUBu0C3CaDt5M
NncWE4XW6QgCLOONOFm5H38ZYwhcx9DA0StDa5TIYJcbCmnB/OzDVH3in5d1kHuI
xouX6bWwrRgsf/4t2Z/l4a58crJXoc2GwcPJw9fVO2/UTqmjKIO6O23oCA9RmyhU
M4d5xi5oSW0262HRec2hgySmjk9SuP6YlD8Hq0aadl61RI0xnaS1sZtYS7TmLsxU
tJYFHSupw9vOG3l8Yi/F
=IBCV
-----END PGP SIGNATURE-----

--=-4JOn71DkkXtenH49whTR--
