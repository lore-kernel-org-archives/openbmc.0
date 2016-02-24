Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 1FF171A0013
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 11:36:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ifj1eUnn; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id 0C2CC33406F;
 Tue, 23 Feb 2016 16:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=UirJ9b/jPgnGl5i/gSs6B
 teNhuY=; b=ifj1eUnnfTzQlWSiHFIlE3pqGUlb5b4ujGJdkcs+44cQJLnvpAXNx
 9k9Cs+IOfy1kjGWlq4NQmpm9ZpVe4zZWq1LE0C43ZMUJTpbmGlr8xjzHXIA45QW4
 z4+0kUf/+EdPw20NzYqCViV2edaI3YeEII6i285CA62sHnnrrvlXgo=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 1038233406C;
 Tue, 23 Feb 2016 16:36:13 -0800 (PST)
Message-ID: <1456274170.27420.40.camel@aj.id.au>
Subject: Re: [PATCH v3 1/6] oe_mkimage: Use consistent indentation
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 24 Feb 2016 11:06:10 +1030
In-Reply-To: <201602232354.u1NNsWBr010950@d01av04.pok.ibm.com>
References: <CACPK8XeAq+0RHcdDLP=ezEetCimnAPhDEFz0GJkqFYg4iE4-Lw@mail.gmail.com>
 ,<1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-2-git-send-email-andrew@aj.id.au>
 <201602232354.u1NNsWBr010950@d01av04.pok.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-vl9FK922F/Lt5J2zni+B"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 24 Feb 2016 00:36:16 -0000


--=-vl9FK922F/Lt5J2zni+B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-02-23 at 23:54 +0000, Milton Miller II wrote:
>=20
> About 02/23/2016 04:55PM in some time zone, Joel Stanley wrote:
> >On Wed, Feb 24, 2016 at 1:14 AM, Andrew Jeffery <andrew@aj.id.au>
> >wrote:
> >> It was inconsistent with the rest of the file, which seems to use 7
> >> spaces. In particular, vim-sleuth was detecting the indentation
> >style
> >> from the first indent(s) in the file, which were in the oe_mkimage
> >> function.
> >
> >7 spaces seems kind of unusual.
> >
> >Upstream bbclass files are a mixture; I'd go with 8 spaces as I
> >suspect that was the intent in this file.
> >
>=20
> Looks like yocto-poky/meta/classes/image_types_uboot.bbclass
> upon which this is based used 4 spaces for the function that
> was copied.

So according to the openembedded wiki[1]:


* Use spaces for indentation as developers tends to use different
amount of spaces per one tab.
* Shell functions in OE-Core usually use tabs for indentation

but

* other layers usually use consistent indentation with 4 spaces (in
shell functions, python functions and for indentation of multi-line
variables)

Maybe we just be consistently inconsistent as well? :P

[1] http://www.openembedded.org/wiki/Styleguide

Anyway, this was another instance where I was trying to avoid the
bikeshedding; I wanted my editor to work with me not against me and so
just made it consistent with the rest of the file.

Happy to bikeshed out an acceptable coding style. Can we make the change to=
 whatever we come up with a separate patch?

>=20
> Going to 8 spaces puts one \ over 80 columns in do_generate_flash
> but its after a || so it can just be dropped and the shell will parse the=
=20
> next line implicitly.
>=20
> I don't care if we leave it at 7 for now or go to 8.

I don't think I've ever seen 7 spaces used for indentation anywhere
else. My preferences are either 4 or 8 spaces. Probably 4 given the
styleguide quote above, given we're layers, not OE-core.

Andrew

>=20
>=20
> >>
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >> meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 6
> >+++---
> >> 1 file changed, 3 insertions(+), 3 deletions(-)
> >
>=20
> milton
>=20
--=-vl9FK922F/Lt5J2zni+B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWzPr6AAoJEJ0dnzgO5LT5YsYQAIwxQWau1fluxIoPS+ZvqwVd
Z3stMjByt9cy8UNU1zvnAxfEz88uEv8H+/RlCauF7S5as9NSkwdQ/OXEZE9zuz4e
X8Kcg+ubq9d1uyoBzSK61zBwciWcaoaBHFUvmLKEyWlRCFNLfbCjBjll88jwLL/W
WvPRJiiPMGod6VCYP+3Njl9oWuQgULNwEdqcNEduqCL1jOpy7L+FC2skxtnFDObH
78k+quwdCa4y6rCmjzYhUffO3bxe6l/pTViX0h5va6cb1NRk5lAvX+wAVZgfrPu4
7WDnLdnQmbtxdiCQ2AEpdOLkcOZxgp4viF62rCX6tAmcXxqjDX6zBybSwKHiqe2+
9Dbog1TYml04W3PVCUXm/MsHIM036aX063HIBJz9zshs0skwMjxUK7wYQA7dOg6m
GeSiHbsb79qNPNYSWDm81lPvYDcHmCMyESfkHEorycVyhgcgC6jaC+mSczcIKwbA
CibKXxyApawgWg5Ojr86Ms1Vc05jfbDMTQ99hYsgYAusXJttW6wu7oAfK7ePegRA
5Fsb9IurcXTdgTVVqWuZ2sa/wmtHnM7s4mIBKlxqgPhThVmPAmC2VsmIiEWXbqNi
wCprNivgUyOw6/6VBth1r4BegxzXf28UeW2H1LoTw5ijbz+GLK5H2OZbD+FtGmD2
p+YEQtJuB7trShuJ46Eg
=O4PT
-----END PGP SIGNATURE-----

--=-vl9FK922F/Lt5J2zni+B--
