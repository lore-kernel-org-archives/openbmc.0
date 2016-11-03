Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8WNr4LVHzDq8M
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 14:56:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=U+UokxIC; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=TKR9FO1y; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8636020897;
 Wed,  2 Nov 2016 23:56:26 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 02 Nov 2016 23:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 ZEkqjVDNq9lExBCTcOW+53KOOS4=; b=U+UokxIC6vEM02JRbbzWqG50L/E6ZfqZ
 F4+3zJZ99I32/126zhySI2j8wAIXura4jYHowLrKXaKdtprdiQoI58GOGBAJKNZO
 SvSIhCtGXZETW8lJQfCd6vMfUsxLVtKH2y4WaSoovQwe7V6VEfE6Zy3MrcMBna3T
 8AwD4JgapiI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:date:in-reply-to:references:content-type:mime-version;
 s=smtpout; bh=ZEkqjVDNq9lExBCTcOW+53KOOS4=; b=TKR9FO1ywcJkxCwVz
 J3qsZlOiDpQq/zx+RYha+6w055RnHG95yY2ctYovPQy6cXtdPNm6TgavMktxxvMN
 vQRuT5qJhJfTLqgc3c0LcpLc0S/FxUHZ5FVQK8Z5kxsKaNFaHMXac3lKgGjyO5+1
 iDDxrj0AhzjLD6KUOeJHC0uV8g=
X-ME-Sender: <xms:arUaWPZ6HPlJB7gPtov2OHfdF4lmOiaprOm4__4oumB1G7iC7hq87Q>
X-Sasl-enc: 32lowMjQz36YiCf/CmkTBPj1rNf/N9YwiCof2c2IWJhb 1478145383
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04104CC07B;
 Wed,  2 Nov 2016 23:56:22 -0400 (EDT)
Message-ID: <1478145374.27396.20.camel@aj.id.au>
Subject: Re: [PATCH] arm: dts: ast2500-evb: Mux MDIO pins
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Thu, 03 Nov 2016 14:26:14 +1030
In-Reply-To: <20161103000537.19830-1-joel@jms.id.au>
References: <20161103000537.19830-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-/WNsd6BwGZafPGm0/Nsg"
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
X-List-Received-Date: Thu, 03 Nov 2016 03:56:29 -0000


--=-/WNsd6BwGZafPGm0/Nsg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-11-03 at 10:35 +1030, Joel Stanley wrote:
> These are required for the MAC to talk to the PHY.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-ast2500-evb.dts | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index 33b3907c436b..37b6793698e0 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -47,14 +47,14 @@
> =C2=A0	status =3D "okay";
> =C2=A0
> =C2=A0	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> =C2=A0};
> =C2=A0
> =C2=A0&mac1 {
> =C2=A0	status =3D "okay";
> =C2=A0
> =C2=A0	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_rgmii2_default>;
> +	pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> =C2=A0};
> =C2=A0
> =C2=A0&i2c3 {
--=-/WNsd6BwGZafPGm0/Nsg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYGrVeAAoJEJ0dnzgO5LT5IXIP/1LhchB4IUveJGRXfdqlXwe5
FM0Jq1OKBsKwTDbTOG/BN7UJHdePIafPztu/p6E4Qy0pi/+JHhHo2NAPjrkTDuYj
e7bLfVlY0VCcJDBPFgeZH7f7wEin9Nr4sl5DjVk+QFsxlhrm2PuRpBpLL8R5m9TL
hV0S8uolRrhecRC581t3jXq9qjZdBRX6VTfo38QRCJOmmlxm1akaPwqF1pV4glf8
qzAlPlXo8B9a0ucsrVPh1R2PLWMvPYpw1e5nQQMHQMLSu+xEM/6mxSzo6mgyG0N0
WpNVVsMnd9M7Xrbxw4nhWyeLHFHQr9z6eLooHGGwNbeqdKNkGX8ouIdPCvL3v/+8
r/fuAJ7uRkOCIWU0bD+iaEqsKlAiRy3Hu9aU8dgwexDxOnloYV1kp/3PLRRx9RWj
MrKHI0d1f3EnUZSNDMxL5hdFn6nG7Nkusal3iN7t90X0zwKzuGJ7iBVbcUjkn/55
kK/YeErtolRofaW7EcQO1bhDVSWbso75dHgcgVTU9A7x/7qJW4YuxHe6FFjONIGo
aKMqrwE8HWv0cVvEKeaOb+9nLTlv/EWJkyMXZSBkcywbfvK8ipSRallWM0im733S
7n2sHVIjAJ4EXo4SUziwGJU0+7Uj962zOs4EebrT6nci6kIOdWbO9/iEgKqpfLsm
01fjGV1IojtiDL6p56d0
=KupE
-----END PGP SIGNATURE-----

--=-/WNsd6BwGZafPGm0/Nsg--
