Return-Path: <raltherr@google.com>
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdd120WqPzDqYs
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 07:37:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ifVLb5gv"; 
 dkim-atps=neutral
Received: by mail-ua0-x234.google.com with SMTP id j46so2549496uag.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qLVI7V99ruod35x/XZbCPrtAHmgIPs3O5Mp+qY+PX8s=;
 b=ifVLb5gvlcoNqRLGAZgCcHUbAFCDCxdOtSmLLrjGPCHpGkLXaGLOMIqPG4nlJsK8Nt
 jUGwHp/1QNkc2cr5zW8seq8U2IELeW2+fl/jxYNLY1yNF8dEd8kRQiFAqz5qCmERIj+U
 gVRlK3KuHri78g0+6VGsVTaA50wIGT9du9uJ5T7Zj9WBLwMJ/a83nr6TeTnVrtrQkygG
 DtMp1pA15Qj3tpg/x4G6pkDbcfg+JTOb/dhGZTgYQ7Bs624jHNRoA+XdV5svtUdxbc1W
 tx4FkHsC4zXHMWrH44ibg2UEtTiFOdrMiHSr4t8zuSnLs5xs02ONh/VRFsvVVwgYJyOc
 MX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qLVI7V99ruod35x/XZbCPrtAHmgIPs3O5Mp+qY+PX8s=;
 b=Bc+Iw7fms/3rryHka9GdbEyL0/FuVrlmxhmM9r6HjF6Mh1hk6UCiWN+//egiWd3IDo
 ratGiC7smtoDSHaauCZlwJkUn7+8tAC9Xv/WUSCkFJCXk+7sfsjFlmdapGD5XT2s8pGw
 gKccQ1eiWbnMcWPedeEa5yMnS2Hme8Lh4v2B9Qxohq/xA6ZMJXCFC5lvaBTtrpfMGbOk
 LCUYqOXV6qR6ILHVQ3KWb1EjWe+h1IGeQhPXRsp2bS8zAQJ2wj8eCMXWIKHvyJV0n08i
 HebnzV2cQCJItrdmicBtPQ08RSw786Ryed3nC3bmDlRrP0o0DaJ6c/o7CqWve7ayNQ7M
 GtdA==
X-Gm-Message-State: AHYfb5j6dQkQydKVpPZCYmII4p0OeflLTRjAeYC1ffiCx1HyvZMuGcgK
 Gbfsqnnx1ox7hAfNc6ex937/MNfJKaMo
X-Google-Smtp-Source: ADKCNb6f/KT9hDW1s4/9whR0PngPnTiL9Ze6Iw7pz/Vd3v++2BujbJ1fDBiDBtEKVNUC8Uewydz83TDQYkVMZ8ykz78=
X-Received: by 10.176.90.207 with SMTP id x15mr5704610uae.92.1503610627033;
 Thu, 24 Aug 2017 14:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Thu, 24 Aug 2017 14:37:06 -0700 (PDT)
In-Reply-To: <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 24 Aug 2017 14:37:06 -0700
Message-ID: <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, jiri@resnulli.us, 
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
X-List-Received-Date: Thu, 24 Aug 2017 21:37:11 -0000

On Thu, Aug 24, 2017 at 2:07 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Aug 22, 2017 at 6:10 PM, Oleksandr Shamray
> <oleksandrs@mellanox.com> wrote:
>
>> SoC which are not equipped with JTAG master interface, can be built
>> on top of JTAG core driver infrastructure, by applying bit-banging of
>> TDI, TDO, TCK and TMS pins within the hardware specific driver.
>
> I guess you mean it should then use GPIO lines for bit-banging?
>
> I was wondering about how some JTAG clients like openOCD does
> this in some cases.
>

Many common uses of OpenOCD leverage USB devices, such as FTDI FT232R,
that have a command queue for bitbanging operations.  Managing these
via libusb is ugly but platform-agnostic.

> In my worst nightmare they export GPIO lines using
> the horrid ABI in /sys/gpio/*
>

https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/sysfsgpio.c

While that is certainly horrible (and slow), mapping in the GPIO
registers via /dev/mem strikes me as worse:

https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/bcm2835gpio.c

> In best case they use the GPIO character device or even
> libgpiod.
>
> But having a JTAG abstraction inside the kernel that can
> grab a few lines for JTAG defined in a device tree, ACPI DSDT
> or similar makes sense too, as it abstracts the hardware so the
> JTAG client can then just open whatever /dev/jtag0 is on the machine
> and go ahead without having to bother about what GPIO lines
> are connected exactly where.
>
> Yours,
> Linus Walleij
