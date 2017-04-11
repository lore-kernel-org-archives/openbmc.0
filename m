Return-Path: <andy.shevchenko@gmail.com>
Received: from mail-qk0-x22e.google.com (mail-qk0-x22e.google.com
 [IPv6:2607:f8b0:400d:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w2Qx60jlkzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 22:15:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BCHe3WUZ"; 
 dkim-atps=neutral
Received: by mail-qk0-x22e.google.com with SMTP id p68so112183372qke.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 05:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EA3d96utm6KLZKsHvgTpUyeBlF/1263FM6F2nqwzL5U=;
 b=BCHe3WUZzRJk9WcQZnnqKeQrcikfomq9eths+V2S3mIquV0exihv5Hi+SLF7R7uDWb
 YlNBACNa59V751f05exDQK+3hH/AUn8CWeEq74wGpYTCdkTXACeYi7eHjoeljwqX0t+h
 tyHS4s6jSqZM4O9fkb+mJkQpPVQsgC32f0JEinenSENKdqYA5ydlnGYw2bKSNk6tURUy
 dF5+xTVKv5BKW8zKvrO754/EjovbbqhiVBbiwRiozPWuEUSfOVW8c1UE6r6xRbJ/vaSm
 ppvXK7P40s4aj+fFxsWXcxK6KKX3LQsquBsaRG5mW+3VvYOxTIrwZlOrGq1/iJzyau+2
 //GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EA3d96utm6KLZKsHvgTpUyeBlF/1263FM6F2nqwzL5U=;
 b=fIPgFN9ZX/UYsAobFSGEGhabug6WVkZtwLZ/9+z2ANC1WT3ElGGOtvXxUyaXhIMloj
 oPKIQAGXthzxOO6oLN9QKly18TM1J/3EPPUL00e0IUFL8CDbbjVaZycxCStN3urc2xOZ
 NkdllR0vQ9AYKRF7EQ7cKpbADYDgc8NVEkCQfuebW5miVOPYrcuSqyWd1G+akU9N8wrL
 eBJxiaq1xRFqHXfALB86A0gC5KjjXHLnZufJIvoX2FFM3S3U3nQpK8i7byAX7BFKtvo2
 RNwrg3uGzGWJ78fEtZUu1IG41ArcCACnrrn//i2+tPjzd0x2Jk2aBt4cJJXVr0ZO3x5R
 9ypQ==
X-Gm-Message-State: AFeK/H0ipq8A5esarZYFsC92K+ahu469gsTATK9PlqL54I/9KGzXQaRFeE4nOldnd9vF4hmh4USTKwEFJTVkfg==
X-Received: by 10.55.132.195 with SMTP id g186mr60351928qkd.198.1491912918733; 
 Tue, 11 Apr 2017 05:15:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.87 with HTTP; Tue, 11 Apr 2017 05:15:18 -0700 (PDT)
In-Reply-To: <20170410040400.5509-3-joel@jms.id.au>
References: <20170410040400.5509-1-joel@jms.id.au>
 <20170410040400.5509-3-joel@jms.id.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Apr 2017 15:15:18 +0300
Message-ID: <CAHp75Vd=oONhzF34Pe8WwYKBWWxcsaQtgJy66aFD68iNKTxEfg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drivers/serial: Add driver for Aspeed virtual UART
To: Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 11 Apr 2017 12:15:22 -0000

On Mon, Apr 10, 2017 at 7:04 AM, Joel Stanley <joel@jms.id.au> wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>
> This change adds a driver for the 16550-based Aspeed virtual UART
> device. We use a similar process to the of_serial driver for device
> probe, but expose some VUART-specific functions through sysfs too.
>
> The VUART is two UART 'front ends' connected by their FIFO (no actual
> serial line in between). One is on the BMC side (management controller)
> and one is on the host CPU side.
>
> This driver is for the BMC side. The sysfs files allow the BMC
> userspace, which owns the system configuration policy, to specify at
> what IO port and interrupt number the host side will appear to the host
> on the Host <-> BMC LPC bus. It could be different on a different system
> (though most of them use 3f8/4).
>
> OpenPOWER host firmware doesn't like it when the host-side of the
> VUART's FIFO is not drained. This driver only disables host TX discard
> mode when the port is in use. We set the VUART enabled bit when we bind
> to the device, and clear it on unbind.
>
> We don't want to do this on open/release, as the host may be using this
> bit to configure serial output modes, which is independent of whether
> the devices has been opened by BMC userspace.

> +static void aspeed_vuart_set_enabled(struct aspeed_vuart *vuart, bool enabled)
> +{
> +       u8 reg;
> +
> +       reg = readb(vuart->regs + ASPEED_VUART_GCRA);

> +       reg &= ~ASPEED_VUART_GCRA_VUART_EN;
> +       if (enabled)
> +               reg |= ASPEED_VUART_GCRA_VUART_EN;

Usually the pattern is
if (something)
 set x bit;
else
 clear x bit;

It would make it one operation in any case and a bit more understandable.

> +       writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
> +}
> +
> +static void aspeed_vuart_set_host_tx_discard(struct aspeed_vuart *vuart,
> +                                            bool discard)
> +{
> +       u8 reg;
> +
> +       reg = readb(vuart->regs + ASPEED_VUART_GCRA);
> +
> +       /* If the DISABLE_HOST_TX_DISCARD bit is set, discard is disabled */

> +       reg &= ~ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD;
> +       if (!discard)
> +               reg |= ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD;

Ditto.

> +
> +       writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
> +}

> +       /* The 8510 core creates the mapping, which we grab a reference to
> +        * for VUART-specific registers */

Hmm... What about multi-line style?

> +       port.port.irq = irq_of_parse_and_map(np, 0);

The benefit of use platform_get_irq() is to get rid of some OF specific headers.

-- 
With Best Regards,
Andy Shevchenko
