Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::233; helo=mail-qt0-x233.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MfxWl7Xr"; 
 dkim-atps=neutral
Received: from mail-qt0-x233.google.com (mail-qt0-x233.google.com
 [IPv6:2607:f8b0:400d:c0d::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xn4Yk46yzzDrJL
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 10:42:49 +1000 (AEST)
Received: by mail-qt0-x233.google.com with SMTP id i50so16402464qtf.0
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 17:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0eNLMu1mwaj+pmMymgBbdfxkVmc6naS5nehHrb3ILbk=;
 b=MfxWl7Xr2/1ef8PLdb4tUlKW4+Y/wTE5HIK8jFaBAKVD3q6VVy5z5dRuHKE8DQj5DV
 wxgetynp3Zc/Jl/9HH7yQQ20lmMDQdrG4ZkIAE1ew6Jz/SwhLzMZ3Nb/9wWq0e3oJQvT
 56lN39h/2QoJg8F2OuzBoC1fIRp/7tzPcss4drzZz3OpY4OgXChbpUTZxoYYmjHjYDW5
 iQa1kbg9WOuXynQO3riYNVnNNDsJoW0tfW8BSMua+VmL/lgFSvABqNS7XGZxeY4mVFMV
 x6lQGviCWYLgBqvJYh/kOQRE2dvnp4F3aAZ2zVMVvsLj9USLYkUAYU4awsYualDCc/qK
 TLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0eNLMu1mwaj+pmMymgBbdfxkVmc6naS5nehHrb3ILbk=;
 b=FBW26UERMbq+xyvIKY/0q/N8OPxHzaaqYzFYoUPKt/bBrnihpSWsizPHFeDvKdxWJj
 +f/aV2w+knqCkO1Mu4aOsXSzf/BYy8YCx36oI6G8hJEQ4LC/hHA11RrjcPxsfHTSn2a0
 6affO0qgp1McdWVX0qW6fU1vZCrmxfCHUf70MNWBqpA5f9QnWC8qZOojgfFDOva3F7Q8
 KyPAyualEoxXf6h6ONzwoN23M92vvLbofOj5W8oy9/TFGzU+kXdJI8fUu93sL3JEFJsO
 6LJkQ3ZCKFLK3vFDle4ssE2sd1fotAGr4x7TKV3h97d4RsQQugzCT1HeHQN20QRvlubA
 WvvQ==
X-Gm-Message-State: AHPjjUhHbEQ4ZNEy33JDKnuNPokP+pYVI6tm6RwbzosvQoHixpNun8Vv
 awL2VRY4TZqfHk70dJso9J1+UzSy36M2
X-Google-Smtp-Source: ADKCNb4ZGyf3ttQdaoUKuVNLNsOA+wCZOo1fP/TZkqckN0IP2UY1hWHuK10dVoHpf43GPJiJ4P3Vnxg8DX5AqJsdRbA=
X-Received: by 10.237.43.67 with SMTP id p61mr1347551qtd.172.1504658566944;
 Tue, 05 Sep 2017 17:42:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.33.197 with HTTP; Tue, 5 Sep 2017 17:42:46 -0700 (PDT)
In-Reply-To: <8fd55a57-946d-f53f-e10b-c73d1f70d1dc@gmail.com>
References: <20170831225400.19756-1-brendanhiggins@google.com>
 <20170831225400.19756-2-brendanhiggins@google.com>
 <8fd55a57-946d-f53f-e10b-c73d1f70d1dc@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 5 Sep 2017 17:42:46 -0700
Message-ID: <CAFd5g45W0jBFe-Uhjv07fxsaxtAbHmxkJU=RQu+qWT=Ohf8s+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm: npcm: add basic support for Nuvoton BMCs
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, 
 Rick Altherr <raltherr@google.com>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 00:42:51 -0000

With the exception of one comment, which I have responded to
below, I have addressed your comments in my new version of
this patch: https://patchwork.kernel.org/patch/9914153/

On Mon, Sep 4, 2017 at 7:47 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
...
>> +
>> +ENTRY(v7_invalidate_l1_npcmX50)
>> +     mov     r0, #0
>> +     mcr     p15, 0, r0, c7, c5, 0 /* invalidate I cache */
>> +     mcr     p15, 2, r0, c0, c0, 0
>> +     mrc     p15, 1, r0, c0, c0, 0
>> +
>> +     ldr     r1, =0x7fff
>> +     and     r2, r1, r0, lsr #13
>> +
>> +     ldr     r1, =0x3ff
>> +
>> +     and     r3, r1, r0, lsr #3 /* NumWays - 1 */
>> +     add     r2, r2, #1         /* NumSets */
>> +
>> +     and     r0, r0, #0x7
>> +     add     r0, r0, #4 /* SetShift */
>> +
>> +     clz     r1, r3     /* WayShift */
>> +     add     r4, r3, #1 /* NumWays */
>> +1:   sub     r2, r2, #1 /* NumSets-- */
>> +     mov     r3, r4     /* Temp = NumWays */
>> +2:   subs    r3, r3, #1 /* Temp-- */
>> +     mov     r5, r3, lsl r1
>> +     mov     r6, r2, lsl r0
>> +     /* Reg = (Temp << WayShift) | (NumSets << SetShift) */
>> +     orr     r5, r5, r6
>> +     mcr     p15, 0, r5, c7, c6, 2
>> +     bgt     2b
>> +     cmp     r2, #0
>> +     bgt     1b
>> +     dsb
>> +     isb
>> +     mov     pc, lr
>> +ENDPROC(v7_invalidate_l1_npcmX50)
>
> This looks a lot, if not nearly the same thing as v7_invalidate_l1 which
> is already called by secondary_startup, can you see if you can re-use it
> directly?
>
>> +
>> +/*
>> + * MSM specific entry point for secondary CPUs.  This provides
>> + * a "holding pen" into which all secondary cores are held until we're
>> + * ready for them to initialise.
>> + */
>
> Assuming this was copied from a Qualcomm MSM routine, you may want to
> fix the comment, typo on "initialis.
>
>> +ENTRY(npcm7xx_secondary_startup)
>> +     msr     CPSR_c, #(SVC_MODE)
>
> Is there a BootROM or something that would not make the secondary cores
> start in supervisor mode?

Unfortunately, yes; however, I was able to cut all of the other code out of
npcm7xx_secondary_startup, so now it just puts the core in SVC mode and
relies on secondary_startup to do all of the L1 cache invalidation.

>
>> +
>> +     bl      v7_invalidate_l1_npcmX50
>> +     /* disable vector table remapping */
>> +     mrc     p15, 0,r0, c1, c0, 0
>> +     and     r0, #0xffffdfff
>> +     mcr     p15, 0,r0, c1, c0, 0
>> +
>> +#ifdef CONFIG_CACHE_L2X0
>> +     /* Enable L1 & L2 prefetch + Zero line */
>> +     mrc     p15, 0, r0, c1, c0, 1
>> +     orr     r0, r0, #(7 << 1)
>> +     mcr     p15, 0, r0, c1, c0, 1
>> +#endif /* CONFIG_CACHE_L2X0 */
>> +
>> +     mrc     p15, 0, r0, c0, c0, 5
>> +     and     r0, r0, #15
>> +     adr     r4, 1f
>> +     ldmia   r4, {r5, r6}
>> +     sub     r4, r4, r5
>> +     add     r6, r6, r4
>> +     str r3,[r2]
>> +
>> +pen: ldr     r7, [r6]
>> +     cmp     r7, r0
>> +     bne     pen
>> +
...
