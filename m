Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbqDj1K6ZzDqlN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 06:09:40 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1466798973284430.2314358444323;
 Fri, 24 Jun 2016 13:09:33 -0700 (PDT)
Date: Fri, 24 Jun 2016 15:09:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc v5 10/11] u-boot: Upgrade AST2400 machines to
 2016.15 tree.
Message-ID: <20160624200931.GH20922@asimov.austin.ibm.com>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-11-openbmc-patches@stwcx.xyz>
 <CACPK8XeC7Aj5Z2V0f-cCktMEfUdqeTKdgEMZsMv=gSD=rfS4rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7SAgGoIHugoKhRwh"
Content-Disposition: inline
In-Reply-To: <CACPK8XeC7Aj5Z2V0f-cCktMEfUdqeTKdgEMZsMv=gSD=rfS4rg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 24 Jun 2016 20:09:42 -0000


--7SAgGoIHugoKhRwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 12:20:50PM +0930, Joel Stanley wrote:
> On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Patrick Williams <patrick@stwcx.xyz>
> > @@ -4,10 +4,10 @@
> >
> >  PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-obmc"
> >  PREFERRED_VERSION_linux-obmc ?=3D "4.4+git%"
> > -PREFERRED_VERSION_u-boot ?=3D "v2013.07+git%"
> > -PREFERRED_VERSION_u-boot-fw-utils ?=3D "v2013.07+git%"
> > +PREFERRED_VERSION_u-boot ?=3D "v2016.05+git%"
> > +PREFERRED_VERSION_u-boot-fw-utils ?=3D "v2016.05+git%"
>=20
> Should this be the branch name? The branch is called v2016.05-aspeed-open=
bmc.
>=20

No.  Package level is the right thing here.  We have our override of the
global u-boot package and in there is where we specify the branch.  This
is a buildroot pointer to get to that package.

> > -UBOOT_MACHINE ?=3D "palmetto_config"
> > +UBOOT_MACHINE ?=3D "ast_g4_config"
>=20
> As I mentioned in my status update, I didn't do the best job of naming
> the defconfigs. ast_g4_config is for ast2400 systems that use NC-SI,
> which means it's no good for firestone or the facebook machines.
>=20
> Do you want me to rename the config ast_g4_ncsi_config? Or leave it
> for now, and we can clean it up once the u-boot tree is in order.
>=20
> I would lean towards leaving it for now as once u-boot is cleaned up
> to use the Kconfig system, we can have the yocto machines select the
> option they require.
>=20
> >  UBOOT_ENTRYPOINT ?=3D "0x40001000"
> >  UBOOT_LOADADDRESS ?=3D "0x40001000"
>=20
>=20
> > diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firesto=
ne/conf/machine/firestone.conf b/meta-openbmc-machines/meta-openpower/meta-=
ibm/meta-firestone/conf/machine/firestone.conf
> > index 42f2d29..fa0d35e 100644
> > --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf=
/machine/firestone.conf
> > +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf=
/machine/firestone.conf
> > @@ -5,7 +5,7 @@ require conf/machine/include/ast2400.inc
> >  require conf/machine/include/obmc-bsp-common.inc
> >  require conf/machine/include/ibm.inc
> >
> > -UBOOT_MACHINE_firestone =3D "palmetto_config"
> > +UBOOT_MACHINE_firestone =3D "ast_g4_config"
>=20
> As above; firestone uses a dedicated phy instead of NC-SI. Machines
> won't have network if they update to this.
>=20
> I can add add a new system to u-boot, or I can send a patch that hacks
> at the machine.
>=20

Lets do one config with the dedicated and one without.  I don't care on
the name.

Is there going to be trouble with NC-SI if we use a different NC-SI
chip?  Witherspoon has a different chip than Garrison, but I don't know
what u-boot cares at that level.

If it is all just "ncsi" and "no-ncsi" lets name them that way.
Otherwise, we probably should continue to use something like "palmetto"
as that is the reference board that has that specific NC-SI chip class.

--=20
Patrick Williams

--7SAgGoIHugoKhRwh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXbZN7AAoJEKsDR8wtAMEZqRcQAIGxZldTcuwglevjz85gfcwC
VVJSs96E5HmNhoj28f4NdIcc1BjJoyKlZ57Dyqbvgs4Pyb4CnfjoO6ojSiTxFn57
W8+Isv8wEl+TVv2E7vGskNxgjCtBzbqN5HxZ5ychBcaevIkFLrRHWtTldcE+I/sY
FIMHmuC8KdioIq5u6TeNNmtG84bB5bMlNH3hYd639ClLhH2P+6+MRPt7nk3GwpYa
8Zfd23TanZ93flPOSREuVIZpqFX89csnAXaYBN1IXUCzUPmK1vhrBJ5cManeOi8o
P2kupKH7KTgDtjnO+NdXQvi1suVjfnzQ65Uhp9tyQZCaW8ylGDILSyiwhMyg//eV
tiDJ77CAbEueteBk8/+hHQqPwGz9cmdGYiIj3Obit1FV7JUiaR+fA+PlLIOHLTga
y4xON/N13gD3GbnbeDG9LjFSWqoqCq8OGtBKaKpXN8Uz7P01YL53iI9sZbWrZnb0
lVkuxz7iO1d+GgmoEBlsV0eAFHg6xDoh3SOy2cnfLLbji5zbdcZ2q8ZQWTTceGY6
O60G4W3c9yxoH7+NH+ieNQ7aucRhKiWLZDrEYVII5IEP7UGMi2Q/N5n3768xy49F
u8wcXBhkLswjc4igsgJEx7ZYzyoZMR+hd1WGvyjArDxJe7bBRoeVTB9Ao9IUcmz3
EVsE1Dt3I3sxQFzHiN8p
=5Aue
-----END PGP SIGNATURE-----

--7SAgGoIHugoKhRwh--
