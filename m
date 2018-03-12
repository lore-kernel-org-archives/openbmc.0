Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gE9TVew5"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400M4y1T7dzF0VW
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 02:16:01 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id v6so11846043iog.7
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 08:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=hBdDE5i3mmglnxQqVUX+yxSn5nNl4QkyQ7kX8zkO4ME=;
 b=gE9TVew5Sfhth5kZWghdQIUEI4T6YAgk5+F/3Uf7opx/5b6JmQpXp8PVhrlPQadu/k
 wSFlz3a6LLFEaBkru6F8H/UPZQJPQNBt4aGH35CFJ0jKhLIdzJ10LdiGHt5aN9ALu+IP
 jVShnkymo1dF5ls6NJFWZZ1RCSfEM22s/VX1YYxzkI00+znqwz/ICV0yD/xdgSBuE4Ap
 TK+xHtEgsO9KF2AZn+BI1VxmHGODYcjgYo6DgTTcQ/Pz5QjBn3ZhJ8kmbIHhyftQ8dV2
 5qHwDWX4Lk8N70hcdDMI8mQrBwhTLwt4o0cOX+mqtm4CPbUciW9arAuUkZ/WmSWdResP
 4LUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=hBdDE5i3mmglnxQqVUX+yxSn5nNl4QkyQ7kX8zkO4ME=;
 b=pWCcEoJYFW2aLRgREOlNX1ULBnmO5BOGstGzPFgDFWQSWZQAPtCFIb0MirWx/jRKF1
 4TvEahfMOJ9RECF80K6L90xSRtOmVl93gT8HapJKWzyYQ39SHKfTsaXAxPOMlfoWhc4L
 4dr9hbbg8YNmCycHvDz2tNUK+7gdaZby8ldnjqDIm6uqdsJxSSvJq7SwnT/nEmtPIno5
 0IPVeYSlH+764xyxOlmZHTf69jRkAWEQjKtnh0U3rvKu1XhgHQqD1Sh2KSOdUYXezrX0
 tAHnIZ6VlyPuDaeEcia1V/Znfu5zrWvk6Bu6TMnFH5XQXhk6f2k9Kx5MyTBPdcMKzSrf
 +FjQ==
X-Gm-Message-State: AElRT7FZde4jkymNKGmvdYAOZ3V95ZSU8r6KyY/OC4Tg3W7nH/o/9WDS
 dXFKQrMFsU/aLvjla9Rfms3eKwMCuiQ/ZKCce7s=
X-Google-Smtp-Source: AG47ELsNmfgauHVzDq15j9MzSXKG6gLQP5D5mvOWi8UPkNbGwqsyOtHIm9eEMfLbGGHLRF82uDvHB6gmuT/T8D/tEaI=
X-Received: by 10.107.164.132 with SMTP id d4mr9360371ioj.287.1520867759394;
 Mon, 12 Mar 2018 08:15:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.183.17 with HTTP; Mon, 12 Mar 2018 08:15:58 -0700 (PDT)
In-Reply-To: <CAK8P3a2=0ZUqyhmKVa4u_VvOg4rtd6vUWdpRojfsoP3OSvGyeQ@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <CAFd5g45h3wAZtx-4oJb_uLbtDTzSsD6eLM5G0VF=3BBHNmW8YQ@mail.gmail.com>
 <CAP6Zq1jEAg2OrmnHzJdk9UBjPkDctu5oGHYyJ+QLBzN+E31sPw@mail.gmail.com>
 <CAK8P3a2=0ZUqyhmKVa4u_VvOg4rtd6vUWdpRojfsoP3OSvGyeQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 12 Mar 2018 17:15:58 +0200
Message-ID: <CAP6Zq1iOxFTuUvp02qOtgpmfH7HA-1eZ9KG6AtU0zn6CpPCrzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: npcm: add CONFIG_ARCH_MULTI_V7 dependency
To: Arnd Bergmann <arnd@arndb.de>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Avi Fishman <avifishman70@gmail.com>, 
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
X-List-Received-Date: Mon, 12 Mar 2018 15:16:03 -0000

Hi Arnd,

I will send tomorrow new version with some modification we need to do
once we use NPCM7XX and not NPCM750.

Brendan,

Is it O.K.?



On 12 March 2018 at 15:37, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Mar 12, 2018 at 2:28 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> Hi Brendan,
>>
>> According to the last mail I have with Arnd can you modify the Kconfig
>> as follow:
>>
>> +menuconfig ARCH_NPCM
>> +       bool "Nuvoton NPCM Architecture"
>> +       depends on ARCH_MULTI_V7
>> +       select PINCTRL
>> +
>> +if ARCH_NPCM
>> +
>> +config ARCH_NPCM7XX
>> +       bool "Support for NPCM7xx BMC (Poleg)"
>> +       depends on ARCH_MULTI_V7
>> +       select PINCTRL_NPCM7XX
>> +       select NPCM7XX_TIMER
>> +       select ARCH_REQUIRE_GPIOLIB
>> +       select CACHE_L2X0
>> +       select ARM_GIC
>> +       select HAVE_ARM_TWD if SMP
>> +       select HAVE_ARM_SCU if SMP
>> +       select ARM_ERRATA_764369 if SMP
>> +       select ARM_ERRATA_720789
>> +       select ARM_ERRATA_754322
>> +       select ARM_ERRATA_794072
>> +       select PL310_ERRATA_588369
>> +       select PL310_ERRATA_727915
>> +       select MFD_SYSCON
>> +       help
>> +         General support for NPCM7xx BMC (Poleg).
>> +
>> +         Nuvoton NPCM7xx BMC based on the Cortex A9.
>> +
>> +endif
>
> One more change is needed to avoid a link error without CONFIG_SMP:
>
> diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
> index c7a1316d27c1..34d51f9f207c 100644
> --- a/arch/arm/mach-npcm/Makefile
> +++ b/arch/arm/mach-npcm/Makefile
> @@ -1,3 +1,4 @@
>  AFLAGS_headsmp.o               += -march=armv7-a
>
> -obj-$(CONFIG_ARCH_NPCM750)     += npcm7xx.o platsmp.o headsmp.o
> +obj-$(CONFIG_ARCH_NPCM750)     += npcm7xx.o
> +obj-$(CONFIG_SMP)              += platsmp.o headsmp.o
>
> Can one of you send me a pull request or the full patch series on top
> of the version I have in arm-soc?
>
>       Arnd
