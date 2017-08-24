Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x22d.google.com (mail-oi0-x22d.google.com
 [IPv6:2607:f8b0:4003:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdcLr1ThczDqF7
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 07:07:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="O3N0uiN8"; 
 dkim-atps=neutral
Received: by mail-oi0-x22d.google.com with SMTP id r9so6077301oie.3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 14:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7XiEb5XvZM+n+ABvgrJxMu2sDfdvEl3grI/Dnaib6HU=;
 b=O3N0uiN8EzCSLd/6Sn+ZnQkBHXgU3VmXoZtrpaJP5wsxZjJp395tXcVxowNyNWOd1b
 VqnVndxpFqUHXEMYO38miYnfKEfyAsYUXXS+j+fBFW74Tx0W6mVQnREf45xx4XwMKHbw
 ePTum3Vzy89bM+/C7d0BFNc1vY2buCGN+qiwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7XiEb5XvZM+n+ABvgrJxMu2sDfdvEl3grI/Dnaib6HU=;
 b=anKqFyqgxy98voUu3EBohFQ8u9fXlyHXjCLbUpJ/dxBewtFNzy9MIN1TGWUaEqtlI1
 PgKh57/BHOCqudWyqI0Vx742PDJ4mJEYYp1DVCdKc57fAJZSmVv4ddI9wZnAhm548QjI
 o6ffDZwF10Vsp19s249bCZooVwe2Mm/gPyc4kXgw3p612ecWr4A8iFbgOprNzdppLf8Q
 Os0lSiia0jvMCVsdNGv0IjYmEr1G+Z1MxGBSkqnw9jdjo9vKZrjNN2G7jnbZlBWEshii
 bMr4Qx4b6MpnhanGCrmyQvzw+UDjl1eLYs2IKL6SJThk6qTvFcjm56bNlsmsjOZmRoJX
 sVmQ==
X-Gm-Message-State: AHYfb5iTB7lIU4Hk4RXD41KRuZxc5CByV8l8Szqx7b6sSMWXAqhatnXc
 qXnQg2sA/LhakMsn2mwWXPHGSuOHGQN0
X-Received: by 10.202.102.199 with SMTP id m68mr9139492oik.297.1503608849700; 
 Thu, 24 Aug 2017 14:07:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.58.74 with HTTP; Thu, 24 Aug 2017 14:07:29 -0700 (PDT)
In-Reply-To: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Aug 2017 23:07:29 +0200
Message-ID: <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Joel Stanley <joel@jms.id.au>, jiri@resnulli.us,
 Tobias Klauser <tklauser@distanz.ch>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, mec@shout.net,
 vadimp@maellanox.com, 
 system-sw-low-level@mellanox.com, Rob Herring <robh+dt@kernel.org>, 
 openocd-devel-owner@lists.sourceforge.net, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
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
X-List-Received-Date: Thu, 24 Aug 2017 21:07:33 -0000

On Tue, Aug 22, 2017 at 6:10 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:

> SoC which are not equipped with JTAG master interface, can be built
> on top of JTAG core driver infrastructure, by applying bit-banging of
> TDI, TDO, TCK and TMS pins within the hardware specific driver.

I guess you mean it should then use GPIO lines for bit-banging?

I was wondering about how some JTAG clients like openOCD does
this in some cases.

In my worst nightmare they export GPIO lines using
the horrid ABI in /sys/gpio/*

In best case they use the GPIO character device or even
libgpiod.

But having a JTAG abstraction inside the kernel that can
grab a few lines for JTAG defined in a device tree, ACPI DSDT
or similar makes sense too, as it abstracts the hardware so the
JTAG client can then just open whatever /dev/jtag0 is on the machine
and go ahead without having to bother about what GPIO lines
are connected exactly where.

Yours,
Linus Walleij
