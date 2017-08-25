Return-Path: <raltherr@google.com>
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xf6f51VCCzDrVt
 for <openbmc@lists.ozlabs.org>; Sat, 26 Aug 2017 02:52:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AwVD6p/n"; 
 dkim-atps=neutral
Received: by mail-ua0-x22f.google.com with SMTP id w17so1213027uaw.5
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dKpfAsSuYHlcnFqw+mGXAvKl60z4SFyMyZ4psBHFuyk=;
 b=AwVD6p/nW1BrT09UhIKK8mS7pmO1jh3Z71FL7FFldB0PxpT9wpxHNbq4SMzAgDJdmU
 uCh2zAoYEH+dAMqM1nqo3PW2ewDq7h5erAu5rwAsZiuE5/AejSlpzsBdq40AoFzKA3yS
 udkasrfCJq9FND87KlhZhbeErBH+2o1J7GN/AF5nC9C0U5q3E3wM/BeQZEDkpu++620Z
 gZhlRS75Lz2TcKl02fcRNVqjiaDbXoyJ5QI+xQUj3Zw1dZ/rU91NchaDBJ2JYV9V6FzZ
 ZOioA8YqFO7D5AVyh/tN14aQRopnTHX9XWq94YwyrnlE9PnasGdLClWZlfnO+c3SpxcX
 yqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dKpfAsSuYHlcnFqw+mGXAvKl60z4SFyMyZ4psBHFuyk=;
 b=Ms5m3rVsZ14EOXWXa8oZb4pjm4vvdf0ZtQp7cxI7W+b23DbgAddbchZYccPHFa2EKV
 2gkQPiLSpJR34DlQfYF+i+KaPf28fRDB6dAg0nEcAI+bwcJsNwzospQA31meG94lCeJb
 nojOQo1kPjjCJmHggig3jLJW3Zct6Zw3j/0g5m1Bh4NRdwcs6v1tep5a5cNVi3otDSx3
 0ycyPQWOoUVpEVB9SjNvG9VpSXa1+tjVqf8nVcTA9cMx8kGRl2efLyW983jKhZ1RerV/
 YlFQGNHPRe+9pUMoROxCOOwsHi80laktruqLOgeS5EtMfSzXTVF9TCsAsjHjzVSyLU8m
 FX+Q==
X-Gm-Message-State: AHYfb5jAjO69TLXlgGlXprhPV59VBThs6KPSBjMDuE8E5Eh89k2m+WW2
 yJcCwF/I9UNF3Kuq5Pfd6fiS9OulLJ45
X-Google-Smtp-Source: ADKCNb727yG9POnZhm+rp0WGlqzoa2/2wt5Nom4vrXONVh/U+bE1NYwyhf6h6DzFt5+ksLvxNYUsI6zQbj8XTP/xVhk=
X-Received: by 10.159.34.132 with SMTP id 4mr6778649uan.50.1503679946116; Fri,
 25 Aug 2017 09:52:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Fri, 25 Aug 2017 09:52:25 -0700 (PDT)
In-Reply-To: <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
 <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 25 Aug 2017 09:52:25 -0700
Message-ID: <CAPLgG=mv1p98e4Vzso1N-VU=1MSotkTmnF+DcDTXPcd3q-n8HA@mail.gmail.com>
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Arnd Bergmann <arnd@arndb.de>, system-sw-low-level@mellanox.com, 
 Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openocd-devel-owner@lists.sourceforge.net, 
 mec@shout.net, Rob Herring <robh+dt@kernel.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 vadimp@maellanox.com, Tobias Klauser <tklauser@distanz.ch>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
X-List-Received-Date: Fri, 25 Aug 2017 16:52:30 -0000

On Fri, Aug 25, 2017 at 1:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Aug 24, 2017 at 11:37 PM, Rick Altherr <raltherr@google.com> wrote:
>> On Thu, Aug 24, 2017 at 2:07 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Tue, Aug 22, 2017 at 6:10 PM, Oleksandr Shamray
>>> <oleksandrs@mellanox.com> wrote:
>>>
>>>> SoC which are not equipped with JTAG master interface, can be built
>>>> on top of JTAG core driver infrastructure, by applying bit-banging of
>>>> TDI, TDO, TCK and TMS pins within the hardware specific driver.
>>>
>>> I guess you mean it should then use GPIO lines for bit-banging?
>>>
>>> I was wondering about how some JTAG clients like openOCD does
>>> this in some cases.
>>
>> Many common uses of OpenOCD leverage USB devices, such as FTDI FT232R,
>> that have a command queue for bitbanging operations.  Managing these
>> via libusb is ugly but platform-agnostic.
>
> Incidentally, people are sending patches to expose the FTDI
> expanders as common GPIO chips under Linux, so we can
> internally in the kernel or from the usersapce character device
> access them as "some GPIOs".
>

I know my team at Google has an internal patch for exactly that.  FTDI
expanders are complicated as they can be used as UART, GPIO, I2C, SPI
depending on configuration.  Our project was using a mix of I2C and
GPIO so I directly my team to approach it as an MFD.  I'd like to see
all of these use cases handled by the kernel but I understand the
other viewpoint of relying on libusb for cross-platform compatiblity.

>>> In my worst nightmare they export GPIO lines using
>>> the horrid ABI in /sys/gpio/*
>>
>> https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/sysfsgpio.c
>
> Gnah!
> Whoever writes a slot-in replacement making the character device
> take precendence wins lots of karma.
>

If they show up at Linux Plumbers or visit San Jose, I'll take them to
dinner.  I didn't see any docs for the chardev in Documentation.  I
_think_ I understand how it works from reading the relevant sections
of gpiolib.c but I can see how users end up using sysfs instead.

>> While that is certainly horrible (and slow), mapping in the GPIO
>> registers via /dev/mem strikes me as worse:
>>
>> https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/bcm2835gpio.c
>
> Yeah that is quite horrible.
>
> There were reasons to do things like that, but since we have
> developed .set_multiple() to hammer several lines in a register
> at once, the same efficiency can be achieved using the standard
> character device.

Agreed that that helps with user-space GPIO-based JTAG
implementations.  The problem this patch series is trying to address
is for SoCs like the Aspeed AST2400/2500 that include a hardware
accelerated JTAG master.  It _can_ be run in a pure-software mode
where it acts like GPIOs but the intended use case is to operate an
interrupt-driven state machine.  That requires a higher-level
abstraction for managing the standard JTAG state machine.  Similar to
GPIO .set_multiple, user-space feeding a JTAG kernel API a buffer of
JTAG state changes would be useful.  That's how I recall OpenOCD's
internals working: run short (1-7?) state change sequences to move to
the next decision point.  I know of at least one vendor pushing for
the use of JTAG on BMCs as a way to debug host processors in large
deployments instead of using dongles.  I'm supportive of the adding a
JTAG driver abstraction.  I haven't reviewed this patch series in
detail yet.

>
> Yours,
> Linus Walleij
