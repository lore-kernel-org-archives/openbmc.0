Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFlZw4YzjzDvpk
 for <openbmc@lists.ozlabs.org>; Sat, 12 Nov 2016 03:23:20 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478881387547557.1984510112076;
 Fri, 11 Nov 2016 08:23:07 -0800 (PST)
Date: Fri, 11 Nov 2016 10:23:00 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Tiju Jacob <Tiju.Jacob@flextronics.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Add new machine
Message-ID: <20161111162300.GI15757@heinlein.lan>
References: <MWHPR08MB2431CF1685C470069330770495B80@MWHPR08MB2431.namprd08.prod.outlook.com>
 <1478817355.12438.3.camel@aj.id.au>
 <MWHPR08MB2431FE7A69A2F10D4874DEDD95BB0@MWHPR08MB2431.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Content-Disposition: inline
In-Reply-To: <MWHPR08MB2431FE7A69A2F10D4874DEDD95BB0@MWHPR08MB2431.namprd08.prod.outlook.com>
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
X-List-Received-Date: Fri, 11 Nov 2016 16:23:21 -0000


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2016 at 04:07:47PM +0000, Tiju Jacob wrote:
> Thanks Andrew for the info.=20
>=20
> Hi Patrick/Brad,
>=20
> Are there plans to pull facebook's OpenBMC to this repo.=20
> Can you throw some light on this. I'm not sure how to proceed.

There is not any plans for that at this point in time.  They have a very
different userspace design from us and it isn't something that we can
actively support ourselves.  We would need them to take ownership on
their own meta-* if they wanted to get it merged into our tree.

>=20
> Thanks and Regards,
> Tiju
>=20
--=20
Patrick Williams

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYJfBiAAoJEKsDR8wtAMEZVMIP/1SP7hgnwnVgLEchROsv7h2/
DZ9SJafTe1/SK9uZMpGNlevE1GHOJgW/9IUX3OAsXaeGn4FXF90iOTglQAv6NNsj
2IGtwYz0py9EIidQCrIXIs5IRw5J6vMEcdv+zp1+WxeTQbsw7d8/tJeYxy7rNyBL
0Y40RkkRKlhJMtcfYLUtcWnoi2Zg/+eMaqhWFS0RTUM8rLoIu28uQetiwmeCYckd
I7Or2+DKSa1j9YAHo/zt+IrUpGTYsVlHQJSEIPLT7yk5Lal8IyPSO0lhAD4VoQ6H
ndBAcweiCfaF6rH2gPbNu05Inj8oaBgQvyzLhy6Mve67EUx1b0/TUDpztKTPt4WQ
PToue0rt5ieigAq/qwItFU4YacFVp01gPgUs1F0dFO2jtkI0o1OSDQMt+MR7I8Jd
KqLSQmglsksikHO8biFTqkdmwBCAbpLmPJYfZS78hB/xCvyawNoh6iJ6qK7ZnVQI
yXYXq3BW6WY7HqFAflGuCGLxBnJ2S9eua6mSfocSZ4LE/nqFq7IK0AfZr2g5zDBd
fYDB0q4iDqW3/FIebJLPYLl6YkiLAbCLMbaQ6x6ZBDmWrbsGmcmPkmOnCUtt60d4
Sesx9hKmZ1a+s1+PeQBHf+DJwyeL3IQVqYlkUXzsGk7xZ2n0kx8HFpf8J99qF4fF
HSUI2RRtm37Qra7NnM+D
=wjGS
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
