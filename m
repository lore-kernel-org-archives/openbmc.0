Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B88181A0C42
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 04:01:15 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1447434065906163.98401344249862;
 Fri, 13 Nov 2015 09:01:05 -0800 (PST)
Date: Fri, 13 Nov 2015 11:01:03 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH phosphor-rest-server] Add self-signed cert
Message-ID: <20151113170103.GD21764@asimov.pw-on-the.net>
References: <1447427425-3614-1-git-send-email-openbmc-patches@stwcx.xyz>
 <20151113164259.GC21764@asimov.pw-on-the.net>
 <B642E366-FA36-4B50-A2D6-1B9CF83456B9@fuzziesquirrel.com>
 <4B455CAA-B080-45E5-85B1-4EAB67A2ED20@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline
In-Reply-To: <4B455CAA-B080-45E5-85B1-4EAB67A2ED20@fuzziesquirrel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 13 Nov 2015 17:01:16 -0000


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yes.  That is fine.

On Fri, Nov 13, 2015 at 11:50:50AM -0500, Brad Bishop wrote:
> I just opened issue https://github.com/openbmc/phosphor-rest-server/issue=
s/5 <https://github.com/openbmc/phosphor-rest-server/issues/5>
> to track that.
>=20
> Can we settle for this in the short term?
>=20
> > On Nov 13, 2015, at 11:44 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
> >=20
> > At the moment we don=E2=80=99t have any cert at all.  Baby steps...
> >=20
> >> On Nov 13, 2015, at 11:42 AM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
> >>=20
> >> On Fri, Nov 13, 2015 at 10:10:24AM -0500, OpenBMC Patches wrote:
> >>> Eventually will be running with SSL.
> >>>=20
> >>> https://github.com/openbmc/phosphor-rest-server/pull/4
> >>>=20
> >>> Brad Bishop (1):
> >>> Add self-signed cert
> >>>=20
> >>> cert.pem | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>=20
> >> Why aren't we generating a new self-signed certificate on the machine
> >> instead of including a global one here in the package?  It seems like =
at
> >> a minimum we should generate a new one on each build.
> >>=20
> >>> setup.py |  6 ++++--
> >>> 2 files changed, 52 insertions(+), 2 deletions(-)
> >>> create mode 100644 cert.pem
> >>>=20
> >>> --=20
> >>> 2.6.3
> >>>=20
> >>>=20
> >>> _______________________________________________
> >>> openbmc mailing list
> >>> openbmc@lists.ozlabs.org
> >>> https://lists.ozlabs.org/listinfo/openbmc
> >>=20
> >> --=20
> >> Patrick Williams
> >> _______________________________________________
> >> openbmc mailing list
> >> openbmc@lists.ozlabs.org
> >> https://lists.ozlabs.org/listinfo/openbmc
> >=20
>=20

--=20
Patrick Williams

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWRhdPAAoJEKsDR8wtAMEZbs8P/iAhflaW23eKsxZfHMehV+Yo
ZiIP1W8fhfP9JSPF1BnF45w4kCjZUXHCNZsvFRbHSusAe8Dknttcyi46hKFr6J5z
ZEP0rSeePDjrDsLsNVXHkbA4GgP68EG4V6TslfIX8Cyr8+0LyGXGaL28t6NSFDG1
eRn9eK+SdMkq1nxUryFPVVIReqzs7G16AYFIliIirKtyANCDutH7N4TVGRhzCORk
v8NhbH8EQHJlh0MiwSoJRyLritmVbjXvrVXzlQyzzHroobs+Rhf92nZtXYg4E/mx
H5jmGB6Q2c3WutS6bBk94gXvkq6Ok0khq5MvQ5r+Bx3FlqkIAE9s5RwF2uyK8ShJ
/Lugw/0rSeM7LC4OKSK4+3ZUX92zOfwnzKnjsmwA6Tjtar8ftlHiyW6GnlTqJMkA
J2qasHdK4WIGTaR/3lHsNcZ4k52X2iw26AyaWClXphads3chmSNi4xCxEOB173rJ
zAAr/B0HOaKjK5Dmjw5iJSvpv2bs03xlxWI8AiTAoUCQ3TeqadJk/V3rGh73xTBr
siXUAXNSHeSJ97XK94ixlblCyzwWj/gYR8b0vL81/aX6WTj78XxB7KToCZvfYOGQ
hN1sK2o/X2IMvEtiu/zaCaPCTlb5b1ojaTlP9nnCXqBhQd467JxdEA1ocwHaov2v
VqNbSQ3RAvMAAAgunpmW
=SlnD
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
