Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D6ACE1A0CCA
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 12:43:10 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446255786944150.61059937658445;
 Fri, 30 Oct 2015 18:43:06 -0700 (PDT)
Date: Fri, 30 Oct 2015 20:42:58 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] moved to =?utf-8?Q?btb?=
 =?utf-8?Q?ridge_version_that_supports_the_correct_seq=2Fnet=2Flun=2Fcmd_o?=
 =?utf-8?B?4oCm?=
Message-ID: <20151031014258.GL31364@asimov.austin.ibm.com>
References: <1446255376-17351-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t5C3/nrmPumNj5sH"
Content-Disposition: inline
In-Reply-To: <1446255376-17351-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_1
X-ZohoMail-Owner: <20151031014258.GL31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Sat, 31 Oct 2015 01:43:11 -0000


--t5C3/nrmPumNj5sH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 08:36:15PM -0500, OpenBMC Patches wrote:
> =E2=80=A6rder
>=20
> fixed makefile.patch because it couldn't auto patch with version of btbri=
dge
>=20
> https://github.com/openbmc/openbmc/pull/54
>=20
> Chris Austen (1):
>   moved to btbridge version that supports the correct seq/net/lun/cmd
>     order     fixed makefile.patch because it couldn't auto patch with
>     version of btbridge
>=20
>  .../common/recipes-phosphor/host-ipmid/btbridged.bb        |  2 +-
>  .../recipes-phosphor/host-ipmid/btbridged/makefile.patch   | 14 ++++++++=
------

We don't need any makefile patch anymore.  I'll remove it and merge.

>  2 files changed, 9 insertions(+), 7 deletions(-)
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

--t5C3/nrmPumNj5sH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWNByiAAoJEKsDR8wtAMEZszwP/3vLTFVi1k5ECTL5rrmC24QU
DITB3H6khYSJV1PDJOYJ/RWWLYJ+PBgLvVWurGK11N8Z9ZjK+gdVc+qqhs8oS4+C
lqfgGqbcXJPQrz4+H+CZEaqB4WyHLNvssMndXXpjyxrhynlVaSds9JjX+bR/ssIV
rpjcCW54W1g5jDULibzlg5aSTudJhMGhvMr+hua3ASj8o7RZZvdubbV45yZoeJOP
HuXHHsg6Qhnh/V+nUTvEfyDyKgJMlmPdA8xUsk/8/o+Zs9RHQPpzjFhvB7pUBA+h
iTJx37EXlu2glktizx2rm3rz/xImd2TrKzWLPYZ1rzZ0WJv+H+nFBkHeO0Na0zau
WfHHAq6bmMrOWRAxuGxad+CsCD0Khx86pkeTvWeDsDWlbhzzKENo2htZTrQTxTnx
/L9PEOPC0TWjM0zQwArZL7C4DkPReaw6w2sSUzijTS2FPWe+mFU0gG8f6oqTQgKI
0mRiW9teVbNd387hjbmdJSWh0DhpwHX97/x2cfXXot0oxL6i5TRDmj5yRHe8K516
pAgtJPlg1pvM+xB2Phd2jAJEJvof6EICTcyAZ2685MuF3QpwqGacLb+powF7XXIb
96BfhiZMmwV3cmT0Egus3Y6hry6dgnu1vVPHPGz6nZlhhtrnx81IfvXPfABd1SI6
8lQRjgP7oHjQY5EvDCKX
=9qRU
-----END PGP SIGNATURE-----

--t5C3/nrmPumNj5sH--
