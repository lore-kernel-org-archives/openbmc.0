Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzK2Y4QJdzDr5b
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 11:39:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NisnqF9j"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OQgLI8Bf"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD6FA20FE2;
 Thu, 29 Jun 2017 21:39:30 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 29 Jun 2017 21:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=luOYm48KUzMT1LggSPzcfxRzdZijzX3TNucNr81Bf
 RI=; b=NisnqF9jjL9YT8Uto3cQMFitSIKkCTgaz0zBIqI4WNMrMm0COYuS12ONX
 9KIXoLmdb6Xtc1kcmmL5sKwUJUWpFFD3nhyy3jsJC1A6OSzpE/Og8GCQal2wx7kl
 TIrfrBSVCHxs752+XLTkqBVT/VqWcs5/wnYwFewa4b5H+sGiWjNjmS3k+vyTkFpe
 +daIkxqPV2za2lCuVaDo1vTFMq79l7r39C2AaI44pEhDnnFu4zbVjdQmC3OnPSB+
 Ng1/XnGHzE53piejnuF1wTU8MC54zh9cwZLk/NLXvEzMr98NxJTb3gAcVSU75DNq
 hOhUYZsRIWqH3HWigxQ/lnWeNCpxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=luOYm48KUzMT1LggSP
 zcfxRzdZijzX3TNucNr81BfRI=; b=OQgLI8Bf7dNlXJVkIonv/EAHA9+YdpQwcr
 9fcz1nDnpTdtkmZPZeoRPfjjmT5z297kJ4KfpvGPTUtT5AAaKLIfHYRwtYGtAieV
 EZUl8w5hSftP04u2SibqjHlYgQFuMqywyGN37ApeMJpGTVMiFRG4f/0ySOLwSWXI
 I/xYavDJP+i/9lbIZ4uz8eIVsu5FW4suXYXIBxi7BaChGxNvgHjNnIwCsYC9i5dE
 jKX6bh4wScaeu82/DWfrqvosdQLvNOSTNQqL3p8D5LO4GvDC2Ajyl/ZT75ZHwLhh
 kE2y+p+TgM4NFDtzZCkaexDvACjo/gYggLfJN+nKXbC+kGJxe3vQ==
X-ME-Sender: <xms:0qtVWbEN__D5B5xKuESqJfqTU2v-0lO1mokzo8llk_oZmwXCfPeTOA>
X-Sasl-enc: z7Ok4BUZHFyvPng8PuOe64qJmbea+CG7ttWP5GRX31qJ 1498786770
Received: from keelia (ppp118-210-130-225.bras1.adl6.internode.on.net
 [118.210.130.225])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2FA482424E;
 Thu, 29 Jun 2017 21:39:28 -0400 (EDT)
Message-ID: <1498786763.5203.17.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add gpiolib irqchip support.
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Date: Fri, 30 Jun 2017 11:09:23 +0930
In-Reply-To: <20170629133239.17711-1-c_mykolak@mellanox.com>
References: <20170629133239.17711-1-c_mykolak@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9KfFgdXb3QYFaxVLaKS7"
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
X-List-Received-Date: Fri, 30 Jun 2017 01:39:34 -0000


--=-9KfFgdXb3QYFaxVLaKS7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykola,

On Thu, 2017-06-29 at 16:32 +0300, Mykola Kostenok wrote:
> To allow support gpio class infrastructure for Aspeed SOC.
> To allow gpio_to_irq conversion.
>=20
> Enable irqchip and libgpio_irqchip for aspeed-g5.
>=20
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
> =C2=A0arch/arm/mach-aspeed/Kconfig | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index f3f8c5c658db..e098b7a780ee 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -27,6 +27,9 @@ config MACH_ASPEED_G5
> > =C2=A0	depends on ARCH_MULTI_V6
> > =C2=A0	select CPU_V6
> > =C2=A0	select PINCTRL_ASPEED_G5
> > +	select GENERIC_IRQ_CHIP
> +	select GPIOLIB_IRQCHIP

Sorry, I don't understand the need for this; CONFIG_GPIOLIB_IRQCHIP is
already selected by CONFIG_GPIO_ASPEED, which is enabled by the
aspeed_g5_defconfig. I don't think we need to do this here.

Further, what problem are you trying to solve? From my testing GPIO
interrupts are functional.

Cheers,

Andrew

> +
> > =C2=A0	help
> > =C2=A0	=C2=A0Say yes if you intend to run on an Aspeed ast2500 or simil=
ar
> > =C2=A0	=C2=A0fifth generation Aspeed BMCs.
--=-9KfFgdXb3QYFaxVLaKS7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZVavLAAoJEJ0dnzgO5LT5MaUQAJCBYFvAWYSJl7/WIxjcdkW7
fKuH6Xa+e+Wx0l+7Slno0hfKuiPxYmOaKhBMUUDmVbnME1VHiwjEHhL8+hHvAfOT
pWcXbipZXQxe1ATrMUMdweSlgDPrvvTtHkLBzf0ue0uTN6BGsVYgKa/UIVAoKWVU
cZ7eQtv2L+pgUdfqJV72Mn54QpnPjl+AisOsfVHSdIXdbuAZFvhGLMaV4uvc91lZ
9cKREPerqbWq3EQFxEVu84H46nzSJmTGWhcqGaONdVxg/CvhS7hvuVfTUi+C2ZMk
LLN6m66lBR5T3+OhCGx0Pt5s3ndpBCEHRBPTiZWQ0qHqrOIdSkUa7SpRobOfaEAy
Vum/F5rPcLERnlpN0UqVNICoOy+XRQAFgY0128+czZEtAA50TEikDtIb+0UwL+qn
jEYNmR7jfRBwAaHCa+EU+fb5CoejSdKTNqvXM5uLoSmYxftgNTxxUdJUHMbyM1dI
JkcX7Adgv1z9HQC0vsxdtw9xNboLioVIz9l3MjIKwd7igRxf5szv27UPTSo6+/4D
z6PxPcy1Ubzn5CTu8CI9br6jiJmAuSjba1SQJqKtx23mPaqTSkeEZ12rBfeuQOMt
FjJBpZboUYVHtVT3xDhIeoAg0TPGeUh1tm1nEJBK1Cn0+O+JR/OMilHgyfe/zT0v
VLSq6QOoGQyNwZa53taM
=0Cr8
-----END PGP SIGNATURE-----

--=-9KfFgdXb3QYFaxVLaKS7--
