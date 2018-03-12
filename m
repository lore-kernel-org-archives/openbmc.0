Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22d; helo=mail-it0-x22d.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nHWXBICE"; 
 dkim-atps=neutral
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400Hjc06RFzF08Y
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 23:44:02 +1100 (AEDT)
Received: by mail-it0-x22d.google.com with SMTP id u5-v6so11264026itc.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=d1gPB7034A+ewmr+LGlRXEyzXoumIQjyJRrRftvprl0=;
 b=nHWXBICEhb4TbnGzie8Tb78LHN1mCxQ/EMefbQKBvkpNjPnbUUW+7b1Cj3/umhXKsy
 JeSszFTNzDbwxX7Sh2p06JndA9UsI96rREvCL8UQ8fKB6jkx9XfB8Gapm1yW7ADhPbUj
 wSgkfeJYhkdEDch82jj1AzjLd8SOE0GNyP5mq0WjqafPcyD2mGZhplzMQPWrsEfERs9n
 p0qknapqKbl8/IZuciPrHRr5E27C6SDtAm8DkTMUuBqdwJmf58Oh2e6o2J2/QgHA/SVO
 4u9Vi4dGfB2uhVKdlcNdTi4H+eVXwTJZmBqygMpORUQSIZlM2JWgHuXl2eFHkAeFB9wh
 FXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=d1gPB7034A+ewmr+LGlRXEyzXoumIQjyJRrRftvprl0=;
 b=icbo0/hq1h65eFwPkEdwVC4thBCTpmfWr0sNij33KnyAZX1nKw5C7HxEg0Bd5DQV4i
 rN5jzJug2Lq43iiRMBPoZPuETUgId4aLzcUXsvNuf7Xb9+7ijIUM7lDidR1rkOHvqg/O
 NEfdgCkGhr4GMNuc03yTTCyt0LxpyyoMkRBKckdy0PhcTVSwl35NR+/nMEfp0CqUrXjb
 Cd5qQOweSDlvlGF/SrPbZ3fESF5ph20hpQ0NcoafBLrPtlb7Z4vkMBF7EKzZpgbuUSQ5
 eSD9V/F2ynNZTPv8r+qI1UaZPV7qXFanC3bmixcm6X66iI6fphvXgy2jZ3YRyLuga8ej
 sUyg==
X-Gm-Message-State: AElRT7GsFda2a3ZsJTULblIP8vqUctw27ppNKDnkNpjVtzYF6EV4ENIR
 4gysT/Bm0L80yempmtMwoPHlQ8mzD1T5edb6nVA=
X-Google-Smtp-Source: AG47ELuu5MAfKRiT2zMXLVyKY/AveM2KgCX0+V2OystGP1GsoA1Qd+7hKSoQAAjF4AB1OsLpmWwvq+QyP6jybzi9sFA=
X-Received: by 10.36.112.196 with SMTP id f187mr8117012itc.122.1520858640623; 
 Mon, 12 Mar 2018 05:44:00 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.79.34.71 with HTTP; Mon, 12 Mar 2018 05:43:59 -0700 (PDT)
In-Reply-To: <CAP6Zq1hzDCRUHJMnnh96u3YOmg_7s6UeqUu=UrK3ynL9s+VX5A@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <20180307162430.2664523-2-arnd@arndb.de>
 <CAP6Zq1ikUJ9jTLbR6ehdRLjkQHxzFa2VSdXN1G2ocMw9RyhGjg@mail.gmail.com>
 <CAP6Zq1hzDCRUHJMnnh96u3YOmg_7s6UeqUu=UrK3ynL9s+VX5A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Mar 2018 13:43:59 +0100
X-Google-Sender-Auth: 3GMbPvJl4KJoQ3UxiVvveZ15p7s
Message-ID: <CAK8P3a2xCkSjtFFmwCPKmPzwxLKmjEYrEwVv7YukA-3viYjMVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: npcm: drop extraneous 'select' statements
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
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
X-List-Received-Date: Mon, 12 Mar 2018 12:44:05 -0000

On Mon, Mar 12, 2018 at 12:43 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Before entering the long mail (sorry about it) just a technical thing
> I think we should add ARM_GIC configuration, It is not implied in ARCH_MULTI_V7.

Yes, you are right.

> Now for the real story :-)
>
> The NPCM7xx is a family of BMC's that include NPCM750, NPCM730 and more
>
> All of the NPCM7xx BMC's have the same basic modules like Cortex-A9,
> WDT, timers, etc - must included shared modules, and there are a
> optional modules that can be added (for example the USB is not in
> NPCM730)
> so the additional optional modules give us the differences between the
> NPCM7xx BMC's
>
> I will like to use the same method that SPEAR using
> (arch/arm/mach-spear/Kconfig)
>
> can we reflacte the NPCM7xx as follow in the Kconfig:
>
> menuconfig ARCH_NPCM
>         bool "Nuvoton NPCM Architecture"
>         depends on ARCH_MULTI_V7
>         select USE_OF
>         select PINCTRL

selecting pinctrl is fine, USE_OF is implied.

> if ARCH_NPCM
>
> config ARCH_NPCM7XX
>         bool "Support for NPCM7xx BMC (Poleg)"
>         depends on ARCH_MULTI_V7
>         select CACHE_L2X0
>         select PINCTRL_NPCM7XX
>         select NPCM7XX_TIMER
>         select ARCH_REQUIRE_GPIOLIB
>         select ARM_GIC
>         select ARM_ERRATA_720789
>         select ARM_ERRATA_754322
>         select ARM_ERRATA_794072
>         select PL310_ERRATA_588369
>         select PL310_ERRATA_727915
>         select MFD_SYSCON
>         help
>           General support for NPCM7xx BMC (Poleg).
>
>           Nuvoton NPCM7xx BMC based on the Cortex A9.

This seems fine.

> config ARCH_NPCM750_NPCM730
>         bool "NPCM750 or NPCM730 BMC support with Device Tree"
>         select HAVE_ARM_TWD if SMP
>         select HAVE_ARM_SCU if SMP
>          select ARM_ERRATA_764369 if SMP
>         help
>           General support for NPCM750 or NPCM730 BMC (Poleg).
>
>           Nuvoton NPCM750 or NPCM730 BMC based on the Cortex A9.
>
> or even better include it in ARCH_NPCM7XX and remove the ARCH_NPCM750
> and ARCH_NPCM730?

Yes, I think that would be best.

> Regarding another matter, defconfig file:
> We would like to consult how to describe the various chips (e.g.
> NPCM750, NPCM730) in the defconfig file.
> One option is to include all modules (as included in NPCM750 chip,
> which is a superset chip) and all the chips.
> The we call it npcm7xx_defconfig (same as spear13xx_deconfig) .
> In this option customers of NPCM730 will need to manually undef
> non-existing modules.
>
> Another option is to create different defconfig files for each chip of
> this NPCM7xx family, e.g. npcm750_defconfig and npcm730_defconfig.
>
> Which approach should be adopt ? We will appreciate your advise.

We don't want one defconfig per chip. Some platform maintainers
don't have any defconfig for their platforms at all, but simply rely
on multi_v7_defconfig for testing, which is fine as well. If you have
an extra defconfig file, make sure to always update both your
own file and the multi_v7_defconfig together when you add a new
driver that should be enabled.

For multi_v7_defconfig, make all non-essential drivers loadable
modules.

        Arnd
