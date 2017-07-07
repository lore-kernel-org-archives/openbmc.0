Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x43Hr53xZzDr4T
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 04:37:27 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1499452641326947.6503073447238;
 Fri, 7 Jul 2017 11:37:21 -0700 (PDT)
Date: Fri, 7 Jul 2017 13:37:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.10 v3] drivers/hwmon/occ: Add sysfs_notify on
 error
Message-ID: <20170707183720.GD22100@asimov.austin.ibm.com>
References: <1499354901-23165-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xf15Kwm1S924H0PRsuiAm8XGzGQ-DCf30upMDLjY-nBAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline
In-Reply-To: <CACPK8Xf15Kwm1S924H0PRsuiAm8XGzGQ-DCf30upMDLjY-nBAA@mail.gmail.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 18:37:29 -0000


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2017 at 04:06:30PM +0930, Joel Stanley wrote:
> On Fri, Jul 7, 2017 at 12:58 AM, Eddie James <eajames@linux.vnet.ibm.com>=
 wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
> > +void occ_set_error(struct occ *occ, int error)
> > +{
> > +       occ->error_count++;
> > +       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD)
>=20
> I think this policy can live in userspace. Instead of counting the
> errors in the kernel and only reporting after some threshold, report
> all of the errors.
>=20
> Userspace can then chose to do with this information what it wants,
> according to the policy of the system.
>=20

This retry / threshold count is in the OCC specification itself and is
not considered "policy of the system".  I believe the specification
requires not considering errors under a threshold count as actual
errors and if there is a successful communication the threshold count is
suppose to be reset.  How do we coordinate that with userspace keeping a
separate error policy?


--=20
Patrick Williams

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAllf1N4ACgkQqwNHzC0A
wRnSpQ//dsQXWRIiVSPCQqHy9WjBsIb3dfV38kM7/acSEuqJBbltsGsIUTCOT1XG
/MP5Gy+hQpbqa87aPocYY7tlXXf/j+UWvsTj7BjGnuZunhvGFNySYUfzT6y3hxKs
OuVh/FNsKgN+KkpO5jT8jKnYE8GbbBCt9v0gQDyPdGMBYlVAa7ON4LIArb6O7wXY
UBkHC34fPAXXId1TablnlbrURxSIticEI+XRlOdj6Xt+WgWEKL2VOty97aLltqLk
mnnf7N58mcz1KdyPIMZRgid4wpmJ5VXL9e4VZMblB4dlxFQdli5AZJNnOLrtoAZt
RjNbVmyhS/4feL8nih9D/rwnuvWXZy3EA3W+GFjH6iQca4kc7s/hOUkHZmTwTCun
LsVsVqAVQHkahvj+ZT0qh2P18vrgM0g6Y3db8GERnofeGr/cBr/3xDaMcU0mBDzI
LPAYbbOoGdMH01+sQc3re2IbuxvH54cm1eTTzVp2oRoR5e12u6kZmBchCRXycS1C
Gqry4LN6q2+rC4mVozOuv1ub9+Vfm4BrvhCr0JjMHJUztvNvnw8vR5n+IEQzyhpi
0qt3HQFqMmR84NACXXdIsVOz5odoem/tdsFlL6DmWt+5nDlHsfrKnPXsnwg+ndi7
tkXiUd7Bt8rItzTWauWgtSVHo/cLgelLuecjSwASILCUJzR407Q=
=TC3l
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
