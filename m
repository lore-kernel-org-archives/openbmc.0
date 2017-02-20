Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRV503rT3zDq8X
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 14:49:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hBXC12Fi"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id x35so1972598qtc.1
 for <openbmc@lists.ozlabs.org>; Sun, 19 Feb 2017 19:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1GWRTMlNvKC7xhl+j6TSe5mmrwCr/LsWlb5CSAgT4tk=;
 b=hBXC12FiwmsZtdakSk9Vy0h40I3/E5LGwCd1mNM09Y9MvEPTb9hL5y/tyYfGKWE/gS
 QHHIMMvl98/atoxsAs+BvntD0MKc7ujeKRZu4+wwiKAB6cLoJhaVlrIGA2ydHjljsOLs
 tMow+e1AqyzQagvJkXfkmHkpruQxSNK/iebI5VyhaR2CMWy6u5yt/tl/vYUFYVf3Brm4
 ZPnu2rhxNuAwc51KCLp7Z85qaS5nMUc8TCWsZllXch+yIZCUD4O2I/LCZmB2q9Eh9fdw
 cGTfV4RvnaT4ddS/UWdDuv/wmeJfgPLeDaoe6RSH3tNoNbtnLz8e25imhOf+HUbVJuM7
 pPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1GWRTMlNvKC7xhl+j6TSe5mmrwCr/LsWlb5CSAgT4tk=;
 b=qa4Nqjlwp1FZl1Y+HzjlaF4+ksuhP5AgMBJURRI4YvXPMLlhn7reHBxx/NSHdVIRqD
 CK1pxMF4x7lOMMSCWXl/KnKDZx3sNFEDjRSd9Xe7UKS296wE+A8iaKoUVlbT47ymQ/bR
 60TyE4/GkaLMmu/yBu6e/IRq1KDMT0HyCFXyWXKy4StzNrv3sNB6RlzIg1j6DJ0RVdSW
 poW6SkfzmBiELtmZDkKnpKVxNd+fFiG3Kw4LBKgRyqPAvybWahA7VEgoE3TXNrqUnj61
 bFvQZoOP9E9ZsCouyRHHTzXr2zHDjPgWeiJGSKzy4/UmUlsOe3TKXsC2sGrKpts04m27
 LIoQ==
X-Gm-Message-State: AMke39nopgkH74xH7GVSoZBbUpzhEvIPOdgtuFkKthxgqvuoo5pRbvmgDFz5YNmQxoYSt4hq3FYQko/VikTguA==
X-Received: by 10.237.48.105 with SMTP id 96mr7348374qte.121.1487562592485;
 Sun, 19 Feb 2017 19:49:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Sun, 19 Feb 2017 19:49:52 -0800 (PST)
In-Reply-To: <CACPK8Xf5AgsKPMVuA8KUjrTrGc1j_2r4kMOC8kmX33wNRxGAFg@mail.gmail.com>
References: <1487424810-1469-1-git-send-email-mine260309@gmail.com>
 <CAARXrtmp_dhz_7jTTDh2+tKK_dOniWzz=KB0Lt9-pAOc-Wt80Q@mail.gmail.com>
 <CACPK8Xf5AgsKPMVuA8KUjrTrGc1j_2r4kMOC8kmX33wNRxGAFg@mail.gmail.com>
From: Mine <mine260309@gmail.com>
Date: Mon, 20 Feb 2017 11:49:52 +0800
Message-ID: <CAARXrtmY=y4Wc+9EA8zNW3fCueBBRhFm=2608qGAo=+58SL+3g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: aspeed: romulus: Do common setup
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 20 Feb 2017 03:49:57 -0000

Hi Joel,

On Mon, Feb 20, 2017 at 8:15 AM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Lei,
>
> On Sun, Feb 19, 2017 at 12:06 AM, Mine <mine260309@gmail.com> wrote:
>> I thought do_common_setup() is called by default, but actually it's not.
>> So Romulus needs to call do_common_setup() as well.
>
> We don't need most of what this is doing on any platform.
>
>>        /* Enable LPC FWH cycles, Enable LPC to AHB bridge */
>>        writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));
>
> This is performed by the LPC driver that Cyril has written.
>
>>        /* Set UART routing */
>>        writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
>
> This is the default. If we need to change it in the future we might
> write a pinmux driver, but for now we could omit this.
>
>>        /* Setup scratch registers */
>>        writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
>>        writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));
>
> We don't have a driver for this. Andrew was thinking about a UIO
> driver. Ben started a discussion[1] upstream about the preferred
> approach.

It means for now they are needed, before the UIO driver is implemented, is it?
So I assume Romulus will need do_common_setup() anyway, at least for
the current kernel.
Otherwise I'm afraid the VUART may not work since it requires register 0x174 to
be set to 0x00008000.

>
> [1] https://lkml.org/lkml/2017/2/17/30
>
> Cheers,
>
> Joel
>
>>
>> --
>> BRs,
>> Lei YU
>>
>> On Sat, Feb 18, 2017 at 9:33 PM, Lei YU <mine260309@gmail.com> wrote:
>>> Call do_common_setup for romulus.
>>> No other romulus specific setup is needed.
>>> Consider moving do_common_setup() to a common place.
>>>
>>> Signed-off-by: Lei YU <mine260309@gmail.com>
>>> ---
>>>  arch/arm/mach-aspeed/aspeed.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>>> index 2a11c2e..726b8fa 100644
>>> --- a/arch/arm/mach-aspeed/aspeed.c
>>> +++ b/arch/arm/mach-aspeed/aspeed.c
>>> @@ -218,6 +218,11 @@ static void __init do_witherspoon_setup(void)
>>>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>>>  }
>>>
>>> +static void __init do_romulus_setup(void)
>>> +{
>>> +       do_common_setup();
>>> +}
>>> +
>>>  #define SCU_PASSWORD   0x1688A8A8
>>>
>>>  static void __init aspeed_init_early(void)
>>> @@ -253,6 +258,8 @@ static void __init aspeed_init_early(void)
>>>                 do_zaius_setup();
>>>         if (of_machine_is_compatible("ibm,witherspoon-bmc"))
>>>                 do_witherspoon_setup();
>>> +       if (of_machine_is_compatible("ibm,romulus-bmc"))
>>> +               do_romulus_setup();
>>>  }
>>>
>>>  static void __init aspeed_map_io(void)
>>> --
>>> 1.9.1
>>>
