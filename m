Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VulXXgmP"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400DRl2HgrzDqGZ
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 21:16:50 +1100 (AEDT)
Received: by mail-it0-x244.google.com with SMTP id v194-v6so10731928itb.0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dkgtHWnvEoWWgWG64r0+dCNmD/HN08g6oAOoP+p6TJE=;
 b=VulXXgmPJaKdOtoqGZwBIAqZ0g6olF2wMGXT7FzCnMvX53wM4CSNkczV0yiFvUcGl8
 uA2B9n1m1tOcmH8I/NGlr9wu6n1BQat5c5mmB6QO/SPn+GZ91YTXUE9LTZcr9xRse5HH
 fRdR3qps1D214ICOQEfA8Q7glTyssUUKhUOfK67rD+ZeMey9eP7C5sHkJNFh3XYxIb4h
 1ea34QnnOGQyUDwV08rCq7/bhj9Ep4/6HmQ2Em4MBzH2RWyAB0DA1kbn52m8QIiVh+yb
 V5zzpzXcwtLJa7bmg7fu9VAGYxeolyb6ZzBc3Aq/T1dGG+g8VBvzTdB4IsowN0J2SeF/
 Bihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dkgtHWnvEoWWgWG64r0+dCNmD/HN08g6oAOoP+p6TJE=;
 b=Z2y4c9ikUqUIjCaK8KbjBW7CGrxEdq+sn6XBG8BwXW6Cari02veig5T75Dj8xxK41l
 zPzY9MVe62w45kwtGSX54YtL+wtB/lHdzBA053sWNYGJoXB+TSd2eL24teKknmJZCmzP
 LChFMT+wUf/vKAaoLVUBdQahUooxEOEewNXQZzErunx5oip6R813hgbX9vxc/tRsf37P
 SBzQb1+Vyykaiad468op/Ujfg3fRk7jcS9ZeGyFSYvR2ghRobaI7ZC6EQKW0++xRjvvj
 QrGJ8k/tdq578hf8rZM481aFfTGZs1ajOmNivnOjbHMpchzhVz0uUUX/75711Olmjr7Y
 zFQA==
X-Gm-Message-State: AElRT7H1Z2awExdM6FuzsKdGqr9Jvz/7g1h93OiCSX9ti4Us4N5+HeEK
 XNDmO8BFqMztuNCJCha/NoJn3s4HVFYI5KL86Rg=
X-Google-Smtp-Source: AG47ELsMbE+nWtSi7ZdImprSITy+fARCwZmplrF+KqkmVG0C2URS5WUG+nkTURe9vuYpj1hI0j0nRq92OnE8ICt2sv4=
X-Received: by 10.36.245.138 with SMTP id k132mr7617062ith.96.1520849807992;
 Mon, 12 Mar 2018 03:16:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.183.17 with HTTP; Mon, 12 Mar 2018 03:16:47 -0700 (PDT)
In-Reply-To: <20180307162430.2664523-2-arnd@arndb.de>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <20180307162430.2664523-2-arnd@arndb.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 12 Mar 2018 12:16:47 +0200
Message-ID: <CAP6Zq1ikUJ9jTLbR6ehdRLjkQHxzFa2VSdXN1G2ocMw9RyhGjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: npcm: drop extraneous 'select' statements
To: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, 
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Mon, 12 Mar 2018 10:16:52 -0000

Hi Amd,

Sorry for the delayed reply,

the NPCM7xx is a family of BMC's that include NPCM750, NPCM730 and more

All of the NPCM7xx BMC's have the same basic modules like Cortex-A9,
WDT, timers and more

can we reflacte the NPCM7xx as follow in the Kconfig:

menuconfig ARCH_NPCM
        bool "Nuvoton NPCM Architecture"
        depends on ARCH_MULTI_V7
        select USE_OF
        select PINCTRL

if ARCH_NPCM

config ARCH_NPCM7XX
        bool "Support for NPCM7xx BMC (Poleg)"
        depends on ARCH_MULTI_V7
        select HAVE_ARM_SCU
        select PINCTRL_NPCM7XX
        select NPCM7XX_TIMER
        select ARCH_REQUIRE_GPIOLIB
        select ARM_GIC
        select ARM_ERRATA_720789
        select ARM_ERRATA_754322
        select ARM_ERRATA_794072
        select PL310_ERRATA_588369
        select PL310_ERRATA_727915
        select MFD_SYSCON
        help
          General support for NPCM7xx BMC (Poleg).

          Nuvoton NPCM7xx BMC based on the Cortex A9.

if ARCH_NPCM7XX

config ARCH_NPCM750
        bool "NPCM750 BMC support with Device Tree"
        select HAVE_ARM_TWD if SMP
        help
          General support for NPCM750 BMC (Poleg).

          Nuvoton NPCM750 BMC based on the Cortex A9.

config ARCH_NPCM730
        bool "NPCM730 BMC support with Device Tree"
        select HAVE_ARM_TWD if SMP
        select ARM_ERRATA_764369 if SMP
        help
          General support for NPCM730 BMC (Poleg).

          Nuvoton NPCM730 BMC based on the Cortex A9.

endif #ARCH_NPCM7XX

endif

On 7 March 2018 at 18:24, Arnd Bergmann <arnd@arndb.de> wrote:
> While looking at the build regression, I noticed that the
> platform selects a lot of other Kconfig symbols that it really
> should not:
>
> CPU_V7, ARM_GIC, HAVE_SMP, COMMON_CLK, GENERIC_CLOCKEVENTS,
> and CLKDEV_LOOKUP are all implied by ARCH_MULTI_V7, so they
> can be dropped.
>
> CACHE_L2X0, SMP and USB are meant to be user-selectable, we
> want to be able to turn those off for testing purposes.
>
> CPU_USE_DOMAINS looks completely misplaced here, we should not
> select that for an ARMv7 platform.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-npcm/Kconfig | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
> index 2bc6697c8d97..c6a16230e8ef 100644
> --- a/arch/arm/mach-npcm/Kconfig
> +++ b/arch/arm/mach-npcm/Kconfig
> @@ -12,12 +12,6 @@ comment "NPCM7XX CPU type"
>  config ARCH_NPCM750
>         depends on ARCH_NPCM
>         bool "Support for NPCM750 BMC CPU (Poleg)"
> -       select CACHE_L2X0
> -       select CPU_V7
> -       select ARM_GIC
> -       select HAVE_SMP
> -       select SMP
> -       select SMP_ON_UP
>         select HAVE_ARM_SCU
>         select HAVE_ARM_TWD if SMP
>         select ARM_ERRATA_720789
> @@ -26,18 +20,6 @@ config ARCH_NPCM750
>         select ARM_ERRATA_794072
>         select PL310_ERRATA_588369
>         select PL310_ERRATA_727915
> -       select USB_EHCI_ROOT_HUB_TT
> -       select USB_ARCH_HAS_HCD
> -       select USB_ARCH_HAS_EHCI
> -       select USB_EHCI_HCD
> -       select USB_ARCH_HAS_OHCI
> -       select USB_OHCI_HCD
> -       select USB
> -       select FIQ
> -       select CPU_USE_DOMAINS
> -       select GENERIC_CLOCKEVENTS
> -       select CLKDEV_LOOKUP
> -       select COMMON_CLK if OF
>         select NPCM750_TIMER
>         select MFD_SYSCON
>         help
> --
> 2.9.0
>
