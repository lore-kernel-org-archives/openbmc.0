Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V+RtFr5v"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zfybC625dzF0Zj
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 18:53:27 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id f4so17956857qtj.6
 for <openbmc@lists.ozlabs.org>; Sun, 11 Feb 2018 23:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dLNGgY47uUDM4JrPsUDX1xVI8iBXt6QP5fjtPJNe3Zo=;
 b=V+RtFr5vx4CtkIm45tWC3qv9GHtOPuCNDmGMdEhhJkzTjfxxLFKuIuUh3jATvW+BOt
 SWWzcwGpCgWfq/wBTmX/iGj51kknKUyCBQnz80kCKCAWDtTb0jML1992GVCxVr3Q2J7A
 u5qbNdW7tsGSFv98kBCFL6nFu1oY0Dpj+J1z62xQw+/kh1X3KOhJacdY6v3e9s2P+yXx
 llWCeYmBHS6IlTtutMT20+XCn9SfIVtr79uUOCcge2Fq7YJ1tUjZ0qghEK3qDeYMmGct
 f0oAEnHyJ7+HK/9qQJyd31Tb2dUio6HdiISRJcyZaHMjMpp6eSq8qVo0hj3cMby6o/PJ
 1zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dLNGgY47uUDM4JrPsUDX1xVI8iBXt6QP5fjtPJNe3Zo=;
 b=K2yTpxs0gSTyZ0E+a7YKRa79ClyYeRjB2LJVdqazAipPFBtTl9vJ+5USqSuEJAeb9t
 GDYNZG8PCD0M6bhNAkWeDwLNYUOP2vydhkj67AVUr1pul8EkhwVIg3jJnEvfITGVe4Aw
 3x3AMrG9jnXmstuE5ayFUL5z3JX13riEYIJA6fYU5q2Kb0IRi+XlGG2uv0Bi5mvDhSz8
 3HyKmqPoGhCGVoymogDSKp5244sUzWW+Tlu7nkdE+OC4+NUlhCtj7xQORvlDGIpXowwm
 fDKzBalAwVh0PJmMF+ul88LWcgMNZJAazI63buumkI1OCIrKmV+ZQE478w7eAGP4vBAD
 JU2g==
X-Gm-Message-State: APf1xPAGyxanVpSKkM7MPwKdP+OTPgxlQmXmDLZZhtogsuFIvzv59/xR
 5yo0i3D1OPXgoqOqySU8Vdk1BKBalmmGu9bz+5Y=
X-Google-Smtp-Source: AH8x2267YAyp8tFDSJL3ljHOLT1VuEMS2wIEj+5kngcgHiyQAuB99mCQ8wCWFtYJElrnTQ3TsNo2ScQdYvFF019cbOo=
X-Received: by 10.237.38.37 with SMTP id z34mr18687922qtc.178.1518422004836;
 Sun, 11 Feb 2018 23:53:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Sun, 11 Feb 2018 23:53:04 -0800 (PST)
In-Reply-To: <20180212025523.5566-1-chen.kenyy@inventec.com>
References: <20180212025523.5566-1-chen.kenyy@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Feb 2018 18:23:04 +1030
X-Google-Sender-Auth: ChtqWwI3qcmTwFLfXRUoyFRS5dE
Message-ID: <CACPK8XeyaPq69hY7LFFr+jPXzm5==LpJWDtro9bz6c-F4B-aAA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v4] ARM: dts: aspeed: Add ARM system BMC
 device tree
To: Ken Chen <chen.kenyy@inventec.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Feb 2018 07:53:28 -0000

Hi Ken,

This is looking much better. Just a few small things to tweak before I
can merge this.

On Mon, Feb 12, 2018 at 1:25 PM, Ken Chen <chen.kenyy@inventec.com> wrote:
> Add centriq2400-rep dts and modify platform initial

This commit message needs some work.

Take a look at the commit messages from the introduction of other machines:

> commit 8f9bafbb92c0308cf8d33536803c822e14bed4d7
> Author: Joel Stanley <joel@jms.id.au>
> Date:   Wed Jan 4 16:31:28 2017
>
>    ARM: dts: aspeed: Add Romulus BMC platform
>
>    Romulus is an OpenPower machine with an ast2500 BMC. It has NCSI
>    networking and 512MB of RAM.

or

> commit f88bc8e15f1c1154495107ed378cce271309349d
> Author: Rick Altherr <raltherr@google.com>
> Date:   Tue Nov 28 23:11:05 2017
>
>    ARM: dts: aspeed: Add Qanta Q71L BMC machine
>
>    The Qanta Q71L BMC is an ASPEED ast2400 based BMC that is part of a
>    Qanta x86 server.


>
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>
> ---
> v3->v4
> - Modify Makefile for centriq2400-rep dts
> - Fix typo label
> - Removed unnecessary define of spi2 and centriq2400-spi-hwmon device
> - Removed lpc device
> - Fix coding style
> - Removed ssif device
> - Removed max31790 device
> - Removed register control of GPIO and Watchdog

Great changelog. This is very useful to me as a reviewer.

> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 276 +++++++++++++++++++++
>  arch/arm/mach-aspeed/aspeed.c                      |  11 +
>  3 files changed, 288 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c54fc8..77aef19 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-mellanox-msn.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
>         aspeed-bmc-intel-s2600wf.dtb \
> +        aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> new file mode 100644
> index 0000000..6c7784f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Qualcomm Centriq 2400  REP AST2520";

May I ask, what does REP mean?

> +       compatible = "qualcomm,centriq2400-rep-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x40000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 7>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               uid_led {
> +                       label = "UID_LED";
> +                       gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ras_error_led {
> +                       label = "RAS_ERROR_LED";
> +                       gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               system_fault {
> +                       label = "System_fault";
> +                       gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +                label = "bmc";

Still some strange whitespace here. Make sure your editor is using tabs.

> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +       flash@0 {
> +               status = "okay";
> +       };
> +};
> +
> +&spi2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi2ck_default &pinctrl_spi2miso_default &pinctrl_spi2mosi_default &pinctrl_spi2cs0_default>;

Andrew, can you please review the pinctrl bits?

> +};
> +
> +&uart3 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
> +       current-speed = <115200>;
> +};
> +

> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 5965bbf..8fce9bc 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c

We do not have an aspeed.c in the dev-4.13 branch.

I do not plan on merging one, as at this stage all of the
functionality that was present in aspeed.c can be performed in other
drivers. I suggest submitting the device tree without any change to
aspeed.c.

To review what the changes are:

> static void __init do_common_setup(void)
> {
>        /* Enable LPC FWH cycles, Enable LPC to AHB bridge */
>        writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));

This is now done in drivers/misc/aspeed-lpc-ctrl.c

>        /* Set UART routing */
>        writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));

This is the default, so we do not need have this line.

>
>        /* Setup scratch registers */
>        writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
>        writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));

These are specific to the operation of Hostboot on OpenPower
platforms. I suspect you do not require these lines.

Cheers,

Joel



> @@ -232,6 +232,15 @@ static void __init do_mellanox_setup(void)
>         writel(reg, AST_IO(AST_BASE_SCU | 0x48));
>  }
>
> +
> +static void __init do_centriq2400rep_setup(void)
> +{
> +       u32 reg;
> +
> +       do_common_setup();
> +}
> +
> +
>  #define SCU_PASSWORD   0x1688A8A8
>
>  static void __init aspeed_init_early(void)
> @@ -284,6 +293,8 @@ static void __init aspeed_init_early(void)
>                 do_lanyang_setup();
>         if (of_machine_is_compatible("mellanox,msn-bmc"))
>                 do_mellanox_setup();
> +        if (of_machine_is_compatible("qualcomm,centriq2400-rep-bmc"))
> +                do_centriq2400rep_setup();
>  }
>
>  static void __init aspeed_map_io(void)
> --
> 2.9.3
>
