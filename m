Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7D8DB1A0B63
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 09:44:11 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1457045046520483.7576419578919;
 Thu, 3 Mar 2016 14:44:06 -0800 (PST)
Date: Thu, 3 Mar 2016 16:44:04 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH phosphor-host-ipmid] Initial autotools support
Message-ID: <20160303224404.GJ6601@asimov.pw-on-the.net>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
 <m3vb8yslyo.fsf@oc8180480414.ibm.com>
 <CACPK8Xex_u+CsJk1VX1yLr7J3A-BZuSM6eBskT7OdQUV2CGKJw@mail.gmail.com>
 <m3r3jmsfxs.fsf@oc8180480414.ibm.com>
 <20151123200347.GF21764@asimov.pw-on-the.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Content-Disposition: inline
In-Reply-To: <20151123200347.GF21764@asimov.pw-on-the.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_2_25026_9
X-ZohoMail-Owner: <20160303224404.GJ6601@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Thu, 03 Mar 2016 22:44:12 -0000


--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stewart,

See the RFC patch set I just uploaded for my attempt at a cmake-based
system.  I personally feel that it is much cleaner for the 95th
percentile cases that developers have than autotools.  I believe it
would also be fairly straight-forward for us to write TravisCI tooling
that leverages the 'find_library' directives to ensure dependencies are
properly downloaded and compiled against.

On Mon, Nov 23, 2015 at 02:05:18PM -0600, Patrick Williams wrote:
> > There's also the odd thing at the moment for host-ipmid where there's a
> > shared library that depends on symbols in the binary
>=20
> The shared libraries are plugins for host-ipmid.  We happen to be
> providing a set of common plugins but those can be overridden by a
> particular machine.  We also provide a set of openpower specific plugins
> for the parts of IPMI that are not specified (OEM commands) and those
> are in another package.
>=20
> We should have a discussion on the call about autotools vs (...).  The US
> side of the team has zero experience with autotools and so it was easier
> to just write some simple makefiles to get started.
>=20
> I don't consider autotools to be the "defacto standard" since cmake is
> also pretty popular.
>=20
> --=20
> Patrick Williams



> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW2L40AAoJEKsDR8wtAMEZM68P/jC9PvS/lIS5oRltuCLrT69v
voyifMrJHHbi9K2X4Hc8XER5jXC9qrkHuPmQ5hf6EuDqMNzi1tnMVdN1+wqf51cP
A+PNA51imrtbELRrasz/tjmuewaoT8Osn1bYrjOiZsK/QaiFegnxHsUANyJ8cmD/
RMG8eS83DomPqlXsNGEHaNKgJm5tgFNLDlLPW9VsA2pS7mJS//cz3hzr21LZs0rg
PfcKzcOnLgMFRnQ5RYDrH3Vt3M2etVlgJq8DvKvqKYeAWtwA3O3+dU+l6+xh6au7
ZQmiHEKB6LKmWot8M8yjca0Wp9LnVG+x9Ag4D792fwQYpWxjOovlAwlckpgXjpDi
z+rZEcZPP9eNp9ls3+FFes3f30Vnr40yHFmuUGwAJK0DsP0NFWLLf5VIsL5dmte3
47BilX4DbaC0dj+DXUWx/doYNBbY89x6ZMXpxEi+VKdoaHYz4itZ03611uP5Xnhl
lc1fEADn4XMU85eFu1td46wFAsPosaw7Rh76cxSiVkpJQfnBiJxi4S/DBJs5+UdB
Fj6TaUksJIsUD0onMSIfskk7s7qqj4LyoTwOfCSso8NXJjGo56/06xVLFDD52k5J
k4ticbnOvIoPf4CmgaKX7p6tY7GY/cEfUq8NnJFJorK9RByFgHjJSA3WIqhG/n64
g/4KCIhn+zWbufbnX6d/
=dv2m
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
