Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CA2071A0066
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 09:14:07 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 144831684353727.313640245063993;
 Mon, 23 Nov 2015 14:14:03 -0800 (PST)
Date: Mon, 23 Nov 2015 16:14:02 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v2] eeprom read CLI
Message-ID: <20151123221402.GA19499@asimov.austin.ibm.com>
References: <1448035211-29526-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448035211-29526-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <1448035211-29526-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <20151123221402.GA19499@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 22:14:09 -0000


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 11:00:11AM -0500, OpenBMC Patches wrote:
> From: vishwa <vishwanath@in.ibm.com>
>  define __BUILD_EXE
>  $1 : $$($1_OBJS) $$(LIBS)
> -		$$(LINK.cpp) -o $$@ $$^ $(call __PKG_CONFIG,$($1_NEEDED),--libs)
> +		$$(LINK.cpp) -o $$@ $$^ $(call __PKG_CONFIG,$($1_NEEDED),--libs)=20

Remove whitespace change.

>  define __BUILD_LIB
>  $1 : $$($1_OBJS)
> -		$$(LINK.cpp) -shared -o $$@ $$^ $(call __PKG_CONFIG,$($1_NEEDED),--lib=
s)
> +		$$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$($1_E=
XTRA_LIBS)) $(call __PKG_CONFIG,$($1_NEEDED),--libs)=20

This is causing $1_EXTRA_LIBS to be added as an argument directly.
   1) You need to add the $1_EXTRA_LIBS to the dependency above.
       $1 : $$($1_OBJS) $$($1_EXTRA_LIBS)
   2) You should be using -l<library> instead so that it continues to be
      dynamically linked.

> diff --git a/readeeprom.C b/readeeprom.C
> new file mode 100644
> index 0000000..27adfa1
> --- /dev/null
> +++ b/readeeprom.C
> @@ -0,0 +1,73 @@
> +#include <iostream>
> +#include <memory>
> +#include "argument.H"
> +#include "writefrudata.H"
> +
> +// FRU ID of VPD contaied in BMC accessible EEPROM
> +#define BARRELEYE_IO_BOARD	 	 64

There should not be any system-specific #define in this program.  Get it
passed as an argument if you need it.

> +//----------------------------------------------------------------------=
----
> +// This gets called by udev monitor soon after seeing hog plugs for EEPR=
OMS.=20
> +//----------------------------------------------------------------------=
----
> +int main(int argc, char **argv)
> +{
> +	int rc =3D 0;
> +
> +	// Handle to per process system bus
> +	sd_bus *bus_type =3D NULL;
> +
> +	// Read the arguments.
> +	auto cli_options =3D std::make_unique<ArgumentParser>(argc, argv);
> +=09
> +	// Parse out each argument.
> +	auto eeprom_file =3D (*cli_options)["eeprom"];
> +    if (eeprom_file =3D=3D ArgumentParser::empty_string)
> +    {
> +		// User has not passed in the appropriate argument value
> +        exit_with_error("eeprom data not found.", argv);
> +    }
> +
> +	auto fruid_str =3D (*cli_options)["fruid"];
> +    if (eeprom_file =3D=3D ArgumentParser::empty_string)
> +    {
> +		// User has not passed in the appropriate argument value
> +        exit_with_error("fruid data not found.", argv);
> +    }

Please use consistent space indentation (and no tab characters).

> +	// Extract the fruid
> +	uint8_t fruid =3D strtol(fruid_str.c_str(), NULL, 16);
> +	if(fruid =3D=3D 0)
> +	{
> +		// default to hardcoded 64
> +		fruid =3D BARRELEYE_IO_BOARD;
> +	}

It doesn't make much sense to me that you have it above as an error if
they don't pass it in but not an error here if they give you a string
instead of an integer.  Just make it all an error and forget about a
default that only works on one particular machine.

> -int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_=
t *fru_data)
> +int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_=
t *fru_data,=20
> +                                       sd_bus *bus_type)
>  {
>      // Used for generic checksum calculation
>      uint8_t checksum =3D 0;
> @@ -249,7 +244,7 @@ int ipmi_validate_and_update_inventory(const uint8_t =
fruid, const uint8_t *fru_d
>      uint8_t fru_entry;
> =20
>      // A generic offset locator for any FRU record.
> -    uint8_t area_offset =3D 0;
> +    uint16_t area_offset =3D 0;

Any reason to not just use size_t?

--=20
Patrick Williams

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWU4+pAAoJEKsDR8wtAMEZxUEP/jxJ/x5s3v3CfAhEz65Zij8i
bN2iP2LQ2t0xLUrZPxkYyOTJ2kozMfhMT75ROmcMAuduIH7rZO/RymAoaST0j0Z2
bwqiJ+Li0RnyRWObvQ1yfACJqW2oD/WR5lEP7K6jiv9kpmqKnOUw7A0KbViK2etn
vkqIb/wopCJ28tUYJEdxCtUX2dqf2LMcj+TqnbWC0kiNOKPZU8DwitiVw3tT2WcW
bfQh2PG6YvcZsjJRJTA9s1t0K+j19CDffkXQ0jjCDO9OYlniJGKuPA09U7vd8zGQ
Yc3tMjisKaUphHYEm1EdPti3WiTfYHCwXYdQSm0b6JPsrbc++LIeUQqt3TuCNgQr
tFiX9b1gX7seLCChotX79qwg6qqUCj3PRY1V8btWfqg70S33PGPQV1h9BS3E93c0
KfZ7g9x5KaVRsJyccSHmma1dNp9j5IQzfG4t1OZdX8XIEdB4bvUSRuHIecWbL+7v
KIHTKCAXLi5hu37lRVqGo6ieZu7dICJfwHXNxeO6O4qZsZkFlYN5WxG3DbVA0F8m
D43RfctJrKXgFqr9sBOAid5v70WbpRzXt8RxVWP1IAIX0+r7C+4sfxLWz0jfsrF6
HiuzUObICg15qnQ3ERc3V5uD77Ons4JjkcKReZX8rlbeLLNne7rZXtPpj6WNnGTr
4CetEXJzJs8ZAzTakz4H
=UsSn
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
