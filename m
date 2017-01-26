Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8Ncx3rmSzDq62
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 00:51:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="fy+pH3Yi"; 
 dkim-atps=neutral
Received: by mail-it0-x22b.google.com with SMTP id c7so129006397itd.1
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 05:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WqtskV5wsBS/yEe4MQ5mpBHQC5YP6wFavOkqxmP0VJQ=;
 b=fy+pH3YinwI22FsFfT5TibSZnhbnzP2A86vhYVj1QihEyOGb0oT4MgxwIot3WXNg0f
 8SkwKAagSiNLBCMb4gFRWLGXVKz08SrmtzpbO8y7JHv5uwc3O4YXeyvxxBn7GjkSEHx+
 eXxocdg2Z+eAmSekZ5lLCoO/FhBNMiW5w3XIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WqtskV5wsBS/yEe4MQ5mpBHQC5YP6wFavOkqxmP0VJQ=;
 b=TnyWE//qVh0Pc4WHDo4Gcd+sAlzyS3p0lAvLBiGB8Q2uDpnZHOcFbrY7hKnCVjOR68
 hfU8Xiu+AXoS9nWEduOu1mCHUSe2WoUwEuqtlHuBRJq74RUiQZGVou31tyoM4003ooYr
 6TLespgztG1EC9cyStsUpx7nCSN+NTvDbfrXgeGX2xDoer+RPGEoGNYVVwc4vnz7HZzn
 2bUjCMga9CJ/xolWigzEEbOmeCxwzLYv5EsU18trl8qx3wwN49eqUDsyF3j6hP6WpbXJ
 KuV2/H4zpM/E7E5916DDQ3B54qKPz665OjO5spDn5W3mngg1he/I1WUa8xcGep6sdD4l
 6L1w==
X-Gm-Message-State: AIkVDXIKQWHGmq5UqIt7TP059jNfI9qvJScLbLglhFs/rOgZbcZCZHYAtwE29qpSgRF0mHFG9iXAwxklbBLAfKiv
X-Received: by 10.36.88.20 with SMTP id f20mr27778317itb.9.1485438702143; Thu,
 26 Jan 2017 05:51:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Thu, 26 Jan 2017 05:51:41 -0800 (PST)
In-Reply-To: <20170124061646.9317-3-andrew@aj.id.au>
References: <20170124061646.9317-1-andrew@aj.id.au>
 <20170124061646.9317-3-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2017 14:51:41 +0100
Message-ID: <CACRpkdZ4hZY1j5U1xfn=trnDJMG1A=K2DbMWxD=79MzmEgouaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: aspeed: Add banks Y, Z, AA, AB and AC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
X-List-Received-Date: Thu, 26 Jan 2017 13:51:46 -0000

On Tue, Jan 24, 2017 at 7:16 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> This is less straight-forward than one would hope, as some banks only
> have 4 pins rather than 8, others are output only, yet more (W and
> X, already supported) are input-only, and in the case of the g4 SoC bank
> AC doesn't exist.
>
> Add some structs to describe the varying properties of different banks
> and integrate mechanisms to deny requests for unsupported
> configurations.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

(...)
> +#include <linux/gpio.h>

NAK don't do that. (I will explain below...)

(...)

> @@ -189,6 +258,12 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>         unsigned long flags;
>         u32 val;
>
> +       if (!have_input(gpio, offset))
> +               return GPIOF_DIR_OUT;
> +
> +       if (!have_output(gpio, offset))
> +               return GPIOF_DIR_IN;

Please refrain from using GPIOF_* in drivers like this.

These flags are part of the consumer API, not the driver API.

Make sure the only header you include in your driver is
<linux/gpio/driver.h> and just return 0/1 instead of these
constants.

> +static void set_irq_valid_mask(struct aspeed_gpio *gpio)
> +{
> +       const struct aspeed_bank_props *props = gpio->config->props;
> +
> +       while (!is_bank_props_sentinel(props)) {
> +               unsigned int offset;
> +               const unsigned long int input = props->input;
> +
> +               /* Pretty crummy approach, but similar to GPIO core */
> +               for_each_clear_bit(offset, &input, 32) {
> +                       unsigned int i = props->bank * 32 + offset;
> +
> +                       if (i >= gpio->config->nr_gpios)
> +                               break;
> +
> +                       clear_bit(i, gpio->chip.irq_valid_mask);
> +               }
> +
> +               props++;
> +       }
> +}

Nice that you use this feature!

> +/*
> + * Any banks not specified in a struct aspeed_bank_props array are assumed to
> + * have the properties:
> + *
> + *     { .input = 0xffffffff, .output = 0xffffffff }
> + */
> +
> +static const struct aspeed_bank_props ast2400_bank_props[] = {
> +       /*     input      output   */
> +       { 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
> +       { 6, 0x0000000f, 0x0fffff0f }, /* Y/Z/AA/AB, two 4-GPIO holes */
> +       { },
> +};
> +
> +static const struct aspeed_gpio_config ast2400_config =
> +       /* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
> +       { .nr_gpios = 220, .props = ast2400_bank_props, };
> +
> +static const struct aspeed_bank_props ast2500_bank_props[] = {
> +       /*     input      output   */
> +       { 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
> +       { 6, 0x0fffffff, 0x0fffffff }, /* Y/Z/AA/AB, 4-GPIO hole */
> +       { 7, 0x000000ff, 0x000000ff }, /* AC */
> +       { },
> +};

A bit of magic values but there are comments to explain it so OK.

You could consider using the GENMASK() macro from <linux/bitops.h>
to indicate the bits here but no big deal.

Yours,
Linus Walleij
