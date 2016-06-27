Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdDpQ0hMHzDqRd
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 13:25:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bW8Hasy/; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=rfAFlyAk; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4B5542EF;
 Sun, 26 Jun 2016 23:25:14 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 26 Jun 2016 23:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=28Yro
 0Y+aSq4b5hn+/xmzbikpDE=; b=bW8Hasy/fGsGHZXFdiEqRpW+uDk4IbMUAT89+
 R6l7D75JypyLSQQYhRkaGa8FhB9PFNSMj49SzU8ZGHcP4t20y2quIDSI7ADDykSi
 x/lsMbT/OYtOvBQ1VBOdDiEUlTwP6YIkCGYq1Vo3y9bSwWHngx6Hc9SMzDl/2mJH
 o6MCOI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=28Yro0Y+aSq4b5hn+/xmzbikpDE=; b=rfAFl
 yAk5N896lOv8yLebgt4dzzDrLbIA0nqhbJkhUVzKTp1iMfZfubpLSA2hesjLCZfq
 +CWyZUe6n9UbwkponFHXNeghs4fZeyCIp1ZmgtOv+4B0Fzvj0FER+yeMbsO8godD
 f/edZNSJangJbhomLRsnqKxct/Oyenh8bKBv4Y=
X-Sasl-enc: b6Ti0mQLLXzS1WVb6NeTbnw9ezXge628qPeCnIQnAERy 1466997912
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC102F29FC;
 Sun, 26 Jun 2016 23:25:11 -0400 (EDT)
Message-ID: <1466997904.23740.147.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 07/18] initfs: update: Don't exec sh or
 sulogin on error just exit 1
From: Andrew Jeffery <andrew@aj.id.au>
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 27 Jun 2016 12:55:04 +0930
In-Reply-To: <OF6F416665.54BFE71E-ON00257FDB.00728045-00257FDE.00011391@notes.na.collabserv.com>
References: <OF6F416665.54BFE71E-ON00257FDB.00728045-00257FDE.00011391@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-S7zZ3YXzTEiqoUQyYU0D"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 27 Jun 2016 03:25:18 -0000


--=-S7zZ3YXzTEiqoUQyYU0D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-06-26 at 00:11 +0000, Milton Miller II wrote:
>=20
> On 06/22/2016 around 11:58PM, Andrew Jeffery wrote:
> >On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> >> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> >>=C2=A0
> >> When update was written it was exec'd from the shutdown script
> >> and hence took over pid 1.=C2=A0=C2=A0Since exiting in that environmen=
t was
> >> a panic situation, the script instead started a rescue shell with
> >> its output presumably on the console.
> >>=C2=A0
> >> The calling convention was updated to be a simple invocation in
> >> commit dbacf104885c ("obmc-initfs: run update as a sub-script")
> >> but the error handling was not updated.=C2=A0=C2=A0That error handling=
 is
> >> now becoming a hinderance
> >
> >hindrance
>=20
> fixed
>=20
> >> =C2=A0findmtd() {
> >> =C2=A0 m=3D$(grep -xl "$1" /sys/class/mtd/*/name)
> >> @@ -130,7 +127,7 @@ do
> >> =C2=A0 if test -z "$m"
> >> =C2=A0 then
> >> =C2=A0 echo 1>&2=C2=A0=C2=A0"Unable to find mtd partiton for ${f##*/}.=
"
> >> - exec /bin/sh
> >> + exit 1
> >
> >Is there any value differentiating between the failure cases? I.e.
> >could we `exit 2` here instead?
>=20
> The problem with differentiated exit codes is knowing what they=C2=A0
> mean and keeping the callers updated with new codes.

Yes, I'm across that, hence asking if it had value rather than outright
suggesting it. I was trying to gauge how much thought had been put into
it, and from your reply I can see error handling wasn't an
afterthought.

> =C2=A0 After this=C2=A0
> series we can recognize the following exceptional conditions=20

> (1)=C2=A0unrecognized options (but stops checking on the first argument=
=C2=A0
> without a leading hyphen, additional arguments are accepted and=C2=A0
> ignored),=20

> (2) can't match image suffix to a mtd label=20

> (3) image too=C2=A0big for partition=20

> (4) mtd or a sub-mtd partition is in /proc/self/mounts=20

> (5)=C2=A0unknown error from flash_cp (could be a erase, write, or verify=
=C2=A0
> error, or its size check)=20

> (6) trying to restore without any saved files=20

> (7)=C2=A0bad entry in whitelist=20

> (8) trying to flash with no images.=C2=A0=C2=A0=20


> Of these,=C2=A0
> (7) and (8) print a message to stdout, (5) and (6) are totally silent,=C2=
=A0
> while (1), (2), (3), and (4) exit 1 on first encounter stopping further=
=C2=A0
> checks.=C2=A0 I have some rational for the choices, mostly I want to flas=
h=C2=A0
> as much as possible if the set of images passed a first scan to=C2=A0
> plausible success (and the arg parsing is to allow future extension=C2=A0
> to pass the files to flash) and not caring between whitelist didn't=C2=A0
> match anything vs whitelist entries are bad when flashing is the=C2=A0
> primary function.=C2=A0 Unknown error (5) is silent because I already had=
=C2=A0
> remove on success and didn't bother to add code to remember the=C2=A0
> error while wanting as much success as possible.
>=20
> I could see differentiating between unrecognized options (1), image=C2=A0
> file doesn't have an mtd or is too big for the mtd (2 or 3),

I would have thought reporting (2) and (3) would be useful in that they
are simple to detect and the problem is obvious (though the solution
isn't necessarily obvious).

>  and flash=C2=A0
> update error (5), but what would be the use case?=C2=A0 If from a user th=
ey=C2=A0
> would run --help or read the error message and correct, and hopefully=C2=
=A0
> calls from REST would return the error.=C2=A0 The bad whitelist (7) and n=
o=C2=A0
> files saved before trying to restore or copy files (6) will be debugged=
=C2=A0
> when someone notices the contents not there after an upgrade (the=C2=A0
> default is currently to save and restore).=C2=A0 The check for a busy=C2=
=A0
> mount (4) vs check for size and name (3) can be handled by calling=C2=A0
> again with --ignore-mount if the script wants to know if deferred update=
=C2=A0
> is likely to work.
>=20
> So for now I will stay with one error and only report when checks fail.=
=C2=A0=C2=A0
> Let me know if you think an exit code for (8) is important and I'll add=
=C2=A0
> that.

I don't feel strongly about (8), it's fine as is.

Cheers,

Andrew
--=-S7zZ3YXzTEiqoUQyYU0D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcJyQAAoJEJ0dnzgO5LT5xbcP/3F5YWAxUEaqHdmhsL9MTTTI
TVTulqNb7fAUZkFo0AfxyxrOn0y9RVS6glZOKChyQv03ldOq4FOfigHCybmsR4v9
R7LsK/qiBhYjyWkVkRILVPPNSC+oaaTZQD4fMlN6NrzacBBTYC9OwN3FeqdqUvHy
ZIeEHXB6ERQhFGCriW0YCMpf3MPvvyQxxYbXXZchWZIVG8/MvU35+BWN9Enyaow5
n6867NQ3s9rR5tvJ2UxTKjdzqVuYhDpdFVLqnayxqnd+MPfEHooA00YzaPvPYcJd
fhnjzqPLRNGU8wnwtRua/UCfr10z8acABmFl+Rrh628gxM2Y6AM1ST4fB7F41jQZ
UY3+5H+3pcAuIBcv/JZGrsgq9T8bEtKcETiITcuKtLy2zvG0ylR3fguN/ppG0ham
UfYZetqLpxMjAHDtQEw+emwg5+8/0eJsUS697mHdwOCYVeGo7kBtfBC0UBjXsZmS
Z/izKEED/vvNUJzUyvqJOXvUmX4AIU+mfkS2J3Kr3yyIFKo+84iZu5u+k2EQNNpL
JjcsWLpNS98n5IJrhOHCr1iSqUqS/VRIJ43xQHREi25QVbQ8GTi/YjVh+/+QFo8r
rjdiYuH8txKFq3LTH0JYYhMQhSXwcW+nMk+cl40RgPuVTRr7EB1pbZP4CRdQIqcM
cdiF2Z5n7KXKgpDiss89
=1ft7
-----END PGP SIGNATURE-----

--=-S7zZ3YXzTEiqoUQyYU0D--
