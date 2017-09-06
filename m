Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::231; helo=mail-qk0-x231.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jQa+8ftz"; 
 dkim-atps=neutral
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnJs54nS2zDqZ4
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 19:56:55 +1000 (AEST)
Received: by mail-qk0-x231.google.com with SMTP id b82so18067960qkc.4
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pUtChm61+kicS08mDOkq1eWX/1Yf31lnxxAIjiBEOeE=;
 b=jQa+8ftzuZo2kLMe8f/VptbKyuBlEBVsrqXNqdhJxPFEY05rcqpvcWwiAi8IYRC1/z
 5BPDBCVEz8cL4ZOQ9SnSeRtVciA9vMO4wL7PpK8ogC2EPCmqrc2HLvy9hbmQlTnAgVaO
 DkJMx0no6ai0Snpq6LS+3ZxkOxcBCYNQe5QVi3G9AuXldWlSdxaq1IxziGjNcLovd4O6
 gOn2VKAv6iYYDCZ1x+GPCXxWrAiKHfyUgLY3C/r3QsvTobhSOeeS0A8SwPu8RPEoERNf
 +Fslw/rXKtiD2PV2hRuDR2kA04X0o8WXuw8bMFTEScDd2W2JzZicW+WZVCTAv5pGLPJx
 zTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pUtChm61+kicS08mDOkq1eWX/1Yf31lnxxAIjiBEOeE=;
 b=m2AEXerUlIJlD4ItoVXJRzd0tRIw3BeM66kGkLZc8Mh8fPoCBfIroLK3fN9W9G9n6d
 0w/t9dw3vYLRR8zrrAeKj4quMlXEhMDOENcVo11MdJjS33AKDng7LJA5U9bvW5c+4JSD
 H9YtUwVN4KeYFClw968jso8YkyOUnIWPbWGTA3/jae4wSENyxWdKYo1vx9RfRkfSghUE
 Be253oLPdG8tIizuCCn7vgJziWfeupI5XCRyUvGny3/4PoEk5NNKdpESZAV5YL11lzaK
 tgeZLBjV5BIzkjRtMPeFRXU0FdWjdMo4Ns8677JZUFZV84H3lYtAOesl9zHfQkniQxco
 yrSA==
X-Gm-Message-State: AHPjjUiMqaIoYfYZOE2r3+keYjozInIOrznbHmSAkJ46QnEuHiJD+nng
 9J08XqRMNgRO83aqorqOBczTjWHbowVt
X-Google-Smtp-Source: ADKCNb7xZP7FfoJ/lBmGrZ1P7uNypA/Ark/S/DwvvySprzmw9XdsiX4aewInrEeARKdF+RmhsWK6oCXDuUJ+o8KVALY=
X-Received: by 10.233.235.17 with SMTP id b17mr2424806qkg.254.1504691812892;
 Wed, 06 Sep 2017 02:56:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.33.197 with HTTP; Wed, 6 Sep 2017 02:56:51 -0700 (PDT)
In-Reply-To: <f44a84de-60de-9917-ec84-12b26215a834@acm.org>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-2-brendanhiggins@google.com>
 <88dceea3-a554-b3b9-9d9e-7ddacc9136a5@acm.org>
 <CAFd5g44QFPGV+P_RCMreM4GWarOYJ8+iLREALFwiJ3JtiLvYyQ@mail.gmail.com>
 <beae3088-ce1b-3d57-0d6e-3728397ee8a5@acm.org>
 <CAFd5g45sOLV21g+30-1AK0734gct8AP0vG=1SVC1PpbT2xSK4A@mail.gmail.com>
 <f44a84de-60de-9917-ec84-12b26215a834@acm.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 6 Sep 2017 02:56:51 -0700
Message-ID: <CAFd5g45LQz41E4feZt0U9Og5QeG_9yQXmBQQxw0wdrBoa=A0zw@mail.gmail.com>
Subject: Re: [RFC v1 1/4] ipmi_bmc: framework for BT IPMI on BMCs
To: Corey Minyard <minyard@acm.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 openipmi-developer@lists.sourceforge.net, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Wed, 06 Sep 2017 09:56:58 -0000

On Thu, Aug 24, 2017 at 6:01 AM, Corey Minyard <minyard@acm.org> wrote:
> On 08/23/2017 01:03 AM, Brendan Higgins wrote:
>
> <snip>
>>
>> ...
>>>>
>>>> As far as this being a complete design; I do not consider what I have
>>>> presented as being complete. I mentioned some things above that I would
>>>> like
>>>> to add and some people have already chimed in asking for some changes.
>>>> I just wanted to get some feedback before I went *too* far.
>>>
>>>
>>> I'm not sure this is well know, but the OpenIPMI library has a fully
>>> functional BMC
>>> that I wrote, originally for testing the library, but it has been
>>> deployed
>>> in a system
>>> and people use it with QEMU.  So I have some experience here.
>>
>> Is this the openipmi/lanserv?
>
>
> Yes.  That name is terrible, but it started out as a server that provided a
> LAN
> interface to an existing BMC over the local interface, primarily for my
> testing.
>
>
>>
>>> The biggest frustration* writing that BMC was that IPMI does not lend
>>> itself
>>> to a
>>> nice modular design.  Some parts are fairly modular (sensors, SDR, FRU
>>> data)
>>> but some are not so clean (channel management, firmware firewall, user
>>> management).  I would try to design things in nice independent pieces,
>>> and
>>> end up having to put ugly hooks in places.
>>
>> Yeah, I had started to notice this when I started working on our userland
>> IPMI
>> stack.
>>
>>> Firmware firewall, for instance, makes sense to implement in a single
>>> place
>>> that
>>> handles all incoming messages.  However, it also deals with subcommands
>>> (like making firewalls for each individual LAN parameter), so you either
>>> have
>>> to put knowledge of the individual command structure in the main
>>> firewall,
>>> or you have to embed pieces of the firewall in each command that has
>>> subcommands.  But if you put it in the commands, then the commands
>>> have to have knowledge of the communication channels.
>>>
>>> I ended up running into this all over the place.  In the end I just
>>> hacked
>>> in
>>> what I needed because what I designed was monolithic.  It seemed that
>>> designing it in a way that was modular was so complex that it wasn't
>>> worth
>>> the effort.  I've seen a few BMC designs, none were modular.
>>>
>>> In the design you are working on here, firmware firewall will be a bit of
>>> a
>>> challenge.
>>>
>>> Also, if you implement a LAN interface, you have to deal with a shared
>>> channel and privilege levels.  You will either have to have a context per
>>> LAN connection, with user and privilege attached to the context, or you
>>> will need a way to have user and privilege information in each message
>>> so that the message router can handle rejecting messages it doesn't
>>> have privilege to do, and the responses coming back will go to the
>>> right connection.
>>>
>>> There is also a strange situation where commands can come from a LAN
>>> (or other) interface, be routed to a system interface where the host
>>> picks up the command, handles it, send the response back to the
>>> BMC which routes it back to the LAN interface.  People actually use this.
>>
>> That sounds like fun :-P
>>
>>> Another problem I see with this design is that most services don't care
>>> about the interface the message comes from.  They won't want to have
>>> to discover and make individual connections to each connection, they
>>> will just want to say "Hook me up to everything, I don't care."
>>>
>>> Some services will care, though.  Event queues and interface flag
>>> handling
>>> will only want that on individual interfaces.  For these types of
>>> services,
>>> it would be easier if they could discover and identify the interfaces.
>>> If
>>> interfaces are added dynamically (or each LAN connection appears as
>>> a context) it needs a way to know when interfaces come and go.
>>>
>>> If you end up implementing all this, you will have a fairly complex
>>> piece of software in your message routing.  If you look at the message
>>> handler in the host driver, it's fairly complex, but it makes the user's
>>> job simple, and it makes the interfaces job simple(r).  IMHO that's a
>>> fair trade-off.  If you have to have complexity, keep it in one place.
>>
>> I think that is a reasonable point. My initial goal was not to move the
>> routing that we do in user land to kernel space and only provide basic
>> facilities that are enough for my use case, but it sounds like there might
>> be some wisdom in handling message routing and message filtering to
>> kernel space. This might also make the framework more platform agnostic,
>> and less tightly coupled to OpenBMC.
>>
>> Nevertheless, that substantially broadens the scope of what I am trying
>> to do.
>>
>> I think a good place to start is still to create a common interface for
>> hardware interfaces (BT, KCS, SSIF, and their varying implementations)
>> to implement, as I have done, and while we are working on the rest of the
>> stack on top of it, we have the device file interface that can be used in
>> the
>> meantime.
>>
>> Let me know what you think.
>
>
> If you just need the ability to catch a few commands in the kernel, what you
> have is fairly complicated.  I think a simple notifier called from every
> driver
> would provide what you needed with just a few lines of code.

What do you mean by a simple notifier called from every driver? I think what
I have here is pretty simple. I think regardless of how we do routing, having
a common framework for low level IPMI hardware interfaces to implement
is pretty useful, even if it is only used to make a common dev file interface.

>
> As far as moving all the message routing to the kernel, my (fairly
> uneducated)
> opinion would be that it's a bad idea.  It's a lot of complexity to put in
> there.
> I can see some advantages to putting it there: it's simpler to interact with
> than
> a userspace daemon and it gives consistent access to kernel and userspace
> users.  But I don't know your whole design.

How about we focus on getting a common framework for the hardware
interfaces to implement? This way at least all of the hardware interfaces
are exposed the same way (similar to what you did on the host side). We
then at least have something to build on.

>
> -corey
>
>> Thanks!
>
>
>
