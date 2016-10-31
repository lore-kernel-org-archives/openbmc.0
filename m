Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t78xW5H75zDvHq
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 10:01:35 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1477954887896917.7881849581648;
 Mon, 31 Oct 2016 16:01:27 -0700 (PDT)
Date: Mon, 31 Oct 2016 18:01:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Jenkins down?
Message-ID: <20161031230111.GA17105@heinlein.lan>
References: <CAPH-5w4nfO02yQp_mjZhS2hp9UJUTCyLTZMQMNFO06zTshFqmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <CAPH-5w4nfO02yQp_mjZhS2hp9UJUTCyLTZMQMNFO06zTshFqmg@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 23:01:36 -0000


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 03:07:43PM -0700, Xo Wang wrote:
> Hi folks,
>=20
> I noticed that the CI links in Gerrit are broken. Example:
>=20
> https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/903/
>=20
> Is this from an update?

The Jenkins server only keep a certain number of past builds otherwise
we would run out of space.

I'll retrigger your job.

--=20
Patrick Williams

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYF803AAoJEKsDR8wtAMEZW0QP+QEFrnBcrxAJ9S8HvYFC7pi5
muet7+1m0kvJNiE4J+Se+DClsFUqe9mPRlnEUMWqVe0W75q6rShFoUbAVr9bR2q7
UQp4yYQQQU9l91nH5QcSl1/h/+S3XfXMhTwYNLNcfzbSlkAPE49RUCY03014Ackv
drsdoIik0ikYnFupFZWpxuNjRXSs4sq3KtOhZU2FXtrnw0BdCHjsc26umsTFiURO
fdYuKizDkHjU8MzWjYkUOoTS3fi5oUZVYo0OtElU4xItwSR097nq7zpN/2K89Xig
0YrRq2MbeW4KdSXSquoRMEeKtcrtNMolq+xt/rZK5F5RfY1GZoW0fWeEq3n2AKDw
OXyURlw29mes9bFj0xvZiwg3UWaOyY4WbcA28JMrZ0c6fFvdAqm+ykLCoa7mkgoE
hv0131hZ766U9AGIn30qrT0fxPFnX8Jo3snZCa6l8zkesYDp25GT28YkSfs4qRXg
B3dvtcR8eFP0DmbSjmeWe7Mg45Ri/aXJX2h5NgWjGi7+9euiNCYlzUdMlCIhl8Fo
3s/9oh5C8fAnC0xXOlTBv2OLaiYoux0s89XDmgPLH8YdERtagPuVjSuRc2lNasGb
6xOt1XansSPVU2Ul5mp3PnWgU1nYoOaMuvVotAuGs8vaqTTizDwrJlSx1ubIVz0e
UKdZLdgTYgV89c4nqyhf
=5RBr
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
