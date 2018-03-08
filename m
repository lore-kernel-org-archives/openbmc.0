Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::242; helo=mail-ot0-x242.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZDVsUtRC"; 
 dkim-atps=neutral
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxnHb0sY9zF1qZ
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 21:46:18 +1100 (AEDT)
Received: by mail-ot0-x242.google.com with SMTP id f11so4973953otj.12
 for <openbmc@lists.ozlabs.org>; Thu, 08 Mar 2018 02:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XlpYLkZSljCexmXwWeRPzLBzc2mUH+lAgcutniUpA2A=;
 b=ZDVsUtRCsCKp7UwsRNetbkLToIO/b27qxVhEgbPPAGCPZ+0rWTWMcIGEZTJ3G+Ij4o
 J0MQVwU/9ZUR5+eBO/HwobgS8TfduoSW8LP4dRrOEQ16ibailI/jpaDYiwbi1H3pAsF+
 lUOfd9S7ipOFZu7SUYxFn7Fb0gVvGo/2ZL3YRRyMuU8qFSgtrYjx3z4LklNAhOBWe1dt
 QsVwod4k3JhvAle/OVXC7MhWaN+1b56eSfnn8Y/oPJ3sj7V6APqV42pOU7HR96WvkFf9
 GQqrIPZ6REXHvLKKwQ/Eem/NaGlAHHz8Hz2N/SyMrL2e0P1krVGDUby5SPVBR3zokAcO
 0UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XlpYLkZSljCexmXwWeRPzLBzc2mUH+lAgcutniUpA2A=;
 b=dvBQptXVQCs0Sv8iohMbURHa1Rq+PwjkfsSqu+UbELJV0X/11cl3LjqoLHz0NwGorf
 DVIaHvR2b3TIw/DDJ83aIrLAvv8B6x9OKH34W2ZXwcTFv47aSUtQnqeOSpFyQDku+hHT
 JVxxWLWY3XTMvYuds87cmqgFO8n5H95pnahuO1X0iMQUGhX7cCcp69skooWuDBI+BwFM
 JVBoUX0WqHQfOq7iRA2N1mUwafAICQ7uMRyQNSvxWOD2fB+vT4foIEsVX3X48/GoeFMZ
 gZj1jVlvnxqxs7d+Y+9tZuhnrjmrgcuZzVGAW6RGDB5fqTjCL6gfLQxtqlkD1sLaKXJ5
 CLfg==
X-Gm-Message-State: AElRT7FolIZ9V6kbtTQupwTlpFUXPq4bnurg8Eh6BwfyHKOFg3xXXHcf
 V2UrG4++dto7vbXeMxo3GMe9rf+RHVNee6FUag==
X-Google-Smtp-Source: AG47ELtlrXzy8+urtVgrCqssLTGTjFdFEH46fk73aR8VQgr61D3mVDMT1xiLq45V1e55GTFXed53oHV8QDZH3LtdaAQ=
X-Received: by 10.157.69.152 with SMTP id x24mr16948343ote.126.1520505976584; 
 Thu, 08 Mar 2018 02:46:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.4 with HTTP; Thu, 8 Mar 2018 02:46:16 -0800 (PST)
In-Reply-To: <CACPK8XeVMSeQNkPNp1_vms97H_9rMuk1-DzUAc=s-7o=FmVncw@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <20180307162430.2664523-2-arnd@arndb.de>
 <CACPK8XeVMSeQNkPNp1_vms97H_9rMuk1-DzUAc=s-7o=FmVncw@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Thu, 8 Mar 2018 12:46:16 +0200
Message-ID: <CAKKbWA5F29HJFOTNfVmt14Qg5rMgrLSsHjY4NQESZL6OKmA95w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: npcm: drop extraneous 'select' statements
To: Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomer Maimon <tmaimon77@gmail.com>, 
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
X-List-Received-Date: Thu, 08 Mar 2018 10:46:19 -0000

So at least replace CACHE_L2X0 with MIGHT_HAVE_CACHE_L2X0 then
CACHE_L2X0 will be selected by default and user can still remove it.

On Thu, Mar 8, 2018 at 4:12 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Mar 8, 2018 at 2:54 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> While looking at the build regression, I noticed that the
>> platform selects a lot of other Kconfig symbols that it really
>> should not:
>>
>> CPU_V7, ARM_GIC, HAVE_SMP, COMMON_CLK, GENERIC_CLOCKEVENTS,
>> and CLKDEV_LOOKUP are all implied by ARCH_MULTI_V7, so they
>> can be dropped.
>>
>> CACHE_L2X0, SMP and USB are meant to be user-selectable, we
>> want to be able to turn those off for testing purposes.
>>
>> CPU_USE_DOMAINS looks completely misplaced here, we should not
>> select that for an ARMv7 platform.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I had a similar patch queued for sending out. Thanks Arnd.
>
> Acked-by: Joel Stanley <joel@jms.id.au>
>
> Cheers,
>
> Joel
>
>> ---
>>  arch/arm/mach-npcm/Kconfig | 18 ------------------
>>  1 file changed, 18 deletions(-)
>>
>> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
>> index 2bc6697c8d97..c6a16230e8ef 100644
>> --- a/arch/arm/mach-npcm/Kconfig
>> +++ b/arch/arm/mach-npcm/Kconfig
>> @@ -12,12 +12,6 @@ comment "NPCM7XX CPU type"
>>  config ARCH_NPCM750
>>         depends on ARCH_NPCM
>>         bool "Support for NPCM750 BMC CPU (Poleg)"
>> -       select CACHE_L2X0
>> -       select CPU_V7
>> -       select ARM_GIC
>> -       select HAVE_SMP
>> -       select SMP
>> -       select SMP_ON_UP
>>         select HAVE_ARM_SCU
>>         select HAVE_ARM_TWD if SMP
>>         select ARM_ERRATA_720789
>> @@ -26,18 +20,6 @@ config ARCH_NPCM750
>>         select ARM_ERRATA_794072
>>         select PL310_ERRATA_588369
>>         select PL310_ERRATA_727915
>> -       select USB_EHCI_ROOT_HUB_TT
>> -       select USB_ARCH_HAS_HCD
>> -       select USB_ARCH_HAS_EHCI
>> -       select USB_EHCI_HCD
>> -       select USB_ARCH_HAS_OHCI
>> -       select USB_OHCI_HCD
>> -       select USB
>> -       select FIQ
>> -       select CPU_USE_DOMAINS
>> -       select GENERIC_CLOCKEVENTS
>> -       select CLKDEV_LOOKUP
>> -       select COMMON_CLK if OF
>>         select NPCM750_TIMER
>>         select MFD_SYSCON
>>         help
>> --
>> 2.9.0
>>
