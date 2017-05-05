Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKHYw25PqzDqCL
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 02:35:16 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494002110391534.6257010811812;
 Fri, 5 May 2017 09:35:10 -0700 (PDT)
Date: Fri, 5 May 2017 11:35:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.7] arm: dts: aspeed: garrison: Enable wdt2
Message-ID: <20170505163509.GC25937@heinlein.lan>
References: <1493800430-5662-1-git-send-email-mine260309@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <1493800430-5662-1-git-send-email-mine260309@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 May 2017 16:35:17 -0000


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Lei,

Please make sure these patches are sent for 4.10 as well.  I don't see a
pressing need to pick this up for 4.7, so we will just wait for the move
to 4.10 to get this fix.

On Wed, May 03, 2017 at 04:33:50PM +0800, Lei YU wrote:
> Garrison enabled WDT2 by pulling up GPIOAA7.
> Enable wdt2 in dts, otherwise it hangs after WDT2 times out.
>=20
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-garrison.dts
> index 3921bb3..b24d1d1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -116,3 +116,7 @@
>  &vuart {
>  	status =3D "okay";
>  };
> +
> +&wdt2 {
> +	status =3D "okay";
> +};
> --=20
> 1.9.1
>=20

--=20
Patrick Williams

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkMqb0ACgkQqwNHzC0A
wRk8Xg/8ClQ2q6mYniTLEIR47+jFL5BrxS2tFYO2zaIqI+Gr7LOUopN/QiVPP9ky
zOlrdLVFS5FlFda/YoUg1XZWX8ie7vgA4Ce9dIquq6D6X4kFzdnlHsfu9G4v5hNm
b93u4j3UJ5Wu4tkwEyRb7NOD067q3O3fdOl7FbsJE29m6+ZURkkJacul2XDYB9Io
C0LhVPgO09aDkznlRDsih2d3xL3JyjiXx4TrfBLSyxav6S1nkflaFMxNl41cjtvx
SDeXbc+qWae4X82hNge5GN5Ygwi7wJMAgGZGbPEzdLh4P3YctyZkS/TOpjfVnkIA
v+6oQhw8UrSNM0bhUrKjn7vMDYnA5R2rIo7+BG3GodSESNZJovTyjww56E4PeI3b
YtcP8OmXLdsqRTVOmNxvMYzNB+6zhijnI5d0pBL8ScKWAz8W5kydu9pWjgFvYFyV
k0VmiGGYw1miGtyFGgNvdkwrPPT2ZPZK5tNn6rh7pKjo0As4XHkCIzwwfc7ZnNWy
PgjjFQKI8eeGiH73E7CVkK170sBNwc+Wg+mc/F5Xlua+Unfhwu+mYU1vCTmQwiMl
Dol4e0cScs2T/NIGuGMNiDvQzhx64xnASi8/40813A/qat0p7SW0fxYe4H2W1rwd
isaTB+YEdHzaD7jr+gMvXsVB5yV4wybbnMe/6NpFBY3dZ/PPmYU=
=LVz3
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
