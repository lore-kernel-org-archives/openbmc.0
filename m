Return-Path: <robh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="xKALPyPp"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41M6NR3pWQzF1g3;
 Fri,  6 Jul 2018 04:49:43 +1000 (AEST)
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
 [209.85.223.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11BD4240C2;
 Thu,  5 Jul 2018 18:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1530816581;
 bh=HUyIso17hRjozVls2RYQWNPV1JulF+Drecey1PPYBmg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xKALPyPpvegqmgiJmmJhENSyiob16923SGXExZh0aY7I0p5i6LR8yRP3pyykODR/f
 eO0MqnkvU4i4XZOKkWWz1eRxfaPUg6OmaYoi6HnujN5s4QON7DrIp44Sjyuev5R78t
 bJ7ZNuB6EGfXBhcqhNPNbI5hv7XQHICp66onDxh4=
Received: by mail-io0-f173.google.com with SMTP id l7-v6so8681124ioj.1;
 Thu, 05 Jul 2018 11:49:41 -0700 (PDT)
X-Gm-Message-State: AOUpUlEIcpXt0/ZB5X5NhECmGEcUoi7y7mF08sq0omk4zcUEdUcmocH8
 IVey6fm7ADagd+G/fvPpdAWycos4biXu+FRuSg==
X-Google-Smtp-Source: AAOMgpdHUNjGmpVLzDdAuE+VJO24eXpQ5UVZkhcneacBXggoMn80c+UJr5cGqXN6MvNvLczpugFCLXaKk+hm1i4aZNw=
X-Received: by 2002:a5e:c90e:: with SMTP id
 z14-v6mr6198475iol.268.1530816580483; 
 Thu, 05 Jul 2018 11:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20180622043756.21158-1-benh@kernel.crashing.org>
 <20180703193017.GA23230@rob-hp-laptop>
 <23be30ebb2c661ef304c78a85cff591c515ba65b.camel@kernel.crashing.org>
In-Reply-To: <23be30ebb2c661ef304c78a85cff591c515ba65b.camel@kernel.crashing.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Jul 2018 12:49:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZunLyRJQJgQrcBvv2s=HEd=E2ZG1ZgkgwTQkzJ88mcA@mail.gmail.com>
Message-ID: <CAL_JsqKZunLyRJQJgQrcBvv2s=HEd=E2ZG1ZgkgwTQkzJ88mcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: fsi: Add optional chip-id to CFAMs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 18:49:44 -0000

On Tue, Jul 3, 2018 at 7:07 PM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Tue, 2018-07-03 at 13:30 -0600, Rob Herring wrote:
> > On Fri, Jun 22, 2018 at 02:37:55PM +1000, Benjamin Herrenschmidt wrote:
> > > This represents a physical chip in the system and allows
> > > a stable numbering scheme to be passed to udev for userspace
> > > to recognize which chip is which.
> >
> > I'm sure you're aware, stable numbers is generally not something the
> > kernel guarantees...
>
> This has nothing to do with any kernel guarantee. Not sure what you are
> mixing up here :-)

I was referring to /dev node names like sda/sdb/sdc or ttyS0/ttyS1.

> The IDs will get exposed via sysfs in order to allow udev rules to
> create appropriate symlinks such as by-id or by-path as is traditional
> (we haven't completely decided some of the udev side details yet)

Yeah, that's a bit different.

> > In the cases where we do have them, we've used aliases.
>
> This is necessary, though Aliases may do the job too. This is the
> device-tree that represents the "host" system that the BMC is managing.
>
> We need to be able to identify using a stable numbering scheme the
> processors on the FSI topology otherwise we would do "interesting"
> things such as turn the fan for CPU 1 when CPU 0 gets hot :-)
>
> (This is just a silly example, there are plenty of other reasons why we
> need to understand the HW topology of a given system, including
> debuggers using FSI as a backend etc...)
>
> Traditionally POWER has used ibm,chip-id properties for the host side,
> so I just did something similar here for the BMC side, but I can look
> into using aliases if you prefer.

That is specifically for CPUs though, right? Is the same true here? If
so, I guess this is fine. A set of indexes for any device on a bus
would be more concerning.

> Note: I'm not sure what you have against DT provided names or IDs, this
> has been a rather standard way of doing things even before we did the
> FDT. For example that's what slot-names properties are for, or location
> codes etc... Yes we invented that alias trick later on but it's not
> necessarily the best approach (in fact I don't really like it to be
> honest).

I'm no fan of aliases either, but just trying to keep some consistency
in how we deal with various problems. My main concern is folks trying
to create some made-up index numbering of devices. Often it's not
really needed as there are other ways to address or identify devices.
In many cases we end up using 'reg' if there's no other means of
addressing a device.

We've generally standardized around "label" for things like slots,
ports, connectors, etc. that need to be physically identified.
"slot-names" it seems hasn't gotten used for FDT. Since there aren't
DT's published for OF based systems nor any documentation, newbies
like me (that only have 8 years of DT experience) don't have any
insight into how things used to be done.

Rob
