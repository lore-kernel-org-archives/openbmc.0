Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AB8201A065D
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 03:37:27 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1447432642155509.0277088472742;
 Fri, 13 Nov 2015 08:37:22 -0800 (PST)
Date: Fri, 13 Nov 2015 10:37:18 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@us.ibm.com>
Subject: Re: [PATCH openbmc] Add git version information to os-release
Message-ID: <20151113163718.GB21764@asimov.pw-on-the.net>
References: <1447269619-7651-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1447269619-7651-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <1447269619-7651-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <20151113163718.GB21764@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 16:37:28 -0000


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Brad,

This will fail if you build from a tar/zip file.  Can you add a
fall-back if you are not building in a git repository?

On Wed, Nov 11, 2015 at 02:20:19PM -0500, OpenBMC Patches wrote:
> From: Brad Bishop <bradleyb@us.ibm.com>
>=20
> VERSION_ID =3D `git tag`
> BUILD_ID =3D `git describe --dirty`
> ---
>  meta-phosphor/common/recipes-core/os-release/os-release.bbappend | 8 +++=
+++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 meta-phosphor/common/recipes-core/os-release/os-relea=
se.bbappend
>=20
> diff --git a/meta-phosphor/common/recipes-core/os-release/os-release.bbap=
pend b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
> new file mode 100644
> index 0000000..1692af1
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-core/os-release/os-release.bbappend
> @@ -0,0 +1,8 @@
> +def git_describe(d):
> +        return bb.process.run("git describe --dirty")[0]
> +def git_tag(d):
> +        return bb.process.run("git tag")[0]
> +
> +VERSION_ID =3D "${@git_tag(d)}"
> +BUILD_ID =3D "${@git_describe(d)}"
> +OS_RELEASE_FIELDS_append =3D " BUILD_ID"
> --=20
> 2.6.3
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWRhG+AAoJEKsDR8wtAMEZCkAQAKicI5XOKCyk2TMaV3l7IePa
kpTCt9yKg17IJicDWBnxGWVTbhKyvIQAvGvdaLShHUI9qXrHk8GU6qEAZUYEgN+j
OnxxTuE92PLlJTEw80N0fWupb8kTBGyMzXtfe5mRMPTP0Hr3EDUdeOYoOVogIdeS
2MSRdf2hXKQgz9BQQSk8d5kGWWWIEH6tg02TPQGqTM05keUerrNChb7ZGKe/Otj4
eZmYhKkTyeLriZAlVUBr2670/v/Td1sWp0z3vBVvDGdgfAE6ybD8R83EZbiSE8c0
Wsy9dGb8adnZ9bK09o+asVKPSOr9fiazin9/BNSsmIsTXNVvatIOntCVNOJzITfW
kuuo6NXFwApOfkFx2yrRK6Y3kA+S+apzAUGLJEUXgnERqIYhh/9k7yc5IlYSQHGH
H8v5AY4/8Cmmhfb+XIWAuP+aeOZgDzvKJMH60zDzxy3wKSllAWMYa+/Ds8pt9b1n
UqL9uyeh3OyPxmXbJP8NxpHswruml/TdXzRfra+R69zgyZmUOXiHWQKGYppOmk2g
KDyx5SL9SL1Dk9ZvnunLjKdV79exktpjyuJEhbF9Cal/rWyQ20sNqBhmLj2GJljv
YtjALU8r0jHvVtx9odnldqjsrmmbwv3mCKOCcdnhyw40p9xPacGk9Qtq15yXzPWV
K1ObeXcgFOBfJjLO3e7W
=E92D
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
