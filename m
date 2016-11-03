Return-Path: <kunyi@google.com>
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8WC05kfyzDvPk
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 14:47:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=YAURlUE/; 
 dkim-atps=neutral
Received: by mail-ua0-x234.google.com with SMTP id 20so29493155uak.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 20:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MmcTHgXDEG8/LoQvux4eEZUj18Yk6tWS7tA3yXl3u2s=;
 b=YAURlUE/LbegXlj4U52Dp2RJNbirJmDtGvwnlU/rls/dVynYJWu8TqoSq73Qc7TQCY
 a6Qx2B69v8b5lw1+F8hec0d3IFL7uJL1iRm+xM3lUEwmnzJU2HfN3OwVdiVzkuHanTE/
 oOTAb4B6TjhzvWwGsOAViKNqdNyq8iXBGDSJfxNUCpyPRIEE+Wwv7WhxHiHbYPk/T6Jf
 IF+i4NXiuDsNQmAs7/reWvWkYF9gOVgD9428a66eCIx+Fz770IxKauXj6wRhP/N6ZnZX
 uBRI9Ko0r+GwyGgzGibjadb8gJf7fR6LZMXtnvOKNnTK0l5B1pag/gtUknK/8nQvFEwg
 nuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MmcTHgXDEG8/LoQvux4eEZUj18Yk6tWS7tA3yXl3u2s=;
 b=ipV/oZEd8c63kcU7od+URBF35+1+0iv5GGuBGq1cmHZunXkNK57W9kT/5tiqb0PPtT
 4T0LHtzZaEmsuIMRynp7mrF//GA4VVBwRNYygOu/a/IK7cM+PYPYuLuqN0MNz1C8riiU
 7XJs5x+HtAnqFKHLc3DOACzejrx1AZEXu5dTrV+aEtaQGrVSs/9Ilafb9yWO9/ChDmx5
 H8i9bDaNUIjEKQnQV8jks/kDwbLJgWQ0g2QvXz623vn5780wrXhHdEzW52hz8+v5+RpF
 AmtulnV1+EsoBZjNMYY3y7XdaLHBWDlSkLVXLeq3dJeTJdRD/L+8eKyVbZBCiJfLE08I
 DtWA==
X-Gm-Message-State: ABUngve+EV8WEuGzHxouMALaNYDsxHNc7Ak14Eew33vGzJ2Q9BlVqAKgx8sxGTRlm6dk1WKcotG5i9O6VKd/tqyP
X-Received: by 10.176.0.180 with SMTP id 49mr5855742uaj.32.1478144873694; Wed,
 02 Nov 2016 20:47:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.48.29 with HTTP; Wed, 2 Nov 2016 20:47:33 -0700 (PDT)
In-Reply-To: <1478136791.27396.19.camel@aj.id.au>
References: <1478126380-3189-1-git-send-email-kunyi@google.com>
 <1478126380-3189-2-git-send-email-kunyi@google.com>
 <1478136791.27396.19.camel@aj.id.au>
From: Kun Yi <kunyi@google.com>
Date: Wed, 2 Nov 2016 20:47:33 -0700
Message-ID: <CAGMNF6U=uky88Cooop+jPso2PANgD=8nOr3ZW+3iK+GZ1pJFjQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v1 1/1] pinctrl: aspeed: Enable ASPEED
 pinctrl driver to modify SPI1 strap bits
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 03 Nov 2016 03:47:57 -0000

Thanks for reviewing, Andrew!

On Wed, Nov 2, 2016 at 6:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Kun,
>
> On Wed, 2016-11-02 at 15:39 -0700, Kun Yi wrote:
>> Current pinctrl driver treats HWSTRAP1/HWSTRAP2 bits as read-only. Changing
>> SPI1 mode requires pinctrl to modify bit 12 and 13 of HWSTRAP1, and keep
>> other strap bits as read-only.
>>
>> Note: with this change devicetree default pinctrl settings for spi1 will
>> effectively override any previous mode set by physical strapping or
>> aspeed.c when Aspeed smc driver is probed.
>>
>> Signed-off-by: Kun Yi <kunyi@google.com>
>> ---
>>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
>>  drivers/pinctrl/aspeed/pinctrl-aspeed.h |  2 +-
>>  2 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> index 21ef195..c647503 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> @@ -16,6 +16,8 @@
>>
>>  const char *const aspeed_pinmux_ips[] = { "SCU", "SIO", "GFX", "LPC" };
>>
>> +#define SPI1_REG_MASK   0x3000
>> +
>>  int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
>>  {
>>       struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
>> @@ -178,6 +180,7 @@ static bool aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
>>   *
>>   * @return true if the expression is configured as requested, false otherwise
>>   */
>> +
>>  static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>>                               bool enable, struct regmap *map)
>>  {
>> @@ -197,15 +200,30 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>>
>>               /*
>>                * Strap registers are configured in hardware or by early-boot
>> -              * firmware. Treat them as read-only despite that we can write
>> +              * firmware. With the exception of SPI1 interface bits, treat
>> +              * them as read-only despite that we can write
>>                * them. This may mean that certain functions cannot be
>>                * deconfigured and is the reason we re-evaluate after writing
>>                * all descriptor bits.
>>                */
>> -             if (is_scu && (offset == HW_STRAP1 || offset == HW_STRAP2))
>> +             if (is_scu && (offset == HW_STRAP2 ||
>> +                     offset == HW_STRAP1 && desc->mask != SPI1_REG_MASK))
>
> Maybe the mask comparison would be safer by rewriting as:
>
>
>> +             if (is_scu && (offset == HW_STRAP2 ||
>> +                     offset == HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
>
> That way if (for whatever reason) we change the approach used in the
> -g4 and -g5 implementations we still get the expected outcome.
>
>

Good point. I will change this and the next mask comparisons in case
only one of strap bit 12/13 is used as desc->mask.

>>                       continue;
>>
>>               /*
>> +              * HW_STRAP1 bits can only be set to 0 by writing 1 into
>> +              * bits of same offset in SCU7C. To configure different SPI1
>> +              * modes, we write 1 to SCU7C[13:12] to clear SPI1 mask to make
>> +              * sure later write to strap register can take effect.
>> +              */
>> +             if (is_scu && offset == HW_STRAP1 &&
>> +                 desc->mask == SPI1_REG_MASK) {
>> +                     ret = regmap_write(map, HW_STRAP1_RESET, desc->mask);
>> +                     if (ret)
>> +                             return false;
>> +             };
>> +
>> +             /*
>>                * Sometimes we need help from IP outside the SCU to activate a
>>                * mux request. Report that we need its cooperation.
>>                */
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> index 68315a8..46ba16d 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> @@ -268,6 +268,7 @@
>>  #define HW_STRAP2       0xD0 /* Strapping */
>>
>>  #define SIORD30              SIG_DESC_TO_REG(ASPEED_IP_SIO, 0x30)
>> +#define HW_STRAP1_RESET      SIG_DESC_TO_REG(ASPEED_IP_SCU, 0x7C)
>
> Maybe HW_STRAP1_CLEAR would be ... clearer? Also in this case the
> SIG_DESC_TO_REG() macro is not entirely necessary as we're talking
> about the SCU, but being explicit is good. As a note the macro(s) have
> gone away in the v2 of the series I've recently sent upstream due to
> feedback from the maintainer:
>
> https://www.spinics.net/lists/arm-kernel/msg540082.html
>
> Otherwise this looks good to me. Thanks for looking at the problem!
>
> Andrew
>

HW_STRAP1_CLEAR does sound better, will rename in v2.
Since SIG_DESC_TO_REG() is removed in your v2 patch, should I directly
define it as this?

#define HW_STRAP1_CLEAR      0x7C

>>
>>   /**
>>    * A signal descriptor, which describes the register, bits and the
>> @@ -580,5 +581,4 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
>>  int aspeed_pinctrl_probe(struct platform_device *pdev,
>>               struct pinctrl_desc *pdesc,
>>               struct aspeed_pinctrl_data *pdata);
>> -
>>  #endif /* PINCTRL_ASPEED */



-- 
Regards,
Kun
