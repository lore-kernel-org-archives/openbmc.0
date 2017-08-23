Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com
 [IPv6:2607:f8b0:400d:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xccXt3ttdzDrWv
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 16:12:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EjJhEmAO"; 
 dkim-atps=neutral
Received: by mail-qk0-x232.google.com with SMTP id z18so3647398qka.4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jC/HTAJmJJYZZETXuRKuoxi7WnSZxuDhCN6tIOtd6Go=;
 b=EjJhEmAOe5sTgQaIJMjUgAh8YEANrWeSJJ5M5rcwyJ99boEDzQyIJ1DTzRxq1OXpiV
 ZXzPlV8vhVjXRgAwUU/Igx73kPKTJaagZRuqh7/MYdTFrYhhBK7Fzy7b8mLntbPne09w
 OdJGpqcZZ9hUD9flNIVWaXJNrrPJXjYQekPmh7mPhO+70GdjwyIlKH2KAozqSduLZP+4
 ZMcglYeZRPmFUnywkuWYIYTJ38C5Rw4aGV/4yCDEjK1bBV2HJzztGJXhIFR2VUFhADdu
 8bjv1Y/swpQwiwreI1iAgzzCFsuhIu2DCCAFvc4wtiahXyfwclNQ13EXJ2KNW5bnEoMR
 riTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jC/HTAJmJJYZZETXuRKuoxi7WnSZxuDhCN6tIOtd6Go=;
 b=r/f42FNmlzRf6vTpTspHHzXB+LIjOFrSPgD77uMWdUIXeaslE5avjiPJKF/ZN6WL3U
 tezWQN/Izwtl+T8ivhkI3b98ayoupybVB3hiINRxAsasXQ2icguiCijRKxeiAL/mSYQI
 XWaIFaGY//4MeciV9QsPoH06akkG/q/I8ly8lHDk27YZ/ifM5pkR/zNedrZ0xwWjZnb1
 1D4G8wg7Z6VH4o390JjP0tXy6wLzYEIm8briHCVBZSq8NFA4Llx2jdu+IrpgTRfNNBmN
 27m6PeErTH4BllvfzbJzYS+zjdE2cnxE+1x5EegOUjB6S0RU73X/xqiiiRBydNRX284R
 vaGg==
X-Gm-Message-State: AHYfb5iI94hvtbEKtkf1Jlsh0DfSEj1jmwPz5/zdbJePusNHvpG6bqvE
 q+9fRffGb4zXg7dlSdYdWx60HoEy8PlS
X-Received: by 10.55.74.147 with SMTP id x141mr1991629qka.254.1503468764126;
 Tue, 22 Aug 2017 23:12:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.181 with HTTP; Tue, 22 Aug 2017 23:12:43 -0700 (PDT)
In-Reply-To: <CAFd5g468_etjbWY3TgE5iHhn7mNuDDTdUoijaMff_ZXXR1e6QA@mail.gmail.com>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170814160312.GA20526@asimov.lan>
 <CAFd5g468_etjbWY3TgE5iHhn7mNuDDTdUoijaMff_ZXXR1e6QA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 22 Aug 2017 23:12:43 -0700
Message-ID: <CAFd5g46FmFhpcWzQvC3SBSXSjJEXbR+WNbhCBe-p+4h894z+XQ@mail.gmail.com>
Subject: Re: [RFC v1 0/4] ipmi_bmc: framework for IPMI on BMCs
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Corey Minyard <minyard@acm.org>, Benjamin Fair <benjaminfair@google.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 openipmi-developer@lists.sourceforge.net, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Wed, 23 Aug 2017 06:12:47 -0000

On Mon, Aug 14, 2017 at 3:28 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> On Mon, Aug 14, 2017 at 7:03 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Mon, Aug 07, 2017 at 08:52:57PM -0700, Brendan Higgins wrote:
>>> Currently, OpenBMC handles all IPMI message routing and handling in userland;
>>> the existing drivers simply provide a file interface for the hardware on the
>>> device. In this patchset, we propose a common file interface to be shared by all
>>> IPMI hardware interfaces, but also a framework for implementing handlers at the
>>> kernel level, similar to how the existing OpenIPMI framework supports both
>>> kernel users, as well as misc device file interface.
>>
>> Brendan,
>>
>> Can you expand on why this is a good thing from an OpenBMC perspective?
>
> Sure, so in addition to the individual handlers; this does introduce a
> common file
> system interface for BMC side IPMI hardware interfaces. I think that is pretty
> straightforward.
>
> Corey and I are still exploring the handlers. My original intention
> was not to replace
> any of the handlers implemented in userspace. My motivating use case is for some
> OEM commands that would be easier to implement inside of the kernel.
>
> I was hoping to send out an overview of that, but the internet in my
> hotel sucks,
> so I will do it the next time I get decent internet access. :-P

I was able to get this out on Monday on the OpenBMC mailing lists:
https://lists.ozlabs.org/pipermail/openbmc/2017-August/008861.html

>
> In any case, Corey raised some interesting points on the subject; the
> most recent
> round I have not responded to yet.
>
>> We have a pretty significant set of IPMI providers that run in the
>> userspace daemon(s) and I can't picture more than a very small subset
>> even being possible to run in kernel space without userspace assistance.
>
> Like I said, I have an example of some OEM commands. Also, as I have said,
> my intention is not to replace any of the userland stuff. That being said, I am
> not sure the approach we have taken so far is the best when it comes to some
> of the new protocols we are looking at like IPMB and MCTP. Having some
> consistency of where we draw these interface boundaries would be nice; so
> maybe that means rethinking some of that. I don't know, but it sounds like
> Corey has already tried some of this stuff out on his own BMC side
> implementation.
>
> Regardless, I think there is a lot of interesting conversation to be had.
>
>> We also already have an implementation of a RMCP+ daemon that can, and
>> does, share most of its providers with the host-side daemon.
>
> That's great. Like I said, my original intention was not to rewrite any of that.

Corey had a good point about this in my thread with him. I made a proposal
of what to do there.

>
>>
>> --
>> Patrick Williams
>
> By the way, Corey suggested that we have a BoF session at the Linux Plumbers
> Conference, so I set one up:
> https://linuxplumbersconf.org/2017/ocw/proposals/4723
> I highly encourage anyone who is interested in this discussion to attend.
>
> Thanks!
