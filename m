Return-Path: <xow@google.com>
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyCSR6FnTzDqM6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 11:24:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qd5OuEgt"; 
 dkim-atps=neutral
Received: by mail-qt0-x22b.google.com with SMTP id l7so102848842qtd.1
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 16:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RRLDLti8JbShgKhaua6UntRxkMRwZb66D//8R3JtcaI=;
 b=Qd5OuEgtPo0DjwtsJNxlUf9weCkIAzHlJ/WBQV3PlXaefLEHqwvuJffx/5IzLsQ0qj
 e+Dvo6IFuA6TEWxaNz+aGWfZtLIDyfTTUn3L5M8a9gemaA5tJUY5JyCSuKBlAPi3p1KD
 LBQ2wPfEX/eLMo1agimEIn66MBod5f5BInlgY8FU6ipwAnEin04ND5/ojZ2bE2EWC9Ig
 aI0tz+SRAD/1YGGvD8YlRkvOtSRMvW52qzoJu7k06U58ZpHachlK4SpExCL72NCf9FtC
 xP4/nojTHksE6Asl/qIHYUrUvKCehFa66OUqGzBDLAvdTBF5B+S1VwvL/b0tB6JV7zS/
 Et4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RRLDLti8JbShgKhaua6UntRxkMRwZb66D//8R3JtcaI=;
 b=tJMC7LhWnsbsNE0p0ctRAtZqwo4Lb/ScMmighB8XYPr3vJW681iTmkGAEVgIIl25eD
 eLXKpswxhT7ZqT9/C+g+iq95cGISno0H4EAMEO5VrPivP3foJryRsr5/HKOwrmwI9ylw
 G2sjBc8e/KLUBVRc2hQJdobwttlL37tU6WENrlR/T5fl5HVV4hoeQ7x2mNUNronUQsfa
 p5g8oS1y6ul73GojDN+xUXeDXaYK6Ew6uXBUKw+19+PsSqT3sPZoAJeeM5L6vSU827kH
 MK6FHWzXITmbpZ4gVE3FerLCwYpfWBuGSHejnkKXLtjoVow2ZPYvBB3Y6qeV0LM8gaX7
 M9og==
X-Gm-Message-State: AIkVDXLEN9XzC6rvPv0fXiRyQ/jzx9eN6cRgrnEFwi3v6LlRE//919p5Bo2O9UDR9iHS+L7RRs95rf9GOLPbRa/Q
X-Received: by 10.200.57.27 with SMTP id s27mr323153qtb.230.1484007843477;
 Mon, 09 Jan 2017 16:24:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.18 with HTTP; Mon, 9 Jan 2017 16:24:03 -0800 (PST)
In-Reply-To: <20161212040639.24467-2-joel@jms.id.au>
References: <20161212040639.24467-1-joel@jms.id.au>
 <20161212040639.24467-2-joel@jms.id.au>
From: Xo Wang <xow@google.com>
Date: Mon, 9 Jan 2017 16:24:03 -0800
Message-ID: <CAPH-5w44UDvrpkma6k6HN0ZZ7OHt-apPOhT7-S4DhJ676Sz_dg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: aspeed: Support banks Y, Z, AA and BB
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
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
X-List-Received-Date: Tue, 10 Jan 2017 00:24:08 -0000

Hi Joel,

On Sun, Dec 11, 2016 at 8:06 PM, Joel Stanley <joel@jms.id.au> wrote:
> These banks have extra limitations compared to those currently
> implemented. We must detect when these unique banks are being used and
> special case their IRQ and input state.
>
> TODO: Do what it says on the label
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/gpio/gpio-aspeed.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d7198536de13..c4d87a2a489f 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -65,10 +65,14 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
>                 .names = { "U", "V", "W", "X" },
>         },
>         /*
> -        * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
>          * Only half of GPIOs Y support interrupt configuration, and none of Z,
>          * AA or AB do as they are output only.

Is this comment accurate? I don't see anything in the AST2500
datasheet about GPIOs Z, AA, and AB being output only.

>          */
> +       {
> +               .val_regs = 0x01E0,
> +               .irq_regs = 0x0178,
> +               .names = { "Y", "Z", "AA", "AB" },
> +       },
>  };
>
>  #define GPIO_BANK(x)   ((x) >> 5)
> @@ -129,6 +133,9 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
>
>         addr = bank_val_reg(gpio, bank, GPIO_DATA);
>
> +       /* TODO: detect when we're dealing with GPIOs that cannot be set as
> +        * inputs */
> +
>         reg = ioread32(addr);
>         if (val)
>                 reg |= GPIO_BIT(offset);
> @@ -158,6 +165,9 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
>         unsigned long flags;
>         u32 reg;
>
> +       /* TODO: detect when we're dealing with GPIOs that cannot be set as
> +        * inputs */
> +
>         spin_lock_irqsave(&gpio->lock, flags);
>
>         reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
> @@ -233,6 +243,9 @@ static void __aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
>         void __iomem *addr;
>         int rc;
>
> +       /* TODO: Detect when a bank cannot be used as an IRQ source and return
> +        * error */
> +
>         rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
>         if (rc)
>                 return;
> --
> 2.11.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Do you have more information or documentation about the limitations of
those GPIOs?

thanks
xo
