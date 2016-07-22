Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rwcgL2rs4zDrFc
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2016 14:12:29 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1469160742392249.0682969307793;
 Thu, 21 Jul 2016 21:12:22 -0700 (PDT)
Date: Thu, 21 Jul 2016 23:12:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 johnhcwang <hsienchiang@gmail.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>
Subject: Re: [PATCH linux] Fix the incorrect debounce setting on power button
Message-ID: <20160722041220.zcutlqqvhl4qjpk4@asimov>
References: <20160721110110.6902-1-openbmc-patches@stwcx.xyz>
 <20160721110110.6902-2-openbmc-patches@stwcx.xyz>
 <CACPK8XfP-VJi_xbnrJ8urCC-C67aOkzWOUKQd5kO43GQrCgQuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="heu663eyeef3jiqa"
Content-Disposition: inline
In-Reply-To: <CACPK8XfP-VJi_xbnrJ8urCC-C67aOkzWOUKQd5kO43GQrCgQuA@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 22 Jul 2016 04:12:30 -0000


--heu663eyeef3jiqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2016 at 02:10:17AM +0930, Joel Stanley wrote:
> Hello,
>=20
> On Thu, Jul 21, 2016 at 8:31 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: johnhcwang <hsienchiang@gmail.com>
> >
> > PCLK divider selection is decided by SCU08[25:23] and the value is 011b
> > on Barreleye.
> > That means PCLK should be H-PLL/8=3D384MHz/8=3D48MHz, but the current
> > debounce timer value was computed by 24MHz.
> > So the correct value should be 20ms*48000000/1000=3DEA600h
>=20
> Thanks for the patch. I noticed this is against our dev-4.4 tree,
> which is no longer maintained.
>=20
> Given you're looking at barreleye, I assume you are using the v1.0
> release of OpenBMC?
>=20
> Patrick, if I do a new dev-4.4 tag with this fix, would it be queued
> up for a v1.0.x release?

I can do that.  It is up to Foxconn to let us know what fixes they'd
like put into a v1.0.x release at this point.

>=20
> Cheers,
>=20
> Joel
>=20
> > Signed-off-by: johnhcwang <hsienchiang@gmail.com>
> > ---
> >  arch/arm/mach-aspeed/aspeed.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspee=
d.c
> > index 11d8a61..fadbbb6 100755
> > --- a/arch/arm/mach-aspeed/aspeed.c
> > +++ b/arch/arm/mach-aspeed/aspeed.c
> > @@ -159,9 +159,9 @@ static void __init do_barreleye_setup(void)
> >         writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
> >         writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
> >
> > -       /* Set debounce timer to 480000 cycles, with a pclk of 24MHz,
> > +       /* Set debounce timer to 480000 cycles, with a pclk of 48MHz,
> >          * corresponds to 20 ms. This time was found by experimentation=
 */
> > -       writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));
> > +       writel(0x000EA600, AST_IO(AST_BASE_GPIO | 0x58));
> >  }
> >
> >  static void __init do_palmetto_setup(void)
> > --
> > 2.9.0
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--heu663eyeef3jiqa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXkZ0kAAoJEKsDR8wtAMEZbswQAInrV02IQNRxAf/yLF2aHNLI
GRi+7dOd9zDTBPVL6wjULeDGCsN1hqhjUp0DdREv0GWJss7fXrSWga1vsoKaBxh6
DgWGz/oJpc64lbUNFLDwALznie7C1z21gXAeSG2kJ0twSuY1mfnj9Kh5veKbyGHZ
KsWP5/P8GGl4yr6QZ9GZFXGMOpP3p7TURQaISfrfBob0zZcYpbGtYYiy1Pa0qyI/
IPOJiJ4eYiVIlY9/Itk1//VatwR+C0TRoIT8qKRY3nsdK4lRAK7AVUTGUljxN/ep
fyLjMNqhRZ2cqLWi2lXo8gyjYZveu0wApQFm58tEKGA5t1nrfCBBky1XbA4e3AsX
8Qdtbb7M05EGb44Faz815GEhSnuYLLxU5gcCXavHNjQxvaRBsQ5ZcPDkIq4PySNJ
zeg2+bflxvF3OESKA65D7wsQXq5dEIrvjT286wqCIy4QIPPGLBb9WN5RjynWe10A
7SMGkm28qQcpvc8+Uz4s/OoUU0mPUybHzUXpTbyqU2GPb7hyNl8Xc6LLiRjP5Z3N
tkRwOA2XdywO3s7fj6irQsR1S+2pjisGwd/fAbY5hff4tx2GaxAF+932a2jKPvYA
nawLH9Av66q2Qw6r6eanzgC0pJrYFYbDttG4tkMLvi9XKZ7Ca5mL7CIwQoOWFlmg
Dv7N9/7crfKUTJn8cDtM
=XU3A
-----END PGP SIGNATURE-----

--heu663eyeef3jiqa--
