Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XgmXDaY5"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhgV74m9bzF1KR
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 13:39:59 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id f25so3686778qkm.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 18:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ujKMkeliDeC/W7vGIOmU9QM25gkFtPlmjHr0oIkpljI=;
 b=XgmXDaY52NvUtByoxOLYAfJJFc/IBkAh4Is/aQ6HykkZ+vfucr5cPWzDE3s57/+Zri
 g6lw1VroEwpt5XPUfvPpXhDEzRQ64/HW9QgUcPCSL1GIQ1kiTlV7b2gvxujH8NssJR0a
 HsVMODumtIs81hh1sR7MCICYwWaqshyBdUlFJsd0vEfIFMuEIcH9T98pu1XWgMVkuL/r
 2RHOsql8MuHQNdP9PAVupPoUQ82FY9MLZwP/pMu62T/QhjvZkI7tCejwlO0VAAdNPqXb
 7RWlqrGPbpU84RIwXwvlxW2nxG7laJHwV+f8gKcATBleQJsSATos96TEfneCeUDLmNYo
 EwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ujKMkeliDeC/W7vGIOmU9QM25gkFtPlmjHr0oIkpljI=;
 b=CdX9w9fD6MAOKHOLphxy7ys3owT0jkgGK9ip4CYw38V63NesGyMhnhCqiMiEzbNr82
 mqLV7SApsdGKcWOYvv+OcZxwvFsOHeztrMQk3nPNimMrf1AdlWQEsWW8qXJzuHW4xYAA
 zfRIpXqY/53YFuBuCppfuxUOCGY8o38reWmXNCXKyDWxvc0+T0/Kz1/N8noexWKhuy6f
 KYOyTisqGyLRXn1jDPlsmIJkgFIkbB2ELGArNmr7ymwR1LyUCPrHhOSh0oeuD6BqWYPt
 YDsO0ksklMswlOszpU9pI8q4IN14YdFqbWjbhIemWZB8u6Jal3cf8MJ2qjQUhylgyHIT
 5rdQ==
X-Gm-Message-State: APf1xPDyU1/jCwWNjQhDNgTtRAGelTCT80Hk2lNqlQG2yfZyO91Rjpf0
 nKgWVXatTWV8fowEUL//HhC4DQypJb3E3+eFL9g=
X-Google-Smtp-Source: AH8x224EFX8sTy2uVrVhhxhY9ISAywlgj6Nh4Y28rfVDaRvAHU9OmxugxX8SkidqbwzC9oyAfIRWR1rId3mK3wFVw0s=
X-Received: by 10.55.33.129 with SMTP id f1mr1938791qki.158.1518662396257;
 Wed, 14 Feb 2018 18:39:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 14 Feb 2018 18:39:35 -0800 (PST)
In-Reply-To: <20180213200959.160157-3-brendanhiggins@google.com>
References: <20180213200959.160157-1-brendanhiggins@google.com>
 <20180213200959.160157-3-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Feb 2018 13:09:35 +1030
X-Google-Sender-Auth: gZeK3yXce1S_nW_qkG7lxqDAi4g
Message-ID: <CACPK8XeU=6SooAka-eQTp1938CmMTDgA-dOP8Wur=+EzQ6Lpfw@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 julien.thierry@arm.com, 
 Philippe Ombredanne <pombredanne@nexb.com>, Arnd Bergmann <arnd@arndb.de>, 
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
X-List-Received-Date: Thu, 15 Feb 2018 02:40:01 -0000

On Wed, Feb 14, 2018 at 6:39 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:

> +       ahb {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               ranges;
> +
> +               clk: clock-controller@f0801000 {
> +                       compatible = "nuvoton,npcm750-clk";
> +                       #clock-cells = <1>;
> +                       reg = <0xf0801000 0x1000>;
> +                       status = "okay";

Nit: The ok is redundant.

> +               };
> +
> +               apb {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "simple-bus";
> +                       interrupt-parent = <&gic>;
> +                       ranges = <0x0 0xf0000000 0x00300000>;
> +
> +                       timer0: timer@8000 {
> +                               compatible = "nuvoton,npcm750-timer";
> +                               interrupts = <0 32 4>;
> +                               reg = <0x8000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
> +                       };
> +
> +                       serial0: serial@1000 {
> +                               compatible = "nuvoton,npcm750-uart";
> +                               reg = <0x1000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;

I really would like to see this merged, but lets get the last of these
things sorted out first.

The clocks.h that I have in the openbmc tree uses NPCM7XX_CLK_UART. Is
what you have here line up with the latest version of the clk driver
that Tomer posted?

 https://patchwork.kernel.org/patch/10200029/

His driver calls for a header called dt-bindings/clock/nuvoton,npcm7xx-clock.h.

An alternative would be to defer this by using the numbers instead of
#defines here, and omitting the header until the clock patch is
reviewed and merged. I had a similar chicken-egg problem with the
aspeed clk driver.

> +                               interrupts = <0 2 4>;

The irq header provides defines for the first and third cell. These
could instead be:

interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;

> +                               status = "disabled";

Add reg-shift = <2> to all of the uart nodes. This is required now
that we're using the generic 8250 driver.

> +                       };
> +

> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology corporation.
> +// Copyright 2018 Google, Inc.
> +
> +#ifndef _DT_BINDINGS_CLK_NPCM7XX_H
> +#define _DT_BINDINGS_CLK_NPCM7XX_H
> +
> +#define NPCM7XX_CLK_PLL0       0
> +#define NPCM7XX_CLK_PLL1       1
> +#define NPCM7XX_CLK_PLL2       2
> +#define NPCM7XX_CLK_GFX                3
> +#define NPCM7XX_CLK_APB1       4
> +#define NPCM7XX_CLK_APB2       5
> +#define NPCM7XX_CLK_APB3       6
> +#define NPCM7XX_CLK_APB4       7
> +#define NPCM7XX_CLK_APB5       8
> +#define NPCM7XX_CLK_MC         9
> +#define NPCM7XX_CLK_CPU                10
> +#define NPCM7XX_CLK_SPI0       11
> +#define NPCM7XX_CLK_SPI3       12
> +#define NPCM7XX_CLK_SPIX       13
> +#define NPCM7XX_CLK_UART_CORE  14
> +#define NPCM7XX_CLK_TIMER      15
> +#define NPCM7XX_CLK_HOST_UART  16
> +#define NPCM7XX_CLK_MMC                17
> +#define NPCM7XX_CLK_SDHC       18
> +#define NPCM7XX_CLK_ADC                19
> +#define NPCM7XX_CLK_GFX_MEM    20
> +#define NPCM7XX_CLK_USB_BRIDGE 21
> +#define NPCM7XX_CLK_AXI                22
> +#define NPCM7XX_CLK_AHB                23
> +#define NPCM7XX_CLK_EMC                24
> +#define NPCM7XX_CLK_GMAC       25
> +
> +#endif
> --
> 2.16.0.rc1.238.g530d649a79-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
