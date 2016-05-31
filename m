Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rK5tT1vYPzDqcP
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2016 07:17:51 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1464729467559634.298701421403;
 Tue, 31 May 2016 14:17:47 -0700 (PDT)
Date: Tue, 31 May 2016 16:17:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v2] Replacing std::ifstream by access(2)
 for checking file existence
Message-ID: <20160531211745.GQ19968@asimov.austin.ibm.com>
References: <20160531062014.373-1-openbmc-patches@stwcx.xyz>
 <20160531062014.373-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3mUD2hqWbnBptYHy"
Content-Disposition: inline
In-Reply-To: <20160531062014.373-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 31 May 2016 21:17:53 -0000


--3mUD2hqWbnBptYHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2016 at 01:20:14AM -0500, OpenBMC Patches wrote:
> From: vishwa <vishwanath@in.ibm.com>
>=20
> ---
>  writefrudata.C | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/writefrudata.C b/writefrudata.C
> index 7ee2127..6ca1f16 100644
> --- a/writefrudata.C
> +++ b/writefrudata.C
> @@ -663,7 +663,7 @@ int ipmi_validate_fru_area(const uint8_t fruid, const=
 char *fru_file_name,
>                           (fruid, get_fru_area_type(fru_entry), bus_type,=
 bmc_fru);
> =20
>          // Physically being present
> -        bool present =3D std::ifstream(fru_file_name);
> +        bool present =3D access(fru_file_name, F_OK) !=3D -1;

We need to make an assessment on when to use STL interfaces vs when to
use direct syscalls in C++ programs. I don't have any problem with this
change now without any direction.

Prefer to either write this as:
    - access(..) =3D=3D 0
    - access(..) >=3D 0


>          fru_area->set_present(present);
> =20
>          // Only setup dbus path for areas defined in BMC.
> --=20
> 2.8.3
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--3mUD2hqWbnBptYHy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXTf95AAoJEKsDR8wtAMEZwHMQAKF0yUxYpiT7qDpbVwogYab7
Q/wSlXzwNdj/aIfSYDgdi4W83G4KU1toR4/US11HGJjl0kEtjG3YJUDG8eTHKDkl
YZ9KLGl0buL9xYkF49FRlUihr8PSNBGZKNZh+yxcsbs1B5/jzhFYUuGTljXS+d7e
/oUsjRksiiu68taLNXxrfeAHDBnAJheQWRzqRwXdTxBzyN2bUUdtaqxQClDjqCwy
Diuv/5CBaEpTN8bjMSvXigYQJO4ZTmjIM/ZBZEeTRChfyHYCVzN0S5lZd309DsGf
Y18QFtzA03d1Y0i9t4RcC39452TNhiRwttv+JXM/cQ+m/FW5Jsrc289gFi4U96p/
/WjVdwDKaYnwW4mOpSzgUypWpheiBLBMQNdp75Tba2TlkihyXB1L74UyHyrwBYJS
yrRaR3CI3LJDcQmliVuDbZw5QVpKn1Mju7lqlC9X9C3s8Wfq3ZZkly9+bCio5tUJ
dZbCEXn0n/JkVs9FkfvAEZZg5uLssyVWeVxiX8B1Ocnpco/QFaIFBrVCv4OU3NO/
Pmadkh/3n+u6/OUnLUaYIXjgcCi3YBeY4A2UdKyTaxA9mOIpBgdf7FPh0l20P+Oj
788cQ67WuIhVTZnKavHlvy5sxEuYpYx0QJVkupOMwWw3BwNPnbpFcU3Wrq/mc7lP
yoB2i6naFldO63xDidul
=rzfy
-----END PGP SIGNATURE-----

--3mUD2hqWbnBptYHy--
