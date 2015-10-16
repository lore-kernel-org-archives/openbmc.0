Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BD2351A09E4
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 04:31:57 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 144501671441715.876301510541907;
 Fri, 16 Oct 2015 10:31:54 -0700 (PDT)
Date: Fri, 16 Oct 2015 12:31:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v3 2/4] IPMI FRU Parser Interface.
Message-ID: <20151016173152.GF13316@asimov.austin.ibm.com>
References: <1444999069-20975-1-git-send-email-patches@stwcx.xyz>
 <1444999069-20975-3-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline
In-Reply-To: <1444999069-20975-3-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_8
X-ZohoMail-Owner: <20151016173152.GF13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 17:31:58 -0000


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 07:37:47AM -0500, OpenBMC Patches wrote:
> From: Hariharasubramanian R <hramasub@in.ibm.com>
>=20
> ---
>  frup.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 frup.h
>=20
> diff --git a/frup.h b/frup.h
> new file mode 100644
> index 0000000..2270470
> --- /dev/null
> +++ b/frup.h
> @@ -0,0 +1,7 @@
> +#ifndef OPENBMC_IPMI_FRU_PARSER_H
> +#define OPENBMC_IPMI_FRU_PARSER_H
> +
> +/* Parse an IPMI write fru data message into a dictionary containing nam=
e value pair of VPD entries.*/
> +int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);

I thought we weren't going to make this depend on the fact that we're
using it for sending dbus messages?  Seems odd to interact with the
sd_bus bindings at this low of a level.

> +
> +#endif
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

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWITSIAAoJEKsDR8wtAMEZQ98P+gMfIYn3QbUCzmQJv/ncAw6y
0aVdQcXnNBK2nzZRlEab0cr6/2gyq6TVGp8I9qYBNXQZK0AFGs79Io9RNzfKsB6e
FkF7VvyV2FHEJy9rpSnwnZl9Ta2TMszzOlgQjUSjepHmKwqfsznLYONAvKOQ1l5P
4/Uvb3gkMTR5ycCl7phOa9Cy+MuKOPq0PJ6dIBtmGcFiNszCy605lDGR+81HC2qM
uXWBgeU5MRqbiG8HQc8T7cKcICJK3Ih7az+MgmpUhwXHzyn4PF8mwrBpGbE8tJi9
HkAyrSeZBPzetBUd1HPAUm1T/qhBAxAnWMmZqYOApKafwuK9p0dBhCtKObiqDPg4
GhsFKSp4V+ffVce5TX8bgTUVayhxcggXSrCZAmEK4nb5Sh/hgtRQp2R+4GAo4Si7
BGPpXGVDnLBOWOGsUgxfjz67ZJmMSZLAQB/ElEgwM2fOvCvbUNrFVl4HL+HFFPdr
Nf91cm+fYuaaeG0Y8MORVoox19MSVKxWezgmXuY/NklDqnunp6+kYf5nFM13kkQd
CYUGZkhPsocNoHriJpXoxnzTrXsixiEvgfJ8SPeFLUt6gzPNoPdJu+/RvfQxYoSr
Cek1xg6z4iXv+Di7iq2UOTWxiFygP+hUeDtxbS4ROZ+aLR0JDgNpARxdPuRChItI
GKJ4MSyIorS/zz01Zu/j
=C/eO
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
