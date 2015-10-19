Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 908311A03A9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 10:00:10 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445295606766598.1608376051901;
 Mon, 19 Oct 2015 16:00:06 -0700 (PDT)
Date: Mon, 19 Oct 2015 18:00:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 4/9] Start host-ipmid on boot
Message-ID: <20151019230005.GI13316@asimov.austin.ibm.com>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
 <1445259405-10312-5-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline
In-Reply-To: <1445259405-10312-5-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_2
X-ZohoMail-Owner: <20151019230005.GI13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 23:00:12 -0000


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Brad, I already did something similar to this.  Can you confirm this
patch set will still work?

On Mon, Oct 19, 2015 at 07:56:40AM -0500, OpenBMC Patches wrote:
> From: Brad Bishop <bradleyb@us.ibm.com>
>=20
> Recipe was not picking up c-daemon which hooks into systemd.
> Removed quotes from description.
> ---
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb       | 5=
 ++---
>  .../common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service | 2=
 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.=
bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> index 5e7ad64..5f38eb3 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> @@ -5,17 +5,16 @@ PR =3D "r1"
> =20
>  inherit obmc-phosphor-license
>  inherit obmc-phosphor-sdbus-service
> +inherit obmc-phosphor-c-daemon
> =20
>  SRC_URI +=3D "git://github.com/openbmc/phosphor-host-ipmid"
> =20
>  SRCREV =3D "98900a99254cd177c8308b63c341f793d2ac119d"
> =20
>  S =3D "${WORKDIR}/git"
> +INSTALL_NAME =3D "ipmid"
> =20
>  do_install() {
> -        install -m 0755 -d ${D}${sbindir}
> -        install -m 0755 ${S}/ipmid ${D}${sbindir}/
> -
>          install -m 0755 -d ${D}${libdir}/host-ipmid
>          install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
> =20
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/=
host-ipmid.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-=
ipmid/host-ipmid.service
> index 0636f12..ee9ce1a 100644
> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ip=
mid.service
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ip=
mid.service
> @@ -1,5 +1,5 @@
>  [Unit]
> -Description=3D"Phosphor OpenBMC IPMI daemon"
> +Description=3DPhosphor OpenBMC IPMI daemon
> =20
>  [Service]
>  ExecStart=3D/usr/sbin/ipmid
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

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJXX1AAoJEKsDR8wtAMEZYPAP/0vBl+FPl8jlo7pDRrn7PD1L
U+aEa1QBasGQt7TO0KBG95AJIka60beb2nfs+GVGAjdaOM3w+vLjYkk4lLEEDyYH
2kqCKEnP3+iYTCD3rs6tut+8ZCthq8Rnb44kV+5EisRs5wIZuKXOz93zj9aR6VRH
US8sDOxeuxDKZmmPkCIhv65I7Oyz0C5KlbWRh6e+cjshejMnNRh/6l2S0s2xwqg4
b4VGjJ2CfPXHC2mWGibTyR1XtX89bMdwk4+I5z8upSXkBKDYiGZyY4Zm6rCYZnw3
StayLxqiwinIw0QwF4867N9Cy12SxXaVbOSQdpyZDSN9SjR7tsPPjyInkGF1/t1b
z/jEd8LJ5oqktHsWIPBDlI7YHPPy/CqvEcyQPXlJlDjCR95dtKFXuTNSij5soMvB
DvyrosM0WeciUWHB/w6W5WKkowQNpTse3WJVF9USypGeCYPfbiyV8iVlV2MW9sA/
ehfngYuQD3pSYA3zOdDGdWa7JJUYZOouzgJ+WKmSEAZeSdqhNS8KZ4m6L4aFGqW5
Ga/Pd+1SlMqUoqX4baKwgE4APN7K5VBZBlL0ajWcrAkakU+5BshKctRz9ixsd56N
UKqFiR/Ic9B962BWb9uUiZTbop51mRXIXPEE0wWmh/jzPFlWbDV+8J0zTpUjpTNm
+Cxif4PB++9bVZ3iTzSk
=GBny
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
