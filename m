Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZ1VW4TzfzDqFD
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 07:45:21 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 146654551446941.92486691457566;
 Tue, 21 Jun 2016 14:45:14 -0700 (PDT)
Date: Tue, 21 Jun 2016 16:45:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Fwd: [openbmc/phosphor-host-ipmid] BMC version should be BCD
 encoded (#89)
Message-ID: <20160621214512.GB23932@asimov.austin.ibm.com>
References: <openbmc/phosphor-host-ipmid/issues/89/227330539@github.com>
 <E73A24ED-C82F-48F4-9F57-C70886A5E26F@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <E73A24ED-C82F-48F4-9F57-C70886A5E26F@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 21 Jun 2016 21:45:24 -0000


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2016 at 11:18:52AM -0500, Adriana Kobylak wrote:
> Any thoughts on the concern about BMC version being decimal, so that the =
IPMI representation of the version in BCD does not match character by chara=
cter the tag in github?
> Should we limit the tag numbering to a max digit of 9 which would match t=
he decimal and BCD representation, should the tag be in hex, or there shoul=
d not be any change and this is how it works, other?

The spec for "Get Device ID" has:

byte 4 : [0:6] Major Firmware Revision, binary encoded.
byte 5 : Minor Firmware Revision, BCD encoded.

It is very odd to me that the two are different but that is what the
spec says.  We appear to be doing everything correct for byte 4 (binary
encoded and mask off the 7th bit) but not doing it correct for byte 5.

https://github.com/openbmc/phosphor-host-ipmid/blob/eee949f14d921d84497f41d=
f84ab7ae45a0d830d/apphandler.C#L190

I think we should just fix this for byte 5 and make it BCD as requested.
This would still allow us to support up to v7F.99, which is more than
enough.

Sample code to fix up:

    rev.minor =3D (rev.minor > 99 ? 99 : rev.minor);
    dev_id[DEVICE_FW] =3D rev.minor % 10 + (rev.minor / 10) * 16;

--=20
Patrick Williams

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXabVoAAoJEKsDR8wtAMEZ6OgP/2wb0SmxTvuSiTIRGSi2B0t2
EsILNxgCTjK9ka8yyI1UWuzGvcyZP/YSUIwEfduTUxi1vF6xr9zLWqJuwGZZYAS+
8qMK6ZDV+sBrPKvk1u7xDlA/LaYGFHQ7LPl2XL3u2dNeNYrGLtj8SWKIETKOudUU
WyKYpvoRmV8Tr+VIUdTA1HMrE0HhYyEvEcnC6VKUf8pnOugtTxOeaPlZhabw7l8c
IPNK5/W/by83gp61vrqgUjILQ7Cy8H/gTgkzMShEJDWSQmEgRowMuyaDd12vUltp
JPhcHIV4MYUigCKmXy6TMz0fEtEGlcS5L4i9x3gBPqiOublyr5vaJ1pFfUZSA9OF
5mwwROVahmRPjneP4yCu3XnuEgV/qTGgD7fyc9nDy5Smoqo/uIf9/9NN9PBXjF/d
MJoTmf85Hc8JNixmyC/Z7ZcN37kuRQjGJvGTipdXGznF2R2YbKTvDWlsXXaJI73x
wXa4LL3DMfa2xQd4h9z5tdu7Y+vZDOhYUE6VxbfN49pWrgP6yr0j+tnzDuIF6lyC
6ie4R2vYFJ8ApohAYX7kDb5a7LedK6vwoz0UMt7YQQflytIwgSuC56PEWtjrKqzD
bcJzyVQuw4CJJDWf1AKqVpYnwJ46y3UwMswe7eprI+TkLmgnRHt9N0qOWeTRkvji
CAMfZ4OECcb3dnLli/IT
=N0U3
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
