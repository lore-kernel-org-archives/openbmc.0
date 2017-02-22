Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSkbF0YqfzDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 15:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="clG1V8c5"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id 2so5527348ywn.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 20:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kKj0bvF2ujoLd0v+TX9QumAo9wbe5f5LmzuG9GWgArU=;
 b=clG1V8c5/Adu/psf0lvXFJws8JJ1MEthged7Se+kRLipbkYcwa8ccHJA4WL+Z3mJPe
 6DsLDVNqE/mV4OQI5sj0qvTtgkomq98t0Dw0FN/Ki5nO1Shpi5+4NzyESZ4042b6PkmG
 IH+736DOekcWDIZA/bdc5z2xxYsbm35DX7XfGRAWnkVcfjZ7oacTf608fyOH65NiBgCP
 HZ+lG1iJ+wf+TMUpx1NMzYJyon4g3N0v8jAKBzPg041q4rXvvTeOsdKYzpiaChFQ6eZp
 snaDacb9bI6IdKKgUkpoIZuWQgie5OXeVIB5w8mp0FbMrmzl0SR56m4LmyP7GcsqC+UC
 lNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kKj0bvF2ujoLd0v+TX9QumAo9wbe5f5LmzuG9GWgArU=;
 b=dN0IXrfSUq/9HCsVDPPm5HgfI6FA6UthLN6IMMdbQVYNSvlDjkzFKG6ctEpuVIBd4L
 j+56I6ypK+3rtgibDmsU9hr0m1c5i+9G/I0SdseSoqKCWNMO/FG6e8YsthCW3d6arsk9
 zLFDSg337QVWtYy8lkw9RnkQnMTw5sdMQWjJ+sSwkJ6Z1tyWAsX67AKk8HXFnT0jRGG0
 i45izUBYMdLIDWMOvZvYr5fims1NuunEF6OX/Ya/aU2amJmmT54gdGBZaRCSCGzvpGcL
 pVCLmfBznfLvMeF/JdOTxjIRZvzAJy4aGnfzykfhuh6GFH9vMXXTEEI47aYNvWgITIzN
 OBYw==
X-Gm-Message-State: AMke39k1YzsUDvIn9x1CeDZpgDtteM299yki/HgJfDwT4n//jLToi2W0brgka2xnCdnk8dJZxR5l6DUzAfgexQ==
X-Received: by 10.13.202.69 with SMTP id m66mr10787404ywd.11.1487737014790;
 Tue, 21 Feb 2017 20:16:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Tue, 21 Feb 2017 20:16:34 -0800 (PST)
In-Reply-To: <20170220144004.10809-1-andrew@aj.id.au>
References: <20170220144004.10809-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2017 14:46:34 +1030
X-Google-Sender-Auth: I9BiPMzWPBPtCU91R2fXfO4mHaM
Message-ID: <CACPK8XeJ0fgYZbBGcfGGaRsbqfeH5ZUbrHq3PvHE1DhM3fCQxA@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Add debounce support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-List-Received-Date: Wed, 22 Feb 2017 04:16:57 -0000

On Tue, Feb 21, 2017 at 1:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Each GPIO in the Aspeed GPIO controller can choose one of four input
> debounce states: to not debounce an input or to select from one of three
> programmable debounce timer values. Each GPIO in a four-bank-set is
> assigned one bit in each of two debounce configuration registers
> dedicated to the set, and selects a debounce state by configuring the
> two bits to select one of the four options.
>
> The limitation on debounce timer values is managed by mapping offsets
> onto a configured timer value and keeping count of the number of users
> a timer has. Timer values are configured on a first-come-first-served
> basis.
>
> A small twist in the hardware design is that the debounce configuration
> register numbering is reversed with respect to the binary representation
> of the debounce timer of interest (i.e. debounce register 1 represents
> bit 1, and debounce register 2 represents bit 0 of the timer numbering).
>
> Open-drain/open-source support also introduced, but merely by deferring
> to the gpiolib emulation (as per the datasheet).
>
> Tested on an AST2500EVB.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Some questions below. Looks good overall.

> ---
>  drivers/gpio/gpio-aspeed.c | 244 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 239 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index fb16cc771c0d..164a75272151 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c


>  struct aspeed_gpio {
>         struct gpio_chip chip;
>         spinlock_t lock;
>         void __iomem *base;
>         int irq;
>         const struct aspeed_gpio_config *config;
> +
> +       /* Debouncing */
> +       DECLARE_HASHTABLE(offset_timer, 5);

Ohh a hash table. I've not seen one of these in a driver before :)

> +       unsigned int timer_users[3];
> +       struct clk *clk;
>  };
>

> +static int aspeed_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
> +                                   unsigned long usecs)
> +{
> +       const struct aspeed_gpio_bank *bank = to_bank(offset);
> +       struct aspeed_gpio *gpio = gpiochip_get_data(chip);
> +       const u32 mask = GPIO_BIT(offset);
> +       unsigned long flags;
> +       void __iomem *addr;
> +       u32 val;
> +       int rc;
> +
> +       if (!have_debounce(gpio, offset))
> +               return -ENOTSUPP;
> +
> +       if (usecs) {

if (usecs) is the "turn on debounce", and the else is "disable debounce"?

It would be easier to read if we had a enable_debounce and disable_debounce.

> +               struct aspeed_debounce_timer *dt, *newdt;

I thought this was device tree and got really confused. Perhaps 'timer' instead?

> +               u32 requested_cycles;
> +               int i;
> +
> +               /*
> +                * TODO: Look at improving these:
> +                *
> +                * - we always delete users of timers even if the call is for a
> +                *   duplicate debounce period for an offset
> +                * - we don't reuse struct aspeed_debounce_timer allocations if
> +                *   the offset is already using a timer
> +                */
> +
> +               rc = usecs_to_cycles(gpio, usecs, &requested_cycles);
> +               if (rc < 0)
> +                       return rc;

Should this produce a warning (as you do below when we're out of timers)?

> +
> +               newdt = devm_kmalloc(chip->parent, sizeof(*dt), GFP_KERNEL);
> +               if (!newdt)
> +                       return -ENOMEM;
> +
> +               spin_lock_irqsave(&gpio->lock, flags);
> +
> +               /* Check if the @offset is already using a timer */
> +               hash_for_each_possible(gpio->offset_timer, dt, node, offset) {
> +                       if (offset == dt->offset) {
> +                               hash_del(&dt->node);
> +                               WARN_ON(!gpio->timer_users[dt->timer]);
> +                               gpio->timer_users[dt->timer]--;
> +                               devm_kfree(chip->parent, dt);
> +                               break;
> +                       }
> +               }
> +
> +               /*
> +                * Check if a timer is already configured for the requested
> +                * debounce period. If so, just add @offset as a user of this
> +                * timer
> +                */
> +               for (i = 0; i < ARRAY_SIZE(debounce_timers); i++) {
> +                       u32 cycles;
> +
> +                       addr = gpio->base + debounce_timers[i];
> +                       cycles = ioread32(addr);
> +
> +                       if (requested_cycles == cycles)
> +                               break;
> +               }
> +
> +               /* Otherwise, allocate a timer */

Is "otherwise" in reference to the check above? Is the break above
supposed to be a goto?

> +               if (i == ARRAY_SIZE(debounce_timers)) {
> +                       for (i = 0; i < ARRAY_SIZE(gpio->timer_users); i++) {
> +                               if (gpio->timer_users[i] == 0)
> +                                       break;
> +                       }
> +
> +                       /* We have run out of timers */
> +                       if (i == ARRAY_SIZE(gpio->timer_users)) {
> +                               dev_warn(chip->parent,
> +                                               "Debounce timers exhausted, cannot debounce for period %luus\n",
> +                                               usecs);
> +                               rc = -EPERM;
> +                               goto err;
> +                       }
> +
> +                       /* Timer update */
> +                       addr = gpio->base + debounce_timers[i];
> +                       iowrite32(requested_cycles, addr);
> +               }
> +
> +               /* Register @offset as a user of timer i */
> +               newdt->offset = offset;
> +               newdt->timer = i;
> +               hash_add(gpio->offset_timer, &newdt->node, offset);

I got a bit lost with gpio->offset_timer and offset. Is offset
referring to a GPIO pin?

> +
> +               WARN_ON(gpio->timer_users[i] == UINT_MAX);

Should we just bail out here? Also printing a message to say Danger
Will Robinson would be more informative.

> +               gpio->timer_users[i]++;
> +
> +               /* Configure @offset to use timer i */
> +               addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL1);
> +               val = ioread32(addr);
> +               iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE1(i, offset), addr);

Is the mask clearing the bit and GPIO_SET_DEBOUNCE1 setting it again?

We're pretty deep in macro land by now.

> +
> +               addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL2);
> +               val = ioread32(addr);
> +               iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE2(i, offset), addr);
> +
> +               spin_unlock_irqrestore(&gpio->lock, flags);
