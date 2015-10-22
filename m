Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E3CAF1A08F5
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 09:15:47 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445552144983338.2463261301141;
 Thu, 22 Oct 2015 15:15:44 -0700 (PDT)
Date: Thu, 22 Oct 2015 17:15:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2] Add get sel time cmd
Message-ID: <20151022221543.GZ13316@asimov.austin.ibm.com>
References: <1445549491-2899-1-git-send-email-patches@stwcx.xyz>
 <1445549491-2899-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3ioKt2kN+IccB5F4"
Content-Disposition: inline
In-Reply-To: <1445549491-2899-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_6
X-ZohoMail-Owner: <20151022221543.GZ13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 22:15:48 -0000


--3ioKt2kN+IccB5F4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2015 at 04:31:31PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add support for IPMI function Get SEL Time
> ---
>  storagehandler.C | 72 +++++++++++++++++++++++++++++++++++++-------------=
------
>  storagehandler.h |  5 ++--
>  2 files changed, 51 insertions(+), 26 deletions(-)
>=20
> diff --git a/storagehandler.C b/storagehandler.C
> index 659fff5..276dd70 100644
> --- a/storagehandler.C
> +++ b/storagehandler.C
=2E..
> +ipmi_ret_t ipmi_storage_get_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t re=
sponse,
> +                              ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
> +{
> +    time_t currtime;
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +
> +    // Get current time in seconds since jan 1 1970
> +    time(&currtime);
> +
> +    printf("IPMI Handling GET-SEL-TIME\n");
> +
> +    // From the IPMI Spec 2.0, response should be a 32-bit value
> +    *data_len =3D sizeof(uint32_t);
> +
> +    // Pack the actual response
> +    memcpy(response, &currtime, *data_len);

I previously made the following comments on this change:
------------------------------------------------------------------------
How do you ensure the proper endianness?

I don't think this is correct anyhow.  currtime is time_t, which is
typically a signed 64 bits now in order to avoid the 2030/ 2100 problem.
You need to convert it into an unsigned 32 bit (and ensure the
endianness is correct).
------------------------------------------------------------------------

--=20
Patrick Williams

--3ioKt2kN+IccB5F4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWKWAPAAoJEKsDR8wtAMEZjmoP/iHNPFi2PkflHgRK/ODWSVYI
IhTv3IP7+7KXFWMv/loCJO3OR7L4ApPxzCDRPZVZwhDFjdXyWh+7pdtCC0YHu/3H
46vJhsEvKoT5S+IRVmQCvbgcoMrQX0D1fzT8TuCS+DBF6HcS4Vf5jpK3f4cWxvfa
sFscZsq1U62S3+Gd9aJHqswAlhyka2GBhoxOs6LrxJUn5gOH+Orf7Jcw2QkIzd88
fdGuoyMbPgunv9UMYMwdO9xcNjMeXnKRPC0fOgOGil6WZeZDvejb7x9Mlgq97JzJ
Hq325q4cpwX2/Ir4R6/ytxt1YZY2ZDUmu8n4lCsbj7J8jNucmTDvzeGjht6n4N+X
+UmgulCqoaR2ZXOwt2BpeGL3buAW/XwrzSqfakwi1aVrDN4zWFb4aB4GAgBzS3Ig
x5i0eR22RA6qVWgUbdiDn6unjm1jQpgskZcgjBcuaaH9KfDdbpm2F4JglDj+98Z2
3yn1L9X9kTMhzTTdACzgMwpPMNcQYZQQMwJQi/TwlZd5VEXNiSr3DA9DyMjBLpDh
Y26x79P+Y2vhJaOY2dpPlltZENHm8r/77G6s5V+fh/26lIHLQiEL3S39XfhaEn1U
pIiKFdE5l6/VNvh0yQ+UVEnS/0mQWBqI3UcYKGGbKRzqvWxPJp1uk5Pu2nt13LgL
sLE+0rij7z0OKw4EzJWU
=ehSf
-----END PGP SIGNATURE-----

--3ioKt2kN+IccB5F4--
