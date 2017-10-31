Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="o5mATzL5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ABK1GP/r"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQsBV4Bf9zDqwS
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 11:08:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B45220B6A;
 Mon, 30 Oct 2017 20:08:16 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 30 Oct 2017 20:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=MwBcu/OeFMPLZgbynUa95kDe8BCuysXmVAR+JAS3Bts=; b=o5mATzL5
 6dxBvGmxLhiRAsBNfW8DVnEynORlAEAeYIfgI93F8kmc8xmqKDTiqlwbDf9AnVek
 VF47DRxN9xfYz7OuUN5CV5YgnqrDSCrIPBaTyVwQkQBw2RSx3i0Cj4pAfDNR2Obg
 vUECMwfNxQyOnFw+xSv7RB+0LJDK0gott4z5KhaP43C9Sk+tJ+gdDUjwSOoQJv46
 tzgFdcA8nqoC45ifZ+UeLRS0r3GSMzSF+3gcWfkz0uM6g+KGHPxRqkwPTxwTlPEe
 8jrEAVGYSb8u4cGhJpzIjo8gaIWlV3pUOtRtDYzk04cTH3bUSy/TrCkgjJo78zYo
 XnjE/P+S+5Ju6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=MwBcu/OeFMPLZgbynUa95kDe8BCuy
 sXmVAR+JAS3Bts=; b=ABK1GP/r/BrYhclfSC0G5IV+96xuITOKiaBOPMJx4/1Ar
 ttvYgdG/rdCEsRsagirQAdtnfeglIGmlngf48k4OQ3EFwnDDibKUODgJa8vtM8op
 aALsks/vC1dvT81ujzBrG0jAF3OuXCaPWfakH/sP6QRUuuK3dSeGJQy0yDxMeZTV
 YKAlmJ9vGbgFX4/UTb71vXfuwWuTQm1pN9HF3qpM99GS1JZB67xDbtl3PnMIGN7A
 a2czPppw43Au2vS6kunz+6zYfxn4+6nwv/jI3sFp+kypZ3zElcHKJ7RaCJTecCFx
 7sk3AZmaix4jzPl9ZxBCnTfdg1kbnrAmhFM9z2/Vw==
X-ME-Sender: <xms:8L73WVmMoYZNEtJI7NsecY6XaosNWTq79o1rDf63La2LWuAlinr-xw>
Received: from keelia (unknown [45.124.203.19])
 by mail.messagingengine.com (Postfix) with ESMTPA id 092C0240B2;
 Mon, 30 Oct 2017 20:08:14 -0400 (EDT)
Message-ID: <1509408490.13477.29.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: Add aspeed
 fan tach
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 31 Oct 2017 10:38:10 +1030
In-Reply-To: <1509355284-28799-1-git-send-email-mine260309@gmail.com>
References: <1509355284-28799-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-0+AW2vR+tp/RCrQpGKDV"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 00:08:19 -0000


--=-0+AW2vR+tp/RCrQpGKDV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-30 at 17:21 +0800, Lei YU wrote:
> Romulus uses aspeed fan tach instead of max31785:
> * Pass1's max31785 is always reset by CPLD;
> * Pass2's max31785 is not connected.
>=C2=A0
> The board has 7 fan taches connected to BMC_FANTACH8~14,
> and controlled by two PWMs.
>=C2=A0
> This commit also change "enabled" to "okay" for the i2c devices.

I would prefer unrelated changes like the I2C fix are split out into a sepa=
rate
commit in the future. Don't worry about it now though.

Cheers,

Andrew

>=C2=A0
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 138 +++++++++-------=
-----------
> =C2=A01 file changed, 47 insertions(+), 91 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index dea556f..86f7927 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -68,6 +68,47 @@
> =C2=A0
> =C2=A0#include "ibm-power9-cfam.dtsi"
> =C2=A0
> +&pwm_tacho {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +	fan@0 {
> +		reg =3D <0x00>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x08>;
> +	};
> +
> +	fan@1 {
> +		reg =3D <0x00>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x09>;
> +	};
> +
> +	fan@2 {
> +		reg =3D <0x01>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0a>;
> +	};
> +
> +	fan@3 {
> +		reg =3D <0x01>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0b>;
> +	};
> +
> +	fan@4 {
> +		reg =3D <0x00>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0c>;
> +	};
> +
> +	fan@5 {
> +		reg =3D <0x00>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0d>;
> +	};
> +
> +	fan@6 {
> +		reg =3D <0x01>;
> +		aspeed,fan-tach-ch =3D /bits/ 8 <0x0e>;
> +	};
> +};
> +
> =C2=A0&fmc {
> =C2=A0	status =3D "okay";
> =C2=A0	flash@0 {
> @@ -132,7 +173,7 @@
> =C2=A0};
> =C2=A0
> =C2=A0&i2c1 {
> -	status =3D "enabled";
> +	status =3D "okay";
> =C2=A0
> =C2=A0	/* CPU1 */
> =C2=A0};
> @@ -173,27 +214,27 @@
> =C2=A0
> =C2=A0&i2c6 {
> =C2=A0	/* PCIe slot 1 (x8) */
> -	status =3D "enabled";
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c7 {
> =C2=A0	/* PCIe slot 2 (x16) */
> -	status =3D "enabled";
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c8 {
> =C2=A0	/* PCIe slot 3 (x16) */
> -	status =3D "enabled";
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c9 {
> =C2=A0	/* PCIe slot 4 (x16) */
> -	status =3D "enabled";
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c10 {
> =C2=A0	/* PCIe slot 5 (x8) */
> -	status =3D "enabled";
> +	status =3D "okay";
> =C2=A0};
> =C2=A0
> =C2=A0&i2c11 {
> @@ -211,91 +252,6 @@
> =C2=A0	status =3D "okay";
> =C2=A0
> =C2=A0	/* Fan Controller */
> -	max31785@52 {
> -		compatible =3D "maxim,max31785";
> -		reg =3D <0x52>;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		fan@0 {
> -			compatible =3D "pmbus-fan";
> -			reg =3D <0>;
> -			tach-pulses =3D <2>;
> -			maxim,fan-rotor-input =3D "tach";
> -			maxim,fan-pwm-freq =3D <25000>;
> -			maxim,fan-dual-tach;
> -			maxim,fan-no-watchdog;
> -			maxim,fan-no-fault-ramp;
> -			maxim,fan-ramp =3D <2>;
> -			maxim,fan-fault-pin-mon;
> -		};
> -
> -		fan@1 {
> -			compatible =3D "pmbus-fan";
> -			reg =3D <1>;
> -			tach-pulses =3D <2>;
> -			maxim,fan-rotor-input =3D "tach";
> -			maxim,fan-pwm-freq =3D <25000>;
> -			maxim,fan-dual-tach;
> -			maxim,fan-no-watchdog;
> -			maxim,fan-no-fault-ramp;
> -			maxim,fan-ramp =3D <2>;
> -			maxim,fan-fault-pin-mon;
> -		};
> -
> -		fan@2 {
> -			compatible =3D "pmbus-fan";
> -			reg =3D <2>;
> -			tach-pulses =3D <2>;
> -			maxim,fan-rotor-input =3D "tach";
> -			maxim,fan-pwm-freq =3D <25000>;
> -			maxim,fan-dual-tach;
> -			maxim,fan-no-watchdog;
> -			maxim,fan-no-fault-ramp;
> -			maxim,fan-ramp =3D <2>;
> -			maxim,fan-fault-pin-mon;
> -		};
> -
> -		fan@3 {
> -			compatible =3D "pmbus-fan";
> -			reg =3D <3>;
> -			tach-pulses =3D <2>;
> -			maxim,fan-rotor-input =3D "tach";
> -			maxim,fan-pwm-freq =3D <25000>;
> -			maxim,fan-dual-tach;
> -			maxim,fan-no-watchdog;
> -			maxim,fan-no-fault-ramp;
> -			maxim,fan-ramp =3D <2>;
> -			maxim,fan-fault-pin-mon;
> -		};
> -
> -		fan@4 {
> -			compatible =3D "pmbus-fan";
> -			reg =3D <4>;
> -			tach-pulses =3D <2>;
> -			maxim,fan-rotor-input =3D "tach";
> -			maxim,fan-pwm-freq =3D <25000>;
> -			maxim,fan-dual-tach;
> -			maxim,fan-no-watchdog;
> -			maxim,fan-no-fault-ramp;
> -			maxim,fan-ramp =3D <2>;
> -			maxim,fan-fault-pin-mon;
> -		};
> -
> -		fan@5 {
> -			compatible =3D "pmbus-fan";
> -			reg =3D <5>;
> -			tach-pulses =3D <2>;
> -			maxim,fan-rotor-input =3D "tach";
> -			maxim,fan-pwm-freq =3D <25000>;
> -			maxim,fan-dual-tach;
> -			maxim,fan-no-watchdog;
> -			maxim,fan-no-fault-ramp;
> -			maxim,fan-ramp =3D <2>;
> -			maxim,fan-fault-pin-mon;
> -		};
> -	};
> -
> =C2=A0	/* CPLD */
> =C2=A0	/* Power Supply */
> =C2=A0	/* Temp Sensor */
--=-0+AW2vR+tp/RCrQpGKDV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ977qAAoJEJ0dnzgO5LT5FyQQAKXwiurqenLBQ5SFVAk5ttqt
sbP+2VhL8o1EHWmcsA3PJ1ydlzNFBJEWZo5rd4Tm3HxFDCunMTYacUnnkclm2COC
rWMI1FyMSLncOlm5/gtXs5IV7gld4I06AGu/7K+eRlx3dNSwURlX+sePyv8mRh5M
3BQg0rVzpZ4JYVjyrGcCyzZ/EA/SAXFLDMBjkcXvcP7KViwiqczFeo3pC3bng6nc
ekWx4hyxAIzzmo0cqwqG/a1A46XhpZr5a2S9o2xyysliJ6sDG52QCDKGEZaWzkup
WsgP4/cI9Hr+qu6NrxkOZSYo1+uVwlbT3pCqztlmIMQ/VRFWjfkjOAlriV2x2yyG
dnjz5Ueym9NQgWTufWjoqU1dpP7nV25bVD7AeDpdRv3hKXewRLjgjjSSVSQbmE96
qfX5DJIKo2a2C8FLhTNx4dYS5bOFpQgJKaQsTD4Uqq37HCzleK8Spu25Gi08y6si
H3UYqx5yP3qNXBboU9LDVA0m+ceJCF+BazrP/qIx9DeuvPZM+YClGuWUxFtbxzBt
gXZiEzugUCIDZVzQD1aNN3s2FSlwE5pbsqpWuIZ+w1jQGptbxdWILbqb2aSJ7nzF
3IwziOXhZfn4tfK6RWWJ7oe0XYeI0UyqcsVIP38YeVf9vhc5+3RyxS3+0kwIlFPb
XNfot6Z1GbxrKJ9TSJ3p
=Ga/z
-----END PGP SIGNATURE-----

--=-0+AW2vR+tp/RCrQpGKDV--
