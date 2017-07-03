Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1Bhk6BNJzDr42
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 13:00:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oxb8FYBI"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id 84so7310746ybe.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 20:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=jSMAlRu8bXTPz+FxyT3hMRYWhHOQ5f+TKPCUYTJKsu8=;
 b=Oxb8FYBIkHOgamNS+sLF5xbLNBCWoE+lYa0lVhM/8Y9xE2V6qhMsdGf18qleDe1IGK
 BQaY7qB1WSfYApxDzMiPRKuYIdPZc/qqlBxqiLp+gTTED5GWzffoGx8KksfWpBdCXOpX
 3KuoZVvKhvTIWkwvYisUx3zSm3Hf0A2CaP92ze4f2EqskEQG+8w8xvNnLOiAA3qC7Rud
 iTMdbDRBGWLUEJDQOH8EtYCY4/bqgOV78haeAZ6m/9n007GrCf9ui1eL0h2mUqYcbqaQ
 WPpo6ESwQe6CDQbyuv58G0YJnXiFRtdIosNqnZ0T6hWKVXSOdj0N/UiLmlKNe1x4qrp1
 TjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=jSMAlRu8bXTPz+FxyT3hMRYWhHOQ5f+TKPCUYTJKsu8=;
 b=mzPzU+3+Bz+sv3DllN9srP5ew2trucFktsl+MSislccQ4KoVLxLKcK2NBNNugeen4J
 v9YKoLri9LKMCFwpmYJ7h/dQjfN2d3eeo7AYpxL4KOrxQKISNyDdrPBYoG1kAkdjCS8A
 DD+G0Ss8Tivvf44WCOiZbafJeYG/1t7siQOpc6s8mFd8pGLJbEWBymuSut0K4nAun8fd
 5hf1asnivtvDHTqsN1q9HDZj1Azv+/L8XOCuk5uEWrAnbzHDpDR8kbcLEmyvGzI50csj
 Iha0Sk/17Rzhl0Gw6Wv8nQrC5sQ+JQpXfKAw4uFoj3RcHKJIavWH1Xq6UtEe6tebKUil
 EIwQ==
X-Gm-Message-State: AKS2vOwTJUmufh5iK31MiPklTU8gl7XDdRaGFUEUdmr4ulbYRI0yYoV/
 ZfBOXNVCOHKhtTmourtOup1z/LT2JrRLlLU=
X-Received: by 10.37.177.158 with SMTP id h30mr25351971ybj.214.1499050835613; 
 Sun, 02 Jul 2017 20:00:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Sun, 2 Jul 2017 20:00:15 -0700 (PDT)
In-Reply-To: <1499032165-23145-1-git-send-email-clg@kaod.org>
References: <1499032165-23145-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 12:30:15 +0930
X-Google-Sender-Auth: I7bmGBvFdlv1EQVvTRfKQ7dU70I
Message-ID: <CACPK8XdCeGO2q8p5TYzObYar3iEouS4ytAuaxU-eY7E5iE9ZZQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] mtd: spi-nor: aspeed: limit the maximum
 SPI frequency
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 03 Jul 2017 03:00:39 -0000

On Mon, Jul 3, 2017 at 7:19 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The optimize read algo can choose a 100MHz SPI frequency which might
> be a bit too high for dual output IO on some chips, for the W25Q256 on
> palmetto for instance. The MX66L1G45G on witherspoon should be fine
> though.
>
> To do some fine tuning, we use the "spi-max-frequency" property in the
> device tree. By default, the frequency is 50MHz, as U-boot does for
> most of the supported chips.

Looks good to me. I had some questions below to clear up my understanding.

I will boot this on a few machines today for you.

Is this a suspect for the first-byte corruption issue?

Cheers,

Joel

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 69 +++++++++++++++++++++++++---------=
------
>  1 file changed, 44 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 23622bf62b6b..7d9f570f11ff 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -121,6 +121,7 @@ struct aspeed_smc_chip {
>         u32 ctl_val[smc_max];                   /* control settings */
>         enum aspeed_smc_flash_type type;        /* what type of flash */
>         struct spi_nor nor;
> +       u32 clk_rate;
>  };
>
>  struct aspeed_smc_controller {
> @@ -148,6 +149,8 @@ struct aspeed_smc_controller {
>         struct aspeed_smc_chip *chips[0];       /* pointers to attached c=
hips */
>  };
>
> +#define ASPEED_SPI_DEFAULT_FREQ                50000000
> +
>  /*
>   * SPI Flash Configuration Register (AST2500 SPI)
>   *     or
> @@ -215,7 +218,7 @@ struct aspeed_smc_controller {
>
>  #define CONTROL_KEEP_MASK                                              \
>         (CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 |=
 \
> -        CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_=
MODE_3)
> +        CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)

We're dropping CONTROL_CLOCK_FREQ_SEL_MASK because the driver now sets
it own value?

>
>  /* Interrupt Control and Status Register */
>  #define INTERRUPT_STATUS_REG           0x08
> @@ -820,6 +823,34 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct a=
speed_smc_chip *chip)
>         chip->ctl_val[smc_read] |=3D CONTROL_IO_ADDRESS_4B;
>  }
>
> +static const u32 aspeed_smc_hclk_divs[] =3D {

Could be a u8.

> +       0xf, /* HCLK */
> +       0x7, /* HCLK/2 */
> +       0xe, /* HCLK/3 */
> +       0x6, /* HCLK/4 */
> +       0xd, /* HCLK/5 */
> +};

You stop at HCLK/5 as there's no point going any slower?

> +
> +#define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
> +
> +static u32 aspeed_smc_get_hclk(struct aspeed_smc_chip *chip,
> +                              u32 max_freq)
> +{
> +       int i;
> +       u32 div;
> +       u32 ahb_freq =3D clk_get_rate(chip->controller->ahb_clk);
> +
> +       for (i =3D ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
> +               u32 freq =3D ahb_freq / i;
> +
> +               if (freq >=3D max_freq)
> +                       break;
> +
> +               div =3D ASPEED_SMC_HCLK_DIV(i);
> +       }
> +       return div;
> +}
> +
>  static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>                                       struct resource *res)
>  {
> @@ -858,6 +889,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_s=
mc_chip *chip,
>         dev_dbg(controller->dev, "control register: %08x\n", reg);
>
>         base_reg =3D reg & CONTROL_KEEP_MASK;
> +       base_reg |=3D aspeed_smc_get_hclk(chip, chip->clk_rate);
>         if (base_reg !=3D reg) {
>                 dev_dbg(controller->dev,
>                         "control register changed to: %08x\n",
> @@ -865,17 +897,9 @@ static int aspeed_smc_chip_setup_init(struct aspeed_=
smc_chip *chip,
>         }
>         chip->ctl_val[smc_base] =3D base_reg;
>
> -       /*
> -        * Retain the prior value of the control register as the
> -        * default if it was normal access mode. Otherwise start with
> -        * the sanitized base value set to read mode.
> -        */
> -       if ((reg & CONTROL_COMMAND_MODE_MASK) =3D=3D
> -           CONTROL_COMMAND_MODE_NORMAL)
> -               chip->ctl_val[smc_read] =3D reg;
> -       else
> -               chip->ctl_val[smc_read] =3D chip->ctl_val[smc_base] |
> -                       CONTROL_COMMAND_MODE_NORMAL;
> +       /* start with the sanitized base value set to read mode. */
> +       chip->ctl_val[smc_read] =3D chip->ctl_val[smc_base] |
> +               CONTROL_COMMAND_MODE_NORMAL;
>
>         dev_dbg(controller->dev, "default control register: %08x\n",
>                 chip->ctl_val[smc_read]);
> @@ -968,15 +992,6 @@ static bool aspeed_smc_check_calib_data(const u8 *te=
st_buf, u32 size)
>         return cnt >=3D 64;
>  }
>
> -static const uint32_t aspeed_smc_hclk_divs[] =3D {
> -       0xf, /* HCLK */
> -       0x7, /* HCLK/2 */
> -       0xe, /* HCLK/3 */
> -       0x6, /* HCLK/4 */
> -       0xd, /* HCLK/5 */
> -};
> -#define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
> -
>  static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
>                                      u32 max_freq)
>  {
> @@ -1104,11 +1119,8 @@ static int aspeed_smc_chip_setup_finish(struct asp=
eed_smc_chip *chip)
>         dev_dbg(controller->dev, "read control register: %08x\n",
>                 chip->ctl_val[smc_read]);
>
> -       /*
> -        * TODO: get max freq from chip
> -        */
>         if (optimize_read && info->optimize_read)
> -               info->optimize_read(chip, 104000000);
> +               info->optimize_read(chip, chip->clk_rate);
>         return 0;
>  }
>
> @@ -1156,6 +1168,13 @@ static int aspeed_smc_setup_flash(struct aspeed_sm=
c_controller *controller,
>                         break;
>                 }
>
> +               if (of_property_read_u32(child, "spi-max-frequency",
> +                                        &chip->clk_rate)) {
> +                       chip->clk_rate =3D ASPEED_SPI_DEFAULT_FREQ;
> +               }
> +               dev_info(dev, "Using %d MHz SPI frequency\n",
> +                        chip->clk_rate / 1000000);
> +
>                 chip->controller =3D controller;
>                 chip->ctl =3D controller->regs + info->ctl0 + cs * 4;
>                 chip->cs =3D cs;
> --
> 2.7.5
>
