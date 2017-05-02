Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHCyb2RLhzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 17:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UmWlmOeX"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id k11so11032589ywb.2
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 00:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2eFrsAJtJYNRlJNGbBEruKHWBHAd7a4j/GBhwi1FJpA=;
 b=UmWlmOeXBuorIzQGNohGH0P5rNfuQbmBpftP3A6Nt1+45yhDFhyVkwh7FRiVT1HL39
 Om0PbtXE1FuJxGlMosUHD0XmFwwphYDBCZBsw1mXi8ipAkY9v4tsADJm0XRkPZl0Sm9r
 9gF3kl3MP2Dhbw8s9moSSvTPb/kzmTog184kGFl2bHWqyQbnBW8EgAxzFk4z0EXF9WOw
 d53523A8CAT0laAZWuQz2YwGhzmm/i032w4V1WELznDbzJ62y5sDG2wwpKQuJVD45uQv
 zxqhlb3Wp8cfcxLZcUAmNNphEHFHvWz781XKeV94lF9FC4PXe3PSh0YBYEXdolKnk9nP
 g0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2eFrsAJtJYNRlJNGbBEruKHWBHAd7a4j/GBhwi1FJpA=;
 b=BXjTH/UvgCZSVLL9VxbP4COwviKr5bQE8yS6klQwWvNHPbT1fLL8+uh6P9yakaggfP
 pCtUza/k8Ecsy8LWYPYLoWtAXKGyho84Ts2LSPj302opgOUI31oRTksI3J/C/7bMqty6
 4vyVM126IO7irYqRNuSRl2ogxxNLKOnvSzJ8VcrsvTJgu1rbQ8qKpcbZ0c386AqDlYXz
 BLynUmU3suGRgTxMP1QASUXA1DzS2vlkf4vDAgneVAXzRwblYG0Lrv81tF0Mxi0AfWHG
 btSyideO3a74drh8EjoH3ACT54i8w5f4ncan6wEvVOzieKvs5bJNRB2jydS0L1vP/4rX
 YfnQ==
X-Gm-Message-State: AN3rC/6pv4fEHtYbLU2SsHfpPQBjALCqFp6M5GrUNvXrkeTT1rltZFbD
 A9URRz1OLvPyGsKBsdOZRBIsfQiRGQ==
X-Received: by 10.13.251.4 with SMTP id l4mr22887122ywf.329.1493711157051;
 Tue, 02 May 2017 00:45:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 2 May 2017 00:45:36 -0700 (PDT)
In-Reply-To: <CAHp75Vd=oONhzF34Pe8WwYKBWWxcsaQtgJy66aFD68iNKTxEfg@mail.gmail.com>
References: <20170410040400.5509-1-joel@jms.id.au>
 <20170410040400.5509-3-joel@jms.id.au>
 <CAHp75Vd=oONhzF34Pe8WwYKBWWxcsaQtgJy66aFD68iNKTxEfg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 May 2017 17:15:36 +0930
X-Google-Sender-Auth: iBlwxz8OPi--Akk7E-71odMKxWY
Message-ID: <CACPK8XfCLxRkdAdmtgNLrTMwXzk8cRsfV2e16SCY6O6e73JNyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drivers/serial: Add driver for Aspeed virtual UART
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 02 May 2017 07:45:59 -0000

On Tue, Apr 11, 2017 at 9:45 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 10, 2017 at 7:04 AM, Joel Stanley <joel@jms.id.au> wrote:
>> From: Jeremy Kerr <jk@ozlabs.org>
>>
>> This change adds a driver for the 16550-based Aspeed virtual UART
>> device. We use a similar process to the of_serial driver for device
>> probe, but expose some VUART-specific functions through sysfs too.
>>
>> The VUART is two UART 'front ends' connected by their FIFO (no actual
>> serial line in between). One is on the BMC side (management controller)
>> and one is on the host CPU side.
>>
>> This driver is for the BMC side. The sysfs files allow the BMC
>> userspace, which owns the system configuration policy, to specify at
>> what IO port and interrupt number the host side will appear to the host
>> on the Host <-> BMC LPC bus. It could be different on a different system
>> (though most of them use 3f8/4).
>>
>> OpenPOWER host firmware doesn't like it when the host-side of the
>> VUART's FIFO is not drained. This driver only disables host TX discard
>> mode when the port is in use. We set the VUART enabled bit when we bind
>> to the device, and clear it on unbind.
>>
>> We don't want to do this on open/release, as the host may be using this
>> bit to configure serial output modes, which is independent of whether
>> the devices has been opened by BMC userspace.
>
>> +static void aspeed_vuart_set_enabled(struct aspeed_vuart *vuart, bool enabled)
>> +{
>> +       u8 reg;
>> +
>> +       reg = readb(vuart->regs + ASPEED_VUART_GCRA);
>
>> +       reg &= ~ASPEED_VUART_GCRA_VUART_EN;
>> +       if (enabled)
>> +               reg |= ASPEED_VUART_GCRA_VUART_EN;
>
> Usually the pattern is
> if (something)
>  set x bit;
> else
>  clear x bit;
>
> It would make it one operation in any case and a bit more understandable.

I have made these ordering changes you requested.

>
>> +       port.port.irq = irq_of_parse_and_map(np, 0);
>
> The benefit of use platform_get_irq() is to get rid of some OF specific headers.

It's an of driver, and this function does exactly what we require. I
have left it in for v4.

Cheers,

Joel
