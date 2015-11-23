Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 161B91A009B
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 08:01:55 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1448312506841565.0204653579041;
 Mon, 23 Nov 2015 13:01:46 -0800 (PST)
Date: Mon, 23 Nov 2015 15:01:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v3] fix set sel time
Message-ID: <20151123210145.GG21764@asimov.pw-on-the.net>
References: <1448310628-28333-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448310628-28333-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline
In-Reply-To: <1448310628-28333-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_8
X-ZohoMail-Owner: <20151123210145.GG21764@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 21:01:56 -0000


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2015 at 03:30:28PM -0500, OpenBMC Patches wrote:
> From: Norman James <njames@us.ibm.com>
>=20
> ---
>  storagehandler.C | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/storagehandler.C b/storagehandler.C
> index 1459f94..48e8089 100644
> --- a/storagehandler.C
> +++ b/storagehandler.C
> @@ -2,6 +2,7 @@
>  #include <string.h>
>  #include <stdint.h>
>  #include <time.h>
> +#include <sys/time.h>
>  #include <arpa/inet.h>
> =20
>  #include "storagehandler.h"
> @@ -52,14 +53,25 @@ ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t net=
fn, ipmi_cmd_t cmd,
>                                ipmi_request_t request, ipmi_response_t re=
sponse,
>                                ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
>  {
> -    unsigned int *bufftype =3D (unsigned int *) request;
> +    uint32_t* secs =3D (uint32_t*)response;
> =20
>      printf("Handling Set-SEL-Time:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
> -    printf("Data: 0x%X]\n",*bufftype);
> -
> -    g_sel_time =3D *bufftype;
> +    printf("Data: 0x%X]\n",*secs);
> =20
> +    struct timeval sel_time;
> +    sel_time.tv_sec =3D htole32(*secs);

This is backwards.  The IPMI data is in LE format, so this should be
letoh32.

>      ipmi_ret_t rc =3D IPMI_CC_OK;
> +    int rct =3D settimeofday(&sel_time, NULL);
> +
> +    if(rct =3D=3D 0)
> +    {
> +	system("hwclock -w");
> +    }
> +    else
> +    {
> +        printf("settimeofday() failed\n");
> +        rc =3D IPMI_CC_UNSPECIFIED_ERROR;
> +    }
>      *data_len =3D 0;
>      return rc;
>  }
> --=20
> 2.6.3
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWU365AAoJEKsDR8wtAMEZhlsP/20XuZLCIBkpwDP4sXZCvMXU
3Jttn3jVt9Jqqip1jOBY+YaaldGl3t5o1jOu5B5C3RQEMLuHvrbH1w4uRD/yDOYK
NJPjpYv10exyjmBeYCPNhLhi4yjeJHSU6sEk1CktpxVWjxVrxUUKHILXaYIs00ig
KUL9T5+5qm8VZSG5hQEisMaLirLlFMaRn7PzJTg+5W6Isvzzd/cpkTpew8ROvcxF
3YFRz4h09mQ7lTfmgn1jUxAH4SgRj4tEJT47fID0YUM5T7QLsQerPp1GOt4M0XOh
XyWPyf2INqkfwdCJAIhPqHeFih+dh2m7joilisI2He7FFOvZgKBMKn1X0ZpPZrAq
voXNvk/kAyi9btvXgh3UEykI4oDcxZbhZkH8h81aud73XwzqrAXLx3XR9Cyq6x2q
NLeVXfPKTmh0bD65FJjJrf8zmo7zpQ6tI94PC1Lf7YqCJd5BPkLDWa7Cztr3OBDs
JQfJKorJuX3QLLFUPZXc02LtWu0unFt1mASsSJ3phVjgfKXBM5vYjs6eKEPby6fo
x24utlsUmxKL7lN8rVYhy5sbPBkFPrfTdiGMlEpJVP5yhC1oKNYSi7cCEtUcf/vo
10w6UCqpJLnbZtTCMxUE1/jR/RzfbOD72eSJGPoap3j8mknY1+/gqaj9o+H1N0kR
He1HTF5eHp+WQQns7gO8
=mmlT
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
