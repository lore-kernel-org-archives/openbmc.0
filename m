Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Fti0roAh"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydN061f1GzDrKr
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 13:50:45 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id 31so2757540qtz.9
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 18:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DRtZRTOA0fIlYu+xNBf+FzJmzg6LWUv92BZn/qFclIU=;
 b=Fti0roAhS/tV5j//0OXzdUkzv/VyDb8VrRHid1Moe3W+azEvUMK6lbEiiKUniLAOqz
 3ZfhAr18nDLRMIQK+yWqD4cjEQs1KrEckYiud83+0SdfXmCwgpYE+8AWsyOL6jUZvcKn
 i85MfbS4CYePVtuyVRgnZE7xJlNTjuX2Pv9qIPyTCuwXUN+9AviicofXGnyH3d6FQNLX
 IqHQ+7ueRpvdK5ohPlFxWd2CIbPAZ6109r5ikiYgiAMXxycH0jlYFQ4zOuzlsvhUwSl3
 SrInU0W7hQJ3goAiN05zsIx4fFCE/Q2UoGyBWguM8scfUxV2pAt32eWsEzYCkkxpKVUv
 kX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DRtZRTOA0fIlYu+xNBf+FzJmzg6LWUv92BZn/qFclIU=;
 b=SJQhQEIf/k5rQ8wtZHPXdHSVdaOOyqbqzS2nTI4rRxHatgwoxrO/YFPVgpQs4yYynu
 AckUtGLh+6Pm2CnSYvWG8V7dPgqawhA7aNuRBT8HFNQz3ApthMHs0mggf0U2R6u6Y+rv
 uH2hdVyMhn6CmUCGpq85Ux003hiDdKU13KypzVHJmO6GBWe/bm0rUVDLC7CDoCNaBv+f
 bmsne+a2asWoARPsqkNS+gctMneORuuvdaW+s3yypQJar51NCibP/ncQoJo+YKhNj3Pm
 SF8ys4dv0BpuIX6F5MumB6TkLRyOQC5KmCSe06aMaw0t6xMMsUCUvbzdkddn5jlk/D5n
 aIig==
X-Gm-Message-State: AJaThX5LAI7PVle2MdXjdM4lRiSw/o6DtGduqgLFiXZuzeWqRsH9PqJQ
 gwyifmXcFsOQt5uiqNIxtKVN0za0H2QybSPwlVOm+A==
X-Google-Smtp-Source: AGs4zMYgOiRbG1ZS6Os6HuMhQLhdbJLjLQa+UhG2zgoFfbSGTmzciLDJRh6NgROPPFgK7nGXP4nUZNRbCwqefV2HUZk=
X-Received: by 10.55.214.133 with SMTP id p5mr5891714qkl.212.1510887042891;
 Thu, 16 Nov 2017 18:50:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.99.79 with HTTP; Thu, 16 Nov 2017 18:50:42 -0800 (PST)
In-Reply-To: <CAL_JsqJGe85FAOQwt=zJ5jOBoT-F1itnK6kmc9k34FJu=3Z=bg@mail.gmail.com>
References: <20171019225050.25410-1-brendanhiggins@google.com>
 <20171019225050.25410-3-brendanhiggins@google.com>
 <CAL_JsqJGe85FAOQwt=zJ5jOBoT-F1itnK6kmc9k34FJu=3Z=bg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 16 Nov 2017 18:50:42 -0800
Message-ID: <CAFd5g46oNwegWc+rDzqXjwT2OezxqJRAkoMK2=9JdP7Gp8Tbqg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Rick Altherr <raltherr@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 17 Nov 2017 02:50:47 -0000

Sorry for the delay. I thought all of the comments were straightforward, but
there are a couple which need some further discussion.

On Fri, Oct 20, 2017 at 12:45 PM, Rob Herring <robh+dt@kernel.org> wrote:
> On Thu, Oct 19, 2017 at 5:50 PM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>> Tested-by: Avi Fishman <avifishman70@gmail.com>
>> ---
>
> [...]
>
>> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
>> new file mode 100644
>> index 000000000000..85506b3cdd39
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
>> @@ -0,0 +1,198 @@
>> +/*
>> + * DTSi file for the NPCM750 SoC
>> + *
>> + * Copyright 2012 Tomer Maimon <tomer.maimon@nuvoton.com>
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
>> +
>> +/ {
>> +       #address-cells = <1>;
>> +       #size-cells = <1>;
>> +       interrupt-parent = <&gic>;
>> +
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               enable-method = "nuvoton,npcm7xx-smp";
>> +
>> +               cpu@0 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a9";
>> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
>> +                       clock-names = "clk_cpu";
>> +                       reg = <0>;
>> +                       next-level-cache = <&l2>;
>> +               };
>> +
>> +               cpu@1 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a9";
>> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
>> +                       clock-names = "clk_cpu";
>> +                       reg = <1>;
>> +                       next-level-cache = <&l2>;
>> +               };
>> +       };
>> +
>> +/* external clock signal rg1refck, supplied by the phy */
>> +clk-rg1refck {
>> +       compatible = "fixed-clock";
>> +       #clock-cells = <0>;
>> +       clock-frequency = <125000000>;
>> +};
>> +
>> +/* external clock signal rg2refck, supplied by the phy */
>> +clk-rg2refck {
>> +       compatible = "fixed-clock";
>> +       #clock-cells = <0>;
>> +       clock-frequency = <125000000>;
>> +};
>> +
>> +clk-xin {
>> +       compatible = "fixed-clock";
>> +       #clock-cells = <0>;
>> +       clock-frequency = <50000000>;
>> +};
>> +
>> +       soc {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               compatible = "simple-bus";
>> +               interrupt-parent = <&gic>;
>> +               ranges = <0x0 0xf0000000 0x00900000>;
>> +
>> +               gcr: gcr@f0800000 {
>
> Should be gcr@800000. Build the dtb with W=1 and it will give you
> warnings for this.
>
>> +                       compatible = "nuvoton,npcm750-gcr", "syscon",
>> +                               "simple-mfd";
>> +                       reg = <0x800000 0x1000>;
>> +               };
>> +
>> +               scu: scu@f03fe000 {
>> +                       compatible = "arm,cortex-a9-scu";
>> +                       reg = <0x3fe000 0x1000>;
>> +               };
>> +
>> +               l2: cache-controller@f03fc000 {
>> +                       compatible = "arm,pl310-cache";
>> +                       reg = <0x3fc000 0x1000>;
>> +                       interrupts = <0 21 4>;
>> +                       cache-unified;
>> +                       cache-level = <2>;
>> +                       clocks = <&clk NPCM7XX_CLK_AXI>;
>> +               };
>> +
>> +               gic: interrupt-controller@f03ff000 {
>> +                       compatible = "arm,cortex-a9-gic";
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <3>;
>> +                       reg = <0x3ff000 0x1000>,
>> +                           <0x3fe100 0x100>;
>> +               };
>> +
>> +               timer@f03fe600 {
>> +                       compatible = "arm,cortex-a9-twd-timer";
>> +                       reg = <0x3fe600 0x20>;
>> +                       interrupts = <1 13 0x304>;
>> +                       clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +               };
>> +       };
>> +
>> +       ahb {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               compatible = "simple-bus";
>> +               interrupt-parent = <&gic>;
>> +               ranges = <0x80000000 0x80000000 0x40010000
>> +                         0xe0800000 0xe0800000 0x0f800000
>> +                         0x00000000 0xf0000000 0x00900000
>> +                         0xf8000000 0xf8000000 0x02000000
>> +                         0xfb000000 0xfb000000 0x00002000>;
>
> Just do "ranges;" here if all the translation is at the next level down.

Actually we do have some peripherals that sit directly on the AHB, they
just have not had their DTS nodes written yet. I counted at least 6
devices which probably won't get a sub-memory space.

>
> Sorry, it's hard to say exactly what to do without knowing the whole memory map.

No problem. Let me see if I can get it for you.

>
>> +
>> +               clk: clock-controller@f0801000 {
>
> Seems like this belongs under /soc based on the address.

No, the AHB memory space is discontiguous. The "Cortex A9 Included" space
(/soc here) sits in one of the discontinuities.

>
>> +                       compatible = "nuvoton,npcm750-clk";
>> +                       #clock-cells = <1>;
>> +                       reg = <0x801000 0x1000>;
>> +                       status = "okay";
>> +               };
>> +
>> +               apb {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       compatible = "simple-bus";
>> +                       interrupt-parent = <&gic>;
>> +                       ranges = <0x0 0x0 0x00300000>;
>
> And then this would be "<0x0 0xf0000000 0x300000>".
>
>> +
>> +                       timer0: timer@f0000000 {
>> +                               compatible = "nuvoton,npcm750-timer";
>> +                               interrupts = <0 32 4>;
>> +                               reg = <0x0 0x1000>;
>> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +                       };
>> +
>> +                       watchdog0: watchdog@f0008000 {
>> +                               compatible = "nuvoton,npcm750-wdt";
>> +                               interrupts = <0 47 4>;
>> +                               reg = <0x8000 0x1000>;
>> +                               status = "disabled";
>> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +                       };
>> +
>> +                       watchdog1: watchdog@f0009000 {
>> +                               compatible = "nuvoton,npcm750-wdt";
>> +                               interrupts = <0 48 4>;
>> +                               reg = <0x9000 0x1000>;
>> +                               status = "disabled";
>> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +                       };
>> +
>> +                       watchdog2: watchdog@f000a000 {
>> +                               compatible = "nuvoton,npcm750-wdt";
>> +                               interrupts = <0 49 4>;
>> +                               reg = <0xa000 0x1000>;
>> +                               status = "disabled";
>> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +                       };
>> +
>> +                       serial0: serial@f0001000 {
>> +                               compatible = "nuvoton,npcm750-uart";
>> +                               reg = <0x1000 0x1000>;
>> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
>> +                               interrupts = <0 2 4>;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial1: serial@f0002000 {
>> +                               compatible = "nuvoton,npcm750-uart";
>> +                               reg = <0x2000 0x1000>;
>> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
>> +                               interrupts = <0 3 4>;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial2: serial@f0003000 {
>> +                               compatible = "nuvoton,npcm750-uart";
>> +                               reg = <0x3000 0x1000>;
>> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
>> +                               interrupts = <0 4 4>;
>> +                               status = "disabled";
>> +                       };
>> +
>> +                       serial3: serial@f0004000 {
>> +                               compatible = "nuvoton,npcm750-uart";
>> +                               reg = <0x4000 0x1000>;
>> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;
>> +                               interrupts = <0 5 4>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +       };
>> +};
>> diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
>> new file mode 100644
>> index 000000000000..c69d3bbf7e42
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
>> @@ -0,0 +1,39 @@
>> +/*
>> + * Copyright (C) 2016 Nuvoton Technologies,  tali.perry@nuvoton.com
>> + *
>> + * This software is licensed under the terms of the GNU General Public
>> + * License version 2, as published by the Free Software Foundation, and
>> + * may be copied, distributed, and modified under those terms.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_NPCM7XX_H
>> +#define _DT_BINDINGS_CLK_NPCM7XX_H
>> +
>> +#define NPCM7XX_CLK_PLL0       0
>> +#define NPCM7XX_CLK_PLL1       1
>> +#define NPCM7XX_CLK_PLL2       2
>> +#define NPCM7XX_CLK_GFX                3
>> +#define NPCM7XX_CLK_APB1       4
>> +#define NPCM7XX_CLK_APB2       5
>> +#define NPCM7XX_CLK_APB3       6
>> +#define NPCM7XX_CLK_APB4       7
>> +#define NPCM7XX_CLK_APB5       8
>> +#define NPCM7XX_CLK_MC         9
>> +#define NPCM7XX_CLK_CPU                10
>> +#define NPCM7XX_CLK_SPI0       11
>> +#define NPCM7XX_CLK_SPI3       12
>> +#define NPCM7XX_CLK_SPIX       13
>> +#define NPCM7XX_CLK_UART_CORE  14
>> +#define NPCM7XX_CLK_TIMER      15
>> +#define NPCM7XX_CLK_HOST_UART  16
>> +#define NPCM7XX_CLK_MMC                17
>> +#define NPCM7XX_CLK_SDHC       18
>> +#define NPCM7XX_CLK_ADC                19
>> +#define NPCM7XX_CLK_GFX_MEM    20
>> +#define NPCM7XX_CLK_USB_BRIDGE 21
>> +#define NPCM7XX_CLK_AXI                22
>> +#define NPCM7XX_CLK_AHB                23
>> +#define NPCM7XX_CLK_EMC                24
>> +#define NPCM7XX_CLK_GMAC       25
>> +
>> +#endif
>> --
>> 2.15.0.rc0.271.g36b669edcc-goog
>>
