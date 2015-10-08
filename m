Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 97F131A0026
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 11:45:44 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444265141331607.8916184250103;
 Wed, 7 Oct 2015 17:45:41 -0700 (PDT)
Date: Wed, 7 Oct 2015 19:45:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH rest-dbus] Add supporting files
Message-ID: <20151008004539.GF12084@asimov.ibm.com>
References: <1444262679-18773-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline
In-Reply-To: <1444262679-18773-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151008004539.GF12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 00:45:45 -0000


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 07:04:38PM -0500, OpenBMC Patches wrote:
> Add makefile, systemd service file.
> Hardcode resources dir filesystem path.
>=20
> https://github.com/openbmc/rest-dbus/pull/1
>=20
> Brad Bishop (1):
>   Add supporting files
>=20
>  Makefile          | 21 +++++++++++++++++++++
>  rest-dbus         |  2 +-
>  rest-dbus.service |  8 ++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 Makefile
>  create mode 100644 rest-dbus.service

Any issues with this being merged?  It has been out there for a while.
--=20
Patrick Williams

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWFbyzAAoJEKsDR8wtAMEZxOoP/1M/OSKEXujwhw2ZmKakScJl
5kGMOPwoBjI70ZVp59R8tT+jA6U3cYJtyHBlryw6SWKQrF9dDEZWuTAU5kw3LnEy
vzHETJ6DE55GTGlhDKpz8RlKaWQ8g3GqtfFhnGQkLercGfOjMWUYFYDwTfcT6MAb
f8RuHVPr6gFEgssamILWM/osbXScIbf1VsXcgZCg8MN6mkLqYS/TySIcW03ScQn5
rK/yjop8kdgScBlZ7v7thX+WKS7EpqqubU1pBuUfTEXM2trwphL1+CTcDWkRF9ox
+vnmSakwuK0TnQgXRsC1saDUrG8BaeMd3r+Iv60hafZMSuHpT7SLr8dlUNByBU2q
SLQT8wuxoOUBiJIV6MWxsjNRmL0ndEDsCwBWVi714cyCUBu8Xfmkg9GuCD0AWmrW
EVrXXfnc83BfovDRme/Ev9+Aqg0IGFaX4UkLKBuzNycVKn+qkZeRUaP6ste0f8BQ
T30wVfWj71eYNs5Aj/cuaRIhsroqdTzWZnA2monmo5Cq47we1xwCwNJLlVX7okrd
fptUIIQJ1Z+2y3ukr5ggdkhuhXdiU4aBMLX3Guo8Fj00bw+ahIqye4KzpSF2RqvZ
VSzdkZgcp6tXTXlalJLeL7EsWLFNLnqXGXBWLkKYaIbU8yPiRIIG70byO0Ezzfjt
z6jwjMrEvctzqLy7rlaH
=kQYp
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
