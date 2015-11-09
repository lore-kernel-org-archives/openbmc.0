Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 571341A0295
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 09:44:02 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1447109037717927.3925080215363;
 Mon, 9 Nov 2015 14:43:57 -0800 (PST)
Date: Mon, 9 Nov 2015 16:43:54 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc v2 0/2] add i2c-occ to barreleye device table
Message-ID: <20151109224354.GA11348@asimov.pw-on-the.net>
References: <1447086019-22341-1-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <1447086019-22341-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_1
X-ZohoMail-Owner: <20151109224354.GA11348@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 22:44:03 -0000


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jeremy, Brad,

Should these be put into the kernel tree, openbmc tree, or both?

On Mon, Nov 09, 2015 at 11:20:17AM -0500, OpenBMC Patches wrote:
> So i2c-occ driver can be initialized and read sensor data from OCC.
>=20
> https://github.com/openbmc/openbmc/pull/73
>=20
> adamliyi (2):
>   add i2c-occ to barreleye device table
>   add occ-i2c to palmetto device table
>=20
>  .../meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts    | 4 ++=
++
>  .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts  | 8 ++=
++++++
>  2 files changed, 12 insertions(+)
>=20
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

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWQSGqAAoJEKsDR8wtAMEZkScP/3Zb7Imthbf/kLQEmM9TtaOt
xOEHcG1c/h5m/ZR+BUL7jnGJz4ve2Z0w+9B7ni8dFmQQs9AaF0+kmCDg5SXwFF8E
8ZJFE4vAM645lGDbt4eIZTt6cMbh2Ds8Spkp7axW8CgQin0xUu2ZZFuz72HpxGTD
LQiqBPy5nWE0HKiYQsRBkQ4ky8feAnlUZJZvEPum+vDW0waLQYRd7t0YeuQ5+Dld
LIe1HPXgCQvLpv9N3cgnJujD6Vtlsh+ac0HD4XPAfPSO09g0fEmUnEMw1aH1eQau
JCeTKN906TiccFCjgUSCNF57yrzIMHi+FBC01Sq74Qt5Q175+kPhARXfk890QMv3
hyJV/CTCRTYlLu63QYfmLQ1/rJaqm+4Q70bJBiDGLxDC8cJYroE+hMGnNWB7PKKj
ROnDEDvxl/rzmiMERyd6jpxY+XzcKv/RCj08ZGScosSMQiUBQ7eyxaCRfF+zEnDY
sb4UwLzZjbPvvpgRn/zOgLZgx6085XHXE00xyzcvtnQpAnB/mt+EkxI17ZOBe4O1
SaSS57gmi/rFJDVpkwjCfjVnJl8eJirY5Yv0GgZAB9s28/gCZqh1pQLEZz3LX1fd
30QS9S8C212wHe4tMiCBBBFK98hOxRUAvB37ndL4o30eXUJFXqvBhkRYUvHWgCqG
aUFQ+KJNwFU+UbsMacIh
=zky2
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
