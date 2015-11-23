Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 659011A02A1
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 06:52:04 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1448308319779919.2093815641296;
 Mon, 23 Nov 2015 11:51:59 -0800 (PST)
Date: Mon, 23 Nov 2015 13:51:57 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] fix set sel time
Message-ID: <20151123195157.GE21764@asimov.pw-on-the.net>
References: <1447974026-2256-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1447974026-2256-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline
In-Reply-To: <1447974026-2256-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_3
X-ZohoMail-Owner: <20151123195157.GE21764@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 19:52:06 -0000


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 06:00:26PM -0500, OpenBMC Patches wrote:
> From: Norman James <njames@us.ibm.com>
>=20
> ---
>  storagehandler.C | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/storagehandler.C b/storagehandler.C
> index 1459f94..71ed29c 100644
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
> @@ -57,9 +58,20 @@ ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netf=
n, ipmi_cmd_t cmd,
>      printf("Handling Set-SEL-Time:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
>      printf("Data: 0x%X]\n",*bufftype);
> =20
> -    g_sel_time =3D *bufftype;
> -
> +    struct timeval sel_time;
> +    sel_time.tv_sec =3D *bufftype;

This needs to have endianness fixed.  I think:
    le32toh(*bufftype)

Also, on line 56 whoever did a cast to 'unsigned int' wrote non-portable
code.  This should either be uint32_t or uint16_t.  That will also tell
you which function you should be using for the endianness conversion.

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

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWU25dAAoJEKsDR8wtAMEZb7sP/39RH4pCCDShzD4GVNgS3qqP
8TJAF6deos6PI9qXgdPxGxjBBDQX6M/tm9Nkn9XG5ihQnsAgSQsycpq3tPjy0dgd
+2EBEg9+5Ds2o14Z8y4OnI4qo7WphmirFa/kwuIIHVO0lQTonEw4+Yce8oHp+RJd
PsjhbIn/46WuIugtd+7SOU14YdWZU5Pk1MH1s4SRQ5FuPuDIXXlnW+FmlTKopglk
Q4Ivoxyvgwh2dWvyDsKS6JBLQFV+usEGvLrjEiAPgmG4pe0suY1AO5+d68g26cgl
YT7Pamrg/6w1WVZ3zSUbbKlZGz3QbUkzW8ViATxQF46WGTlf7LyWhD72Nwv5LyPw
2o0ywEokcA5y7pwnQzKr0/ZxwD05vihfKDnkk+0ys9q+y5i4UcmlM7oWpBo1rL0D
4JsQpRQulM84YLDDeqrKVB72NNiK3OvB3ySm/eWaCGJQijqPsF9gQcR9W+uAgfux
XWcxA32y8+TEhDQvfvH28b1l5sr9KSIdiwUzjpycxWeVY+HJQxHiQnMQd2Z6J9+M
1pe6qaVW46fNA4NBw5MrpaSdb5bT9Y39Ghk2oLHKg10BeY3DNbP00g0T7aGSxt2x
lAxHNUJwMWqCkcMNurI/fK1hmWAYujI31Xx9RDQgRZtRHuYKq1qwhYN6vMHg4PCg
m8aUSrnvR1n59iCKtYml
=/F7f
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
