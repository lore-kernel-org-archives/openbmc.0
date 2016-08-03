Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4Ldv2DfqzDqQn
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 04:08:03 +1000 (AEST)
Received: from localhost (32.97.110.53 [32.97.110.53]) by mx.zohomail.com
 with SMTPS id 1470247678355749.0913299819265;
 Wed, 3 Aug 2016 11:07:58 -0700 (PDT)
Date: Wed, 3 Aug 2016 13:07:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux 2/4] drivers/fsi: FSI master initialization
Message-ID: <20160803180756.n273bodke56yjrqc@asimov>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1469729698-37246-2-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8XcejiEOpOyS4sxsYZwsLf=9XKm3sS6nf0g6=hj7A=WMzg@mail.gmail.com>
 <CAA0LjjVPCaG4x_=HvSaK-t7+iaN==0M+7DUnAEjxmj5eUg+Qew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k75blap56svmasro"
Content-Disposition: inline
In-Reply-To: <CAA0LjjVPCaG4x_=HvSaK-t7+iaN==0M+7DUnAEjxmj5eUg+Qew@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 03 Aug 2016 18:08:03 -0000


--k75blap56svmasro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 03, 2016 at 12:15:46PM -0500, Christopher Bostic wrote:
> >> +struct primaster prim;
> >
> > Why are we statically allocating this? What happens if my system has
> > two fsi masters in it?
> >
>=20
> FSI hardware, as it exists presently, does not allow for more than one
> master on a given bus.   There must be a first master in the chain to
> initiate communications, here its called 'primary' master.   There can
> be other masters downstream but that function is not planned for
> addition to the core function.  That's an extended capability.
>=20

Typically designs are BMC -> P8 -- Cascade --> P8, but is there any
reason why we cannot attach multiple P8s directly onto the BMC?  With
SoftFSI you would just need to dedicate an extra set of GPIOs, so it
seems very reasonable to do.  Thus, it would effectively create 2
independent buses each with their own master.  Having a single variable
doesn't allow this, does it?

--=20
Patrick Williams

--k75blap56svmasro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXojL8AAoJEKsDR8wtAMEZ16sP/2xkofxwQ4ldPkTGJ0QkkTUc
bch8b3YA1Nq1M/ZxelIT46GfT0e5wGgILVC4Gihjw6WBSNhCRso7W0v7rhbBumJc
mbx1TTJJsEQEdZCAkfTAxSrcESYbT8X5tAuQfkfRDgxOots53O1578lkcSBWQSlr
sWLSUvoUZqqKAscm00MjZpdfqN+/pBRqHK2oGNWkRZRoX9poU65WlTCLmv7ca6Uj
CUzuJy0WlRgpLVTs1d6ho8B0o/Cdx5W519nfEHU4HzjqRHcpyf9n+ZSWE9EbEnlo
7jKhX49O3A8gEkWSEIAcDJR5tAYuBm3g2uhF4XhZG16URDP9v9aokK8ouEgtGxLo
fKBpgDCkFIk+Cmgod9tqZcxDfW/yxkexiTv15kshmq8mqcOg7NJiob/u5kJifJ9e
HQdZi1LtOwX4dIlKmZUmfe2l77ZTTMuSnZhgtczYDLX4/qfNN/VyvNM/CNW4K6Aw
FNEZ8mTjReqghgdT47pjv6FBM8jDsTN4kz3Yl5EpLCRdru1cE1hd2UTMalDeV3fk
R5XuEqYahkAsV3SmjKkFXRIEmXYSA4xgd1dj5HN9toRxy059kew0uC880KuC1KcW
woO1+aodeQyCvWRqlF8M9BlW+eZpH+veXxmJ2GHoWV39dcY/F6BCQMGdTmTN88cZ
o89Hz5pO0cFUG4mifUK7
=UcGW
-----END PGP SIGNATURE-----

--k75blap56svmasro--
