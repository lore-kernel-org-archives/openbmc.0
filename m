Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDcpJ6djNzDqJ4
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 15:14:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ITTIru9x; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 109so8097806uat.2
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CqB8Kpq3uPSRgZlYBx07Uwms20MxwDMvl/Yp7E9k4k0=;
 b=ITTIru9xV3fYFyWiUsC/XuUfNxhQvMTYC3K52uwLsV32b8SVVJoxzQx3i2iqFP4SYM
 8l1NIerIKzmnBfUafQNCRppyqzU4FWLPlo+kUAdzzHI238cjKf90BRVfOTj+pF3fEqqu
 3qH3kNZ6P3dpCiz3wttw6KVJ2WzEeo4EhkE2alRjodKIzzZOYQjC3cITT0oJwGEQuacK
 i6ixIt24wLHxnWOkBSv5tE8xV204cGDoMQvoXHqAiEuJ0hd6hhZQbrAfYyprrCwL8Npr
 oH6Q/6ocEU2bnS1stsnoRcdtkmzfg6Fs0inYmfdBhuDAQNEqDlb66iocqomIwrPE9Gqn
 iXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CqB8Kpq3uPSRgZlYBx07Uwms20MxwDMvl/Yp7E9k4k0=;
 b=SFwlaC5diwR2vEqfiFa3c4LlEhxQxJLwCUGwXFZ5eYOkbY/ZkPmVi9b7BKSeGoOp0Z
 4knFoj+7H9DkwKu9/Um1cGK2GamzjRT/xuVTCRVG0JcL24FmRFCZwBrCGHOTqLw2bei5
 duHr7xp9+qcwbz6SlpuXagaJm8tpVvgNY+eunZJSd3pXl87hzxCwBubuGIUCfHhQDE7Y
 sO15N8mmdBbe6Z29oXMccf0vmmgGibP19TMuEc1JhiIvQbPp7Vot0xppLb4AVD1VEmE6
 H98gBPkJhkUS2Be5qXafSt0Y/ibgvMaf0NReKmOV8ji93mpheigeNqmp1nM0RFI7CrqP
 2CnA==
X-Gm-Message-State: AEkoouscD6vytV7NxEFl1cYIAFedMwNfikiEmmyC0mq1/miGifF34x7qEwSJSDSxw6w00PNa9hhK/Q/7GoAo4w==
X-Received: by 10.31.146.10 with SMTP id u10mr17550193vkd.14.1471410838695;
 Tue, 16 Aug 2016 22:13:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 16 Aug 2016 22:13:38 -0700 (PDT)
In-Reply-To: <1470812613-51011-1-git-send-email-vadimp@mellanox.com>
References: <1470812613-51011-1-git-send-email-vadimp@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Aug 2016 14:43:38 +0930
X-Google-Sender-Auth: VGCLyCcEtztK1x6PxdqfO9ssuP0
Message-ID: <CACPK8XeYAMWCZpQ+TrZuwxuxfCzzCCkoq5wCdk8HuPyhFVzBBw@mail.gmail.com>
Subject: Re: [dev-4.7 patch 5/5] arch/arm: introduce support for Mallanox evb
 aspeed 2500 config and dts flavors
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jiri@mellanox.com,
 michaelsh@mellanox.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 17 Aug 2016 05:14:01 -0000

On Wed, Aug 10, 2016 at 4:33 PM,  <vadimp@mellanox.com> wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
>
> Add kernel configuration and dts files.
>
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  arch/arm/boot/dts/Makefile                         |    3 +-
>  arch/arm/boot/dts/aspeed-bmc-mlx-flash-layout.dtsi |   32 +
>  arch/arm/boot/dts/aspeed-g5-mlx.dtsi               |  429 +++
>  arch/arm/boot/dts/mlx-ast2500-bmc.dts              |  109 +
>  arch/arm/configs/mlx_bmc_defconfig                 | 2786 ++++++++++++++++++++
>  5 files changed, 3358 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-mlx-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-g5-mlx.dtsi
>  create mode 100644 arch/arm/boot/dts/mlx-ast2500-bmc.dts
>  create mode 100644 arch/arm/configs/mlx_bmc_defconfig
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 048fbb5..2e364e6 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -895,7 +895,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-firestone.dtb \
>         aspeed-bmc-opp-garrison.dtb \
>         aspeed-bmc-opp-witherspoon.dtb \
> -       aspeed-ast2500-evb.dtb
> +       aspeed-ast2500-evb.dtb \
> +       mlx-ast2500-bmc.dtb
>  endif
>
>  dtstree                := $(srctree)/$(src)
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mlx-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-mlx-flash-layout.dtsi
> new file mode 100644
> index 0000000..1c5ae2b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-mlx-flash-layout.dtsi
> @@ -0,0 +1,32 @@
> +/* This file is the label for the bmc primary flash and its partitions */
> +                               label = "bmc";
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               u-boot {
> +                                       reg = < 0 0x60000 >;
> +                                       label = "u-boot";
> +                               };
> +                               u-boot-env {
> +                                       reg = < 0x60000 0x30000 >;
> +                                       label = "u-boot-env";
> +                               };
> +                               kernel  {
> +                                       reg = < 0x90000 0x27e000 >;
> +                                       label = "kernel";
> +                               };
> +                                dtb  {
> +                                        reg = < 0x30e000 0x2000 >;
> +                                        label = "dtb";
> +                                };
> +                               initramfs {
> +                                       reg = < 0x310000 0x1c0000 >;
> +                                       label = "initramfs";
> +                               };
> +                               rofs  {
> +                                       reg = < 0x4d0000 0x1740000 >;
> +                                       label = "rofs";
> +                               };
> +                               rwfs  {
> +                                       reg = < 0x1c10000 0x3f0000 >;
> +                                       label = "rwfs";
> +                               };

This looks like a copy of the existing layout. You don't need to
create your own.

> diff --git a/arch/arm/boot/dts/aspeed-g5-mlx.dtsi b/arch/arm/boot/dts/aspeed-g5-mlx.dtsi
> new file mode 100644
> index 0000000..0f4cce9
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-g5-mlx.dtsi
> @@ -0,0 +1,429 @@
> +#include "skeleton.dtsi"
> +
> +/ {
> +       model = "Aspeed BMC";
> +       compatible = "aspeed,ast2500";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&vic>;
> +

This looks to be a copy of the existing aspeed-g5.dtsi. You should
include that in your .dts file instead of duplicating it.

> diff --git a/arch/arm/boot/dts/mlx-ast2500-bmc.dts b/arch/arm/boot/dts/mlx-ast2500-bmc.dts
> new file mode 100644
> index 0000000..0817a67
> --- /dev/null
> +++ b/arch/arm/boot/dts/mlx-ast2500-bmc.dts
> @@ -0,0 +1,109 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include "aspeed-g5-mlx.dtsi"
> +
> +/ {
> +       model = "AST2500 EVB";

If this is the ast2500 evb, you do not need to copy the dts - you can
use the existing one.

However this looks to be different. In that case, make the model name
be that of the system.

> +       compatible = "mellanox,mlx-bmc", "aspeed,ast2500-evb", "aspeed,ast2500";

Drop the ast2500-evb compat string.

> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +        aliases {
> +                serial0 = &uart5;
> +        };

You can combine these two:


aliases {
                serial0 = &uart5;
               serial4 = &uart5;
};

However this highlights that you're creating two aliases for the same
uart. I doubt this was your intention.

> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200n8";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x20000000>;
> +       };
>

> diff --git a/arch/arm/configs/mlx_bmc_defconfig b/arch/arm/configs/mlx_bmc_defconfig
> new file mode 100644
> index 0000000..b381dc5
> --- /dev/null
> +++ b/arch/arm/configs/mlx_bmc_defconfig

Upstream do not like adding many defconfigs. We have one for the
ast2500 and one for the ast2400 series. I suggest adding options to
the aspeed_g5_defconfig.

> @@ -0,0 +1,2786 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Linux/arm 4.6.4 Kernel Configuration

This needs to be against the dev-4.7 branch.
