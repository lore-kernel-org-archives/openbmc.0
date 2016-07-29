Return-Path: <andrew@aj.id.au>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0rXH36hTzDrQQ
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2016 11:21:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=kLWew2X1; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=sqm4AdhB; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 84E4513AC;
 Thu, 28 Jul 2016 21:21:00 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 28 Jul 2016 21:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=P1CTb
 UZ3kXq0yZ8xdz6+p+fgjKY=; b=kLWew2X1957jkk+Ocx6z5zXCKOtA92gW6lScv
 viFFxpp6ace/j9vR7cFHidcw0zmp9eYOfcK0jilNMHIs37sI+DUrzqK2jfpKT3WC
 Hf4AWXN7mlwfwynFh/lsj5jYA2UPNrYwcWqTMfe+QfsdT9x6Csq3zV7I3FMwgPWA
 7tedaw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=P1CTbUZ3kXq0yZ8xdz6+p+fgjKY=; b=sqm4A
 dhB20VZmprdAjNq4bdRf3HHVYBm8PLqYX+o8iA3E8xe58HiG9xe+aej/zd7PDD5S
 +Y0cWZPW2d566bWYnjF0DdWGS3zt2Zo+Y/sjDMHusyNwer2A/v6dS5HtDLQBcTHB
 YV9fgAr5tUfaFy7Yg+b/7NkbIjrun+oJCYTNEs=
X-Sasl-enc: 5v35U52oAI9rKQyBDYdyRCadUvY/SOCabNAj4Dcwj7AJ 1469755259
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C4350CCDAC;
 Thu, 28 Jul 2016 21:20:58 -0400 (EDT)
Message-ID: <1469755255.5468.152.camel@aj.id.au>
Subject: Re: [PATCH linux v4 1/4] drivers/fsi: Initial stubs for FSI device
 driver.
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
Date: Fri, 29 Jul 2016 10:50:55 +0930
In-Reply-To: <83431667-f0cc-6a9d-143c-3bb1872c5fec@kaod.org>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <83431667-f0cc-6a9d-143c-3bb1872c5fec@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-s1cBZi5/GNym9WNb3nGH"
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
X-List-Received-Date: Fri, 29 Jul 2016 01:21:05 -0000


--=-s1cBZi5/GNym9WNb3nGH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-07-28 at 20:43 +0200, C=C3=A9dric Le Goater wrote:
> On 07/28/2016 08:14 PM, christopher.lee.bostic@gmail.com wrote:
> >=20
> > From: Christopher Bostic <cbostic@us.ibm.com>
> >=20
> > Signed-off-by: Christopher Bostic <cbostic@us.ibm.com>
> > ---
> >=20
> > Changes to this patch based on reviewer feedback
> >=20
> > V2:
> > - Removed enums in fsiinit.h and replaced with #defines
> > - Added proper file copyright and license headers
> > - Added certificate of origin
> > - Removed version string
> > - Replace kobject with struct device in struct fsidd
> > - Suggestions to implement standard bus_type will be implemented in
> > =C2=A0 later patches
> >=20
> > V3:
> > - Removed white space
> > - Suggestions to add Kconfig will be added in follow on patches
> >=20
> > V4:
> > - Removed blank line at end of fsiinit.c
> It would be nice to add a [patch 0/4] explaining 'briefly' what=C2=A0
> FSI is. This is really an IBM 'thing' that people don't know about.=C2=A0

I agree. `git format-patch --cover-letter ...` should be used for any
series longer than a single patch. It provides the place for the
blurb=C2=A0C=C3=A9dric asks for.

Cheers,

Andrew
--=-s1cBZi5/GNym9WNb3nGH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmq93AAoJEJ0dnzgO5LT5++UQAI1PALVb+5mg9F3iNgr06Otw
HAjHHkvp2naqDIYfGXWzg4g9v8I7xJkK9PS7aGaErP4lJZbqNUyNOsoAV+CJDBhP
tneTKiha1hNKweOrmfOP4qL/746idk6aiedRp25UjMnvXO+HMyWxEGWV5M/xHDl8
M2h5glk9QwETQ6+MK/n7Y6YvgImjnSlPZj5cAhfbuFkdiaJsmJkUp0JfQd74aCzg
5DN/z6MKUVqyikNfnAVOQdcgMzoM1IFd7EzKzmMWLT+/DpuwzEidyVbNWJ3E3U8i
pfqLEQtuvgVrp+cV5tPsu1A7JfZJguI7D14/35YvXS7P/le+XWf0OlvtH8Cruvz7
p+CfbqdOl2kY22TyWFQEdvXjyK2JBM/9TDu+Y9NLVkjRKSn64P6kie7YlcRh6xC7
ll240lQUGaxm7ZpP7j82RvwIhkd/osC0Y+s0ACG05KeRUKeeAd3tu2lTPMNpXwh3
F8IEXr73wD1Ux3ki9XWPreamoJrVWYWKW5hZ+6UOpzKpirpiYy46d0ynVMYJSMno
ILfWaAEz1N6w2NU+dNWaadcmt8OLYqsp6B/rxqfmbz0dWjPBuXafGp4XI2E/GgFj
/x4S3QAPYr/e8QtL/Xds+r/uJh3i9BoloU39KHrrjUDApiqkobQ3K9mON2KNCWZa
vyImaZW/KfgCeu+QAaGB
=Y1pV
-----END PGP SIGNATURE-----

--=-s1cBZi5/GNym9WNb3nGH--
