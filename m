Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8M2n1Ct6zDqL2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 13:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cx/HV/gC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XUoqvbhj"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 10D5620ABF;
 Thu, 20 Apr 2017 23:40:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 20 Apr 2017 23:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=vLVAV2bPjFc0sYHAVazUW/dJ4O4qnZYJbSQFKTU15
 4Q=; b=cx/HV/gCggUc6mng0ZoGkuhZZqzzYPYESHjpL7XL3LwMcS52C5ylP3lNV
 oTsWBpOghplV18Zz3KY1VpIJ8je7ZKOWvpehALKlYbJj6j/BWDJd5w4YPAtysTA5
 4YS2W7IV+PB8gFc7r1p2czGPGkl/w/775+ygz8lw/JYfoIyfqbMMzADjtSkG4FGc
 DX4pSNQ9WNx4kq379ezfKigN89SOnJ7W+LIUpNG0b1Y+01Udcd2uH/Rh/qu3wKmv
 EWNrgB6+zBop3bPHReJhIojsPeS1IWDIcEMTvLS5B0FZJW8Sn9o3+z43DYeHxL/e
 5hPlzkPx7Boi5MFjb2MbCzjeU9b8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=vLVAV2bPjFc0sYHAVa
 zUW/dJ4O4qnZYJbSQFKTU154Q=; b=XUoqvbhjVc3DktalRgdscJ7lpuMcztXMuz
 anBtqerG/p8ClhJmnwSE3h4aZs3BiHVhEuX6GtQie3xMD8JXPk/GgxVmE36RHf5U
 HJcDjtm/eaEIIlgQTXJyQqpQdmO9jam1aI/S1LqERCTcs2zbfiSMyJg+w4VMoSj9
 Vcrg3Ezt98alZUQZ0RPJO69pzBYpcg2Z4R3rE3aTqZiIO3aPxrQn2I/uqowSrBtw
 oBLqihDNiMJjf5/8knNmAZVEiUUjKXLIggLC8Rest9N8Awe00uKktQzXnzeVvwRr
 3L4PTecULPS8oprDy+EamZ6uMmbbxZl2LUWVj9g9bqSNm61QJCww==
X-ME-Sender: <xms:PX_5WNv2VDWc8_-LQbmVBOE05Kb0au6O8zfwN5mpC4nm_GwiHFRSFg>
X-Sasl-enc: J5O/NLJjQoGze9UCm4llWU9IQiKK9vsPzMhayygBMQH9 1492746045
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C6DE245DF;
 Thu, 20 Apr 2017 23:40:44 -0400 (EDT)
Message-ID: <1492746038.4069.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v5 1/2] ARM: configs: aspeed: Enable
 keyboard-gpio
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org, 
 joel@jms.id.au
Date: Fri, 21 Apr 2017 13:10:38 +0930
In-Reply-To: <1492744763-29872-2-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492744763-29872-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492744763-29872-2-git-send-email-bradleyb@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-92WpVfY6klGNpACF46SS"
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
X-List-Received-Date: Fri, 21 Apr 2017 03:40:50 -0000


--=-92WpVfY6klGNpACF46SS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-04-20 at 23:19 -0400, Brad Bishop wrote:
> Some OpenBMC systems will be using keyboard-gpio so enable it
> in our configs.
>=20
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

In the future please add the tags given for previous patch revisions if
there hasn't been significant change :)

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
--=-92WpVfY6klGNpACF46SS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY+X82AAoJEJ0dnzgO5LT5q4QP/RD7VxvZaumDBBmxt/AyCgCO
V1QbtjrTR4V3dc437K8dx+QTsxZpTPrTKeU67hFV1wJomVZT+d9BcoJedtV33RF5
ZuJdAuEgyEb01gynuXGNMHhz7i2Mt2dUFPCUqmMQTSzY7n4adXH2hBZh7bBDwNAO
BVCgs+ekwF70ZIKwmZBpHl9LuZl0rjnsacVb8NsnIrDH36JdIM8Io7hSepESrqe2
sfNgSaNWG3OlVBoamYcN5gUrwocqnludS8/41MWf7dqBF1sBTH9/vBl71DZUXPZN
zO42lB325zjowM3gPJNRZEM8O0dsqkBxeoNK9Y6Knw/N6rTqgiKrJmrJ+jrHkKT6
piR4eRYX/LAyf0inGiwQCm95+vz4UCZ2MS4DtAPFFvHmqhYejslifMPFk9052oMB
OzeV7Q4nIITIEG1Rfv0hux99jWyJwfSf/iwagQAh/XIy5pPxpV9Jk9ZnyXZecBLv
phGTOUCiflE0vrJCWRC97peFoaeMcXq1om19syDHjpjxwIrwftP0y/cVq4Zu/SOC
55VWGdJtLu4ZGrFbrFy4eEQClb16Ca+717RxuM1/pkh+A9UPauCITyl2n9lJtibS
BI2FAu+2qhIaTNzi5WgSoYooiQrqqpatMgcW/XYOBEtx/yF8L0Zyxt+yO7O04Ip1
jeFDeN5uHxDcsD1Ac8M7
=SukL
-----END PGP SIGNATURE-----

--=-92WpVfY6klGNpACF46SS--
