Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqBPB3X25zDqBv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 16:12:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EIkgiPHU"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id h11so441282ywa.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 22:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=gIrKeFgyCQmPMjbCwEfxtBx+yfd5k4WOVgZTM77tVs4=;
 b=EIkgiPHU7mFVJFgDbfx6T7Mw4n4PDFEFbT31KBz9bm6dzJ/xk9KsCiv6f6quQYokbw
 7MrhdPe1Idv1rgeg+4s3U651jUrYlVyI+6JNLk/ANY0XopQ7mDk0BUS9HKBmwCNPfKtu
 7ey252PNonWANIun1oOKcZ0QrtIu9Dp8qzCbRnl4YBTGmM2MTYha8Sms+bfSdfbLUjn6
 LetSHvWGEiw8blr/XgwmJein+8uKphgQLnXQ9DeXu3XJi7xbT+zMCeOW4NU8PupJTmWm
 X1GfhX3B1gSZocq+/RDdrDDofmbHvy1mkhFQnsbFOmbmbMBiC6eY9mj8Z9W3Z9ZQ2nAr
 uDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=gIrKeFgyCQmPMjbCwEfxtBx+yfd5k4WOVgZTM77tVs4=;
 b=AlKB5w6xrHDvco37Adtrnq6ks2/+jklLyHftNrQ3hs+SWBYXMPzXXJ6jKx6k+AGax8
 xaI8D2rylbDEj0Lxj1wW7xdO5lXYWdeaz2+StI4S3ybfQaM8UQFJg5+CJUps3nO6q+ca
 4lQmAzkg5kMsl5evBdMhZ0ocCT6JaabkishpxUUrSvVyaqmkF0D92Ei3o73ngfzK4O3Q
 ZcOwaZ1poTgCM3Iy5j1S+wrgI76OR1l/HO8867r4N9fsVlNbRX60un59Xc3NzubqHgsZ
 MzvNz+9iJ5SaW3cQmQ1gAr5SE78KBTt20sL53K150mkQVUlCqqnCTumn+COk/ge7gDVo
 WfkA==
X-Gm-Message-State: AFeK/H03wKk41pc+tHpG/ZytioXEGgURTZbIHsfg6VE1A4bO8kh0jqAWFyg1tXBKYR+BBlXxrrKENwtQBDgFvw==
X-Received: by 10.37.165.67 with SMTP id h61mr4361382ybi.153.1490332332142;
 Thu, 23 Mar 2017 22:12:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Thu, 23 Mar 2017 22:11:51 -0700 (PDT)
In-Reply-To: <1490258557-16803-4-git-send-email-clg@kaod.org>
References: <1490258557-16803-1-git-send-email-clg@kaod.org>
 <1490258557-16803-4-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Mar 2017 15:41:51 +1030
X-Google-Sender-Auth: uGDyWJdPbCWcZ8E9UvF_6u-aNOQ
Message-ID: <CACPK8XfEzsUxo-QQJjuOwv-DaaqaXe2POLP-yRQDcFOz+8hfOg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 3/3] mtd: spi-nor: aspeed: configure chip
 window on AHB bus
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 24 Mar 2017 05:12:15 -0000

On Thu, Mar 23, 2017 at 7:12 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> This tries to configure the segment registers of each chip depending
> on the size of the flash device and depending on the previous segment
> settings, in order to have a contiguous window across multiple
> chip.
>
> Unfortunately, the AST2500 SPI controller has a bug and it is not
> possible to configure a full 128MB window for a chip of the same
> size. The window size needs to be restricted to 120MB. This issue only
> applies to CE0.

Looks ok to me. Some questions below.

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 121 +++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 118 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index b3c8cfe29765..9807ebb05bde 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -104,6 +104,7 @@ struct aspeed_smc_chip {
>         struct aspeed_smc_controller *controller;
>         void __iomem *ctl;                      /* control register */
>         void __iomem *ahb_base;                 /* base of chip window */
> +       u32 ahb_window_size;                    /* chip window size */
>         unsigned long phys_base;                /* physical address of wi=
ndow */
>         u32 ctl_val[smc_max];                   /* control settings */
>         enum aspeed_smc_flash_type type;        /* what type of flash */
> @@ -218,6 +219,10 @@ struct aspeed_smc_controller {
>  #define SEGMENT_ADDR_REG0              0x30
>  #define SEGMENT_ADDR_START(_r)         ((((_r) >> 16) & 0xFF) << 23)
>  #define SEGMENT_ADDR_END(_r)           ((((_r) >> 24) & 0xFF) << 23)

These two are getting the values, and the one below is for setting?

> +#define SEGMENT_ADDR_VALUE(start, end)                                 \
> +       (((((start) >> 23) & 0xFF) << 16) | ((((end) >> 23) & 0xFF) << 24=
))
> +#define SEGMENT_ADDR_REG(ctrl, cs)     \
> +       ((controller)->regs + SEGMENT_ADDR_REG0 + (cs) * 4)
>
>  /* DMA Registers */
>  #define DMA_CONTROL_REG                        0x80
> @@ -604,8 +609,7 @@ static void __iomem *aspeed_smc_chip_base(struct aspe=
ed_smc_chip *chip,
>         u32 reg;
>
>         if (controller->info->nce > 1) {
> -               reg =3D readl(controller->regs + SEGMENT_ADDR_REG0 +
> -                           chip->cs * 4);
> +               reg =3D readl(SEGMENT_ADDR_REG(controller, chip->cs));
>
>                 if (SEGMENT_ADDR_START(reg) >=3D SEGMENT_ADDR_END(reg))
>                         return NULL;
> @@ -616,6 +620,108 @@ static void __iomem *aspeed_smc_chip_base(struct as=
peed_smc_chip *chip,
>         return controller->ahb_base + offset;
>  }
>
> +static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 st=
art,
> +                           u32 size)
> +{
> +       struct aspeed_smc_controller *controller =3D chip->controller;
> +       void __iomem *seg_reg;
> +       u32 oldval, newval, val0, start0, end;
> +
> +       val0 =3D readl(SEGMENT_ADDR_REG(controller, 0));
> +       start0 =3D SEGMENT_ADDR_START(val0);
> +
> +       seg_reg =3D SEGMENT_ADDR_REG(controller, cs);
> +       oldval =3D readl(seg_reg);
> +
> +       /* If the chip size is not specified, use the default segment
> +        * size, but take into account the possible overlap with the
> +        * previous segment
> +        */
> +       if (!size)
> +               size =3D SEGMENT_ADDR_END(oldval) - start;
> +
> +       /* The segment cannot exceed the maximum window size of the
> +        * controller.
> +        */
> +       if (start + size > start0 + controller->info->maxsize) {
> +               size =3D start0 + controller->info->maxsize - start;
> +               dev_warn(chip->nor.dev, "CE%d window resized to %dMB",
> +                        cs, size >> 20);
> +       }
> +
> +       end =3D start + size;
> +       newval =3D SEGMENT_ADDR_VALUE(start, end);
> +       writel(newval, seg_reg);
> +
> +       /* Restore default value if something goes wrong. */
> +       if (newval !=3D readl(seg_reg)) {

The hardware will not accept an invalid value?

> +               dev_err(chip->nor.dev, "CE%d window invalid", cs);
> +               writel(oldval, seg_reg);
> +               start =3D SEGMENT_ADDR_START(oldval);
> +               end =3D SEGMENT_ADDR_END(oldval);
> +               size =3D end - start;
> +       }
> +
> +       dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
> +                cs, start, end, size >> 20);
> +
> +       return size;
> +}
> +
> +/*
> + * This is expected to be called in increasing CE order
> + */
> +static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
> +{
> +       struct aspeed_smc_controller *controller =3D chip->controller;
> +       u32  val0, start0, start;
> +       u32 size =3D chip->nor.mtd.size;
> +
> +       /* The AST2500 SPI controller has a bug when the CE0 chip size
> +        * exceeds 120MB.
> +        */
> +       if (chip->cs =3D=3D 0 && controller->info =3D=3D &spi_2500_info &=
&
> +           size =3D=3D (128 << 20)) {
> +               size =3D 120 << 20;
> +               dev_info(chip->nor.dev,
> +                        "CE%d window resized to %dMB (AST2500 HW quirk)"=
,
> +                        chip->cs, size >> 20);
> +       }
> +
> +       val0 =3D readl(SEGMENT_ADDR_REG(controller, 0));
> +       start0 =3D SEGMENT_ADDR_START(val0);
> +
> +       /* As a start address for the current segment, use the default
> +        * start address if we are handling CE0 or use the previous
> +        * segment ending address
> +        */
> +       if (chip->cs) {
> +               u32 prev =3D readl(SEGMENT_ADDR_REG(controller, chip->cs =
- 1));
> +
> +               start =3D SEGMENT_ADDR_END(prev);
> +       } else
> +               start =3D start0;
> +
> +       size =3D chip_set_segment(chip, chip->cs, start, size);
> +
> +       /* Update chip base address on the AHB bus */
> +       chip->ahb_base =3D controller->ahb_base + (start - start0);
> +
> +       if (size < chip->nor.mtd.size)
> +               dev_warn(chip->nor.dev,
> +                        "CE%d window too small for chip %dMB",
> +                        chip->cs, (u32) chip->nor.mtd.size >> 20);
> +
> +       /* Make sure the next segment does not overlap with the
> +        * current one we just configured even if there is no
> +        * available chip. That could break access in Command Mode.
> +        */
> +       if (chip->cs < controller->info->nce - 1)
> +               chip_set_segment(chip, chip->cs + 1, start + size, 0);
> +
> +       return size;
> +}
> +
>  static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
>  {
>         struct aspeed_smc_controller *controller =3D chip->controller;
> @@ -689,7 +795,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_s=
mc_chip *chip,
>          */
>         chip->ahb_base =3D aspeed_smc_chip_base(chip, res);
>         if (!chip->ahb_base) {
> -               dev_warn(chip->nor.dev, "CE segment window closed.\n");
> +               dev_warn(chip->nor.dev, "CE%d window closed", chip->cs);
>                 return -EINVAL;
>         }
>
> @@ -738,6 +844,15 @@ static int aspeed_smc_chip_setup_finish(struct aspee=
d_smc_chip *chip)
>         if (chip->nor.addr_width =3D=3D 4 && info->set_4b)
>                 info->set_4b(chip);
>
> +       /* This is for direct AHB access when using Command Mode. For
> +        * the AST2400 SPI controller which only handles one chip,
> +        * let's use the full window.
> +        */
> +       if (controller->info->nce =3D=3D 1)
> +               chip->ahb_window_size =3D info->maxsize;
> +       else
> +               chip->ahb_window_size =3D aspeed_smc_chip_set_segment(chi=
p);
> +
>         /*
>          * base mode has not been optimized yet. use it for writes.
>          */
> --
> 2.7.4
>
