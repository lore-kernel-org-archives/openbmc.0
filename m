Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xccL96q5NzDrnp
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 16:03:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JN1xKG0m"; 
 dkim-atps=neutral
Received: by mail-qt0-x229.google.com with SMTP id 16so3397688qtz.4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 23:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sO3YNCfHJQVeK17wUCu4xOkoBC/962u3FLfGHeEFR7Q=;
 b=JN1xKG0mHvQ5bC1Na5T9wSWupMbqnYYhx/FF8saPktXsken1eQjfT5wxN8V0HCi6zQ
 Do+nZIGaFq/SQDoe7dVAZKIFgQNyH6aF/bsMu4aXhw6CZ7mYYWQ+w17amZieGn/D0ey1
 /JeZCco8ZBzKpB8v3DD+aNVBZH6R4keLI9aCCvRJ3LoxERkvpQTaU0PjamRWdAeKu3Lk
 o0bFWYTYikaAx912p3fzjDhY3hTVncxRbB6ZaGrmcJokEQMw3F6xsZ+rdnz+oKnwaOI7
 XcmtEsyKxY535lnr854uLxccE5RE2RpzPTtTtrEUmWCp1Ye+BtwrrtYRcDglLTg5d4m4
 35Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sO3YNCfHJQVeK17wUCu4xOkoBC/962u3FLfGHeEFR7Q=;
 b=Ajh3BTXU5I1pCuO9W/+iCmvQQoN8P0SKDi1kZivtOni+7DIXPffW2D12SKz5AchnMv
 BcjDphr+rQs/TOvknHLm+aPmysWgKLUVOMii29ed8OXxitAgSNnocMybkmQXhhi40gut
 QV0dU011d+OoPJ+YjcE1malO6qMiUGo5iT0cOS/u0UycrsAd2DWURH8/DuoniZNNJet6
 TOeJ+8fW1+l9QIcdv++T59TmDmyvAtSwitNdoVwhOgQBwe5wpXA1JszJ8izWM5YunTA/
 NeJm0H3QuEiLzix1r7x/KgYMUDGK9IHguB15Rc7nhTVuxNeOTalx1nFWXqOyvYcdLDrD
 IGBg==
X-Gm-Message-State: AHYfb5ikP/VdeuAh4ghhhy417S4TST3xXnfxzvgtcbzROOzrqtcPrDz/
 8P7tDg4oDnD/jg6Aau2jBECDMc4i4wOI
X-Received: by 10.200.58.199 with SMTP id x65mr1998359qte.205.1503468206660;
 Tue, 22 Aug 2017 23:03:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.181 with HTTP; Tue, 22 Aug 2017 23:03:25 -0700 (PDT)
In-Reply-To: <beae3088-ce1b-3d57-0d6e-3728397ee8a5@acm.org>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-2-brendanhiggins@google.com>
 <88dceea3-a554-b3b9-9d9e-7ddacc9136a5@acm.org>
 <CAFd5g44QFPGV+P_RCMreM4GWarOYJ8+iLREALFwiJ3JtiLvYyQ@mail.gmail.com>
 <beae3088-ce1b-3d57-0d6e-3728397ee8a5@acm.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 22 Aug 2017 23:03:25 -0700
Message-ID: <CAFd5g45sOLV21g+30-1AK0734gct8AP0vG=1SVC1PpbT2xSK4A@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Aug 2017 06:03:30 -0000

Sorry for the delayed response.

>>> This piece of code takes a communication interface, called a bus, and
>>> muxes/demuxes
>>> messages on that bus to various users, called devices.  The name
>>> "devices"
>>> confused
>>> me for a bit, because I was thinking they were physical devices, what
>>> Linux
>>> would
>>> call a device.  I don't have a good suggestion for another name, though.
>>
>> We could maybe do "*_interface" instead of "*_bus" and "*_handler" instead
>> of "*_device"; admittedly, it is not the best name ever: handler has some
>> connotations.
>>
>
> I think the "_bus" name is ok, that's what I2C uses, and "communication bus"
> makes
> sense, at least to me.  _handler is probably better than _device, but not
> that much.
> The IPMI host driver uses _user, but that's not great, either. Maybe
> _service?  Naming
> is such a pain.

Actually, I like _service. The way I am doing it here it is not
necessarily broken
up by command so service makes sense.

>
>
...
>>
>> As far as this being a complete design; I do not consider what I have
>> presented as being complete. I mentioned some things above that I would
>> like
>> to add and some people have already chimed in asking for some changes.
>> I just wanted to get some feedback before I went *too* far.
>
>
> I'm not sure this is well know, but the OpenIPMI library has a fully
> functional BMC
> that I wrote, originally for testing the library, but it has been deployed
> in a system
> and people use it with QEMU.  So I have some experience here.

Is this the openipmi/lanserv?

>
> The biggest frustration* writing that BMC was that IPMI does not lend itself
> to a
> nice modular design.  Some parts are fairly modular (sensors, SDR, FRU data)
> but some are not so clean (channel management, firmware firewall, user
> management).  I would try to design things in nice independent pieces, and
> end up having to put ugly hooks in places.

Yeah, I had started to notice this when I started working on our userland IPMI
stack.

>
> Firmware firewall, for instance, makes sense to implement in a single place
> that
> handles all incoming messages.  However, it also deals with subcommands
> (like making firewalls for each individual LAN parameter), so you either
> have
> to put knowledge of the individual command structure in the main firewall,
> or you have to embed pieces of the firewall in each command that has
> subcommands.  But if you put it in the commands, then the commands
> have to have knowledge of the communication channels.
>
> I ended up running into this all over the place.  In the end I just hacked
> in
> what I needed because what I designed was monolithic.  It seemed that
> designing it in a way that was modular was so complex that it wasn't worth
> the effort.  I've seen a few BMC designs, none were modular.
>
> In the design you are working on here, firmware firewall will be a bit of a
> challenge.
>
> Also, if you implement a LAN interface, you have to deal with a shared
> channel and privilege levels.  You will either have to have a context per
> LAN connection, with user and privilege attached to the context, or you
> will need a way to have user and privilege information in each message
> so that the message router can handle rejecting messages it doesn't
> have privilege to do, and the responses coming back will go to the
> right connection.
>
> There is also a strange situation where commands can come from a LAN
> (or other) interface, be routed to a system interface where the host
> picks up the command, handles it, send the response back to the
> BMC which routes it back to the LAN interface.  People actually use this.

That sounds like fun :-P

>
> Another problem I see with this design is that most services don't care
> about the interface the message comes from.  They won't want to have
> to discover and make individual connections to each connection, they
> will just want to say "Hook me up to everything, I don't care."
>
> Some services will care, though.  Event queues and interface flag handling
> will only want that on individual interfaces.  For these types of services,
> it would be easier if they could discover and identify the interfaces.  If
> interfaces are added dynamically (or each LAN connection appears as
> a context) it needs a way to know when interfaces come and go.
>
> If you end up implementing all this, you will have a fairly complex
> piece of software in your message routing.  If you look at the message
> handler in the host driver, it's fairly complex, but it makes the user's
> job simple, and it makes the interfaces job simple(r).  IMHO that's a
> fair trade-off.  If you have to have complexity, keep it in one place.

I think that is a reasonable point. My initial goal was not to move the
routing that we do in user land to kernel space and only provide basic
facilities that are enough for my use case, but it sounds like there might
be some wisdom in handling message routing and message filtering to
kernel space. This might also make the framework more platform agnostic,
and less tightly coupled to OpenBMC.

Nevertheless, that substantially broadens the scope of what I am trying
to do.

I think a good place to start is still to create a common interface for
hardware interfaces (BT, KCS, SSIF, and their varying implementations)
to implement, as I have done, and while we are working on the rest of the
stack on top of it, we have the device file interface that can be used in the
meantime.

Let me know what you think.

Thanks!
