Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UtC5W+QO"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400Jhp6DV8zDrKr
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 00:28:26 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id u66so11153172ith.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nFJ7JlGnQYL9vMQ600mLfT5Q5qPtLSo9+dgql4EsyjQ=;
 b=UtC5W+QOgtGZ3WA8MFhq1hGowFFdTqQbWqSNtJdlkbUPnJXIXLF9ByxZY1GmNuOZgJ
 3pAPE4zr4Y3rJLJWaZGoUkT3jwB5ZliAPn1uPC5ttqWKKc93vtzuJ2geveVmR+bA6iry
 wcBHNJX+b/bywJiMdNY/pbdqxF/VlPfj+2PesPnPDyzzCcJyh65cox62HKf/hCMfyViN
 FTqMDYwNkEebEHO9QzrtloZTRgnmSVBsfJcS9tgPQlfC4X9CZKYuOQRuzRU+5loGQ7eG
 +uS0TElQoJ9/6z17HFdkDF0z9zXP9DGNIGkw0iwGSviWngt1tgirzyDaKbPcvjxU57ij
 xbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nFJ7JlGnQYL9vMQ600mLfT5Q5qPtLSo9+dgql4EsyjQ=;
 b=kt1YmOS2MGtnNEPgAIMux3xzT6GTcnDwRPew1PEpSrnQbauRDXGC5S9nt3I+M8mvI+
 APt6ym+z4L24LA9p4r6vTfXl+hcuEDdDJ+CrM7wFu57k1nKrL/Juh1RTO9uk7L8sWOfD
 6ldErrz/wvDgpgkLBj0QUiKxGQ3+urSOyR6/vwwxxEFtviH5aK9Xr+ZqxLlDDK9ud4A6
 F85LfGtBUrmfIwfPdXkx/H0mYp/1KqANClDfaKtlfnLxcxqy2oCU6C6OO+HG/+0z1Yu5
 6klR3et6Ln1evlyZn8e81QnVqp57tDz/OrWRC9IWhdsnbmNTzRBg5QxZ04VH2f/PMIHZ
 cLqA==
X-Gm-Message-State: AElRT7Hl+mDqNpwIC6dzhbsYk7P2tyJkNDE6wVaFDLFQamEhVkS7grPR
 fHDOB/oMiLVuypegMmriWwk0pxpLnG8VW0dEnGI=
X-Google-Smtp-Source: AG47ELvWlR3hGcwCM3ez/Gx9swFA7F7niYhDfxAFWypE06MPzLuhC1/mEP4AfVyyUj20gNUcUzePGGwFCm8R6Ktz7FY=
X-Received: by 10.36.34.194 with SMTP id o185mr8014580ito.60.1520861303747;
 Mon, 12 Mar 2018 06:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.183.17 with HTTP; Mon, 12 Mar 2018 06:28:23 -0700 (PDT)
In-Reply-To: <CAFd5g45h3wAZtx-4oJb_uLbtDTzSsD6eLM5G0VF=3BBHNmW8YQ@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <CAFd5g45h3wAZtx-4oJb_uLbtDTzSsD6eLM5G0VF=3BBHNmW8YQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 12 Mar 2018 15:28:23 +0200
Message-ID: <CAP6Zq1jEAg2OrmnHzJdk9UBjPkDctu5oGHYyJ+QLBzN+E31sPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: npcm: add CONFIG_ARCH_MULTI_V7 dependency
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, 
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
X-List-Received-Date: Mon, 12 Mar 2018 13:28:27 -0000

Hi Brendan,

According to the last mail I have with Arnd can you modify the Kconfig
as follow:

+menuconfig ARCH_NPCM
+       bool "Nuvoton NPCM Architecture"
+       depends on ARCH_MULTI_V7
+       select PINCTRL
+
+if ARCH_NPCM
+
+config ARCH_NPCM7XX
+       bool "Support for NPCM7xx BMC (Poleg)"
+       depends on ARCH_MULTI_V7
+       select PINCTRL_NPCM7XX
+       select NPCM7XX_TIMER
+       select ARCH_REQUIRE_GPIOLIB
+       select CACHE_L2X0
+       select ARM_GIC
+       select HAVE_ARM_TWD if SMP
+       select HAVE_ARM_SCU if SMP
+       select ARM_ERRATA_764369 if SMP
+       select ARM_ERRATA_720789
+       select ARM_ERRATA_754322
+       select ARM_ERRATA_794072
+       select PL310_ERRATA_588369
+       select PL310_ERRATA_727915
+       select MFD_SYSCON
+       help
+         General support for NPCM7xx BMC (Poleg).
+
+         Nuvoton NPCM7xx BMC based on the Cortex A9.
+
+endif

Thanks!

Tomer

On 9 March 2018 at 04:08, Brendan Higgins <brendanhiggins@google.com> wrote:
> On Wed, Mar 7, 2018 at 8:24 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
>> The top-level CONFIG_ARCH_NPCM symbol is not guarded with a
>> dependency, and can be selected for builds of traditional
>> (non-multiplatform) builds as well, where it causes a build
>> failure:
>
>> arch/arm/boot/Makefile:17: arch/arm/mach-npcm//Makefile.boot: No such
> file or directory
>
>> This moves the dependency to avoid that particular condition.
>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   arch/arm/mach-npcm/Kconfig | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
>> index 6ff9df2636be..2bc6697c8d97 100644
>> --- a/arch/arm/mach-npcm/Kconfig
>> +++ b/arch/arm/mach-npcm/Kconfig
>> @@ -1,5 +1,5 @@
>>   menuconfig ARCH_NPCM
>> -       bool "Nuvoton NPCM Architecture"
>> +       bool "Nuvoton NPCM Architecture" if ARCH_MULTI_V7
>>          select ARCH_REQUIRE_GPIOLIB
>>          select USE_OF
>>          select PINCTRL
>> @@ -10,7 +10,7 @@ if ARCH_NPCM
>>   comment "NPCM7XX CPU type"
>
>>   config ARCH_NPCM750
>> -       depends on ARCH_NPCM && ARCH_MULTI_V7
>> +       depends on ARCH_NPCM
>>          bool "Support for NPCM750 BMC CPU (Poleg)"
>>          select CACHE_L2X0
>>          select CPU_V7
>> --
>> 2.9.0
>
>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>
> Thanks!
