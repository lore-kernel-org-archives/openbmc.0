Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mOsOtRg+"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yb2XW0gJYzDqbd
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 18:37:14 +1100 (AEDT)
Received: by mail-lf0-x244.google.com with SMTP id f134so8873044lfg.8
 for <openbmc@lists.ozlabs.org>; Sun, 12 Nov 2017 23:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gFczq7s7C0+AW+LLAgnj6maIquUsNUp+1VK1w/lvMrc=;
 b=mOsOtRg+koCp+rW/Ac2zxR0+4ndxylB+f3Okl/7f1KlOEQHxqQcD/LMhpP8i6i+VQb
 IhXtOcUqNGRRlrkbOArAPIi86NzUaXhsDRykPNKv7Zzo089lb6x893o9APG+0omE5BP/
 hdYrVIglTMT1StAXO1zdIMT8ekSBvS/bIpgLiSmrgBSC8b39MUmMBKEHPgTIscMbBo1G
 /OkMjmSukTODJKj9MHHLo1FB7RIpR15PSBpTqqT0Cv6IgKi0NFy9FertbVPSgPIfbJOX
 ViLyEvTOplVh4kynhR2J6O0Ju848/aiglR8rKg6Gmh1aT4SOF6YWfGeEuIw4JXTqERES
 DIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gFczq7s7C0+AW+LLAgnj6maIquUsNUp+1VK1w/lvMrc=;
 b=Dcti6NfwzlA89ujzhxvRGJsfttprTvOyB9Dd8mzmhoq/+WPMCGgHay+Q8WA4DewGvV
 CMIEPjwpGr8QWBu5L0DrJ4wjtXKNVAfXBL9gY7DOoFyszoyYZewqFkzyObxICTFUbioR
 h6WfCZXVRhgfj0bCM8LtVwh2u+0oe4IDYiJMCSnG41601n81VolSPvIa0cjLBGe3BQ1T
 fHZLX3CGbCT2Bn9vL0ZPBDhq52PJv7s6YL5f21MJUaQsWtlHchOcQOr7t15xoUh9qqmJ
 V8KzFtqUFh3Nxnlx88BNc/rhOJeHFPfhw4AixfG0c1s/fFaWI39Ca48vZJPe/+5JUKFd
 ur6g==
X-Gm-Message-State: AJaThX595VUstaoDCJowvaNilqKiyjQc6in/njD3DUklI3hWTHFyRm+1
 CAA2FL8taVt+e0azzSDvIT4LwPL08q6yzNaU+94=
X-Google-Smtp-Source: AGs4zMZsRBmiQudGUdDphZTQYk8svAY6N9pnhIlGRhlARG79DrvFQFnF2AfHf0BXCaaiHH94t+1NAZgGwa2jh7cAKxc=
X-Received: by 10.25.203.20 with SMTP id b20mr817181lfg.197.1510558630894;
 Sun, 12 Nov 2017 23:37:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Sun, 12 Nov 2017 23:36:50 -0800 (PST)
In-Reply-To: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
References: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Nov 2017 18:06:50 +1030
X-Google-Sender-Auth: 6gsfd39Rn4VwOUX8RYt-9DiMlSo
Message-ID: <CACPK8Xfi_OV9sjQRauH_JbYP4H8mXFYWjfG8kAF8R5WxQZ7SKg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/1] arm: dts: Add Wfp BMC Machine
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2017 07:37:15 -0000

On Sat, Nov 11, 2017 at 5:29 AM, James Feist
<james.feist@linux.intel.com> wrote:
> Wfp is a Intel system with an Aspeed ast2500 BMC.

What does WFP mean?

>
> Signed-off-by: Feist, James <james.feist@linux.intel.com>
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/aspeed-bmc-intel-flash-layout.dtsi    |  26 +++++
>  arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts         | 117
> +++++++++++++++++++++
>  3 files changed, 144 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6d6c9eb..987e23e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb
> \
>         aspeed-bmc-opp-lanyang.dtb \
>         aspeed-bmc-mellanox-msn.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-intel-wfp.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
> b/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
> new file mode 100644
> index 0000000..4bcfd1b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
> @@ -0,0 +1,26 @@
> +               label = "bmc";
> +               partitions {
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               compatible = "fixed-partitions";
> +                               u-boot@0 {
> +                                       reg = < 0 0x60000 >;
> +                                       label = "u-boot";
> +                               };
> +                               u-boot-env@60000 {
> +                                       reg = < 0x60000 0x20000 >;
> +                                       label = "u-boot-env";
> +                               };
> +                               kernel@80000 {
> +                                       reg = < 0x80000 0x440000 >;
> +                                       label = "kernel";
> +                               };
> +                               rofs@0c0000 {
> +                                       reg = < 0x4c0000 0x1740000 >;
> +                                       label = "rofs";
> +                               };
> +                               rwfs@1c00000 {
> +                                       reg = < 0x1c00000 0x400000 >;
> +                                       label = "rwfs";
> +                               };
> +               };

This is the same as aspeed-bmc-opp-flash-layout.dtsi. Is there any
reason we can't reuse that file?

> diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> new file mode 100644
> index 0000000..2b4f095
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> @@ -0,0 +1,117 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "WFP BMC";
> +       compatible = "intel,wfp-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";

You don't need the console=ttyS4 in bootargs if you've set the stdout-path.

We should drop that from the other systems in the tree.

> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +#include "aspeed-bmc-intel-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "pnor";
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +       use-ncsi;

As Andrew said; NCSI uses rmii so I think there's a mistake here.

> +};
> +
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
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
> +&i2c13 {
> +       status = "okay";
> +};
> +
> +&gfx {
> +       status = "okay";
> +};
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +                        &pinctrl_pwm2_default &pinctrl_pwm3_default
> +                        &pinctrl_pwm4_default &pinctrl_pwm5_default
> +                        &pinctrl_pwm6_default &pinctrl_pwm7_default>;

The rest looks okay.

Cheers,

Joel
