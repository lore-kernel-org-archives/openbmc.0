Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkXg90lJjzDq8f
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 02:38:11 +1100 (AEDT)
Received: from localhost (32.97.110.50 [32.97.110.50]) by mx.zohomail.com
 with SMTPS id 1489678682822382.01127760101633;
 Thu, 16 Mar 2017 08:38:02 -0700 (PDT)
Date: Thu, 16 Mar 2017 10:37:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, mahesh@linux.vnet.ibm.com,
 vsainath@linux.vnet.ibm.com
Subject: Re: Out-of-band SRESET
Message-ID: <20170316153756.j7zqd7ldhrfwqvii@asimov>
References: <20170316080252.GB24841@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wtv6spbt4ymht7dm"
Content-Disposition: inline
In-Reply-To: <20170316080252.GB24841@in.ibm.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Thu, 16 Mar 2017 15:38:13 -0000


--wtv6spbt4ymht7dm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2017 at 01:32:52PM +0530, Ananth N Mavinakayanahalli wrote:
> Hi,
>=20
> One requirement from a OpenPOWER service point-of-view is to be able to
> trigger an out-of-band SRESET on a unresponsive system. We can then have
> the necessary plumbing in the host Linux kernel to either drop the
> machine into a debugger or trigger a dump capture, if configured.
>=20
> On P9, this would translate to a series of SCOM operations for the SBE
> It would be good to have a REST API defined to cater to this specific
> purpose.
>=20
> The API should cater to:
> - SRESET a core
> - SRESET a chip
> - SRESET all cores
>=20
> Thoughts?
>=20
> Regards,
> Ananth
>=20

Ananth,

I understand the desire from your end with respect to debugging the
host.  Is there something we can do to model this better from a REST
perspective to make this less Power-specific?  Do other architectures
also have a "send debug interrupt"?

Do you need to SRESET targeting an SMT thread?  We will need to come up
with some kind of identifier for sending the debug interrupts.

--=20
Patrick Williams

--wtv6spbt4ymht7dm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYyrFUAAoJEKsDR8wtAMEZeJcP/2lGCI9M6HKv33GJKMlq0BgH
eDRoTY1O9iQChf++XGkyD5e2Ei9o7rYBXW8kkqZp+4xvM3ua1E93NnZ13w/Ma2rH
9qrhHo2v5qxe1iTZ/8Dlu4YUz6asr/NsbhO2WJQGVqZesPosmwAqg/qNSQSucsRc
zHvbdT3hwA8OxQEW0+but/3bmauTVKI+PLjtKcX/mkw9AS9Yqd11AAlkWd6W/sM2
x9Ptl6R51loa8xvxTJsuTMOAW/I8JByzLkhcbTPvuhMaunqNutl82XzG+AnMPp4l
UlU9ZehT0bA82TCdwIaHIi1zNxOb3XdNoH9bJb+wpo0WEbgyNDnpei/a7BnSGg3L
tWPbrC2Fkmji1NG6ufYoCFNll4P4efECvctMt+56hoDZ+Y6i1lg8W1eAupqf4gIV
m8V9dK4BTz80Gu1bsspk9JtTsDFqo4ahp/hRblqiGATH1pkaF/lK/EZHFqTG3dDw
wlDh2PutYJcyTZZGyWP/qq8vG44M7tHHRdQAX6MVcgbM5CjOr32sJod2ZnrytDmA
8vOs4qxg15fs18tUSmK30+oRRsKXXfqE+HeJXD7IrHukKCfj8qqvq4tTLFpTi0dF
ExRUYz2VKQoxwBsgUINIZy3zt3AQhtbXAflDALxqcIGNLbvuifYColMjtYNmXG+2
2RhuKMDoU8Ksh89o1kTC
=clb+
-----END PGP SIGNATURE-----

--wtv6spbt4ymht7dm--
