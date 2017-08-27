Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgTxB6DzgzDqYf
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 08:25:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="LtMIiiWY"; 
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id r9so32880362oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4uaCU5QHrsYxMFoNH/4uVchmvYg0rLt4smSyGFSp8M8=;
 b=LtMIiiWY4AfKv0gocZtbENZfdnuYmK2o7vsXnMYYY+Td/HiSj//8p3Q8QC1QGAqx9b
 /T/ui0pDfQgPXRr/Tkri2eexFIqZzTfuSlwinM6BmL4R/F0go46oB5/VC92BtnJEhqlk
 jrsGw1nABMlVscoAKu37ygXS5/3NY2ap8r4/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4uaCU5QHrsYxMFoNH/4uVchmvYg0rLt4smSyGFSp8M8=;
 b=DEMegGQhbwClmHDelWOVfyAuFucPuXlmylgVdGbuVhTElM5/ALlcGG13370pacxFyw
 xEiNtgqcbFyPb5EmI9WavnKhff2lA5pMvk8wVHN9MVk3ut6e3B13XdhOD2a+tDU8WLOQ
 J0GCNrZ7UTEAfMhMzRXtV0OyNX6xD6xcSdrAT7Q4Lql12kBjsgfIIqSHFxC/MMG6VDE3
 AcuOqeiy2dYy7L+EbeKI7MlkijqNm42XDkJOWU5FGxZTCc1hljMocfOPYlZ8py6jVBeI
 1sHB7a4toXmIdIXCzZKuSpRovrYAo0JI5cE65uSn6s8lUjZbKLdITP9sBQQE2/Q3ls6y
 A6Qg==
X-Gm-Message-State: AHYfb5gOoqlwTIfUYY1Ca2xMDttE81zOKs6TvQudh5hF0cEOuWEwYY31
 xFugzYqluiikm6AMk1j561Q5Xg3y/QpW
X-Received: by 10.202.170.73 with SMTP id t70mr7420949oie.78.1503872715591;
 Sun, 27 Aug 2017 15:25:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.58.74 with HTTP; Sun, 27 Aug 2017 15:25:14 -0700 (PDT)
In-Reply-To: <593cd0d3-8e06-0992-c155-1322014c0477@longlandclan.id.au>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
 <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
 <593cd0d3-8e06-0992-c155-1322014c0477@longlandclan.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Aug 2017 00:25:14 +0200
Message-ID: <CACRpkdbgbRgqi=sVs0Rk_qPLUFC6wwvcWKKdiDjfXHdUZ4EXjg@mail.gmail.com>
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Stuart Longland <stuartl@longlandclan.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 Oleksandr Shamray <oleksandrs@mellanox.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Arnd Bergmann <arnd@arndb.de>, system-sw-low-level@mellanox.com, 
 Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openocd-devel-owner@lists.sourceforge.net, 
 mec@shout.net, Rob Herring <robh+dt@kernel.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Tobias Klauser <tklauser@distanz.ch>, 
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
X-List-Received-Date: Sun, 27 Aug 2017 22:25:20 -0000

On Fri, Aug 25, 2017 at 10:50 AM, Stuart Longland
<stuartl@longlandclan.id.au> wrote:
> [Note: dropping vadimp@maellanox.com as SMTP server complained about the
> DNS server returning NXDOMAIN.  Apologies.]
> On 25/08/17 18:32, Linus Walleij wrote:
>> Gnah!
>> Whoever writes a slot-in replacement making the character device
>> take precendence wins lots of karma.
>
> What would such a replacement look like though?

Something that looks for /dev/gpiochipN and if it exists open the GPIOs
from there and make that take precedence over any /sys/gpio/*
poking.

> Some sort of system whereby you can read/write single-line commands as
> if talking to a GPIO expander over a UART?

I don't really understand the question. All GPIO expanders become
a gpiochip, and have their own character device in /dev.

> Would you access the GPIOs one by one, or would you perhaps map them
> into a bitmap (maybe arbitrarily, up to 64-bits wide) and perform masked
> operations on the bitmap?

The character device supports up to 64bits of simultaneous line
switches, but the in-kernel API can only handle 32bits
in a single register write.

> I'm no fan of the sysfs GPIO interface, but it beats poking around at
> registers behind the kernel's back.

Have a look at libgpiod and tools/gpio/* in the kernel.

Yours,
Linus Walleij
