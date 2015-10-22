Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 890DB1A0519
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:59:24 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482762245742.4457778709459;
 Wed, 21 Oct 2015 19:59:22 -0700 (PDT)
Date: Wed, 21 Oct 2015 21:59:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 1/4] Add App Set BMC Global Enables
 ipmi cmd
Message-ID: <20151022025920.GW13316@asimov.austin.ibm.com>
References: <1445397809-31483-1-git-send-email-patches@stwcx.xyz>
 <1445397809-31483-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AHVSF3we4xtO5oi5"
Content-Disposition: inline
In-Reply-To: <1445397809-31483-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151022025920.GW13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:59:25 -0000


--AHVSF3we4xtO5oi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This commit looks fine, but can you put it into a pull request on its
own?  Some of the other commits in this pull request have issues.

On Tue, Oct 20, 2015 at 10:23:26PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> ---
>  apphandler.C | 17 +++++++++++++++++
>  apphandler.h | 16 ++++++++--------
>  2 files changed, 25 insertions(+), 8 deletions(-)
>=20
> diff --git a/apphandler.C b/apphandler.C
> index 9d53552..132f5c6 100755
> --- a/apphandler.C
> +++ b/apphandler.C
> @@ -188,7 +188,18 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netf=
n, ipmi_cmd_t cmd,
>      return rc;
>  }
> =20
> +ipmi_ret_t ipmi_app_set_bmc_global_enables(ipmi_netfn_t netfn, ipmi_cmd_=
t cmd,
> +                             ipmi_request_t request, ipmi_response_t res=
ponse,
> +                             ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
> +{
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +    *data_len =3D 0;
> =20
> +    // Event and message logging enabled by default so return for now
> +    printf("IPMI APP SET BMC GLOBAL ENABLES Ignoring for now\n");
> +
> +    return rc;
> +}
> =20
> =20
> =20
> @@ -231,6 +242,12 @@ void register_netfn_app_functions()
> =20
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD=
_READ_EVENT);
>      ipmi_register_callback(NETFUN_APP, IPMI_CMD_READ_EVENT, NULL, ipmi_a=
pp_read_event);
> +
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP,
> +                                            IPMI_CMD_SET_BMC_GLOBAL_ENAB=
LES);
> +    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_BMC_GLOBAL_ENABLES, =
NULL,
> +                                            ipmi_app_set_bmc_global_enab=
les);
> +
>      return;
>  }
> =20
> diff --git a/apphandler.h b/apphandler.h
> index 2c4ea22..3b8995c 100644
> --- a/apphandler.h
> +++ b/apphandler.h
> @@ -1,16 +1,16 @@
>  #ifndef __HOST_IPMI_APP_HANDLER_H__
>  #define __HOST_IPMI_APP_HANDLER_H__
> =20
> -// IPMI commands for net functions.
> +// IPMI commands for App net functions.
>  enum ipmi_netfn_app_cmds
>  {
> -    // Get capability bits
> -    IPMI_CMD_RESET_WD       =3D 0x22,
> -    IPMI_CMD_SET_WD         =3D 0x24,
> -    IPMI_CMD_GET_CAP_BIT    =3D 0x36,
> -    IPMI_CMD_GET_DEVICE_ID  =3D 0x00,
> -    IPMI_CMD_SET_ACPI       =3D 0x06,
> -    IPMI_CMD_READ_EVENT     =3D 0x35,
> +    IPMI_CMD_GET_DEVICE_ID          =3D 0x01,
> +    IPMI_CMD_SET_ACPI               =3D 0x06,
> +    IPMI_CMD_RESET_WD               =3D 0x22,
> +    IPMI_CMD_SET_WD                 =3D 0x24,
> +    IPMI_CMD_SET_BMC_GLOBAL_ENABLES =3D 0x2E,
> +    IPMI_CMD_READ_EVENT             =3D 0x35,
> +    IPMI_CMD_GET_CAP_BIT            =3D 0x36,
> =20
>  };
> =20
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

--AHVSF3we4xtO5oi5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWKFEIAAoJEKsDR8wtAMEZx9sP/2zPNxw2PK5EBildMYEmS04p
uRqcvLp3uf0Om0rQIw1nHsvS5deFe6XnVbDQR8PGw4743T4TOvaK47w8p658Tn87
U754y+/PQVQtdKFaNMtb48K2rr+0k2sjXD0w24FiQGzFPtfktewCVsStEOYRrqjX
rOzYyMDNTOKaODMTQuEJS5PsA6ASs14z0ilxZ0iKwyQFq+2NIYQ+yHB6YnE/rmU+
vpLTCJUPGzTZeJ97A7Y30feiPB8riukkTHAK5yKlGbTdZaP3kGwEQG/0yvlSd92W
TMgKzUSt+rM35yKYZSPCEkNW/hVqIuDXKaQ0slxABhNU3KemNy7TIoy7oYmkXdVc
YRpPF3rAv3w+ohn2i3kGjMfhuPHmIHv715U6gV61xe8oDUGhSEKxaVOfCkO9DNTz
Jy0vh/dg8p8L/nBdpNLDS+47I/vYF37hrjhPt02S/sKaa7cfr2ULEZfyfYmpK1ca
EoIrbw/rPEX/AHIlfuwWCixx0e/vw2d5MZZbOzABCyal8e/2F7m72U+7YG5vk1Ai
RNvNjtxqOaO7FGTVkTLoICy/3Qna23SRIX71lpHi7eDMwS+MlU2OlRgLLXvt600j
+9nNinRfNsEwUSD+7eVDYOEcS8PNt+4drQbLrrCF1mrDz8X/jzWGCGaDxMhsW8D8
WxjcrCMJ2x2ddsUVIz3P
=ruVu
-----END PGP SIGNATURE-----

--AHVSF3we4xtO5oi5--
