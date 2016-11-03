Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8Ygt5JhWzDvQW
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 16:39:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=DKpakHuL; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id 62so4797567oif.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 22:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zPN6kICO49FHoiZxwqG9/mTDAH7KolXqkWOtmwNT6KI=;
 b=DKpakHuLjbO58DFh2ALDT4hcubpCEfI/U0XfBjX5SS6/aEWorLRl+i9/B6muzX0wXI
 Hvsrd3ZJlObyC3lup/Px+MMh1gjyOKM+a7ITbTBW9JBEXtFGqh3agP1jOAX+aFfEakp6
 vkcH2+OamkEgQkW4eFh9L/gx7kWuK94CIsUWOzFVhqBLOUzlUi9FM5DPwrdCJhjeTByM
 f66Auw1X5fLhec65GqfENHkjTnZI74fg+EwAS4JkMuPFCAj/ohl7Oge8NH151CaPPAxz
 hapqYfvdnlPGDCMIJhR+PVVOS4g6Ot5hzu6YA6oDp4NbIvwFdHMbsdbXGPH5w1P8AN7q
 Avlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zPN6kICO49FHoiZxwqG9/mTDAH7KolXqkWOtmwNT6KI=;
 b=BDSWQzviVTDBgFq2+X3SefL92z5PiuvuzP2m3zd0rjh5VR16kQA+Nc+iRz4S9Y9gDQ
 D5Ytq/B4rmzkiMhVetbQwm5Xuw2wbQdxPhGscRqfUOAhb+s4shXejFLxPyVOwGIE7mLw
 rFi9Kw4+NuqWJx78JD9McLhN59h7aBsaepO9VM43cCz9RkDlMxi4LSPdc2IO9bJKozTj
 l23zpM3BxAXqjUeFITRJVJTgzH1UEO94YtB2/cVbUGWv9WAz5BTo+Ig5++vFE1QJNQtx
 ZUfBNyiqoELkqkWDD4n06tE/j7vlCDa1gnIxpNaqVZdRc44hF5gPL4xMaaqqtRwv6o1a
 oi1Q==
X-Gm-Message-State: ABUngvfqHHCxuK+vyKbNcuz5BVxizgyBMzOpZprRmtJQcvQZpB5SlEaEzC+yK0FN6ZOtb7kLK2sf1aJCltb5Gg==
X-Received: by 10.202.216.136 with SMTP id p130mr6427951oig.109.1478151576612; 
 Wed, 02 Nov 2016 22:39:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 2 Nov 2016 22:39:16 -0700 (PDT)
In-Reply-To: <1478150842-5636-1-git-send-email-andrew@aj.id.au>
References: <1478150842-5636-1-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Nov 2016 16:09:16 +1030
X-Google-Sender-Auth: 48TVn6VCJdmD2MWlV7cnhdxtBOs
Message-ID: <CACPK8XcYWmq97D4etrysQGsrVQHo3O5MAC6MB_ykR0wkS7AoGA@mail.gmail.com>
Subject: Re: [PATCH qemu] wdt: aspeed: Fix failed reboot due to timer
 miscalculation
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 03 Nov 2016 05:39:39 -0000

On Thu, Nov 3, 2016 at 3:57 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The implementation was incorrectly scaling the reload value by
> nanoseconds per second. In reality the span represented by the reload
> value is determined by the selected clock, either APB or 1MHz.
>
> Test the selected clock and apply the appropriate scaling, then convert to
> nanoseconds for the timer infrastructure. Note that the APB rate is hard-coded
> and reflects the value used by the timer controller, and isn't necessarily an
> accurate representation of the clock configuration programmed in the SCU.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
> I'm hesitant to send this upstream as I don't like the idea of hardcoding the
> clock rates in the way that we have (i.e. the timer as well). I think we should
> rework the timer and the watchdog to derive their clocks from the SCU, but
> that's more work than I'm willing to put in to get reboots working.

The watchdog driver as upstreamed always runs from a 1MHz clock.

It looks like the model needs to be updated with this knowledge. Then
we don't need to worry about hardcoding. We print a warning if the bit
in the register that says "use 1MHz" is cleared.

Cheers,

Joel

>
>  hw/watchdog/wdt_aspeed.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 2ec01769b745..c81608d6ac74 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -61,11 +61,14 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>
>  }
>
> +#define PCLK_HZ 24000000
> +
>  static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>                                  unsigned size)
>  {
>      AspeedWDTState *s = ASPEED_WDT(opaque);
>      bool en = data & BIT(0);
> +    bool pclk = !(data & BIT(4));
>
>      switch (offset) {
>      case WDT_STATUS:
> @@ -78,21 +81,36 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>          break;
>      case WDT_RESTART:
>          if ((data & 0xFFFF) == 0x4755) {
> +            uint32_t reload;
> +
>              s->reg_status = s->reg_reload_value;
>
> +            if (pclk) {
> +                reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
> +                        PCLK_HZ) ;
> +            } else {
> +                reload = s->reg_reload_value * 1000;
> +            }
> +
>              if (s->enabled) {
>                  timer_mod(s->timer,
> -                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                          s->reg_reload_value * NANOSECONDS_PER_SECOND);
> +                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + reload);
>              }
>          }
>          break;
>      case WDT_CTRL:
>          if (en && !s->enabled) {
> +            uint32_t reload;
> +
> +            if (pclk) {
> +                reload = muldiv64(s->reg_reload_value, NANOSECONDS_PER_SECOND,
> +                        PCLK_HZ) ;
> +            } else {
> +                reload = s->reg_reload_value * 1000;
> +            }
> +
>              s->enabled = true;
> -            timer_mod(s->timer,
> -                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                      s->reg_reload_value * NANOSECONDS_PER_SECOND);
> +            timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + reload);
>          }
>          else if (!en && s->enabled) {
>              s->enabled = false;
> --
> 2.7.4
>
