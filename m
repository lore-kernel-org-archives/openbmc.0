Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBzWv1XYzzDsyX
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 15:11:07 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478491861918256.5909027273408;
 Sun, 6 Nov 2016 20:11:01 -0800 (PST)
Date: Sun, 6 Nov 2016 22:10:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Event Log Error Definitions - RFC
Message-ID: <20161107041056.GF15757@heinlein.lan>
References: <CALLMt=oL-4VXYd5kiKgMW7h_7B2gnx1wHv=pHo0pLk=2SuU=8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline
In-Reply-To: <CALLMt=oL-4VXYd5kiKgMW7h_7B2gnx1wHv=pHo0pLk=2SuU=8g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 07 Nov 2016 04:11:07 -0000


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 04:06:55PM -0500, Andrew Geissler wrote:
> phosphor-dbus-interface/Common.errors.yaml
> - name: FILE_NOT_FOUND

The dbus naming conventions would have this be FileNotFound and put into
file phosphor-dbus-interface/xyz/openbmc_project/Common.errors.yaml.
This would result in the error "xyz.openbmc_project.Common.FileNotFound"
being defined from a dbus perspective.

The code generation I'm working on for sdbusplus would result in the
exception sdbusplus::xyz::openbmc_project::Common::FileNotFound being
defined and throwable based on this Common.errors.yaml file.

--=20
Patrick Williams

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH/7QAAoJEKsDR8wtAMEZXCoP/jIfqcZOV5JlGdJ9Fh5RZ3Gs
FdfE769iVxsMoEnSzq3SNGtwKRM+Qg8NH8z0ByMnCzdgIsVvgyshqH+fEFX01wWL
Qk6Rvp03tRcWQVuACYFytWLcpcmw/Pa2asl909DGAAe9ICqoNTVeiAhP4xZ0y5J5
NlZkkEUirhrz1L3WzbfDF6mKRrbQK0VfjWUquUhxCAvf4SXgqP30TEuVRknSCp9O
lm3+GaYx64RBcqjF5FmFwSv+tbfohh3kG6hqgLigCmjzY7pf7ewBFM1zzSXBr374
sPa7yT4brripG2dpMckiotvcI18KJXMp/XNkkL3Bs/H42ycvMdpTKmti3xB+8DSz
m+tXaQ+p84N13v2PGZHJ7Kd8c/kGR5+a4uam4aDzw5BtUad8YGYwNM+lP/GdWpbP
32mWo3stgWrtXpE2UaemPZyo0MSgk6oB4455Q4b4x8S4afo83fL/2ZPdlBmzyYVs
CgVnc9Frvv9ht4Tjj3z/PwgB3qEd7kt9q5KOpxvpwcIFFSYvxgKi4//y9T6+dMan
GamEBnGJxwuPcYVvvwU/hbMJCulbjIavLcXiR7YiHlDeKvnH2uqdfygZeFC2x4Og
3/wanQitv99NG+a+pX9EiEgVE/J0y+uLc5bV4IYENUjR988XkTw27EaCoRaAU4a0
D/NvpuROw4PaQmZidc/Y
=QDi0
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
