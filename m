Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8GzR4XkCzDqKp
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 10:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bTrbugWV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WkHsLgIW"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DD612084C;
 Thu, 20 Apr 2017 20:37:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 20 Apr 2017 20:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ddGcXeVCpqvRCufkhthp2pqVlCO5fG79BgGsjyKUE
 C0=; b=bTrbugWVwMuMVm8a/nEd2UoN4wteTgLJ2Qq0Zbz3b2OXvdBlUgBXY6GaY
 YyaVDBtBBh9FF2XGSweUtqyzIwmxiejNM2OIamgMyPgBeNdAVE5my7JhVdAz634z
 y1D09Nkj5IX4nyYq/Dlww1ADPE9wqvHv0z23Ovhk44v9kz3edi2dQCOIiCdQnxtO
 c1/iXA4QIDuUiRZ2TZkp/aCibTm+lyaXWWWw8plElv5EUFg7qkZBTNu5c/uZiTX4
 vaoCC2tOt2C3aAMwBWIY1JlIH9jjwWkZjGaeQVnRCOmgmZOpSQECOW039EssA8F+
 1fYj652Oqy38Igpp1joXj9FC24eOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=ddGcXeVCpqvRCufkht
 hp2pqVlCO5fG79BgGsjyKUEC0=; b=WkHsLgIW7TxGKWf6dhWZI38hbmIpSKOhd5
 SAxSJtCj7YMvJF39KFSw3pa6dEbSlLhTn/oFz0TVc88VwM1hXoZveeSvDBWt0tCH
 wU57oBpaEFCm7/6noCs0T2K322bPhsKMaWZ7Fo3XS3IP4gTnS33f9nQClpeyCv4b
 kaaVmgZ9fHT/RIe7rvdKWZ98Oi11ByYQUI7VR9gvDsSPljOdK9ZWDuWtFLfwdE07
 isvqTxcvmVNOEAkWZYVDKbXshHsEzQANMMUl2SySy0aOhPM2IuyXx4EvQ6clp35b
 Rc1NfI3pt6z22QagdBELAblueWuD91b2iUKxZ/wk3zBJDHsQeLxQ==
X-ME-Sender: <xms:UVT5WIOFCPEu_4GGc3ATPnQ-Krx0AzHWmu3P-3m2KTkr3mRtZ1QEcg>
X-Sasl-enc: fhdEfi1ZMepmz2rHHR0Or0gZFNixrX44dVVEFY43Iy5I 1492735056
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3C03245DF;
 Thu, 20 Apr 2017 20:37:35 -0400 (EDT)
Message-ID: <1492735052.1011.11.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v4 1/2] ARM: configs: aspeed: Enable
 keyboard-gpio
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org, 
 joel@jms.id.au
Date: Fri, 21 Apr 2017 10:07:32 +0930
In-Reply-To: <1492630922-26202-2-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492630922-26202-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492630922-26202-2-git-send-email-bradleyb@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-mHlzc5nip3w0o2aQjivd"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Fri, 21 Apr 2017 00:37:40 -0000


--=-mHlzc5nip3w0o2aQjivd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-04-19 at 15:42 -0400, Brad Bishop wrote:
> Some OpenBMC systems will be using keyboard-gpio so enable it
> in our configs.
>=20
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/configs/aspeed_g4_defconfig | 8 +++++++-
> =C2=A0arch/arm/configs/aspeed_g5_defconfig | 8 +++++++-
> =C2=A02 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspe=
ed_g4_defconfig
> index 552297b..4350f67 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -103,7 +103,12 @@ CONFIG_FTGMAC100=3Dy
> =C2=A0CONFIG_BROADCOM_PHY=3Dy
> =C2=A0CONFIG_REALTEK_PHY=3Dy
> =C2=A0# CONFIG_WLAN is not set
> -# CONFIG_INPUT is not set
> +# CONFIG_INPUT_LEDS is not set
> +# CONFIG_INPUT_MOUSEDEV is not set
> +CONFIG_INPUT_EVDEV=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> =C2=A0# CONFIG_SERIO is not set
> =C2=A0# CONFIG_VT is not set
> =C2=A0# CONFIG_LEGACY_PTYS is not set
> @@ -138,6 +143,7 @@ CONFIG_SENSORS_ADM1275=3Dy
> =C2=A0CONFIG_SENSORS_LM25066=3Dy
> =C2=A0CONFIG_SENSORS_UCD9000=3Dy
> =C2=A0CONFIG_SENSORS_TMP421=3Dy
> +# CONFIG_HID is not set
> =C2=A0# CONFIG_USB_SUPPORT is not set
> =C2=A0CONFIG_NEW_LEDS=3Dy
> =C2=A0CONFIG_LEDS_CLASS=3Dy
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
> index c5e7295..b6b3ca0 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -102,7 +102,12 @@ CONFIG_FTGMAC100=3Dy
> =C2=A0CONFIG_BROADCOM_PHY=3Dy
> =C2=A0CONFIG_REALTEK_PHY=3Dy
> =C2=A0# CONFIG_WLAN is not set
> -# CONFIG_INPUT is not set
> +# CONFIG_INPUT_LEDS is not set
> +# CONFIG_INPUT_MOUSEDEV is not set
> +CONFIG_INPUT_EVDEV=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +CONFIG_KEYBOARD_GPIO=3Dy
> +# CONFIG_INPUT_MOUSE is not set
> =C2=A0# CONFIG_SERIO is not set
> =C2=A0# CONFIG_VT is not set
> =C2=A0# CONFIG_LEGACY_PTYS is not set
> @@ -135,6 +140,7 @@ CONFIG_PMBUS=3Dy
> =C2=A0CONFIG_SENSORS_LM25066=3Dy
> =C2=A0CONFIG_SENSORS_UCD9000=3Dy
> =C2=A0CONFIG_SENSORS_TMP421=3Dy
> +# CONFIG_HID is not set
> =C2=A0# CONFIG_USB_SUPPORT is not set
> =C2=A0CONFIG_NEW_LEDS=3Dy
> =C2=A0CONFIG_LEDS_CLASS=3Dy
--=-mHlzc5nip3w0o2aQjivd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY+VRMAAoJEJ0dnzgO5LT57JYP/it8jsAwNh1c635xnl4K35AU
39Xn/NqQUfV3HA33+Ad/lK0DEIfoLnMgb6xmRVpP5NNiFfGiv4TqSEDIFF2+jQrQ
mQ90HMfuz+6fnVUzV/C9tc+xUeC9Ml8lLtP3raeAOhOxwNCzR+phTsnqZiRnS6Na
BICkfHfajAPWXMq6ma5hqovcgu97+Zv6LzsseAC9sioDU6/xTyPNSsfyZMpLKrwj
LStL5tm58UmgVgljq2OZhwqvC2wmU6j0y4q1fqd6zVgOkxuTmPTuB+ULeGR4ww8Y
cWzecrNCO/hx7gG9Bi3ngPPDcqxilE5bsoDjbvqJaV0npBJC2BqxUiDEzB3Qol6b
qqYs+YMnC+P1GyLV6Wrs/8LHgHTBEtUzNDNjs+Bl3uY27/njK531BpUi63nPokzf
HEFghGhOmd7uJW5Ber7p/yCJaUZ16OCEd+x/ZY1bo1Ph1BJ8dbqifQXiIw7T8pee
xQEu7KYDMgeRv220cxIJ1EzqGz6sNrWMs/GGcRHQA689aJl+MxSfDwTsP1RbMOQm
hq6b3XCwvDa3rXY+8SM0TOd8C5yJzukqjJFt42FqwGvkGopmtMHKeTj5pbWfPBu8
w504b8BH1voZ3Xtkp4ND7f4LZokVELWtnBEtx2ZSNkputkaueWw20dd7Qn2h3USp
PE4tNYyu5DocpL5XqEEE
=INnY
-----END PGP SIGNATURE-----

--=-mHlzc5nip3w0o2aQjivd--
