Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDTFl0CdWzDqGr
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 16:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NoZkbrUe"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id w144so432083oiw.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 21:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4nhWRDZYAaDgWWeZz7kRVbENjxbtoakdRJnUH3Z7Y2U=;
 b=NoZkbrUeZOsVpgka4sWn+A8OmrqbNUAGFBaotHswg7+sf7uncXbtF9Na1aeqd8ppYN
 vJksJee7uy8hhvCgHyd7HeCXmhDzeQ9ZnAVxTgeY32HHbQDJMwF3qeXeXCmc0hFLcBVP
 2XAIN9FvoqYYV4PEmrioA0d61sLr2LiVCfEKWQXn/E7+DTrh7V/dJyB25meqkw3xHmPJ
 vL2n0gVIXomvr2KYyWYPwyz2gpPh/ju33r4MyYn0zO2uQCOjWu/th+f/mSdAwAPeFPrA
 a+IQCwpjfMtyewQ6wToCwvW1qVdZq+spqFIast94QgsO0zTMmg/m21CNclOCCLpJwpzF
 wKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4nhWRDZYAaDgWWeZz7kRVbENjxbtoakdRJnUH3Z7Y2U=;
 b=K4QDZnc78K1mS4TfAs4Hed1BFRUMx2qhPMDBzvqWmqfLIT82xw784c1n4a7W8IbLf5
 8iytM8QrIH07zQ815m3nuYIjGEjeY5np1etr7ytUbfUcNeNGnnc5+KZsNLPHy2DFbPE/
 oJlrmFjcWDPd7ETMf4QlVzlziRyfR7n95DPQZwFv72yOWv1AeO7yAOIeBvLzi/OJpW/Z
 JSP4lMfyrFrMtNa8WP6QC1hyPUrOw6QjwCbAA+P7nfvhRU/Wwo8J42re1Q2p2AcsnRmq
 2/HwBX43RH3YKXwk3tkhpz19iTlJcRinO+8815OIUkV24WIpe6nCk9VDxZkHbXXphfN+
 4dMA==
X-Gm-Message-State: AIkVDXJ+QxYXefTYCKp8KeCyXBIWHgwULgCLy0ZLLcZNK4LzGNfv1q6Hg23cMK3IjClJS9SGGo3ioalPKdbjEw==
X-Received: by 10.202.240.11 with SMTP id o11mr2997758oih.198.1486013657024;
 Wed, 01 Feb 2017 21:34:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Wed, 1 Feb 2017 21:33:56 -0800 (PST)
In-Reply-To: <20170202042817.8033-1-andrew@aj.id.au>
References: <20170202042817.8033-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Feb 2017 16:03:56 +1030
X-Google-Sender-Auth: PVY7XI8pwZuBaMQ0YBP7xIDNu6I
Message-ID: <CACPK8XcwRc__FscVSS9N3MOpyjigNFo4MiFQn0_qqxxE=q46oA@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 02 Feb 2017 05:34:19 -0000

On Thu, Feb 2, 2017 at 2:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> 1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
> unresolved review comments[1]. Address the comments by removing the use
> of macros from the consumer header (this patch represents the diff
> between v2 and v3[2]).
>
> [1] https://lkml.org/lkml/2017/1/26/337
> [2] https://lkml.org/lkml/2017/1/26/786
>
> Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>
> Note: This should be applied to pinctrl/devel where the linked GPIO patches
> have landed. See discussion at https://lkml.org/lkml/2017/2/1/390
>
>  drivers/gpio/gpio-aspeed.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 6e4b278a82f1..fb16cc771c0d 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -15,7 +15,6 @@
>  #include <linux/io.h>
>  #include <linux/spinlock.h>
>  #include <linux/platform_device.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/pinctrl/consumer.h>
>
> @@ -259,10 +258,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>         u32 val;
>
>         if (!have_input(gpio, offset))
> -               return GPIOF_DIR_OUT;
> +               return 0;
>
>         if (!have_output(gpio, offset))
> -               return GPIOF_DIR_IN;
> +               return 1;
>
>         spin_lock_irqsave(&gpio->lock, flags);
>
> --
> 2.9.3
>
