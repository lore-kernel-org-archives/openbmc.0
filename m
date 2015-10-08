Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 539F41A02BA
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 11:43:47 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444265024520718.8856276992103;
 Wed, 7 Oct 2015 17:43:44 -0700 (PDT)
Date: Wed, 7 Oct 2015 19:43:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 3/3] Patch set-3 for IPMI function
 router
Message-ID: <20151008004342.GE12084@asimov.ibm.com>
References: <1444262669-18679-1-git-send-email-patches@stwcx.xyz>
 <1444262669-18679-4-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline
In-Reply-To: <1444262669-18679-4-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_6
X-ZohoMail-Owner: <20151008004342.GE12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 00:43:47 -0000


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 07:04:29PM -0500, OpenBMC Patches wrote:
> From: vishwabmc <vishwanath@in.ibm.com>
> ---
>  apphandler.H  |  32 ++++++++++++++++++
>  apphandler.h  |  11 ++++++

Why did we end up with a .h and a .H now?

> diff --git a/Makefile b/Makefile
> =20
> +INC_FLAG +=3D $(shell pkg-config --cflags glib-2.0 gio-unix-2.0) -I. -O2=
 --std=3Dgnu++11 -D__IPMI_DEBUG__

Want to remove -D__IPMI_DEBUG__ now?

> +IPMID_PATH =3D -DHOST_IPMI_LIB_PATH=3D\"/usr/lib/host-ipmid/\"=20

IPMID_PATH ?=3D, to allow an override by recipe.

> diff --git a/apphandler.H b/apphandler.H
> new file mode 100644
> index 0000000..fdcd66f
> --- /dev/null
> +++ b/apphandler.H
> @@ -0,0 +1,32 @@
> +#ifndef  __HOST_IPMI_APP_HANDLER_H__
> +#define __HOST_IPMI_APP_HANDLER_H__
> +
> +// These are the command network functions, the response
> +// network functions are the function + 1. So to determine
> +// the proper network function which issued the command
> +// associated with a response, subtract 1.
> +// Note: these are also shifted left to make room for the LUN.
> +enum ipmi_net_fns
> +{
> +    NETFUN_CHASSIS  =3D   (0x00 << 2),
> +    NETFUN_BRIDGE   =3D   (0x02 << 2),
> +    NETFUN_SENSOR   =3D   (0x04 << 2),
> +    NETFUN_APP      =3D   (0x06 << 2),
> +    NETFUN_FIRMWARE =3D   (0x08 << 2),
> +    NETFUN_STORAGE  =3D   (0x0a << 2),
> +    NETFUN_TRANPORT =3D   (0x0c << 2),
> +    NETFUN_GRPEXT   =3D   (0x2c << 2),
> +    NETFUN_NONE     =3D   (0x30 << 2)
> +};
> +
> +// TODO :: As and when we write plugin's these will go into apporpriate
> +// provider space.
> +
> +// IPMI commands for net functions.
> +enum ipmi_netfn_app_cmds
> +{
> +    // Get capability bits
> +    IPMI_CMD_GET_CAP_BIT    =3D 0x36,
> +};
> +
> +#endif

I think you intended to delete this file. 'git rm apphandler.H'.

> diff --git a/ipmid.C b/ipmid.C
> @@ -8,55 +8,56 @@
>      // Extract Handler and context from Map.
> -    ipmi_fn_context_t handler_and_context;
> +    //ipmi_fn_context_t handler_and_context;

Remove dead code.

> +    // Creating a pointer type casted to char* to make sure we advance 1=
 byte
> +    // when we advance pointer to next's address. advancing void * would=
 not
> +    // make sense.
> +    char *resp =3D (char *)response;
> =20
> -    rc =3D (handler_and_context.first) (netfn, cmd, request, response,
> +    // Response message from the plugin goes into a byte post the base r=
esponse
> +    rc =3D (handler_and_context.first) (netfn, cmd, request, resp + IPMI=
_CC_LEN,
>                                        data_len, handler_and_context.seco=
nd);

Would prefer the following instead of the '+ IPMI_CC_LEN' in the
function parameter:
    char *respo =3D &((char *)response)[IPMI_CC_LEN];


> diff --git a/ipmidcommon.H b/ipmidcommon.H
> new file mode 100755
> index 0000000..9fa2284
> --- /dev/null
> +++ b/ipmidcommon.H
> @@ -0,0 +1,63 @@
> +#ifndef __HOST_IPMID_IPMI_COMMON_H__
> +#define __HOST_IPMID_IPMI_COMMON_H__
> +
> +// IPMI Net Function number as specified by IPMI V2.0 spec.
> +// Example :=20
> +// NETFUN_APP      =3D   (0x06 << 2),
> +typedef unsigned char   ipmi_netfn_t;
> +
> +// IPMI Command for a Net Function number as specified by IPMI V2.0 spec.
> +typedef unsigned char   ipmi_cmd_t;
> +
> +// Buffer containing data from sender of netfn and command as part of re=
quest
> +typedef void*           ipmi_request_t;
> +
> +// This is the response buffer that the provider of [netfn,cmd] will sen=
d back
> +// to the caller. Provider will allocate the memory inside the handler a=
nd then
> +// will do a memcpy to this response buffer and also will set the data s=
ize
> +// parameter to the size of the buffer.
> +// EXAMPLE :
> +// unsigned char str[] =3D {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
> +// *data_len =3D 6;
> +// memcpy(response, &str, *data_len);
> +typedef void*           ipmi_response_t;
> +
> +// This buffer contains any *user specific* data that is of interest onl=
y to the
> +// plugin. For a ipmi function router, this data is opaque. At the time =
of
> +// registering the plugin handlers, plugin may optionally allocate a mem=
ory and
> +// fill in whatever needed that will be of help during the actual handli=
ng of
> +// command. IPMID will just pass the netfn, cmd and also this data to pl=
ugins
> +// during the command handler invocation.
> +typedef void*           ipmi_context_t;
> +
> +// Length of request / response buffer depending on whether the data is a
> +// request or a response from a plugin handler.
> +typedef unsigned int*   ipmi_data_len_t;
> +
> +// This is the callback handler that the plugin registers with IPMID. IP=
MI
> +// function router will then make a call to this callback handler with t=
he
> +// necessary arguments of netfn, cmd, request, response, size and contex=
t.
> +typedef int (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
> +                                ipmi_response_t, ipmi_data_len_t, ipmi_c=
ontext_t);
> +
> +// This is the constructor function that is called into by each plugin h=
andlers.
> +// When ipmi sets up the callback handlers, a call is made to this with
> +// information of netfn, cmd, callback handler pointer and context data.
> +void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, ipmi_context_t, ip=
mid_callback_t);
> +
> +// IPMI commands for net functions. Since this is to be used both by the=
 ipmi
> +// function router and also the callback handler registration function, =
its put
> +// in this .H file.
> +enum ipmi_netfn_wild_card_cmd
> +{
> +    IPMI_CMD_WILDCARD       =3D 0xFF,
> +};
> +
> +// Return codes from a IPMI operation as needed by IPMI V2.0 spec.
> +enum ipmi_return_codes
> +{
> +    CC_OK =3D 0x00,
> +    CC_INVALID =3D 0xC1
> +};
> +
> +#endif

Intended to delete this file too?

--=20
Patrick Williams

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWFbw+AAoJEKsDR8wtAMEZ1A0P/3p5wwmMYAzF1NuL3D46KDc6
5cMRQU/zERzToyPDCOu+c6x9miYkbDRmiJU/AfTsOV/Kw+KUwF2dbZ0ID6gmOGuo
mxHyu+DhoVURurQQmNVAf7MlkaG4dUqgvSBpmPuU2qy93pMp8VPuji+T4T/W4oVo
YdiBKPRGMnMkaY+yUQmxWrBYK9fyypa3XSQrqBJ5wxEoaoPeWKLqt/xEzPm8+imP
k0Glo9SgXFeQdZ7tPUJRbdCisiIwv7K0pBYMcytQJCZ43wITL0UQaS4383DvgajT
uffVjUhz7QhQMzVI+xmziHBC2MvRUh4atsdU1OWdrvKHN1sK8AWGCaL65jTHVlvJ
pgMNLdLo+amo08pqn+sJgxG0qNUkhZooht4FQiYmkHLpyU+5JIYUuWvh661RuFt4
77XSSdw2vj2jVzCeuj4CkE2uuGfFdtkRPb5uB1dp+vbQRWlsviNZm/BOUYXMxwZn
DSrELu+V5/Ry4rm/ZDr/3VjiIuK1ENPEDS+/VC1mjlVlyqADX3wEPzKDNidYk2Yl
C12c0l3Y3oLTKAGoXLJCNrvSFL90mUjtQueaYQpk8TMZ85K+LL5WjlVZ2St1/ZpG
VTCVq9GHnf77vx/S0L4cvvCztGRO8uNx3KO0OiKpcY9hEjnQRX1h8Q8nTyTbTh2e
1jHwSjqPRob2oSKqQx3x
=XM1G
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
