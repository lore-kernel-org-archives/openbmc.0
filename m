Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh2N24ShZzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 14:46:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tp7Rsxo7"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id 202so4544472ybd.0
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 21:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OrQizyeV1SlPlREZ6nB+lNg8NQmw84Q/CFAQJ42pi6U=;
 b=tp7Rsxo7NIjC0vR7onGClldSly/GFmrCcjfQNECDIrT5K+BNPFVHulfk8mQVP66NA6
 CR83Jb8C+IsajIyg4kO0fETrEOEWfl+PjQaZPsEwB5y5rZRYC1/DtEees02NpssliKWn
 MJLVVdC1rIedxSVsuEh5SmHSt5nHG1RgAcg6bJ5keg6E8pmnoPMTXDAZSkp923bl6JcA
 PQ+Zbg4cqYExWHjp7XplDVXvZdNwJ9fQ/TTgFhykbG8ymXnLDEoC6KuBBcOuMQ0mJ2mN
 0c5vJ5N1gew89Yo6eYZuA2J9kdrf5mak1NlfAADaNpLbUKuRSXGn0CklfsxvL1bawGvr
 oMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OrQizyeV1SlPlREZ6nB+lNg8NQmw84Q/CFAQJ42pi6U=;
 b=Faznq2aenMEFz/RhRJfI3IX7T1s+LdbG8Ml/iUw7fbVgLGJdb0tTwYU/bCg+nm7EHf
 0uQ4FkWA4OUdS6TpJyNIurD66qtk2X/+IOf9Mumt2RZ03jIiAHKiV9xwUsp/b8qCO/77
 tCS/juR6TSq1vI0mHlUrWrbECBtUy6pTkN6nFi5ArVhC/0RqOFrr2BOvLqciDxgjzC6r
 7v0RDv6onlmSFYvH5ttnczxgSi6tD0zdNA2db1INKY0Vmburu9OXBlbQ2yJpNXatddk0
 qKN/qjD8mWn/nzvPxHZljPoNz33B8wAkXOPIyZwh7XoZ0dAcfAj7c6NpZghugz5ninDP
 Ho2A==
X-Gm-Message-State: AODbwcBkXX73nUtOTJemdzgrSrUm9xdBHR26uGvpNafXKFox8kd8Zjul
 0/HMnMlWRKyEirsjpSC9NkKYfuEGBQ==
X-Received: by 10.37.47.65 with SMTP id v62mr584817ybv.94.1496637999479; Sun,
 04 Jun 2017 21:46:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 21:46:19 -0700 (PDT)
In-Reply-To: <20170602194612.11866-1-rlippert@google.com>
References: <20170602194612.11866-1-rlippert@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 14:16:19 +0930
X-Google-Sender-Auth: tiP17KIRErO9ugW-4Zqi2vbwnN4
Message-ID: <CACPK8XdmjihLOZseWtGq+9QKQ+mDVNujP_csW8fhUTzPFoTMaQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: zaius: Support new board FSI
 gpio pin mapping
To: Robert Lippert <roblip@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>, 
 Robert Lippert <rlippert@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 05 Jun 2017 04:46:43 -0000

On Sat, Jun 3, 2017 at 5:16 AM, Robert Lippert <roblip@gmail.com> wrote:
> FSI routing was broken on EVT boards and all boards were reworked
> to use the nearest available GPIO pins.  Future boards have
> fixed the issue so need to use the original planned GPIOG ports.

How long will we need to carry support for the EVT boards?

We had proposed using u-boot to fix up the device tree for these kind
of changes. If you want to support the EVT long term, we should look
in to implementing those changes in u-boot.

I have applied this to dev-4.10 so we can support your boards for the
time being.

Cheers,

Joel

> Signed-off-by: Robert Lippert <rlippert@google.com>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts |  8 ++++++--
>  arch/arm/mach-aspeed/aspeed.c              | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index b5c4c0fb2986..68baf3288263 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -80,8 +80,12 @@
>
>                 status = "okay";
>
> -               clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
> -               data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
> +               /*
> +                * These 2 GPIOs are set per board revision in aspeed.c.
> +                * These are the DVT and beyond values:
> +                * clock-gpios = <&gpio ASPEED_GPIO(G, 0) GPIO_ACTIVE_HIGH>;
> +                * data-gpios = <&gpio ASPEED_GPIO(G, 1) GPIO_ACTIVE_HIGH>;
> +                */
>                 trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>                 mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 5c88286c96fd..1e080d8909f4 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -8,6 +8,8 @@
>   */
>
>  #include <linux/init.h>
> +#include <linux/gpio/machine.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/io.h>
> @@ -141,6 +143,34 @@ static void __init do_zaius_setup(void)
>         /* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
>         reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
>         board_rev = (reg >> 3) & 0x1F;
> +       printk(KERN_INFO "Zaius platform board revision: 0x%02x\n", board_rev);
> +
> +       /* EVT boards have different FSI pin mappings */
> +       if (board_rev < 0x08) {
> +               static struct gpiod_lookup_table fsi_evt_gpio_lookup = {
> +                       .dev_id = "fsi-master",
> +                       .table = {
> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 3),
> +                                           "clock", GPIO_ACTIVE_HIGH),
> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 2),
> +                                           "data", GPIO_ACTIVE_HIGH),
> +                               { },
> +                       },
> +               };
> +               gpiod_add_lookup_table(&fsi_evt_gpio_lookup);
> +       } else {
> +               static struct gpiod_lookup_table fsi_gpio_lookup = {
> +                       .dev_id = "fsi-master",
> +                       .table = {
> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 0),
> +                                           "clock", GPIO_ACTIVE_HIGH),
> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 1),
> +                                           "data", GPIO_ACTIVE_HIGH),
> +                               { },
> +                       },
> +               };
> +               gpiod_add_lookup_table(&fsi_gpio_lookup);
> +       }
>
>         /* Assert MAC2 PHY hardware reset */
>         /* Set pin low */
> --
> 2.13.0.506.g27d5fe0cd-goog
>
