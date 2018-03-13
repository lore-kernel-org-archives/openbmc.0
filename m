Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pR2D43sG"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BfCYIjLo"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400jJ44y0szF09L
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 15:56:52 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id j4so21422825qth.8
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Ns6YZC+a/+Yp2hh0V3G+CinBAy56JoJLrjbu0mZyCDE=;
 b=pR2D43sGrH6TXNnYdRUZNZwxDfVllyNs4eSolyp2ZvJITMR11MFZBPyenpsxldEIxR
 zRzaEP6+uvshoKO3Kq6n/KmFXwZs1GFI0NLiRVE75nl9YtTzl1Uxr5mG8QKoLzE9lEZn
 AuSwlxdgcWEyXZyOIbwdACDrPkK7qsADtowXXnydphDEzQe0wrc/KTBjTckwVy5Qunfo
 vEu2Yx2yEEh4A6yltJK7hApVdfepxdIiLJBzZjlJKWg4BZgNVrRO3PhI0hHyZxbHDyj4
 AJv9Yj+Z9LFgV/5kvKsV/8ueUy1qdIM3cH7rfqa58SBTRGISBB5KTtWnUP1c5bPRWNnB
 stLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Ns6YZC+a/+Yp2hh0V3G+CinBAy56JoJLrjbu0mZyCDE=;
 b=BfCYIjLo1B1tUNYYhdebBnz3qmTQc2jTU2+fTPXXUzAY1IFVVV9UkYAH6RFmOxCqXv
 pcqCqZOmIx3DDB48sVGD1k20xIIqkRRWMfXVch3vODfSNmPQBtEPDq6JXX/pf+7i33Xu
 xtMJcIOw4NGO3e0W8CgGTPhLMpaB/GELP70UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Ns6YZC+a/+Yp2hh0V3G+CinBAy56JoJLrjbu0mZyCDE=;
 b=c9OpaFhVgq9ClCOJSuV/XiOPGfKBe2pHIxCPbtnpLAMYD2+tr2b5S8NLwEKrsFlV8G
 jsO7GaOoXcoOSHMTfIKwuv/uc+UjxfIvjI5FpasIwO0BDzomBWfvZYWlxWaCar3SKexe
 Beca4XTzGKxsfy3KllxT6Qwsd4BAOmjjwOu5eOzeesFfdw+3SqKy1FVk+Z2ejQZocKfw
 O31QCmMKiFbG7YI5FwPWElDDDpjlzSjdCoJZ7hDuZx6x7i3BZqF7Vzu7K7dpR3PQAIQs
 Flx/oXtnIittROFJ+DGEJZYP2PJYPPvm+CpGAL4LnlroKsCdZucfyV8aJ3GHSc68q+o4
 SRBQ==
X-Gm-Message-State: AElRT7Fc0hkNzYnRdUBLOZO8AGUPkbGiINk5yZ7tv8+gkGphT0Sf1PoE
 ExMmRt4PnjzzwrxuP46nclLtMmpL39VgQ4m6VjU=
X-Google-Smtp-Source: AG47ELuDbvkvY+SnYflq+NXNMTuCYXKDYsrlKcDFWXVrduQIYw0f4rXEIRjum18gCgck0dcCV9aY2MqrC9rz5AOzjgU=
X-Received: by 10.237.59.49 with SMTP id p46mr4563899qte.84.1520917009364;
 Mon, 12 Mar 2018 21:56:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Mar 2018 21:56:29 -0700 (PDT)
In-Reply-To: <20180309012156.2997915-1-amithash@fb.com>
References: <20180309012156.2997915-1-amithash@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Mar 2018 15:26:29 +1030
X-Google-Sender-Auth: vgVKx0AEsQ0mqXh8tA3m3WzQYn4
Message-ID: <CACPK8XcO3LTE+R1NjV9yvrWsYis0u-RVfYxJ3dDdFNRRoYb3Hg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune
 machine
To: Amithash Prasad <amithash@fb.com>, Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 13 Mar 2018 04:56:53 -0000

On Fri, Mar 9, 2018 at 11:51 AM, Amithash Prasad <amithash@fb.com> wrote:
> Initial introduction of Portwell Neptune family equipped with
> Aspeed 2500 BMC SoC. This adds the neptune platform device tree
> file including the flash layout used by the neptune machines.

I like to have a sentence about the machine it's in. Something like:

Neptune is a x86 server development kit with a ASPEED ast2500 BMC
manufactured by Portwell.

Or whatever you think sounds good :)

The device tree looks good; I've made a few comments below and I've
cc'd Andrew to get a review of the pinctrl parts.

>
> Signed-off-by: Amithash Prasad <amithash@fb.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  | 145 +++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 84601d8..9dbbe7d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -228,6 +228,7 @@ pine64      Pine64
>  pixcir  PIXCIR MICROELECTRONICS Co., Ltd
>  plathome       Plat'Home Co., Ltd.
>  plda   PLDA
> +portwell       Portwell Inc.
>  powervr        PowerVR (deprecated, use img)
>  pulsedlight    PulsedLight, Inc
>  qca    Qualcomm Atheros, Inc.
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c54fc8..044b960 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-mellanox-msn.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
>         aspeed-bmc-intel-s2600wf.dtb \
> +       aspeed-bmc-portwell-neptune.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> new file mode 100644
> index 0000000..542a4cad
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Portwell Neptune BMC";
> +       compatible = "portwell,neptune-bmc", "aspeed,ast2500";
> +       aliases {
> +               serial0 = &uart1;
> +               serial4 = &uart5;
> +       };
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               postcode0 {
> +                       label="BMC_UP";
> +                       gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> +                       default-state = "on";
> +               };
> +               postcode1 {
> +                       label="BMC_HB";
> +                       gpios = <&gpio ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +               postcode2 {
> +                       label="FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> +               };
> +               // postcode3-7 are GPIOH3-H7
> +       };
> +};
> +
> +&wdt2 {
> +       status = "okay";
> +};

We can drop this; the upstream dts now enables wdt1 and wdt2 by default.

> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
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
> +               m25p,fast-read;
> +               label = "pnor";
> +       };
> +};
> +
> +&uart1 {
> +       // Host Console
> +       status = "okay";

I think you need the pinctrl nodes for this. Andrew J can provide more detail.

> +};
> +
> +&uart5 {
> +       // BMC Console
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       use-ncsi;
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +       // SMBus to COMe AB
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +       // I2C to COMe AB
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +       pca9555@4e {
> +               compatible = "nxp,pca9555";
> +               pinctrl-names = "default";
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               reg = <0x27>;
> +       };
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +       tpm@20 {
> +               compatible = "infineon,slb9645tt";
> +               reg = <0x20>;
> +       };
> +       tmp421@9c {
> +               compatible = "ti,tmp421";
> +               reg = <0x4e>;
> +       };
> +       tmp421@9e {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +       eeprom@a2 {
> +               compatible = "atmel,24c128";
> +               reg = <0x51>;
> +               pagesize = <0x32>;
> +       };
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +};
> --
> 2.9.5
>
