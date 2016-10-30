Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6YqF07s6zDvPq
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 10:39:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=F5iDy8oG; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=EzFRsTUM; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A94220664;
 Sun, 30 Oct 2016 19:39:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Sun, 30 Oct 2016 19:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 Gk4Cbp14B4YoYYT6NZqth9LlnWE=; b=F5iDy8oGP+MryB55FKt7+gAcF1wvKciR
 C0XmUPNvdNMDgNA3vbkNQIPjWZlMr7E7fDN9JBGyuTGrlzCrSttN/jZNaizDKiwk
 TJfDzNmoMZp4Sgsq5dNTF9MVDo9YuGx388v0MFkO6LXSJ8qruGtYUxtX2rtXrIy1
 FNdtTrB9NR0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:date:in-reply-to:references:content-type:mime-version;
 s=smtpout; bh=Gk4Cbp14B4YoYYT6NZqth9LlnWE=; b=EzFRsTUMfDzK+PdQQ
 iaUbQTxXammWOEsi4gT8cQUADcC8mgDXv3IiIZv/k0Dw7g0+Df/ayZvLH8/2LWp0
 JUMw+LGQ0ZZl/0sYehifIl5Rc3K03iErTznwzepOBjLhVfkXCbwEwBfKKBwTQE44
 QpuhVmCmyosNuEtT8uJ4R+9huk=
X-ME-Sender: <xms:lIQWWNu-vJ6oIytJ1TQdokvxuJvsJyymgCbetPhWsaiVi8Rk5Xwuew>
X-Sasl-enc: tRfKtBZO9v5YIHfeu+vwzhLmLI6+mQx6Wmj7e3jqbZRh 1477870740
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 62D79CC083;
 Sun, 30 Oct 2016 19:38:58 -0400 (EDT)
Message-ID: <1477870732.6373.190.camel@aj.id.au>
Subject: Re: [linux dev-4.7 PATCH] arm: dts: Add Romulus BMC machine
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Mon, 31 Oct 2016 10:08:52 +1030
In-Reply-To: <20161027061935.29217-1-joel@jms.id.au>
References: <20161027061935.29217-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RPKp9VdPpA1v5lzrCCDf"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Sun, 30 Oct 2016 23:39:06 -0000


--=-RPKp9VdPpA1v5lzrCCDf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-10-27 at 16:49 +1030, Joel Stanley wrote:
> Romulus is a dual socket OpenPower Power9 system produced by IBM with
> an Aspeed ast2500 BMC.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
|=C2=A0=C2=A0=C2=A01 +
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 156 ++++++++++++++++=
+++++++++++
> =C2=A02 files changed, 157 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b9541c68afc8..ff647a08fe41 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -896,6 +896,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D aspeed-bmc-opp-palmett=
o.dtb \
> =C2=A0	aspeed-bmc-opp-garrison.dtb \
> =C2=A0	aspeed-bmc-opp-witherspoon.dtb \
> =C2=A0	aspeed-bmc-opp-zaius.dtb \
> +	aspeed-bmc-opp-romulus.dtb \
> =C2=A0	aspeed-bmc-facebook-cmm.dtb \
> =C2=A0	aspeed-ast2500-evb.dtb
> =C2=A0endif
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> new file mode 100644
> index 000000000000..e1be7b0c5484
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -0,0 +1,156 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include=20
> +
> +/ {
> +	model =3D "Romulus BMC";
> +	compatible =3D "ibm,romulus-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +		bootargs =3D "console=3DttyS4,115200 earlyprintk";
> +	};
> +
> +	memory {
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +	};
> +	flash@1 {
> +		status =3D "okay";
> +		label =3D "alt";
> +	};
> +};
> +
> +&spi1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1debug_default>;

It's definitely strapped this way?

Other than that, looks good to me.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Andrew

> +
> +	flash@0 {
> +		status =3D "okay";
> +	};
> +};
> +
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +&mac0 {
> +	status =3D "okay";
> +
> +	use-ncsi;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii1_default>;
> +};
> +
> +&i2c0 {
> +	status =3D "disabled";
> +};
> +
> +&i2c1 {
> +	status =3D "enabled";
> +
> +	/* CPU1 */
> +};
> +
> +&i2c2 {
> +	/* FSI Mux */
> +
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +
> +	/* Clock chip */
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +
> +	/* Voltage regulators:
> +	=C2=A0*=C2=A0=C2=A0CPU0 VDD/VCS
> +	=C2=A0*=C2=A0=C2=A0CPU0 VDN/VIO
> +	=C2=A0*=C2=A0=C2=A0CPU0 VDDR A
> +	=C2=A0*=C2=A0=C2=A0CPU0 VDDR B
> +	=C2=A0*/
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +
> +	/* Voltage regulators:
> +	=C2=A0*=C2=A0=C2=A0CPU1 VDD/VCS
> +	=C2=A0*=C2=A0=C2=A0CPU1 VDN/VIO
> +	=C2=A0*=C2=A0=C2=A0CPU1 VDDR A
> +	=C2=A0*=C2=A0=C2=A0CPU1 VDDR B
> +	=C2=A0*/
> +};
> +
> +&i2c6 {
> +	/* PCIe slot 1 (x8) */
> +	status =3D "enabled";
> +};
> +
> +&i2c7 {
> +	/* PCIe slot 2 (x16) */
> +	status =3D "enabled";
> +};
> +
> +&i2c8 {
> +	/* PCIe slot 3 (x16) */
> +	status =3D "enabled";
> +};
> +
> +&i2c9 {
> +	/* PCIe slot 4 (x16) */
> +	status =3D "enabled";
> +};
> +
> +&i2c10 {
> +	/* PCIe slot 5 (x8) */
> +	status =3D "enabled";
> +};
> +
> +&i2c11 {
> +	status =3D "okay";
> +
> +	rtc@32 {
> +		compatible =3D "epson,rx8900";
> +		reg =3D <0x32>;
> +	};
> +
> +	/* TPM */
> +};
> +
> +&i2c12 {
> +	status =3D "okay";
> +
> +	/* CPLD */
> +	/* Fan Controller 0xa4/a5 */
> +	/* Power Supply */
> +	/* Temp Sensor */
> +	/* Temp Sensor */
> +
> +};
> +
> +&i2c13 {
> +	status =3D "disabled";
> +};
> +
> +&vuart {
> +	status =3D "okay";
> +};
--=-RPKp9VdPpA1v5lzrCCDf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYFoSMAAoJEJ0dnzgO5LT5c/kP/2JbJ4lj/3bYj3cfv3Y3Ngoi
Xa8xg5A7wz4WsZgi379Eya71iCq7NLDOL4bGioKg9awFC6/ylitXwhZ+h7RO8BkA
0URyBi0OaguLHSlO30AgJ0WbjdcZ+Le7RZVF/ANN93M8B059H1KdmtTaqLzltp/I
c2a+cdQDMisqNBHDYC2x67tZyZNsnsrqe1c+v7xpPwKl8Czc9cF2KT5iiMlTBqZC
pM5TZ/cFCZkLu90tJ7TG4HMgzIzjE2ASnYdGYi63y4EPLL8yorNS/z4C6kQQqCxl
kBVm/QerH6koZOQvVueZk9P0hOItINWCteN25/LvUDwx2sOLz7BnhEOgXuDckTi9
dS9YJDBoyC1313ItP4QzJ4ac24lTlg9DZItMO1DCGvgsJuAU7gxVh7cN5pxC8UJD
0VbvDeVVr39UHuLR2iBs0ty+DVlVUktgAvXPT7Pecti3a/KPSpoQm0tv/FxkXrAW
o2Ynb4Cy5YcqJAQ0zhtPpcXLQ9WrGPDpGYYgIV/+1Iczoes5PjiTZJfwbdQkP3Io
eleXRkrezW4wVObZ32hdbhbc/ebQ7llOtwNm4JaFnWz8rishdQsis9MgYjpLROh3
CZq/3zUHHNsWs0FUuXCuND7yYxbIR02c4kkvaWjfGnUGelIC/DOfhp6BI1MMy0pY
o5UYsXckkZvikyIHASqg
=6IPD
-----END PGP SIGNATURE-----

--=-RPKp9VdPpA1v5lzrCCDf--
