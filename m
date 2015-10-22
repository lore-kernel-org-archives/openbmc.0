Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 334C61A0512
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:57:35 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482653387164.79836507851508;
 Wed, 21 Oct 2015 19:57:33 -0700 (PDT)
Date: Wed, 21 Oct 2015 21:57:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 3/4] Add get sel time cmd
Message-ID: <20151022025731.GV13316@asimov.austin.ibm.com>
References: <1445397809-31483-1-git-send-email-patches@stwcx.xyz>
 <1445397809-31483-4-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q43QQdzFtqSKgsg+"
Content-Disposition: inline
In-Reply-To: <1445397809-31483-4-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151022025731.GV13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:57:36 -0000


--Q43QQdzFtqSKgsg+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This commit should be squashed into the previous.

On Tue, Oct 20, 2015 at 10:23:28PM -0500, OpenBMC Patches wrote:
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

--Q43QQdzFtqSKgsg+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWKFCbAAoJEKsDR8wtAMEZt54P/iZyygE77+HpuYsbcAnpMHEi
XjOIqP1HkvG7g/3STT7cMci5ULliN1JI1etXKS4KjbeG6ZBEnKxprnz8O7XZJzAo
MzeH4kSxJ8wXHz+PwzvSXt/TS2JvizPIdG7E0Xhtc2hDVMybbIH3SV/Dvw6A39gi
DXVQZBuiqd7r+HtyABsQJXjNqHbZbN8zXmnjNTaNkVp4vC9gTGXd/qgazGQ+2V+N
vNshsCQMyRGMd5DG9lY6sAfvnFCysXR9HCq5GYRiOQbCqH1EwQvGc4uIDedAquWZ
t7jUovogT50YjTpUAbg8nDgl/MA2JyWTCjqwjLfllwJ8CIqT5xXaAO2QbG+aBvU2
4Rk1iB7DpX3AsqXu8vbms6VoBD71ep7d58YTCzyzfB1PZsnpPkSY/JaninzSBO75
nIYOZOR3ZGvIRmxaIBrNMMXZJukZD+yf99CsqkPCsrSZpEjSQguK0ee8dczENcQF
bLARzOHssa+P8qSxgdcXN/prsc7C2s0DsEamJobSvuZgjRufk871wWvUAp5PfK7J
Q3IXvd9hYKWpVY/+jzDJf17WFS30h/CexPS6CFzNTcdhqEg/rcnwvunj0rp+Iraw
USLF3zESn5RpSCVrwbYlMfohsqUO4+L0Gai1c/xvLf3P/ZoXZDnA2a1wIOP4sMME
dAaW1AfnvUpPY7en2n8F
=whHK
-----END PGP SIGNATURE-----

--Q43QQdzFtqSKgsg+--
