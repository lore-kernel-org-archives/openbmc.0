Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s76W84ZnkzDqS5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 16:11:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=qPOwbAZs; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id d97so1915996uad.1
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 23:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0xnU7j+WKaizfvPcUgIsD00zM3PT2bmVOvKdt2sc85o=;
 b=qPOwbAZsA5PjZnRUUPkD+9iWFEgtq7uOOvG2guxob7+TK0m6iJfud0zoxQoU6e1CeD
 uvlIZhNS3cU2mzoXe+B+WKY5prnMHKUeE9Je1GtNcvuOTv6MQB4zpFWa13ij1zO1A7Ux
 IwYfZstTCJvx0efMPeJFcm1kmJusK9zuHpd0tcYTx2uODJI7+OiKxdgIPRK9s8WQ3sG+
 zk290g+XLBxCe8yOOgDup4Qc1UJ2NUVpN8JeNtzGuXNSAiy++IJa9mkKwwbG9MIPo3WQ
 zD7uCPAiFUW95OwKAcwow2gP2/V4CMCHaw6wGXLkXDt7AovzENefAyvepK2o4Hb944+s
 dS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0xnU7j+WKaizfvPcUgIsD00zM3PT2bmVOvKdt2sc85o=;
 b=dAnz4vCSJy8Db2e/aAEAnDolsHYxIAYEuOjD20UQlsPMsoQiCUVN2KP022AA2t/CoR
 sNz2VEcRVA/X1bFzdkExQ93QPXRwSR4kSgNmzmxoOFhNLKdBfRgdaRlmO9LRI3Kdev/p
 6gAccggh4dRMb1dFYGyaVe3+72XjOfo67hgh0hjqd4qpOo1hYdEFXlm38rcRswSaA5CW
 8J0fJv1yuwVLBZKozWJz5Yb6OeJe899gyrnywo9c2wkZE0eDZUhDGX751JSmDHXJ3XaM
 8p2/02fvi6EyQgWSUzpaD54wpGKiUVNDfOPpIo0GXG6mYHBbKvVZyz2yRUth+6cEYP1W
 zmPA==
X-Gm-Message-State: AEkoousPcYhU06n7OrEbQCADwI09Yj0w90dmjZQvEeabeKwOiALoFe0nuXsER0JplsUwRKk3sYOsGq1ooHn3EQ==
X-Received: by 10.31.141.21 with SMTP id p21mr47958693vkd.152.1470636706616;
 Sun, 07 Aug 2016 23:11:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 7 Aug 2016 23:11:25 -0700 (PDT)
In-Reply-To: <1470265651-3679131-1-git-send-email-mattconolly@fb.com>
References: <1470265651-3679131-1-git-send-email-mattconolly@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Aug 2016 15:41:25 +0930
X-Google-Sender-Auth: FdmXNgzsaeNln5EE6ZjxzGexRME
Message-ID: <CACPK8XeYz1GUo_iuBbDo=WWWVAcLeH2z5TXsNTpQf9KsE-sUzg@mail.gmail.com>
Subject: Re: [PATCH] arm/dts/aspeed: Add minimal Facebook CMM BMC board based
 on AST2500
To: Matthew Conolly <mattconolly@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 08 Aug 2016 06:11:49 -0000

Hey Matthew,

On Thu, Aug 4, 2016 at 8:37 AM, Matthew Conolly <mattconolly@fb.com> wrote:
> A minimal device tree to let the CMM bmc board boot to a console over UART with some drivers functional

Thanks for the patch. It's good to see other boards being added to the tree.

Which git tree is this patch against?

>
> Signed-off-by: Matthew Conolly <mattconolly@fb.com>
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi  |  24 +++++
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      | 112 +++++++++++++++++++++
>  arch/arm/mach-aspeed/aspeed.c                      |   5 +-
>  4 files changed, 140 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 3c27d57..21fe59b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -843,6 +843,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-barreleye.dtb \
>         aspeed-bmc-opp-firestone.dtb \
>         aspeed-bmc-opp-garrison.dtb \
> +       aspeed-bmc-facebook-cmm.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
> new file mode 100644
> index 0000000..1b3133f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
> @@ -0,0 +1,24 @@
> +/* This file is the label for the bmc primary flash and its partitions */
> +                               label = "bmc";
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               u-boot {
> +                                       reg = < 0 0x80000 >;
> +                                       label = "u-boot";
> +                               };
> +                               u-boot-env {
> +                                       reg = < 0x60000 0x20000 >;
> +                                       label = "u-boot-env";
> +                               };
> +                               kernel  {
> +                                       reg = < 0x80000 0x280000 >;
> +                                       label = "kernel";
> +                               };
> +                               initramfs {
> +                                       reg = < 0x300000 0x300000 >;
> +                                       label = "initramfs";
> +                               };
> +                               pd_rootfs  {
> +                                       reg = < 0x4c0000 0x1740000 >;
> +                                       label = "pd_rootfs";
> +                               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> new file mode 100644
> index 0000000..4ea8e7e
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -0,0 +1,112 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "FACEBOOK CMM BMC";
> +       compatible = "facebook,cmm-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial1 = &uart1;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart1;
> +               bootargs = "console=ttyS1,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x3f000000>;
> +       };
> +
> +       ahb {
> +               bmc_pnor: fmc@1e620000 {
> +                       reg = < 0x1e620000 0x94
> +                               0x20000000 0x02000000 >;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "aspeed,fmc";
> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +#include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
> +                       };
> +               };
> +  };
> +
> +
> +
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "disabled";
> +};
> +
> +&mac1 {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +
> +//     eeprom@50 {
> +//             compatible = "atmel,24c08";
> +//             reg = <0xa0>;
> +//     };

This should be deleted instead of commented out.

> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index db540ac..da03fed 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -202,8 +202,9 @@ static void __init do_ast2500evb_setup(void)
>
>  static void __init aspeed_init_early(void)
>  {
> -       // XXX UART stuff to fix to pinmux & co
> -       writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));
> +       if (!of_machine_is_compatible("facebook,cmm-bmc"))
> +               /* XXX UART stuff to fix to pinmux & co */
> +               writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));

Fair enough. This highlights the need for a driver to configure the LPC.

Cheers,

Joel
