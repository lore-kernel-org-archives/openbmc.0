Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 446851A03A9
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 09:02:26 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444946542361631.9582370603956;
 Thu, 15 Oct 2015 15:02:22 -0700 (PDT)
Date: Thu, 15 Oct 2015 17:02:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 1/4] Print the dlopen failure for
 debugging
Message-ID: <20151015220220.GF21126@asimov.austin.ibm.com>
References: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
 <1444923803-24688-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline
In-Reply-To: <1444923803-24688-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151015220220.GF21126@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
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
X-List-Received-Date: Thu, 15 Oct 2015 22:02:26 -0000


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 10:43:20AM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> ---
>  ipmid.C | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ipmid.C b/ipmid.C
> index d0dfba8..87f993e 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -351,7 +351,7 @@ void ipmi_register_callback_handlers(const char* ipmi=
_lib_path)
>              if(lib_handler =3D=3D NULL)
>              {
>                  fprintf(stderr,"ERROR opening:[%s]\n",handler_fqdn.c_str=
());
> -                dlerror();
> +                fprintf(stderr, "%s\n", dlerror());

Shouldn't the dlerror() go into the previous fprintf?

fprintf(stderr,"ERROR opening %s: %s\n",handler_fqdn.c_str(),dlerror());

>              }
>              // Wipe the memory allocated for this particular entry.
>              free(handler_list[num_handlers]);
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWICJsAAoJEKsDR8wtAMEZPl0P/iwKEG35pDA3c14v9Ngwoy0c
5upLngrLVRkYWakxQOKVK9pPUEqHBhSmlJ4McLz8FK1E4S4EkIeH6yOtG/293ki7
t4f09tJvzu0pvRU4SfOknAsJqlka129idkWnzdg8Xy6sFyPl0sKk8df9vWc4vzqN
vMm5AStbbnRODImlObKIu9xhqap6pXP/O0lhhgbm2uJUBRhD+DfDQj1aOSBZZJ9M
txYes5a1QQoSN+FGNk5kZ2N6Q3Gl2DjhNHchcrPSWSJYVyoJCwtjS4GY/8Qa4XtA
DyRSEd6H81/kCEQ14Ewm7UwCNon/Vc8sPDip6pU2dbmWOnbWNLNJnCaIWySX1+43
kOuIl/rIwyb9kRjcyfj4A6ZYd/r7XL1grgyQ1h2WyBs1OkyjoWhY/fHBAujF5U3H
AFQLaUjp4l2WVS+OKGt2HjuEc+fGehMwSrr6GTbGlbACCjnzjWq+sZIQ5TnJ7nkf
yKfXAzernGoECKVNCnWD29FPtdQhwaRn9cRKU5whfWR8qP7ZFagK1b0gX514fq5B
x/cNeZZDjZZHcM9RfsJCHNHeOp9Hk/NQnQpt2554E8yXZvY0iE266OMPL4FOs0/S
RxmAl0x1/t78xQcEOaT7wOm7gllCqSEJd1ylvFvXHK8bIih4+jSQ1YUQkGz8MIi6
fTDbbzu6grHVs+OVC7Uj
=vTQs
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
