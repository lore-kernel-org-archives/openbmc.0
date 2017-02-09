Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKB9r5MYzzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 08:32:16 +1100 (AEDT)
Received: from localhost (170.225.9.144 [170.225.9.144]) by mx.zohomail.com
 with SMTPS id 1486675021405688.9608992438618;
 Thu, 9 Feb 2017 13:17:01 -0800 (PST)
Date: Thu, 9 Feb 2017 15:16:59 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Users of SBE FIFO kernel driver
Message-ID: <20170209211659.flmbka7zmtopandl@asimov>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
 <0a7745db-75d8-43b5-acf6-6f789964bdc0@linux.vnet.ibm.com>
 <526fd16f-3edb-ba7e-9694-9e832c426499@linux.vnet.ibm.com>
 <e73eeb5f-2bae-2c37-1a73-8890cbfb29c9@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6dqfhdnm6vkscqms"
Content-Disposition: inline
In-Reply-To: <e73eeb5f-2bae-2c37-1a73-8890cbfb29c9@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 09 Feb 2017 21:32:17 -0000


--6dqfhdnm6vkscqms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 04, 2017 at 04:35:30PM +0530, Venkatesh Sainath wrote:
> > Where do we stand with the sbei protocol device driver?  Who owns this=
=20
> > and is it complete?
> >
> The plan was to port the sbei protocol driver developed on FSP based=20
> systems. Chris: I believe Dhruvaraj discussed with you about this driver=
=20
> when he was in Austin. I can share the latest version of this driver.

Is this "driver" really a driver in the Linux sense or is it a shared
library that is used in FSP userspace?  Whatever code we end up using we
eventually need it to be upstream-able into the real Linux kernel.

Is this something that Dhruv can take on or is this going to be left to
Chris?  How do we handle divergence between the open-source code and the
IBM proprietary version (the one direction is an IBM-internal problem,
but I have concern that future development will only be happening on
the proprietary one and we'll have to keep playing catch up).

--=20
Patrick Williams

--6dqfhdnm6vkscqms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnNxLAAoJEKsDR8wtAMEZ1GsP/322p5QGBKvlI4lxEBiXUn4l
+aBMUgEQbP+4sSTbDRToq9KoBAbwrm3hTNU7dZJgzGthn8yaSUTjITE5ZirAjuYF
Eusn6dkCgwqzxJGJ3eKuR2SGHwf58yxvGrpSZRfK5cwK149OV/k3FRKrr42VXd+4
726TZh7YsWxgJlI3RNgvb2zJwH1nnPtkI8UBKpIxeJx5JoGWtU/0uW+jFPWnk+M5
kvpAnwP5bdXL6uiyolLHhaqeJO4HYNjKstWh7J4HHc3E9njYOufaAWgbGZiFmd2y
xnTy9dMwg8XhH1oH/vLTzVWL1FWvTL7jlPz1EsJCEgnbMD3CAqPSeGRGKTjccLlA
9gT+UZdUbHbSbiyOYdDmnlyF1eUm/SyFkzwbne1wGDol/BPOik1s6KwchUVBdH+p
FpO9CxioikJa7YbKzeHmgyEfVlVju1YTs1gHhHi3U8mZ4Sl3cDC231Vjz9t8uWcs
+qd/gNgNzF9KWHgzgySOZCB6+HgWK1S+d73PZ2YS69ypLIDsete82ubj11nlOud4
5ZX32LCPlTDuD+LNKyBc3Ves4oG+99P89ChQqP5M3GtUFWUHrSBkw/LV66aS1rDm
NgqsKjsfXcHYX5o4HlY9po6QJ4pB1ZngQgIrGe52+srGdeYKSuv8O2n1VAQW9UgX
5fAA+AANJumZjc8oFws8
=jtgk
-----END PGP SIGNATURE-----

--6dqfhdnm6vkscqms--
