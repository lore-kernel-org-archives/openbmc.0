Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMTvt4f37zDrCV
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 07:28:40 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1501622913778641.9540588426279;
 Tue, 1 Aug 2017 14:28:33 -0700 (PDT)
Date: Tue, 1 Aug 2017 16:28:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: REST API docs
Message-ID: <20170801212832.GC14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <87y3r3ooyv.fsf@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 01 Aug 2017 21:28:43 -0000


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2017 at 03:07:36PM +1000, Stewart Smith wrote:
> The documentation up at:
> https://github.com/openbmc/docs/blob/master/host-management.md
> says /org/openbmc but we here tales in internal bug reports that
> everything is switching to /xyz/openbmc_project.
>=20
> Except, I don't recall seeing any deprecation plan.... is there
> one?
>=20
> We're heavily using this now for op-test-framework, and there's a patch
> to switch it, but I need to know how far back/forwards the existing/new
> interfaces are supported.
>=20
> See:
> https://github.com/open-power/op-test-framework/pull/150/commits/e05b1a89=
e032b1bbe14d9a177afa46f1a2c6413c
>=20
> Also, could some more effort please be put into communicating these
> changes. These kind of surprises aren't great for our already
> constrained team.

Stewart,

I don't know why this is a surprise.  We have been communicating in
various avenues that the /org/openbmc APIs defined for Barreleye
were all deprecated the day we split the 2.0 development branch.
I alluded to this even in the email announcing the v1.0 tag:
    https://lists.ozlabs.org/pipermail/openbmc/2016-June/003707.html

It is a violation of the dbus spec for us to be using /org/openbmc since
it is not a domain name we have control over.

None of the /org/openbmc interfaces went through any proper interface
design.  They were all defined and implemented ad-hoc by individual
developers as part of the Barreleye proof-of-concept work.  There are
numerous inconsistencies in their original form.

One of the first pieces of work we defined and began working on was a
dbus interface YAML specification, from which we generate compile-time
enforced dbus bindings to ensure compatibility between applications.
All of the xyz.openbmc_project interfaces have formal documentation in
the phosphor-dbus-interfaces repository, which had its first commits in
October of last year.

The dbus interfaces you are _moving to_ were defined and implemented
in December of last year and we moved over to them as a whole within
the code base by Feb.  Your first commit "Initial OpenBMC support" in
your repository wasn't until late Feb, so you were already using the
wrong interfaces.

We have been working very closely with the automated test group that
works on the openbmc-test-automation repository.  I was pretty certain
that within IBM there is some affinity between the team working on this
repository and the team working on your repository, isn't there?  In
fact, I clearly recall discussions within IBM questioning why the
op-test-framework would not be building on top of the existing Robot
support provided by openbmc-test-automation rather than implement
a different custom framework.

I was not aware that you had written your own test automation suite that
was using REST APIs and you were not relying on the existing and
supported openbmc-test-automation repository.  I also did not hear any
inquiry from you, either publicly or privately, on which APIs you should
be targeting for work you were doing.

The deprecation plan is, and has for the entire 2.0 development branch,
that 1.0 and 2.0 have a complete API break and there is no attempt at
backwards compatibility.  A clear requirement of a 2.0 tag is that all
/org/openbmc interfaces have been removed and replaced by something
documented in phosphor-dbus-interfaces and implemented within the code
base.  We have been doing that at a fairly regular pace the entire
year.

--=20
Patrick Williams

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmA8n4ACgkQqwNHzC0A
wRnt1Q//UxyZGAHHy7M5xzgl6EzWVgmhMeljH6hbOSMSUw7NL35Om2DeJNhVOV1N
rq2Ique14fD1ABlVnfSgH8CdXuzyx0Jr82FC3w9rerTY57PCYKCAgjxwM7bUttc3
LLTPKW8ooe7hE2TEvpsMJOQOmiKowhK+tnnhjHVFa3j0YH0QmMyx4lK2qCEm0GTn
1onzEwaTuMo8dPIThdDWcaRyFHC7E04AxS4Rzig1sM6pk/NhzTTbD7jG1mZen6br
A9XHlB76/nl0yy0tvLO0c2yQMZ0yaedtJwjcz8pffn5IDgShTyy6U4kxmWy4nQ9y
ZZ8GzBk+nfNKJE/a71CgvMeSabfZ6y/EzDyJQj52VxeOzc/JQmeMAaUX6CwZsEKT
q6Zb2IGytRO8SjoU8cuZXXc2mGb9vqj1t6imH541dcsa5GCJMCQI2XIhDQUS4n+k
+Du+mn0MXBVMXqszdUVntOeVUdzc3bKWRg+OqSsAXCo7U/42quaDjthM8xG2hd2t
7sptHEQoAYIGwx3euICv9LvdT+uTTlc8OjXj2wX5Dm9dvg8vrb7aAfr5LvURBDhc
t7ZvSkQA++GiyD1QCrj0A2IDyQQFxPYxHf938XFgfQVXD1O816VJow58crruaP5Z
zEXnkIcINik0M6CgX1JRV7oWBIe0v5tM7y9TPS+IDbMEJ6PxB0g=
=YrZb
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
