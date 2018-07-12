Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::241; helo=mail-oi0-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P7yqMzLP"; 
 dkim-atps=neutral
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R9jS6wMdzDqvH
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 19:33:31 +1000 (AEST)
Received: by mail-oi0-x241.google.com with SMTP id s198-v6so54584807oih.11
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvezg0H1R5cj86TL6CQFpifq3Ylpvdob6co5WNClqus=;
 b=P7yqMzLPjCwrwoy1XZClDeczI/5YBjdUhKytIJcgjMq2a/hBcmp9/aKZUexDm/u5X2
 mgo7myItMigOzaKIi7ewUZjhqyY/C79vd0GbVm/0nyviyWR2NQTWMiIXzMhZlpPmqC8l
 ALpcCkthKbQScEdfLB0I0ArvWAYgUCGimpK/GmBzyamCPGgCp341zbYlE6b0V7gvI5t8
 K/VGjJxEJ6MqI6JqpvSrNuakna49H8f7N3fy9Fp011H4ou+xokGy51B74FiAe5WVbis6
 oDmMOSmp4Kf6nATk0dTHEz/ABnLQ0AgxvXQMX56Vvc51vaSsUlUXV6ej5DIOxlieps8d
 ixDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvezg0H1R5cj86TL6CQFpifq3Ylpvdob6co5WNClqus=;
 b=J5Av6Th0fOkXfxtVUx88v1GrIfyZgfnLTk8XeJvnS+q7UgRViWBTaQFdWtdxU1DjHZ
 3ek1TEigOGK+7Z1Gna+INW77fPDClf3oJ+EGneIGCvWYthWr/nt/rUy5//vbFSgjvaeo
 mAARNIM/rAnq04Az7Uju124xyTn5jAVmUBgmgiuFtXEusjLDGNnlBeoJD4JBnb5lFGOZ
 Al8XNI5UdKR0Ch8hnHSteruMQjkP+UHoiKu44hh3BrpgCETZi/tOw1+1u7Cs7eB4Ryx5
 znjJNUJt8YIA04YsmCYgdhR79Fb8hsH1MJfDDyIlq03JLBwwUaWDsU+PMzNyupBjH72v
 KLXg==
X-Gm-Message-State: AOUpUlGf6xnw5wUtyUozUxJIj3zL3R/AhC9LA+CpAtcOTbpJ7j3KK8XL
 nEby9ikoAh4qCMZb6uqyzWswohgGiC6GFY/kEuX5pw==
X-Google-Smtp-Source: AAOMgpcotcmIpiQ2dFLgny2Xj0gnyJpT/VDhhKxfW6YCTyH7FUNNo/vBnnybXus9oCY9j95XOoHSznN9C2GLEtKOhqU=
X-Received: by 2002:aca:190d:: with SMTP id
 l13-v6mr1597772oii.216.1531388008292; 
 Thu, 12 Jul 2018 02:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180626165812.4141-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g45z--ucXf-So517tgrayZT6x2TGvaUvaDF7zeRNn7CPXw@mail.gmail.com>
 <e51471e6-0f8a-bffc-34c8-1e74239fdbcf@linux.intel.com>
In-Reply-To: <e51471e6-0f8a-bffc-34c8-1e74239fdbcf@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 12 Jul 2018 02:33:16 -0700
Message-ID: <CAFd5g47j_h4ZrT8Eg1FZ8sAj5ekCUH20jUVub75ozdkg8_YW7Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Improve driver to support multi-master use
 cases stably
To: jae.hyun.yoo@linux.intel.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 james.feist@linux.intel.com, 
 vernon.mauery@linux.intel.com, Benjamin Fair <benjaminfair@google.com>, 
 Patrick Venture <venture@google.com>
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
X-List-Received-Date: Thu, 12 Jul 2018 09:33:34 -0000

On Wed, Jun 27, 2018 at 10:55 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
<snip>
> >> +/* Timeout for bus busy checking */
> >> +#define BUS_BUSY_CHECK_TIMEOUT                         250000 /* 250ms */
> >> +#define BUS_BUSY_CHECK_INTERVAL                                10000  /* 10ms */
> >
> > Could you add a comment on where you got these values from?
> >
>
> These are coming from ASPEED SDK code. Actually, they use 100ms for
> timeout and 10ms for interval but I increased the timeout value to
> 250ms so that it covers a various range of bus speed. I think, it
> should be computed at run time based on the current bus speed, or
> we could add these as device tree settings. How do you think about it?
>

This should definitely be a device tree setting. If one of the busses is being
used as a regular I2C bus, it could hold the bus for an unlimited amount of
time before sending a STOP. As for a default, 100ms is probably fine given
that, a) the limit will only apply to multi-master mode, and b) multi-master
mode will probably almost always be used with IPMB, or MCTP (MCTP actually
recommends a 100ms timeout for this purpose, see
https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.1.0.pdf,
symbol PT2a). That being said, if you actually want to implement IPMB, or MCTP
arbitration logic, it is much more complicated.

>  >
<snip>
> >>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
> >> -       if (aspeed_i2c_slave_irq(bus)) {
> >> -               dev_dbg(bus->dev, "irq handled by slave.\n");
> >> -               return IRQ_HANDLED;
> >> +       if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
> >> +               if (!aspeed_i2c_master_irq(bus))
> >
> > Why do you check the slave if master fails (or vice versa)? I
> > understand that there are some status bits that have not been handled,
> > but it doesn't seem reasonable to assume that there is state that the
> > other should do something with; the only way this would happen is if
> > the state that you think you are in does not match the status bits you
> > have been given, but if this is the case, you are already hosed; I
> > don't think trying the other handler is likely to make things better,
> > unless there is something that I am missing.
> >
>
> In most of cases, interrupt bits are set one by one but there are also a
> lot of other cases that ASPEED I2C H/W sends multiple interrupt bits
> with combining master and slave events using a single interrupt call. It
> happens much in multi-master environment than single-master. For
> example, when master is waiting for a NORMAL_STOP interrupt in its
> MASTER_STOP state, SLAVE_MATCH and RX_DONE interrupts could come along
> with the NORMAL_STOP in case of an another master immediately sends data
> just after acquiring the bus - it happens a lot in BMC-ME connection
> practically. In this case, the NORMAL_STOP interrupt should be handled
> by master_irq and the SLAVE_MATCH and RX_DONE interrupts should be
> handled by slave_irq so it's the reason why this code is added.

That sucks. Well, it sounds like there are only a handful of cases in which
this can happen. Maybe enumerate these cases and error out or at least warn if
it is not one of them?

>
<snip>
> >> +       for (;;) {
> >> +               if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> >> +                     (ASPEED_I2CD_BUS_BUSY_STS |
> >> +                      ASPEED_I2CD_XFER_MODE_STS_MASK)))
> >
> > Is using the Transfer Mode State Machine bits necessary? The
> > documentation marks it as "for debugging purpose only," so relying on
> > it makes me nervous.
> >
>
> As you said, the documentation marks it as "for debugging purpose only."
> but ASPEED also uses this way in their SDK code because it's the best
> way for checking bus busy status which can cover both single and
> multi-master use cases.
>

Well, it would also be really nice to have access to this bit if someone wants
to implement MCTP. Could we maybe check with Aspeed what them meant by "for
debugging purposes only" and document it here? It makes me nervous to rely on
debugging functionality for normal usage.

> >> +                       return 0;
> >> +               if (ktime_compare(ktime_get(), timeout) > 0)
> >> +                       break;
> >> +               usleep_range((BUS_BUSY_CHECK_INTERVAL >> 2) + 1,
> >
> > Where did you get this minimum value?
> >
>
> No source for the minimum value. ASPEED uses mdelay(10) in their SDK
> but I changed that code using usleep_range and the range value was set
> with considering time stretching of usleep_range.
> regmap_read_poll_timeout was a reference for this code.

What protocol are you trying to implement on top of this? You mentioned BMC-ME
above; that's IPMB, right? For most use cases, this should work, but if you
need arbitration, you will need to do quite a bit more work.

>
> Thanks,
>
> Jae
<snip>

Cheers
