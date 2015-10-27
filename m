Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 12AA71A03AA
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 06:08:05 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445971284612316.0308659589531;
 Tue, 27 Oct 2015 11:41:24 -0700 (PDT)
Date: Tue, 27 Oct 2015 13:41:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2] Add Get Device UUID
Message-ID: <20151027184121.GA13316@asimov.austin.ibm.com>
References: <1445639114-8724-1-git-send-email-patches@stwcx.xyz>
 <1445639114-8724-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DejVYFcqCV4p9T4J"
Content-Disposition: inline
In-Reply-To: <1445639114-8724-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_6
X-ZohoMail-Owner: <20151027184121.GA13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Tue, 27 Oct 2015 19:08:07 -0000


--DejVYFcqCV4p9T4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2015 at 05:25:14PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add support to get the UUID and return it in the specified
> format per the IPMI Spec 2.0
> ---
>  apphandler.C | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  apphandler.h |  1 +
>  ipmid-api.h  |  7 +++--
>  3 files changed, 95 insertions(+), 3 deletions(-)
>=20
> diff --git a/apphandler.C b/apphandler.C
> index 40cd79d..53c7ac2 100755
> --- a/apphandler.C
> +++ b/apphandler.C
> +
> +    // Traverse the UUID
> +    char* id_octet =3D strtok(uuid, "-"); // Get the UUID octects separa=
ted by dash

strtok shouldn't be used because it is not thread-safe.  Use strtok_r.

> +        for(i =3D 0; i < tmp_size; i++)
> +        {
> +            char tmp_array[3]; // Holder of the 2 chars that will become=
 a byte

Need to initialize this to ensure the last byte is the null terminator.
Otherwise, strtoul will cause a buffer overrun.

> +            strncpy(tmp_array, id_octet, 2); // 2 chars at a time
> +
> +            int resp_byte =3D strtoul(tmp_array, NULL, 16); // Convert t=
o hex byte

=2E..

> +        id_octet=3Dstrtok(NULL, "-"); // Get next octet

Another strtok.
--=20
Patrick Williams

--DejVYFcqCV4p9T4J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWL8VRAAoJEKsDR8wtAMEZi1QQAIfV4mUyIZHgGOWFLHjIuxp8
WVcazEs/xNzf+xHnKsXvdXN3GRjhPXwi4oS0cUGIN1OjhofRnuPVMHQu1CoAjTI3
BYZbgzKTT4I6dQYTa0OFhmfV82002JxvYU8ZrM+3f0q2pFJUicGmC5GpLu8EA5xz
mJutE38BCYfKgfpRA0XOXkfRf1s9MgZaLlfnkf3C2uWYG8K2FuDFinkO9nbc6NaX
scSGF/lfdprdzBG5eroIpuRWTOnyy7s1nHCNbykM8oX9HjbJ7fw2ls+NkNiBpHHj
Iq0Cy5a8fwpqTz/dWj/mcB6nH5KOtN5ffyLI9lnkYQtBErMiiTLe7BStuvt4JxcD
uaFf/Plot6KZnzcmOkISfE7hUocomelrPQyJRf4f8Bru1Zbi62s2wFbBSkXC9h1Y
dzXHS6t/dmi5J4GiHUQYhwHugwray5We8jyv/5ZPyiwfGm/YT5uQBCFMX4HDaB/h
eU/7W4pKfB/c05UJgKCvDC+LnVz56/Vjrb6biZXymCFBGbUMILXH2+rzM9Emz0He
5XfyPjLOom5fIvMU05dSthjXred/0Mk/FKO+dtmoxRB1pY417P0Sz1HPub2uFJlm
Lzlxbc0VgUxeHIJVA+J8HQRWW6M61h6oC+HCPYHeSe1qeMbZTjOaniMfMn0gepmi
K7JA2MpDpTz4k5WLqgkK
=p8eI
-----END PGP SIGNATURE-----

--DejVYFcqCV4p9T4J--
