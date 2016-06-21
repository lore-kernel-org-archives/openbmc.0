Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYkY554t4zDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 20:31:36 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1466505083405563.5120948064944;
 Tue, 21 Jun 2016 03:31:23 -0700 (PDT)
Date: Tue, 21 Jun 2016 05:31:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Adding meta-raspberrypi as a platform
Message-ID: <20160621103121.GL19968@asimov.austin.ibm.com>
References: <CACPK8Xezv9egJUBxBdQm4woL9B7FrusQLajhOPuYru+tbCJaDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jRTR+8Yehy7mazmg"
Content-Disposition: inline
In-Reply-To: <CACPK8Xezv9egJUBxBdQm4woL9B7FrusQLajhOPuYru+tbCJaDQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 10:31:39 -0000


--jRTR+8Yehy7mazmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Joel,

Can you go ahead and open an issue for that?  I have a few layers that
Brad wants me to add as well.

The issue is that layers and yocto need to move "together" to ensure
compatibility and I'm in the middle of the yocto-2.1 transition.  It
will be trivial to add the layer once that is done.

https://github.com/openbmc/openbmc/issues/384

On Tue, Jun 21, 2016 at 04:57:14PM +0930, Joel Stanley wrote:
> Hey Brad,
>=20
> Jeremy came up with the interesting idea of enabling the raspberry pi
> as a simple, cheap, easy to obtain development platform for OpenBMC.
>=20
> The user story is: Bazza has a dev board on his desk and a spare
> raspberry pi. He wants to give UART access and power control to a
> colleague on the other side of the country so they can bring up the
> NC-SI stack.
>=20
> He could cook up something custom, but it turns out we have this sweet
> project called OpenBMC that is designed for this task.
>=20
> I've been toying with the meta-raspberrypi layer[1]. Can you help me
> add that to our tree and have it build an image with the openbmc
> userspace?
>=20
> Cheers,
>=20
> Joel
>=20
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--jRTR+8Yehy7mazmg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaRd5AAoJEKsDR8wtAMEZi20P/ArWWENPmVsDecHuWjH38hPB
koiKfBf8TCIvVXEII38tV/9c8k1TeBpiuMlgKdERgCIm4sg9vcn8QRQCAwPmL8hV
DP8+fT+Kbvxf7a9vHzzwXu5yGzWbFkUuemTDIAW74/jV3vtSgJicdTzaC+nw+jT6
PLcrVmlqRSaTcFBXEESSDQhSLGPs4Jk+HFDp4pi5uPaSelV/jhj0Jl1DIevHNex2
W7geKo/3bp418zkOKhwBOuylecZM+Ppi+W2ZFjThBrZaG5v9h8qIgF7I06/Mrbkp
yR1If4U6SyXeDnrpJ50IkK4eOKQ6T8zmfvZIKK48eT2T2Hnthz+xHVo/Uq31c2No
Ij833wAUMQCYXuQlccC3kcYjbm0CjWcGu/87R6RfcQY4Brmfg9nXaeAwAARCZEtp
lzT8sbHV68vlg6vaqv0aDERM1l43lb2nau1mV2CBkVPlFwtrL2yxuZEALAK0T1zC
T6Vna6ui2I+vlXEuoBYb+gZgnEymSZ6I/Tdecanlua/QmfsjycxfVoTOPp4blRMH
7H/hOapoZSsJxA1CddiWtOjYCaoxxSs+WvFjatc9k76mQQ73fQu43bu4/AkMh+1I
6zQ4+XTZIqc8HTbySidt+h3pgX9qLXr/kYALUnymTy73mYN9maDfXK18nIgAPipS
qC43xSflOuJ7JEsn/dZV
=v5K0
-----END PGP SIGNATURE-----

--jRTR+8Yehy7mazmg--
