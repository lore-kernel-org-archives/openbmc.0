Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D3B81A0248
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:52:44 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445370760990674.8917205517146;
 Tue, 20 Oct 2015 12:52:40 -0700 (PDT)
Date: Tue, 20 Oct 2015 14:52:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 20/20] Adding IPMI Parser Library.
Message-ID: <20151020195239.GN13316@asimov.austin.ibm.com>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
 <1445368798-31274-21-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pFej7zHSL6C5fFIz"
Content-Disposition: inline
In-Reply-To: <1445368798-31274-21-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151020195239.GN13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:52:45 -0000


--pFej7zHSL6C5fFIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2015 at 02:19:58PM -0500, OpenBMC Patches wrote:
> From: Hariharasubramanian R <hramasub@in.ibm.com>
>=20
> ---
>  .../ipmi-fru-parser/ipmi-fru-parser.bb                 | 18 ++++++++++++=
++++++
>  .../packagegroups/packagegroup-obmc-phosphor-apps.bb   |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-phosphor/common/recipes-phosphor/ipmi-fru-parser=
/ipmi-fru-parser.bb
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-f=
ru-parser.bb b/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-f=
ru-parser.bb
> new file mode 100644
> index 0000000..02ff308
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-pars=
er.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "OpenBMC IPMI FRU Parser"
> +DESCRIPTION =3D "Parse the common/chassis/board/product areas of the FRU=
 data into a VPD dictionary table."
> +HOMEPAGE =3D "https://github.com/openbmc/ipmi-fru-parser"
> +PR =3D "r1"
> +
> +inherit obmc-phosphor-license
> +inherit obmc-phosphor-sdbus-service
> +
> +SRC_URI +=3D "git://github.com/hramasub/ipmi-fru-parser"

We need to get the code reviewed and merged into the main
ipmi-fru-parser repository.  We shouldn't point at personal forks for a
recipe.

> +
> +SRCREV =3D "e097f0cc58c64564ae059f9b02ecb574e4cbb666"

This will also likely need to be updated.

> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install() {
> +        install -m 0755 -d ${D}${libdir}/ipmi
> +        install -m 0755 ${S}/*.so ${D}${libdir}/ipmi
> +}

Why do these get installed into a special directory instead of usr/lib?
We won't be able to link against it if it isn't in one of the standard
paths.

Where is the install directive for the header file(s)?

Can you add a 'make install' to your package instead?  I'm in the
process of updating the ipmid to be the same way.

> diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packageg=
roup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packageg=
roups/packagegroup-obmc-phosphor-apps.bb
> index 4dbcdd3..54e5655 100644
> --- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-ob=
mc-phosphor-apps.bb
> +++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-ob=
mc-phosphor-apps.bb
> @@ -26,6 +26,7 @@ SUMMARY_packagegroup-obmc-phosphor-apps-extras =3D "Ext=
ra features"
>  RDEPENDS_packagegroup-obmc-phosphor-apps-extras =3D " \
>          rest-dbus \
>          host-ipmid \
> +        ipmi-fru-parser \

We should not be adding this to the list of required packages.  If it is
needed by host-ipmid in order to do fru parsing then it should be added
to the DEPENDS/RDEPENDS list in that recipe.

>          "
> =20
>  SUMMARY_packagegroup-obmc-phosphor-apps-fan-mgmt =3D "Fan management sup=
port"
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--pFej7zHSL6C5fFIz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJpuHAAoJEKsDR8wtAMEZp1sQAKSuNfItzgQ8jMaHQRkZEocf
dsvPYqLvFOwvyOhSw2BfeV2NUVeZ4ZVQ4DAIvDN7/G7QmTo+llXDjnCevoaW32P4
p7YlI7DzdTwZecMkGqDPR7dpeHyzQWqfufi0RgavqBWF8reOaEa8BhpVGCD6bu35
GI9J5lb6E7rh9bE9Sx7x5lVFmJ2qdau1hSIklWWJUCEwPDm803DUWDybc96IBJDW
spf4c4YqBb8CHaganCh4SR4AzOdChur+Rip8NtkSS+0V/VXC3QI/8CuoBNLD3c9+
JwcukfrG2AHrrWGO+ZvNi1f+g/1WIrTiFmMjVSe+hLXKZ3vkJYDTb1fRUNpKvjf8
Qlty7CuJt1toizaAQRxy/ih8MO27cR3CvEEfHvtbvmrp+8o8I4F37ktkzwDX8flz
6e5qGqnymk1shegVbxrcj+bh7RbVVzZmxysTt/cu/xH9W1BUGYgKma3uKVg5AElx
pKHKdBswP5k6jqxxKGaW4By6l3/UMvcNhnC0QUO6A/8Jo9gzzuT8TAE4FmIsQ/Dt
YNGo7g/OfDEQuVzcRz5Eci5t5CxIXu/i0N8yl1Pdjlq48Z2BoEbxEqiUXhtvcef+
SzRg/IJI5axKw7TywsvRFgBSV4rOhO2D4hocd67ETIXFk+zMy5Pdsvo/QhKPEHhj
EqP6ztSasz7AnoXOITfo
=FxXK
-----END PGP SIGNATURE-----

--pFej7zHSL6C5fFIz--
