Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 971A21A03A9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 10:03:27 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445295803296417.8997655493488;
 Mon, 19 Oct 2015 16:03:23 -0700 (PDT)
Date: Mon, 19 Oct 2015 18:03:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 9/9] Make host-ipmid pull in host IPMI to hw
 package
Message-ID: <20151019230321.GK13316@asimov.austin.ibm.com>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
 <1445259405-10312-10-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yzvKDKJiLNESc64M"
Content-Disposition: inline
In-Reply-To: <1445259405-10312-10-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_6
X-ZohoMail-Owner: <20151019230321.GK13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Mon, 19 Oct 2015 23:03:28 -0000


--yzvKDKJiLNESc64M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 07:56:45AM -0500, OpenBMC Patches wrote:
> From: Brad Bishop <bradleyb@us.ibm.com>
>=20
> Set preferred providers for palmetto and qemuarm targets.
> ---
>  .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf    =
| 2 ++
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          =
| 2 ++
>  meta-phosphor/conf/machine/include/sample.inc                           =
| 2 ++
>  3 files changed, 6 insertions(+)
>=20
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/=
conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/=
meta-palmetto/conf/machine/palmetto.conf
> index 0efdda0..0ef430e 100644
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/ma=
chine/palmetto.conf
> +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/ma=
chine/palmetto.conf
> @@ -29,3 +29,5 @@ UBOOT_ENTRYPOINT =3D "0x40008000"
>  UBOOT_LOADADDRESS =3D "0x40008000"
> =20
>  FLASH_SIZE =3D "32768"
> +
> +PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw =3D "host-ipmi-bt"

This should be done in the common openpower config file?  Maybe we have
some dependency between your two pull requests.

> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.=
bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> index 5f38eb3..ab3a1cb 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> @@ -3,6 +3,8 @@ DESCRIPTION =3D "Phosphor OpenBMC IPMI router and plugin =
libraries"
>  HOMEPAGE =3D "http://github.com/openbmc/phosphor-host-ipmid"
>  PR =3D "r1"
> =20
> +RRECOMMENDS_${PN} =3D "virtual/obmc-phosphor-host-ipmi-hw"
> +
>  inherit obmc-phosphor-license
>  inherit obmc-phosphor-sdbus-service
>  inherit obmc-phosphor-c-daemon
> diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phospho=
r/conf/machine/include/sample.inc
> index 89ad0ec..801706f 100644
> --- a/meta-phosphor/conf/machine/include/sample.inc
> +++ b/meta-phosphor/conf/machine/include/sample.inc
> @@ -17,3 +17,5 @@ VIRTUAL-RUNTIME_obmc-phosphor-chassis-ctl =3D " \
>  VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl =3D " \
>         obmc-phosphor-example-pydbus \
>         "
> +
> +PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw ?=3D "host-ipmi-hw=
-example"
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

--yzvKDKJiLNESc64M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJXa5AAoJEKsDR8wtAMEZsHIQAJEpuo8braFcNlUeNlraHIVP
8aYvNLDAy+RveGNgQCm7awL8CyWrKM2LuozsSCGrypOxramNW2CL+DxpN85WbuFK
TePvXKsJfobav6SFwxtd/Y76CBQEFB2EbRYfguZ0qNhnG4T/jNR2jTUkYIXovw/g
g0JjSZ6DDKspc6RJny6dMIqjHNWNzj7Yw0k14nsArrbn/FIWnIhH1fOzuTB435wv
7hz2qSVyeDrqiOWxaK5tkOhyITITfJGvpu19sZykc47COSlSh2AVmjjAQg5tDgjg
Fe/l0o36Aqk1X/lT31e+snER4hmmwxN2GjRVkoJDg5wcm3jI6tDo9X6M2ZdULfPX
LFMCcv5GbtlxAPZaxhWF1akmT4IZ7LT6SYnRgdizUC5aghCRZgoRfU4pVxJDUhh6
GdNaxkL5jhfCTjytkBrezrKKyIHg2raXEmhgSi7X3mGMUpLEZMyS4O/x044FrJ8q
kf/60moZzkqFePLpwIBINYV+KHQyqML9vVoLOl4DjMj1iUXPWubVAqXZBWJwIraK
HO+BtV6sqMzbVcFeaYq8wemuawJZjTwqMQuutW9LMzr/4MCsFZboRl5UCjNB36vr
Bz7irWbFRNYxgvKdCpoL72pB4VbyjhzFtrB6kP6oze3GS/691RIjzttK9f0RjFO6
gEXkHc6KtDjD03jyVsyN
=SSo4
-----END PGP SIGNATURE-----

--yzvKDKJiLNESc64M--
