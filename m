Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="GDk2GvQt"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CMQ12Q85zDqDB
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 12:09:58 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id p25so3568803qtb.3
 for <openbmc@lists.ozlabs.org>; Sun, 03 Mar 2019 17:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w6SUO75icvxrFJX86Ll5DkRqK97XFqz6DiugkcS+Sc4=;
 b=GDk2GvQtOPHP2YxPs3e/+JD0/igf2MqRjUsrMHQDEIEWVll+DT687g9dqsKBv5ziWg
 7kh1wM2FqDqQ1i/ao7dsWhAI7bqJnvB0AngftnNnp7qFFgKX2KPmEqMonZQhbd24qAh2
 LT5YXjx5BDVJe1sLZko9hasRoj4/XYDib+T/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w6SUO75icvxrFJX86Ll5DkRqK97XFqz6DiugkcS+Sc4=;
 b=jWjXELKVrr041EBVENdV0mBBW29blecOVnzeumQjeo3oJnM2ktL2C9O0MvFJrk5bUP
 rHs+HaLsSGTV/McN+hvGYmpI+XrnmpkZhj1DpkaCotmdkjV5KKipbpuQrj/f+rXuKRo9
 h8r2Vuiqv89Hh9rnJRwPIveBeyKS4XerQzS7qqVVYSLJ89Nj3RhYFpcYYzPH34k2jXQF
 2MMebBRCs76/GHq9VqmZQ0YurkugJM9X1ilFvWCMj1etUwNezW11qxvWMhVeZsoQLLnn
 kxasfGTbA1gTbrM+hM1k79MV4AjyFttt32KUi1nZvY4+82dPV7F/89KPi04mkXHOTOGD
 64FA==
X-Gm-Message-State: APjAAAVCy84N5L34YguaFVyW9ywvfC0FXrnVKm0qpTHxHQNY87+QcL5w
 i3GwUyl5bvtFfFq7IfFgQDXyp8gmAd1eqNYP4Ew=
X-Google-Smtp-Source: APXvYqxbW4Y7mJCflDPWlA9TtLizx3M3G6jrVKHnmj/xxvuF4zLEvFuS6AZWFEnkC2+cvHPsOmbJc05PEc0vQQH/HMs=
X-Received: by 2002:ac8:2d85:: with SMTP id p5mr13149412qta.136.1551661794717; 
 Sun, 03 Mar 2019 17:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20190228094925.5419-1-fran.hsu@quantatw.com>
In-Reply-To: <20190228094925.5419-1-fran.hsu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 4 Mar 2019 11:39:42 +1030
Message-ID: <CACPK8XcDgnyYpg-QfZOGj5-xTScWUpyhEUigWadGzZQ8kkeH4A@mail.gmail.com>
Subject: Re: [PATCH dev-4.19 v3] Add Quanta GSJ board device tree v2.
To: fran.hsu@quantatw.com
Cc: Benjamin Fair <benjaminfair@google.com>,
 Emily Shaffer <emilyshaffer@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 04 Mar 2019 01:10:03 -0000

Hello Fran,

Thanks for the patch.

On Thu, 28 Feb 2019 at 20:19, <fran.hsu@quantatw.com> wrote:
>
> From: FranHsu <Fran.Hsu@quantatw.com>
>
> Add device tree source include file nuvoton-npcm730-gsj-gpio.dtsi for setting pinctrl definition.

I suggest you use the commit message to describe the system you are
adding. See some of the aspeed systems for an example:

https://git.kernel.org/torvalds/c/f88bc8e15f1

 > ARM: dts: aspeed: Add Qanta Q71L BMC machine
 >
 > The Qanta Q71L BMC is an ASPEED ast2400 based BMC that is part of a
Qanta x86 server.

> Tested: This commit could build successfully with the Nuvoton kernel branch "Poleg-4.19.16-OpenBMC".
>     And it could be booted on EVB.

As you're asking this to be applied to the dev-4.19 branch, you should
be testing it on top of the latest dev-4.19 kernel tree. Similarly, if
you were submitting it for mainline inclusion, you should test on top
of the latest release of mainline.

I recommend submitting this patch for upstream inclusion, as we do for
the aspeed device trees.

> Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
> ---
>  .../boot/dts/nuvoton-npcm730-gsj-gpio.dtsi    | 2452 +++++++++++++++++
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts     |  550 ++++
>  2 files changed, 3002 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
> new file mode 100644
> index 000000000000..cf51cf3281cb
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
> @@ -0,0 +1,2452 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
> +// Update by Fran.Hsu@qunatatw.com

If your changes are copyrightable, then please add a copyright line
with the copyright owner (your company?). You can chose to have your
name there too, but this is not required as the git history will
contain your name if someone needs this information in the future.

> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> new file mode 100644
> index 000000000000..411387ee2f62
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -0,0 +1,550 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com

This copyright line looks good.

> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"

This file does not exist, so your patch breaks the kernel build. This
is why it is important to test on the branch you intend the patch to
apply to.

Please send a patch to add nuvoton-npcm730.dtsi.

> +#include "nuvoton-npcm733-gsj-gpio.dtsi"
> +/ {
> +       model = "Quanta GSJ Board (Device Tree v2))";
> +       compatible = "nuvoton,npcm750";
> +
> +       aliases {
> +               ethernet1 = &gmac0;
> +               serial3 = &serial3;
> +               udc9 = &udc9;
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
> +               i2c14 = &i2c14;
> +               i2c15 = &i2c15;
> +               spi0 = &spi0;
> +               spi1 = &spi1;
> +               fiu0 = &fiu0;
> +               fiu1 = &fiu3;
> +               fiu2 = &fiux;
> +       };

Do you need all of these aliases? Most of the numbering (eg. i2c)
should come out the same without these.

> +
> +       chosen {
> +               stdout-path = &serial3;
> +       };
> +
> +       memory {
> +               reg = <0 0x40000000>;
> +       };
> +
> +       ahb {
> +               gmac0: eth@f0802000 {
> +                       reg = <0xf0802000 0x2000>;

I haven't seen the npcm730 dtsi, but I assume it is similar to the
npcm750 which already contains the full ethernet node. If this is the
case, you only need to do this:

&gmac0 {
    phy-mode = "rgmii-id";
    status = "okay";
};

> +                       phy-mode = "rgmii-id";

I don't think the phy-mode property make sense if it's using NCSI.

> +                       status = "okay";
> +               };
> +               emc0: eth@f0825000 {
> +                       phy-mode = "rmii";

I don't think the phy-mode makes sense if it's using NCSI.

We should change the NCSI layer to support phy-mode = "ncsi".

> +                       use-ncsi; /* add this to support ncsi */

You can remove this comment.

> +                       status = "okay";
> +               };
> +               ehci1: usb@f0806000 {
> +                       status = "okay";
> +               };
> +
> +               ohci1: ohci@f0807000 {
> +                       status = "okay";
> +               };
> +
> +               udc9:udc@f0839000 {
> +                       status = "okay";
> +               };
> +
> +               aes:aes@f0858000 {
> +                       status = "okay";
> +               };
> +
> +               sha:sha@f085a000 {
> +                       status = "okay";
> +               };
> +
> +               fiu0: fiu@fb000000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&spi0cs1_pins>;
> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <0>;
> +                               spi-rx-bus-width = <2>;
> +                               partitions@80000000 {
> +                                               compatible = "fixed-partitions";
> +                                               #address-cells = <1>;
> +                                               #size-cells = <1>;
> +                                               bmc@0{
> +                                                       label = "bmc";
> +                                                       reg = <0x000000 0x4000000>;
> +                                               };
> +                                               u-boot@0 {
> +                                                       label = "u-boot";
> +                                                       reg = <0x0000000 0x80000>;
> +                                               };
> +                                               envparam@100000 {
> +                                                       label = "env-param";
> +                                                       reg = <0x0100000 0x40000>;
> +                                               };
> +                                               kernel@200000 {
> +                                                       label = "kernel";
> +                                                       reg = <0x0200000 0x580000>;
> +                                               };
> +                                               rofs@C00000 {
> +                                                       label = "rofs";
> +                                                       reg = <0x0C00000 0x2600000>;
> +                                               };
> +                                               rwfs@3200000 {
> +                                                       label = "rwfs";
> +                                                       reg = <0x3200000 0xE00000>;
> +                                               };
> +                               };
> +                       };
> +               };
> +
> +               fiu3: fiu@c0000000 {
> +                       pinctrl-0 = <&spi3_pins>;
> +                       status = "disabled";

It is unnecessary to add the node and then set it to disabled. You can
simply omit these nodes.

Reading the rest of this device tree, it looks like a number of the
contents should be in the SoC definition (npcm730.dsti) so it can be
shared among systems that use the npcm730.

Cheers,

Joel

> +               };
> +
> +               fiux: fiu@fb001000 {
> +                       status = "disabled";
> +                       spix-mode;
> +               };
> +
> +               sdhci0: sdhci@f0842000 {
> +                       status = "disabled";
> +               };
> +
> +               pcimbox: pcimbox@f0848000 {
> +                       status = "okay";
> +               };
> +
> +               vcd: vcd@f0810000 {
> +                       status = "disabled";
> +               };
> +
> +               ece: ece@f0820000 {
> +                       status = "okay";
> +               };
> +
> +               apb {
> +
> +                       watchdog1: watchdog@901C {
> +                               status = "okay";
> +                       };
> +
> +                       rng: rng@b000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial0: serial@1000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial1: serial@2000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial2: serial@3000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial3: serial@4000 {
> +                               status = "okay";
> +                       };
> +
> +                       adc: adc@c000 {
> +                               status = "okay";
> +                       };
> +                       otp:otp@189000 {
> +                               status = "okay";
> +                       };
> +
> +                       i2c0: i2c@80000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c1: i2c@81000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c2: i2c@82000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c3: i2c@83000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c4: i2c@84000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c5: i2c@85000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c6: i2c@86000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c7: i2c@87000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c8: i2c@88000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c9: i2c@89000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               eeprom@55 {
> +                                       compatible = "atmel,24c64";
> +                                       reg = <0x55>;
> +                               };
> +                       };
> +
> +                       i2c10: i2c@8a000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               eeprom@55 {
> +                                       compatible = "atmel,24c64";
> +                                       reg = <0x55>;
> +                               };
> +                       };
> +
> +                       i2c11: i2c@8b000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               /* P12V Quarter Brick DC/DC Power Module Q54SH12050 @60 */
> +                               power-brick@36 {
> +                                       compatible = "delta,dps800";
> +                                       reg = <0x36>;
> +                               };
> +                               hotswap@15 {
> +                                       compatible = "ti,lm5066i";
> +                                       reg = <0x15>;
> +                               };
> +                       };
> +
> +                       i2c12: i2c@8c000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c13: i2c@8d000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c14: i2c@8e000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c15: i2c@8f000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               i2c-switch@75 {
> +                                       compatible = "nxp,pca9548";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x75>;
> +                                       i2c-mux-idle-disconnect;
> +
> +                                       i2c_u20: i2c-bus@0 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <0>;
> +                                       };
> +
> +                                       i2c_u21: i2c-bus@1 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <1>;
> +                                       };
> +
> +                                       i2c_u22: i2c-bus@2 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <2>;
> +                                       };
> +
> +                                       i2c_u23: i2c-bus@3 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <3>;
> +                                       };
> +
> +                                       i2c_u24: i2c-bus@4 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <4>;
> +                                       };
> +
> +                                       i2c_u25: i2c-bus@5 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <5>;
> +                                       };
> +
> +                                       i2c_u26: i2c-bus@6 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <6>;
> +                                       };
> +
> +                                       i2c_u27: i2c-bus@7 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <7>;
> +                                       };
> +                               };
> +                       };
> +
> +                       pwm_fan:pwm-fan-controller@103000 {
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <   &pwm0_pins &pwm1_pins &pwm2_pins
> +                                               &fanin0_pins &fanin1_pins
> +                                               &fanin2_pins &fanin3_pins
> +                                               &fanin4_pins &fanin5_pins>;
> +                               status = "okay";
> +                               fan@0 {
> +                                       reg = <0x00>;
> +                                       fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +                                       cooling-levels = <127 255>;
> +                               };
> +                               fan@1 {
> +                                       reg = <0x01>;
> +                                       fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@2 {
> +                                       reg = <0x02>;
> +                                       fan-tach-ch = /bits/ 8 <0x04 0x05>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@3 {
> +                                       reg = <0x03>;
> +                                       fan-tach-ch = /bits/ 8 <0x06 0x07>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@4 {
> +                                       reg = <0x04>;
> +                                       fan-tach-ch = /bits/ 8 <0x08 0x09>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@5 {
> +                                       reg = <0x05>;
> +                                       fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                       };
> +
> +                       spi0: spi@200000 {
> +                               status = "disabled";
> +                       };
> +
> +                       spi1: spi@201000 {
> +                               status = "disabled";
> +                       };
> +
> +               };
> +       };
> +
> +       pinctrl: pinctrl@f0800000 {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <
> +                               /* GPI pins*/
> +                               &gpio8_pins
> +                               &gpio9_pins
> +                               &gpio12_pins
> +                               &gpio13_pins
> +                               &gpio14_pins
> +                               &gpio60_pins
> +                               &gpio83_pins
> +                               &gpio91_pins
> +                               &gpio92_pins
> +                               &gpio95_pins
> +                               &gpio136_pins
> +                               &gpio137_pins
> +                               &gpio141_pins
> +                               &gpio144_pins
> +                               &gpio145_pins
> +                               &gpio146_pins
> +                               &gpio147_pins
> +                               &gpio148_pins
> +                               &gpio149_pins
> +                               &gpio150_pins
> +                               &gpio151_pins
> +                               &gpio152_pins
> +                               &gpio153_pins
> +                               &gpio154_pins
> +                               &gpio155_pins
> +                               &gpio156_pins
> +                               &gpio157_pins
> +                               &gpio158_pins
> +                               &gpio159_pins
> +                               &gpio161_pins
> +                               &gpio162_pins
> +                               &gpio163_pins
> +                               &gpio164_pins
> +                               &gpio165_pins
> +                               &gpio166_pins
> +                               &gpio167_pins
> +                               &gpio168_pins
> +                               &gpio169_pins
> +                               &gpio170_pins
> +                               &gpio177_pins
> +                               &gpio191_pins
> +                               &gpio192_pins
> +                               &gpio203_pins
> +                               /* GPO pins*/
> +                               &gpio0od_pins
> +                               &gpio1od_pins
> +                               &gpio2od_pins
> +                               &gpio3od_pins
> +                               &gpio4od_pins
> +                               &gpio5od_pins
> +                               &gpio6od_pins
> +                               &gpio7od_pins
> +                               &gpio10od_pins
> +                               &gpio11od_pins
> +                               &gpio15od_pins
> +                               &gpio17od_pins
> +                               &gpio18od_pins
> +                               &gpio19od_pins
> +                               &gpio24od_pins
> +                               &gpio25od_pins
> +                               &gpio37od_pins
> +                               &gpio59od_pins
> +                               &gpio72od_pins
> +                               &gpio73od_pins
> +                               &gpio74od_pins
> +                               &gpio75od_pins
> +                               &gpio76od_pins
> +                               &gpio77od_pins
> +                               &gpio78od_pins
> +                               &gpio79od_pins
> +                               &gpio84od_pins
> +                               &gpio85od_pins
> +                               &gpio86od_pins
> +                               &gpio87od_pins
> +                               &gpio88od_pins
> +                               &gpio89od_pins
> +                               &gpio90od_pins
> +                               &gpio93od_pins
> +                               &gpio94od_pins
> +                               &gpio125od_pins
> +                               &gpio126od_pins
> +                               &gpio127od_pins
> +                               &gpio142od_pins
> +                               &gpio143ol_pins
> +                               &gpio175od_pins
> +                               &gpio176od_pins
> +                               &gpio190od_pins
> +                               &gpio194od_pins
> +                               &gpio195od_pins
> +                               &gpio196od_pins
> +                               &gpio197od_pins
> +                               &gpio198od_pins
> +                               &gpio199od_pins
> +                               &gpio200od_pins
> +                               &gpio202od_pins
> +                               >;
> +       };
> +
> +
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&gpio143ol_pins>;
> +
> +               led {
> +                       label = "led-bmc-live";
> +                       gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +};
> +
> --
> 2.21.0
>
