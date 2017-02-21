Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS9SR1fkvzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 17:24:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jo8e7QBP"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id i66so2325067yba.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 22:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OR8V28yF5WmseTeSFMbot+7yxMCh84C+YZVSmEgt9/w=;
 b=Jo8e7QBPFu3ntVzcMLNST3qw4BfwaLjTnmK9tbAIcdc6WvcmgF/wX1ITJXdSwy2vp9
 S4Iy64myLct0gDTcSKz8+10OWzLXZcWTtzwxuCR7w2m0M5NRVgxp62Ci0fcplH0upVd7
 Siy50fbdNgdvZlUzgTdQMf9Wg0aLdV4HqWSNT89vuW0YS9bEeWjLBuyWDTwfzrMmzvwz
 3KrmhSzpSTb+gfXgekhqt0KTmIvQ8V5mBeSAYiSvkly7Iul/oEd951e5RZO05Px3qDpb
 ex4mZanmXpwzTl/5YcYQc+k0U8cW/vbWhbuF05Q8JuoHIJB6/v3L4s4j+Ac9s0tkXT/w
 ydYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OR8V28yF5WmseTeSFMbot+7yxMCh84C+YZVSmEgt9/w=;
 b=g5BS1hFR06nqq5r1eqdGyV4GDN0URPOQviDzd5fKVBivM4BFcsGqVutrcp4GwHEnBR
 nYR6/dvi4ZApb0vjZrqtZtxyreaF7GhBcUWP0N3po4kQgTHqQst85G9W6se5mDHDifDh
 CyOscY+YRwFpAccgqO9PXAXhoFIFOUDnBshaoxj9qkUlUMykvNGy7BmyWj8MmqBBFsMO
 vx50rLd9+e1P4RGxH+/ZPbLRe2ECYJeVE8Xl+RdMLwloWT/LUklFJacWwNZWGMEIft5F
 S/uq6qLulURkiebdplQvGZBuOrjszlfW5aje2MAUPl2/txwT+t0H31JKcF2o91pxBCm3
 eC5Q==
X-Gm-Message-State: AMke39mn0BFxEkAZqKkA2pnxMJiE1lrwwFo6VtOvCcff5lVjKG4o47uUICL1p9xxRF0T+icOSNrEHOxNTO7pIA==
X-Received: by 10.37.70.66 with SMTP id t63mr19302721yba.196.1487658245026;
 Mon, 20 Feb 2017 22:24:05 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 22:23:44 -0800 (PST)
In-Reply-To: <CAARXrtmY=y4Wc+9EA8zNW3fCueBBRhFm=2608qGAo=+58SL+3g@mail.gmail.com>
References: <1487424810-1469-1-git-send-email-mine260309@gmail.com>
 <CAARXrtmp_dhz_7jTTDh2+tKK_dOniWzz=KB0Lt9-pAOc-Wt80Q@mail.gmail.com>
 <CACPK8Xf5AgsKPMVuA8KUjrTrGc1j_2r4kMOC8kmX33wNRxGAFg@mail.gmail.com>
 <CAARXrtmY=y4Wc+9EA8zNW3fCueBBRhFm=2608qGAo=+58SL+3g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 16:53:44 +1030
X-Google-Sender-Auth: f139rZzqyWOozDylsayIy4CCoVA
Message-ID: <CACPK8XfeyNqZNpkwBUy3MG8C6XHvMSb0uswfp0pigbFb9E9iRQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: aspeed: romulus: Do common setup
To: Mine <mine260309@gmail.com>
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
X-List-Received-Date: Tue, 21 Feb 2017 06:24:07 -0000

On Mon, Feb 20, 2017 at 2:19 PM, Mine <mine260309@gmail.com> wrote:
> Hi Joel,
>
> On Mon, Feb 20, 2017 at 8:15 AM, Joel Stanley <joel@jms.id.au> wrote:
>> Hi Lei,
>>
>> On Sun, Feb 19, 2017 at 12:06 AM, Mine <mine260309@gmail.com> wrote:
>>> I thought do_common_setup() is called by default, but actually it's not.
>>> So Romulus needs to call do_common_setup() as well.
>>
>> We don't need most of what this is doing on any platform.
>>
>>>        /* Enable LPC FWH cycles, Enable LPC to AHB bridge */
>>>        writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));
>>
>> This is performed by the LPC driver that Cyril has written.
>>
>>>        /* Set UART routing */
>>>        writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
>>
>> This is the default. If we need to change it in the future we might
>> write a pinmux driver, but for now we could omit this.
>>
>>>        /* Setup scratch registers */
>>>        writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
>>>        writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));
>>
>> We don't have a driver for this. Andrew was thinking about a UIO
>> driver. Ben started a discussion[1] upstream about the preferred
>> approach.
>
> It means for now they are needed, before the UIO driver is implemented, is it?
> So I assume Romulus will need do_common_setup() anyway, at least for
> the current kernel.
> Otherwise I'm afraid the VUART may not work since it requires register 0x174 to
> be set to 0x00008000.

Okay. We can include this one for now while the UIO driver is developed.

Applied to dev-4.7.

Cheers,

Joel

>
>>
>> [1] https://lkml.org/lkml/2017/2/17/30
>>
>> Cheers,
>>
>> Joel
>>
>>>
>>> --
>>> BRs,
>>> Lei YU
>>>
>>> On Sat, Feb 18, 2017 at 9:33 PM, Lei YU <mine260309@gmail.com> wrote:
>>>> Call do_common_setup for romulus.
>>>> No other romulus specific setup is needed.
>>>> Consider moving do_common_setup() to a common place.
>>>>
>>>> Signed-off-by: Lei YU <mine260309@gmail.com>
>>>> ---
>>>>  arch/arm/mach-aspeed/aspeed.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>>>> index 2a11c2e..726b8fa 100644
>>>> --- a/arch/arm/mach-aspeed/aspeed.c
>>>> +++ b/arch/arm/mach-aspeed/aspeed.c
>>>> @@ -218,6 +218,11 @@ static void __init do_witherspoon_setup(void)
>>>>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>>>>  }
>>>>
>>>> +static void __init do_romulus_setup(void)
>>>> +{
>>>> +       do_common_setup();
>>>> +}
>>>> +
>>>>  #define SCU_PASSWORD   0x1688A8A8
>>>>
>>>>  static void __init aspeed_init_early(void)
>>>> @@ -253,6 +258,8 @@ static void __init aspeed_init_early(void)
>>>>                 do_zaius_setup();
>>>>         if (of_machine_is_compatible("ibm,witherspoon-bmc"))
>>>>                 do_witherspoon_setup();
>>>> +       if (of_machine_is_compatible("ibm,romulus-bmc"))
>>>> +               do_romulus_setup();
>>>>  }
>>>>
>>>>  static void __init aspeed_map_io(void)
>>>> --
>>>> 1.9.1
>>>>
