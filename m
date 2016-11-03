Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8tcx34DmzDvPG
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 05:23:13 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1478197382712547.6962366095031;
 Thu, 3 Nov 2016 11:23:02 -0700 (PDT)
Date: Thu, 3 Nov 2016 13:23:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Cyril Bur <cyrilbur@gmail.com>, Brendan Higgins <brendanhiggins@google.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
Message-ID: <20161103182300.wt2lyseogigfxqfn@asimov>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="maskxoej4oelgcyo"
Content-Disposition: inline
In-Reply-To: <1478132769.728.3.camel@gmail.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 18:23:14 -0000


--maskxoej4oelgcyo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 11:26:09AM +1100, Cyril Bur wrote:
> On Wed, 2016-10-26 at 08:57 +0200, C=E9dric Le Goater wrote:
> > Regarding the response expiration handling, the IPMI spec says :
> >=20
> > =A0=A0=A0The BMC must not return a given response once the corresponding
> > =A0=A0=A0Request-to-Response interval has passed. The BMC can ensure th=
is
> > =A0=A0=A0by maintaining its own internal list of outstanding requests
> > through
> > =A0=A0=A0the interface. The BMC could age and expire the entries in the
> > list
> > =A0=A0=A0by expiring the entries at an interval that is somewhat shorter
> > than
> > =A0=A0=A0the specified Request-to-Response interval....
> >=20
> > To handle such case, we maintain list of received requests using the
> > seq number of the BT message to identify them. The list is updated
> > each time a request is received and a response is sent. The
> > expiration
> > of the reponses is handled at each updates but also with a timer.
> >=20
>=20
> I agree that the BMC kernel is most logical place to do this, at the
> moment btbridged does attempt something similar no?
>=20
> Should we patch btbridged to not? Should I least remove duplicated
> logic?=20
>=20

Brendan,

Are you paying attention to this discussion?  I think you had some
opposition to the kernel doing any additional work in this space because
you wanted to run a non-IPMI protocol over the IPMI bridge.

--=20
Patrick Williams

--maskxoej4oelgcyo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYG4CEAAoJEKsDR8wtAMEZLT0QAJWQlwMEvvE+EoR7FK/NXb6q
auIfOpjrzPa7xZDTSCE64A95QMaJIWRxDgHc2lsLTEh8U7uv16bauICRHU4JP23G
uiswvP9SSS+YmsG2hwJid5apGJfd6Ws/asLKlkJnJ6GRYVanpou/5URQKQ9wXrc8
uaws5zJpBfecGqaZfJfZareUUgjlrsJkeityuCHonN3Ba1yapF8Rn0CaUirBDdrM
Qu85PBAIJ5o3JjYBsNsGcDgiw1UyHTFxR5kkuYvMFSUsyNYownjnI4Msr9er8t5p
vSgE5UV60b7qRSJnzI09q3X6Xvq9Ltsj1un177GS3P/T0ePBh82nhGwv5A/Fk3db
R5SYwzWmrXK6rXGEn2zKD49G40dq8d9GA17i1q4pe3fvvFCdavYq+fQvyqBul6+0
mm/BSVoucqChu9/IJ0wTqp2DWHd9Rr0b1Z7IVvL9A9ixyuYGW74NSjVOS1cRdNqw
0LGEEfY5cG1yqjm9aGjLmHXAIIeniM+BpQeXiq9Oawt5mQiSJU94Cn2JOvOhS+25
jYW96SAmpMoUPmiNhrEHPnZV9XropF0YTmOv6rZYyS2OeuI6uTycxGOvcFq91Ymc
5BfzwnvKmrKP77uepVW0+KPEQx3A+0U8rag36OcwTcgJ4IXz520DRlI1CLlBUG00
3g25gbrN/17qbLXWYEOf
=rEvQ
-----END PGP SIGNATURE-----

--maskxoej4oelgcyo--
