Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQvSm2ZcrzDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 03:48:56 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1458232519413922.5042226583831;
 Thu, 17 Mar 2016 09:35:19 -0700 (PDT)
Date: Thu, 17 Mar 2016 11:35:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH] inarp: Update to 19ed5170
Message-ID: <20160317163517.GD6045@asimov.austin.ibm.com>
References: <1458209312-4881-1-git-send-email-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline
In-Reply-To: <1458209312-4881-1-git-send-email-jk@ozlabs.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 17 Mar 2016 16:48:57 -0000


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jeremy,

Did you use 'git send-email' for this instead of a github pull request?
Without a pull request we don't currently have a mechanism to trigger
Jenkins to test.

On Thu, Mar 17, 2016 at 06:08:32PM +0800, Jeremy Kerr wrote:
> This change updates us to 19ed5170, which supports dynamic interface
> configuration, and better syslog support.
>=20
> Jeremy Kerr (3):
>       Rename inarp_ctx.socket
>       Use netlink for link state queries
>       Use syslog for log output
>=20
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  meta-phosphor/common/recipes-phosphor/inarp/inarp.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb b/meta-=
phosphor/common/recipes-phosphor/inarp/inarp.bb
> index a36bba1..d7d96c0 100644
> --- a/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
> +++ b/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
> @@ -11,7 +11,7 @@ TARGET_CFLAGS   +=3D "-fpic -O2"
>  RDEPENDS_${PN} +=3D "network"
>  SRC_URI +=3D "git://github.com/openbmc/inarp"
> =20
> -SRCREV =3D "19ed5170356495f5fc67189513c5739780ee6a81"
> +SRCREV =3D "e3f27cf06cc2ca93ae9746ba705a0d9fc307cec2"
> =20
>  S =3D "${WORKDIR}/git"
>  INSTALL_NAME =3D "inarp"
> --=20
> 2.5.0
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW6tzFAAoJEKsDR8wtAMEZBQAP/2PiiULLfo92VdgaLUcM28xT
6TrVq0OKlUM5sjVQxIiB6349E1o7vuaplDJcJ58jht2gByPgnhA557tz314zDW1D
kILMkI9k90NaTQHu8Al4h7fQBTKusUd0btLXecrqAiVsvqb1gT0b5qTwLuc05/wj
JqbsvMkPoRf4FIk+GNg++aDIc6o1AJ6RvCrdCkAbmShBFq0wIBOY1qRa7oFas7nK
O9+17n5nMJkEsbXS8Ccl1bb0wB6nRxgSPAe6H2YOUqwc/cNJ4d9m2JpKKgMofSjg
myrWf6afGJ23dYPszG2JFSOD8tnPDrtt5b6+0kZOJZTRD0XDwOJ9MwXCG4kdj0Ih
gHmY9T2zOKjSYGUC8E669IbPMVZLDOrg4kJnFbhnOhzOsyOJXK0Q0b/et4TWx6YG
vSCHgNaUJ1GvP4QaYmfYwXJu2R++3MrmNJjMn9FSiXJQVhCX0o5pYh336uDlZr/o
SN6n4lxx7slXTmFiYTuw+wpl0ypeFJA11BleEGFzyBfLdMBbSNnRKn2gtAPrhvrY
7R0CBwabrtjPSpxk36kweLN1dKraoP04fnT8Z5e/B2+5lRSmO2gegS9gDwqbhNrd
GH5f9Mq/VL6NuzFPiQJsLaXV+mpObaBT+dP8Y8HsIv7cd2wag9fmAIJuVndLNsGI
AXsKJ1rVexsQoef3oy/2
=2+hn
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
