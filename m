Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWVcb6y8LzDqXc
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 08:28:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JyqFe5Av"; 
 dkim-atps=neutral
Received: by mail-oi0-x234.google.com with SMTP id g131so97105130oic.3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 15:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2VrNy//vsqM7LfS81B19SAdkblrXr3ghHD8VzFJU69c=;
 b=JyqFe5Av4p/4c8n5NBy+AI3bZ7p9TC4g/HQMcyGqKhaSjhRDLraFv9bMfpLHGgo+V2
 U53xzuqmUyDPNSXW8neLpXrwZ8XbWsTvAORgCmxtiLpLd5Yl0oG8Qj0vcicpaHH79OqZ
 KyzrsRh/cu17l7sqsLtKXnGgfQ3CqCHmE8oTM/D6sp927yjGFBOeC5Z3mGD0zrLRUgab
 FpikqYbD1pMAQ/SLsaUHZ8V+eyd2bEebJhUHuLSYdMBZqO2cJmgUafjWHvoMNNZOgYCe
 xNHSMeb5HQrf6pLHhgItFrtHnOvHM5smL90f5kpyB1AWHeLl+oO51DVvyqWvj6zaSVx+
 eK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2VrNy//vsqM7LfS81B19SAdkblrXr3ghHD8VzFJU69c=;
 b=hvZGU2r5ET8IrJ1xrXnA2oISjj0eqnANWAE4hl+U84z9uPlp8EAOZCANt5JO3tfiIN
 camRGmZgCGxtw5BT0fcydYl7Y0BNAGKrmTWM+gC490v9QLGqJu1bSMT8yLjVLOa57rr0
 rk2baGWkvefAeMhlnmWT1MoHvViYu2hW2IRva7Qfq+jobgAHakaBvwmEBDfnr7Gm0mXS
 yZTCNWDJaiq2QLVJYMk6EeT+HUhXTfX68eFuC3V+nlCzinks5MzVYQGmrReYo3T7z0VE
 6Ib9IiavW51l7KRigYL2ifaka8MU+70lrFMGX/mIttpB/R9nRF1KQh+Gai41xb3jimku
 pf2w==
X-Gm-Message-State: AHYfb5j/E+6bRodKA1sLfkpw8YU/NH6SUNcgQIrIsYiMN5S3Ulmp0gfD
 DQ1ge3Sadm1XqNfW2m3tt+1QmXbceEl5
X-Received: by 10.202.86.77 with SMTP id k74mr27613886oib.213.1502749694019;
 Mon, 14 Aug 2017 15:28:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.168.69.205 with HTTP; Mon, 14 Aug 2017 15:28:13 -0700 (PDT)
In-Reply-To: <20170814160312.GA20526@asimov.lan>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170814160312.GA20526@asimov.lan>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 15 Aug 2017 01:28:13 +0300
Message-ID: <CAFd5g468_etjbWY3TgE5iHhn7mNuDDTdUoijaMff_ZXXR1e6QA@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Aug 2017 22:28:16 -0000

On Mon, Aug 14, 2017 at 7:03 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Mon, Aug 07, 2017 at 08:52:57PM -0700, Brendan Higgins wrote:
>> Currently, OpenBMC handles all IPMI message routing and handling in userland;
>> the existing drivers simply provide a file interface for the hardware on the
>> device. In this patchset, we propose a common file interface to be shared by all
>> IPMI hardware interfaces, but also a framework for implementing handlers at the
>> kernel level, similar to how the existing OpenIPMI framework supports both
>> kernel users, as well as misc device file interface.
>
> Brendan,
>
> Can you expand on why this is a good thing from an OpenBMC perspective?

Sure, so in addition to the individual handlers; this does introduce a
common file
system interface for BMC side IPMI hardware interfaces. I think that is pretty
straightforward.

Corey and I are still exploring the handlers. My original intention
was not to replace
any of the handlers implemented in userspace. My motivating use case is for some
OEM commands that would be easier to implement inside of the kernel.

I was hoping to send out an overview of that, but the internet in my
hotel sucks,
so I will do it the next time I get decent internet access. :-P

In any case, Corey raised some interesting points on the subject; the
most recent
round I have not responded to yet.

> We have a pretty significant set of IPMI providers that run in the
> userspace daemon(s) and I can't picture more than a very small subset
> even being possible to run in kernel space without userspace assistance.

Like I said, I have an example of some OEM commands. Also, as I have said,
my intention is not to replace any of the userland stuff. That being said, I am
not sure the approach we have taken so far is the best when it comes to some
of the new protocols we are looking at like IPMB and MCTP. Having some
consistency of where we draw these interface boundaries would be nice; so
maybe that means rethinking some of that. I don't know, but it sounds like
Corey has already tried some of this stuff out on his own BMC side
implementation.

Regardless, I think there is a lot of interesting conversation to be had.

> We also already have an implementation of a RMCP+ daemon that can, and
> does, share most of its providers with the host-side daemon.

That's great. Like I said, my original intention was not to rewrite any of that.

>
> --
> Patrick Williams

By the way, Corey suggested that we have a BoF session at the Linux Plumbers
Conference, so I set one up:
https://linuxplumbersconf.org/2017/ocw/proposals/4723
I highly encourage anyone who is interested in this discussion to attend.

Thanks!
