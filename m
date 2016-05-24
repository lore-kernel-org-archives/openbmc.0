Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDmhM54cLzDqLp
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 06:09:07 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1464120524890238.89447742164623;
 Tue, 24 May 2016 13:08:44 -0700 (PDT)
Date: Tue, 24 May 2016 15:08:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH openbmc v2] Re-enable out of tree device trees
Message-ID: <20160524200842.GO19968@asimov.austin.ibm.com>
References: <1463495441-27767-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463495441-27767-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xc7_+mV=W9-ZRZSO=uQ6y_Ys6VN4Dk82f7hjm37PdibaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eQyCKlb8USywWNtC"
Content-Disposition: inline
In-Reply-To: <CACPK8Xc7_+mV=W9-ZRZSO=uQ6y_Ys6VN4Dk82f7hjm37PdibaA@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 May 2016 20:09:08 -0000


--eQyCKlb8USywWNtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2016 at 11:26:01AM +0930, Joel Stanley wrote:
> Hi Brad,
>=20
> On Wed, May 18, 2016 at 12:00 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >
> > This snippet was mistakenly removed with 8ef9fee.
>=20
> It was intentionally removed.
>=20
> > Note that this isn't a matter of policy, it simply enables
> > the option to do it.  The in-tree device tree is still the default.
> >
> > This enables things like workbook or schematic generated device
> > trees.  It also addresses the inevitable fact that the upstream kernel
> > will probably not want device trees for every board in the world.
>=20
> As we do development the device tree is strongly coupled to the
> kernel. I think we want to keep the dts in the kernel tree, so that
> changes are made together.
>=20
> Secondly, when testing kernels the developer may or may not be using
> the poky environment. This means that the developer writing and
> supporting your kernel is not testing the same code that is running on
> the board.
>=20
> We can add every device trees to our kernel tree. As the upstream
> maintainer of the aspeed port, I will also send them all upstream.

I can think of almost a dozen openpower boxes, plus the IBM branded FSP
boxes.  That is before we even start to support x86 and ARM servers.  Do
you really think we are going to want to submit every single device tree
for every single openbmc supported box upstream?  That sounds really
cumbersome for both us and the Linux community.

Yocto already has a mechanism for creating device trees from snippets.
As we start to use the MRW data from the system engineers, I would like to
see us generate many aspects of the device tree from those directly.

>=20
> Cheers,
>=20
> Joel
>=20
> >
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > ---
> >  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb | 10 +++++=
+++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.b=
b b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> > index 24cde9f..945b43d 100644
> > --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> > +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> > @@ -18,3 +18,13 @@ COMPATIBLE_MACHINE_${MACHINE} =3D "openbmc"
> >
> >  inherit kernel
> >  require recipes-kernel/linux/linux-yocto.inc
> > +
> > +do_patch_append() {
> > +        for DTB in "${KERNEL_DEVICETREE}"; do
> > +               DT=3D`basename ${DTB} .dtb`
> > +                if [ -r "${WORKDIR}/${DT}.dts" ]; then
> > +                        cp ${WORKDIR}/${DT}.dts \
> > +                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boo=
t/dts
> > +               fi
> > +       done
> > +}
> > --
> > 2.8.2
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--eQyCKlb8USywWNtC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXRLTKAAoJEKsDR8wtAMEZtuQP/381MQ9QHqmiEdPSZDYKyNk2
3fObaMM2JdAx+FhBM/w2C3M+ioOd55j+03QA3+/Ytrne8Ou6snF88w8KWAwdhp65
eVBff1VD6e4wbMzCt028ePX8IOFrh9Mivtsp5cy4OPb+anXgnwEdaYqiD7SGY8M7
T2TbJqf/ixYULSC9DcXLq6m3hpqID+F0yDV9uACYnzekhi7BMfoE3bCwCjnscrtK
YVvs8myle+/vwnW/vtCbNcgrIM/RGAKS3dBbYjm869UkcGXX/JhtZzkVzBQDmcXz
tYD5frY8aZc2SGaTEJtmw29t8H5OwErfZXtOTW7XBV3sDyGGwactVcLViNOfS0RQ
oTmtp9UFDWEpR0HoSy0saHO6IdHGy4mXuA5TtcPLuzXRrRC7xjSh4xHph6843keX
EJg8AYX/UaK4tFiPOXxQJc7rqdM8y26yyqFTv/KAOYQLdlYB6gpFLaxpwQUxfiZO
NlaVq+q+G0enP3niDrmL9JPZ/DOWD8l95nQmHIU3T7ILoT8wRWspLm6CS+HZB/9E
N6/JaPbsXMxzmbMxnCemMHiCnlYWjdpAKkZorUiseO5A/EFnzTiwclLrkoiWmWve
Na2Lbpocx6pGkNloQwHEhrcuprdzY4l+JfHjh3NAgITLwG1BxGjbry0EE3LChOF6
zhvMhjUbUFDKpdSvaytw
=Rxhx
-----END PGP SIGNATURE-----

--eQyCKlb8USywWNtC--
