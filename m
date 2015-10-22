Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1385B1A0519
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 14:00:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482851447157.92691336797634;
 Wed, 21 Oct 2015 20:00:51 -0700 (PDT)
Date: Wed, 21 Oct 2015 22:00:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 4/4] Add Get Device UUID
Message-ID: <20151022030049.GX13316@asimov.austin.ibm.com>
References: <1445397809-31483-1-git-send-email-patches@stwcx.xyz>
 <1445397809-31483-5-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sr8SBrQ3fbgntwtR"
Content-Disposition: inline
In-Reply-To: <1445397809-31483-5-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151022030049.GX13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 03:00:55 -0000


--sr8SBrQ3fbgntwtR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This commit looks fine.  Again, should be in its own pull request.

The SEL time ones are the only that seem to have issues.

On Tue, Oct 20, 2015 at 10:23:29PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> ---
>  apphandler.C | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  apphandler.h |  1 +
>  2 files changed, 48 insertions(+)
>=20
> diff --git a/apphandler.C b/apphandler.C
> index 132f5c6..963a3bb 100755
> --- a/apphandler.C
> +++ b/apphandler.C
> @@ -58,6 +58,50 @@ ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, =
ipmi_cmd_t cmd,
>      return rc;
>  }
> =20
> +ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                             ipmi_request_t request, ipmi_response_t res=
ponse,
> +                             ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
> +{
> +    const char  *busname =3D "org.openbmc.control.Chassis";
> +    const char  *objname =3D "/org/openbmc/control/chassis0";
> +    const char  *iface =3D "org.openbmc.control.Chassis";
> +    sd_bus_message *reply =3D NULL, *m =3D NULL;
> +    sd_bus_error error =3D SD_BUS_ERROR_NULL;
> +    int r =3D 0;
> +    char *id =3D NULL;
> +
> +    // Status code.
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +
> +    printf("IPMI GET DEVICE GUID\n");
> +
> +    r =3D sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"g=
etID");
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to add the start method object: %s\n", s=
trerror(-r));
> +        return -1;
> +    }
> +    r =3D sd_bus_call(bus, m, 0, &error, &reply);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to call the start method: %s\n", strerro=
r(-r));
> +        return -1;
> +    }
> +    r =3D sd_bus_message_read(reply, "s", &id);
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
> +        return -1;
> +    }
> +
> +    // Data length
> +    *data_len =3D strlen(id);
> +
> +    // Pack the actual response
> +    memcpy(response, &id, *data_len);
> +
> +    sd_bus_error_free(&error);
> +    sd_bus_message_unref(m);
> +
> +    return rc;
> +}
> =20
>  ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t c=
md,
>                               ipmi_request_t request, ipmi_response_t res=
ponse,
> @@ -237,6 +281,9 @@ void register_netfn_app_functions()
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD=
_GET_DEVICE_ID);
>      ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_ID, NULL, ipm=
i_app_get_device_id);
> =20
> +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD=
_GET_DEVICE_GUID);
> +    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID, NULL, i=
pmi_app_get_device_guid);
> +
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD=
_SET_ACPI);
>      ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_ACPI, NULL, ipmi_app=
_set_acpi_power_state);
> =20
> diff --git a/apphandler.h b/apphandler.h
> index 3b8995c..5ae3c9b 100644
> --- a/apphandler.h
> +++ b/apphandler.h
> @@ -6,6 +6,7 @@ enum ipmi_netfn_app_cmds
>  {
>      IPMI_CMD_GET_DEVICE_ID          =3D 0x01,
>      IPMI_CMD_SET_ACPI               =3D 0x06,
> +    IPMI_CMD_GET_DEVICE_GUID        =3D 0x08,
>      IPMI_CMD_RESET_WD               =3D 0x22,
>      IPMI_CMD_SET_WD                 =3D 0x24,
>      IPMI_CMD_SET_BMC_GLOBAL_ENABLES =3D 0x2E,
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

--sr8SBrQ3fbgntwtR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWKFFhAAoJEKsDR8wtAMEZdAgP/A45FV/K36i/I4dAADHtzyUj
Io8oKEl2o39AUzRe3FlyPiGWJ5IXeTkckALPJOPECLlNX+yUc64+pGDHuFWBNQ7t
YFpe8DhlwP/BpbGpqFypSh4MSs/hg8L/lkmjD0Sv/oXXgf8YXnIIstafsdLVTEO/
9Yp70D1XdiKOI6I8PyNNpJ9HTbFfxB7w5HaG5vfIpQ+kMDk144ZKy9HiY+50EPBA
Y95Uk7tnDaB38So6e4MRxTfhCnyHDSkorg3+wv2k8WFpKPlD7LBkIQP/0fcY/UH7
cJBtB+lNtQ83Avw66/nM2aayRydQcstVON1jn82Qt+8SA6S2mpjEqwrAEKb14G1M
dhrbItEIvgDID6iW+j1NqKSMqGZqyvWnGjL6sPQU00tLlKFu3z8NJN8hHMRrae9T
QhhgkhcmN6WTW5wu58dlQS0+ko3hXjKK1fcJHE0qTf8KKq/Y0HZuAw+n3QJrkw6E
60q08yhosPmFdwVwv/9udEJzEkxS9b14rutZDXEXj+9n6731MjyT+XXOZ0ZCOu3P
s0WN1S6CQ+zZd48ImTL1LA/Z43RBxSCzqqzA9/ccqvS0Nz/tDh/KnFh9/Dsu4ogk
+3WxF3TIVaqaiN3DNcQa1evOAPPUyJLqAQG/AX07ltZ2Fs3pQ581ltznYnHYX6d3
938EDWpQ46M6NbZrOT+r
=fNNX
-----END PGP SIGNATURE-----

--sr8SBrQ3fbgntwtR--
