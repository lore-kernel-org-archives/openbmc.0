Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6462C1A0075
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2015 02:59:22 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144889665389237.49957646728092;
 Mon, 30 Nov 2015 07:17:33 -0800 (PST)
Date: Mon, 30 Nov 2015 09:17:32 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 1/3] ipmid: Use updated dbus HostIpmi
 interface
Message-ID: <20151130151732.GI19499@asimov.austin.ibm.com>
References: <1448436024-9396-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448436024-9396-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uJWb33pM2TcUAXIl"
Content-Disposition: inline
In-Reply-To: <1448436024-9396-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_12115_2
X-ZohoMail-Owner: <20151130151732.GI19499@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 30 Nov 2015 15:59:24 -0000


--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Chris,

Why does this patch exist with whitespace only changes?  Did something
go wrong in a rebase you did?

On Wed, Nov 25, 2015 at 02:20:22AM -0500, OpenBMC Patches wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>=20
> With the updated HostIpmi dbus interface, netfns are not packed with
> LUNs, and the CC is separate from the data.  This means we no longer
> have to define NETFN_* as arbitrarily shifted, and we have the added
> bonus of replying to messages where lun !=3D 0.
>=20
> We may want to separate the CC returned from the handlers in future too.
>=20
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  ipmid-api.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/ipmid-api.h b/ipmid-api.h
> index 2d58961..f9c03dd 100644
> --- a/ipmid-api.h
> +++ b/ipmid-api.h
> @@ -63,16 +63,16 @@ extern "C" void ipmi_register_callback(ipmi_netfn_t, =
ipmi_cmd_t,
>  // Note: these are also shifted left to make room for the LUN.
>  enum ipmi_net_fns
>  {
> -    NETFUN_CHASSIS   =3D   0x00,
> -    NETFUN_BRIDGE    =3D   0x02,
> -    NETFUN_SENSOR    =3D   0x04,
> -    NETFUN_APP       =3D   0x06,
> -    NETFUN_FIRMWARE  =3D   0x08,
> -    NETFUN_STORAGE   =3D   0x0a,
> -    NETFUN_TRANSPORT =3D   0x0c,
> -    NETFUN_GRPEXT    =3D   0x2c,
> -    NETFUN_NONE      =3D   0x30,
> -    NETFUN_OEM       =3D   0x32
> +    NETFUN_CHASSIS  =3D   0x00,
> +    NETFUN_BRIDGE   =3D   0x02,
> +    NETFUN_SENSOR   =3D   0x04,
> +    NETFUN_APP      =3D   0x06,
> +    NETFUN_FIRMWARE =3D   0x08,
> +    NETFUN_STORAGE  =3D   0x0a,
> +    NETFUN_TRANPORT =3D   0x0c,
> +    NETFUN_GRPEXT   =3D   0x2c,
> +    NETFUN_NONE     =3D   0x30,
> +    NETFUN_OEM      =3D   0x32
>  };
> =20
>  // IPMI commands for net functions. Since this is to be used both by the=
 ipmi
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

--uJWb33pM2TcUAXIl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWXGiMAAoJEKsDR8wtAMEZTdMQAJXWKZik0xf0DzCwXgkCpxfP
lEWnIv0ZvL3//YGVuCQcOLbaZupcGkz6J/B8L6GjINhJyBwhdIcR94qXwtcnmPWm
P/I/22r56YggIzMrFz0qqzhR4xx2CIDFaDj4xeIxXPkh2/bzBhnitpZIiqrJzszA
3frr8+qIrwbNZCQBNqOC/JFMqU3iLvScOWMFZMlGv9fPTtpTi+9zy8mayY9ycw42
PsPwXBRMSSCeuqhKUysKP8xxXcsg/A2w5TShECaiEblKTlgfjSbo7y5ao1hZTD7p
cRSEK9j8puMZ4pGaszrEMsxZyQiu+rbsANVpdOOiKwDLdeSzWPfY2C1jZYr1sTRA
B2YHX/bT63aaztQ3yKYqnK4TDYtpb7UB7ewrrxwi+O7y+p4bRCAOx/0zVyzKfn2h
F6Yra4YbfJeKj+Ha22jggWO02ZzMv/eqFn7rCLvJo54gBTGlIj9cD9qE+DowZtAP
KvIko0OkLD50rNChrBB2b+JUbH7137rjWHpKEjhbSRLXbXxGlnePLAv/+B+R15/r
O7Ilk0I1F/xeWjIvK4ZP/mZl7FSUZkPrjeZMRWF2cGesCalvekepnX5UaQRHNldM
EX8WtmI+sfDuj7rUjqipwTWMmKTM4UeSr2KzvJZlF6XE34fwTqBZ+oTlJtOqfb90
JUz/42ntJNH8hCvObC5Q
=Svl1
-----END PGP SIGNATURE-----

--uJWb33pM2TcUAXIl--
