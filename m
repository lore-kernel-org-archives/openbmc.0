Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 28B421A02AC
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 07:10:18 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445371816596466.2774772130085;
 Tue, 20 Oct 2015 13:10:16 -0700 (PDT)
Date: Tue, 20 Oct 2015 15:10:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 3/3] Add get sel time cmd
Message-ID: <20151020201015.GP13316@asimov.austin.ibm.com>
References: <1445368848-31548-1-git-send-email-patches@stwcx.xyz>
 <1445368848-31548-4-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QQNwO3VdVfodZayb"
Content-Disposition: inline
In-Reply-To: <1445368848-31548-4-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151020201015.GP13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 20:10:19 -0000


--QQNwO3VdVfodZayb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Squash this into the previous commit.

On Tue, Oct 20, 2015 at 02:20:48PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> ---
>  storagehandler.C | 2 +-
>  storagehandler.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/storagehandler.C b/storagehandler.C
> index 276dd70..d26fa56 100644
> --- a/storagehandler.C
> +++ b/storagehandler.C
> @@ -34,7 +34,7 @@ ipmi_ret_t ipmi_storage_get_sel_time(ipmi_netfn_t netfn=
, ipmi_cmd_t cmd,
> =20
>      printf("IPMI Handling GET-SEL-TIME\n");
> =20
> -    // From the IPMI Spec 2.0, response should be a 32-bit value
> +    // IPMI Spec 2.0: response should be a 32-bit value
>      *data_len =3D sizeof(uint32_t);
> =20
>      // Pack the actual response
> diff --git a/storagehandler.h b/storagehandler.h
> index 1b7f552..453b8a6 100644
> --- a/storagehandler.h
> +++ b/storagehandler.h
> @@ -1,7 +1,7 @@
>  #ifndef __HOST_IPMI_STORAGE_HANDLER_H__
>  #define __HOST_IPMI_STORAGE_HANDLER_H__
> =20
> -// IPMI commands for Storage net functions.
> +// IPMI commands for Storage net functions
>  enum ipmi_netfn_storage_cmds
>  {
>      // Get capability bits
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

--QQNwO3VdVfodZayb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJp+nAAoJEKsDR8wtAMEZ6XwQAIMBuzY075QpERmSSnp7KgGP
sfAjHlw1/Li11U2pzCu9ThZpwmTB1U9iZaJPUid+Udtt8d7dVYRXex1XR7xuAAfA
xEQOXFSyRe+inVPmJuN1BGc8RRRcENLHGtlmGiaE9mNwXOLlC5eErN3h8rGBbh0h
IcKsgaxPQZNUJ+I5ust6JOBoOGz2XjgnIpnxDh8Cz7CmPjHIPFm3K/ofcgB5S8l6
1DTzZXen68PPbv9RfSTj9ulidx9ROitsNaI6+zwMg7ryEBdtaw0D/+CpUN+ndFFh
edDoLnEolbXBG63wEaj58nGAoDYT1cDHSrsodHFw/5eNARjJZn6gGkQ8Cq2P0uEv
Vw0HPgd8gHA7v+ShzD/eiWqQNTUC9gTzb/rmVj9RG+0SkXOhKpewNfw42pggY0Tt
fA/FtZ+colKXMmsnhXuiXONeOC6RLs6R0jD/f5TM2kGFeIxAp6aRyJu3OBSmLEgW
EVVsplvdZysKFvZFcwjV7oddtOUH0XTiG619GBW3S+D8/1S/QZyZ/U4nFiPxKXfn
1VZri8cXopJhTL1MVXoGrwKZqQq7JSSpXNsPq43J9PsSMxe06cMrabISmaXXkTIi
grysA4mwuhyIePO4odn9DhrHYBF5iwOEtGZL6NWrkQkPLZPxHtyo9Dej9gsZy0ti
RGXUBst87UB3WO7sHkDt
=/C/B
-----END PGP SIGNATURE-----

--QQNwO3VdVfodZayb--
