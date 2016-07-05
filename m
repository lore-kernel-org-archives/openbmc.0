Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rkZCk2cyqzDqvN
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2016 05:47:13 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1467748028771731.9745625594509;
 Tue, 5 Jul 2016 12:47:08 -0700 (PDT)
Date: Tue, 5 Jul 2016 14:47:07 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc] Force OLDEST_KERNEL to 4.4.0
Message-ID: <20160705194707.GC20922@asimov.austin.ibm.com>
References: <20160629224032.22118-1-openbmc-patches@stwcx.xyz>
 <20160629224032.22118-2-openbmc-patches@stwcx.xyz>
 <CACPK8Xf_8oBsgoPaESQ8ToBQVNKRQ1A-33kRwMjsFK40y2DUkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N0R7NkT9p8YM3UMD"
Content-Disposition: inline
In-Reply-To: <CACPK8Xf_8oBsgoPaESQ8ToBQVNKRQ1A-33kRwMjsFK40y2DUkQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Jul 2016 19:47:15 -0000


--N0R7NkT9p8YM3UMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 05:26:29PM +0930, Joel Stanley wrote:
> On Thu, Jun 30, 2016 at 8:10 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Patrick Williams <patrick@stwcx.xyz>
> >
> > This is the oldest kernel currently used by openbmc, so there is no
> > point in compiling glibc support older kernels.
>=20
> Sounds good. Buildroot does the same thing for our firmware builds on the=
 host.
>=20
> Is there any way to use the actual kernel version to set this variable?
>=20

I might be able to set OLDEST_KERNEL in terms of LINUX_KERNEL.  Is that
what we want?  I have a little concern that this might affect certain
use cases of code upgrade (or downgrade) and netbooting.

The saving for this setting ended up being pretty insignificant.  About
7k from glibc.  I can either leave this as something we change for
"major" upgrades of openBMC or attempt to set it in terms of the
LINUX_KERNEL variable.

> >
> > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > ---
> >  meta-phosphor/conf/distro/openbmc-phosphor.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-phosphor/conf/distro/openbmc-phosphor.conf b/meta-pho=
sphor/conf/distro/openbmc-phosphor.conf
> > index f37e88c..b4e6f7a 100644
> > --- a/meta-phosphor/conf/distro/openbmc-phosphor.conf
> > +++ b/meta-phosphor/conf/distro/openbmc-phosphor.conf
> > @@ -5,6 +5,7 @@ DISTRO_NAME =3D "Phosphor OpenBMC (Phosphor OpenBMC Pro=
ject Reference Distro)"
> >  DISTRO_VERSION =3D "0.1.0"
> >  TARGET_VENDOR=3D"-openbmc"
> >
> > +OLDEST_KERNEL =3D "4.4.0"
> >  GCCVERSION ?=3D "4.9.3"
> >  IMAGE_FSTYPES +=3D "cpio.gz"
> >  IMAGE_FSTYPES +=3D "squashfs-xz"
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

--N0R7NkT9p8YM3UMD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfA67AAoJEKsDR8wtAMEZcj0QAIqlNz0UmDzmmIlkW625DZKM
ta7ZkGQqg8WdOmxa/I4/0PdCIqL2aiztdI4UC7tgILgs9QTQQtq/lLd1q0QPd3Gv
ojHYDDk0iyfgs7Y5WryxVmWHhyk+w2dvtpHHIe6+/Qw3WS8SEmhgNBSjbEbj7A2u
WXGFnvHPBPShjZnsX2bCxtozU03/VN1/CNdLupAuIAizo/GDmEUI69tiU9z1DMIL
rE8sAjNQlIefu8BiDjanIG3rbH6E6OwvD9pvQmpAO/3kgL+2xEDw67UqQHfNEcD1
K7kzvvPBmHFKDR3spe8mpiyi5p+yeT6gki4yK5DqJgocc9WS6TNQA4jtoBd2IUhF
mkMV0wf+A5MerI1ceryWlacE3mLbv1fw/lT+6PWPACGakU4FKR4sNYMYgdkx0QmK
rGVYqHcTfmgmRHzM7+KzJAfQaKSJlVxWJaTSe8N5gWoOLrKWToAHTdVV7MtAooRR
r+NY0qiW2p9EVaPP70RMmtWMhu/oFTIKGe1kByfUq8nK3s+VtmMNCUv4WkPFg3fy
eL76Idm4ET2lcS+23KGt5gs7PF+d9L+afxMx32Pi3S3JWcIW3Bh7y23aHiYBu4un
vlX7MjXAQX7V2msc0d9kiWSLVQNBostSPSbpGN/YpVEuTnYHJs40O1XJ06Ayk7al
li919Yh536fGnhbUqhhb
=CY8z
-----END PGP SIGNATURE-----

--N0R7NkT9p8YM3UMD--
