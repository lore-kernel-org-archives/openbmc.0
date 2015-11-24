Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CFDFE1A004B
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 02:36:58 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1448379412137639.6819641775467;
 Tue, 24 Nov 2015 07:36:52 -0800 (PST)
Date: Tue, 24 Nov 2015 09:36:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI soft power off
Message-ID: <20151124153650.GC19499@asimov.austin.ibm.com>
References: <1448129424-11374-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448129424-11374-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline
In-Reply-To: <1448129424-11374-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <20151124153650.GC19499@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 15:37:00 -0000


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2015 at 01:10:24PM -0500, OpenBMC Patches wrote:
> From: vishwa <vishwanath@in.ibm.com>
> diff --git a/ipmid-api.h b/ipmid-api.h
> index 34d3bbe..952dd3f 100644
> --- a/ipmid-api.h
> +++ b/ipmid-api.h
> @@ -53,7 +53,7 @@ typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ip=
mi_cmd_t, ipmi_request_t,
>  // information of netfn, cmd, callback handler pointer and context data.
>  // Making this a extern "C" so that plugin libraries written in C can al=
so use
>  // it.
> -extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,=20
> +extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
>                                         ipmi_context_t, ipmid_callback_t);
> =20
>  // These are the command network functions, the response
> @@ -94,5 +94,5 @@ enum ipmi_return_codes
>      IPMI_CC_UNSPECIFIED_ERROR =3D 0xFF,
>  };
> =20
> -sd_bus *ipmid_get_sd_bus_connection(void);
> +extern "C" sd_bus* ipmid_get_sd_bus_connection(void);
>  #endif

These shouldn't just have 'extern "C"' otherwise we can't pull the
header file into C code because this isn't valid syntax (which defeats
the purpose of making the functions extern "C").

    #ifdef __cplusplus
    extern "C"
    #endif

> diff --git a/ipmid.C b/ipmid.C
> index 6b1eacc..440705c 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -40,7 +40,6 @@ typedef std::pair<ipmid_callback_t, ipmi_context_t> ipm=
i_fn_context_t;
>  std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
> =20
> =20
> -
>  #ifndef HEXDUMP_COLS
>  #define HEXDUMP_COLS 16
>  #endif
> @@ -418,6 +417,10 @@ int main(int argc, char *argv[])
>      // Register all the handlers that provider implementation to IPMI co=
mmands.
>      ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
> =20
> +	// Start the Host Services Dbus Objects
> +	start_host_service(bus, slot);
> +

I'm disappointed that we did not make this any sort of plugin
architecture.  We did all the work for the other ipmi messages, so it
seems odd to not do it for this.  Someone could remove the ipmi handler
for the host soft power-off, but now they cannot remove the dbus
handler.  The dbus handler is effectively an OEM implementation so at
some point we need to figure out how to move this into a plugin.

--=20
Patrick Williams

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWVIQSAAoJEKsDR8wtAMEZHGsP/j1tyBFiOgHiNipdz0JVLwVN
GDyW32siKWwV7CxRuAH0TfvHCc7YWYGj3J91WB5ZsM0jAYHTM6fhugJHO4NqJHO0
aMX38LDcCo/TwKb2BeEFqFs1IqzKBxrCKJs+kFj5E9hD4wPQu9XCLfbtJsCxueVI
yFvNLQbANECLbPYedLhEg5TYJ7o21OZkA1VjzQ0Kw3i1nnB5sC7zfKQZsOz7gQ31
7DOmor3U201nOR5qnHOHerViOVT/GYYAmO1h3SdMqYBEWpy2kZF2KX5ZbefnvpD1
vWKTFtUcUfhs50/Nh1+ZN/4rwYjYUueUru2P+aKtmZNacTXN0736R91X/r5TxSvy
Z9L1hkYJO/zMtcye2mkAXRq6gwC+d6y1zytmFt1l3FBVXeQAfgT38PHoAhAu1l6S
WZytodZVQsgSkM1acDZhWv7D1Ow2TscxJY+MaijDMVZLUeQQUgIgNmT+PNOVtB+p
irPNZccILjA3zGGLKEDkw83myPx6EkHyjYIVewX0cL+MA8chQzLOseDXaOGYmYtf
KMrgrpqfb+lyoZGpJeK2iNopAVLnsdwMJoNEbY1Z3J+koN38/+fjFp7fqcXaaKsT
0mFi+1Sf8ilSgKxGJ5BvohNP5Nwm7w7YexEvx6ONnQq5L6y29toCBIH3fQdOuUqi
blIl0APMFBZHG+nTPdyX
=Vsiu
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
