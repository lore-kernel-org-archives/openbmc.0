Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="BJrSQPJI"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43p9Nj09jhzDqD3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 00:25:24 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id v1-v6so14243198ljd.0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jan 2019 05:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pZJzBbsUHgXSKmTlb8V6UjU4q1+mokM0EYnbc4t6fUg=;
 b=BJrSQPJItJh0n86M+ExGHUuNn6jGjqx+I/7IMmLkQJN6I5gs59oloEIln54Uwi9k9/
 CKH0AZxK+3BJjgN4TqUgaBK+elhHBT8QOkUN6E7j2Tn9HY23slNa9jV8kUBpqbJtSPki
 gk6rW0WPSCA3ukrZ7VKkZ3F6+WlojU41mNZi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pZJzBbsUHgXSKmTlb8V6UjU4q1+mokM0EYnbc4t6fUg=;
 b=VDlVeLC9vWoqrHPSa4fXXORdsDWPWngYxy6ccs6r6pGlfDcCpHSldH8GIDAmQ0y7KI
 EThEBVgGJAT1KE3enwNNSt2uL3VIGWlvJWhKdGPYRHSs1k22Aov26vX+aNCYTwhAwHL4
 5hnoOGEe2B5Ben1yxpNrLU0zlxtAYVEfU1iIluuEsoP3jJGnAJpzNWDgW+U2KPAq41z5
 RmWbH+A6nOoK2NOuf2SpiokcIoRmWkWHUCnbytuBX6X/0Nz6NtOcKCpe6mvjMRJVtB59
 y2aLqXNjwDtMmamRCNkFy8BZOFehpSGHbzncjV80CWoQhPgWb9gynrH9EcKOq+Sj060r
 JIew==
X-Gm-Message-State: AJcUuke4pbIvaJ1JtE0VPVnOSZPsA/6YhU2TbaR5ywNmvFmGmA4Qf5+d
 Hyp6iehIa+Oo83Hr891xfDSp1xqWNuynZLyTHDDbUA==
X-Google-Smtp-Source: ALg8bN5JeqQrgmNmnyq8jdrxZnT4q1pSjaU1IDH/KCSDdqNy2ebcsCsQusWMcJwXlSTCenUgjyn21RUFqsQL2lP2sE8=
X-Received: by 2002:a2e:131a:: with SMTP id
 26-v6mr16654301ljt.107.1548681920856; 
 Mon, 28 Jan 2019 05:25:20 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
 <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
 <CACRpkdbcKLXFNpWWsNqrDa2U9QKnO7700n2-1gM64-v1+bkrTg@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E440ABF@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E440ABF@shsmsx102.ccr.corp.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Jan 2019 14:25:08 +0100
Message-ID: <CACRpkda6PZnoF83mYeTDYxqaFYLTp2jn=E6WJe6KptRuYbFLuQ@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: "Wang, Kuiying" <kuiying.wang@intel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery,
 Vernon" <vernon.mauery@intel.com>, 
 "Feist, James" <james.feist@intel.com>, "Yoo,
 Jae Hyun" <jae.hyun.yoo@intel.com>, 
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>, "Khetan,
 Sharad" <sharad.khetan@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 13:25:26 -0000

Hi Kwin!

On Tue, Jan 22, 2019 at 11:39 AM Wang, Kuiying <kuiying.wang@intel.com> wrote:
>
> Hi Linus,
> Let me attach a draft patch, it will be easy to understand.
>
> if someone wanna enable passthrough just need to override like " gpio->chip.direction_passthrough = aspeed_gpio_dir_passthrough;"
> else passthrough is disabled.
>
> In app level, just need to echo "passthrough" to enable passthrough like "echo passthrough > /sys/class/gpio/gpio35/direction"

Sorry, but the sysfs ABI is deprecated since over three years
and we will not add any new interesting features to it. Most
major distributions don't even compile it in to the kernel
anymore.

Your only option to control anything like this from userspace would
be through the new gpio character device ABI, see examples
in tools/gpio to see how to use this new ABI.

>  static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>  {
>         struct aspeed_gpio *gpio = gpiochip_get_data(gc);
> @@ -1188,6 +1215,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->chip.parent = &pdev->dev;
>         gpio->chip.direction_input = aspeed_gpio_dir_in;
>         gpio->chip.direction_output = aspeed_gpio_dir_out;
> +       gpio->chip.direction_passthrough = aspeed_gpio_dir_passthrough;

As stated earlier, do not add new callbacks for this. Use the
existing .set_config, extend generic config options with
a passthrough attribute.

> +       else if (sysfs_streq(buf, "passthrough"))
> +               status = gpiod_direction_passthrough(desc);

NACK on this sorry. This is the wrong design approach.

The Aspeed GPIO driver already contains a .set_config
callback. Use this.

It is this function:

static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
                                  unsigned long config)
{
        unsigned long param = pinconf_to_config_param(config);
        u32 arg = pinconf_to_config_argument(config);

        if (param == PIN_CONFIG_INPUT_DEBOUNCE)
                return set_debounce(chip, offset, arg);
        else if (param == PIN_CONFIG_BIAS_DISABLE ||
                        param == PIN_CONFIG_BIAS_PULL_DOWN ||
                        param == PIN_CONFIG_DRIVE_STRENGTH)
                return pinctrl_gpio_set_config(offset, config);
        else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
                        param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
                /* Return -ENOTSUPP to trigger emulation, as per datasheet */
                return -ENOTSUPP;
        else if (param == PIN_CONFIG_PERSIST_STATE)
                return aspeed_gpio_reset_tolerance(chip, offset, arg);

Here add

else if (param == PIN_CONFIG_PASSTHROUGH)
   ....

And work from there.

Yours,
Linus Walleij
