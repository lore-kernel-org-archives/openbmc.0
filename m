Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tONzB2+o"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ny2iHgyd"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DWQR6PSpzF1Hv
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 11:13:35 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id c23-v6so1734412qtn.6
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jun 2018 18:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QF52fUTSkUJ7NvcO43vX2pK4ihs8tz/kDskAXZgInTg=;
 b=tONzB2+ol0/Qf3vmRS0Y+WJjHxduLxlu/mWXJ7kQIchmVQZNIsZnKQR6QEGdyZgK68
 J9m0oNqcBJ3wJLuo7qVQe+GJ4IvsEfvl8+hKib/qBTZiCVIHGdfhYj6RnBMat+9KC9rt
 TnqFHaokkHuVLpgErf4/pwg25ZT425YKRkmHSDFmrEzA9h0/2mJfX04xgzsidwf8kEfc
 0p75ZQRZG5XCKMMM8egRqi6NeoRcBgi1bm2D+CHDM6FuW5GtQzQD9Do6wDhLptUStA1E
 f2maA5HaQMD1YMvqRZMKkh2kcH6hywRIY/SSlUpv0ux4lg/F+AdAUNQQeRrMFOKBpy3m
 GUKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QF52fUTSkUJ7NvcO43vX2pK4ihs8tz/kDskAXZgInTg=;
 b=ny2iHgydfQ4XDKOuZbqYGpHdOuui6VBlQcnB/pl7xqngF8HIlkB5J13E4gIpp/o4pU
 KKtVVCrzanATeKwis05Nu25m0ri6cyL9Bpl8W3505Z7iFMshpa/htGUMylJCWm6nnRrL
 XH8QDufn8HLA4iBnLlJKKwnH+hF777SFgwX/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=QF52fUTSkUJ7NvcO43vX2pK4ihs8tz/kDskAXZgInTg=;
 b=YKcP8YYE4IizedCKZ0lcjBOxBaqdVs8T0SZ7rLfC+46G+Ac6CLB2RywfS9qCqIvPoV
 mgp5D3Q6BxvaKWJG444t3nTLSPPL3NHO/i9Td/+82AYGzg8ECAc+32ZzPEDkAAdbjFx6
 SOBM9bLCdZ5AMJ/6WqQeXqwoyKHDugpJ7pM8Ar2M2N2Bhor1zNTYrnykB2Y/z5T+64LG
 k6J4D1q+UJJ5WbvjjnB4Pvf8cPTiZGJMSp98XriuFBk6SM3sj1WF1lowS/FKyMh1lwK9
 Ry2zduRbaOLRBre2BQn7esgJ+9+n7i/l1lW1fLgcXzM2FOl0bq+/j6WteTFxp1qRhTUI
 dzWg==
X-Gm-Message-State: APt69E0ZYx04/I99YtyMCO3silbzhvVZ+eXDSgwIwoSEIrFpPweObnkw
 N2V+S7psrgjojJSIgJNyABlJYKtnqkmvyQm621K7zQ==
X-Google-Smtp-Source: AAOMgpeOlPOgR9YfPV/27XrxHfx7zzEVSYlcSG6j+wJxqzaul/3tUnSwyPis41MtCHsXQiOV+6xlbu6j3f09xPQr7Bg=
X-Received: by 2002:ac8:260f:: with SMTP id
 u15-v6mr9512983qtu.368.1529889213103; 
 Sun, 24 Jun 2018 18:13:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Sun, 24 Jun 2018 18:13:12
 -0700 (PDT)
In-Reply-To: <1529889079.2198985.1418947520.361B7CD6@webmail.messagingengine.com>
References: <20180621072525.23832-1-joel@jms.id.au>
 <1529889079.2198985.1418947520.361B7CD6@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Jun 2018 10:43:12 +0930
X-Google-Sender-Auth: F5Q3RSZdEGb6_VT77uJF5F2KTqM
Message-ID: <CACPK8XfCR7UQjp4-OsBwgitc0seCC2C1grZDJOH3tc8uXCdsNg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 v2] clk: aspeed: Support HPLL strapping on
 ast2400
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2018 01:13:36 -0000

On 25 June 2018 at 10:41, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 21 Jun 2018, at 16:55, Joel Stanley wrote:
>> The HPLL can be configured through a register (SCU24), however some
>> platforms chose to configure it through the strapping settings and do
>> not use the register. This was not noticed as the logic for bit 18 in
>> SCU24 was confused: set means programmed, but the driver read it as set
>> means strapped.
>>
>> This gives us the correct HPLL value on Palmetto systems, from which
>> most of the peripheral clocks are generated.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> v2: Fix comment and commit message
>> ---
>>  drivers/clk/clk-aspeed.c | 22 +++++++++++++++++++---
>>  1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index c17032bc853a..7d8cc412959d 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -24,7 +24,7 @@
>>  #define ASPEED_MPLL_PARAM    0x20
>>  #define ASPEED_HPLL_PARAM    0x24
>>  #define  AST2500_HPLL_BYPASS_EN      BIT(20)
>> -#define  AST2400_HPLL_STRAPPED       BIT(18)
>> +#define  AST2400_HPLL_PROGRAMMED BIT(18)
>>  #define  AST2400_HPLL_BYPASS_EN      BIT(17)
>>  #define ASPEED_MISC_CTRL     0x2c
>>  #define  UART_DIV13_EN               BIT(12)
>> @@ -586,8 +586,24 @@ static void __init aspeed_ast2400_cc(struct regmap *map)
>>        * and we assume that it is enabled
>>        */
>>       regmap_read(map, ASPEED_HPLL_PARAM, &val);
>> -     WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not configured");
>> -     aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
>> +     if (val & AST2400_HPLL_PROGRAMMED) {
>> +             aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
>> +                     aspeed_ast2400_calc_pll("hpll", val);
>> +     } else {
>> +             /* hpll is configured by the strap register */
>> +             regmap_read(map, ASPEED_STRAP, &val);
>> +             val = (val >> 8) & 0x3;
>> +             if (val == 0x00)
>> +                     freq = 384000000;
>> +             else if (val == 0x01)
>> +                     freq = 360000000;
>> +             else if (val == 0x02)
>> +                     freq = 336000000;
>> +             else if (val == 0x03)
>> +                     freq = 408000000;
>> +             aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
>> +                     clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0, freq);
>> +     }
>
> Logic looks fine, but I feel this might be better as a lookup table. Bikeshed will be hot pink.

I anticipated your review, and sent v3 last week with a lookup table.
I also merged it into the openbmc tree :)
