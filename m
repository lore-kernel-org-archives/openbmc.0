Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfYiiRng"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Qbr7Z24o"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxYtr1k02zF1Y4
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 13:12:35 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id f25so5164438qkm.0
 for <openbmc@lists.ozlabs.org>; Wed, 07 Mar 2018 18:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UOWe3KDSu26AZfbfogZwBLt3VU0NJYRu+LQQRX2QtMg=;
 b=UfYiiRngu6pFxhKVHvESwWj9OW4uWCH4OD3FXthVSNMh9jH00dHQMRrcBC17SmswGn
 6kX+AK0vqNO66c1lhHNNcdSTmT4bAWDcqfkJnO9XuhicgoXYoyAel08vuyi6WvaELH96
 8/thYXwnQFJivmi0utluIJ1O6uuYYDCzKlkbxcqDLB/yaWHJuUABfJyUQXo9Niej5Vvm
 OfgCehMg+zncO6adxNt1dSEDH5r0UEIzmBA7LxFEK2LJfHqWwnUPC4qjKFbwyHY0mijV
 8DF1vRU7D4MUFtFiSOZYRX9eMhx9SyLlwmrr/3W6ib2xG+B0sUZ+wizIz0g2FF7T/85N
 0mog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UOWe3KDSu26AZfbfogZwBLt3VU0NJYRu+LQQRX2QtMg=;
 b=Qbr7Z24o4LLRNg+r6dsK2bBeL2vJuERh2pOi2dUpJa0QQqeY9FXEugq7PfsFmLkHsq
 kc186EI8GExmTYriOhfJ47hry5W0s3yPNBx4eHh4iyAiXVEuXe1Ps+ffOREoQYAtR3US
 p5Kc0vHV7hhlPAM1TNWvhfST/yQB09Q3RIdRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UOWe3KDSu26AZfbfogZwBLt3VU0NJYRu+LQQRX2QtMg=;
 b=Na3/g9+YGiXA5ogG5eQwRTqNysKVEi4778+6Ssy638OnKqmGOB+rX6jd3A11tOiEVE
 voauDHFp3Qm/Hd3eEqP0QIk0yG1aUJSxP3aVWBVjl7onhKbaKfPpASrQVRDIRZagPT8B
 HMiSflCJPaIi3D+g5pmdlDkufdRUlAse367ddz8THv5A3Ge4BVdMxz9NlGfJphKW2fqz
 6tz06k93JHCJ7efFcBJ/FnTpadAcRrmtzF3IYvOw/Wr1FytHq/brysJV6iIY0EclWrvN
 lvJQ/9eihai6R/Ec/aIQ3lAxvBe+mD3m4y0j4KUl3rbim1uGziLvVDwg2d22zKaSr68V
 qDbQ==
X-Gm-Message-State: AElRT7Gcz9FR72kXjNnA91vDFzwdP1Jca/QPb8EeCXEcFHBp+oHY0a1A
 zUtDoDvrGzMvaVe75wUurcqgT0nyMAjXAgHv71c=
X-Google-Smtp-Source: AG47ELu0u9UUiMaOxrsj+hCI5q3aHc7RibOW1/of2af30hob2CmWxvRD4++LvvBTdAIa4MQ8ffPEiVAu35lRYi4bAEs=
X-Received: by 10.55.22.144 with SMTP id 16mr35242024qkw.11.1520475153504;
 Wed, 07 Mar 2018 18:12:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 7 Mar 2018 18:12:12 -0800 (PST)
In-Reply-To: <20180307162430.2664523-2-arnd@arndb.de>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <20180307162430.2664523-2-arnd@arndb.de>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Mar 2018 12:42:12 +1030
X-Google-Sender-Auth: GPAycjjUe33p8pSM9ccGvV6TL-A
Message-ID: <CACPK8XeVMSeQNkPNp1_vms97H_9rMuk1-DzUAc=s-7o=FmVncw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: npcm: drop extraneous 'select' statements
To: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, 
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
X-List-Received-Date: Thu, 08 Mar 2018 02:12:37 -0000

On Thu, Mar 8, 2018 at 2:54 AM, Arnd Bergmann <arnd@arndb.de> wrote:
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

I had a similar patch queued for sending out. Thanks Arnd.

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

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
