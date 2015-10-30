Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 260CF1A08EC
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 06:34:46 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446233682866784.8743910195016;
 Fri, 30 Oct 2015 12:34:42 -0700 (PDT)
Date: Fri, 30 Oct 2015 14:34:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux] added i2c busses and devices for palmetto and
 barreleye
Message-ID: <20151030193439.GJ31364@asimov.austin.ibm.com>
References: <1446231145-31066-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Content-Disposition: inline
In-Reply-To: <1446231145-31066-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151030193439.GJ31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 19:34:47 -0000


--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 01:52:24PM -0500, OpenBMC Patches wrote:
> i'm not sure compatibility string is correct for barreleye
>=20
> https://github.com/openbmc/linux/pull/10
>=20
> Norman James (1):
>   added i2c busses and devices
>=20
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 333 +++++++++++++++++++=
++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |  28 ++-
>  2 files changed, 354 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>=20
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

In general where should we put the devtree files?  Seems like these
belong in meta-phosphor-machines instead of directly in the linux tree.

If there is no disagreement I can open an issue to track moving these.
--=20
Patrick Williams

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWM8ZPAAoJEKsDR8wtAMEZDegQAJJlbuTzGTXTm8LQMDCswD7l
01Fr4GAPR1GeBcBwb3PShejQYS7+WP+ZeTYPSSBzvGTB++HZbEXITKPVfhjOSS8v
S/4s0nKJhT6TNyNsoEALXEdAA6lLKeai9t/9TDLy13mJ3EDWzHgBT5mJb6bngz6R
TWiCGK98WxNG0oUGk5EStniv3jBT7EYcaDXPl0VEhzlChdW97+UsDpJqNtnj/svY
y8DUmU1LVfLR/aEf0rPdFu+KXECFvEPGi/oorjhBJ9vrCK7JIG6g6uQU6Jx3lrlU
SoCm/llmvxOPpUXL9c4H4K+AVUAX7KViovidrzaZMptpgboYi/AnH7AZPwUzARwO
GT2alZ70iYroixXcViEBOAaZKNqNxWHkcO9Ywpwhdo3Q/dcGfWoo5FN7m1/wwg6r
oHSTbLF2KW6IXPlquRPOUYgOzacnQDyBghvGWivbE89Yn1vhTXAw+lpu6ybmt+GU
qHKRw2FFrckVyVTF03Bns4DjYrKOtUJ7/X0W3F/oJNwzNz/ner9GSuCsc2dAYDdu
Xw7pegnj1JmK4QVhGVZ80J2kshgnYzua2JV+v+i17xdUgHN3ukaRnsb/En9KI+ip
aWt3a8tni+A3p/vD3Cj3LiJhbGGIMszu6YwlSranaX4EFa7ICr6IPmIILjxh6IRl
4puuF6VNMXQ+sf+6ix9x
=Hwrb
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--
