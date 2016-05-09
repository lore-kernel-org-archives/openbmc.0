Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r35WJ6QGCzDq5m
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 12:12:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=JBehZDRQ; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id 0EF8F31A070;
 Sun,  8 May 2016 19:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=6TfYX0juHcb3ZnLow6yEs
 6iMEH0=; b=JBehZDRQugA1shjPoO1iWvZQmPnIZgLxWktEPh95CU3XXLuKu8q5v
 MTlrnAjwlEPHVd/1NyrqBwKdnGthmh4UtSj3bYFU3HqwuDGSBGNqMY9XubRRYwfP
 yDRIJMp5Z1McTPYk+X7yHoyR0MrkDnR6teepgFUSrn1CHLnDnf9gl8=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id F1B0A31A061;
 Sun,  8 May 2016 19:12:40 -0700 (PDT)
Message-ID: <1462759951.21990.0.camel@aj.id.au>
Subject: Re: Resolving the lonely pull request
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 09 May 2016 11:42:31 +0930
In-Reply-To: <201604151853.u3FIrYF0024455@d03av03.boulder.ibm.com>
References: <201604151853.u3FIrYF0024455@d03av03.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-EhEarmcS0yOowSdxiFqH"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 09 May 2016 02:12:45 -0000


--=-EhEarmcS0yOowSdxiFqH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-04-15 at 18:53 +0000, Chris Austen wrote:
> Days, weeks and months go by with some pull requests sitting idle.=C2=A0
> Is it because no one feels accountable for the review?=C2=A0 Would it mak=
e
> sense to assign maintainers for repos?=C2=A0

It's not clear to me what our expectations are here. Should we require
all patches be reviewed? Most? Some? Should maintainers be able to
merge their own patches without review? If not, whose responsibility
should it be to review patches from a repo's maintainer?

Should we time-out the review process (i.e. merge regardless) so that
patches aren't stuck for months?

Cyril posted his patches adding tests for the btbridge repo, and the
list suggests Cyril as its maintainer. It made me curious about how we
want this to work.

Andrew
--=-EhEarmcS0yOowSdxiFqH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXL/IPAAoJEJ0dnzgO5LT5btsP/3w3DEYP/NKZw6uI8gb2q3p4
aQ8VM+4Sc5jOSVPzAkDnhvDi7HyubDOciK475nb6ugKB6XJn2/2xCs1WiPyoWWyP
NZVcHEVml+cRTju/rLMXhGC+AENb2MB/btCXG0bqwCi8Gn0EZXqAK/RvUh9Dhn5K
un3Iw4qic0Hycw1qBFALPT18pSKUGUfvtFLjqSEBC9bGcB23W8R2ePxzK4BnEcMt
JUQEGbynImE75VgFKQhuusoxTdHcgJSqFH3UX0YLEAvBWQ9ZU/7yMO5hh2QCfDyK
6FOl7Wu6U4q5Jrt+V1lwyGTvXGuvF6gp6ASTPCCXfhVeOmaJrjZn8WOkk8QprWjs
OSajkl5j6EGnSeT3WqLzNGw8qvyYznFyF5l4snCi8/ZAh3JP49qrxpP+f8Z0erRV
7qAMi+3q25uyZAFQAA0opaM9/uxwBvh5aDTHBayA6zZ9d4rv1qlqENtBDR9Npch1
Kd5Zu6nWPRpoKH1KWASWzLl68aiMtxSVCUjApI5hFb4UnL+9yLGvUKBO/awLmU4e
rRdCUlSegGiZKdH3lwZpwxqrLmnbL42H3DQCJXOjhk7nFrbiX6JGgqkQdGkVParc
0gYqzfNbr9WjcKdd1leRgcvuEMC4CzALMXLnkroCkgsE4Ct3pAreLXDX/LaTM6md
oeJnlzIBHE0IiqtgD8gu
=HtDh
-----END PGP SIGNATURE-----

--=-EhEarmcS0yOowSdxiFqH--
