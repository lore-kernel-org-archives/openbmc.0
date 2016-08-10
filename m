Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8HTQ0VgDzDqhH
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 13:59:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=soWv9zWS; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id u13so2634065uau.0
 for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2016 20:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=R/nERKz6i/GEUh09343G01LZN3jtVBjx/g9LCJVSLSc=;
 b=soWv9zWSsyiE33AY9FdAznQ9QPHOgJ3wdQs+WBIIf8xTbyg7cxrblIzLNdLHLpVS0I
 DKGmS8zVB6xK/xa72R2IDQCJol2HXQHMdeO91zjzC62RsVxunqTFJ6h7ym254J/HUWr8
 gJ2E39U5TrasDTPqaeNIInAr6RRQyMMaI1WUJBkWuVLtj70gt1FkQ6ZjWYAu2/CqBkEP
 dDrSskQplFAqZM+H9HZtEirifWxYyAo0+/2Aa7bxQA2lUA8fLh86swxHlEKTqhetK5kv
 L8HRFK4ZbL+jMmYHWBDmQpQh0NbEreFJL+sRRMGpBPksnl5WiQupvp1Y1yG2CcgnNRnw
 JP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=R/nERKz6i/GEUh09343G01LZN3jtVBjx/g9LCJVSLSc=;
 b=Aw5g/w+d707rnLB8fN7WCyG0KbSQIJ50VBbP3MW2l+RBD+8HGMKZ/DTWkaO22B4yge
 Kg+AnRSMNAVmzatqVAzv8ub4930vSfuJLPGtuh8TW/7gzWOKGYkbsPhAqu/NEvoHKwbM
 LjLMnmIm+fIbOitPc+OZDrMSv8CSp48df9rnQy0X2NvlMfkRdKme2GufY+p6o8G6zWI7
 YB0Mg7icJuZrWEJ8fepb6yci1vftRh59ts+ASxksisOOR2uIE1KRmmJhxONl0xTqR7lH
 oI23ojpX/4j9SVXtqJV+DO2ZJoJUzC4MT9rCRgP/JXfZ/BvSaXzuMNhhPtm1VxsPKUdH
 6nHg==
X-Gm-Message-State: AEkooutsATCsyKNK67SONfvNco4kdToVHA9MyGovyQgyqMdDfsK+HrA+LKGc8uHq6FXCp0pecN7hKibtbn7d5w==
X-Received: by 10.31.78.6 with SMTP id c6mr861363vkb.41.1470801559569; Tue, 09
 Aug 2016 20:59:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 9 Aug 2016 20:58:59 -0700 (PDT)
In-Reply-To: <1470798121-725657-1-git-send-email-mattconolly@fb.com>
References: <1470798121-725657-1-git-send-email-mattconolly@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Aug 2016 13:28:59 +0930
X-Google-Sender-Auth: Qg_U0C6L55Pm4jLNN0tkxrGsLzU
Message-ID: <CACPK8Xc_031yUC35Vzpf5-iVdyvEdGaS76j7GRCJrqm1Ybrb5A@mail.gmail.com>
Subject: Re: [PATCH v2] arm/dts/aspeed: Add minimal Facebook CMM BMC board
 based on AST2500
To: Matthew Conolly <mattconolly@fb.com>, Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Wed, 10 Aug 2016 03:59:23 -0000

On Wed, Aug 10, 2016 at 12:32 PM, Matthew Conolly <mattconolly@fb.com> wrote:
> Minimal device tree for CMM bmc board to boot into a console over UART with some drivers functional.

Nice. There are a few updates you will need for 4.7.

>
> Signed-off-by: Matthew Conolly <mattconolly@fb.com>
> ---
>
> Rebased patch on the openbmc github dev-4.7 branch
>
> v2:
> Removed commented out eeprom
> Removed of_machine_is_compatible for LPC/UART config
> checkpatch whitespace fixup
>
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi  |  24 +++++
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts      | 104 +++++++++++++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 048fbb5..495ca3d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -895,6 +895,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-firestone.dtb \
>         aspeed-bmc-opp-garrison.dtb \
>         aspeed-bmc-opp-witherspoon.dtb \
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
> index 0000000..dcfa303
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -0,0 +1,104 @@
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

The compatible string is now aspeed,ast2400-fmc.

> +                       flash@0 {
> +                               reg = < 0 >;
> +                               compatible = "jedec,spi-nor" ;
> +#include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
> +                       };
> +               };
> +       };
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};

We might need some kind of pinmux configuration for uart1. Andrew?

> +
> +&mac0 {
> +       status = "disabled";
> +};

Everything defaults to disabled, so you should be able to omit this.

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
> --
> 2.8.0.rc2
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
