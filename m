Return-Path: <rlippert@google.com>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfCMK1xlZzDvk5
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 10:24:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Oqfw4pTD"; 
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id v84so35326064oie.3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 15:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8EuUgz2Y1+yaP2HkivabFyBInSJk47c7Jqc7dbLmLwk=;
 b=Oqfw4pTDK45QJXEiOXi8RLqmhm1Otd1ged5/tgr81UKq6SlM8hHCDfAwC034jG0YmC
 2sBMdoyUAc6mie3tq0wPrV6BhXyE1wKcSsCW95h3Vol1+/kp18DB4n6R4hc8Fo3lHey3
 Bpef1jxkDOi3HLe5jCgNPh2cLvGfB3hgYGwb7PqqXHOf20wXmbNB09LjXw/aJZyvSEKP
 /WhqgHEGqmeJnLHHCFvY4cuHQAYEwOq3uOXcPR+HEAltEZbgYZYyK+wzAAkphq6c0oT0
 HGCSGp8eX0icZOV9rd0FdFZfBrUTI9u39kGPletN98nZXMTkCwATFgDpYNHao3fRwIwM
 CYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8EuUgz2Y1+yaP2HkivabFyBInSJk47c7Jqc7dbLmLwk=;
 b=eDGwHGqsvWn70IXS/vjq0lwFed275aspOL8jGD5fqRuIvpRBrhWh/ORHzPhZ+J86Wo
 WAyc2yVA1jqnHsUITIjVfLNAF0v1OmqPBJR72c8V9Y2XvwEk+6TB4KCqP4LaVcN9spqj
 3seGhJnW7om0RzijkvfoqXmRN0vOChMGffhYmdAWOS2vgZ6xjXMb+sKIJDbAUAGKNzMU
 bMWIcPq2zHFGhzF82RQCGDdLU/nSktvOfYKjFKDBv/gSjNxl1j8TxZCNA4Tqu5mxnCqn
 gRzCfNVEc08g1vLIFxkb9FlfaTzt+nxpDNLO9gCDIRXcS9sstEBCFB7QTuynpPumpoAI
 Kokw==
X-Gm-Message-State: AKaTC00NGtQUwNcoqxOqhg1rQb0Ph0whqWlnn4OUAasfQ0LWXRP+xMhMDWwiWX7UCllFGEwqdtyF71IzI6POVk/7
X-Received: by 10.157.37.74 with SMTP id j10mr55259591otd.51.1481757850248;
 Wed, 14 Dec 2016 15:24:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.32.68 with HTTP; Wed, 14 Dec 2016 15:23:49 -0800 (PST)
In-Reply-To: <20161214143556.GA13350@heinlein.lan>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <20161214143556.GA13350@heinlein.lan>
From: Rob Lippert <rlippert@google.com>
Date: Wed, 14 Dec 2016 15:23:49 -0800
Message-ID: <CAFRv3wwRV0j6YU63VTJ0WDBy3edReCOPmtc4RuSDC82yKDVb5g@mail.gmail.com>
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 14 Dec 2016 23:24:13 -0000

On Wed, Dec 14, 2016 at 6:35 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Dec 13, 2016 at 11:55:00PM -0800, Jaghathiswari Rankappagounder Natarajan wrote:
>
> Jaghu,
>
> Bringing the discussion back onto just the OpenBMC list.
>
> Thank you for getting this out to the broader Linux community to solicit
> feedback.  As you see, even if things look good to some of the kernel
> devs here from a "is this generally how the kernel does things" and "is
> this code generally of quality to be acceptable upstream" there is a lot
> of history and design decisions on something as large as the Linux
> kernel for any of us to all keep track of.
>
> When we are adding support for a new device of a type already supported,
> like an i2c-eeprom or a thermal sensor, it is fairly easy to assume
> we're going to go through the upstream community.  When we are adding
> something new, like this 7-seg display, there is more likely to be
> resistance.  Maybe Joel can weigh in on, going forward, how we get early
> feedback so we don't spend a lot of time working on code that will never
> be accepted.
>
> I read through the current responses and the referenced email chain from
> 2013 with a similar driver and there seems to be two major points in the
> feedback.
>
> 1) The chip you are driving the 7-seg display with is already supported
> as a SPI-attached GPIO controller.
>
>     It does look like that driver plus SPI_BITBANG might allow us to
>     control the GPIOs on that device as a normal GPIO controller.  Is
>     that something you would like to try out and see if you can get
>     working?  Hopefully that would reduce your code to just the
>     translation from character to GPIO settings.

This was my original hope but Jagha tried it and it doesn't work :(

The serial GPIO interface is slightly different wrt the buffer chips
that we use vs the ones that are needed to work with the serial GPIO
driver (namely the lack of a "load" signal) and there is no way to
make it work as far as I can tell.

>
>
> 2) The community isn't interested in a one-off driver like this.
>
>     The thread from 2013 raised points about how a 7-segment display
>     driver isn't generic enough to support "X-segment displays".  One
>     of the authors mentioned how some displays have a decimal place that
>     can also be lit.  This lead Greg K-H to the decision that it would
>     best be handled from userspace.
>
>     I believe Google has a desire to get post codes from the BMC U-boot and
>     kernel, hence why you tried to put it into the kernel?  Are there
>     additional reasons for wanting to put it in the kernel?
>
>     I see three possible solutions, and there may be more:
>
>     a) We use SPI_BITBANG and the GPIO driver for this device (which we
>     probably should do in either case) and use device tree "hogging"
>     of the GPIOs to set the initial kernel post code.  This will cause
>     the kernel to light that display correctly as it is initializing.
>     We can then write a userspace application to manipulate the GPIOs
>     after that to change the display as appropriate.
>
>     b) We go back to the LKML with some more background on why we would
>     like this in-kernel, as in something unique to the BMC requirements
>     that needs the support in-kernel, and see if that makes them more
>     receptive.  I'm willing to help you work on the message here if you
>     would like.

The other part of this driver that hasn't been written yet is to take
bytes written to LPC port 80h (from the hostboot/etc. firmware) and
echo them to the 7seg display.

That would be easier to do purely in the kernel, although it should
also be possible to do it via a userspace app I guess with a lot more
work...

>
>
>     c) We see how willing Joel is to keep this as an out-of-tree driver.
>     It seems to use pretty generic and not-likely-to-change kernel APIs
>     so I don't see this as a large maintenance burden.
>
>     I suspect we would tend to prefer (a) but I don't know if that will
>     still allow it to meet Google's needs.
>
> Feel free to catch me on IRC today if you'd like to have an active
> discussion on this to get things moving faster.
>
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
