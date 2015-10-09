Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 23C161A0541
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2015 06:26:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444418762650561.648369840454;
 Fri, 9 Oct 2015 12:26:02 -0700 (PDT)
Date: Fri, 9 Oct 2015 14:26:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2] Use SYSTEM bus instead of SESSION
Message-ID: <20151009192601.GK12084@asimov.ibm.com>
References: <1444418621-10582-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline
In-Reply-To: <1444418621-10582-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151009192601.GK12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 09 Oct 2015 19:26:06 -0000


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Trivial change that looks good.  Merged on github.

On Fri, Oct 09, 2015 at 02:23:40PM -0500, OpenBMC Patches wrote:
> Use SYSTEM bus instead of SESSION
>=20
> https://github.com/openbmc/phosphor-host-ipmid/pull/2
>=20
> vishwabmc (1):
>   Using SYSTEM_BUS than SESSION_BUS
>=20
>  ipmid.C | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWGBTJAAoJEKsDR8wtAMEZ50EQAKpH8D8eQTQ3vC2/j4lWMXv5
fD9vfOcdaC9AYeh/6Ur8RwjERhSgzVjjD3jYRi0+j313gu/oii9RGkSdR/5f7aDl
kPshpYAmp67FyNl796dVBWJhjI6f2ZIH9zc3qHBf7xssGwX8wh8jNuXmRe+49QUv
7kyBUpkZRrRWMM1Eqyh5LF5tZ1HA5YwWU3a+wjP+n/WFfAFRTdQ2LUqgHFPAAgHy
iYnVss3wRDVXsAUeTG1NKYu/jwlUu96jXbF+ePb6o/QI64EmLyIRNZGMX3axyUzW
CZYBkatuTs9qbcGGuV9RMgS0JogDPEonUzvGrl0v+uGjCIAEUtQxN0zCO7DL0XVk
mXue5aQKCyO1bPZG47B/EdClyG/qIOAM5EyliD3t/ZQmOuqS2vILwBwgplZPA0dY
CDr6ZTDdURRv85xrcZvr+Kdsr01eALs9nsIBrEGBko1BphbdCRCaUXnedVnBdBk1
aBm39gE/Kq6QU3fbJHNynYONz4MlU+q3KkNqPPjMAdi5RL93xH3fH6el/ygr7KF/
PKsW7+GRDn2mxzFyLdEew1VK4jfh5dhlNDm90/i6gtcrK3GlCr4UmSEx85pwWWyZ
rlteKnoELV9Rk2gTECDwPLSMgcH/Gvy2zoC1iKc9IHTzDkic597C3W9g9Z3qaXRj
LSxU4LNnSIcJNSIN/S5M
=EZG/
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--
