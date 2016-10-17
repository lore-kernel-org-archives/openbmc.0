Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5vj0lWxzDvHV
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:13:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=amgweTsi; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 83so6261824vkd.0
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=WzwbhYvN2dPUCu0iOGx6c04QfVoQTEEcinyoGy7Tk+A=;
 b=amgweTsi0ufcTjNguAfLGsV5Lw0Q+Jsxdy/F/8qfj4EFF8XqR0nA5O4vnC0xZw97ly
 GN8cKeMMr//1mWtbU19zKmUbH8aKWEFML34C4afpfPLogYDfiTX7ZWK+1+riuf9o4Tvw
 qiX4jQvgl9/n04zRV1HLaIXhi5/03vzrMEAGFBnMmxnAv7iIh6nf3lkaWymh1E5Ye9b+
 LE+NKhaLm5RO9ckJa/yhbUmzVwKKvbbypxTYCaHHprlNLqQuJdr3KHyS7oKRKdeb9BYl
 HwDVbIpd32PaIGoEd6pgCtooAjZ3BrrWgO50l05Yk9bQlAEkRMWnKkP1M1eK3DC2z+79
 D5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=WzwbhYvN2dPUCu0iOGx6c04QfVoQTEEcinyoGy7Tk+A=;
 b=Fp15nXFJ+Q7NDLCbcZ5ygLxuwv7WP+RmDsrAR0ew1dZwfC1TzJgW6DheqJKy1bLqTS
 v0TyqczTnVc3Ts841HXJYSBhUtRlNfkg6zKvyAVryJ0olw7uw6kMCK2gxBfQhAHyGAvn
 zr1kltkVYvOoKmodntrMcBe7o0qV8agZpZFhKw8nLG/6w4/myBuXZgtUVgkCVcyawZLp
 geraALfL2P/Ah6dME86YS3II1XcfjfSJ4dzu1p2BC9rxvf0W/yEolaVCahDBOOHJQpqa
 r7OCd5rczagGN0NU9VUKsUcS8VnVq8kP5U16697B2tz0EFq2cJ0yr7j9AXfQgGFTZbHE
 iC2Q==
X-Gm-Message-State: AA6/9Rk5ovgmX7gsiPYtOzJDcSKz1JmGguDcFJwZx4aa/djXwFdevFGwVvy418Fe5qu5smP5+tORIac25kgTmA==
X-Received: by 10.31.115.8 with SMTP id o8mr16634313vkc.2.1476681214994; Sun,
 16 Oct 2016 22:13:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:13:14 -0700 (PDT)
In-Reply-To: <1476448684-6149-3-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:43:14 +1030
X-Google-Sender-Auth: vzDk5-sRs-tXrQKLPv9yDyvH-24
Message-ID: <CACPK8Xc9yeobHXZwGahrXFmwLgnrzmxO5UGMmnLfc2n-Cjb_8A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 02/12] mtd: spi-nor: aspeed: Manage the
 segment address registers
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
X-List-Received-Date: Mon, 17 Oct 2016 05:13:37 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> From: Milton Miller <miltonm@us.ibm.com>
>
> This changes the aspeed mtd driver to use the segment address
> registers from the driver, this eliminating a source of mismatch and
> placing the kernel in control using its knowledge instead of relying
> on hardware defaults or bootloaders to choose good values for the
> windows based on the attached chips.
>
> The initial commit factors out discovering the current window in which
> the flash module is mapped by the controller. The intent is to adjust
> the windows to the required size of the attached flash.  Also planned
> is to enable direct memory mapped access and dma access, at least for
> read accesses when the flash size is supported by the hardware.
>
> The spi-nor layer already trusts its database of jedec ids over any
> information in the device tree, this continues that philosophy
> by using the knowledge to optimize the programming of the hardware.
> The device tree may be used in the future to limit the choices,
> for example specifying a max clock rate based on board wiring.
>
> This does not have any locking around sanitizing the segments
> or copying the new addresses back to the per-chip base address.
> In the present code registers are updated before the devices
> are probed.
>
> We may want to cache the offsets in the per-chip structure to
> when we support DMA.
>
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> [clg : removed the calculation on the segment registers to check
>        overlaps and kept only the reading of the segment base address.
>        It needs more work ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 58 +++++++++++++++++++++++++++++++---=
------
>  1 file changed, 46 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index e8744aef5fdc..a47eecfdfda2 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -136,6 +136,7 @@ enum smc_flash_type {
>  };
>
>  struct aspeed_smc_info {
> +       u32 maxsize;            /* maximum size of 1 chip window */

It doesn't look like you use maxsize at all.


>         u8 nce;                 /* number of chip enables */
>         u8 maxwidth;            /* max width of spi bus */
>         bool hasdma;            /* has dma engine */
> @@ -147,6 +148,7 @@ struct aspeed_smc_info {
>  };
>
>  static struct aspeed_smc_info fmc_2400_info =3D {
> +       .maxsize =3D 64 * 1024 * 1024,
>         .nce =3D 5,
>         .maxwidth =3D 4,
>         .hasdma =3D true,
> @@ -158,6 +160,7 @@ static struct aspeed_smc_info fmc_2400_info =3D {
>  };
>
>  static struct aspeed_smc_info smc_2400_info =3D {
> +       .maxsize =3D 64 * 1024 * 1024,
>         .nce =3D 1,
>         .maxwidth =3D 2,
>         .hasdma =3D false,
> @@ -169,6 +172,7 @@ static struct aspeed_smc_info smc_2400_info =3D {
>  };
>
>  static struct aspeed_smc_info fmc_2500_info =3D {
> +       .maxsize =3D 256 * 1024 * 1024,
>         .nce =3D 3,
>         .maxwidth =3D 2,
>         .hasdma =3D true,
> @@ -180,6 +184,7 @@ static struct aspeed_smc_info fmc_2500_info =3D {
>  };
>
>  static struct aspeed_smc_info smc_2500_info =3D {
> +       .maxsize =3D 128 * 1024 * 1024,
>         .nce =3D 2,
>         .maxwidth =3D 2,
>         .hasdma =3D false,
> @@ -212,11 +217,17 @@ struct aspeed_smc_controller {
>         struct mutex mutex;                     /* controller access mute=
x */
>         const struct aspeed_smc_info *info;     /* type info of controlle=
r */
>         void __iomem *regs;                     /* controller registers *=
/
> +       void __iomem *windows;                  /* per-chip windows resou=
rce */
>         struct aspeed_smc_per_chip *chips[0];   /* pointers to attached c=
hips */
>  };
>
>  #define TYPE_SETTING_REG 0x0
>
> +#define LOG_8MB (23)   /* log(2)(8 * 1024 * 1024) */
> +#define SEGMENT_ADDR_REG0 0x30
> +#define         SEGMENT_ADDR_START(_r) ((((_r) >> 16) & 0xFF) << LOG_8MB=
)
> +#define         SEGMENT_ADDR_END(_r) ((((_r) >> 24) & 0xFF) << LOG_8MB)
> +
>  #define CONTROL_SPI_AAF_MODE BIT(31)
>  #define CONTROL_SPI_IO_MODE_MASK GENMASK(30, 28)
>  #define CONTROL_SPI_IO_DUAL_DATA BIT(29)
> @@ -403,13 +414,30 @@ of_platform_device_create_or_find(struct device_nod=
e *child,
>         return cdev;
>  }
>
> +static void __iomem *window_start(struct aspeed_smc_controller *controll=
er,
> +                                 struct resource *r, unsigned int n)
> +{
> +       u32 offset =3D 0;
> +       u32 reg;
> +
> +       if (controller->info->nce > 1) {
> +               reg =3D readl(controller->regs + SEGMENT_ADDR_REG0 + n * =
4);
> +
> +               if (SEGMENT_ADDR_START(reg) >=3D SEGMENT_ADDR_END(reg))
> +                       return NULL;
> +
> +               offset =3D SEGMENT_ADDR_START(reg) - r->start;
> +       }
> +
> +       return controller->windows + offset;
> +}
> +
>  static int aspeed_smc_probe(struct platform_device *dev)
>  {
>         struct aspeed_smc_controller *controller;
>         const struct of_device_id *match;
>         const struct aspeed_smc_info *info;
>         struct resource *r;
> -       void __iomem *regs;
>         struct device_node *child;
>         int err =3D 0;
>         unsigned int n;
> @@ -418,19 +446,24 @@ static int aspeed_smc_probe(struct platform_device =
*dev)
>         if (!match || !match->data)
>                 return -ENODEV;
>         info =3D match->data;
> -       r =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
> -       regs =3D devm_ioremap_resource(&dev->dev, r);
> -       if (IS_ERR(regs))
> -               return PTR_ERR(regs);
>
>         controller =3D devm_kzalloc(&dev->dev, sizeof(*controller) +
>                 info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
>         if (!controller)
>                 return -ENOMEM;
> -       platform_set_drvdata(dev, controller);
> -       controller->regs =3D regs;
>         controller->info =3D info;
>         mutex_init(&controller->mutex);
> +       platform_set_drvdata(dev, controller);
> +
> +       r =3D platform_get_resource(dev, IORESOURCE_MEM, 0);
> +       controller->regs =3D devm_ioremap_resource(&dev->dev, r);
> +       if (IS_ERR(controller->regs))
> +               return PTR_ERR(controller->regs);
> +
> +       r =3D platform_get_resource(dev, IORESOURCE_MEM, 1);
> +       controller->windows =3D devm_ioremap_resource(&dev->dev, r);
> +       if (IS_ERR(controller->windows))
> +               return PTR_ERR(controller->windows);
>
>         /* The pinmux or bootloader will disable legacy mode. */
>
> @@ -476,17 +509,18 @@ static int aspeed_smc_probe(struct platform_device =
*dev)
>                 if (!chip)
>                         continue;
>
> -               r =3D platform_get_resource(dev, IORESOURCE_MEM, n + 1);
> -               chip->base =3D devm_ioremap_resource(&dev->dev, r);
> -               if (!chip->base)
> -                       continue;
> -
>                 chip->controller =3D controller;
>                 chip->ctl =3D controller->regs + info->ctl0 + n * 4;
>
>                 /* The device tree said the chip is spi. */
>                 chip->type =3D smc_type_spi;
>
> +               chip->base =3D window_start(controller, r, n);
> +               if (!chip->base) {
> +                       dev_warn(&cdev->dev, "CE segment window closed.\n=
");
> +                       continue;
> +               }
> +
>                 /*
>                  * Always turn on the write enable bit in the type and se=
ttings
>                  * or flash configuration register to allow opcodes to be=
 sent
> --
> 2.7.4
>
