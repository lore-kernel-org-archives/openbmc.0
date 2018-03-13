Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::244; helo=mail-io0-x244.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nr4EzhaZ"; 
 dkim-atps=neutral
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400wpQ5SqqzDqYR
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 00:35:25 +1100 (AEDT)
Received: by mail-io0-x244.google.com with SMTP id v10so120231iob.6
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=R8czH3Wk4Iq9YRh1jRkglnF66zYi/pkhV/yJR8qBM+g=;
 b=Nr4EzhaZdbSN707NeCyPnnAA2S0JcExC+s5/GfxHSMDOZpjPBNsJV66TLbjOR7PtEe
 lbwuL09c757uD0SIqorP76iIYg9w60/lYiBSlOHkK0ZgGustf1h1dP5rDsGsWgmtDPES
 X+3aUKjmH8frbU3yEA0twTmSyixwtOkgaX92qfW8grRi+eyYSwlvUReFNuCgoK3UOhwt
 jUSxECpQhJveSD9x8bV6zZFKN+7vQBT/lSxqiqwyqyeIeyJVVXJ8YmTFZM07F8pmuo2i
 Y1iTF04xZ8ZH+bJJCrRsVgS46h/i2l8tcXsr/AtGdPqZStoKFVCHEB3bZACgyYSZ8wnM
 PUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=R8czH3Wk4Iq9YRh1jRkglnF66zYi/pkhV/yJR8qBM+g=;
 b=iLaDw/rxJLXRgVbly2AxsXN/K89+hV39C/cH3QciVjdkzulGLsiY/ISDzBKHuRqqW9
 mkFAjmgQUueaSkFyGgzoDE6MJj2CxJDJqUQwW3HfeLtZ+jznbS5sSGoxgcooaR6w+hJu
 XEgp4QaBcccHW2lA1ye5YZtroFksioDOhy2+L+rzRbVS+mpq62zG8CUtxPUZz364UG0C
 3c32mn1oS+Qhz+35Swq2qQssNjIKOk53laFsvSoQmz33/cBp5B6hrAfUc3Z2b95fTT3e
 ueA1gE3JK43SmDXTuqGYEDb/c1GsyXqArhcOPtCg/p0JCnGB4fhilzQ/0CSC852+FcXM
 HgCA==
X-Gm-Message-State: AElRT7HjSBMPwtCxzsksYy3CqIW11V8D/0q8ywVigQeDXP7KlhtEVy7a
 dS3AitIVOhuqTgyuE7wAzhoUjAlAy+zPLwd/Hsk=
X-Google-Smtp-Source: AG47ELvlViG/NpMdmRH/5F8eJU7IPLQ5D+GInstKjE2oi8eJDYKDkhs26OGokR0pa7PxH5tJF4FclNlo7jl6ub1w69w=
X-Received: by 10.107.165.146 with SMTP id o140mr709806ioe.52.1520948120536;
 Tue, 13 Mar 2018 06:35:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.183.17 with HTTP; Tue, 13 Mar 2018 06:35:20 -0700 (PDT)
In-Reply-To: <CAP6Zq1iOxFTuUvp02qOtgpmfH7HA-1eZ9KG6AtU0zn6CpPCrzw@mail.gmail.com>
References: <20180307162430.2664523-1-arnd@arndb.de>
 <CAFd5g45h3wAZtx-4oJb_uLbtDTzSsD6eLM5G0VF=3BBHNmW8YQ@mail.gmail.com>
 <CAP6Zq1jEAg2OrmnHzJdk9UBjPkDctu5oGHYyJ+QLBzN+E31sPw@mail.gmail.com>
 <CAK8P3a2=0ZUqyhmKVa4u_VvOg4rtd6vUWdpRojfsoP3OSvGyeQ@mail.gmail.com>
 <CAP6Zq1iOxFTuUvp02qOtgpmfH7HA-1eZ9KG6AtU0zn6CpPCrzw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 13 Mar 2018 15:35:20 +0200
Message-ID: <CAP6Zq1h+6GGrnUEcjZWtBPBKDGxL+6+OG0itJD_FHD1MAcYmsQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Mar 2018 13:35:27 -0000

Hi Arnd,

I sent now Full patch for the NPCM BMC's V12,

Is it O.K.? or do you want me to send the same patch to ARM: npcm:
drop extraneous 'select' statements as well?

Thanks

Tomer


On 12 March 2018 at 17:15, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Hi Arnd,
>
> I will send tomorrow new version with some modification we need to do
> once we use NPCM7XX and not NPCM750.
>
> Brendan,
>
> Is it O.K.?
>
>
>
> On 12 March 2018 at 15:37, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Mar 12, 2018 at 2:28 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>> Hi Brendan,
>>>
>>> According to the last mail I have with Arnd can you modify the Kconfig
>>> as follow:
>>>
>>> +menuconfig ARCH_NPCM
>>> +       bool "Nuvoton NPCM Architecture"
>>> +       depends on ARCH_MULTI_V7
>>> +       select PINCTRL
>>> +
>>> +if ARCH_NPCM
>>> +
>>> +config ARCH_NPCM7XX
>>> +       bool "Support for NPCM7xx BMC (Poleg)"
>>> +       depends on ARCH_MULTI_V7
>>> +       select PINCTRL_NPCM7XX
>>> +       select NPCM7XX_TIMER
>>> +       select ARCH_REQUIRE_GPIOLIB
>>> +       select CACHE_L2X0
>>> +       select ARM_GIC
>>> +       select HAVE_ARM_TWD if SMP
>>> +       select HAVE_ARM_SCU if SMP
>>> +       select ARM_ERRATA_764369 if SMP
>>> +       select ARM_ERRATA_720789
>>> +       select ARM_ERRATA_754322
>>> +       select ARM_ERRATA_794072
>>> +       select PL310_ERRATA_588369
>>> +       select PL310_ERRATA_727915
>>> +       select MFD_SYSCON
>>> +       help
>>> +         General support for NPCM7xx BMC (Poleg).
>>> +
>>> +         Nuvoton NPCM7xx BMC based on the Cortex A9.
>>> +
>>> +endif
>>
>> One more change is needed to avoid a link error without CONFIG_SMP:
>>
>> diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
>> index c7a1316d27c1..34d51f9f207c 100644
>> --- a/arch/arm/mach-npcm/Makefile
>> +++ b/arch/arm/mach-npcm/Makefile
>> @@ -1,3 +1,4 @@
>>  AFLAGS_headsmp.o               += -march=armv7-a
>>
>> -obj-$(CONFIG_ARCH_NPCM750)     += npcm7xx.o platsmp.o headsmp.o
>> +obj-$(CONFIG_ARCH_NPCM750)     += npcm7xx.o
>> +obj-$(CONFIG_SMP)              += platsmp.o headsmp.o
>>
>> Can one of you send me a pull request or the full patch series on top
>> of the version I have in arm-soc?
>>
>>       Arnd
