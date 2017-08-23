Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xckzM4zGszDqYV
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 21:02:39 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1503486149611935.9491601036988;
 Wed, 23 Aug 2017 04:02:29 -0700 (PDT)
Date: Wed, 23 Aug 2017 06:02:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: sachin naik <sacnaik@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Regarding oe-core2.4
Message-ID: <20170823110228.GB3583@asimov.austin.ibm.com>
References: <CALFfRJNnOwgdKt9GixopVhk_6nMZQJB==_RjwosyUcoYNg8K-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <CALFfRJNnOwgdKt9GixopVhk_6nMZQJB==_RjwosyUcoYNg8K-g@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Aug 2017 11:02:40 -0000


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 06:01:14PM -0700, sachin naik wrote:
> I see that oe-core 2.4 is coming on 2017 October.
>=20
>=20
> Is there anything planned taking openBMC to oe-core 2.4. If Yes I would be
> more interested to know the dates?
>=20
> Thanks and regards
> Sachin

Sachin,

We do not track the upstream oe-core releases, but Yocto.  Generally we try=
 to
keep reasonably up-to-date with Yocto.  We did an update in about April
to 2.2, but unfortunately we are not on 2.3 yet.  It is just a matter of
someone volunteering to do the work whenever 2.4 comes out.

If no one else volunteers to do the upgrade, I suspect we will do our
next upgrade either in October or January based on the IBM team's
planned availability.

--=20
Patrick Williams

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmdYMQACgkQqwNHzC0A
wRl8Rg//aqgma0EkvfaD7F5D1LOWM2eIgYXi2b7rO6omVGOhkQgHs0woGDkNOsUd
EWMOCJPLhKn0+ExSMQgiPc6B8CQgSzA8CEOLFujBWmLJiTIvWdT7SCEJjWt7OJHI
2OzESM06dFZ8XHgmZksQJza1d8AND74eJ+i3S8VO/pFgjmnjltSNQNWqRaSWZ89L
9GHvVed4n1l8uBaMmjmSFcBk5gPuifE/i1G/VqobRZMzFYBZfZpBQLuQv7/PD3KT
SJY7Z/aePcGZHIZ0wYc0wIx5qOYRyDH3aUPFs1DtRC9MJbZUJyV9T2aaQPwurSki
jXIZfHUezG8vWJpYrjD4GU1hspwF/GqJKJjtz9HkLtnhOXBNhTJOT3ny+qi+ZCmR
OHYR2dO6EObWGJCwxxDmpq1jwRw1s/a7reOMzrYU2QIBRmrKvpdAjvXWVT62SL8G
TlX4ujOTTWqZx0lxwLYJYXrckYYH+KcngwxoHpr4twD/Kz65v06gUMQbHAANK9AY
TJOJaKVE/BEeaXXW5ODEx5xSquQfeRi/f31t3jJFlQoS3gKDRaM5hAiUHCaBoPER
cGI8v8PLtFw6Wn/V3BL3wH2I+Pq44P8xbqY9HNwJ569bspHgOKO7wXngOGgNLJek
3UKcOHUM4rdQeSyPbX7jv0lAkW4Dd2Txb36fvZsgezQcdVoguTo=
=zeyW
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
