Return-Path: <raltherr@google.com>
Received: from mail-ua0-x231.google.com (mail-ua0-x231.google.com
 [IPv6:2607:f8b0:400c:c08::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgbxJ30jlzDqR9
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 12:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iO0kBFOf"; 
 dkim-atps=neutral
Received: by mail-ua0-x231.google.com with SMTP id w17so13325783uaw.5
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0fTKxp5VDmE7vLpw10jTWaN33xLXw+CaiX2lBAVnV4c=;
 b=iO0kBFOfbmB+ACjk9yi5W4W6RvDHyeY1zTGM3CR0ppBrVgOeSGIYHtHhj1KwazNam9
 MalTtFwKOsxc3eZaQzb/WAVFeMWGPQ1FQ9IFbf4GDptLSwtEI+efvYH65WutS6npkRxF
 iXe79mqvB8L78Ayz263fCMMN39iW8yQSPFswAk5SXY/7qxFADfiEzjnMHz2L5x1yZSeF
 awL0IF5aZDhxvr5Wj4CzwRw8gbYuRPEyVXZxtIWrBhpUTp4463Dxpp92UGj7jHtFQCgw
 a4D6h1LxJ69S2OM6KafBGzfqXuUsMdU29O5R61Yc16pJveTCGSpX16zuOJLBZ3swLpCa
 F2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0fTKxp5VDmE7vLpw10jTWaN33xLXw+CaiX2lBAVnV4c=;
 b=RsoT38UgfDLgfeySAxvXTmKXC5r4hIiqsIldqT2BnHbirgvjwSHY7aaXD8zLzTQpSp
 M65mHiDqQ7xol+lMJx/a21ijeN/Wk8BGuI2hxgNErYSoxL4dVEbePN84CNig6rcL0+iu
 ZHBoRwnc+5JCg3fpav/VH7l/HFzaicXfPVgNC0b7M1MG7y0cd6jOHVqeTnh8zHB9gT/Y
 xTmtY9bX+UyU3JKsrdfy++YldKweDJYtPmSLFhi5Ke82BURKpSkkZsZZSCo92znICjey
 m8nuEDPvi+gdcYU4IgkQkryp5JLykOPmV/rpnhppumgYFtclup/AWMCm93iDaV962qir
 2IHg==
X-Gm-Message-State: AHYfb5h6Xqx3UQREPi3xgkzDgih3oXIdCuwxTSgyz2zcMsZ5x87nqjAh
 4cR7TpruZmHtI9lrci9jNycbQeze2ExB
X-Google-Smtp-Source: ADKCNb6tZrf+8614yeoYH14sxduYdODmiMlQ3rg6JF6g6u3gJzY1ZzEZJ/g5U64kvtPO0ZOB9gBEjGwqys9fluqDkuM=
X-Received: by 10.159.49.197 with SMTP id w5mr3589737uad.18.1503888944594;
 Sun, 27 Aug 2017 19:55:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Sun, 27 Aug 2017 19:55:43 -0700 (PDT)
In-Reply-To: <CACRpkdb75L5BrYN+V-BMwzrRm8_Wtymr3d08eMWt43FiBpH5Qg@mail.gmail.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
 <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
 <CAPLgG=mv1p98e4Vzso1N-VU=1MSotkTmnF+DcDTXPcd3q-n8HA@mail.gmail.com>
 <CACRpkdb75L5BrYN+V-BMwzrRm8_Wtymr3d08eMWt43FiBpH5Qg@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Sun, 27 Aug 2017 19:55:43 -0700
Message-ID: <CAPLgG=n2r+rJKSAZKknuqH_S2W6CrWN-Ynqph-qPc9BTs-_hQA@mail.gmail.com>
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
X-List-Received-Date: Mon, 28 Aug 2017 02:55:49 -0000

On Sun, Aug 27, 2017 at 3:30 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Aug 25, 2017 at 6:52 PM, Rick Altherr <raltherr@google.com> wrote:
>
>>> Incidentally, people are sending patches to expose the FTDI
>>> expanders as common GPIO chips under Linux, so we can
>>> internally in the kernel or from the usersapce character device
>>> access them as "some GPIOs".
>>
>> I know my team at Google has an internal patch for exactly that.  FTDI
>> expanders are complicated as they can be used as UART, GPIO, I2C, SPI
>> depending on configuration.  Our project was using a mix of I2C and
>> GPIO so I directly my team to approach it as an MFD.  I'd like to see
>> all of these use cases handled by the kernel but I understand the
>> other viewpoint of relying on libusb for cross-platform compatiblity.
>
> Hm. I see. But I see people pushing the in-kernel method so I think
> it will eventually win out.
>

SGTM.  I'll see if my team can clean up the MFD-based FTDI driver and
submit it upstream.

>>>>> In my worst nightmare they export GPIO lines using
>>>>> the horrid ABI in /sys/gpio/*
>>>>
>>>> https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/sysfsgpio.c
>>>
>>> Gnah!
>>> Whoever writes a slot-in replacement making the character device
>>> take precendence wins lots of karma.
>>
>> If they show up at Linux Plumbers or visit San Jose, I'll take them to
>> dinner.  I didn't see any docs for the chardev in Documentation.  I
>> _think_ I understand how it works from reading the relevant sections
>> of gpiolib.c but I can see how users end up using sysfs instead.
>
> I intended tools/gpio/* to be the documentation:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/gpio
>
> If we need more written documentation we can do it I guess,

I haven't been in the habit of looking in tools/.  Guess I should be.

>
> Yours,
> Linus Walleij
