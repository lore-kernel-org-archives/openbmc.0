Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfrxh5MW8zDqy0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 04:37:12 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1467225428890578.8412858143034;
 Wed, 29 Jun 2016 11:37:08 -0700 (PDT)
Date: Wed, 29 Jun 2016 13:37:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>
Subject: Re: [PATCH ipmi-fru-parser v2] Handle IOBoard VPD for Barreleye
Message-ID: <20160629183706.GR20922@asimov.austin.ibm.com>
References: <20160629140021.28683-1-openbmc-patches@stwcx.xyz>
 <20160629140021.28683-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D8QxnvyRlKGQJxl7"
Content-Disposition: inline
In-Reply-To: <20160629140021.28683-2-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Wed, 29 Jun 2016 18:37:13 -0000


--D8QxnvyRlKGQJxl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 09:00:21AM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
> diff --git a/argument.C b/argument.C
> index a7e0a94..a191613 100644
> --- a/argument.C
> +++ b/argument.C
> @@ -53,6 +53,7 @@ const option ArgumentParser::options[] =3D
>      { "eeprom",   required_argument,  NULL, 'e' },
>      { "fruid",    required_argument,  NULL, 'f' },
>      { "help",     no_argument,        NULL, 'h' },
> +    { "iob",      no_argument,        NULL, 'w' }, // ioboard workaround

Rather than a generic 'io board' workaround, do you think we should add
a parameter like --barreleye-workaround or --workarounds=3Dbarreleye ?

>      { 0, 0, 0, 0},
>  };

--=20
Patrick Williams

--D8QxnvyRlKGQJxl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdBVSAAoJEKsDR8wtAMEZ5YoP+gJXAeQHNM9gWVRFrG9QCS2M
5YgT9xoUWg7Hb3KYGW8Nn/csQ7lQvchGsi3Rlqv0XnVWTTngfeut7KQ9LN4D7Qic
DrheQFNq5OmPNbnOe5qzs9XpnR+dklcNCfLXGKE32NmjMBQUq+5l0yQXvM/BGIjc
g0BaHGsjqXQ2rCnQhJKFk8O+yP+AA9+jTGlUOjeiodchaqozsHTiWTJd2bFCepoJ
mXthTK2IBz7giaVrWLtYMPspwrsKagU3ToCDXUVsIsxEqBF6HX0QLIKjVjgiJIt8
iHUcbOaCjDF1/Tqz/798Iy/9uOGi2cnytp1O+rfeM4L2YdmP1QFevZheRByiVni6
LPe7yoRq09+oXU2Pi61SZXKqS4lsZ4uJcJD07FZoAnE5zgxvi1lIk4uMnYyYbRGJ
CyFXa5YWdieLbSLWOh/uO7i/RCaFcioD0qJ1GAR+aD2kznEHC4eJBxjBkzsLNUTp
16zSmBP9rUIZe0uTE9GyBTYHoXgq+fK/gKkEeYMiCL3IvmDHIYtnRpG4rpX3tNVx
Iu9eRn9RhLkM7c2Oi9dgtGBDrBW22Prq9WR0oLgOM77DWUVDCB02PrZ06YFBA7/1
jwqtZkSwlAQiAtm4sL+vppvWu9Ts9QPxhdO83BsRyrxaxH1+D/XIhh0LRePzsXt8
OMP0HbqmMJ7jZEH/LWAh
=G4b5
-----END PGP SIGNATURE-----

--D8QxnvyRlKGQJxl7--
