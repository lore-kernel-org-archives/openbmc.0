Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBNRf13LnzDrFQ
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 11:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="D35vyoEg"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VPoRYqYr"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2005920716;
 Mon, 17 Jul 2017 21:51:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 17 Jul 2017 21:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=R5IssrPSOFeD8cL3Wf/BM83LWfildur9Ho37Ib6kk
 xo=; b=D35vyoEgSYTmxq1BjJQNM3LTIVYmLp8NwpbiR2dUKGe87jsTa88HkxrC0
 0ipJh9mNaOOEiygbP4QPfcCOIUtspv6GfeGVDu9nQbgjzsrwka7Wix7WMel5qyW2
 hEEzI9Av1YPUDb7fw5dBWbayjrGK/kI9yXu4+bLkmXIgwd1zj7rLb0Bl/vSY/zYS
 Y4lxjU/Tqi/oeasPR4sGdFeeu78yF4AF22r/ki61yR1jDM/dQFHNb/+ZVeF3fm+g
 LLeAspzrZNzENqlm4Hyp8Xli9Udid5QaaaBRE43od7M1XI4odk0/7fnU6JYwqiiZ
 BDOH8NBCq+blpagn4+B0Ie+YkyQSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=R5IssrPSOFeD8cL3Wf
 /BM83LWfildur9Ho37Ib6kkxo=; b=VPoRYqYrqnYa6K4FhXFMeczlb4Yok4VKTM
 rbs8Y7ipfagc+DLWClWuJ1S6cl8KYVT3OY1Ri3g9r/gB/bKK2dqGN+jgHh0dLwT1
 Dr17ZnzAaYj1VCUGM3UJo8+zsy+ZDwQaxHSKukDdf2/ZrkIboOS9lBA4WuPIU1bV
 /n5oxBvV+J5MCFHTWc8gZh2RRx58YhN01Rz3xUA1crnrJ84zz6Xm8kTg87YoKFPU
 hrcR7aRTxvyByYHDOK65jmaa1+dy8/xhIm+KgEaTOeO/azP5h4uYobdik/zE5Uun
 ccNGBvuhd16b+tVb/8fqrRRs1HqGc37AIwiq9fTFOED1rtchc9hg==
X-ME-Sender: <xms:jGltWRWt8rZjMilIzoeuMyuBPgT61Ud8qK3Bx24vYRf1C-8EVjZBNw>
X-Sasl-enc: 00ax6f8Z9twhVOylLuO2BRchfi0A5/f65v/UDJLhxQ/Y 1500342667
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 541DC7E6D9;
 Mon, 17 Jul 2017 21:51:06 -0400 (EDT)
Message-ID: <1500342663.500.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/2] ARM: configs: aspeed: Add
 GPIO_KEYS_POLLED
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Tue, 18 Jul 2017 11:21:03 +0930
In-Reply-To: <20170717212732.8629-3-cbostic@linux.vnet.ibm.com>
References: <20170717212732.8629-1-cbostic@linux.vnet.ibm.com>
 <20170717212732.8629-3-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+3+tiTSxzrGAqju0UY6E"
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
X-List-Received-Date: Tue, 18 Jul 2017 01:51:11 -0000


--=-+3+tiTSxzrGAqju0UY6E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-07-17 at 16:27 -0500, Christopher Bostic wrote:
> Configure to build gpio_keys_polled device driver.
>=20
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/configs/aspeed_g5_defconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
> index ad121ed..1868442 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -106,6 +106,7 @@ CONFIG_REALTEK_PHY=3Dy
> =C2=A0CONFIG_INPUT_EVDEV=3Dy
> =C2=A0# CONFIG_KEYBOARD_ATKBD is not set
> =C2=A0CONFIG_KEYBOARD_GPIO=3Dy
> +CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> =C2=A0# CONFIG_INPUT_MOUSE is not set
> =C2=A0# CONFIG_SERIO is not set
> =C2=A0# CONFIG_VT is not set
--=-+3+tiTSxzrGAqju0UY6E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZbWmHAAoJEJ0dnzgO5LT50BEP/0CSczYLDkuGPZ5ZdiiYbCAL
2CDlGg4X/vxRuhvXstcwRffpPuFI4q07lpYMVC2CHwz4/9Z4NMfJ6Rn1B8nSwRhl
apDC2ySnRAi7n/Ky2GXkhJyoFGNSdd5Nh9kCXwVc4JLz0yRHbAk/ahysJRvnx2ib
7tWRtHKqOJGsTz+9ZLYA7N6rBDUog/+qpf8x4BUobcgUd092WZvtsAyEkVVpWqhb
ikuS//M6cs12nuXkFvOOFruBIdh0BGXdCTObwR6xFqbW+LGI7kn5OeY1Q0DMRLqQ
32kbLAtH0MA/zYEJJuzmgbP4iGT8jG/RWJS1x3DzTuU66IAOkInpxKMFxBw95PUp
HjkdfpD+90VHhlHB3uHeQdaWGXXjZs+7LwoebTI8vE8znA1BvvJo6ILNIOIPdOS5
8lSsXgX6VShxquM3afO0wHlfbFH7gFjFM1K1FnBSthoz2OPDDs4ahPr17dN2eD7s
hb1hsapXHKY2eZoge/P5b/Mn93ztxjsZwMSA206GDqyH1dvmVFqBTC6C3dYjxppo
CDE/0fWXEdjjUWlUsiRVBrSWaPavAGsy1EredQ8xiZTEHZ84vnTdJCE8A8Kxw/sS
HF9AEwX1NRR2/rj3bA6rHF2lUSOrIRRFpJ5UXF1zXl72mGUadjBtBb/Busipc8eI
MJN/enfkwpcO5uto8Qrj
=PG0O
-----END PGP SIGNATURE-----

--=-+3+tiTSxzrGAqju0UY6E--
