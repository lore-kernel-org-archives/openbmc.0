Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5gX4wNkzDt2p
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:03:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FOkUiBYJ; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 2so7334438vkb.1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=6JSb3MH/TsMwqfPpgn/EwG4t3nPo77biub0lQkE3Z9E=;
 b=FOkUiBYJKNXi3iuCFB6zMqoY4hsMS5M1lZo3uf2eNyaQQW6iGEGAtL+U35FAia5Pfj
 JyjYF/Eq0hM5UBwJBcMJvmm2Q7TJZ4+1h+/360+WOUG0/bIP6F4EdgRtIfV0KirSRvWX
 2XIPFrcrQKtUswcdubfeUZt7TLW7NUgAtE7ujQujJRp9y68L4ccLlQu5A3+BC0tYhiWt
 xuhC+ugzZ4rLZJTk4n5u+39hVCH2tzkNTZPGBfMdHafLuksHi3367I/ynPSzzA4S04dQ
 1FMzxd1PgPYCewMuf2hpUNMn1n8jUdTxva1MPyHEKVqsJx17srkOfQYv1NzO9QDD17Eg
 cvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=6JSb3MH/TsMwqfPpgn/EwG4t3nPo77biub0lQkE3Z9E=;
 b=NzKevHKH9iRIsGi0DyVNpt8MVzmGrqnMrJ6aqsO+QlSPgcV6i4xTasMsksVcfUznLV
 lBkE5EKZPEj8Y2nXSt0lm7F++vAAXuxkLxrBBn3jynuG349WRvi6n0NmQ4feNAU98Hj2
 vHuTS27trrqDHmGyKCqp/Lmr80qeuawk8kUBX1fGVjuQHNHFbmVbxJJ01H/5jpX7P7w9
 0j+3DvukJPxTmtSLcovU4x3suHNTH/CJxvVnHsltBw33RAD9yDmUyguSwVOYlC9C3n8S
 2I+xHlZK2nfe4oAN2QDejmQAE7ogkF0SdFNocRTmp6yPZrR29rstjxJf792KlfVaVbo6
 DLkQ==
X-Gm-Message-State: AA6/9Rl/GuzgzxUjF791r7d4W3dOj/lrutgQd1sRbwLLaQKkQ0y06LveEOFBe1b99w+YQYZ67zCUfFTBSvo8Hw==
X-Received: by 10.31.129.194 with SMTP id c185mr13994365vkd.67.1476680582726; 
 Sun, 16 Oct 2016 22:03:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:02:42 -0700 (PDT)
In-Reply-To: <1476448684-6149-2-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:32:42 +1030
X-Google-Sender-Auth: 4v_u7EzEXORsG2K-yFfKoebUW64
Message-ID: <CACPK8Xc+0=Bgc6ZMEbcvS3e3CxB+aHzQ_m1czzFyu7FJyOanrg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 01/12] mtd: spi-nor: support for Aspeed
 AST2500 SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 05:03:05 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> From: Milton Miller <miltonm@us.ibm.com>

I realise that Milton wrote this, but as it's the first time I've had
a chance to review it I'll comment as though you are the author.

> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
> ones found on the AST2400. The differences are on the number of
> supported flash modules and their default mappings in the SoC address
> space.
>
> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
> for the host firmware. All controllers have now the same set of
> registers compatible with the AST2400 FMC controller and the legacy
> 'SMC' controller is fully gone.
>
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> [clg: couple of cleanups ]

You could probably have done these cleanups as a few different patches
to make it easier to review. Not a big deal though. When we upstream
this will all squash down. I've a few questions below, but nothing
that will stop this going in the tree for now.

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  30 ++++--
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 112 ++++++++++++---=
------
>  2 files changed, 87 insertions(+), 55 deletions(-)
>

> @@ -140,37 +140,56 @@ struct aspeed_smc_info {
>         u8 maxwidth;            /* max width of spi bus */
>         bool hasdma;            /* has dma engine */
>         bool hastype;           /* flash type field exists in cfg reg */
> -       u8 we0;                 /* we shift for ce 0 in cfg reg */
> +       u8 we0;                 /* shift for write enable bit for ce 0 */
>         u8 ctl0;                /* offset in regs of ctl for ce 0 */
> -       u8 cfg;                 /* offset in regs of cfg */
>         u8 time;                /* offset in regs of timing */
>         u8 misc;                /* offset in regs of misc settings */
>  };
>
> -static struct aspeed_smc_info fmc_info =3D {
> +static struct aspeed_smc_info fmc_2400_info =3D {

Can these be const?

>         .nce =3D 5,
>         .maxwidth =3D 4,
>         .hasdma =3D true,
>         .hastype =3D true,
>         .we0 =3D 16,
>         .ctl0 =3D 0x10,
> -       .cfg =3D 0x00,
> -       .time =3D 0x54,
> -       .misc =3D 0x50,
> +       .time =3D 0x94,
> +       .misc =3D 0x54,
>  };
>
> -static struct aspeed_smc_info smc_info =3D {
> +static struct aspeed_smc_info smc_2400_info =3D {
>         .nce =3D 1,
>         .maxwidth =3D 2,
>         .hasdma =3D false,
>         .hastype =3D false,
>         .we0 =3D 0,
>         .ctl0 =3D 0x04,
> -       .cfg =3D 0x00,
>         .time =3D 0x14,
>         .misc =3D 0x10,
>  };
>
> +static struct aspeed_smc_info fmc_2500_info =3D {
> +       .nce =3D 3,
> +       .maxwidth =3D 2,
> +       .hasdma =3D true,
> +       .hastype =3D true,
> +       .we0 =3D 16,
> +       .ctl0 =3D 0x10,
> +       .time =3D 0x94,
> +       .misc =3D 0x54,
> +};
> +
> +static struct aspeed_smc_info smc_2500_info =3D {
> +       .nce =3D 2,
> +       .maxwidth =3D 2,
> +       .hasdma =3D false,
> +       .hastype =3D false,
> +       .we0 =3D 16,
> +       .ctl0 =3D 0x10,
> +       .time =3D 0x94,
> +       .misc =3D 0x54,
> +};
> +
>  enum smc_ctl_reg_value {
>         smc_base,               /* base value without mode for other comm=
ands */
>         smc_read,               /* command reg for (maybe fast) reads */
> @@ -180,7 +199,7 @@ enum smc_ctl_reg_value {
>
>  struct aspeed_smc_controller;
>
> -struct aspeed_smc_chip {
> +struct aspeed_smc_per_chip {

Can you explain the rename here? I don't follow.

>         struct aspeed_smc_controller *controller;
>         __le32 __iomem *ctl;                    /* control register */
>         void __iomem *base;                     /* base of chip window */
> @@ -193,9 +212,11 @@ struct aspeed_smc_controller {
>         struct mutex mutex;                     /* controller access mute=
x */
>         const struct aspeed_smc_info *info;     /* type info of controlle=
r */
>         void __iomem *regs;                     /* controller registers *=
/
> -       struct aspeed_smc_chip *chips[0];       /* pointers to attached c=
hips */
> +       struct aspeed_smc_per_chip *chips[0];   /* pointers to attached c=
hips */
>  };

> @@ -456,36 +478,36 @@ static int aspeed_smc_probe(struct platform_device =
*dev)
>
>                 r =3D platform_get_resource(dev, IORESOURCE_MEM, n + 1);
>                 chip->base =3D devm_ioremap_resource(&dev->dev, r);
> -
>                 if (!chip->base)
>                         continue;
> +
>                 chip->controller =3D controller;
>                 chip->ctl =3D controller->regs + info->ctl0 + n * 4;
>
> -               /*
> -                * The device tree said the chip is spi.
> -                * XXX Need to set it in controller if has_type says the
> -                * type is programmable.
> -                */
> +               /* The device tree said the chip is spi. */
>                 chip->type =3D smc_type_spi;
>
>                 /*
> -                * Always turn on the write enable bit in the config regi=
ster
> -                * to allow opcodes to be sent in user mode.
> +                * Always turn on the write enable bit in the type and se=
ttings
> +                * or flash configuration register to allow opcodes to be=
 sent
> +                * in user mode.  Set the attached chip type for this chi=
p
> +                * select if the bits exist.
>                  */
>                 mutex_lock(&controller->mutex);

Do we need to be taking locks in the drivers probe function?

> -               reg =3D readl(controller->regs + info->cfg);
> -               dev_dbg(&dev->dev, "flash config was %08x\n", reg);
> +               reg =3D readl(controller->regs + TYPE_SETTING_REG);
> +               dev_dbg(&dev->dev, "flash type and setting was %08x\n", r=
eg);
>                 reg |=3D 1 << (info->we0 + n); /* WEn */
> -               writel(reg, controller->regs + info->cfg);
> +               if (info->hastype) {
> +                       reg &=3D ~(3 << (n * 2));
> +                       reg |=3D chip->type << (n * 2);
> +               }
> +               writel(reg, controller->regs + TYPE_SETTING_REG);

This is a bit hard to follow. Worked it out in the end though.

>                 mutex_unlock(&controller->mutex);
>
>                 /*
>                  * Read the existing control register to get basic values=
.
>                  *
>                  * XXX This register probably needs more sanitation.
> -                * XXX Do we trust the bootloader or the device tree?
> -                * spi-nor.c trusts jtag id over passed ids.
>                  *
>                  * Do we need support for mode 3 vs mode 0 clock phasing?
>                  */
> @@ -531,7 +553,7 @@ static int aspeed_smc_probe(struct platform_device *d=
ev)
>                  * Adjust clocks if fast read and write are supported.
>                  * Interpret spi-nor flags to adjust controller settings.
>                  * Check if resource size big enough for detected chip an=
d
> -                * add support assisted (normal or fast-) read.
> +                * add support assisted (normal or fast-) read and dma.
>                  */
>
>                 err =3D mtd_device_register(&chip->nor.mtd, NULL, 0);
> --
> 2.7.4
