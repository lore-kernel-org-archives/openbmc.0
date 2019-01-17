Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ee75G85Y"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gG7H4DJjzDqMl;
 Thu, 17 Jan 2019 18:34:51 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id k12so10312908qtf.7;
 Wed, 16 Jan 2019 23:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ty4TZXemD3pmxV/fImNNoGI0TZtUKP2Z8GeOb5Fvj3c=;
 b=ee75G85YR7+APioORsObIp6vne+dH9MNICLtaJuN44fbrhQNfQiV7ix7gJDhhjU5wt
 PPc6M5oOq5vorjmBa4hau0/jfY++tbVm2Q13DkA9GuqiYFFwCdIKlOIAI87qROHcfu/Z
 uymC5rlPxuAdVPY8hekAhz5c0llub1OdIZ+GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ty4TZXemD3pmxV/fImNNoGI0TZtUKP2Z8GeOb5Fvj3c=;
 b=jwaYTr5mOjeKXS4xyjMZ5RDIe0M36+vp61sTfyueZ4PUEJ087ZRujaLiNIU62Ov93x
 WPH6WqMjOJedeog6iQTnYxIAo6W9Vn2mQI9ByFwMLsPCaZaygdfC7bKF42uKOJC7KwWQ
 bk10AuBBRC5/exEX3pe+eoJtVghkc9Voz6tX9JYwyRxOxpnpmoSm/CFHZhBr7Xbi6bqw
 L10gxAgrrKiR2UhpMLcrnSmGa/PLzrdN9ozN5SZZvY5B0+/CdrWHmdZvLcS8BSMMF80G
 yPcGK9lOsaL/oZpxGQdMfHAJ1F08yO960+2j9vVaz/+niaDLBSxkx4LFLCTTWJbHFfSD
 YzLw==
X-Gm-Message-State: AJcUuke+koIrylXUIaKOX1bl30okn5wXkRqyaojwEdl2Mt5qS0ZFYY1E
 3QMYrMg/N6kp4HsnbnoO7OKEQDkdBymvQdVO99Vdbcl8
X-Google-Smtp-Source: ALg8bN6wdZk2m5W9J7UyieHahPPYm6XVYYJwGd9ITFM5KZtMf20kEQqpaK3ib3/+rSTRX1D9Jnv62gCxExoKJYxGVfI=
X-Received: by 2002:a0c:806f:: with SMTP id 102mr10127209qva.89.1547710488443; 
 Wed, 16 Jan 2019 23:34:48 -0800 (PST)
MIME-Version: 1.0
References: <1547708191-8721-1-git-send-email-wangzqbj@inspur.com>
In-Reply-To: <1547708191-8721-1-git-send-email-wangzqbj@inspur.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 18:34:34 +1100
Message-ID: <CACPK8XeL0N59CkBKyaBek19X_fmUNZCqQkOM+2i=g60LMJexfg@mail.gmail.com>
Subject: Re: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
To: John Wang <wangzqbj@inspur.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 17 Jan 2019 07:34:53 -0000

On Thu, 17 Jan 2019 at 17:56, John Wang <wangzqbj@inspur.com> wrote:
>
> Add initial version of device tree file for on5263m5 ast2500bmc
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>

The changes look good. It's convention to add a changelog to your
patch when you resend it, just below the ---. For example:

---
v2: FIx reserved memory address and correct copyright

You should also send the patch with v2 (or v3, or v4, etc) in the
subject line. Git format-patch can do this for you with the -v flag:

 git format-patch -v 2 --to=openbmc@lists.ozlabs.org -1

Keep this in mind for next time.

Your patch has some bad whitespace. I get this warnings when applying:

Applying: ARM:dts:aspeed Add Inspur on5263m5 BMC
.git/rebase-apply/patch:42: trailing whitespace.

.git/rebase-apply/patch:45: trailing whitespace.

.git/rebase-apply/patch:114: trailing whitespace.

.git/rebase-apply/patch:117: trailing whitespace, space before tab in indent.
            reg = <0x54>;
.git/rebase-apply/patch:145: space before tab in indent.
           reg = <0x00>;
warning: squelched 6 whitespace errors
warning: 11 lines add whitespace errors.

You can use a tool called checkpatch.pl to check that your patches are
okay before sending:

./scripts/checkpatch.pl 0001-ARM-dts-aspeed-Add-Inspur-on5263m5-BMC.patch

Can you please do that and send a v3?

Thanks!

Joel


>  arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts | 146 +++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> new file mode 100644
> index 0000000..064ae30
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Inspur Corporation
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "ON5263M5 BMC";
> +       compatible = "inspur,on5263m5-bmc", "aspeed,ast2500";
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
> +               vga_memory: framebuffer@9f000000 {
> +                       no-map;
> +                       reg = <0x9f000000 0x01000000>;
> +               };
> +       };
> +
> +       leds {
> +           compatible = "gpio-leds";
> +
> +           bmc_alive {
> +               label = "bmc_alive";
> +               gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
> +               linux,default-trigger = "timer";
> +           };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
> +       };
> +
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
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
> +&i2c6 {
> +       status = "okay";
> +
> +       tmp421@4e {
> +               compatible = "ti,tmp421";
> +               reg = <0x4e>;
> +       };
> +
> +       tmp112@48 {
> +               compatible = "ti,tmp112";
> +               reg = <0x48>;
> +       };
> +
> +       eeprom@54 {
> +               compatible = "atmel,24c64";
> +               reg = <0x54>;
> +               pagesize = <32>;
> +       };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       adm1278@11 {
> +                 compatible = "adi,adm1278";
> +                 reg = <0x11>;
> +       };
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
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +       };
> +};
> +
> +&adc {
> +       status = "okay";
> +};
> --
> 2.7.4
>
