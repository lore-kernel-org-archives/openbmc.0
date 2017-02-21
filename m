Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ0K3j45zDqBv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:49:37 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1487713763468128.24552232987787;
 Tue, 21 Feb 2017 13:49:23 -0800 (PST)
Date: Tue, 21 Feb 2017 15:49:16 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Alistair Popple <alistair@popple.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Re: sbefifo userspace api
Message-ID: <20170221214916.365zogt3siz2ybi2@asimov>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
 <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
 <2536438.YnoCRmC1BK@new-mexico>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s3igwfrtjaxi5pzw"
Content-Disposition: inline
In-Reply-To: <2536438.YnoCRmC1BK@new-mexico>
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
X-List-Received-Date: Tue, 21 Feb 2017 21:49:38 -0000


--s3igwfrtjaxi5pzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 02:34:18AM +1100, Alistair Popple wrote:
> I would also be interested in the answer to the inverse - why put them
> in the kernel? There's the OCC hwmon driver - what chip-ops does that
> need? Just get/putscom? If that's the case I thought we were already
> exposing scom chip-op operations via an OpenFSI master?

When the P9 chip has security enabled, you cannot even issue SCOM
operations without going through the SBE FIFO.  The SBE provides a
white-list filtering system that prevents the majority of the SCOM space
=66rom being accessed.  We will need a "SCOM over FIFO" driver on top of
FSI.

--=20
Patrick Williams

--s3igwfrtjaxi5pzw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYrLXcAAoJEKsDR8wtAMEZylIQAJj12d07PkRW6OZkln3p5ngt
TlFOZkLP22mU5adgR0v2lgJ/G3xQDXppas6ZtdUoAoFaVChNocOrqdl10UNwGVAE
cY2qO0tuEHl+tmk4DyWVmZxLaZpTidtsghDAal57f5WeMQpGqyWmpqPMYhPzgPMh
t6oJXP4xehCBgDSH78i32B99xzvTJM/frjHKgzTYQbB09bHNF4ipVlc3AnbGiOwU
rcb4guwsEzkSRGyC2nyR3gO+6LgkCGsuDIG7wSItCo2OSegf8fSGHuWF5PO30u/b
85jwRIF1Q73KsadWwMZi2NRWx1zubxNhnshxZcXig3W5de7KKt7YGTqF0MxnrIN6
cCZl4UAa23YSbzAOtyA8rL50k5rHQ5XUQdk0wQ6ZkB6qb/QmGr7uOvXhHUEO6ZDV
scr6xppdfnmvqrn2ZMspkjWRQteA2V5BobQbe3VWlVmsH/1OeFIF+d66KCSC/LY7
HnYJ/1MuyZTs7IW4f7AN0YCy0RK6sJwS/32sKE6pw4MmdzI4QAlLJ3l2xOlqWUsE
1klBSx0bpwJHGy+gVlNHtVV3DhwSmRSWau67Eo2RzSOCe2OF6i7vJmuwTw+wQ4MG
eUuIv7wQsRk7AAkpMuJyL0A4xE59CQbz/uDYUEbMOiop5WV1rtwXjL1jGJTFjKxe
gw17+xpCoqwvphW2jWfN
=aK4E
-----END PGP SIGNATURE-----

--s3igwfrtjaxi5pzw--
