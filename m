Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2NxB3q0dzDqR9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 06:45:02 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1484595894736502.8449477901165;
 Mon, 16 Jan 2017 11:44:54 -0800 (PST)
Date: Mon, 16 Jan 2017 13:44:48 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
Message-ID: <20170116194447.d3yzsldsu3qsl5sz@asimov>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5k3tsv6i5ebpwqso"
Content-Disposition: inline
In-Reply-To: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Jan 2017 19:45:03 -0000


--5k3tsv6i5ebpwqso
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
> New Design
>=20
> Create two objects:

You mean 'classes' or 'objects'?  I think you mean two classes, which
initially we will only have 1 instance of each.  Please make sure the
HostEpoch implementation can relatively-easily be enhanced to have
multiple instances.

>    - BmcEpoch
>    - HostEpoch
>=20
> They both implements EpochTime interface.
>=20
> For BmcEpoch:
>=20
>    - When elapsed() is called, return BMC time;
>    - When elapsed(us) is called, use above SetTime(=E2=80=9Cbmc=E2=80=9D)=
 logic
>=20
> For HostEpoch:
>=20
>    - When elapsed() is called, return HOST time;
>    - When elapsed(us) is called, use above SetTime(=E2=80=9Chost=E2=80=9D=
) logic.

Seems ok.

The errors also need to be converted to dbus-defined errors, right?

> And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or =E2=80=9Cr=
equested_time_mode/owner=E2=80=9D
> properties on DBUS.

So these are only stored in phosphor-settingsd now or are they also used
internally for decisions?  I believe the previous implementation had
them exposed more for debug purposes.  Are you going to add them to the
journal at least?

--=20
Patrick Williams

--5k3tsv6i5ebpwqso
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYfSKvAAoJEKsDR8wtAMEZRjQQAKQ1PAwbXPcFiaOv/iZELNS2
DTV+vAYwlFnQx+DXq5Uy+ZfPvJfeAHQ8WiuH2ltkGYmzPjwtCu0/EwaTf6RkMQnO
kh/BhOakdU7LtxxzgjDHbiasdvTvFg69LqHRUP3h8Cj/R117OXUsOPHc8DbW3kSx
BwtuQ0fb8+ca9vqs+5+bXAmT9Q0rBXqgQnwZmvNPL/d6IcyCGewcT7ydJXXkHuI8
VqZM0SPzz6E7HrKg6j36wVGTDnX07phZKrnepSpcbR7HHz+MAVZY9TShfdvMMAjE
qZ62DN81Pe62YeDXkbn2U6LFaDkdqz1gms2YVCH23qssOZoAWQOFCpCiBeyJuJWm
SD///2jjKRXJL5Y0xReuIxqyvPt9GYkB5lDzeuWuD8BJnDmMnuBijuEblpHPgS43
YeIwjvsUhF5iNCRF3qzp8rUWKYHiFZFHXDt6IPAz5i0tyVCmgLc1+qiXd3gOlf/V
fueYSARGxpjUOPGcZ5y0AaHFHEHCiqq68A0sspkaMCvzh339DtdRAsLaq6eGEK4G
UqHTVHaxhXxotv/3QP2iP4Ccet2obNiEQvNc7oJkLDbox5uxKYCUzB+h2OIS1WF/
zcV6QtF2ACn/Brqj/t2+CBgkPiPltEeltSXmw3IwRCuQQGdENe3KjBnqsw2+UDFy
hj71kZ+Zh/7UaUdrQfht
=Mevr
-----END PGP SIGNATURE-----

--5k3tsv6i5ebpwqso--
