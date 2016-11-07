Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBx9k5vKNzDvMv
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:25:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lmE5aOcJ"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id b123so1627107itb.2
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=9IPsTm1fiawPTexn5AeTLY7ZmNSsn6Xn3M1NxT9xVkA=;
 b=lmE5aOcJJ0MqXNah44EVri8N1dWDRPYSZoW/UjOkDSTBiwiIyuOT/TBar3S5l3jXwZ
 2KHHppmFrdKqJpfGDmRz28Emtd2lAyC6htlSL8gdH6qNK4+6fdJJ7vHfUXETbO3Lq+FI
 UnCGKboTzVkh1Fdf1TcrUlcHBI5R/1Uke8w08Ea2bBWcfZitlb1kKqQcTQ6ys3Hb+SDX
 tke+hWaukd7NeJVAQxfrMJ2szDWnolof7w3Rm9vX+wTk+0lfsMGNxbQxUTIzjHRRbXH7
 jpehIq3j+sECfGqxhHT2LNYh6lY8EijAeUOyUo9qdKXrOkPouy0kwBRBP59+106GLTyr
 0hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9IPsTm1fiawPTexn5AeTLY7ZmNSsn6Xn3M1NxT9xVkA=;
 b=T1olKXCmyywHhJo0ipj+Je9coBcHDjuvvUTGr0oJJyBTnWYMyW13Vm8LbEP+rJMgXY
 ctlfJZSzrYUjqs3Xlv25/DDUqlwXXUTHc97i36VvXmpMFEUzQm3DlYtlKY23LSqenOvo
 b1n83Vb7y3w3+hgLgO2hp0dySjG0P5ry7dLYJI6ejc34DR7MzPBwrbcXLjUKr0AOTBTm
 2krXXHLOw47y5jB1WDGn3JKUfswpoEGZVsRieIJ8DZApZEnvIgbz5p5NSYBA5LTtq1hJ
 A8px6/U/B6gVT+qqta8SAU6QKw/Vlf8kZ2iXjHVhIdv3/wCDlVRkTLdGteVJfHc0P0bg
 edDg==
X-Gm-Message-State: ABUngvfJY8ckPZlnDbjqvASLxywPIWBdBa66MMrYHNyNLpW6d/V5XiI5wO1Y7yu9NrKuCNFka1BdnFLBJ6j0OA==
X-Received: by 10.202.114.129 with SMTP id p123mr3116656oic.132.1478485512801; 
 Sun, 06 Nov 2016 18:25:12 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:24:52 -0800 (PST)
In-Reply-To: <1478278847-9164-3-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 12:54:52 +1030
X-Google-Sender-Auth: IO2I4EpuB2R0HefHBgpXRSo41vU
Message-ID: <CACPK8Xc8eMnZBpqzn9JC2u2boMj6o2=aVxaf53RfY+9ATAQ_UQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/8] mtd: spi-nor: aspeed: improve 4 bytes
 mode
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
X-List-Received-Date: Mon, 07 Nov 2016 02:25:15 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The AST2400 SPI flash uses the CE0 control register to set 4Byte mode
> and the AST2500 FMC and AST2400 FMC flash controllers use the CE
> Control register for this purpose or they are strapped by hardware.
>
> Currently, the setting of the CE0 control register is done for all,
> which is incorrect, so fix that to keep only the AST2400 SPI. Luckily,
> the bogus setting has no impact on operations as bit 13 defines a SPI
> clock divisor.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 51 +++++++++++++++++++++++-----------=
------
>  1 file changed, 29 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 75ba73ef0660..763f3c604140 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -751,6 +751,33 @@ static void aspeed_smc_chip_set_type(struct aspeed_s=
mc_chip *chip, int type)
>         writel(reg, controller->regs + CONFIG_REG);
>  }
>
> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
> +{
> +       struct aspeed_smc_controller *controller =3D chip->controller;
> +       u32 reg;
> +
> +       /*
> +        * The AST2400 SPI flash controller does not have a CE Control
> +        * register. It uses the CE0 control register to set 4Byte
> +        * mode at the controller level.
> +        */
> +       if (chip->controller->info =3D=3D &smc_2400_info) {

Should we add a callback that calls either a ast2400 or ast2500
version of aspeed_smc_chip_set_4b instead of this method?

Cheers,

Joel

> +               chip->ctl_val[smc_base] |=3D CONTROL_SPI_IO_ADDRESS_4B;
> +               chip->ctl_val[smc_read] |=3D CONTROL_SPI_IO_ADDRESS_4B;
> +       }
> +
> +       /*
> +        * The AST2500 FMC and AST2400 FMC flash controllers should be
> +        * strapped by hardware, or autodetected, but the AST2500 SPI
> +        * flash needs to be set.
> +        */
> +       if (chip->controller->info =3D=3D &smc_2500_info) {
> +               reg =3D readl(controller->regs + CE_CONTROL_REG);
> +               reg |=3D 1 << chip->cs;
> +               writel(reg, controller->regs + CE_CONTROL_REG);
> +       }
> +}
> +
>  static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>                                       struct resource *r)
>  {
> @@ -814,28 +841,8 @@ static int aspeed_smc_chip_setup_init(struct aspeed_=
smc_chip *chip,
>
>  static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>  {
> -       struct aspeed_smc_controller *controller =3D chip->controller;
> -       u32 reg;
> -
> -       /*
> -        * Set 4 byte mode in the chip controller register and also in
> -        * controller config register. The BMC flash controller is
> -        * strapped by hardware, or autodetected, but the SPI flash
> -        * controller of the AST2500 still needs to be set.
> -        */
> -       if (chip->nor.mtd.size > SZ_16M) {
> -               chip->ctl_val[smc_base] |=3D CONTROL_SPI_IO_ADDRESS_4B;
> -
> -               /*
> -                * The SPI flash controller of the AST2400 does not
> -                * have such a setting.
> -                */
> -               if (chip->controller->info =3D=3D &smc_2500_info) {
> -                       reg =3D readl(controller->regs + CE_CONTROL_REG);
> -                       reg |=3D 1 << chip->cs;
> -                       writel(reg, controller->regs + CE_CONTROL_REG);
> -               }
> -       }
> +       if (chip->nor.mtd.size > SZ_16M)
> +               aspeed_smc_chip_set_4b(chip);
>
>         chip->ctl_val[smc_write] =3D chip->ctl_val[smc_base] |
>                 spi_control_fill_opcode(chip->nor.program_opcode) |
> --
> 2.7.4
>
