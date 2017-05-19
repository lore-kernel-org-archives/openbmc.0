Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wTXzf6Px1zDqcf
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 13:07:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DWmb6uTX"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 17so4161917ywk.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 20:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=i7+vxAHbeFV+Svh5iy9USD/ygOeVN3WN2KXE9lxafqY=;
 b=DWmb6uTXSBSWyvDDqKhoMxk7binAk4viKrX0M9ku20dk//B8bM16Z1HMmPibrcMYpf
 noChJx8Ppkewx+F7+RLzHhNtp+8iZvhZriYhpWa82+ff+kivn/SP361umApH2JeKOUF3
 SuD1Nj/X5qmTkK1VSEnhTXg34noiMPhnaNnWBuZaH0lpkJVVMNQf4Vbd1ySekcEANkW6
 TyuPbxVPIpmSfK/QI3KyTok9FVRBgO28b8O0y9Yn9ULjahKwiNegx5qOCFMQWpZ0vak8
 VRLhM+vsSYAIWoUKnKxzwRSzFlzaOP4sIQ3TokNzJKMKVtX47T1hBMyk3YN4u2V+Urnt
 2Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=i7+vxAHbeFV+Svh5iy9USD/ygOeVN3WN2KXE9lxafqY=;
 b=A8HefBmbPAlgHxmNq+GLWOYms9dIRd1jcR5NQ8/ojpMqRZZBCK97GrTSYeN5JvQ33u
 v8yWUjBoCgBIAaEMAAW0qx7N65cpZx38NvJ1JzhgdR3NJnrhQF+lbHiqDbH2MRAyA6aw
 CE2D7aito29mrPgzW5swLAhduyLIfwqFJLSfW9Ba1j2TLhp3Sg/dt7OLwyxN7vndrar4
 gye675ffOesUEAO4JZl091d5Je4+ruawUpvvpHKwk3qISjPIec7x345r9RizDHxQLTvQ
 0Vns+2IHwogiUiPWV1jsm6G0DlyJhZsNyblMYrGFrft8zx3Y+NheRnzSmAMyQScXkz8+
 lsTQ==
X-Gm-Message-State: AODbwcCBQfvQ2+BDTJaHToUuBmhdQ4n72Jd4HrptG8UluTtfdBWAHkLj
 ZKt6GHkBJ7RMOS49274pg5h0OD/P0Q==
X-Received: by 10.13.243.133 with SMTP id c127mr6504872ywf.43.1495163260321;
 Thu, 18 May 2017 20:07:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 18 May 2017 20:07:19 -0700 (PDT)
In-Reply-To: <20170518095100.194211-1-c_mykolak@mellanox.com>
References: <20170518095100.194211-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 19 May 2017 11:07:19 +0800
X-Google-Sender-Auth: 5JPZKQ0BpTyWnD2zGLID8B5OamE
Message-ID: <CACPK8XdMjXDpDeuGwzaYEP+tcuAa3XC_5JvH667bdrJF2sNfGg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Initial introduction of Mellanox switches
 of MSNXXXX family equipped with Aspeed 2520 BMC SoC. Initial minimal
 commit
 to support Mellanox MSNXXXX switches, including: Adding Mellanox msn platform
 early initialization. Adding Mellanox msn platform device tree file
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 19 May 2017 03:07:43 -0000

Hello Mykola,

Thanks for the patch! It's a great start. I have a few things that you
need to clean up first.

Make your commit messages in this format. The important part is to
have a short (~50 character title) that becomes the email subject, and
then a longer discussion below. For example:

ARM: aspeed: Add Mellanox MSX machine

Initial introduction of Mellanox switches of MSNXXXX family equipped
with Aspeed 2520
BMC SoC. This adds the platform early initialization and msn platform
device tree file.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

When you send your next version, use git-format-patch -v2 to indicate
that this is the second revision.

On Thu, May 18, 2017 at 5:51 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi  |  32 ++++
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      | 205 +++++++++++++++++++++
>  arch/arm/configs/aspeed_g5_defconfig               |   2 +
>  arch/arm/mach-aspeed/aspeed.c                      |  28 +++
>  6 files changed, 269 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 16d3b5e7f5d1..84601d869a1b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -172,6 +172,7 @@ meas        Measurement Specialties
>  mediatek       MediaTek Inc.
>  melexis        Melexis N.V.
>  melfas MELFAS Inc.
> +mellanox       Mellanox Technologies
>  memsic MEMSIC Inc.
>  merrii Merrii Technology Co., Ltd.
>  micrel Micrel Inc.
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 30fe65627f30..3dba6c633686 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -990,6 +990,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-witherspoon.dtb \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
> +       aspeed-bmc-mellanox-msn.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
> new file mode 100644
> index 000000000000..cf8ee54f13c2
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
> @@ -0,0 +1,32 @@
> +/* This file is the label for the bmc primary flash and its partitions */

Having a separate dsti for the flash layout is okay, and we do this
for openpower machines so we can share the layout without cut/paste.

Since you only have one machine, you could include this in the main dts?

> +                               label = "bmc";
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               u-boot {
> +                                       reg = < 0 0x60000 >;
> +                                       label = "u-boot";
> +                               };
> +                               u-boot-env {
> +                                       reg = < 0x60000 0x10000>;
> +                                       label = "u-boot-env";
> +                               };
> +                               kernel  {
> +                                       reg = < 0x70000 0x280000 >;
> +                                       label = "kernel";
> +                               };
> +                               dtb  {
> +                                       reg = < 0x2f0000 0x10000 >;
> +                                       label = "dtb";
> +                               };
> +                               initramfs {
> +                                       reg = < 0x300000 0x1c0000 >;
> +                                       label = "initramfs";
> +                               };
> +                               rofs  {
> +                                       reg = < 0x4c0000 0x1740000 >;
> +                                       label = "rofs";
> +                               };
> +                               rwfs  {
> +                                       reg = < 0x1c00000 0x400000 >;
> +                                       label = "rwfs";
> +                               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> new file mode 100644
> index 000000000000..372ce2cd5320
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -0,0 +1,205 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "MSNXXXX BMC";
> +       compatible = "mellanox,msnxxxx-bmc", "aspeed,ast2500";

Does MSN stand for something?

The xxxx is a bit unsual looking. Could you instead just use mellanox,msn-bmc?

> +
> +       aliases {
> +               serial0 = &uart1;
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200n8 earlyprintk";
> +       };
> +
> +       memory {
> +               /* 512MiB SDRAM DDR4 @ 0x8000_0000 */
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       ahb {
> +               bmc_pnor: fmc@1e620000 {
> +                       reg = < 0x1e620000 0xc4
> +                               0x20000000 0x02000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2500-fmc";
> +                       interrupts = <19>;
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +#include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
> +                       };
> +               };
> +
> +               host_pnor: spi2@1e631000 {
> +                       reg = < 0x1e631000 0xc4
> +                               0x38000000 0x08000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,ast2500-spi";
> +                       status = "disabled";

Disabled?

> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_spi2ck_default
> +                                    &pinctrl_spi2cs0_default
> +                                    &pinctrl_spi2miso_default
> +                                    &pinctrl_spi2mosi_default>;
> +
> +                       host_flash {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor";
> +                               label = "host_flash";
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                       };
> +               };
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +       use-ncsi;
> +       no-hw-checksum;

I don't think we need no-hw-checksum for ast2500 on 4.10.

> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 0f1a536ba1b2..25fbc6c1adb7 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -27,6 +27,7 @@
>  #define AST_BASE_MAC0          0X1E660000 /* MAC 1 */
>  #define AST_BASE_SCU           0x1E6E2000 /* System Control Unit (SCU) */
>  #define AST_BASE_GPIO          0x1E780000 /* GPIO Controller */
> +#define AST_BASE_WD            0x1E785000 /* Watchdog */
>
>  static struct map_desc aspeed_io_desc[] __initdata __maybe_unused = {
>         {
> @@ -188,6 +189,31 @@ static void __init do_lanyang_setup(void)
>         writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>  }
>
> +static void __init do_mellanox_setup(void)
> +{
> +       unsigned long reg;
> +
> +       do_common_setup();
> +
> +       /* Set strap to RGMII for dedicated PHY networking */
> +       reg = readl(AST_IO(AST_BASE_SCU | 0x70));
> +       reg |= BIT(7);
> +       reg &= ~BIT(6);
> +       writel(reg, AST_IO(AST_BASE_SCU | 0x70));


This is a software workaround for incorrect hardware strapping. Will
the strapping be fixed on a future revision of your hardware?

> +       /* Disable UART1 Reset from LPC */
> +       writel(0x00000A00, AST_IO(AST_BASE_LPC | 0x98));
> +
> +       reg = readl(AST_IO(AST_BASE_SCU | 0x48));
> +       reg |= BIT(29);
> +       writel(reg, AST_IO(AST_BASE_SCU | 0x48));

Please add a comment for this. I think it's enabling RMII1 50MHz RCLK output.

> +       /* Disable WD2 */
> +       reg = readl(AST_IO(AST_BASE_WD | 0x2c));
> +       reg &= ~BIT(0);
> +       writel(reg, AST_IO(AST_BASE_WD | 0x2c));

Instead of disabling the watchdog here, you should load a driver for
it. To do this, add the following to your device tree:

&wdt2 {
        status = "okay";
};

Cheers,

Joel
