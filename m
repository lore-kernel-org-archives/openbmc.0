Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sHdmp1WLRzDqCZ
 for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2016 13:08:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Q3Bgwb32; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=aeo72HKk; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2974F20239;
 Sun, 21 Aug 2016 23:08:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Sun, 21 Aug 2016 23:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=i8+bm
 xEJL2lA6hNGA9FfxspDglo=; b=Q3Bgwb32cd0jhVGMZgYNba7jlrd7RtQPtx8N0
 R7FfwCaTjJbU7lHRHiSy0XCO7T4Giq4UWft+PMgH0dxwvGhMKQMRStNYjjwJzBkT
 7DCEhsbC4WXDJQEMSViRh2eLEVVYSePzRHUkd/xVl7OE/Q3+Y85Iq9u3OPhWfn3U
 yEi3Qc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=i8+bmxEJL2lA6hNGA9FfxspDglo=; b=aeo72
 HKkYs2ra+m+0XeykLBNoYsm/n76WiBbxlEuN2dPhZodxJ++2Pv4DExr64qwb3j9h
 2K4kdQxT4GA0eVxr5ZyDn/HWQINQPt4eoDKBOMkO+aRW+BOam9RYrm3WfOgWOs0J
 57PsrSgVMjDdaGAaOsnKGVv2ynngJDN4zlyqfM=
X-Sasl-enc: MPURMPd9soeaXe2NOsMuYMLvisqgBJvnYWWF+VUK44ie 1471835287
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 503BBF2970;
 Sun, 21 Aug 2016 23:08:06 -0400 (EDT)
Message-ID: <1471835279.5707.46.camel@aj.id.au>
Subject: Re: [dev-4.7 patch 1/5] Add reset interface for SoC micro-controller
From: Andrew Jeffery <andrew@aj.id.au>
To: vadimp@mellanox.com, openbmc@lists.ozlabs.org
Cc: jiri@mellanox.com, michaelsh@mellanox.com
Date: Mon, 22 Aug 2016 12:37:59 +0930
In-Reply-To: <1470812560-50832-1-git-send-email-vadimp@mellanox.com>
References: <1470812560-50832-1-git-send-email-vadimp@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-B/JAHAd9qFo0dbAOUZjB"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 03:08:10 -0000


--=-B/JAHAd9qFo0dbAOUZjB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-08-10 at 07:02 +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
>=20
> arch/arm/mach-aspeed: introduce reset and init interfaces for SoC micro-c=
ontroller
>=20
> - Enable Aspeed 2500 SoC interface for micro-contollers reset and
> =C2=A0 initializations.
> - Add Aspeed to ARM machine types list.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> =C2=A0arch/arm/mach-aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A04 ++
> =C2=A0arch/arm/mach-aspeed/include/mach/reset.h | 99 ++++++++++++++++++++=
+++++++++++
> =C2=A0arch/arm/mach-aspeed/reset.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 86 +++++++++++++++++++++++++=
++
> =C2=A0arch/arm/tools/mach-types=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 =
+
> =C2=A04 files changed, 190 insertions(+)
> =C2=A0create mode 100644 arch/arm/mach-aspeed/include/mach/reset.h
> =C2=A0create mode 100644 arch/arm/mach-aspeed/reset.c
>=20
> diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefil=
e
> index 3a4f025..c45cd1c 100644
> --- a/arch/arm/mach-aspeed/Makefile
> +++ b/arch/arm/mach-aspeed/Makefile
> @@ -1,3 +1,7 @@
> =C2=A0# Object file lists.
> =C2=A0
> +ccflags-$(CONFIG_ARCH_MULTIPLATFORM) :=3D -I$(srctree)/$(src)/include \
> +	-I$(srctree)/arch/arm/mach-aspeed/include
> +
> =C2=A0obj-$(CONFIG_ARCH_ASPEED)	+=3D aspeed.o
> +obj-$(CONFIG_MACH_ASPEED_G5)	+=3D reset.o
> diff --git a/arch/arm/mach-aspeed/include/mach/reset.h b/arch/arm/mach-as=
peed/include/mach/reset.h
> new file mode 100644
> index 0000000..801f921
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/include/mach/reset.h
> @@ -0,0 +1,99 @@
> +/*
> + * arch/arm/mach-aspeed/include/mach/reset.h
> + * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions ar=
e met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *=C2=A0=C2=A0=C2=A0=C2=A0notice, this list of conditions and the follow=
ing disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *=C2=A0=C2=A0=C2=A0=C2=A0notice, this list of conditions and the follow=
ing disclaimer in the
> + *=C2=A0=C2=A0=C2=A0=C2=A0documentation and/or other materials provided =
with the distribution.
> + * 3. Neither the names of the copyright holders nor the names of its
> + *=C2=A0=C2=A0=C2=A0=C2=A0contributors may be used to endorse or promote=
 products derived from
> + *=C2=A0=C2=A0=C2=A0=C2=A0this software without specific prior written p=
ermission.
> + *
> + * Alternatively, this software may be distributed under the terms of th=
e
> + * GNU General Public License ("GPL") version 2 as published by the Free
> + * Software Foundation.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "=
AS IS"
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,=
 THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PU=
RPOSE
> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS=
 BE
> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSIN=
ESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER =
IN
> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWIS=
E)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED O=
F THE
> + * POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#ifndef __ASM_ARCH_ASPEED_RESET_H
> +#define __ASM_ARCH_ASPEED_RESET_H
> +
> +#define AST_BASE_SCU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A00x1E6E2000
> +#define AST_SCU_RESET		0x04	/* System reset control register */
> +#define AST_SCU_RESET2		0xD4	/* System reset control register=C2=A0=C2=
=A02*/
> +
> +#define SCU_PROTECT_UNLOCK	0x1688A8A8 /* Unlock SCU registers: Write
> +					=C2=A0=C2=A0=C2=A0=C2=A0* 0x1688A8A8 to this register.
> +					=C2=A0=C2=A0=C2=A0=C2=A0* When register is unlocked, the
> +					=C2=A0=C2=A0=C2=A0=C2=A0* read back value is 0x00000001,
> +					=C2=A0=C2=A0=C2=A0=C2=A0* when locked is 0x00000000.
> +					=C2=A0=C2=A0=C2=A0=C2=A0* Writing any non 0x1688A8A8 to
> +					=C2=A0=C2=A0=C2=A0=C2=A0* this register will lock it.
> +					=C2=A0=C2=A0=C2=A0=C2=A0*/
> +
> +/* AST_SCU_RESET 0x04 Reset control register */
> +#define SCU_RESET_H264		(0x1 << 26)
> +#define SCU_RESET_XDMA		(0x1 << 25)
> +#define SCU_RESET_MCTP		(0x1 << 24)
> +#define SCU_RESET_P2X		(0x1 << 24)
> +#define SCU_RESET_ADC		(0x1 << 23)
> +#define SCU_RESET_JTAG		(0x1 << 22)
> +#define SCU_RESET_PCIE_DIR	(0x1 << 21)
> +#define SCU_RESET_PCIE		(0x1 << 19)
> +#define SCU_RESET_MIC		(0x1 << 18)
> +#define SCU_RESET_RFX		(0x1 << 17)
> +#define SCU_RESET_SD		(0x1 << 16)
> +#define SCU_RESET_USB11		(0x1 << 15)
> +#define SCU_RESET_USB20		(0x1 << 14)
> +#define SCU_RESET_CRT		(0x1 << 13)
> +#define SCU_RESET_MAC1		(0x1 << 12)
> +#define SCU_RESET_MAC0		(0x1 << 11)
> +#define SCU_RESET_PECI		(0x1 << 10)
> +#define SCU_RESET_PWM		(0x1 << 9)
> +#define SCU_PCI_VGA_DIS		(0x1 << 8)
> +#define SCU_RESET_2D		(0x1 << 7)
> +#define SCU_RESET_VIDEO		(0x1 << 6)
> +#define SCU_RESET_LPC		(0x1 << 5)
> +#define SCU_RESET_HACE		(0x1 << 4)
> +#define SCU_RESET_USB_P1	(0x1 << 3)
> +#define SCU_RESET_I2C		(0x1 << 2)
> +#define SCU_RESET_AHB		(0x1 << 1)
> +#define SCU_RESET_SRAM_CTRL	(0x1)
> +
> +/* AST_SCU_RESET2 0xD4	Reset Control register set 2 */
> +#define SCU_RESET_CRT3		(0x1 << 8)
> +#define SCU_RESET_CRT2		(0x1 << 7)
> +#define SCU_RESET_CRT1		(0x1 << 6)
> +#define SCU_RESET_CRT0		(0x1 << 5)
> +#define SCU_RESET_NIC1		(0x1 << 4)
> +#define SCU_RESET_NIC0		(0x1 << 3)
> +#define SCU_RESET_RFXDEC	(0x1 << 2)
> +#define SCU_RESET_BITBLT	(0x1 << 1)
> +#define SCU_RESET_RFXCMQ	(0x1)
> +
> +#define SCU_PROTECT_LOCK	0x123456789 /* Lock SCU registers: Write
> +					=C2=A0=C2=A0=C2=A0=C2=A0* 0x123456789 to this register
> +					=C2=A0=C2=A0=C2=A0=C2=A0*/
> +#define AST_IO_VA		0xf0000000
> +#define AST_IO(__pa)	((void __iomem *)(((__pa) & 0x001fffff) | AST_IO_VA=
))
> +
> +void aspeed_toggle_scu_reset(u32 mask, u32 delay);
> +void aspeed_scu_multi_func_reset(u32 reg, u32 amask, u32 omask);
> +
> +#endif /* __ASM_ARCH_ASPEED_RESET_H */
> diff --git a/arch/arm/mach-aspeed/reset.c b/arch/arm/mach-aspeed/reset.c
> new file mode 100644
> index 0000000..1ca0d8e
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/reset.c
> @@ -0,0 +1,86 @@
> +/*
> + * arch/arm/mach-aspeed/reset.c
> + * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions ar=
e met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *=C2=A0=C2=A0=C2=A0=C2=A0notice, this list of conditions and the follow=
ing disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *=C2=A0=C2=A0=C2=A0=C2=A0notice, this list of conditions and the follow=
ing disclaimer in the
> + *=C2=A0=C2=A0=C2=A0=C2=A0documentation and/or other materials provided =
with the distribution.
> + * 3. Neither the names of the copyright holders nor the names of its
> + *=C2=A0=C2=A0=C2=A0=C2=A0contributors may be used to endorse or promote=
 products derived from
> + *=C2=A0=C2=A0=C2=A0=C2=A0this software without specific prior written p=
ermission.
> + *
> + * Alternatively, this software may be distributed under the terms of th=
e
> + * GNU General Public License ("GPL") version 2 as published by the Free
> + * Software Foundation.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "=
AS IS"
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,=
 THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PU=
RPOSE
> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS=
 BE
> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSIN=
ESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER =
IN
> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWIS=
E)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED O=
F THE
> + * POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +
> +static DEFINE_SPINLOCK(aspeed_scu_lock);
> +
> +/*
> + * aspeed_toggle_scu_reset - reset SoC micro-controller.
> + * Resets the requested micro-controller.
> + */
> +void aspeed_toggle_scu_reset(u32 mask, u32 delay)
> +{
> +	u32 val;
> +
> +	spin_lock(&aspeed_scu_lock);
> +	val =3D readl(AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
> +	writel(SCU_PROTECT_UNLOCK, AST_IO(AST_BASE_SCU));
> +	writel(val | mask, AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
> +	udelay(delay);
> +	val =3D readl(AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
> +	writel(val & ~mask, AST_IO(AST_BASE_SCU) + AST_SCU_RESET);
> +	spin_unlock(&aspeed_scu_lock);
> +}
> +EXPORT_SYMBOL(aspeed_toggle_scu_reset);
> +
> +/*
> + * aspeed_scu_multi_func_reset - Multi-function Pin Control.
> + * Resets the requested mutli-function pins.
> + */
> +void aspeed_scu_multi_func_reset(u32 reg, u32 amask, u32 omask)
> +{
> +	u32 val =3D 0;
> +
> +	spin_lock(&aspeed_scu_lock);
> +	val =3D readl(AST_IO(AST_BASE_SCU) + reg);
> +	val &=3D ~amask;
> +	writel(SCU_PROTECT_UNLOCK, AST_IO(AST_BASE_SCU));
> +	writel(val | omask, AST_IO(AST_BASE_SCU) + reg);
> +	spin_unlock(&aspeed_scu_lock);
> +}
> +EXPORT_SYMBOL(aspeed_scu_multi_func_reset);

As a note for both of these function implementations the SCU is
described in the devicetree by a syscon node as of the introduction of
the pinmux driver. I suggest these functions be re-worked in terms of
the syscon regmap. The driver could then be described in the devicetree
as a child of the SCU syscon, much the same as the pinmux driver, with
a probe() implementation to grab a reference to the SCU syscon/regmap.

Cheers,

Andrew

> +
> +MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
> +MODULE_DESCRIPTION("Aspeed SoC controllers reset");
> +MODULE_LICENSE("GPL v2");
> diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
> index 2ed1b8a..742ef24 100644
> --- a/arch/arm/tools/mach-types
> +++ b/arch/arm/tools/mach-types
> @@ -1006,3 +1006,4 @@ eco5_bx2		MACH_ECO5_BX2		ECO5_BX2		4572
> =C2=A0eukrea_cpuimx28sd	MACH_EUKREA_CPUIMX28SD	EUKREA_CPUIMX28SD	4573
> =C2=A0domotab			MACH_DOMOTAB		DOMOTAB			4574
> =C2=A0pfla03			MACH_PFLA03		PFLA03			4575
> +aspeed			MACH_ASPEED_G5		ASPEED_G5		4576
--=-B/JAHAd9qFo0dbAOUZjB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXumyPAAoJEJ0dnzgO5LT5VGUP/1/6g2P6EvWioHrKs+FtAqMh
8/Y+2U7DbEASIOyhZAp9UfOfrOZclaRUg+p1zK9AG8oh0O5rtB5sa5Kh8+EfIoRQ
eO8dXmEJfig26s4NVfkeactSS+fNJVaxHJFHK3DZqK4AXTh+q1ENnKYODJ+qSm0r
4Ih0ZsLma3rLNQFimDkboPVZOthuxJhDFi8l4un987eQGf7b9G4/d+m+1RJvmTSB
EfxGxkVaNMv4YVRfC4IPBkJjnfSk3UUuDzMoj8lDTZ4DzTeKCxZxrl+iWeMhngkv
YMO9ie/qur1n9amaEzvcT6szRBjfFgMIuQiDzwaCfDMyj+w61/C1r4QtzHYv9kAd
DFGMGFv6tFtej4Ljw8MQ8Q1BtA+G2lToDgrqkTHqr0m675iI6cV6Rd+pWJxsBDz4
X2iTnNzoaIx5uKoAkeMQVVQxUGjvPFeLwO1hXioSE8rFeRIzh3FJYZLzmfGER3MS
fQRBlb3pJxdIA7bSZUaD3THh8TuMhpwZwPxMu2vtOz1fKLrD9uzsCUDg+PQL//mL
xV8Ab2PP5syW2exdVH9nmfGzWadlF6clMHzqRyQP8QQEm2VsW2Xl7NSOze5m/nST
ZB802zjcKO/SNS6aSOSlvwttPgqQ0qC9TcC12yy06UxiTeTwv5eUZE8ObneBv7wS
bIcbmpYW9xQNwVarWglv
=MMIN
-----END PGP SIGNATURE-----

--=-B/JAHAd9qFo0dbAOUZjB--
