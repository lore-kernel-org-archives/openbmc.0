Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWLnP0vCCzDqkc
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 02:35:20 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1502728516609868.8342215312493;
 Mon, 14 Aug 2017 09:35:16 -0700 (PDT)
Date: Mon, 14 Aug 2017 11:35:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Design proposal to Non-Interactive password update for REST client
Message-ID: <20170814163515.GB20526@asimov.lan>
References: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <f2f1b160-cb20-e02f-1a88-3dffbeacc76e@linux.vnet.ibm.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Mon, 14 Aug 2017 16:35:21 -0000


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2017 at 09:48:48PM +0530, vishwa wrote:
> This email is about openbmc/openbmc#1714 ( REST API to update root=20
> password )
>=20
> Goal is to do Non-interactive password updates to enable a REST client=20
> to update the root password.
>=20
> My proposal is to use `getspent(3)` and `putspent(3)` and here is the flo=
w.
>=20
> REST client will provide a method that takes std::string as parameter.
>=20
> The Provider at the BMC will receive the password and does these:
>=20
>   - Executes `getspent(3)` for "root" and gets the entries.

Make sure you're using getspent_r for this.

Should be done based on any user, not just 'root'.  We might only
support 'root' now but will want to easily add support for other users
in the near future.

>   - Parses the `sp_pwdp` and extracts `encryption method` , `salt`.

Is there a portable way to do this?  Is there any library that exists
already?

Tom and I spoke previously about a possible non-standard crypt algorithm
in order to satisfy some of the requirements of IPMI RMCP+'s
authentication protocol without storing plaintext passwords.  Please
follow up with him and see if what you are proposing here will mesh with
what he was planning.

>   - Makes a call to `crypt(3)` with the extracted `salt` and `user=20
> input` and generates encrypted pass-code

The salt can/should be random for each password, shouldn't it?  It
sounds like you are attempting to reuse the salt from the previous
password and that is not required nor preferred to the best of my
knowledge.

>   - Populates the structure and calls `putspent(3)` to update the password
>=20
> Please let me know your opinion on this.
>=20
> Thank you,
>=20
> !! Vishwa !!
>=20

--=20
Patrick Williams

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmR0UEACgkQqwNHzC0A
wRl6XQ//XY1PK2Yi7RPZ5+/0nSFsQNDzCHBfTfn8Sws7ADbMgP4cGBLYqZkvBbKk
pttplXwZOgleJX4CmWXfAlpPoEhETWWWplf6siFMmoWrOqNJo4t/dhjAeeYqwH6s
XJcxkGd7VE19iTFG8Ej3AdjoUBHQh86VrlysyTND7l2SVUe5IOwL4mHAUjGz98cv
8V+WrELcqAXRGUAot58/RAd1q2N2ljr9oMFCevD1FtzQo1gZdjTEJa2sa8ru3afN
C+fUXzzm2aZBBVVQKnG07Wqdfp89wxN64AX6kOR7fjXRhzLD02RgHQaPVIGII5gh
XAR/A0AlViL+IXOinrW4ZH5gM2B74iLX/OzvlccrxWHIxb8AkkYpY1nceEt4HOtW
8V2+2zcMVy6x20+URY9pA29D/TkTBoPCaf1IAqK/fUBb+DZNX+csdV9scnpUJbVD
vnWduQ9hS4LhYHF4NgTjcHMCVeI62Ud3KYwhKeWhZjykCx7if0H/4HT3xPg48QAy
wBB93cxB2uu1ufJgUld+vB9hgeat3XrLD3oHYB3lUEp96e3AdIs628BfVnUEfOrF
gTeGHYuH/UTtSDKL5JaXnrLrbFqu2wkoUcdIlzx0D3b1Gb2NfQ9LfIb9UIVQ/GTi
N81DQhAvHTuJWUSr/pBchVuROej1ZYKYh0bbLZe6RroG5G2xHiM=
=4usl
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
