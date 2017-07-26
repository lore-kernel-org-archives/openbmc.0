Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHb3Z0hTmzDqnM
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 23:06:48 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 150107440391843.85640886394549;
 Wed, 26 Jul 2017 06:06:43 -0700 (PDT)
Date: Wed, 26 Jul 2017 08:06:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] arm: configs: aspeed_g5_defconfig: Enable Automount
Message-ID: <20170726130641.GC473@asimov.austin.ibm.com>
References: <1500567765-4990-1-git-send-email-anoo@linux.vnet.ibm.com>
 <CACPK8Xcz3wqR4Y_t7=y6AWy3soH4cPm=gCw=8zMa7s-EQU+vJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <CACPK8Xcz3wqR4Y_t7=y6AWy3soH4cPm=gCw=8zMa7s-EQU+vJw@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Wed, 26 Jul 2017 13:06:50 -0000


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2017 at 03:52:50PM +0930, Joel Stanley wrote:
> On Fri, Jul 21, 2017 at 1:52 AM, Adriana Kobylak
> <anoo@linux.vnet.ibm.com> wrote:
> > Enable CONFIG_AUTOFS4_FS to be able to support systemd
> > automount units.
> > This config is already present in the aspeed_g4_defconfig.
>=20
> The kconfig help for this option says:
>=20
>  If you are not a part of a fairly large, distributed network or
>  don't have a laptop which needs to dynamically reconfigure to the
>  local network, you probably do not need an automounter, and can say
>  N here.
>=20
> I'm not overly familiar with systemd automount units. Can you explain
> why we need this option enabled?

This is not needed.  I similarly turned down the changes in Yocto.  We
can accomplish the same thing with a static mount.

>=20
> Cheers,
>=20
> Joel
>=20
>=20
> >
> > Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> > ---
> >  arch/arm/configs/aspeed_g5_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/as=
peed_g5_defconfig
> > index 1868442..c8bd79e 100644
> > --- a/arch/arm/configs/aspeed_g5_defconfig
> > +++ b/arch/arm/configs/aspeed_g5_defconfig
> > @@ -193,6 +193,7 @@ CONFIG_FSI_SBEFIFO=3Dy
> >  CONFIG_OCCFIFO=3Dy
> >  CONFIG_FIRMWARE_MEMMAP=3Dy
> >  CONFIG_FANOTIFY=3Dy
> > +CONFIG_AUTOFS4_FS=3Dy
> >  CONFIG_OVERLAY_FS=3Dy
> >  CONFIG_TMPFS=3Dy
> >  CONFIG_JFFS2_FS=3Dy
> > --
> > 1.8.2.2
> >

--=20
Patrick Williams

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAll4k98ACgkQqwNHzC0A
wRkmxQ/+Pgu56NUxDbblxh7QDVCpKHxNuPYc/2Di+cciHyZowtuZ2CnWTIQSWC8v
UvpiVxAIO89T4duS6zThqVXHQijtmgk9P7cTAxx8b8mydVp1MBQoy5Gin3rlt/ve
SktkRqU90QdHVvZAC2gf6tHIHUaXawy0AN0JrMRB+qPWcBRHkrC50PI8z2gGjx3E
1cdnHzmZ/nFaicP1LJN5D+HXxOyRlf1z/K39x+Lq+US/VER5909EuNFYcVUlCqSB
+aN9H9QWD+FRo8hD0xwFCGzVApkVjnWNi+4cObLUe2wzZJW9n0WxpONuIB1VCLC9
R+97mANP4W3D+1Q+WGQ74MN98QmOCoTsjxGDes5/ssjV8p5h9MelTBRG38la4X+o
c/+O2viLTv9xx4sNWMLshNVvIPhXZGHWR9+YrjEAIZluH3Bp4i4pw9LdZFvvPM0G
26ibAnaNVOLxgmsr4KXV/5rLbUOG4uc6SiFA5+MM1c4BT7l9BexZvZr/CVY/X5eE
YKqZ4XKTVu0HuBDiEeN1gHiwzbWrkUONuE9fBj99uQr9CP/+Fi+wFr4b0BCOjuzt
WIDRqHoPc6YO5oy5AlmCcRD3Oe29+v0+CZmDV2Ly1Uae9KHq6GQnXJtqI8HzRjTx
B4O3g0isPCwCedNRNLqoK09FKbN7BerzbG6olNQKdbfxZJhuoZA=
=viaT
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
