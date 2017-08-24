Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xd7bT3qBVzDqY3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 12:31:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fVMV6n5U"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XrRC9B9x"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 589662173E;
 Wed, 23 Aug 2017 22:31:46 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 23 Aug 2017 22:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=h/4LV/RWsz160aF/F5ly0ih0P2l5RjAoCPA0D5Nux
 jI=; b=fVMV6n5Uv1QrieDt8PrH+QauhsAorqwMW9JTed+0g2VSxPQ6TJI6UVGgs
 7S7jiM0vHFgUlCNzRtrrkQgF2kuYYpJLQvAtGRcLvK9pbzNR78hX5Bx8lNkffsfA
 4ucOycmF2R1vZeXs75s5N9S9xpHpv7e6l+z3eEd9ObjmBMhkX/FYKqqE23yBy8mY
 YaGZTeE9HrL779DE3DAv1vUTuBumB4jdRYOif3WYOC+Jzpbj9/UTn1ZewoQ2bhp3
 WuC3HqaiU5BApYwi3N0XxCeVorTAVxSdvUETXiogVByMf98Dmnucx6PY8mX8fVoJ
 XyKxjGjW+KYDi7TCvAZs8tdnawQpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=h/4LV/RWsz160aF/F5
 ly0ih0P2l5RjAoCPA0D5NuxjI=; b=XrRC9B9xsRYnvxNGYnyIKifQLdUMHR1SrD
 bFo2vtLkcuYRsVvMN0fqh2wqtW2gdvItvbm2Ao02otuNXPV4N8OmEHzPo5U6Hyu9
 Uophu/7UssUscDc3En7et40SZZk2IGQMS+mM0ssdp9lmE4bR5CSgwUsGBHqq8KZ2
 b6GKXc5kTd7T1bSN75U/+41+Ukn0+I6hTauuFL9BhEFwFp7bxcJLVT1gLdSjhWzr
 BOffL0kfeQmdemCTlax22LEXf2jA7cH5SD9Yr4P57DhQoSrc/vIJXWcplEdMu7d7
 Qb4KNKDjVqPpHdcT3KqsstQoP4CMccbbiRKltZSnUSbJSIvBlXIA==
X-ME-Sender: <xms:kjqeWdQEpXnL_Y2ndxI9mQfFkSudOsQ8V9Df0KUGro5Rj2DQ5oRY1g>
X-Sasl-enc: 910X8uzIVLSGLMNBhNMkoaMIAffvN6heNLC0QIRMBoTQ 1503541905
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A1A017F3FA;
 Wed, 23 Aug 2017 22:31:44 -0400 (EDT)
Message-ID: <1503541899.4231.3.camel@aj.id.au>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add optional MTD and UBI
 support to ast-g4 and ast-g5
From: Andrew Jeffery <andrew@aj.id.au>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Thu, 24 Aug 2017 12:01:39 +0930
In-Reply-To: <1503540105-33337-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1503538442.4231.1.camel@aj.id.au>
 <1503540105-33337-1-git-send-email-anoo@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BFkKSMZU3hbJsedzkdJ9"
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
X-List-Received-Date: Thu, 24 Aug 2017 02:31:51 -0000


--=-BFkKSMZU3hbJsedzkdJ9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-23 at 21:01 -0500, Adriana Kobylak wrote:
> Add MTD and UBI support conditioned to having MTDPARTS_DEFAULT defined.
> This allows platforms to enable this support if desired without
> adding it by default since it increases the size of u-boot by about 70kB.
>=20
> > Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> ---
> =C2=A0include/configs/ast-g4-ncsi.h | 10 ++++++++++
> =C2=A0include/configs/ast-g4-phy.h=C2=A0=C2=A0| 10 ++++++++++
> =C2=A0include/configs/ast-g5-ncsi.h | 10 ++++++++++
> =C2=A0include/configs/ast-g5-phy.h=C2=A0=C2=A0| 10 ++++++++++
> =C2=A04 files changed, 40 insertions(+)

So my understanding is instead of duplicating the additions we can put
the them once in include/configs/ast-common.h:

    $ grep 'ast-common.h' include/configs/ast*
    include/configs/ast-g4-ncsi.h:#include <configs/ast-common.h>
    include/configs/ast-g4-phy.h:#include <configs/ast-common.h>
    include/configs/ast-g5-ncsi.h:#include <configs/ast-common.h>
    include/configs/ast-g5-phy.h:#include <configs/ast-common.h>

Sorry for the back-and-forth, but I think that would be a cleaner
solution.

Cheers,

Andrew

>=20
> diff --git a/include/configs/ast-g4-ncsi.h b/include/configs/ast-g4-ncsi.=
h
> index 8191dfc..0ba5a43 100644
> --- a/include/configs/ast-g4-ncsi.h
> +++ b/include/configs/ast-g4-ncsi.h
> @@ -26,4 +26,14 @@
> > =C2=A0#define CONFIG_CPU_420			1
> > =C2=A0#define CONFIG_DRAM_528			1
> =C2=A0
> +/* Optional MTD and UBI */
> +#ifdef MTDPARTS_DEFAULT
> +#define CONFIG_FLASH_CFI_MTD
> +#define CONFIG_CMD_UBI
> +#define CONFIG_RBTREE
> +#define CONFIG_MTD_DEVICE
> +#define CONFIG_MTD_PARTITIONS
> +#define CONFIG_CMD_MTDPARTS
> +#endif
> +
> > =C2=A0#endif	/* __AST_G4_NCSI_CONFIG_H */
> diff --git a/include/configs/ast-g4-phy.h b/include/configs/ast-g4-phy.h
> index baa522f..8b26fa6 100644
> --- a/include/configs/ast-g4-phy.h
> +++ b/include/configs/ast-g4-phy.h
> @@ -28,4 +28,14 @@
> > =C2=A0#define CONFIG_CPU_420			1
> > =C2=A0#define CONFIG_DRAM_528			1
> =C2=A0
> +/* Optional MTD and UBI */
> +#ifdef MTDPARTS_DEFAULT
> +#define CONFIG_FLASH_CFI_MTD
> +#define CONFIG_CMD_UBI
> +#define CONFIG_RBTREE
> +#define CONFIG_MTD_DEVICE
> +#define CONFIG_MTD_PARTITIONS
> +#define CONFIG_CMD_MTDPARTS
> +#endif
> +
> > =C2=A0#endif	/* __AST_G4_NCSI_CONFIG_H */
> diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.=
h
> index 12d6684..167835f 100644
> --- a/include/configs/ast-g5-ncsi.h
> +++ b/include/configs/ast-g5-ncsi.h
> @@ -28,4 +28,14 @@
> =C2=A0
> =C2=A0#define CONFIG_HW_WATCHDOG
> =C2=A0
> +/* Optional MTD and UBI */
> +#ifdef MTDPARTS_DEFAULT
> +#define CONFIG_FLASH_CFI_MTD
> +#define CONFIG_CMD_UBI
> +#define CONFIG_RBTREE
> +#define CONFIG_MTD_DEVICE
> +#define CONFIG_MTD_PARTITIONS
> +#define CONFIG_CMD_MTDPARTS
> +#endif
> +
> > =C2=A0#endif	/* __AST_G5_NCSI_CONFIG_H */
> diff --git a/include/configs/ast-g5-phy.h b/include/configs/ast-g5-phy.h
> index 62ddb84..c3e2552 100644
> --- a/include/configs/ast-g5-phy.h
> +++ b/include/configs/ast-g5-phy.h
> @@ -30,4 +30,14 @@
> =C2=A0/* platform.S */
> > > =C2=A0#define	CONFIG_DRAM_ECC_SIZE		0x10000000
> =C2=A0
> +/* Optional MTD and UBI */
> +#ifdef MTDPARTS_DEFAULT
> +#define CONFIG_FLASH_CFI_MTD
> +#define CONFIG_CMD_UBI
> +#define CONFIG_RBTREE
> +#define CONFIG_MTD_DEVICE
> +#define CONFIG_MTD_PARTITIONS
> +#define CONFIG_CMD_MTDPARTS
> +#endif
> +
> > =C2=A0#endif	/* __AST_G5_PHY_CONFIG_H */
--=-BFkKSMZU3hbJsedzkdJ9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnjqLAAoJEJ0dnzgO5LT5SCMP/RuiIn6Ejs5542stiQHB2FgB
v3kCx5gSiEhtzbmhIBrfMDSaetZ9mUaRMqifgtUeHeFzaSJD2Q6kxfGPvqNUrg6Q
MqL8Nm1JhTClKc69vVHKS1w7eNtgWtSLUzpz/ZgyMlTkhZSOqZOuV0l/VWmpRXBU
cvjgRnpETRK5+SZul633TFIP5CLn9VrLc6Ger0NgY4OOwe319vwZQDpQHWuDPUdJ
sGOM4Tnn1YoXQ5TaTSXN3ys3HVSLioeX6naw7GTGv8xR4BaiN7LveygHQaCMgDuM
YE1O6paMkdOYA38++p09UFGxUKr8X6CDPm5oJVZ59OFNlQZSt4LmGUDS36hRIBiu
Xt0KZBeh2PDQDo22KssGo1D1mDYHVSaJAnbGA6GwmBxsOLjNAP5oNhf0+GKp5pWu
Fw4dpWBAGSQIx+MhskEDcpEU8zt1TGmN2k6/56GGfik48Qerd3FvxiONBTMB/WTo
CkVEJ3jFqv9EF+OQ4IdcClM/np2qbkSifodOpFY56RKjfknpiTUWtPYKS9B8hRGS
U9DaA7hAyg52L8LwxuH5E6BLRLKl9n8QARJV07AQw5E6LRzuS8s9TGedSn3zeHTN
uYO0oWZDa/6pk3gZDj55/DRO2iAly8pkJJNG1rBLLHt9nWbSxhzol/fZojEBV7qi
dXBsIWjoARD0Ox5CPikv
=/JDw
-----END PGP SIGNATURE-----

--=-BFkKSMZU3hbJsedzkdJ9--
