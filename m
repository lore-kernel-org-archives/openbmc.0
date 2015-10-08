Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 70DE71A022F
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2015 05:49:08 +1100 (AEDT)
Received: from localhost (32.97.110.53 [32.97.110.53]) by mx.zohomail.com
 with SMTPS id 1444330144282488.160258015326;
 Thu, 8 Oct 2015 11:49:04 -0700 (PDT)
Date: Thu, 8 Oct 2015 13:49:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v3] Initial IPMI Net Function router
Message-ID: <20151008184902.GI12084@asimov.ibm.com>
References: <1444329868-31461-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
Content-Disposition: inline
In-Reply-To: <1444329868-31461-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_7
X-ZohoMail-Owner: <20151008184902.GI12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.53
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
X-List-Received-Date: Thu, 08 Oct 2015 18:49:09 -0000


--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Been plenty of opportunity for review.  This set looks good, so I'll
merge it on github.

On Thu, Oct 08, 2015 at 01:44:27PM -0500, OpenBMC Patches wrote:
> https://github.com/openbmc/phosphor-host-ipmid/pull/1
>=20
> vishwabmc (1):
>   Final IPMI Net Function router
>=20
>  Makefile     |  24 +++++
>  apphandler.C |  58 +++++++++++
>  apphandler.h |  11 ++
>  ipmid-api.h  |  91 +++++++++++++++++
>  ipmid.C      | 326 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  ipmid.H      |  15 +++
>  6 files changed, 525 insertions(+)
>  create mode 100755 Makefile
>  create mode 100755 apphandler.C
>  create mode 100644 apphandler.h
>  create mode 100755 ipmid-api.h
>  create mode 100644 ipmid.C
>  create mode 100755 ipmid.H
>=20
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

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWFrqeAAoJEKsDR8wtAMEZFAYQAKPTqoeljQgP3h0S3eoYpCdV
gp4pcAbCBDd9Lpn+qe+iomWM4lSO8Or3gJZunMObjflxP/em1dyAvC5Vu6WfyRJy
xFor73Ottgpkc4oAACig2ymEOvpKKe/qpXYOE0f39h84AbC/SuB8N2HXf3NxA5K+
8tylo4N20552ZZo4h6WF/qyBNjm5yrnFu/ggSUvL/HSI9pjljITvesz9UU5VzHiK
7UfCTssSZQ7XUmH/C8WxENRj2LVIMSP99ZOgvFoqrxmnJS75a6iAxf5UkHZisHB4
SAZ4alLKa5asAyRhB0b/xIwGZbiiOT60eplSNNQx6qr5lpn8+lxboje+Dq6ljQ2a
V4lexETUkq38rZWmE9iZRcPw36j6RmFGTKEJmp7r11rVl/IDQG6kKnpsihmG5aZR
DQ7BbZRpczJ9BnKUDxWvsncnBxBvMU1ZsdC9LUvFk3mRICtWOak7ObqLJlJUHRZv
LRNpAGW5Rw5YgZbAR6j0rWlDJyIhVQDFM+Cubyx11IA37sygeV2wWBrkWeceFzST
VCD2TJrRFJmo55jhH0hmMCM/dQK2e7dMSA5XrFE9EIPVemAcJdD1UNMMppa2YqU7
OrerZnuVa2NyKzMXwxLWfZJwf6A0EdDXDmVnLpqx9DfX8+cJcEjz8G9pK23Un+rq
vTPa2Q2NSTiN35A5f2F2
=0T16
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--
