Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqC9M6ZrBzDq95
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 16:47:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ftNsfNqM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="duZs+qCD"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F826209DD;
 Fri, 24 Mar 2017 01:47:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 24 Mar 2017 01:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=D72apNt9TUbqu3CUtY7rBnmZ738W2TNKpEgNAhWkF
 FA=; b=ftNsfNqMfSTY18tgr1E6G9JvMdcNlAO/98CYv7V1ZF6u6DHBl43Eans57
 7Ct1x2Y7+43nePa31m+WVX2gMQPckzcsI4OxjEM37mxdoznwlaNjcHepkvm3swWR
 mOZROHqiEQ22Gr2Pb4moIUQ7pMWA6Z0bQkoIHt4fWayJ4oIv0NcYL9xbIddxsImb
 I+UyN5EK9amSLZZP9qmiDnU1fHYBwVu9jcxz0T+mqO4gQtnDn5QLfNBfvINI+ClN
 iBne01ibSZpjWDv6A5G80ZqH3BEyHnoEVizLcLh5cJ9qwrWA1iwNvpOI+jR+YTWt
 B+jUjtkCglmbkszj5Ocn6DesyhoKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=D72apNt9TUbqu3CUtY
 7rBnmZ738W2TNKpEgNAhWkFFA=; b=duZs+qCDIlZN5YrF11c95gQSO+j2JAVg5W
 oOfr5cNYdTodBpb04u0NCVsztgsZlYIb+c9a+aTLCtM/jA/R1AWJPdK7bu3pDALf
 AQgx/WCAgeHUEJ1n7eCETTWDwmKhcgbBk+5539HqI9yne/u9/P/Piezl6wGAjkMa
 SxgPpykQmm9BvZcG+JiBq5yLy4Csg2KrYRbjaC6EIfP9iEsa3Ip8+/ImSj9ZvPLE
 u/8ml1JNOa+mGX5FVsyYF4Cu7b93lpUsA+vq7UABr/AyoPDcZdUaWzIxqFkNIBp3
 yHZ7eskKPKb/HuL2vQf3mAuw+a7CaDhHVHX0Jbuu8STrErFvjQaQ==
X-ME-Sender: <xms:1bLUWEwiif7OYMkhGtgHAaWHC3FNjtJRXJne6qpVulXG4C1bF1izQQ>
X-Sasl-enc: xupDwGggkIxx8jnWws55qpBOo9PHqKazpJ7Pc2ZYS3ne 1490334420
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CF857E202;
 Fri, 24 Mar 2017 01:46:59 -0400 (EDT)
Message-ID: <1490334412.3847.8.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 3/3] mtd: spi-nor: aspeed: configure chip
 window on AHB bus
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Fri, 24 Mar 2017 16:16:52 +1030
In-Reply-To: <1490258557-16803-4-git-send-email-clg@kaod.org>
References: <1490258557-16803-1-git-send-email-clg@kaod.org>
 <1490258557-16803-4-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RS/mgAkxGWpQK6JqHKSW"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Fri, 24 Mar 2017 05:47:05 -0000


--=-RS/mgAkxGWpQK6JqHKSW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-03-23 at 09:42 +0100, C=C3=A9dric Le Goater wrote:
> This tries to configure the segment registers of each chip depending
> on the size of the flash device and depending on the previous segment
> settings, in order to have a contiguous window across multiple
> chip.
>=20
> Unfortunately, the AST2500 SPI controller has a bug and it is not
> possible to configure a full 128MB window for a chip of the same
> size. The window size needs to be restricted to 120MB. This issue only
> applies to CE0.
>=20
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0drivers/mtd/spi-nor/aspeed-smc.c | 121 ++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 118 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index b3c8cfe29765..9807ebb05bde 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -104,6 +104,7 @@ struct aspeed_smc_chip {
> > =C2=A0	struct aspeed_smc_controller *controller;
> > > =C2=A0	void __iomem *ctl;			/* control register */
> > > =C2=A0	void __iomem *ahb_base;			/* base of chip window */
> > > +	u32 ahb_window_size;			/* chip window size */
> > > =C2=A0	unsigned long phys_base;		/* physical address of window */
> > > =C2=A0	u32 ctl_val[smc_max];			/* control settings */
> > > =C2=A0	enum aspeed_smc_flash_type type;	/* what type of flash */
> @@ -218,6 +219,10 @@ struct aspeed_smc_controller {
> > =C2=A0#define SEGMENT_ADDR_REG0		0x30
> > =C2=A0#define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
> > =C2=A0#define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
> > +#define SEGMENT_ADDR_VALUE(start, end)					\
> > +	(((((start) >> 23) & 0xFF) << 16) | ((((end) >> 23) & 0xFF) << 24))
> > +#define SEGMENT_ADDR_REG(ctrl, cs)	\
> +	((controller)->regs + SEGMENT_ADDR_REG0 + (cs) * 4)

This macro is not okay. You happen to have a 'controller' variable in
scope both times you invoke it below. The 'ctrl' parameter is
effectively unused.

Other than that:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> =C2=A0
> =C2=A0/* DMA Registers */
> > =C2=A0#define DMA_CONTROL_REG			0x80
> @@ -604,8 +609,7 @@ static void __iomem *aspeed_smc_chip_base(struct aspe=
ed_smc_chip *chip,
> > =C2=A0	u32 reg;
> =C2=A0
> > =C2=A0	if (controller->info->nce > 1) {
> > -		reg =3D readl(controller->regs + SEGMENT_ADDR_REG0 +
> > -			=C2=A0=C2=A0=C2=A0=C2=A0chip->cs * 4);
> > +		reg =3D readl(SEGMENT_ADDR_REG(controller, chip->cs));
> =C2=A0
> > =C2=A0		if (SEGMENT_ADDR_START(reg) >=3D SEGMENT_ADDR_END(reg))
> > =C2=A0			return NULL;
> @@ -616,6 +620,108 @@ static void __iomem *aspeed_smc_chip_base(struct as=
peed_smc_chip *chip,
> > =C2=A0	return controller->ahb_base + offset;
> =C2=A0}
> =C2=A0
> +static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 st=
art,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0u32 size)
> +{
> > +	struct aspeed_smc_controller *controller =3D chip->controller;
> > +	void __iomem *seg_reg;
> > +	u32 oldval, newval, val0, start0, end;
> +
> > +	val0 =3D readl(SEGMENT_ADDR_REG(controller, 0));
> > +	start0 =3D SEGMENT_ADDR_START(val0);
> +
> > +	seg_reg =3D SEGMENT_ADDR_REG(controller, cs);
> > +	oldval =3D readl(seg_reg);
> +
> > +	/* If the chip size is not specified, use the default segment
> > +	=C2=A0* size, but take into account the possible overlap with the
> > +	=C2=A0* previous segment
> > +	=C2=A0*/
> > +	if (!size)
> > +		size =3D SEGMENT_ADDR_END(oldval) - start;
> +
> > +	/* The segment cannot exceed the maximum window size of the
> > +	=C2=A0* controller.
> > +	=C2=A0*/
> > +	if (start + size > start0 + controller->info->maxsize) {
> > +		size =3D start0 + controller->info->maxsize - start;
> > +		dev_warn(chip->nor.dev, "CE%d window resized to %dMB",
> > +			=C2=A0cs, size >> 20);
> > +	}
> +
> > +	end =3D start + size;
> > +	newval =3D SEGMENT_ADDR_VALUE(start, end);
> > +	writel(newval, seg_reg);
> +
> > +	/* Restore default value if something goes wrong. */
> > +	if (newval !=3D readl(seg_reg)) {
> > +		dev_err(chip->nor.dev, "CE%d window invalid", cs);
> > +		writel(oldval, seg_reg);
> > +		start =3D SEGMENT_ADDR_START(oldval);
> > +		end =3D SEGMENT_ADDR_END(oldval);
> > +		size =3D end - start;
> > +	}
> +
> > +	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
> > +		=C2=A0cs, start, end, size >> 20);
> +
> > +	return size;
> +}
> +
> +/*
> + * This is expected to be called in increasing CE order
> + */
> +static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
> +{
> > +	struct aspeed_smc_controller *controller =3D chip->controller;
> > +	u32=C2=A0=C2=A0val0, start0, start;
> > +	u32 size =3D chip->nor.mtd.size;
> +
> > +	/* The AST2500 SPI controller has a bug when the CE0 chip size
> > +	=C2=A0* exceeds 120MB.
> > +	=C2=A0*/
> > +	if (chip->cs =3D=3D 0 && controller->info =3D=3D &spi_2500_info &&
> > +	=C2=A0=C2=A0=C2=A0=C2=A0size =3D=3D (128 << 20)) {
> > +		size =3D 120 << 20;
> > +		dev_info(chip->nor.dev,
> > +			=C2=A0"CE%d window resized to %dMB (AST2500 HW quirk)",
> > +			=C2=A0chip->cs, size >> 20);
> > +	}
> +
> > +	val0 =3D readl(SEGMENT_ADDR_REG(controller, 0));
> > +	start0 =3D SEGMENT_ADDR_START(val0);
> +
> > +	/* As a start address for the current segment, use the default
> > +	=C2=A0* start address if we are handling CE0 or use the previous
> > +	=C2=A0* segment ending address
> > +	=C2=A0*/
> > +	if (chip->cs) {
> > +		u32 prev =3D readl(SEGMENT_ADDR_REG(controller, chip->cs - 1));
> +
> > +		start =3D SEGMENT_ADDR_END(prev);
> > +	} else
> > +		start =3D start0;
> +
> > +	size =3D chip_set_segment(chip, chip->cs, start, size);
> +
> > +	/* Update chip base address on the AHB bus */
> > +	chip->ahb_base =3D controller->ahb_base + (start - start0);
> +
> > +	if (size < chip->nor.mtd.size)
> > +		dev_warn(chip->nor.dev,
> > +			=C2=A0"CE%d window too small for chip %dMB",
> > +			=C2=A0chip->cs, (u32) chip->nor.mtd.size >> 20);
> +
> > +	/* Make sure the next segment does not overlap with the
> > +	=C2=A0* current one we just configured even if there is no
> > +	=C2=A0* available chip. That could break access in Command Mode.
> > +	=C2=A0*/
> > +	if (chip->cs < controller->info->nce - 1)
> > +		chip_set_segment(chip, chip->cs + 1, start + size, 0);
> +
> > +	return size;
> +}
> +
> =C2=A0static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *ch=
ip)
> =C2=A0{
> > =C2=A0	struct aspeed_smc_controller *controller =3D chip->controller;
> @@ -689,7 +795,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_s=
mc_chip *chip,
> > =C2=A0	=C2=A0*/
> > =C2=A0	chip->ahb_base =3D aspeed_smc_chip_base(chip, res);
> > =C2=A0	if (!chip->ahb_base) {
> > -		dev_warn(chip->nor.dev, "CE segment window closed.\n");
> > +		dev_warn(chip->nor.dev, "CE%d window closed", chip->cs);
> > =C2=A0		return -EINVAL;
> > =C2=A0	}
> =C2=A0
> @@ -738,6 +844,15 @@ static int aspeed_smc_chip_setup_finish(struct aspee=
d_smc_chip *chip)
> > =C2=A0	if (chip->nor.addr_width =3D=3D 4 && info->set_4b)
> > =C2=A0		info->set_4b(chip);
> =C2=A0
> > +	/* This is for direct AHB access when using Command Mode. For
> > +	=C2=A0* the AST2400 SPI controller which only handles one chip,
> > +	=C2=A0* let's use the full window.
> > +	=C2=A0*/
> > +	if (controller->info->nce =3D=3D 1)
> > +		chip->ahb_window_size =3D info->maxsize;
> > +	else
> > +		chip->ahb_window_size =3D aspeed_smc_chip_set_segment(chip);
> +
> > =C2=A0	/*
> > =C2=A0	=C2=A0* base mode has not been optimized yet. use it for writes.
> > =C2=A0	=C2=A0*/
--=-RS/mgAkxGWpQK6JqHKSW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY1LLMAAoJEJ0dnzgO5LT5GcAP/2agW7l9iYkO4d3v3bk2gfeb
l0QR3lBz1dC7rfc2Q0Su4TH+Lw4+h0xPAycLEIqtDZ6NOVfUI0HJYUsPX+3ouq+H
IvInPVIEXC9p2d2dZQRQCnAt6ZBEC/HhvXjKSni15pCmSFvEdJjclhVtY7m1GLLy
pR4p25q9CZDtz1BZWp5BMYb7fxbNzZP9HonfF7ICRxdrqMO3K3y6fNLXa4JkSbBd
O0uOa6fVRnU09nivUGEJOEB8dbh8JWl9S2ZI1ZKhGZdn/WHnsToOSb9K5dq9ZJ8H
K0QKH5FhnjRMIpHwtpjQQ+cPpLTk1MH/C3tJ4wMsrPgoUqcP4rVjh87XhQHwPeeY
JNFbBVkN2XDMUuUIxyrzBGC7FLtW0YMaakujtvob0kIN3L65ugKHL3RFFdOe36lI
sWKQwg7smrbRaaALtENKWjLFEJKpu8C+P7hKURn3xsCqcIfvF+Al4dWySjPGDWJA
CrM3K9YlirFLRaCu+BV7/DMJVuxrz0D9SiwPXOz/HdZK16CdHNxEk6g3pHWXT5ol
7UyM3aEV98vWPFBCCjO+a6OQ0G422a4ZPae50yQ5zsEH37YzYzPwXQHKcmxQCbFk
bXfvwWC3P2ftzMAYifZ6E894utMzTqI9FGnoMMV5++95WBVd3YGcv2f3rzm0x4y1
7FObAahvVnFebuFg3UbC
=/T+U
-----END PGP SIGNATURE-----

--=-RS/mgAkxGWpQK6JqHKSW--
