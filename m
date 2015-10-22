Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 27E121A0758
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:41:57 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144548171592547.21866994745881;
 Wed, 21 Oct 2015 19:41:55 -0700 (PDT)
Date: Wed, 21 Oct 2015 21:41:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Add ipmi cc for invalid sensor
Message-ID: <20151022024153.GS13316@asimov.austin.ibm.com>
References: <1445481114-29889-1-git-send-email-patches@stwcx.xyz>
 <1445481114-29889-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R4+lwT0Y15rLnKR0"
Content-Disposition: inline
In-Reply-To: <1445481114-29889-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151022024153.GS13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Thu, 22 Oct 2015 02:41:58 -0000


--R4+lwT0Y15rLnKR0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 09:31:54PM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> ---
>  ipmid-api.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/ipmid-api.h b/ipmid-api.h
> index caf18e8..588dd24 100755
> --- a/ipmid-api.h
> +++ b/ipmid-api.h
> @@ -86,7 +86,9 @@ enum ipmi_return_codes
>  {
>      IPMI_CC_OK =3D 0x00,
>      IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT =3D 0x80,
> -    IPMI_CC_INVALID =3D 0xC1
> +    IPMI_CC_INVALID =3D 0xC1,
> +    IPMI_CC_SENSOR_INVALID =3D 0xCB
> +
>  };
> =20
>  #endif
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Merged as is because the DCMI one is already here, but we shouldn't need
to put all the CCs in this file.  Otherwise we break the purpose of
modularizing the handlers.  I would suggest that CCs go into the
relevant file for the particular handler that emits that CC.  Unless, we
want to take every single CC documented in the IPMI spec and put it
here.
--=20
Patrick Williams

--R4+lwT0Y15rLnKR0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWKEzxAAoJEKsDR8wtAMEZ1AYQAJ65PCDwU+QM0x+7dt4f7V79
zPd7gxjeXoqBskqj96TWDEbowZEUHXAu80e7tqYQ7axbV7bvSXfWiBPxAmAWOQu+
OhjYmoYnEcGzYm0wGNHSH6G8mcsjvKO3qzKBIunTH8k0D9Jz0wF7aA5BRPxysqsc
vl6ducnz8/Nra/1OykXtQTGYq1GuN1JIRyEFhCn9uxrXuXO3et6BElZ1zXIJuxz7
5KEqMXuX4bHoW4t5kM+arS9apO+1iGqgd6czL2WWl0wfcGtRSpyQ2eHG0efrVM71
X6th1e5nehRA+yY1SzYNEX0YJtJ2LYcz5e+ya6HZj6fo0nHYcduHnlpk8ErctcQE
6lx4TufYnSvJNCVeb0HZ9KVV9DZMGOn+t+ckL9fko8UhR9XYkKsa2jtxgAerZtR6
4B+h8zWhspWaklqxqF4neWkYCE0RQZrZblWFYlMmL3qxwU4lF6z0+mSXJXiKPFMm
aDmBFrFTzZtpPZPAWxMApToYUfsjUQBOQS7ioyHHRYWNw97kyjlHd27SgN94wJ4Z
6J2R0PxfvjBd5QEa2tzzAjPR+sADhcI0VmpJ6FKOTPQrsJAwRsWbznXh0zXmJxAS
d6V1rcLp4hnSigQybPbRHR4eJyABsUZvknvCN88L5rHzY04LmP1Q5bdbBEe3H8IX
ePfU/cNhCKieTx4KhK3/
=KV+G
-----END PGP SIGNATURE-----

--R4+lwT0Y15rLnKR0--
