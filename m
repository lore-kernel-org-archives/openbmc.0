Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B113F1A004B
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 03:29:17 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1448382553056550.7260178530846;
 Tue, 24 Nov 2015 08:29:13 -0800 (PST)
Date: Tue, 24 Nov 2015 10:29:11 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event v3 1/3] Add delete for error logs
Message-ID: <20151124162911.GE19499@asimov.austin.ibm.com>
References: <1448331022-8770-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448331022-8770-2-git-send-email-openbmc-patches@stwcx.xyz>
 <m3io4soxta.fsf@oc8180480414.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Content-Disposition: inline
In-Reply-To: <m3io4soxta.fsf@oc8180480414.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_1
X-ZohoMail-Owner: <20151124162911.GE19499@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Tue, 24 Nov 2015 16:29:18 -0000


--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2015 at 02:56:01PM +1100, Stewart Smith wrote:
> OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>=20
> > From: Chris Austen <austenc@us.ibm.com>
> >
> > This supports both deleting individual logs
> > and all logs
> > ---
> >  Makefile         |   1 +
> >  event_messaged.c | 175 +++++++++++++++++++++++++++++++----------------=
--------
> >  list.c           |  75 ++++++++++++++++++++++++
> >  list.h           |  23 ++++++++
>=20
> Don't invent a new linked list, we already have CCAN list, and the
> approvals to use it (we ship it in skiboot).
>=20
> The CCAN list provides useful iterators and is inline with the
> structure, which is much more efficient.
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

I agree.  In general the rest of the code was C++ so the STL is a valid
alternative as well.  Chris and I have previously discussed this and
we're going to leave as is for now and then refactor away the custom
list in the next few months.

--=20
Patrick Williams

--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWVJBXAAoJEKsDR8wtAMEZ19IP/3VOhT0dTh1ekjuxIBizCM+y
LKcX4WL2UpvM1Vioofc2poavBsP4M0wTg0L1WN7/xSk77zN6TgFhfsAw9i4wmz7w
yiMtXblo3zpss3k0DDlhxI0qxqSV/6l3toCsQQP6wRsuis4HWIlvXFGZX5tnkubR
cyKeWEi0WVVWJuonWTp+0B4mIsVMagA9jXnzByk0eSY2AlPiR5YfT9GeK4OT6YHS
MbJKwfW/x+78VGQYqVxtpsn10jojozOUeY+ZUvTQWM3YRJGi/8450HoPdn7Nwc8f
O/aL+r7V4yZxkTZtKUXEpjuIKIKaupEWn5RcPAYJbyc0EdHpUGYzVOPIeT2Zwh/K
0SNPYz3Z0bFD7VXFisWTSizqpj/q8bRCtb6wCLIq0SQMEfoi+MIP4BeiqiWQoJaB
fkrBTiG8yd67jginws+DuE/0ud4JDQoh8evCkeKctctNUxdjeWNFHsEz3RrxVxv9
vDGXTt0XY4zUNfaUmWueGLQxAZvmuTIBdqsZok28/xrA0OBbSDDYxpxKvwu9GCGp
SRhNzyBTbuklq/tHM/n8aZGQcxdOeVZjnM6usgInun6GrO10vG+1/7zC9YfCPdQ4
OQYDUAYbL7gPYYeOvCRHkKH68Do5p+51NuU1hlOIcFBjnM2HhGlJCQgzK6uAtbPu
1m8VuMGJKeKXxRa4FCdv
=gV/U
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--
