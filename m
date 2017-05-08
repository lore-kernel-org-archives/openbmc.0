Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMJkt1QCszDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 09:35:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="auLJ710p"; 
 dkim-atps=neutral
Received: by mail-qt0-x229.google.com with SMTP id j29so63228969qtj.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 16:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=BZYI2f8U1RhHrnnJtde1Xpr0cCeovpXJAlaci4C6Vwc=;
 b=auLJ710pFNkH4KBjbxpaSNLZSETEgKZGKQ4A68oPxqzPbRyvVFWrUcyTA+DhjK1Y02
 5N2tu28TXwbYCKseZYriH/DO0eHffG1M6Yv2ZeMLOTav0PaoWvR4qlrgxLOfaXZYEXzp
 l5jNUB/l2gmejqJQeI9JWka/iEf9zt878azU5BX2MzDwIz2KLZNI87K4dTLMCmz5zEMG
 NENCIh77lMraoXUskj6aOUGQ62mXpDpQjqQFqRVgXJgW4vKxTLFkhTxbWaqjEPP5Eppw
 gWTsmjWlj3exMukIV97MQVJi7ZWSxw9gci7K7gK+/kyu9EvJN5EbqZAxlT9E9Y6xuGHY
 wktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=BZYI2f8U1RhHrnnJtde1Xpr0cCeovpXJAlaci4C6Vwc=;
 b=JNl12HP2Kh4/E4l3p9Yu/594R3FqzNC1koUtrGJXy2tJiR2X4glSA4ErRf95UGIADe
 351wUjOOikpib6gsRltyjEuOTQzrSFopgKxUTzWpNY5QqClrNxxQT3X3XbzqiGy5M9sQ
 nOhA0VAi4uPuFzhBYmB4qIYdbye0etke7sHia7I5BMFDNMYfZvPewSsxXFYLQHhUqqTV
 LBm1UuuWprTzHn7MXwYhduKHISxRB2fyWbM/CegzAsPpZ29frt/05ej/Ac+yebQS3jXy
 6+MuoXmv4FgntYyTnNA+CL4DrYtSDCGgozLgiMngffOyZbt0h2bPvR3St/O294P+MCLN
 ww5g==
X-Gm-Message-State: AODbwcA+/nE1UbJgTDK+z8Hy8h+FtGccxHpfjqCy+YYQwz80bhE8Ea45
 4973joOaqN2GAOWBhtYNmXQigQpoBO18
X-Received: by 10.200.4.42 with SMTP id v42mr10123451qtg.2.1494286499042; Mon,
 08 May 2017 16:34:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.229 with HTTP; Mon, 8 May 2017 16:34:58 -0700 (PDT)
In-Reply-To: <20170424181818.2754-5-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-5-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 8 May 2017 16:34:58 -0700
Message-ID: <CAFd5g44RxehYCYB=WnxiXMZJe6E5_baQKDvdLAJX7+TTbvpi0Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Mon, 08 May 2017 23:35:03 -0000

Sorry for the spam everyone, email client did not do what I expected it to do.

I would like to release another version this week or next week, and I
think that we are pretty closed to having something we can apply, but
before I do that, I want to get something resolved:

> +static int __aspeed_i2c_init(struct aspeed_i2c_bus *bus,
> +                            struct platform_device *pdev)
> +{
> +       int ret;
> +
> +       /* Disable everything. */
> +       writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       ret = __aspeed_i2c_init_clk(bus, pdev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Enable Master Mode */
> +       writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) |
> +              ASPEED_I2CD_MASTER_EN |
> +              /* TODO: provide device tree option for multi-master mode. */

I am curious what everyone thinks about this. It seemed that, earlier
on, people did not like me disabling multi-master mode, but I think
that it would make bus recovery not work as well. Given that, I think
it makes the most sense to provide a device tree option either to
enable multi-master support or disable it. Thoughts?

> +              ASPEED_I2CD_MULTI_MASTER_DIS,
> +              bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       /* Set interrupt generation of I2C controller */
> +       writel(ASPEED_I2CD_INTR_ALL, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +
> +       return 0;
> +}
