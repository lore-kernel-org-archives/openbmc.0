Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TvpShSQD"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgQhq4Ql2zDq8c
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 12:59:55 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id o7so6399135qkc.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kp6xOU6xHNG5Pw4hpVqYL3gqfTxlj4qUWwK8O1KjTCY=;
 b=TvpShSQDr2Zyw0wFeZAmRsyAj2JqHll+bvHyxk6gwwPUnlIAbeuDnbXllZRWnw2h9M
 g42vLo3qH8pGxD8v0evMDJrYyEHH6ZZL/j4B7Gr01lEby61vKI1He5zaIPXobKCryzEu
 eyKDFvYkwt3ypDYubPpD7GtOWdZ34/l+flHRHV8hWh2SJ2BwYzvz3gcyyC8Asacg8RZJ
 et9irEj0NayPCoshDK4FrMA4sbhQUBH+HaS8Ldk00WVeLVvKxh9711neFDhlHQMH/GAM
 QClax056sDUYvZBfJqbL1FkA53nsor1H6Eln459SnUPSKRA0WXqrkJWDBZ1q//VsKOOe
 JYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kp6xOU6xHNG5Pw4hpVqYL3gqfTxlj4qUWwK8O1KjTCY=;
 b=BNM8KZ8/wNA92Sg38ePQT8Kfv8JsdVXBJe2rhWe1NlA864XlbV150PhpGM3C9xO2TE
 rLzMH+lS7RXoXZNdA7Su+XeDT3IbxtnuNc8PqT7GpUEupSpWxLavp/v3zcRz0DTpey85
 P5Y3VSJXxSxdCUjjdadp8SDVIvt722cj+Az65vIg5FO12cBDY1H0+CO6+Q5Npt5Vvdfm
 GzZdXLiyCYD4vF6sNoi/Y4IB/7xH+vUyMBQ5bMiM0I/y3AT3ZV1aqB5X6C/H762dVDYC
 UnWF2NEQ08fe5iip9d3x4rjc5yrZHOlafrCC2iNY4paVj68WMl94gfWHcg88+MCRCAWc
 v6zA==
X-Gm-Message-State: APf1xPAN5xcLpECQpHUqmSsbD9BTAk0qY9ioBdAouDTynnclVzPEQKdb
 Om2NhpNhyOlZ0VNxLI5N5adhwz1xgb5ZSTnQSvg=
X-Google-Smtp-Source: AH8x226DFzhsO+xNs+MY8NlMjmTDU6tN2QK1SN412j6VEbbTVGDiVSJc1SVj4oMcgjyWIM/T7Sf0/ZquZA1JhCyf+eM=
X-Received: by 10.55.41.151 with SMTP id p23mr19928487qkp.52.1518487192917;
 Mon, 12 Feb 2018 17:59:52 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Feb 2018 17:59:32 -0800 (PST)
In-Reply-To: <20180212205833.151019-2-brendanhiggins@google.com>
References: <20180212205833.151019-1-brendanhiggins@google.com>
 <20180212205833.151019-2-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Feb 2018 12:29:32 +1030
X-Google-Sender-Auth: G4ne0I8r1gIRZQetIGO_tzRv0p4
Message-ID: <CACPK8XcGhxTq7QGeub2rAEtGSyrOmnobspVJfhE5YmB6MQRM9w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm: npcm: add low-level debug support for NPCM7XX
To: Brendan Higgins <brendanhiggins@google.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: Russell King <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, 
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
X-List-Received-Date: Tue, 13 Feb 2018 01:59:56 -0000

Hi Brendan,

On Tue, Feb 13, 2018 at 7:28 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Enable low-level debug support for Nuvoton NPCM7XX family by adding the
> debug port definitions for the SoC.

When playing with the Poleg boards at the recent OpenBMC hackathon
Jeremy discovered that the UART is a normal-ish 8250, with a custom
divisor and a few extra bits to be set.

I found that we can us the generic 8250 low level debugging support
just fine. This is because u-boot sets up the divisor settings for us
(as you've assumed with your version here), and from there it's just
reading/writing characters.

Assuming you can reproduce our results, I suggest we drop these
patches in favour of adding the correct configuration the Poleg.

Cheers,

Joel

>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  arch/arm/Kconfig.debug           | 11 +++++++++++
>  arch/arm/include/debug/npcm7xx.S | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 arch/arm/include/debug/npcm7xx.S
>
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 447629d89884..d8f925cb8872 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -595,6 +595,12 @@ choice
>                   Say Y here if you want kernel low-level debugging support
>                   on Hilscher NetX based platforms.
>
> +       config DEBUG_NPCM7XX_UART
> +               bool "Kernel low-level debugging messages via Nuvoton NPCMx50 UART"
> +               help
> +                 Say Y here if you want kernel low-level debugging support
> +                 on Nuvoton based platforms.
> +
>         config DEBUG_NOMADIK_UART
>                 bool "Kernel low-level debugging messages via NOMADIK UART"
>                 depends on ARCH_NOMADIK
> @@ -1444,6 +1450,7 @@ config DEBUG_LL_INCLUDE
>         default "debug/ks8695.S" if DEBUG_KS8695_UART
>         default "debug/msm.S" if DEBUG_QCOM_UARTDM
>         default "debug/netx.S" if DEBUG_NETX_UART
> +       default "debug/npcm7xx.S" if DEBUG_NPCM7XX_UART
>         default "debug/omap2plus.S" if DEBUG_OMAP2PLUS_UART
>         default "debug/renesas-scif.S" if DEBUG_R7S72100_SCIF2
>         default "debug/renesas-scif.S" if DEBUG_RCAR_GEN1_SCIF0
> @@ -1481,6 +1488,7 @@ config DEBUG_UART_8250
>  config DEBUG_UART_PHYS
>         hex "Physical base address of debug UART"
>         default 0x00100a00 if DEBUG_NETX_UART
> +       default 0xf0004000 if DEBUG_NPCM7XX_UART
>         default 0x01c20000 if DEBUG_DAVINCI_DMx_UART0
>         default 0x01c28000 if DEBUG_SUNXI_UART0
>         default 0x01c28400 if DEBUG_SUNXI_UART1
> @@ -1589,6 +1597,7 @@ config DEBUG_UART_PHYS
>                 DEBUG_LL_UART_EFM32 || \
>                 DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
>                 DEBUG_NETX_UART || \
> +               DEBUG_NPCM7XX_UART || \
>                 DEBUG_QCOM_UARTDM || DEBUG_R7S72100_SCIF2 || \
>                 DEBUG_RCAR_GEN1_SCIF0 || DEBUG_RCAR_GEN1_SCIF2 || \
>                 DEBUG_RCAR_GEN2_SCIF0 || DEBUG_RCAR_GEN2_SCIF2 || \
> @@ -1605,6 +1614,7 @@ config DEBUG_UART_VIRT
>         default 0xc8821000 if DEBUG_RV1108_UART1
>         default 0xc8912000 if DEBUG_RV1108_UART0
>         default 0xe0000a00 if DEBUG_NETX_UART
> +       default 0xf0001000 if DEBUG_NPCM7XX_UART
>         default 0xe0010fe0 if ARCH_RPC
>         default 0xf0000be0 if ARCH_EBSA110
>         default 0xf0010000 if DEBUG_ASM9260_UART
> @@ -1695,6 +1705,7 @@ config DEBUG_UART_VIRT
>         depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
>                 DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
>                 DEBUG_NETX_UART || \
> +               DEBUG_NPCM7XX_UART || \
>                 DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
>                 DEBUG_S3C64XX_UART || \
>                 DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
> diff --git a/arch/arm/include/debug/npcm7xx.S b/arch/arm/include/debug/npcm7xx.S
> new file mode 100644
> index 000000000000..d08e14e73d79
> --- /dev/null
> +++ b/arch/arm/include/debug/npcm7xx.S
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright 2018 Google, Inc.
> +// This is heavily based on arch/arm/include/debug/at91.S
> +
> +#define NPCM7XX_SR     (0x14)  /* Status Register */
> +#define NPCM7XX_THR    (0x00)  /* Transmitter Holding Register */
> +#define NPCM7XX_TXRDY  (1 << 6)        /* Transmitter Ready */
> +#define NPCM7XX_TXEMPTY        (1 << 6)        /* Transmitter Empty */
> +
> +       .macro  addruart, rp, rv, tmp
> +       ldr     \rp, =CONFIG_DEBUG_UART_PHYS    @ System peripherals (phys)
> +       ldr     \rv, =CONFIG_DEBUG_UART_VIRT    @ System peripherals (virt)
> +       .endm
> +
> +       .macro  senduart,rd,rx
> +       strb    \rd, [\rx, #(NPCM7XX_THR)]      @ Write to Transmit Holding Reg
> +       .endm
> +
> +       .macro  waituart,rd,rx
> +1001:  ldr     \rd, [\rx, #(NPCM7XX_SR)]       @ Read Status Register
> +       tst     \rd, #NPCM7XX_TXRDY             @ TXRDY = 1 when ready to tx
> +       beq     1001b
> +       .endm
> +
> +       .macro  busyuart,rd,rx
> +1001:  ldr     \rd, [\rx, #(NPCM7XX_SR)]       @ Read Status Register
> +       tst     \rd, #NPCM7XX_TXEMPTY           @ TXEMPTY = 1 when tx complete
> +       beq     1001b
> +       .endm
> +
> --
> 2.16.0.rc1.238.g530d649a79-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
