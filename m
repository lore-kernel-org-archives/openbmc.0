Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdCC72RbbzDqY3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 15:14:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eCKe/Ivw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UxfxEDYe"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2670C20EF7;
 Thu, 24 Aug 2017 01:14:25 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 24 Aug 2017 01:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Dfl7Fjn159w7hDqRTVqMrAWO2nGgeAmxuCpE3VvYi
 8g=; b=eCKe/IvwcuTM6dHqi7BxABEK950Zv9XPVPNsUUtN805CJVqqBjYvzJh8C
 ctMmOUuaF6BHY9j86cNsN+jj9tmjBPEL6woa6xTAw3vtN2IL5/xKlfA0dQEKF9LV
 gt2oW3KYaojTqJLjBzeOOZ33yQ043HHEPsn3KxhFrii+4wmDEAjsIp61C7jn4mi3
 Z2+WSy3swRtkSNqGNZOBQYHVqZnTLm8vb4noLaAjceWQGG40vVFDkM32R7MkqOuK
 J32xHvrKdGVOCCa+mPRGYL9JwRNU6MXRFTXNkoqFpV1xm/SFnFbtivEkNBtgr1tK
 rr2/dwIyHG4KoXWD7aPsR/P7qlOlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Dfl7Fjn159w7hDqRTV
 qMrAWO2nGgeAmxuCpE3VvYi8g=; b=UxfxEDYeNOb4mjLSNZPfVahxRyZLidw+mO
 1x4g3cLA9naCeDQd5oOQW8jkpP1AcIOqO7RhvLmuIGTJmNLNlq9kgpb21GZC3KW1
 q+HNKcAMVsD847EE4DxZLSMZ6uL+Yig9LY/Vw6f8QELMU54/c229oGjjoYAblzIg
 /4vr10ukXrkcICEuE1uA2pFeRK7zOCK/T7oVEiHyKUmVR/NqHXX/7H0DIS7RFSEd
 Ev46sifrwkhJxeS+uW4Cq/OgW8YjicXkcjkhFd+yRO0Yvy92FNmL8EUV1z+9pcuX
 nKrxBwP597oGvJNu3FUgd9IKw0Oop0zB6hMlrx/626/m90c6Yg+A==
X-ME-Sender: <xms:sWCeWadk2rXJnvCbrOoez_z_Ga6uBHYLjxHJWx6jDxo2mB8iTODBAQ>
X-Sasl-enc: g8rWDkhGglB0w3IOq3JVtepT2q9Fq/817Yoxne/pR1yt 1503551664
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79C467E1B4;
 Thu, 24 Aug 2017 01:14:23 -0400 (EDT)
Message-ID: <1503551660.4231.7.camel@aj.id.au>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add optional MTD and UBI
 support to ast-common
From: Andrew Jeffery <andrew@aj.id.au>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Thu, 24 Aug 2017 14:44:20 +0930
In-Reply-To: <1503544808-35223-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1503541899.4231.3.camel@aj.id.au>
 <1503544808-35223-1-git-send-email-anoo@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-DUijAkFVxmO1f71JzwHy"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Thu, 24 Aug 2017 05:14:28 -0000


--=-DUijAkFVxmO1f71JzwHy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-23 at 22:20 -0500, Adriana Kobylak wrote:
> Add MTD and UBI support conditioned to having MTDPARTS_DEFAULT defined.
> This allows platforms to enable this support if desired without
> adding it by default since it increases the size of u-boot by about 70kB.
>=20
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>

Applied to v2016.07-aspeed-openbmc.

Thanks,

Andrew

> ---
> =C2=A0include/configs/ast-common.h | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> index 110c780..29551ef 100644
> --- a/include/configs/ast-common.h
> +++ b/include/configs/ast-common.h
> @@ -84,6 +84,18 @@
> > =C2=A0#define CONFIG_SYS_MAXARGS		16
> > =C2=A0#define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> =C2=A0
> +/*
> + * Optional MTD and UBI support
> + */
> +#ifdef MTDPARTS_DEFAULT
> +#define CONFIG_FLASH_CFI_MTD
> +#define CONFIG_CMD_UBI
> +#define CONFIG_RBTREE
> +#define CONFIG_MTD_DEVICE
> +#define CONFIG_MTD_PARTITIONS
> +#define CONFIG_CMD_MTDPARTS
> +#endif
> +
> > =C2=A0#define CONFIG_BOOTARGS			"console=3DttyS4,115200n8 root=3D/dev/r=
am rw"
> =C2=A0
> =C2=A0#define CONFIG_AST_SPI_NOR=C2=A0=C2=A0=C2=A0=C2=A0/* AST SPI NOR Fl=
ash */
--=-DUijAkFVxmO1f71JzwHy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnmCsAAoJEJ0dnzgO5LT5Y10P/1421P3jLCeJW1WCmpkkMNMx
5oRl4WwfBFniKgq32Tn7enKsY1hTaoWh35HcqEOwZgabAkD6vQnrqPQZwrEIqsOt
POr7mNla0gv/NZCSLfhZY6wvC5rtQ6QmvXAtL6soiUCT4+z0poADS8XGvTBy5WIj
fltwo2tCQEvKrFI0r9STmaGDz6a8Lo2n8XAAdelJelGv/lBZWXAQUe6QC8On9NKl
7XLwnnobrX4dkoqha02ja6X5opK5uVJuldRcoFrlpQPhlIZ1QOiEXONMDZyrGJwT
NZ7UFxRZT+jTzCaCot+yYGha8aGzPlv9Yl/JWHH9NhCH97R7TtQpksyLJrVIf4nG
QMhg1wJnQY5Jw/m32cbbdMy7hMwHDnwwn0RG2UN0Obx1r/xqeF1ZkTaHARG3b30c
0KLmofH6AELwcDURNCyghlHb+rh6dXgE5dAc+BMKVUE4Ht6W3g06fiFAOYDUPLo5
5/aInTf4YoL3zRCgB4K/WXdxgkZMzUkx5EkbpoUo1YckJy/Ns+4rEA/sLgkxOnIy
roTywCmIPw6lnlVIORedVq6IW7ulCdqwI+5A93rWXRDPs+GpkyFUPbEQr31ZU2Te
Y/tNP3GlO3Emm0VQyR40WttBsvCHPLnF2yIEvUGzyhpDwk2lYmULgKzW1/CJDKVH
2Vqel0SA0oED71h2DHA7
=o4qh
-----END PGP SIGNATURE-----

--=-DUijAkFVxmO1f71JzwHy--
