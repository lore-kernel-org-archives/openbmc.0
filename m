Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 31EC21A00A5
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 21:20:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=dP+Eq/BV; 
 dkim-atps=neutral
Received: by mail-vk0-x233.google.com with SMTP id c3so73124318vkb.3
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 02:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2oxqIUPaS8z5PsBLSVZy6pkZXouaFJJZHAQhr0KtNdg=;
 b=dP+Eq/BVSoJ00P1LNnIzsawg7xBOzVQDw29tQdK8C1yavdtm9V6atdVxaxa06nOkS4
 X/M62cRE50D34Ic4JCtTMP1uBHLgMjzn+PmzBOuSPysZr+h5jdLNr1k8HrF1b2Gf8EbM
 XlRPUj4ZVhOeSZ8lFfYLhOpHrfTLTiUXahTJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2oxqIUPaS8z5PsBLSVZy6pkZXouaFJJZHAQhr0KtNdg=;
 b=nAywwPSJeYek/W9GoghLn6+/LqTYmMs5vOA7o+h1F10JkAq+XH8oj4BfjhkjF2r8jb
 aD97eLRVHoHhl/IowIm4Vup1ihBEjAbfWlhFspMpY8BufUag3Li8VFiLZnPGUtv+mRjO
 bCZNE0KwURqfmf/DKAviaqUcc1NEm84sRjmLRZjCzHbtHn0wFgGOmpIM4ytJaEy4tpA7
 k0YCid5DKrkhYqKjsKM6k31rMBfI6rOToLThEl0wLyQAjUbaZ7rhCrP6AgIrG7P8On+L
 gYY+FgQ43u75qsIB46I7746j4RrGTGuEmF09IuUy7Gm/NsyPcs7i9oF3523mpnEdR7xp
 4vNg==
X-Gm-Message-State: AD7BkJL1M0vVicnhrMqtwiwO35OoInkE286ro1apSalsICd6rvSHxh/B4ryIO/28Ws0megNTvSO8NhWHcTvGar3K
X-Received: by 10.31.141.2 with SMTP id p2mr475420vkd.37.1456482023539; Fri,
 26 Feb 2016 02:20:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 02:20:04 -0800 (PST)
In-Reply-To: <1456456460.27420.147.camel@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-2-git-send-email-andrew@aj.id.au>
 <CAFEAcA9MJtKbNR+XvqgU_c6SJc0QWg7VGMknWmrr3qiDL6aeng@mail.gmail.com>
 <1456456460.27420.147.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 10:20:04 +0000
Message-ID: <CAFEAcA8vH6vOMi88DLOxe8Z8XC+dECytsVth2zsToBd_9MH3SQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/timer: Add ASPEED AST2400 timer
 device model
To: Andrew Jeffery <andrew@aj.id.au>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Sat, 27 Feb 2016 03:54:26 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2016 10:20:28 -0000

On 26 February 2016 at 03:14, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Peter,
>
> On Thu, 2016-02-25 at 16:11 +0000, Peter Maydell wrote:
>> On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > Implement basic AST2400 timer functionality: Timers can be configured,
>> > enabled, reset and disabled.
>> >
>> > A number of hardware features are not implemented:
>> >
>> > * Timer Overflow interrupts
>> > * Clock value matching
>> > * Pulse generation
>> >
>> > The implementation is enough to boot the Linux kernel configured with
>> > aspeed_defconfig.
>>
>> Thanks; this mostly looks in reasonable shape; I have some comments below.
>>
>> Do we have a datasheet for this chip ?
>
> Unfortunately I don't know of a publicly available datasheet. What's
> the best way to proceed in this case?

We have devices in the tree that are either based on non-public datasheets
or occasionally reverse engineered from Linux kernel drivers. That's OK,
but it's nice to be clear in a comment at the top what the source is,
so people maintaining it later know how much to trust the current code
and (if possible) where to look for clarification.

>> All source files need to #include "qemu/osdep.h" as their first
>> include. That then means you don't need to include assert.h or
>> stdio.h yourself.
>>
>> What do we need from qemu/main-loop.h?
>
> I'm using it for qemu_bh_new() which is required by ptimer, who registers
> the aspeed_timer_tick() callback into the main loop timer handling.

OK, no problem.

>> > +static void aspeed_timer_irq_update(AspeedTimer *t)
>> > +{
>> > +    qemu_set_irq(t->irq, t->enabled);
>>
>> Surely the timer doesn't assert its IRQ line all
>> the time it's enabled? This doesn't look like the right condition.
>
> So I think this is correct despite how it looks. There's some cruft
> from modelling the implementation off of another timer that's probably
> obscuring things, which should be fixed. aspeed_timer_irq_update()
> is only called from aspeed_timer_tick(), so I'll just merge the two.
> Then by renaming aspeed_timer_tick() to aspeed_timer_expire() as
> mentioned above, this won't look so strange? I've read through the
> timer handling code (the processing loop in timerlist_run_timers())
> and my understanding is it has the behaviour we want - callback on
> expiry, not on ticks - which is not how it reads as above.

Usually functions in QEMU called thingy_irq_update() are the ones
that do "look at current state of device and assert IRQ as
necessary"; often this is "mask irq raw state against some
irq-masking bit". Merging this into the timer expire function will
probably help. (Is there no register bit that the guest can query
that indicates "timer expired" or "raw interrupt state" ?)

>> You should implement a VMState struct for device migration,
>> and wire it up here via dc->vmsd.
>
> I'll look into it. I started experimenting with a VMState struct
> early on in the implementation but threw it away as it wasn't my
> primary focus at the time.

We insist on vmstate structs for all new devices, because
they're fairly easy to implement, and if the original
submitter doesn't implement one then the device becomes
a landmine for any user trying migration or vmstate snapshots,
because it will silently misbehave.

thanks
-- PMM
