Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UGlTuoyA"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ywh1p2MhBzDqhp
 for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2017 11:45:18 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id j124so21304075lfg.2
 for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2017 16:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aQrQUXbMDCdxGwHJfRxCu2q7RUcmnqJ5s1rFEY+9JyU=;
 b=UGlTuoyARz1rcPBRuyR8/o6+MywgVtCAK04tekaZ5CJl9ywGs4lqaVfUtxR6guTu8I
 dHg1SD5nOCDGD9zhSZK9NRfkI6HBxR9XEf7+Xw7ZzBXvSCYq1Npdg0tddOyEkjTIHB/d
 4BRXQ4b2JhZy4/lS+/ZEx+rNR7gt1YPjGnN6Po7gujd7GH6Qcvg+NUxHIPYO/B3toCo8
 WoXH3cta+6AdPI589eaF3lK9eCcrzJ/OjiXI7uZaOYfe+DRN5XXLdcGozEd32gHv28Ky
 AgzpHhZYKmleCBmvGutlc5z6YkzgS8vy5OtA/FYJ6bjMcG2hyBMRX+gJ5yssT8G49KjQ
 dpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=aQrQUXbMDCdxGwHJfRxCu2q7RUcmnqJ5s1rFEY+9JyU=;
 b=tjj7GxV4usa5TjPxyhsHWj5KTMgKss8MxTXo3jeQNSTx5GTI7GJxljr028B81ilUTZ
 KsSwFSV4eIYf7vmmq9DCKp6cpNfaF3jIwF6ZsDLKbjMMfoK4sfzyTuL38cjlGp67aP5V
 xSoAuhS+Kyfp3w/yxl3E2Yu5SdUSoete/KdkVj03/Rf9ugFqhLGqy56bSoRG2HzIwnLl
 NdDHV5/j+bVNNX1C/TTnjylz3g4jm9sHkbSIJDAlSO2AroYBeJUN5y0Bde4QCNemvDfP
 4mkdPyrg/LxQkzWgWHjmvd8fSQTKg2u12biS/t842Whs32zIuJmndjMFF1hpvyEivaG9
 jcRA==
X-Gm-Message-State: AKGB3mLuIAG2Y4jKN5F81976ugE+5QdHL8QRQpuD8ZWjNHAJTDIkR2L6
 HWbq2jE5rxcb0ornuTnDNje3lKtWzYs3ZOg6l1A=
X-Google-Smtp-Source: ACJfBot5Mp+qRShMFRO7IN13qw4UcaP7XVuHhlKf2dv1oNmhRt+dNYCtIkt5z+hEeKf/okKuMQI4LQeNLQTnjhVE59E=
X-Received: by 10.46.91.217 with SMTP id m86mr1105080lje.166.1513039514570;
 Mon, 11 Dec 2017 16:45:14 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 11 Dec 2017 16:44:54 -0800 (PST)
In-Reply-To: <1513023634-10621-1-git-send-email-james.feist@linux.intel.com>
References: <1513023634-10621-1-git-send-email-james.feist@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Dec 2017 11:14:54 +1030
X-Google-Sender-Auth: DLHaxu-il2Gr7FsXdSwFPyVXG-0
Message-ID: <CACPK8Xfs_E3FS7YMSQbqXD5odhcrC=C+HLKWGB1EkqbXA3vvjg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v5 1/1] ARM: dts: Add S2600WF BMC Machine
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
X-List-Received-Date: Tue, 12 Dec 2017 00:45:19 -0000

On Tue, Dec 12, 2017 at 6:50 AM, James Feist
<james.feist@linux.intel.com> wrote:
> S2600WF is a Intel platform family with an Aspeed ast2500 BMC.
>
> Signed-off-by: James Feist <james.feist@linux.intel.com>

Looks good! Applied to dev-4.10.

Cheers,

Joel

> ---
>  changes since v4:
>   - removed aliases
>   - added fast-read property
>   - added copyright header
>
>  arch/arm/boot/dts/Makefile                     |   1 +
>  arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts | 128 +++++++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6d6c9eb..7c54fc8 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
>         aspeed-bmc-mellanox-msn.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-intel-s2600wf.dtb \
>         aspeed-ast2500-evb.dtb
>  endif
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> new file mode 100644
> index 0000000..7d5cf3f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 Intel Corporation
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "S2600WF BMC";
> +       compatible = "intel,s2600wf-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vga_memory: framebuffer@7f000000 {
> +                       no-map;
> +                       reg = <0x7f000000 0x01000000>;
> +               };
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
> +               m25p,fast-read;
> +#include "openbmc-flash-layout.dtsi"
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
> +               m25p,fast-read;
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
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       use-ncsi;
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
> +};
> --
> 2.7.4
>
