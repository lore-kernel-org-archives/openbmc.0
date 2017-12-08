Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22e; helo=mail-vk0-x22e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Nz1cbGou"; 
 dkim-atps=neutral
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytf583dNbzDxCH
 for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2017 04:10:57 +1100 (AEDT)
Received: by mail-vk0-x22e.google.com with SMTP id x140so7327278vke.4
 for <openbmc@lists.ozlabs.org>; Fri, 08 Dec 2017 09:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qozfjz2iytiovJyDKMxRrlY1ulvmVMR13Qm6ALM/DTg=;
 b=Nz1cbGoul4DFIN7Hv3Cr09UN2Cn5/8WL0C3lvAX5Zjlr9g0kaQREfda4QiuD0wf/Bx
 LtzzyIHw6UCWs/NdwxVsoelZiOsWovJcTRm11n5cKDRwmrx/ITGivxiDP+Gy39rJZRzI
 y7VI7mcBuKoPBThf8qD5yh2nsM6S3fPhvXy4dtCwEzqfavcl1RduxlmsZI/PcMu6SyKi
 XF+ssJ1VwZ3tmfYMrrkq9EHZiKRB+AUb1YXCtQbOih6JAAnok1j4ZKZZy/Vz500olpWt
 c0TWhbTnjziCMY91UPyVKg0emUB1xgaIfDS1GXu0QPsOaZwFfQ0/S/Q+iWKseUJKgBG7
 xSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qozfjz2iytiovJyDKMxRrlY1ulvmVMR13Qm6ALM/DTg=;
 b=YgU1FkpK7XEu4rx+PjdPwA2cM0JMxOksZQEJlDPTArPpfwz/e7ke5OTPrFOL8aCCrs
 kP9UeCG4FZ3IFKd8pI1wjzqbiP4Q7OixvJYpzLFWUBDT+45VAMPexXfm+vLCFGmDzsck
 veG4d31AYwe3C7L4g6lc8WcBhdC0YbJOZ5s2mR7p0/996u81VmVZj3+wZokZ5SjGsbx3
 qx3dJAGzXeGQ2kHnEnzz5QAwrQLmlNRPwQJNyCulYSiiekwyDD53OA3A3/bxd32YEoqA
 ghacksRV+sOIIcw1bpa/0elKU9wHgpexOaElBonHKJaX31cqiZOwbgS2/sruoBG4ucQJ
 DNUA==
X-Gm-Message-State: AKGB3mIdgKwU+LcXMTlceuF7jEyfjbrmq3F/Lp3eXqClLvnY+pFyk6CD
 PNM8XJuV/Lowml8c4BHS+zq91iMDTzzs6ZGNriks4w==
X-Google-Smtp-Source: AGs4zMYXR2kjmcw6tdPS4jnie1HVOSN/WxuB+h2aGHzLGq9daycZ6/5TeLTWCqheKtu6o0R7pZ3PpMybSgHyNnRok3g=
X-Received: by 10.31.51.4 with SMTP id z4mr16383873vkz.127.1512753052824; Fri,
 08 Dec 2017 09:10:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Fri, 8 Dec 2017 09:10:32 -0800 (PST)
In-Reply-To: <CACPK8XeRxVvn1ZUM+WDWF5td6edBwWrdsxm7Ozn78FcJf8E1vQ@mail.gmail.com>
References: <20171120185445.146061-1-venture@google.com>
 <CAO=notwF3acqwMHeuQyp4rUQwN6K0oj_py46-feMf3hoRydLyA@mail.gmail.com>
 <CACPK8Xet_aaCf3StQKwzXGTd1Oi0A=P-i1QU7faCuxOFb3ktxw@mail.gmail.com>
 <CAO=notwPBvHSvHgnQCycajUyJ-13sa+TrXYxmzKc5SL-V+8_-Q@mail.gmail.com>
 <CACPK8XeRxVvn1ZUM+WDWF5td6edBwWrdsxm7Ozn78FcJf8E1vQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 8 Dec 2017 09:10:32 -0800
Message-ID: <CAO=notw0w2TBPmsFfnh6UvEV6=HC87UZ9msaDQb4GKF8FT_P3A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: gpio controller register
 range
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 17:11:55 -0000

Thanks for the feedback.  I'm still working on getting a few kinks
worked out in the driver, for instance, verifying that waiting on the
rising edge for the J1 gpio (on the ast2400) is required for stable
writing -- which has been true.  We were actually seeing the serial
gpios wedge to a specific value on the quanta-q71l board, but having
it wait on that prevents this case... so more work is going into
verifying behaviors and caveats.  I'm without a motherboard that has
serial gpios and the ast2500 for testing...

Thanks,
Patrick

On Thu, Dec 7, 2017 at 10:30 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Dec 1, 2017 at 2:05 AM, Patrick Venture <venture@google.com> wrote:
>> On Wed, Nov 29, 2017 at 7:53 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> On Thu, Nov 30, 2017 at 5:03 AM, Patrick Venture <venture@google.com> wrote:
>>>> Can I get a status on this patch?  The device datasheet has 4K
>>>> reserved for the range, but only the first 512 are registers
>>>> controlled by this driver.  The rest will be handled by a separate
>>>> driver.  Or at least that's how it's planned.
>>>
>>> +cc the people who have worked on this.
>>>
>>> I think that's okay, but lets see what the others have to say.
>>>
>>> Do you have a driver for the rest of the GPIOs you can submit? I'd
>>> like to see  that code so we can decide if there is good reason to
>>> make that completely separate, and not part of the existing driver.
>>>
>>> This work is best done upstream, as you will need to make the same
>>> arguments there.
>>
>> I should have a driver ready sometime late next week that I'll be
>> sending upstream first.  I still need to finish up a few loose ends on
>> it.  It wouldn't be unreasonable to have them in the same driver,
>> you'd just end up with two groups of gpios that are handled
>> differently, and extra soft-irqs.  That said, if you have two large
>> groups of things that need to be treated differently, then that's
>> somewhat of an argument for having them separate. :)
>>
>> I'd actually appreciate hearing some thoughts at this point on which
>> way to go, since merging the serial handling into the main driver will
>> require re-working a few things -- I'd rather take the extra time to
>> handle that merge if it's going to head in that direction anyway.
>>
>> I have read through the gpio-aspeed driver before, as it was a bit
>> useful as a guide, and I could see it getting a bit cluttered with
>> also handling the serial gpios.
>
> It sounds like a call that could go either way. If you think it would
> be easier to maintain two separate drivers then we can go that
> direction.
>
> I'd suggest discussing it upstream.
>
> The best way to discuss it would be in the form of a patch. Even if
> it's not complete, post it as a RFC.
>
> Cheers,
>
> Joel
