Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s754C32nqzDqQq
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 15:06:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gdu0x1oa; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id e125so3024577ybc.0
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 22:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4Scw0uSBe+0KQca2UyhGjN0qyeZ2wdBLzU65dFUd21s=;
 b=gdu0x1oaAOYRTiPPlm9If/psp08Mmce4srpJHKJabsljZTCgNo8gdJhOTCBU0+zTvk
 xWpgcnao+8JuEJspDIBHtGiPu//FP+WPZQnud1j5myXCjYlAF5bGv3h4wL8nLe9vjy2v
 N6IEn3UDNVH7H2+g3CONXGo3o6VdxkkQoAxtQwZ1Ye18FDJ4K4pTvWKLkahHpNZPOJMd
 pJQVRC3fFnk8pgNpGhLUtUoPPb4R++Br/xa/AjxousZPBxms9GaZF4EFjby7jKbfEH3o
 lG/ApbNHbLd9Va5+M7BK/CPwg8GBm7OovA98lkQQu08VEjtaqyeGUZw6/NC4xK4FsiJU
 kdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4Scw0uSBe+0KQca2UyhGjN0qyeZ2wdBLzU65dFUd21s=;
 b=aKeSAkzQ3qZx9RW89d+ExB4UniWsH4clHIQOutJLCOytSDkyTPLXn27KNB6F+Xoi/v
 QvoOEY42raS+FDmIoFvnTvF/8gh+zKOuJjLVimuKdFfhBFqaClsBUtCmcrqpqSEoZt07
 6IBUBxVXGSJKuV80Q4LuE/kZty+O/376XicpGUEu6czvfmWxsNdPEAQfWTzSZArGxsub
 V1Qgl+QTsd8byZ+Atxhaa5ANEVL2XOQxXQDAlvklrk0anmv6526aWJPKY9B8hmOJPROU
 C7A75cOGWoDsdP0kwgihLmQOz2bEN/X58fobYuYgqjAlb9+NS51dKLokVSnKL8FFgfR9
 gzaA==
X-Gm-Message-State: AEkoous9jOkHTj2h5PGVUiML4MI07AT5WxUUBPUjQAnfM4z+u1k0rHJFqB4Pjc/MWlM+Fg22UgTJLZ/nfunLow==
X-Received: by 10.31.93.65 with SMTP id r62mr3220779vkb.149.1470632808837;
 Sun, 07 Aug 2016 22:06:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 7 Aug 2016 22:06:28 -0700 (PDT)
In-Reply-To: <20160805122336.6836-1-andrew@aj.id.au>
References: <20160805122336.6836-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Aug 2016 14:36:28 +0930
X-Google-Sender-Auth: rV1qC2Z7H8DNY6qAcx7BCo4ZGnQ
Message-ID: <CACPK8XcAX6hkLAd7kmweaF3u8BJWa9PEwV8Hnep4+3W0JjuvAg@mail.gmail.com>
Subject: Re: [PATCH] gpio-aspeed: Write value on switch to output
To: Andrew Jeffery <andrew@aj.id.au>
Cc: johnhcwang <hsienchiang@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 05:06:52 -0000

On Fri, Aug 5, 2016 at 9:53 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> [0] notes that the Barreleye beep LED turned off during boot despite
> configuring the default-state DT property to "on". The documentation for the
> direction_output() callback in struct gpio_chip doesn't make any mention of
> setting values[1] but the function prototype takes a value as a formal
> parameter. Additionally, other drivers' callback implementations (e.g. the
> gemini GPIO driver) write out the provided value.
>
> Make the Aspeed GPIO driver implementation consistent with the expected
> behaviour.
>
> [0] https://github.com/openbmc/linux/issues/98
> [1] "@direction_output: configures signal "offset" as output, or returns error"

Thanks. I applied the version that you intended to send to my
development tree. I think we want to push this out to dev-4.4 for the
barreleye stable branch too?

Cheers,

Joel

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/gpio/gpio-aspeed.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 2ecaa2b12759..7817b98fe8cd 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -120,23 +120,29 @@ static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
>                         & GPIO_BIT(offset));
>  }
>
> -static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
> -                           int val)
> +static void __aspeed_gpio_set(void __iomem *addr, unsigned int offset, int val)
>  {
> -       struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
> -       const struct aspeed_gpio_bank *bank = to_bank(offset);
> -       unsigned long flags;
>         u32 reg;
>
> -       spin_lock_irqsave(&gpio->lock, flags);
> -
> -       reg = ioread32(bank_val_reg(gpio, bank, GPIO_DATA));
> +       reg = ioread32(addr);
>         if (val)
>                 reg |= GPIO_BIT(offset);
>         else
>                 reg &= ~GPIO_BIT(offset);
>
> -       iowrite32(reg, bank_val_reg(gpio, bank, GPIO_DATA));
> +       iowrite32(reg, addr);
> +}
> +
> +static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +                           int val)
> +{
> +       struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
> +       const struct aspeed_gpio_bank *bank = to_bank(offset);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gpio->lock, flags);
> +
> +       __aspeed_gpio_set(bank_val_reg(gpio, bank, GPIO_DATA), offset, val);
>
>         spin_unlock_irqrestore(&gpio->lock, flags);
>  }
> @@ -163,13 +169,16 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
>  {
>         struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
>         const struct aspeed_gpio_bank *bank = to_bank(offset);
> +       void __iomem *addr = bank_val_reg(gpio, bank, GPIO_DIR);
>         unsigned long flags;
>         u32 reg;
>
>         spin_lock_irqsave(&gpio->lock, flags);
>
> -       reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
> -       iowrite32(reg | GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
> +       reg = ioread32(addr);
> +       iowrite32(reg | GPIO_BIT(offset), addr);
> +
> +       __aspeed_gpio_set(addr, offset, val);
>
>         spin_unlock_irqrestore(&gpio->lock, flags);
>
> --
> 2.9.2.597.g66765a4
>
