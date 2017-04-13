Return-Path: <kunyi@google.com>
Received: from mail-lf0-x235.google.com (mail-lf0-x235.google.com
 [IPv6:2a00:1450:4010:c07::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3xjG3dlgzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 09:25:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o8TTAANw"; 
 dkim-atps=neutral
Received: by mail-lf0-x235.google.com with SMTP id h125so36224472lfe.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 16:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uvvYzZcbDV2LtkbGBP2tvFK1oxAZcVJOlI053XiTeDk=;
 b=o8TTAANwrx7OjOb1KCZXA5f8HLjGR3W3Z8wUck2K6Oyljy8v/7t8aKU2Cl68YSz18+
 y4/cY9NUcY+Vh5bUjJmuqwJXxDgGxuedNqDRT/7SyJTUTP6Y8IZ59mOFaqpo2yauKa8D
 NRaE82E5CZiYyAYy2ujQ9UTtU5rH29FsiMXQA2q/CD+qD4T0rmG0bbMnGvdeUwcMSSKc
 l69ztekOHF7hpLZBqzWFE7NSBsIfNfmNbRkfy7BqBE3Culzt0C+LA5h1Qirf0owi5IT/
 ZJmBiJ3XAHho05tnyvj/BYBhss5Gr25vDFkFsHuQAKVTeuVKZyJH4BsxtkkCX5x51LT/
 MP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uvvYzZcbDV2LtkbGBP2tvFK1oxAZcVJOlI053XiTeDk=;
 b=IlhgpM+V63V/HkQ0rNYpM7WG/aXQktaNlEncXHbE5rHHZp69tY21f2IKnl5z8s5Pvk
 vNkoL8QKrScdggSbWYenWuwf/PCXWxOhcgBXA16/CEjfCpyyetQJVlCpQ8t8wwSvwxyV
 frH4FdMx9vG6l+vdivOku6wQY1CNEsCG46setPc13/dYxRzBP9BqSkOzt1xUl/3SRwN1
 QSJ4rrkt7U2AL5z9gQrSKM+IQr0pIO+K0fZogHbXu6wQrI6pz0FIXMAuytAI32hPklLV
 Bq5hlCkyKDhX8+SkKR1Z+1G/sDcK1MY+J77U+9wprgLJa4MLioyOgkMcoNBAzA2iFV1m
 f2gQ==
X-Gm-Message-State: AN3rC/7s5fq4lHCKFGFzEzZpuXvCR1Qay8juqgUwn40mFn0KKdFJ8M8n
 q5txWTmfXENr3F2HQ2CnTEg690Op/Gwp
X-Received: by 10.25.213.140 with SMTP id m134mr1970730lfg.171.1492125918209; 
 Thu, 13 Apr 2017 16:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.33.143 with HTTP; Thu, 13 Apr 2017 16:24:47 -0700 (PDT)
In-Reply-To: <1491793973.3829.2.camel@aj.id.au>
References: <3ca9e8a5-4135-8fa3-cbf5-62543a89a491@linux.vnet.ibm.com>
 <1491524060.5817.8.camel@aj.id.au>
 <7459b361-8c6f-aeb8-e434-f3725549adf3@linux.vnet.ibm.com>
 <1491793973.3829.2.camel@aj.id.au>
From: Kun Yi <kunyi@google.com>
Date: Thu, 13 Apr 2017 16:24:47 -0700
Message-ID: <CAGMNF6VXasVL65b4G4vmBGSLvMD5QkgA3nomKLp0Ed8f3GWA+g@mail.gmail.com>
Subject: Re: Discussion on GPIO monitoring and design thoughts.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 13 Apr 2017 23:25:23 -0000

What about applications that need to monitor and set GPIOs rather than
monitoring them only? gpio-keys won't be suitable, and new cdev
interface doesn't support writing to GPIOs yet.
Also could someone point me to 'libgpio' interfaces mentioned here?
I'm interested whether it provides a good read/write/interrupt trigger
etc. interface.

Thanks,
Kun

On Sun, Apr 9, 2017 at 8:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2017-04-07 at 12:11 +0530, vishwa wrote:
>> > On Wed, 2017-04-05 at 13:56 +0530, vishwa wrote:
>> > > We had a technical discussion on HOWTO and what is the right thing to do
>> > > handling the GPIO assertion and here is the gist.
>> > >
>> > > 1) Use gpio-keys and utilize libevdev wrappers (
>> > > https://www.freedesktop.org/software/libevdev/doc/latest/ ) to watch for
>> > > data in /dev/input/event.
>> >
>> > Okay, I'd like you to step back and detail what problem you're actually
>> > trying to solve here. Going from wanting to handle GPIO interrupts to
>> > using gpio-keys everywhere needs some explanation. We have at least two
>> > other interfaces that would appear to be sufficient: GPIO chardev and
>> > sysfs.
>>
>> Sure. I realize I should have put the use-case here than at the end.
>>
>> Problem: When the host check-stops, we need a way to detect that.
>> The existing mechanism will assert a configured GPIO when that happens.
>> Firmware code needs a way of knowing that it has happened and that is why this application.
>>
>> I was told that /sysfs is being deprecated and that we use the chardev. We had 2 options then.
>>
>> 1/. Use the gpio-keys
>> 2/. Use libgpio ( the support is not in yet in 4.7 per the discussion )
>>
>> Brad Bishop recommended that gpio-keys be used over libgpio due to the debouncing support built into gpio-keys implementation.
>> Since I am not an expert in this area, I suggest you please talk to Brad if you see there are better ideas.
>
> I've since had a chat with Brad and Vishwa. There's currently no
> perfect fit solution to the problem, so given:
>
> 1. We're only dealing with input GPIOs
> 2. gpio-keys enables the description of debounce periods (through
> devicetree)
> 3. At least *some* GPIOs need debouncing
>
> I'm okay if we proceed this way.
>
> Considering the current state of the kernel and alternatives to the
> above, if 1. weren't the case then we would have a weird split between
> /dev/input and either the GPIO chardev interface or sysfs, so given 1.
> we've at least got consistency. Similarly for 2. and 3. we will
> probably run into issues if we split input GPIOs between gpio-keys and
> the alternative interfaces, as we may in the future find we need to
> enable debouncing on a GPIO which would trigger user-space breaking
> migration from one approach to the other.
>
> We do have the downside of assigning keycodes to GPIOs. This could be
> an arbitrary (e.g. linear, as-needed) assignment, or we could do
> something like set the keycode to the GPIO line's index (e.g. GPIOA0 =
> 0, GPIOZ7 = 215, etc). This would at least give some meaning to the
> values and so we hopefully have no reason to change them in the future.
> I don't think there are any limitations to the keycode value we can use
> (e.g. max 255), so even if the Aspeed chips expand the number of
> available GPIOs in the future we should be okay.
>
> As to why we can't configure debounce periods via say the chardev
> interface, this is something I will ask upstream about.
>
>> >
>> > > *) The services that are part of the target will then own complete
>> > > handling of the condition instead of the application that monitored the
>> > > GPIO.
>> >
>> > Why are we decoupling the handler services from the GPIO? What is the
>> > advantage?
>> >
>> > The disadvantage is the behaviour of the system is much harder to
>> > understand. If we go this route, what tooling will be in place to debug
>> > failures of interactions between components?
>> >
>> > I would argue that this is already a significant hurdle in
>> > understanding integration failures on the BMC, and I would prefer not
>> > to add to the problems.
>> >
>>
>> I am not following the argument here. Why is the behavior harder to understand when you have defined systemd targets doing what they are
>> required to do. Its the job of applications that get into that target to do the right thing of collecting what is necessary to understand
>> one specific problem.
>
> I apologise, I had a misunderstand stemming from your description in
> 2.1. Sorry for that - you weren't planning on doing what I thought.
>
>> > > ---------
>> > >
>> > > Here is an example of application that handles the GPIO assertion that
>> > > happens when host does a checkstop.
>> > >
>> > > 1) Application's arguments need /dev/input/event<$number> and the
>> > > expected GPIO state as indicated by linux,code in :
>> > >
>> > > http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/input/gpio-keys.txt
>> >
>> > There is a downside in that you will be creating a kernel ABI by
>> > mapping GPIO events to a keycode. This choice appears to me to be
>> > arbitrary, and from the kernel's perspective we don't know how
>> > userspace is going to treat the value so we lose the flexibility to
>> > change it if it's not. This isn't a show-stopper, but it sure feels
>> > like a wart that doesn't need to exist.
>> >
>>
>> Is it not expected that the binding always pass the input_event struct ?. What kind of changes are you thinking ?
>>
>> Are you saying for instance you will change these values and applications may go crazy ?
>>
>> > #define KEY_UP                      103
>> #define KEY_DOWN              108
>
> As you pointed out we need to specify these values in your gpio-keys
> subnode via the linux,code property. We mustn't assume anything about
> how userspace behaves, e.g. it may very well care about these values
> and could react negatively if the value were changed.
>
> You mention above /dev/input/event<$number> - were you planning on
> having one or multiple gpio-keys entries in the devicetree? If
> multiple, what was your planned strategy for grouping the keys into
> gpio-keys nodes?
>
> One approach would be to have one gpio-keys node for each GPIO line.
> This would enable userspace not to care about what value was assigned
> to linux,code at the cost of knowing *which* /dev/input/event* file to
> open. I'm not suggesting this is a good idea (I don't think it is), but
> it is possible. It also doesn't change the fact that userspace may
> still care about the value regardless. Further, knowing which device to
> open may still be a problem anyway if someone plugs in say a USB
> keyboard. We probably need more investigation here.
>
> Cheers,
>
> Andrew



-- 
Regards,
Kun
