Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sHddL30DRzDqCZ
 for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2016 13:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=SWmNehdL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=jzW+sn9Z; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A7652050B;
 Sun, 21 Aug 2016 23:01:40 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Sun, 21 Aug 2016 23:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ovvUx
 m5zYmrCxRye7ZM0nNr4z2U=; b=SWmNehdLXkb5XY26As5mHt+hYacfBk4qsKz5Q
 VdR+G+8rv1GeLcdvbzB9Qd76h56MAQdU+pyoWDmMSywEymH7NWN0hkLPn7A2U36q
 xQIconWN5ocoUNo+b6A15yVzsdiUz8Qme8mR31R9SdOz1eQ65TEYpHEhTqzadTW9
 wJbTvQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=ovvUxm5zYmrCxRye7ZM0nNr4z2U=; b=jzW+s
 n9ZRBoiuI2At47lno3X8LEcPlfqY65F9l2q8f1LVnWh/yrTNkGME73huJPSG/aoh
 Z9/0bzmkS/IwEQ4tRkJottkpcRWTfYDr4RzI23pOQBM/HqVxYltpHErTB7JqOz7o
 ZJ97Ylnyogf4/4xE8DzKNkwOIyjX/2XN1LnDn8=
X-Sasl-enc: Il1gubfXP0HvLCIrsFPbkNA6xiaZ9GR/HVoieW9rAePR 1471834899
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1EED0CCDC7;
 Sun, 21 Aug 2016 23:01:37 -0400 (EDT)
Message-ID: <1471834883.5707.42.camel@aj.id.au>
Subject: Re: [dev-4.7 patch 04/11] pinctrl (aspeed) introduce Aspeed SoC
 jtag driver
From: Andrew Jeffery <andrew@aj.id.au>
To: vadimp@mellanox.com, openbmc@lists.ozlabs.org
Cc: jiri@mellanox.com, michaelsh@mellanox.com
Date: Mon, 22 Aug 2016 12:31:23 +0930
In-Reply-To: <1470812602-50968-1-git-send-email-vadimp@mellanox.com>
References: <1470812602-50968-1-git-send-email-vadimp@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-vBmlHDzsm4FLKlSiTOsj"
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
X-List-Received-Date: Mon, 22 Aug 2016 03:01:43 -0000


--=-vBmlHDzsm4FLKlSiTOsj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vadim,

On Wed, 2016-08-10 at 07:03 +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
>=20
> The Kconfig controlling compilation of this code is:
> drivers/pinctrl/aspeed/Kconfig:config PINCTRL_ASPEED_JTAG

I can't see what the JTAG driver has to do with the pinctrl subsystem.
Can you clarify? Perhaps the driver should be moved elsewhere?

>=20
> Porting peci driver from 3.18 to 4.7.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A06 +
> =C2=A0drivers/pinctrl/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
|=C2=A0=C2=A0=C2=A04 +
> =C2=A0drivers/pinctrl/aspeed/aspeed-jtag.c | 919 ++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 929 insertions(+)
> =C2=A0create mode 100644 drivers/pinctrl/aspeed/aspeed-jtag.c
>=20
> diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kcon=
fig
> index ee45a96..0d289ab 100644
> --- a/drivers/pinctrl/aspeed/Kconfig
> +++ b/drivers/pinctrl/aspeed/Kconfig
> @@ -22,3 +22,9 @@ config PINCTRL_ASPEED_G5
> =C2=A0	help
> =C2=A0	=C2=A0=C2=A0Say Y here to enable pin controller support for Aspeed=
's 5th
> =C2=A0	=C2=A0=C2=A0generation AST SoCs. GPIO is provided by a separate GP=
IO driver.
> +
> +config PINCTRL_ASPEED_JTAG
> +	tristate "ASPEED JTAG control"
> +	default n
> +	help
> +	=C2=A0Driver for ASPEED JTAG controller driver
> diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Mak=
efile
> index 0f4b876..e229fd1 100644
> --- a/drivers/pinctrl/aspeed/Makefile
> +++ b/drivers/pinctrl/aspeed/Makefile
> @@ -1,5 +1,9 @@
> =C2=A0# Aspeed pinctrl support
> =C2=A0
> +ccflags-$(CONFIG_ARCH_MULTIPLATFORM) :=3D \
> +	-I$(srctree)/arch/arm/mach-aspeed/include
> +
> =C2=A0obj-$(CONFIG_PINCTRL_ASPEED)	+=3D pinctrl-aspeed.o
> =C2=A0obj-$(CONFIG_PINCTRL_ASPEED_G4)	+=3D pinctrl-aspeed-g4.o
> =C2=A0obj-$(CONFIG_PINCTRL_ASPEED_G5)	+=3D pinctrl-aspeed-g5.o
> +obj-$(CONFIG_PINCTRL_ASPEED_JTAG)	+=3D aspeed-jtag.o
> diff --git a/drivers/pinctrl/aspeed/aspeed-jtag.c b/drivers/pinctrl/aspee=
d/aspeed-jtag.c
> new file mode 100644
> index 0000000..11ac953
> --- /dev/null
> +++ b/drivers/pinctrl/aspeed/aspeed-jtag.c
> @@ -0,0 +1,919 @@
> +/*
> + *=C2=A0=C2=A0driver/pincntrl/aspeed_jtag.c
> + *
> + *=C2=A0=C2=A0ASPEED JTAG controller driver
> + *
> + *=C2=A0=C2=A0Copyright (C) 2012-2020=C2=A0=C2=A0ASPEED Technology Inc.
> + *
> + *=C2=A0=C2=A0This program is free software; you can redistribute it and=
/or modify
> + *=C2=A0=C2=A0it under the terms of the GNU General Public License versi=
on 2 as
> + *=C2=A0=C2=A0published by the Free Software Foundation.
> + *
> + *=C2=A0=C2=A0History:
> + *=C2=A0=C2=A0=C2=A02012.08.06: Initial version [Ryan Chen]
> + *=C2=A0=C2=A0=C2=A02016.0806: Porting to kernel 4.7
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
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +
> +#define AST_JTAG_DATA			0x00
> +#define AST_JTAG_INST			0x04
> +#define AST_JTAG_CTRL			0x08
> +#define AST_JTAG_ISR			0x0C
> +#define AST_JTAG_SW			0x10
> +#define AST_JTAG_TCK			0x14
> +#define AST_JTAG_IDLE			0x18

Interestingly the AST2500 datasheet doesn't list the IDLE reg in its
summary list, but does in the register tables. Par for the course I
guess.

> +
> +/* AST_JTAG_CTRL - 0x08 : Engine Control */
> +#define JTAG_ENG_EN			(0x1 << 31)
> +#define JTAG_ENG_OUT_EN			(0x1 << 30)
> +#define JTAG_FORCE_TMS			(0x1 << 29)
> +#define JTAG_IR_UPDATE			(0x1 << 26)
> +#define JTAG_INST_LEN_MASK		(0x3f << 20)
> +#define JTAG_SET_INST_LEN(x)		(x << 20)
> +#define JTAG_SET_INST_MSB		(0x1 << 19)
> +#define JTAG_TERMINATE_INST		(0x1 << 18)
> +#define JTAG_LAST_INST			(0x1 << 17)
> +#define JTAG_INST_EN			(0x1 << 16)
> +#define JTAG_DATA_LEN_MASK		(0x3f << 4)
> +#define JTAG_DR_UPDATE			(0x1 << 10)

JTAG_DR_UPDATE is out of order?

> +#define JTAG_DATA_LEN(x)		(x << 4)
> +#define JTAG_SET_DATA_MSB		(0x1 << 3)
> +#define JTAG_TERMINATE_DATA		(0x1 << 2)
> +#define JTAG_LAST_DATA			(0x1 << 1)
> +#define JTAG_DATA_EN			(0x1)

Minor issue with formatting: Sometimes indentation of #define values is
used to indicate available values within a bitfield, but it seems like
a number of these defines are dealing with independent bits yet have
varying indentations. Is the list meant to be formatted this way? The
defines below also look odd.

> +
> +/* AST_JTAG_ISR	- 0x0C : INterrupt status and enable */
> +#define JTAG_INST_PAUSE			(0x1 << 19)
> +#define JTAG_INST_COMPLETE		(0x1 << 18)
> +#define JTAG_DATA_PAUSE			(0x1 << 17)
> +#define JTAG_DATA_COMPLETE		(0x1 << 16)
> +
> +#define JTAG_INST_PAUSE_EN		(0x1 << 3)
> +#define JTAG_INST_COMPLETE_EN		(0x1 << 2)
> +#define JTAG_DATA_PAUSE_EN		(0x1 << 1)
> +#define JTAG_DATA_COMPLETE_EN		(0x1)
> +
> +/* AST_JTAG_SW	- 0x10 : Software Mode and Status */
> +#define JTAG_SW_MODE_EN			(0x1 << 19)
> +#define JTAG_SW_MODE_TCK		(0x1 << 18)
> +#define JTAG_SW_MODE_TMS		(0x1 << 17)
> +#define JTAG_SW_MODE_TDIO		(0x1 << 16)
> +#define JTAG_STS_INST_PAUSE		(0x1 << 2)
> +#define JTAG_STS_DATA_PAUSE		(0x1 << 1)
> +#define JTAG_STS_ENG_IDLE		(0x1)
> +
> +/* AST_JTAG_TCK	- 0x14 : TCK Control */
> +#define JTAG_TCK_INVERSE		(0x1 << 31)
> +#define JTAG_TCK_DIVISOR_MASK		(0x7ff)
> +#define JTAG_GET_TCK_DIVISOR(x)		(x & 0x7ff)
> +
> +/*=C2=A0=C2=A0AST_JTAG_IDLE - 0x18 : Ctroller set for go to IDLE */
> +#define JTAG_GO_IDLE			(0x1)
> +
> +enum aspeed_jtag_xfer_mode {
> +	JTAG_XFER_HW_MODE =3D 0,
> +	JTAG_XFER_SW_MODE =3D 1,
> +};
> +
> +struct runtest_idle {
> +	enum aspeed_jtag_xfer_mode	mode;	/* 0 :HW mode, 1: SW mode */
> +	unsigned char			reset;	/* Test Logic Reset */
> +	unsigned char			end;	/* o: idle, 1: ir pause, 2: drpause */
> +	unsigned char			tck;	/* keep tck */
> +};
> +
> +struct sir_xfer {
> +	enum aspeed_jtag_xfer_mode	mode;	/* 0 :HW mode, 1: SW mode */
> +	unsigned short			length;	/* bits */
> +	unsigned int			tdi;
> +	unsigned int			tdo;
> +	unsigned char			endir;	/* 0: idle, 1:pause */
> +};
> +
> +struct sdr_xfer {
> +	enum aspeed_jtag_xfer_mode	mode;	/* 0 :HW mode, 1: SW mode */
> +	unsigned char			direct; /* 0 ; read , 1 : write */
> +	unsigned short			length;	/* bits */
> +	unsigned int			*tdio;
> +	unsigned char			enddr;	/* 0: idle, 1:pause */
> +};
> +
> +#define JTAGIOC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0'T'
> +
> +#define AST_JTAG_IOCRUNTEST	_IOW(JTAGIOC_BASE, 0, struct runtest_idle)
> +#define AST_JTAG_IOCSIR		_IOWR(JTAGIOC_BASE, 1, struct sir_xfer)
> +#define AST_JTAG_IOCSDR		_IOWR(JTAGIOC_BASE, 2, struct sdr_xfer)
> +#define AST_JTAG_SIOCFREQ	_IOW(JTAGIOC_BASE, 3, unsigned int)
> +#define AST_JTAG_GIOCFREQ	_IOR(JTAGIOC_BASE, 4, unsigned int)
> +
> +struct aspeed_jtag_info {
> +	void __iomem		*reg_base;
> +	struct device		*dev;
> +	u8			sts; /* 0: idle, 1:irpause 2:drpause */
> +	int			irq; /* JTAG IRQ number */
> +	u32			flag;
> +	wait_queue_head_t	jtag_wq;
> +	bool=C2=A0			is_open;
> +};
> +
> +struct aspeed_jtag_info *aspeed_jtag;
> +static DEFINE_SPINLOCK(jtag_state_lock);
> +
> +static inline u32
> +aspeed_jtag_read(struct aspeed_jtag_info *aspeed_jtag, u32 reg)
> +{
> +	return readl(aspeed_jtag->reg_base + reg);
> +}
> +
> +static inline void
> +aspeed_jtag_write(struct aspeed_jtag_info *aspeed_jtag, u32 val, u32 reg=
)
> +{
> +	dev_dbg(aspeed_jtag->dev, "reg =3D 0x%08x, val =3D 0x%08x\n", reg, val)=
;
> +	writel(val, aspeed_jtag->reg_base + reg);
> +}
> +
> +u32 ast_get_pclk(void)
> +{
> +	return 0;

Should this be interacting with the clk infrastructure?

> +}
> +
> +void
> +aspeed_jtag_set_freq(struct aspeed_jtag_info *aspeed_jtag, unsigned int =
freq)
> +{
> +	u16 i;
> +
> +	for (i =3D 0; i < 0x7ff; i++) {

What is 0x7ff? Having dissected the code a little more it seems it's
the maximum divisor value...

> +		if ((ast_get_pclk() / (i + 1)) <=3D freq)

By the ast_get_pclk() implementation above this is trivially true.=C2=A0

Anyway, this could be re-written to avoid the loop. Roughly from the
datasheet:

    Ptck =3D Ppclk * (Dtck + 1)
=C2=A0 =C2=A0Ptck / Ppclk =3D Dtck + 1
    (Ptck / Ppclk) - 1 =3D Dtck


This does assume that 0 < Ppclk <=3D Ptck, but a broader case is handled
by the code as it stands (i.e. it's robust in the face of the 0
returned by ast_get_pclk()).

Assuming both ast_get_pclk() gives Hz and not a period, the code might
look like:


    if (0 < ast_get_pclk() && freq < ast_get_pclk()) {
        i =3D (ast_get_pclk() / freq) - 1;
    } else {
    =C2=A0 =C2=A0WARN(freq > ast_get_pclk(), ...);
    =C2=A0 =C2=A0WARN(freq =3D=3D 0, ...);
        i =3D 0;
}


> +			break;
> +	}
> +	aspeed_jtag_write(aspeed_jtag,
> +			=C2=A0=C2=A0((aspeed_jtag_read(aspeed_jtag, AST_JTAG_TCK) &
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0~JTAG_TCK_DIVISOR_MASK) | i),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST_JTAG_TCK);
> +}
> +
> +unsigned int aspeed_jtag_get_freq(struct aspeed_jtag_info *aspeed_jtag)
> +{
> +	return ast_get_pclk() /
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(JTAG_GET_TCK_DIVISOR(aspeed_=
jtag_read(aspeed_jtag,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST_JTAG_TCK)) + 1);

Again, always 0 due to ast_get_pclk() implementation

> +}
> +
> +void dummy(struct aspeed_jtag_info *aspeed_jtag, unsigned int cnt)
> +{
> +	int i =3D 0;
> +
> +	for (i =3D 0; i < cnt; i++)
> +		aspeed_jtag_read(aspeed_jtag, AST_JTAG_SW);
> +}
> +
> +static u8 TCK_Cycle(struct aspeed_jtag_info *aspeed_jtag, u8 TMS, u8 TDI=
)
> +{
> +	u8 tdo;
> +
> +	/* TCK =3D 0 */
> +	aspeed_jtag_write(aspeed_jtag, JTAG_SW_MODE_EN |
> +			=C2=A0=C2=A0(TMS * JTAG_SW_MODE_TMS) | (TDI * JTAG_SW_MODE_TDIO),
> +			=C2=A0=C2=A0AST_JTAG_SW);
> +
> +	dummy(aspeed_jtag, 10);
> +
> +	/* TCK =3D 1 */
> +	aspeed_jtag_write(aspeed_jtag, JTAG_SW_MODE_EN | JTAG_SW_MODE_TCK |
> +			=C2=A0=C2=A0(TMS * JTAG_SW_MODE_TMS) | (TDI * JTAG_SW_MODE_TDIO),
> +			=C2=A0=C2=A0AST_JTAG_SW);
> +
> +	if (aspeed_jtag_read(aspeed_jtag, AST_JTAG_SW) & JTAG_SW_MODE_TDIO)
> +		tdo =3D 1;
> +	else
> +		tdo =3D 0;
> +
> +	dummy(aspeed_jtag, 10);
> +
> +	/* TCK =3D 0 */
> +	aspeed_jtag_write(aspeed_jtag, JTAG_SW_MODE_EN | (TMS *
> +			=C2=A0=C2=A0JTAG_SW_MODE_TMS) | (TDI * JTAG_SW_MODE_TDIO),
> +			=C2=A0=C2=A0AST_JTAG_SW);
> +
> +	return tdo;
> +}
> +
> +void aspeed_jtag_wait_instruction_complete(struct aspeed_jtag_info *aspe=
ed_jtag)
> +{
> +	wait_event_interruptible(aspeed_jtag->jtag_wq, (aspeed_jtag->flag =3D=
=3D
> +				=C2=A0JTAG_INST_COMPLETE));
> +	dev_err(aspeed_jtag->dev, "\n");
> +	aspeed_jtag->flag =3D 0;
> +}
> +
> +void aspeed_jtag_wait_data_pause_complete(struct aspeed_jtag_info *aspee=
d_jtag)
> +{
> +	wait_event_interruptible(aspeed_jtag->jtag_wq, (aspeed_jtag->flag =3D=
=3D
> +				=C2=A0JTAG_DATA_PAUSE));
> +	dev_err(aspeed_jtag->dev, "\n");
> +	aspeed_jtag->flag =3D 0;
> +}
> +
> +void aspeed_jtag_wait_data_complete(struct aspeed_jtag_info *aspeed_jtag=
)
> +{
> +	wait_event_interruptible(aspeed_jtag->jtag_wq, (aspeed_jtag->flag =3D=
=3D
> +				=C2=A0JTAG_DATA_COMPLETE));
> +	dev_err(aspeed_jtag->dev, "\n");
> +	aspeed_jtag->flag =3D 0;
> +}
> +
> +/* JTAG_reset() is to generate at least 9 TMS high and 1 TMS low to forc=
e
> + * devices into Run-Test/Idle State.
> + */
> +void aspeed_jtag_run_test_idle(struct aspeed_jtag_info *aspeed_jtag,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct runtest_idle *runtes=
t)
> +{
> +	int i =3D 0;
> +
> +	dev_dbg(aspeed_jtag->dev, ":%s mode\n", runtest->mode ? "SW":"HW");
> +
> +	if (runtest->mode) {
> +		/* SW mode from idle , from pause,=C2=A0=C2=A0-- > to pause, to idle *=
/
> +		if (runtest->reset) {
> +			for (i =3D 0; i < 10; i++)
> +				TCK_Cycle(aspeed_jtag, 1, 0);
> +		}
> +
> +		switch (aspeed_jtag->sts) {
> +		case 0:
> +			if (runtest->end =3D=3D 1) {
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* DRSCan */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* IRSCan */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* IRCap */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* IRExit1 */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* IRPause */
> +				aspeed_jtag->sts =3D 1;
> +			} else if (runtest->end =3D=3D 2) {
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* DRSCan */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* DRCap */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* DRExit1 */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* DRPause */
> +				aspeed_jtag->sts =3D 1;
> +			} else {
> +				TCK_Cycle(aspeed_jtag, 0, 0);/* IDLE */
> +				aspeed_jtag->sts =3D 0;
> +			}
> +			break;
> +
> +		case 1:
> +			/* from IR/DR Pause */
> +			if (runtest->end =3D=3D 1) {
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* Exit2 IR/DR */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* Updt IR/DR */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* DRSCan */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* IRSCan */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* IRCap */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* IRExit1 */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* IRPause */
> +				aspeed_jtag->sts =3D 1;
> +			} else if (runtest->end =3D=3D 2) {
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* Exit2 IR/DR */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* Update IR/DR */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* DRSCan */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* DRCap */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* DRExit1 */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* DRPause */
> +				aspeed_jtag->sts =3D 1;
> +			} else {
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* Exit2 IR/DR */
> +				TCK_Cycle(aspeed_jtag, 1, 0); /* Updt IR/DR */
> +				TCK_Cycle(aspeed_jtag, 0, 0); /* IDLE */
> +				aspeed_jtag->sts =3D 0;
> +			}
> +			break;
> +
> +		default:
> +			dev_err(aspeed_jtag->dev,
> +				"aspeed_jtag_run_test_idle error\n");
> +			break;
> +		}
> +
> +		/* stay on IDLE for at least=C2=A0=C2=A0TCK cycle */
> +		for (i =3D 0; i < runtest->tck; i++)
> +			TCK_Cycle(aspeed_jtag, 0, 0);
> +	} else {
> +		/* dis sw mode */
> +		aspeed_jtag_write(aspeed_jtag, 0, AST_JTAG_SW);
> +		mdelay(1);
> +		/* x TMS high + 1 TMS low */
> +		if (runtest->reset)
> +			aspeed_jtag_write(aspeed_jtag, JTAG_ENG_EN |
> +					=C2=A0=C2=A0JTAG_ENG_OUT_EN | JTAG_FORCE_TMS,
> +					=C2=A0=C2=A0AST_JTAG_CTRL);
> +		else
> +			aspeed_jtag_write(aspeed_jtag, JTAG_GO_IDLE,
> +					=C2=A0=C2=A0AST_JTAG_IDLE);
> +		mdelay(1);
> +		aspeed_jtag_write(aspeed_jtag, JTAG_SW_MODE_EN |
> +				=C2=A0=C2=A0JTAG_SW_MODE_TDIO, AST_JTAG_SW);
> +		aspeed_jtag->sts =3D 0;
> +	}
> +}
> +
> +int aspeed_jtag_sir_xfer(struct aspeed_jtag_info *aspeed_jtag,
> +			=C2=A0struct sir_xfer *sir)
> +{
> +	int i =3D 0;
> +
> +	dev_err(aspeed_jtag->dev, "%s mode, ENDIR : %d, len : %d\n",
> +		sir->mode ? "SW":"HW", sir->endir, sir->length);
> +
> +	if (sir->mode) {
> +		if (aspeed_jtag->sts) {
> +			/* from IR/DR Pause */
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* Exit2 IR / DR */
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* Update IR /DR */
> +		}
> +
> +		TCK_Cycle(aspeed_jtag, 1, 0); /* DRSCan */
> +		TCK_Cycle(aspeed_jtag, 1, 0); /* IRSCan */
> +		TCK_Cycle(aspeed_jtag, 0, 0); /* CapIR */
> +		TCK_Cycle(aspeed_jtag, 0, 0); /* ShiftIR */
> +
> +		sir->tdo =3D 0;
> +		for (i =3D 0; i < sir->length; i++) {
> +			if (i =3D=3D (sir->length - 1)) {

Would be better to terminate the loop early and then do the body
unconditionally afterwards.

> +				/* IRExit1 */
> +				sir->tdo |=3D TCK_Cycle(aspeed_jtag, 1,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sir->tdi & 0x1);
> +			} else {
> +				/* ShiftIR */
> +				sir->tdo |=3D TCK_Cycle(aspeed_jtag, 0,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sir->tdi & 0x1);
> +				sir->tdi >>=3D 1;
> +				sir->tdo <<=3D 1;
> +			}
> +		}
> +
> +		TCK_Cycle(aspeed_jtag, 0, 0); /* IRPause */
> +
> +		/* stop pause */
> +		if (sir->endir =3D=3D 0) {
> +			/* go to idle */
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* IRExit2 */
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* IRUpdate */
> +			TCK_Cycle(aspeed_jtag, 0, 0); /* IDLE */
> +		}
> +	} else {
> +		/* hw mode - disable sw mode */
> +		aspeed_jtag_write(aspeed_jtag, 0, AST_JTAG_SW);
> +		aspeed_jtag_write(aspeed_jtag, sir->tdi, AST_JTAG_INST);
> +
> +		if (sir->endir) {
> +			aspeed_jtag_write(aspeed_jtag, JTAG_ENG_EN |
> +					=C2=A0=C2=A0JTAG_ENG_OUT_EN |
> +					=C2=A0=C2=A0JTAG_SET_INST_LEN(sir->length),
> +					=C2=A0=C2=A0AST_JTAG_CTRL);
> +			aspeed_jtag_write(aspeed_jtag, JTAG_ENG_EN |
> +					=C2=A0=C2=A0JTAG_ENG_OUT_EN |
> +					=C2=A0=C2=A0JTAG_SET_INST_LEN(sir->length) |
> +					=C2=A0=C2=A0JTAG_INST_EN, AST_JTAG_CTRL);
> +		} else {
> +			aspeed_jtag_write(aspeed_jtag, JTAG_ENG_EN |
> +					=C2=A0=C2=A0JTAG_ENG_OUT_EN | JTAG_LAST_INST |
> +					=C2=A0=C2=A0JTAG_SET_INST_LEN(sir->length),
> +					=C2=A0=C2=A0AST_JTAG_CTRL);
> +			aspeed_jtag_write(aspeed_jtag, JTAG_ENG_EN |
> +					=C2=A0=C2=A0JTAG_ENG_OUT_EN | JTAG_LAST_INST |
> +					=C2=A0=C2=A0JTAG_SET_INST_LEN(sir->length) |
> +					=C2=A0=C2=A0JTAG_INST_EN, AST_JTAG_CTRL);
> +		}
> +
> +		aspeed_jtag_wait_instruction_complete(aspeed_jtag);
> +		sir->tdo =3D aspeed_jtag_read(aspeed_jtag, AST_JTAG_INST);
> +		aspeed_jtag_write(aspeed_jtag, JTAG_SW_MODE_EN |
> +				=C2=A0=C2=A0JTAG_SW_MODE_TDIO, AST_JTAG_SW);
> +	}
> +
> +	aspeed_jtag->sts =3D sir->endir;
> +
> +	return 0;
> +}
> +
> +int aspeed_jtag_sdr_xfer(struct aspeed_jtag_info *aspeed_jtag,
> +			=C2=A0struct sdr_xfer *sdr)
> +{
> +	unsigned int index =3D 0;
> +	u32 shift_bits =3D 0;
> +	u32 tdo =3D 0;
> +	u32 remain_xfer =3D sdr->length;
> +
> +	dev_err(aspeed_jtag->dev, "%s mode, ENDDR : %d, len : %d\n",
> +		sdr->mode ? "SW":"HW", sdr->enddr, sdr->length);
> +
> +	if (sdr->mode) {
> +		/* SW mode */
> +		if (aspeed_jtag->sts) {
> +			/* from IR/DR Pause */
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* Exit2 IR / DR */
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* Update IR /DR */
> +		}
> +
> +		TCK_Cycle(aspeed_jtag, 1, 0); /* DRScan */
> +		TCK_Cycle(aspeed_jtag, 0, 0); /* DRCap */
> +		TCK_Cycle(aspeed_jtag, 0, 0); /* DRShift */
> +
> +		while (remain_xfer) {
> +			if (sdr->direct) {
> +				/* write */
> +				if ((shift_bits % 32) =3D=3D 0)
> +					dev_err(aspeed_jtag->dev, "W dr->dr_data[%d]: %x\n",
> +						index, sdr->tdio[index]);

I guess we always read before write? Or is this not actually an error?

> +
> +				tdo =3D (sdr->tdio[index] >> (shift_bits % 32)) &
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x1;
> +				dev_err(aspeed_jtag->dev, "%d\n", tdo);

Should this be dev_err()?

> +				if (remain_xfer =3D=3D 1)
> +					/* DRExit1 */
> +					TCK_Cycle(aspeed_jtag, 1, tdo);
> +				else
> +					/* DRShit */
> +					TCK_Cycle(aspeed_jtag, 0, tdo);
> +			} else {
> +				/* read */
> +				if (remain_xfer =3D=3D 1)
> +					/* DRExit1 */
> +					tdo =3D TCK_Cycle(aspeed_jtag, 1, tdo);
> +				else
> +					/* DRShit */
> +					tdo =3D TCK_Cycle(aspeed_jtag, 0, tdo);
> +
> +				dev_err(aspeed_jtag->dev, "%d\n", tdo);

Should this be dev_err()?

> +				sdr->tdio[index] |=3D (tdo << (shift_bits % 32));
> +
> +				if ((shift_bits % 32) =3D=3D 0)
> +					dev_err(aspeed_jtag->dev, "R dr->dr_data[%d]: %x\n",
> +						=C2=A0=C2=A0index, sdr->tdio[index]);
> +			}
> +			shift_bits++;
> +			remain_xfer--;
> +			if ((shift_bits % 32) =3D=3D 0)
> +				index++;
> +		}
> +
> +		TCK_Cycle(aspeed_jtag, 0, 0); /* DRPause */
> +
> +		if (sdr->enddr =3D=3D 0) {
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* DRExit2 */
> +			TCK_Cycle(aspeed_jtag, 1, 0); /* DRUpdate */
> +			TCK_Cycle(aspeed_jtag, 0, 0); /* IDLE */
> +		}
> +	} else {
> +		/* hw mode */
> +		aspeed_jtag_write(aspeed_jtag, 0, AST_JTAG_SW);
> +		while (remain_xfer) {
> +			if (sdr->direct) {
> +				dev_err(aspeed_jtag->dev,
> +					"W dr->dr_data[%d]: %x\n", index,
> +					=C2=A0=C2=A0sdr->tdio[index]);

Again, is this meant to be an error?

> +				aspeed_jtag_write(aspeed_jtag,
> +						=C2=A0=C2=A0sdr->tdio[index],
> +						=C2=A0=C2=A0=C2=A0AST_JTAG_DATA);
> +			} else {
> +				aspeed_jtag_write(aspeed_jtag, 0,
> +						=C2=A0=C2=A0AST_JTAG_DATA);
> +			}
> +
> +			if (remain_xfer > 32) {
> +				shift_bits =3D 32;
> +				/* read bytes were not equals to column length
> +				=C2=A0* =3D> Pause-DR
> +				=C2=A0*/
> +				dev_err(aspeed_jtag->dev, "shit bits %d\n",

dev_err() is appropriate for shit bits, but are these actually shit
bits? Or shift bits? =C2=A0I won't bother commenting for all the other
dev_err() instances, please check all instances though.

> +					shift_bits);
> +				aspeed_jtag_write(aspeed_jtag,
> +					JTAG_ENG_EN | JTAG_ENG_OUT_EN |
> +					JTAG_DATA_LEN(shift_bits),
> +					AST_JTAG_CTRL);
> +				aspeed_jtag_write(aspeed_jtag,
> +					JTAG_ENG_EN | JTAG_ENG_OUT_EN |
> +					JTAG_DATA_LEN(shift_bits) |
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0JTAG_DATA_EN,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST_JTAG_CTRL);
> +				aspeed_jtag_wait_data_pause_complete(
> +								aspeed_jtag);
> +			} else {
> +				/* read bytes equals to column length =3D>
> +				=C2=A0* Update-DR
> +				=C2=A0*/
> +				shift_bits =3D remain_xfer;
> +				dev_err(aspeed_jtag->dev,
> +					"shit bits %d with last\n",
> +					shift_bits);
> +				if (sdr->enddr) {
> +					dev_err(aspeed_jtag->dev, "DR Keep Pause\n");
> +						aspeed_jtag_write(aspeed_jtag,
> +						JTAG_ENG_EN | JTAG_ENG_OUT_EN |
> +						JTAG_DR_UPDATE |
> +						JTAG_DATA_LEN(shift_bits),
> +						AST_JTAG_CTRL);
> +						aspeed_jtag_write(aspeed_jtag,
> +						JTAG_ENG_EN | JTAG_ENG_OUT_EN |
> +						JTAG_DR_UPDATE |
> +						JTAG_DATA_LEN(shift_bits) |
> +						JTAG_DATA_EN, AST_JTAG_CTRL);
> +				} else {
> +					dev_err(aspeed_jtag->dev, "DR go IDLE\n");
> +						aspeed_jtag_write(aspeed_jtag,
> +						JTAG_ENG_EN | JTAG_ENG_OUT_EN |
> +						JTAG_LAST_DATA |
> +						JTAG_DATA_LEN(shift_bits),
> +						AST_JTAG_CTRL);
> +						aspeed_jtag_write(aspeed_jtag,
> +						JTAG_ENG_EN | JTAG_ENG_OUT_EN |
> +						JTAG_LAST_DATA |
> +						JTAG_DATA_LEN(shift_bits) |
> +						JTAG_DATA_EN, AST_JTAG_CTRL);
> +				}
> +				aspeed_jtag_wait_data_complete(aspeed_jtag);
> +			}
> +
> +			if (!sdr->direct) {
> +				if (shift_bits < 32)
> +					sdr->tdio[index] =3D
> +						aspeed_jtag_read(aspeed_jtag,
> +							AST_JTAG_DATA) >>
> +							(32 - shift_bits);
> +				else
> +					sdr->tdio[index] =3D
> +						aspeed_jtag_read(aspeed_jtag,
> +							AST_JTAG_DATA);
> +				dev_err(aspeed_jtag->dev,
> +						"R dr->dr_data[%d]: %x\n",
> +						index, sdr->tdio[index]);
> +			}
> +
> +			remain_xfer =3D remain_xfer - shift_bits;
> +			index++;
> +			dev_err(aspeed_jtag->dev, "remain_xfer %d\n",
> +				remain_xfer);
> +		}
> +		aspeed_jtag_write(aspeed_jtag, JTAG_SW_MODE_EN |
> +				=C2=A0=C2=A0JTAG_SW_MODE_TDIO, AST_JTAG_SW);
> +	}
> +
> +	aspeed_jtag->sts =3D sdr->enddr;
> +
> +	return 0;
> +}
> +
> +static irqreturn_t aspeed_jtag_interrupt(int this_irq, void *dev_id)
> +{
> +	u32 status;
> +	struct aspeed_jtag_info *aspeed_jtag =3D dev_id;
> +
> +	status =3D aspeed_jtag_read(aspeed_jtag, AST_JTAG_ISR);
> +	dev_err(aspeed_jtag->dev, "sts %x\n", status);
> +
> +	if (status & JTAG_INST_COMPLETE) {
> +		aspeed_jtag_write(aspeed_jtag, JTAG_INST_COMPLETE |
> +				=C2=A0=C2=A0(status & 0xf), AST_JTAG_ISR);
> +		aspeed_jtag->flag =3D JTAG_INST_COMPLETE;
> +	}
> +
> +	if (status & JTAG_DATA_PAUSE) {
> +		aspeed_jtag_write(aspeed_jtag, JTAG_DATA_PAUSE |
> +				=C2=A0=C2=A0(status & 0xf), AST_JTAG_ISR);
> +		aspeed_jtag->flag =3D JTAG_DATA_PAUSE;
> +	}
> +
> +	if (status & JTAG_DATA_COMPLETE) {
> +		aspeed_jtag_write(aspeed_jtag, JTAG_DATA_COMPLETE |
> +				=C2=A0=C2=A0(status & 0xf), AST_JTAG_ISR);
> +		aspeed_jtag->flag =3D JTAG_DATA_COMPLETE;
> +	}
> +
> +	if (aspeed_jtag->flag) {
> +		wake_up_interruptible(&aspeed_jtag->jtag_wq);
> +		return IRQ_HANDLED;
> +	} else {
> +		dev_err(aspeed_jtag->dev, "aspeed_jtag irq status (%x)\n",
> +			status);
> +		return IRQ_NONE;
> +	}
> +}
> +
> +static long jtag_ioctl(struct file *file, unsigned int cmd,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long arg)
> +{
> +	struct aspeed_jtag_info *aspeed_jtag =3D file->private_data;
> +	void __user *argp =3D (void __user *)arg;
> +	struct sir_xfer sir;
> +	struct sdr_xfer sdr;
> +	struct runtest_idle run_idle;
> +	int ret =3D 0;
> +
> +	switch (cmd) {
> +	case AST_JTAG_GIOCFREQ:
> +		ret =3D __put_user(aspeed_jtag_get_freq(aspeed_jtag),
> +				=C2=A0(unsigned int __user *)arg);
> +		break;
> +
> +	case AST_JTAG_SIOCFREQ:
> +		if ((unsigned int )arg > ast_get_pclk())
> +			ret =3D -EFAULT;
> +		else
> +			aspeed_jtag_set_freq(aspeed_jtag, (unsigned int)arg);
> +		break;
> +
> +	case AST_JTAG_IOCRUNTEST:
> +		if (copy_from_user(&run_idle, argp,
> +				=C2=A0=C2=A0=C2=A0sizeof(struct runtest_idle)))
> +			ret =3D -EFAULT;
> +		else
> +			aspeed_jtag_run_test_idle(aspeed_jtag, &run_idle);
> +
> +		break;
> +
> +	case AST_JTAG_IOCSIR:
> +		if (copy_from_user(&sir, argp, sizeof(struct sir_xfer)))
> +			ret =3D -EFAULT;
> +		else
> +			aspeed_jtag_sir_xfer(aspeed_jtag, &sir);
> +
> +		if (copy_to_user(argp, &sir, sizeof(struct sdr_xfer)))
> +			ret =3D -EFAULT;
> +
> +		break;
> +
> +	case AST_JTAG_IOCSDR:
> +		if (copy_from_user(&sdr, argp, sizeof(struct sdr_xfer)))
> +			ret =3D -EFAULT;
> +		else
> +			aspeed_jtag_sdr_xfer(aspeed_jtag, &sdr);
> +
> +		if (copy_to_user(argp, &sdr, sizeof(struct sdr_xfer)))
> +			ret =3D -EFAULT;
> +
> +		break;
> +	default:
> +
> +		return -ENOTTY;
> +	}
> +
> +	return ret;
> +}
> +
> +static int jtag_open(struct inode *inode, struct file *file)
> +{
> +	spin_lock(&jtag_state_lock);
> +	if (aspeed_jtag->is_open) {
> +		spin_unlock(&jtag_state_lock);
> +		return -EBUSY;
> +	}
> +
> +	aspeed_jtag->is_open =3D true;
> +	file->private_data =3D aspeed_jtag;
> +	spin_unlock(&jtag_state_lock);
> +
> +	return 0;
> +}
> +
> +static int jtag_release(struct inode *inode, struct file *file)
> +{
> +	struct aspeed_jtag_info *drvdata =3D file->private_data;
> +
> +	spin_lock(&jtag_state_lock);
> +	drvdata->is_open =3D false;
> +	spin_unlock(&jtag_state_lock);
> +
> +	return 0;
> +}
> +
> +static ssize_t show_sts(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aspeed_jtag_info *aspeed_jtag =3D dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%s\n", aspeed_jtag->sts ? "Pause" : "Idle");
> +}
> +
> +static DEVICE_ATTR(sts, S_IRUGO, show_sts, NULL);
> +
> +static ssize_t show_frequency(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{
> +	struct aspeed_jtag_info *aspeed_jtag =3D dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "Frequency (%d)\n", ast_get_pclk() /
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(JTAG_GET_TCK_DIVISOR(aspeed=
_jtag_read(aspeed_jtag,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST_JTAG_TCK)) + 1));
> +}
> +
> +static ssize_t store_frequency(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	unsigned long input_val;
> +	struct aspeed_jtag_info *aspeed_jtag =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 10, &input_val);
> +	if (ret)
> +		return ret;
> +
> +	aspeed_jtag_set_freq(aspeed_jtag, input_val);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(freq, S_IRUGO | S_IWUSR, show_frequency, store_freque=
ncy);
> +
> +static struct attribute *jtag_sysfs_entries[] =3D {
> +	&dev_attr_freq.attr,
> +	&dev_attr_sts.attr,
> +	NULL
> +};
> +
> +static struct attribute_group jtag_attribute_group =3D {
> +	.attrs =3D jtag_sysfs_entries,
> +};
> +
> +static const struct file_operations aspeed_jtag_fops =3D {
> +	.owner		=3D THIS_MODULE,
> +	.unlocked_ioctl	=3D jtag_ioctl,
> +	.open		=3D jtag_open,
> +	.release	=3D jtag_release,
> +};
> +
> +struct miscdevice aspeed_jtag_misc =3D {
> +	.minor	=3D MISC_DYNAMIC_MINOR,
> +	.name	=3D "aspeed-jtag",
> +	.fops	=3D &aspeed_jtag_fops,
> +};
> +
> +static void aspeed_jtag_remove_sysfs_group(void *_dev)
> +{
> +	struct device *dev =3D _dev;
> +
> +	sysfs_remove_group(&dev->kobj, &jtag_attribute_group);
> +}
> +
> +
> +static int aspeed_jtag_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	int ret =3D 0;
> +
> +	if (!of_device_is_compatible(pdev->dev.of_node,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"aspeed,aspeed2500-jtag"))
> +		return -ENODEV;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "cannot get IORESOURCE_MEM\n");
> +		ret =3D -ENOENT;
> +		goto out;
> +	}
> +
> +	aspeed_jtag =3D devm_kzalloc(&pdev->dev, sizeof(*aspeed_jtag),
> +				=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> +	if (!aspeed_jtag)
> +		return -ENOMEM;
> +
> +	aspeed_jtag->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (!aspeed_jtag->reg_base) {
> +		ret =3D -EIO;
> +		goto out_region;
> +	}
> +
> +	aspeed_jtag->irq =3D platform_get_irq(pdev, 0);
> +	if (aspeed_jtag->irq < 0) {
> +		dev_err(&pdev->dev, "no irq specified\n");
> +		ret =3D -ENOENT;
> +		goto out_region;
> +	}
> +
> +	/* Init JTAG */
> +	aspeed_toggle_scu_reset(SCU_RESET_JTAG, 3);
> +
> +	/* Eanble Clock */
> +	aspeed_jtag_write(aspeed_jtag, JTAG_ENG_EN | JTAG_ENG_OUT_EN,
> +			=C2=A0=C2=A0AST_JTAG_CTRL);
> +	aspeed_jtag_write(aspeed_jtag, JTAG_SW_MODE_EN | JTAG_SW_MODE_TDIO,
> +			=C2=A0=C2=A0AST_JTAG_SW);
> +
> +	ret =3D devm_request_irq(&pdev->dev, aspeed_jtag->irq,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_jtag_interrupt, 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"aspeed-jtag", aspeed_jtag)=
;
> +	if (ret) {
> +		dev_info(&pdev->dev, "aspeed_jtag Unable to get IRQ");
> +		goto out_region;
> +	}
> +
> +	aspeed_jtag_write(aspeed_jtag, JTAG_INST_PAUSE | JTAG_INST_COMPLETE |
> +			=C2=A0=C2=A0JTAG_DATA_PAUSE | JTAG_DATA_COMPLETE |
> +			=C2=A0=C2=A0JTAG_INST_PAUSE_EN | JTAG_INST_COMPLETE_EN |
> +			=C2=A0=C2=A0JTAG_DATA_PAUSE_EN | JTAG_DATA_COMPLETE_EN,
> +			=C2=A0=C2=A0AST_JTAG_ISR);
> +
> +	aspeed_jtag->flag =3D 0;
> +	init_waitqueue_head(&aspeed_jtag->jtag_wq);
> +
> +	ret =3D misc_register(&aspeed_jtag_misc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "aspeed_jtag : failed to register misc\n");
> +		goto out_region;
> +	}
> +
> +	aspeed_jtag->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, aspeed_jtag);
> +	dev_set_drvdata(aspeed_jtag_misc.this_device, aspeed_jtag);
> +
> +	ret =3D sysfs_create_group(&pdev->dev.kobj, &jtag_attribute_group);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"aspeed_jtag : failed to create sysfs attributes.\n");
> +		return -1;
> +	}
> +	ret =3D devm_add_action(&pdev->dev, aspeed_jtag_remove_sysfs_group,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pdev->dev);
> +	if (ret) {
> +		aspeed_jtag_remove_sysfs_group(&pdev->dev);
> +		dev_err(&pdev->dev,
> +			"Failed to add sysfs cleanup action (%d)\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "aspeed_jtag : driver successfully loaded.\n");
> +
> +	return 0;

It might help readability to split out some of the initialisation into
helper functions?

Cheers,

Andrew

> +
> +out_region:
> +	release_mem_region(res->start, res->end - res->start + 1);
> +out:
> +	dev_warn(&pdev->dev, "aspeed_jtag : driver init failed ret (%d)\n", ret=
);
> +	return ret;
> +}
> +
> +static int aspeed_jtag_remove(struct platform_device *pdev)
> +{
> +	misc_deregister(&aspeed_jtag_misc);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int
> +aspeed_jtag_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	return 0;
> +}
> +
> +static int
> +aspeed_jtag_resume(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +#else
> +#define aspeed_jtag_suspend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0NULL
> +#define aspeed_jtag_resume=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0NULL
> +#endif
> +
> +static const struct of_device_id aspeed_jtag_of_table[] =3D {
> +	{ .compatible =3D "aspeed,aspeed2500-jtag", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_jtag_of_table);
> +
> +static struct platform_driver aspeed_jtag_driver =3D {
> +	.probe		=3D aspeed_jtag_probe,
> +	.remove		=3D aspeed_jtag_remove,
> +	.suspend	=3D aspeed_jtag_suspend,
> +	.resume		=3D aspeed_jtag_resume,
> +	.driver=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D {
> +		.name	=3D KBUILD_MODNAME,
> +		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D aspeed_jtag_of_table,
> +	},
> +};
> +
> +module_platform_driver(aspeed_jtag_driver);
> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_DESCRIPTION("AST JTAG LIB Driver");
> +MODULE_LICENSE("GPL");
--=-vBmlHDzsm4FLKlSiTOsj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXumsMAAoJEJ0dnzgO5LT5c+MP/1YHJAY9k5rHu/WBZm8U1yUi
KfXBI9dhLCQWTsnZ85CXa0w/jwKqrzgf0SSFm6YEvPWwtc/3rjUhCm6SKdExfUWB
yJNMX5zfcIEVYJ5AD8vWJIWFJdgnqgesv1zeQSTwLUROx4EI7Ht0His5fFDsnyAg
OMB5g/Wv0W5zHGn+qbFXlJHJTGM4SIysbhyvb6CGnC6STH/EIP5pNYXm9586rjvW
yYZireE3gfcNxhFDFoF1DWhCDLFEQcTE2O1Jn4RNXlSu8Ti5afkBUndmR2wHZhPx
0jXZEM/hQbQ0tUAKps4daP84LaxND7Py/WO2QllriJFZ/6PyaicSQWQNW7QzK5lS
hC2x6nbkrl132ShzE7YFQ7qtNUEqHmOixuiLGzeZ+DBd0TaTkY8gXAT6xPIB6u+D
AhF2+FPEOE/CqrJSw57Kb7D1L9xj1Ny/1dDKKrjrg0327JkfGyc2zZBzAwZOvzsi
J1E7sP1Nh5LdejaLbmc+N7oLZpC4RfokpVeYSbfusUc64p/EzoCHetwatxar73E4
7pkfMCQrOYrhgEGBXr5UH81k7hh12+/YSEXSh5zu31/MRgemgl+mD/Tm8hRdc8EF
1tmiEuWzpYXoW3K3hd7TMvRxtGOeltKKT5pzBN/dFFSm2FPyRzNy0UAjoJCsRKi9
0VcHDkyXEJZxxKnMSC3p
=t1hl
-----END PGP SIGNATURE-----

--=-vBmlHDzsm4FLKlSiTOsj--
