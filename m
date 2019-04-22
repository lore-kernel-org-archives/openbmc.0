Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kZnSF2EF"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44npn86cDjzDqKZ
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 00:27:07 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w24so5913458plp.2
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=05okgDN8ySj8a1IIE9T6DMor1+vCafFH0B3eOmsHrrk=;
 b=kZnSF2EFIQFyblIWIc1rDZqtP2ElikwONHxnFKLBg1MMx2srUg/qWG4C0D+UY41Z9K
 t3lZLoT7WGhYPoH+Sl81lpjoREj8j8cEAc+3LNC7YjrXGJHv8KWdmX8ntRSo3Id4VzQw
 1cXoTyp5bnY5Iq9TEsoHBxJyIkR4Aj4bkkITAYp4+OU2ctHZjf3bKTJ5eQyHGMu/OAwq
 SsWz0a/ZMyfsI0pF4xwxb6uNf+vTdchQZS/Xxdp01XjOBtpw7JcDNAju2lFneKR337W+
 h+IlHfNuJlxqDaDS6VCY6AO2oB2OPUO7/d0HRLmFR6w+F1OoqXRaTC/9mw2Utb76N+Jm
 NxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=05okgDN8ySj8a1IIE9T6DMor1+vCafFH0B3eOmsHrrk=;
 b=Mer6UgladOvVEFJJSJGCNQ44fu0spouzrj/LTZ5jo2XLmC4lKwXmtDQJQ/xuJdSE9L
 N+xDMokQHNVoVjbUVq4arfdJMR/ICtn/sjVEjn4V/vtfEQqoHkRnvAVDMpcz06RZypw6
 EJBotKvo2uwTtx0zUEpyuMgnjG4rvOPyZ+qkaIastQDY6neECKQ8XjC/JV1BcUzXM/QU
 7WhvbIos7ESbHgN/IUHLRMXGhcuoqjrx9RxDi+EV2j94AziSHObQPn2gLoedfGLxcPSa
 k9V1l3aUxb3peIYshf2fMEdumDHCKJWqJ/qkkKYrfoGLp7hIZCyEwm4UWuQHWajImRTv
 olAQ==
X-Gm-Message-State: APjAAAUlQLpkcLM1ov4fteNrxvpVhcUONtS45tl98b2oOjps/Ji3lax2
 /3ryZXS5DWldklMnTXMCLrsX761aEqE5O1v8GGHetw==
X-Google-Smtp-Source: APXvYqysv9wWFon4HQFWJV2n0ptTqgLQ1zGbYYEyViWwG0YGJsNVW9PbTdigv06Y6qciY3MwcgEfdDjsWVJ4c51zihE=
X-Received: by 2002:a17:902:864b:: with SMTP id
 y11mr19428386plt.1.1555943223911; 
 Mon, 22 Apr 2019 07:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <1555673614-419143-1-git-send-email-pengms1@lenovo.com>
 <CAO=notwjxxaReMN4bwS87C8om2RkkAy0=y44D+LCX04BuZHDdQ@mail.gmail.com>
 <264283F7338E734E863366C752FEABBC41810E93@CNMAILEX01.lenovo.com>
In-Reply-To: <264283F7338E734E863366C752FEABBC41810E93@CNMAILEX01.lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 22 Apr 2019 07:26:52 -0700
Message-ID: <CAO=noty5Qhj0eJpGaaenE80yRBwYyoZogXz_1MhaGapvQwk5qQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH linux dev-5.0] [PATCH v1] ARM: dts: aspeed:
 Adding Lenovo Hr630 BMC
To: Andrew MS1 Peng <pengms1@lenovo.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, Harry Sung1 <hsung1@lenovo.com>, 
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>,
 Duke KH Du <dukh@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2019 14:27:09 -0000

On Sun, Apr 21, 2019 at 8:19 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Patrick,
>
> I have added my comments as below, please help to check it. If there are =
no any problems, I will revise it and send the new patch to you for review.=
 Thanks.
>
> The SPDX header means you don't need the "Licensed under..." detail.
> Also, instead of ? from a special character you can just use "(c)"
>
>         I will remove the "Licensed under...", could I add below comments=
 in DT file?
>         /*
>         * Device Tree file for Lenovo Hr630 platform
>         *
>         * Copyright (C) 2019-present Lenovo
>         */
>
> Why the commented out eeprom?
>
>         Currently, we don't use it, so I will remove the unused eeprom de=
vice from DT file.
>
> I would recommend setting aliases at the top to lock the naming in place.
>
>         I will add the aliases for i2c-switch devices.
>
>
> Regards,
> Andrew Peng

That'll work.

>
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B44=E6=9C=8820=E6=97=A5 =
3:34
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> =E6=8A=84=E9=80=81: Joel Stanley <joel@jms.id.au>; OpenBMC Maillist <open=
bmc@lists.ozlabs.org>; Benjamin Fair <benjaminfair@google.com>; Harry Sung1=
 <hsung1@lenovo.com>; Yonghui YH21 Liu <liuyh21@lenovo.com>; Lisa YJ19 Liu =
<liuyj19@lenovo.com>; Duke KH Du <dukh@lenovo.com>
> =E4=B8=BB=E9=A2=98: [External] Re: [PATCH linux dev-5.0] [PATCH v1] ARM: =
dts: aspeed: Adding Lenovo Hr630 BMC
>
> On Fri, Apr 19, 2019 at 4:34 AM Andrew Peng <pengms1@lenovo.com> wrote:
> >
> > Initial introduction of Lenovo Hr630 family equipped with Aspeed 2500
> > BMC SoC. Hr630 is a x86 server development kit with a ASPEED ast2500
> > BMC manufactured by Lenovo.
> > Specifically, This adds the Hr630 platform device tree file used by
> > the Hr630 BMC machines.
> >
> > This also adds an entry of Hr630 device tree file in Makefile
> >
> > Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> > Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> > Signed-off-by: Lisa Liu <liuyj19@lenovo.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |   3 +-
> >  arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts | 884
> > ++++++++++++++++++++++++++
> >  2 files changed, 886 insertions(+), 1 deletion(-)  create mode 100644
> > arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index bd40148..b5d32a0 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >         aspeed-bmc-opp-witherspoon.dtb \
> >         aspeed-bmc-opp-zaius.dtb \
> >         aspeed-bmc-portwell-neptune.dtb \
> > -       aspeed-bmc-quanta-q71l.dtb
> > +       aspeed-bmc-quanta-q71l.dtb \
> > +       aspeed-bmc-lenovo-hr630.dtb
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > new file mode 100644
> > index 0000000..ca80509
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > @@ -0,0 +1,884 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//"Copyright ? 2019-present Lenovo
> > +//Licensed under GPL v2, see COPYING file for details."
>
> The SPDX header means you don't need the "Licensed under..." detail.
>
> Also, instead of ? from a special character you can just use "(c)"
>
> > +
> > +
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +       model =3D "HR630 BMC";
> > +       compatible =3D "lenovo,hr630-bmc", "aspeed,ast2500";
> > +
> > +       chosen {
> > +               stdout-path =3D &uart5;
> > +               bootargs =3D "console=3Dtty0 console=3DttyS4,115200 ear=
lyprintk";
> > +       };
> > +
> > +       memory@80000000 {
> > +               device_type =3D "memory";
> > +               reg =3D <0x80000000 0x20000000>;
> > +       };
> > +
> > +       reserved-memory {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               ranges;
> > +
> > +               flash_memory: region@98000000 {
> > +                       no-map;
> > +                       reg =3D <0x98000000 0x00100000>; /* 1M */
> > +               };
> > +
> > +               gfx_memory: framebuffer {
> > +                       size =3D <0x01000000>;
> > +                       alignment =3D <0x01000000>;
> > +                       compatible =3D "shared-dma-pool";
> > +                       reusable;
> > +               };
> > +       };
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> > +
> > +               heartbeat {
> > +                       gpios =3D <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_=
LOW>;
> > +               };
> > +
> > +               fault {
> > +                       gpios =3D <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_=
LOW>;
> > +               };
> > +       };
> > +
> > +       iio-hwmon {
> > +               compatible =3D "iio-hwmon";
> > +               io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> > +               <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> > +               <&adc 8>, <&adc 9>, <&adc 10>,
> > +               <&adc 12>, <&adc 13>, <&adc 14>;
> > +       };
> > +
> > +};
> > +
> > +&fmc {
> > +       status =3D "okay";
> > +       flash@0 {
> > +               status =3D "okay";
> > +               m25p,fast-read;
> > +               label =3D "bmc";
> > +               spi-max-frequency =3D <50000000>; #include
> > +"openbmc-flash-layout.dtsi"
> > +       };
> > +};
> > +
> > +&lpc_ctrl {
> > +       status =3D "okay";
> > +       memory-region =3D <&flash_memory>;
> > +       flash =3D <&spi1>;
> > +};
> > +
> > +&uart1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart2 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart3 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart5 {
> > +       status =3D "okay";
> > +};
> > +
> > +&vuart {
> > +       status =3D "okay";
> > +};
> > +
> > +&ibt {
> > +       status =3D "okay";
> > +};
> > +
> > +&mac0 {
> > +       status =3D "okay";
> > +
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_rmii1_default>;
> > +       use-ncsi;
> > +};
> > +
> > +&mac1 {
> > +       status =3D "okay";
> > +
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> > +};
> > +
> > +&adc {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +       status =3D "okay";
> > +       /* temp1 inlet */
> > +       tmp75@4e {
> > +               compatible =3D "national,lm75";
> > +               reg =3D <0x4e>;
> > +       };
> > +};
> > +
> > +&i2c1 {
> > +       status =3D "okay";
> > +       /* temp2 outlet */
> > +       tmp75@4d {
> > +               compatible =3D "national,lm75";
> > +               reg =3D <0x4d>;
> > +       };
> > +};
> > +
> > +&i2c2 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c3 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c4 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c5 {
> > +       status =3D "okay";
> > +       /*
> > +        *eeprom@50 {
> > +        *      compatible =3D "atmel,24c08";
> > +        *      reg =3D <0x50>;
> > +        *      pagesize =3D <16>;
> > +        *};
> > +        */
>
> Why the commented out eeprom?
>
> > +};
> > +
> > +&i2c6 {
> > +       status =3D "okay";
> > +       /*      Slot 0,
> > +        *      Slot 1,
> > +        *      Slot 2,
> > +        *      Slot 3
> > +        */
> > +
> > +       i2c-switch@70 {
> > +               compatible =3D "nxp,pca9545";
> > +               reg =3D <0x70>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +               i2c-mux-idle-disconnect;        /* may use mux@70 next.=
 */
> > +
> > +               i2c_rbp: i2c@0 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <0>;
> > +               };
> > +
> > +               i2c_fbp1: i2c@1 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <1>;
> > +               };
> > +
> > +               i2c_fbp2: i2c@2 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <2>;
> > +               };
> > +
> > +               i2c_fbp3: i2c@3 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <3>;
> > +               };
>
> I would recommend setting aliases at the top to lock the naming in place.
>
> > +       };
> > +};
> > +
> > +&i2c7 {
> > +       status =3D "okay";
> > +
> > +       /*      Slot 0,
> > +        *      Slot 1,
> > +        *      Slot 2,
> > +        *      Slot 3
> > +        */
> > +       i2c-switch@76 {
> > +               compatible =3D "nxp,pca9546";
> > +               reg =3D <0x76>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +               i2c-mux-idle-disconnect;  /* may use mux@76 next. */
> > +
> > +               i2c_riser2: i2c@0 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <0>;
> > +               };
> > +
> > +               i2c_pcie4: i2c@1 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <1>;
> > +               };
> > +
> > +               i2c_riser1: i2c@2 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <2>;
> > +               };
> > +
> > +               i2c_ocp: i2c@3 {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       reg =3D <3>;
> > +               };
> > +       };
> > +};
> > +
> > +&i2c8 {
> > +       status =3D "okay";
> > +
> > +       eeprom@57 {
> > +               compatible =3D "atmel,24c256";
> > +               reg =3D <0x57>;
> > +               pagesize =3D <16>;
> > +       };
> > +};
> > +
> > +&i2c9 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c10 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c11 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c12 {
> > +       status =3D "okay";
> > +};
> > +
> > +/*
> > + * Enable port A as device (via the virtual hub) and port B as
> > + * host by default on the eval board. This can be easily changed
> > + * by replacing the override below with &ehci0 { ... } to enable
> > + * host on both ports.
> > + */
> > +&vhub {
> > +       status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uhci {
> > +       status =3D "okay";
> > +};
> > +
> > +&gfx {
> > +       status =3D "okay";
> > +       memory-region =3D <&gfx_memory>; };
> > +
> > +&pwm_tacho {
> > +       status =3D "okay";
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_pwm0_default
> > +       &pinctrl_pwm1_default
> > +       &pinctrl_pwm2_default
> > +       &pinctrl_pwm3_default
> > +       &pinctrl_pwm4_default
> > +       &pinctrl_pwm5_default
> > +       &pinctrl_pwm6_default>;
> > +
> > +       fan@0 {
> > +               reg =3D <0x00>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> > +       };
> > +
> > +       fan@1 {
> > +               reg =3D <0x00>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
> > +       };
> > +
> > +       fan@2 {
> > +               reg =3D <0x01>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
> > +       };
> > +
> > +       fan@3 {
> > +               reg =3D <0x01>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
> > +       };
> > +
> > +       fan@4 {
> > +               reg =3D <0x02>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x04>;
> > +       };
> > +
> > +       fan@5 {
> > +               reg =3D <0x02>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x05>;
> > +       };
> > +
> > +       fan@6 {
> > +               reg =3D <0x03>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x06>;
> > +       };
> > +
> > +       fan@7 {
> > +               reg =3D <0x03>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x07>;
> > +       };
> > +
> > +       fan@8 {
> > +               reg =3D <0x04>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x08>;
> > +       };
> > +
> > +       fan@9 {
> > +               reg =3D <0x04>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x09>;
> > +       };
> > +
> > +       fan@10 {
> > +               reg =3D <0x05>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x0a>;
> > +       };
> > +
> > +       fan@11 {
> > +               reg =3D <0x05>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x0b>;
> > +       };
> > +
> > +       fan@12 {
> > +               reg =3D <0x06>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x0c>;
> > +       };
> > +
> > +       fan@13 {
> > +               reg =3D <0x06>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x0d>;
> > +       };
> > +};
> > +
> > +&gpio {
> > +
> > +       pin_gpio_a0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "MAC1_INT_N";
> > +       };
> > +
> > +       pin_gpio_a1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "MEZZ_C_PRESENT_N";
> > +       };
> > +
> > +       pin_gpio_a2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(A, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU1_PRST";
> > +       };
> > +
> > +       pin_gpio_a3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU2_PRST";
> > +       };
> > +
> > +       pin_gpio_b5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "IRQ_BMC_PCH_SMI_LPC_N";
> > +       };
> > +
> > +       pin_gpio_f0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name =3D "IRQ_BMC_PCH_NMI_R";
> > +       };
> > +
> > +       pin_gpio_f1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_CPU1_DISABLE_COD_N";
> > +       };
> > +
> > +       pin_gpio_f2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "SMB_LAN_ALERT_N_MEZZ";
> > +       };
> > +
> > +       pin_gpio_f3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "I2C_BUS0_RST_OUT_N";
> > +       };
> > +
> > +       pin_gpio_f4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name =3D "FM_SKT0_FAULT_LED";
> > +       };
> > +
> > +       pin_gpio_f5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name =3D "FM_SKT1_FAULT_LED";
> > +       };
> > +
> > +       pin_gpio_f6 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 6) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "IRQ_BMC_CPLD_NMI";
> > +       };
> > +
> > +       pin_gpio_f7 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU2_ALERT_N";
> > +       };
> > +
> > +       pin_gpio_g0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 0) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_CPU_ERR2_LVT3_N";
> > +       };
> > +
> > +       pin_gpio_g1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_CPU_MSMI_CATERR_LVT3_N";
> > +       };
> > +
> > +       pin_gpio_g2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_PCH_BMC_THERMTRIP_N";
> > +       };
> > +
> > +       pin_gpio_g3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "BMC_I2C_BUS7_INT_N";
> > +       };
> > +
> > +       pin_gpio_g4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "FAN_PWR_CTL_N";
> > +       };
> > +
> > +       pin_gpio_g5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "NFC_FD_N";
> > +       };
> > +
> > +       pin_gpio_g6 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "IRQ_NMI_EVENT_N";
> > +       };
> > +
> > +       pin_gpio_g7 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "RST_BMC_PCIE_I2CMUX_N";
> > +       };
> > +
> > +       pin_gpio_h0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU1_EPOW_N_R";
> > +       };
> > +
> > +       pin_gpio_h1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU2_EPOW_N_R";
> > +       };
> > +
> > +       pin_gpio_h2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "PSU1_FFS_N_R";
> > +       };
> > +
> > +       pin_gpio_h3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "PSU2_FFS_N_R";
> > +       };
> > +
> > +       pin_gpio_h4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU1_THROTTLE_N_R";
> > +       };
> > +
> > +       pin_gpio_h5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU2_THROTTLE_N_R";
> > +       };
> > +
> > +       pin_gpio_h6 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU1_SMB_RESET_N";
> > +       };
> > +
> > +       pin_gpio_h7 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU2_SMB_RESET_N";
> > +       };
> > +
> > +       pin_gpio_i1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(I, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FP_PWR_BTN_N";
> > +       };
> > +
> > +       pin_gpio_i2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(I, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "BIOS_RCVR_N";
> > +       };
> > +
> > +       pin_gpio_i3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "BMC_INTRUDED_COVER";
> > +       };
> > +
> > +       pin_gpio_j2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "BMC_BIOS_UPDATE_N";
> > +       };
> > +
> > +       pin_gpio_j3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(J, 3) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "RST_BMC_HDD_I2CMUX_N";
> > +       };
> > +
> > +       pin_gpio_q4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "MEZZ_A_PRESENT_N";
> > +       };
> > +
> > +       pin_gpio_q5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "VGA_FRONT_PRES_N";
> > +       };
> > +
> > +       pin_gpio_q6 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Q, 6) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "I2C_RISER1_INT_N";
> > +       };
> > +
> > +       pin_gpio_q7 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "NCSI_CABLE_DET_N";
> > +       };
> > +
> > +       pin_gpio_r0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FP_RST_BTN_N";
> > +       };
> > +
> > +       pin_gpio_r2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "HDDSIG1_DETECT_N";
> > +       };
> > +
> > +       pin_gpio_r3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "HDDSIG2_DETECT_N";
> > +       };
> > +
> > +       pin_gpio_r4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "HDDSIG3_DETECT_N";
> > +       };
> > +
> > +       pin_gpio_r5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "VIDEO_CABLE_DETECT_N";
> > +       };
> > +
> > +       pin_gpio_s0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "BMC_PS_RAPIDON_WAKE_R_N";
> > +       };
> > +
> > +       pin_gpio_s1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "HOST_TPM_PP_BUF";
> > +       };
> > +
> > +       pin_gpio_s2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "BMC_VGA_SW";
> > +       };
> > +
> > +       pin_gpio_s3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "IRQ_SML0_ALERT_MUX_N";
> > +       };
> > +
> > +       pin_gpio_s4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 4) GPIO_ACTIVE_HIGH>;
> > +               output;
> > +               line-name =3D "VBAT_EN_N";
> > +       };
> > +
> > +       pin_gpio_s5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "BMC_HW_STRAP_4";
> > +       };
> > +
> > +       pin_gpio_s6 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "PU_BMC_GPIOS6";
> > +       };
> > +
> > +       pin_gpio_s7 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "I2C_BUS7_RESET_N";
> > +       };
> > +
> > +       pin_gpio_y0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Y, 0) GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name =3D "BMC_NCSI_MUX_CTL_S0";
> > +       };
> > +
> > +       pin_gpio_y1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Y, 1) GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name =3D "BMC_NCSI_MUX_CTL_S1";
> > +       };
> > +
> > +       pin_gpio_y2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "UID_ALERT_N";
> > +       };
> > +
> > +       pin_gpio_z0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Z, 0) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "I2C_RISER2_INT_N";
> > +       };
> > +
> > +       pin_gpio_z2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "I2C_RISER2_RESET_N";
> > +       };
> > +
> > +       pin_gpio_z3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "FM_BMC_PCH_SCI_LPC_N";
> > +       };
> > +
> > +       pin_gpio_z4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "BMC_HW_STRAP_17";
> > +       };
> > +
> > +       pin_gpio_z6 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Z, 6) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "BMC_HW_STRAP_20";
> > +       };
> > +
> > +       pin_gpio_z7 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(Z, 7) GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name =3D "BMC_POST_CMPLT_N";
> > +       };
> > +
> > +       pin_gpio_aa0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +               line-name =3D "HOST_BMC_USB_SEL";
> > +       };
> > +
> > +       pin_gpio_aa1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "PSU1_ALERT_N";
> > +       };
> > +
> > +       pin_gpio_aa2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_PVCCIN_CPU0_PWR_IN_ALERT_N";
> > +       };
> > +
> > +       pin_gpio_aa3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 3) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_PVCCIN_CPU1_PWR_IN_ALERT_N";
> > +       };
> > +
> > +       pin_gpio_aa4 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 4) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "USB_CABLE_DETECT_N";
> > +       };
> > +
> > +       pin_gpio_aa5 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 5) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "I2C_BUS1_RST_OUT_N";
> > +       };
> > +
> > +       pin_gpio_aa6 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "IRQ_SMI_ACTIVE_N";
> > +       };
> > +
> > +       pin_gpio_aa7 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_BIOS_POST_CMPLT_N";
> > +       };
> > +
> > +       pin_gpio_ab0 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FM_TPM_MOD_PRES_N";
> > +       };
> > +
> > +       pin_gpio_ab1 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AB, 1) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "FORCE_NMI_SW_FPGA_N";
> > +       };
> > +
> > +       pin_gpio_ab2 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AB, 2) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "1U_2U_PCBA_SEL_R";
> > +       };
> > +
> > +       pin_gpio_ab3 {
> > +               gpio-hog;
> > +               gpios =3D <ASPEED_GPIO(AB, 3) GPIO_ACTIVE_HIGH>;
> > +               input;
> > +               line-name =3D "INTRUDED_PRES_N";
> > +       };
> > +};
> > --
> > 2.7.4
> >
