Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNKWh35BrzDr2g
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 16:14:08 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1501740837720896.7093992530135;
 Wed, 2 Aug 2017 23:13:57 -0700 (PDT)
Date: Thu, 3 Aug 2017 01:13:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: REST API docs
Message-ID: <20170803061356.GI14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com> <20170801212832.GC14987@asimov>
 <87bmnymoz2.fsf@linux.vnet.ibm.com> <20170802130148.GF14987@asimov>
 <1501719587.2664.15.camel@au1.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline
In-Reply-To: <1501719587.2664.15.camel@au1.ibm.com>
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
X-List-Received-Date: Thu, 03 Aug 2017 06:14:09 -0000


--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2017 at 10:19:47AM +1000, Benjamin Herrenschmidt wrote:
> On Wed, 2017-08-02 at 08:01 -0500, Patrick Williams wrote:
> >=20
> > Generally speaking, docs are for stable releases, aren't they?=20
>=20
> Certainly not !
>=20
> You cannot change an API in a backward compatible way and keep the doc
> documenting the old/wrong way in the repo. That's just plain wrong.
>=20
> Ben.
>=20

Fair enough.  I honestly though calling this entire code stream 1.99.x
was sufficient "hear be dragons" to prevent people from coding to things
unless they speak up.  We've been actively engaging the teams that we
knew were affected by all of our API changes, and we were not aware of
this one.  The teams we keep informed outside of the direct development
community are: openbmc test-automation team, xCAT, and the GUI
development team.

I will make sure we go through the docs repository soon and clearly point
out everything that is deprecated in the 1.99.x code stream as such.

--=20
Patrick Williams

--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmCvyQACgkQqwNHzC0A
wRmOzg/6An6dh0vNXE1lVLUv3kqUZ7d8UIvV4gVfjonBn7fdeJ4RpQ2uAGT4qYEV
LSiD5Y5PgXKUhlesElYejydx4ytymUYcdO+igy3f24eJ1a6woxuG3mCEzAHmYUuv
cZF8olZ/v/WwoUG3R5dPc+cWpjOVRPZpXDJk5nKuPukwhCyT8yp+IU8Ppb85hUd6
5j1Qt3zY1lEXu21dFH+sR+ZcwBMuFKfymGuDtiMrb7qvOc4bF5LC3h+UaY6pvkSS
jE3NPjt3Szs6pMVwRmlw+sO+wItTG3HVUzYgneKi+bMd68a7TlD8tbsgn6N8SvTc
t2FB454rlWUI6QoRpgOgcOiiKqwb6oNzfhYtaG4xz3beKw7QDJvPRL+Ds/dwlfN8
ssiSjGvqh3t78joQ0jEpX8yLhv4KtFP5h+UopqOsjYFbeozDi1iPlpB5nD6ikco1
Rnk6+Qf7IEO+x86J8LbnRsw9FP3rRM6FA3JQ4bzqC8WrQmWG7GKGt+AutA94+3io
+CbbzqnuqrzSagpL6lvELSifw43O0j6Jp0tuJMGmoJ6vKntlwvR9YpfRKH9Ky0gL
UPEroGrd26LlhLvoKc0WMiVhEujLTFzKBjjes4vAK6kEs2tz7FUqTYRSGtOuPWvM
3v9jgDr6Y7P6LPyZhslUcspbMpdRYQy8UnNeylUcYCUHFaYDaw4=
=lUE/
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
