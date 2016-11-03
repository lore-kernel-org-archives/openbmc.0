Return-Path: <xow@google.com>
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8xzl6tc9zDvPD
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 07:54:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=IZkHGr0F; 
 dkim-atps=neutral
Received: by mail-qt0-x22c.google.com with SMTP id w33so36432813qtc.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9ItVKGuLbfyLt/xDO8/ktub2DTV+573Jr6rCKW8pgt0=;
 b=IZkHGr0FlUQ0GO7hSVjdR73dgOXyFnOpqEBJUP4cABtQ3JFyiTEnO09tlOwn8Qrynb
 e8OdANwv1i2FEAY7VyaRjrFay9O9tuijoQe9BOPoRTfAPcvYg7Je63Toh3zCLH/GUd1v
 WBZGeNdc0YlBav4++qeEBestR7uq0oUGQ52hRJoOTt1mQpTM60muIDjSdM+FcRoWfTzC
 hYuBYscBCR3dDZcFzamVDY4pCKt0Pgdva+5/wkKEuDW7BloMS4x6RJuUX9ddeUL8aYcq
 EkbKzPIrxrll23o1QTZ0jP4dA+w7vxTw7fGo2rS9aOyzai6r7yZ+d+41SzWshwWbjUqi
 8BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9ItVKGuLbfyLt/xDO8/ktub2DTV+573Jr6rCKW8pgt0=;
 b=dpin33BV6OwpGd1nVWQZu9FbZCA3V56qBL3b5gZ1IKp9A2PLjNvlHAUeWtQ6RbY9Wt
 iKZuvEgfgofYkLyNRTFMpVHDrPdwI/s95XUgLAmXm/GatJ3QCfE9pDE7nWPOs4gnSc4G
 1an7SbCAKmPljDbrQLGdYKD6HBWfdKo8ZyOoUK9ICKDD0Ad/3Y4DpRtNAzPoq+/cJzKK
 /C16y9WVcZW0D+z+Y0bMRBts8kSSc8vwJw1YBkG2ka2zmrndUf0PXscxpPhD0B8bbeGs
 iG4NRvhUs3AUrgv5J41JdU+R1AVA35i93hPage2wYGx++tCfX35BrIvZlzeORTY/Yui+
 KaCw==
X-Gm-Message-State: ABUngve5QG7iKqHy4J1bblrc154Nz8NuTvG9gJ4aUVQeapR+FV1iNoDp74fGaTxRxbnTZu8UwnUBtCqHG8qaTvCX
X-Received: by 10.200.50.93 with SMTP id y29mr10367147qta.124.1478206480498;
 Thu, 03 Nov 2016 13:54:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Thu, 3 Nov 2016 13:54:39 -0700 (PDT)
In-Reply-To: <1478146015.27396.23.camel@aj.id.au>
References: <1478126380-3189-1-git-send-email-kunyi@google.com>
 <1478126380-3189-2-git-send-email-kunyi@google.com>
 <1478136791.27396.19.camel@aj.id.au>
 <CAGMNF6U=uky88Cooop+jPso2PANgD=8nOr3ZW+3iK+GZ1pJFjQ@mail.gmail.com>
 <1478146015.27396.23.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Thu, 3 Nov 2016 13:54:39 -0700
Message-ID: <CAPH-5w5utE=U7mP1YhQybKQq8+1AsupnUmA1Mek03VYUh87z+w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v1 1/1] pinctrl: aspeed: Enable ASPEED
 pinctrl driver to modify SPI1 strap bits
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Kun Yi <kunyi@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 03 Nov 2016 20:54:44 -0000

On Wed, Nov 2, 2016 at 9:06 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2016-11-02 at 20:47 -0700, Kun Yi wrote:
>> Thanks for reviewing, Andrew!
>
> No worries!
>
>>
>> On Wed, Nov 2, 2016 at 6:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> >
>> > Hi Kun,
>> >
>> > On Wed, 2016-11-02 at 15:39 -0700, Kun Yi wrote:
>> > >
>> > > Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only. Changing
>> > > SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1, and keep
>> > > other strap bits as read-only.
>> > >
>> > > Note: with this change devicetree default pinctrl settings for spi1 will
>> > > effectively override any previous mode set by physical strapping or
>> > > aspeed.c when Aspeed smc driver is probed.
>> > >
>> > > Signed-off-by: Kun Yi <kunyi@google.com>
>> > > ---
>> > >  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
>> > >  drivers/pinctrl/aspeed/pinctrl-aspeed.h |  2 +-
>> > >  2 files changed, 21 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> > > index 21ef195..c647503 100644
>> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> > > @@ -16,6 +16,8 @@
>> > >
>> > >  const char *const aspeed_pinmux_ips[] = { "SCU", "SIO", "GFX", "LPC" };
>> > >
>> > > +#define SPI1_REG_MASK   0x3000
>> > > +
>> > >  int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
>> > >  {
>> > >       struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
>> > > @@ -178,6 +180,7 @@ static bool aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
>> > >   *
>> > >   * @return true if the expression is configured as requested, false otherwise
>> > >   */
>> > > +
>> > >  static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>> > >                               bool enable, struct regmap *map)
>> > >  {
>> > > @@ -197,15 +200,30 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>> > >
>> > >               /*
>> > >                * Strap registers are configured in hardware or by early-boot
>> > > -              * firmware. Treat them as read-only despite that we can write
>> > > +              * firmware. With the exception of SPI1 interface bits, treat
>> > > +              * them as read-only despite that we can write
>> > >                * them. This may mean that certain functions cannot be
>> > >                * deconfigured and is the reason we re-evaluate after writing
>> > >                * all descriptor bits.
>> > >                */
>> > > -             if (is_scu && (offset == HW_STRAP1 || offset == HW_STRAP2))
>> > > +             if (is_scu && (offset == HW_STRAP2 ||
>> > > +                     offset == HW_STRAP1 && desc->mask != SPI1_REG_MASK))
>> > Maybe the mask comparison would be safer by rewriting as:
>> >
>> >
>> > >
>> > > +             if (is_scu && (offset == HW_STRAP2 ||
>> > > +                     offset == HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
>> > That way if (for whatever reason) we change the approach used in the
>> > -g4 and -g5 implementations we still get the expected outcome.
>> >
>> >
>> Good point. I will change this and the next mask comparisons in case
>> only one of strap bit 12/13 is used as desc->mask.
>>
>> >
>> > >
>> > >                       continue;
>> > >
>> > >               /*
>> > > +              * HW_STRAP1 bits can only be set to 0 by writing 1 into
>> > > +              * bits of same offset in SCU7C. To configure different SPI1
>> > > +              * modes, we write 1 to SCU7C[13:12] to clear SPI1 mask to make
>> > > +              * sure later write to strap register can take effect.
>> > > +              */
>> > > +             if (is_scu && offset == HW_STRAP1 &&
>> > > +                 desc->mask == SPI1_REG_MASK) {
>> > > +                     ret = regmap_write(map, HW_STRAP1_RESET, desc->mask);
>> > > +                     if (ret)
>> > > +                             return false;
>> > > +             };
>> > > +
>> > > +             /*
>> > >                * Sometimes we need help from IP outside the SCU to activate a
>> > >                * mux request. Report that we need its cooperation.
>> > >                */
>> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> > > index 68315a8..46ba16d 100644
>> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> > > @@ -268,6 +268,7 @@
>> > >  #define HW_STRAP2       0xD0 /* Strapping */
>> > >
>> > >  #define SIORD30              SIG_DESC_TO_REG(ASPEED_IP_SIO, 0x30)
>> > > +#define HW_STRAP1_RESET      SIG_DESC_TO_REG(ASPEED_IP_SCU, 0x7C)
>> > Maybe HW_STRAP1_CLEAR would be ... clearer? Also in this case the
>> > SIG_DESC_TO_REG() macro is not entirely necessary as we're talking
>> > about the SCU, but being explicit is good. As a note the macro(s) have
>> > gone away in the v2 of the series I've recently sent upstream due to
>> > feedback from the maintainer:
>> >
>> > https://www.spinics.net/lists/arm-kernel/msg540082.html
>> >
>> > Otherwise this looks good to me. Thanks for looking at the problem!
>> >
>> > Andrew
>> >
>> HW_STRAP1_CLEAR does sound better, will rename in v2.
>> Since SIG_DESC_TO_REG() is removed in your v2 patch, should I directly
>> define it as this?
>>
>> #define HW_STRAP1_CLEAR      0x7C
>
> Yes, that would then work in either case (with or without being applied
> atop v2).
>
> Thanks,
>
> Andrew
>
>>
>> >
>> > >
>> > >
>> > >   /**
>> > >    * A signal descriptor, which describes the register, bits and the
>> > > @@ -580,5 +581,4 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
>> > >  int aspeed_pinctrl_probe(struct platform_device *pdev,
>> > >               struct pinctrl_desc *pdesc,
>> > >               struct aspeed_pinctrl_data *pdata);
>> > > -
>> > >  #endif /* PINCTRL_ASPEED */
>>
>>
>

Since the SPI1 strap bits will be mutable by the pinctrl driver,
should we take the hard-coding out of the mach-aspeed AST2500 fixup?

xo
