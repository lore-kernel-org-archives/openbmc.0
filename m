Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 76A6C1A0143
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 23:29:15 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446380952451219.2220794383511;
 Sun, 1 Nov 2015 04:29:12 -0800 (PST)
Date: Sun, 1 Nov 2015 06:29:11 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser] keeping fru files forever
Message-ID: <20151101122911.GP31364@asimov.austin.ibm.com>
References: <1446380518-18602-1-git-send-email-patches@stwcx.xyz>
 <1446380518-18602-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aC33ObtQAkNdOZ6b"
Content-Disposition: inline
In-Reply-To: <1446380518-18602-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_1
X-ZohoMail-Owner: <20151101122911.GP31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 12:29:16 -0000


--aC33ObtQAkNdOZ6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2015 at 06:21:58AM -0600, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> added correct ipmi response buffer
> cleaned up a incorrect rc
> ---
>  frup.h         |  7 ++++++-
>  writefrudata.C | 45 ++++++++++++++++++++-------------------------
>  2 files changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/frup.h b/frup.h
> index 3286260..ef473a8 100644
> --- a/frup.h
> +++ b/frup.h
> @@ -5,7 +5,12 @@
> =20
>  /* Parse an IPMI write fru data message into a dictionary containing nam=
e value pair of VPD entries.*/
>  int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
> -int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_=
t len, sd_bus_message* vpdtbl);
> +
> +extern "C" {
> +    int parse_fru_area (const uint8_t area, const void* msgbuf, const ui=
nt8_t len, sd_bus_message* vpdtbl);
> +};
> +
> +

This is C++ syntax you just added in a C file.  We should wrap both
prototypes in:

    #ifdef __cplusplus
    extern "C"
    {
    #endef
    ...
    #ifdef __cplusplus
    }
    #endef

> =20
>  enum ipmi_fru_area_type
>  {
> diff --git a/writefrudata.C b/writefrudata.C
> index 30ba39a..69bbb47 100644
> --- a/writefrudata.C
> +++ b/writefrudata.C
> @@ -1,4 +1,4 @@
> -#include <ipmid-api.h>
> +#include <host-ipmid/ipmid-api.h>

Ah, good catch.  I think they had a -I. in the makefile and they were
puting ipmid-api.h into the local directory because the SDK wasn't set
up right.

>  #include <vector>
>  #include <stdlib.h>
>  #include <dlfcn.h>
> @@ -7,6 +7,8 @@
>  #include "frup.h"
>  #include "writefrudata.H"
>  #include <systemd/sd-bus.h>
> +#include <unistd.h>
> +
> =20
>  void register_netfn_storage_write_fru() __attribute__((constructor));
> =20
> @@ -481,15 +483,11 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t=
 netfn, ipmi_cmd_t cmd,
>      uint8_t offset =3D 0;
>      uint16_t len =3D 0;
>      ipmi_ret_t rc =3D IPMI_CC_INVALID;
> -    int validate_rc =3D 0;
>      const char *mode =3D NULL;
> =20
>      // From the payload, extract the header that has fruid and the offse=
ts
>      write_fru_data_t *reqptr =3D (write_fru_data_t*)request;
> =20
> -    // There is no response data for this command.
> -    *data_len =3D 0;
> -
>      // Maintaining a temporary file to pump the data
>      sprintf(fru_file_name, "%s%02x", "/tmp/ipmifru", reqptr->frunum);
> =20
> @@ -500,25 +498,23 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t=
 netfn, ipmi_cmd_t cmd,
>      // the data (so didn't need to worry about word/byte boundaries)
>      // hence the -1...
>      len =3D ((uint16_t)*data_len) - (sizeof(write_fru_data_t)-1);
> +
> +    // On error there is no response data for this command.
> +    *data_len =3D 0;
>     =20
>  #ifdef __IPMI__DEBUG__
>      printf("IPMI WRITE-FRU-DATA for [%s]  Offset =3D [%d] Length =3D [%d=
]\n",
>              fru_file_name, offset, len);
>  #endif
> =20
> -    // offset would be zero if the cmd payload is targeting a new fru
> -    if (offset =3D=3D 0)
> -    {
> +
> +    if( access( fru_file_name, F_OK ) =3D=3D -1 ) {
>          mode =3D "wb";
> -    }=20
> -    else=20
> -    {
> -        // offset would be non-zero if the cmd payload is continued for =
prev
> -        // fru
> +    } else {
>          mode =3D "rb+";
>      }
> =20
> -    if ((fp =3D fopen(fru_file_name, mode)) !=3D NULL)=20
> +    if ((fp =3D fopen(fru_file_name, mode)) !=3D NULL)
>      {
>          if(fseek(fp, offset, SEEK_SET))
>          {
> @@ -541,18 +537,17 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t=
 netfn, ipmi_cmd_t cmd,
>          fprintf(stderr, "Error trying to write to fru file %s\n",fru_fil=
e_name);
>          return rc;
>      }
> -   =20
> -    // We received some bytes. It may be full or partial. Run a validato=
r.
> -    validate_rc =3D ipmi_validate_fru_area(reqptr->frunum, fru_file_name=
);
> -    if(validate_rc !=3D -1)
> -    {
> -        // Success validating _and_ updating the Inventory. We no longer=
 need
> -        // this file.
> -        remove(fru_file_name);
> -    }
> =20
> -    // convert the rc per ipmi spec  =20
> -    rc =3D (validate_rc !=3D -1) ? IPMI_CC_OK : IPMI_CC_INVALID;
> +
> +    // If we got here then set the resonse byte
> +    // to the number of bytes written
> +    memcpy(response, &len, 1);
> +    *data_len =3D 1;
> +    rc =3D IPMI_CC_OK;
> +
> +    // We received some bytes. It may be full or partial. Send a valid
> +    // FRU file to the inventory controller on DBus for the correct numb=
er
> +    ipmi_validate_fru_area(reqptr->frunum, fru_file_name);
> =20
>      return rc;
>  }
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

--aC33ObtQAkNdOZ6b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWNgWXAAoJEKsDR8wtAMEZnRUP/1aEOpq8tNVMxBLHB/GGK+Ak
3ii84ClkLiswuRk2HjyfvLYbKcO4kLQooPbhhTFRoVPjW3NylTr4YRFd+sRvxzPD
3/deGPW5ss61EbjyojjeSnzqDaRkracczHMuBcjeoudbZKKiI8NW/e2EJStZ01NY
FECaWUduN1zXC1jDFXJNDSRlnkUgfLwHQ3W7277M/NqzuPpZ0yRzimUKmyuYgh2O
7cDZVq8rVoUIdvR85TyZTJARmErBB6B/wKLNrpxVrinqplfKhGDlrK/Z1jU3mpss
i4tgYHyDk5pqjz1cC9zfM/3e0BPyH8l0mSCDg/WpgHk4Oc8UskhGRSM8F7L+Df9h
VR+h1Jqly55jErwjH4qd8QGfr7/MwojXAh390qj5cX3CM7ZZl0BUo+OdnWaN5crQ
rxgJ8bqdLHZyL6LCimTgi2sQ8k7lHDlKBJorsfnzGLnfm7Mey61nFd/R/SygFwY7
lBxT/V+3Hp98q0XGi8Pe5nSP7bwa4KwtrwKyYZ0WOuue2+MH9/NvG7ZvXR/RLPf8
8z/+wpmEpZdiLx6PtA3fXsrBRpmdqrxX1HOzGjWLKUywBS/dpDn+QAQrGJIjEHwJ
YxY+87azBB7OVlf5Zi7To83Fgv6DgS+ofzvVrck4gWo7k3T9aRA1MHBtXNTY53cJ
bySMe6yDb74Pt/H/2fqW
=IMDw
-----END PGP SIGNATURE-----

--aC33ObtQAkNdOZ6b--
