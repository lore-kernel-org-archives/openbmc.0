Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D15A81A064D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:22:53 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444998167737685.5792114132773;
 Fri, 16 Oct 2015 05:22:47 -0700 (PDT)
Date: Fri, 16 Oct 2015 07:22:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc 3/4] phosphor-host-ipmid: refresh SRCREV
Message-ID: <20151016122246.GA13316@asimov.austin.ibm.com>
References: <1444946041-22756-1-git-send-email-patches@stwcx.xyz>
 <1444946041-22756-4-git-send-email-patches@stwcx.xyz>
 <CACPK8Xceo8bHyispt6EhY0egmOf6b544YjX89psFbFBdBa3WqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <CACPK8Xceo8bHyispt6EhY0egmOf6b544YjX89psFbFBdBa3WqQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151016122246.GA13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2015 12:22:54 -0000


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 02:44:01PM +1030, Joel Stanley wrote:
> On Fri, Oct 16, 2015 at 8:24 AM, OpenBMC Patches <patches@stwcx.xyz> wrot=
e:
> > From: Patrick Williams <patrick@stwcx.xyz>
> >
> > Also required updating dependencies and installed files.
> > ---
> >  .../common/recipes-phosphor/host-ipmid/host-ipmid.bb       | 14 ++++++=
+++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi=
d.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > index 9741e61..5e7ad64 100644
> > --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> > +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
>=20
> >  do_install() {
> > -        install -m 0755 -d ${D}${sbindir} ${D}${libdir} ${D}${libdir}/=
host-ipmid/
> > +        install -m 0755 -d ${D}${sbindir}
> >          install -m 0755 ${S}/ipmid ${D}${sbindir}/
> > -        install -m 0755 ${S}/libapphandler.so ${D}${libdir}/host-ipmid/
> > +
> > +        install -m 0755 -d ${D}${libdir}/host-ipmid
> > +        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
> > +
> > +        install -m 0755 -d ${D}${includedir}/host-ipmid
> > +        install -m 0644 ${S}/ipmid-api.h ${D}${includedir}/host-ipmid/
> >  }
>=20
> Should we be putting install rules such as these in the makefile
> instead? That way the programs are useful outside of the poky
> buildsystem.

Good point.  I will add a 'make install' to the makefile in the ipmid
package and then refactor this recipe with a follow up commit.

--=20
Patrick Williams

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWIOwWAAoJEKsDR8wtAMEZbmIP/070lvk5CDgvum0Q7nPZQJoB
XGWxpSerUdSU+gD8to1hNNdWyAKh9N2Xxuf/HnTnOWcYa41MJtjaj8/Tc37Uwam+
HHikKThK3Eb4aV2TbRwjtgA5jsdL1+HdBUlPF9ZuVjEOZGdaHqHmEXdWFkDpRIyt
FIYhG8/hBcyFaUYesJN7HDbdyuKLtXo91CP32Lq1jRzUiX+iHVMj+H/XfX3e3V3r
MYsR8Lu81rrpO+2dJ6TGgAvO0CzbuILF1xUCBjCilPK6uwH2y7oc3m7uKj/+Zv6U
Hae1X9suv9DgZoF85jU8xW6taRmbfhm1d5JH1fsNIuPkDWtwBFcxyMe/YXEdLNeE
G6YFWwfXjouruTyV7HrqzjBtZ4RhkAR9+flL5NADpcvD9kNToBQGeQcOtaoeP7Si
Y+CxXbgZls/+bcs2HIyVuslJ5It4ANXBlOOxg/ZRfMN/lVw5ZbxyZvf7hL4SFgUd
s8ZQx9kVcLEOdt/NYdQM4bfXmEFz4/4xpt03mfxTNXCfMy0KsVROlS3OW1WleexY
R01jMtfOzBIZVUcjqJgBnvNBg0XMufP9AeLAMFWyyrKldQzvifN219vIJohC+43w
pIch+vGZ0EwgWGalI3iNpF8+hviUjAVifbjUp4JH9rBx4Zame4XBEF8lTJ4FDgwA
91fboZ0bB6MmW3kWjv0k
=9YA3
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
