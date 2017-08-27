Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgV2m3RT9zDqYs
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 08:30:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="WkQ3QBdf"; 
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id g127so18579925oic.1
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 15:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=oNsM/8lAycT45szG2th1/qcMm754Oa2F78FlNX2p0/4=;
 b=WkQ3QBdfY2uhZ6NsP6uA1XP/jauRnhRTFFhoNiQdW4Z0k8V7uT9DZxb7yw1Llk7ApW
 NQxfIEMqAPzpU0FHBMaRNBxf9q0ZTt0KZKGsVkYzsAkQ8AYgMkr4V9OYN9kr/FTL7Xfc
 1meyvbk4/YC7BcD70/J+RhRtArFAR/eVaGcqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=oNsM/8lAycT45szG2th1/qcMm754Oa2F78FlNX2p0/4=;
 b=AohytbLm+6IwJH9crc527G9z6eEUnkCz9tvlJwjgEg/9icKLDELdTkPjVb+zb7uMKb
 3nkayIYZkRqQnWGrO+0cH+Xu93yKukB5akBwW5AhMxd987T6E/We2zGqknUjosOr2Gp7
 l9H2Bl6tfzHzajTKIqNAzb3XxO6OkJmW2dltx1xwYNctXhlcNH04GfGtTjFaLqC9a++u
 qOruvr5njtpfHlWS1LCtwtTVkDZNPQDz+fXbc55SnRQQH7XDOaLDwm9ue4logEUYbqGL
 rWxt+vKB8vywff56E2YlAIMQz2g+DQCgsoQa8FiHVrX4rupEX6FHoyyFris9MBt1jW3v
 UZwg==
X-Gm-Message-State: AHYfb5inSQsvGf1njlxF48YrXmzHVZMp5BW6y935d/0Hngj21XbD+RTl
 JyF3VdqK/s31GsiO2aF1h2Ve8kT284fx
X-Received: by 10.202.196.1 with SMTP id u1mr4736924oif.316.1503873006224;
 Sun, 27 Aug 2017 15:30:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.58.74 with HTTP; Sun, 27 Aug 2017 15:30:05 -0700 (PDT)
In-Reply-To: <CAPLgG=mv1p98e4Vzso1N-VU=1MSotkTmnF+DcDTXPcd3q-n8HA@mail.gmail.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
 <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
 <CAPLgG=mv1p98e4Vzso1N-VU=1MSotkTmnF+DcDTXPcd3q-n8HA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Aug 2017 00:30:05 +0200
Message-ID: <CACRpkdb75L5BrYN+V-BMwzrRm8_Wtymr3d08eMWt43FiBpH5Qg@mail.gmail.com>
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Sun, 27 Aug 2017 22:30:09 -0000

On Fri, Aug 25, 2017 at 6:52 PM, Rick Altherr <raltherr@google.com> wrote:

>> Incidentally, people are sending patches to expose the FTDI
>> expanders as common GPIO chips under Linux, so we can
>> internally in the kernel or from the usersapce character device
>> access them as "some GPIOs".
>
> I know my team at Google has an internal patch for exactly that.  FTDI
> expanders are complicated as they can be used as UART, GPIO, I2C, SPI
> depending on configuration.  Our project was using a mix of I2C and
> GPIO so I directly my team to approach it as an MFD.  I'd like to see
> all of these use cases handled by the kernel but I understand the
> other viewpoint of relying on libusb for cross-platform compatiblity.

Hm. I see. But I see people pushing the in-kernel method so I think
it will eventually win out.

>>>> In my worst nightmare they export GPIO lines using
>>>> the horrid ABI in /sys/gpio/*
>>>
>>> https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/sysfsgpio.c
>>
>> Gnah!
>> Whoever writes a slot-in replacement making the character device
>> take precendence wins lots of karma.
>
> If they show up at Linux Plumbers or visit San Jose, I'll take them to
> dinner.  I didn't see any docs for the chardev in Documentation.  I
> _think_ I understand how it works from reading the relevant sections
> of gpiolib.c but I can see how users end up using sysfs instead.

I intended tools/gpio/* to be the documentation:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/gpio

If we need more written documentation we can do it I guess,

Yours,
Linus Walleij
