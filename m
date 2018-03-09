Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="roRUuL0s"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zy9mC3WLBzF1sB
 for <openbmc@lists.ozlabs.org>; Fri,  9 Mar 2018 13:08:58 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id z197so2061162qkb.6
 for <openbmc@lists.ozlabs.org>; Thu, 08 Mar 2018 18:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0mJ+x3J5iWCSRAFl8KDQFj/FQkyQSlfDptleYvYkm0=;
 b=roRUuL0sZzqaeC8o9X14C/grcNpKa+B/26a5+s28wAKAWS5v+frt7Q+FOWXLUEkbaO
 zUOCF/dDg1Egq7RWS92RtnZ8RzTqgaQlNQn1S0zH44BVZnVo9Fr9DFbvAxuC02u4W8cC
 dg51slGMppxHFPg+hIrC7DX5cLhpLZxegOaz+1wJRkabUU7u4afMRTWZONQJFwOZjRKD
 HXsZIVdjOfu9NYK6vN3wrnJeA+sfGl7KWc9Z4CNObCNQ2uOPezrAWFSgBocXqQL0u0KA
 qC/HAVmgwsweboiue1CtTmDieCsKUDlz4jx7ZJZIC/DNa2ocumjBspzO/dT/Hl+1HuYX
 xIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0mJ+x3J5iWCSRAFl8KDQFj/FQkyQSlfDptleYvYkm0=;
 b=fJraihzB1V71pJo6A16+M1dM5ZD5bedDx5qEx/n8C7lx9UcT9KMCeEqrC3Dbg4E1vi
 FNNT1MPosxnx9wJc81vJs9ksv5cWeeuYTyd3/dVA/tjYAV1vCN3i9ZZE4wyDEdnI6bv7
 cqos4By5dyPacWLl2xeT56RqUJ8lI6fbNCXz9gdu/OsvPsxaMxGyZOg5ZZ2fwCLL3Ctx
 bLhU3JDlZLYGiotMyitymZVXt6csiVrg+e0dgRsMZYeTOyIi9f4oeXgP7gHdLukYQGmY
 eeY71YP9OvMKVAivR0NgTfJYS93wHoC80zT8uN5syuKRK+Mr/NidPV+/mnUBqB8rxzaw
 1kEw==
X-Gm-Message-State: AElRT7GNiBr+xTaAcGLOaH4uN4VZzNrjKZqVOJQaGvCHTTSrAZxOyAVp
 gE5VaIc4Wg9kS/iIhga7TUfQ6q4GKsLErnuGNAwPxA==
X-Google-Smtp-Source: AG47ELuHL6nZVewXtLdLwgeivJfAZosxCfY73xj3/hkh5+oRf4t2WaKirWPJqwxeAo5PIh5m6hMyzxsBAMN6c2arSjo=
X-Received: by 10.55.49.74 with SMTP id x71mr39319635qkx.310.1520561335783;
 Thu, 08 Mar 2018 18:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20180307162430.2664523-1-arnd@arndb.de>
In-Reply-To: <20180307162430.2664523-1-arnd@arndb.de>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 09 Mar 2018 02:08:45 +0000
Message-ID: <CAFd5g45h3wAZtx-4oJb_uLbtDTzSsD6eLM5G0VF=3BBHNmW8YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: npcm: add CONFIG_ARCH_MULTI_V7 dependency
To: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
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
X-List-Received-Date: Fri, 09 Mar 2018 02:09:00 -0000

On Wed, Mar 7, 2018 at 8:24 AM Arnd Bergmann <arnd@arndb.de> wrote:

> The top-level CONFIG_ARCH_NPCM symbol is not guarded with a
> dependency, and can be selected for builds of traditional
> (non-multiplatform) builds as well, where it causes a build
> failure:

> arch/arm/boot/Makefile:17: arch/arm/mach-npcm//Makefile.boot: No such
file or directory

> This moves the dependency to avoid that particular condition.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm/mach-npcm/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
> index 6ff9df2636be..2bc6697c8d97 100644
> --- a/arch/arm/mach-npcm/Kconfig
> +++ b/arch/arm/mach-npcm/Kconfig
> @@ -1,5 +1,5 @@
>   menuconfig ARCH_NPCM
> -       bool "Nuvoton NPCM Architecture"
> +       bool "Nuvoton NPCM Architecture" if ARCH_MULTI_V7
>          select ARCH_REQUIRE_GPIOLIB
>          select USE_OF
>          select PINCTRL
> @@ -10,7 +10,7 @@ if ARCH_NPCM
>   comment "NPCM7XX CPU type"

>   config ARCH_NPCM750
> -       depends on ARCH_NPCM && ARCH_MULTI_V7
> +       depends on ARCH_NPCM
>          bool "Support for NPCM750 BMC CPU (Poleg)"
>          select CACHE_L2X0
>          select CPU_V7
> --
> 2.9.0


Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
