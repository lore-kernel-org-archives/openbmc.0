Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t94gK5xvLzDvPl
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 12:55:57 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478224546031512.7323491088341;
 Thu, 3 Nov 2016 18:55:46 -0700 (PDT)
Date: Thu, 3 Nov 2016 20:55:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Cyril Bur <cyrilbur@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
Message-ID: <20161104015543.GD17105@heinlein.lan>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com>
 <20161103182300.wt2lyseogigfxqfn@asimov>
 <53954820-3eaf-56c6-0a4c-9347ff4dc358@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xm/fll+QQv+hsKip"
Content-Disposition: inline
In-Reply-To: <53954820-3eaf-56c6-0a4c-9347ff4dc358@kaod.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 04 Nov 2016 01:55:58 -0000


--Xm/fll+QQv+hsKip
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 07:46:28PM +0100, C=E9dric Le Goater wrote:
> On 11/03/2016 07:23 PM, Patrick Williams wrote:
> > On Thu, Nov 03, 2016 at 11:26:09AM +1100, Cyril Bur wrote:
> >> On Wed, 2016-10-26 at 08:57 +0200, C=E9dric Le Goater wrote:
> >>> Regarding the response expiration handling, the IPMI spec says :
> >>>
> >>>    The BMC must not return a given response once the corresponding
> >>>    Request-to-Response interval has passed. The BMC can ensure this
> >>>    by maintaining its own internal list of outstanding requests
> >>> through
> >>>    the interface. The BMC could age and expire the entries in the
> >>> list
> >>>    by expiring the entries at an interval that is somewhat shorter
> >>> than
> >>>    the specified Request-to-Response interval....
> >>>
> >>> To handle such case, we maintain list of received requests using the
> >>> seq number of the BT message to identify them. The list is updated
> >>> each time a request is received and a response is sent. The
> >>> expiration
> >>> of the reponses is handled at each updates but also with a timer.
> >>>
> >>
> >> I agree that the BMC kernel is most logical place to do this, at the
> >> moment btbridged does attempt something similar no?
> >>
> >> Should we patch btbridged to not? Should I least remove duplicated
> >> logic?=20
> >>
> >=20
> > Brendan,
> >=20
> > Are you paying attention to this discussion?  I think you had some
> > opposition to the kernel doing any additional work in this space because
> > you wanted to run a non-IPMI protocol over the IPMI bridge.
>=20
> We will then need a new kernel driver for the non-IPMI interface.=20
> This one is for the iBT interface which is IPMI oriented.=20
>=20
> I am sure we can find some common points though. Hopefully, the=20
> userspace interface would be the same. For the moment we only
> have an ioctl for the SMS ATN interrupt but we should be adding
> some more.
>=20

I believe Brendan was keeping the IPMI protocol but implementing
different flow control on top of it.  That means, specifically, that
having the kernel track commands and timeouts would not be what he
wanted.

> Thanks,
>=20
> C. =20
>=20

--=20
Patrick Williams

--Xm/fll+QQv+hsKip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYG+qfAAoJEKsDR8wtAMEZGqEP/jk54wDv2AyNToHbU5AwGwkA
ulDZVYCD1L9ewLa/MDbrdNZmngDeJB3SgNqunleFhgMO1M4Tquxx4oEq9p/ZdDVX
GHx4qyNqArb+5XjEraEikDFc/u+ZtTldAql3JTHI7brYZ0pYzmGSPHqtugogKtyO
z20Rpwa2FZJg7t9g921XnKTbp78nF3srHhgxFGUCwKJsSKISU35qmFff6yDzOzSw
Nf26otL8XV0fhVfQ8jcHbmtHPg0fxDnXBP7c8DFAjgzIx7xS2XMQrAFPSF3Hl+be
GPQFRnXQa9lcIJixETMBrJiIruvxxNSOFFQ1uzF6CUnVQ1XvL2mzHv31gGDYxRkq
4jdGtPUYTVfseo1JFSu33QtLpNfJvHqoMMEyPcHeLZJk01A+ZV8FbKyFsULZm346
LkwVMHMwDpETctHvskzaegXFH0xSRM5Kn8zZvQlUL6qoKSo9ddSqM4MD+j3BJwxE
bXx3efYnakZJW6+p5gW574dNFaq02oOkKPsEWgCI2cXvFDnn9fdLcQU9q+DF0/hb
8g3ak95pig4LL6J+hiNl7buUK0jEAZjkSo3b0aouTzm7SbOO23iF6T/uW0EQE+E8
r9mNe0lLOxh2/XMNw9+aIg5IWjf/gPPhUvmUpt4yJ5Mr9/2rkdipA7PJL1K6d0qz
eQOvRtXt9yFFAb3q4CGa
=2Hy/
-----END PGP SIGNATURE-----

--Xm/fll+QQv+hsKip--
