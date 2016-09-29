Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skx1D0VWMzDshk
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:54:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=veq3jBKJ; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id v205so2236865vke.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mfeDfc4lVfoPDFypdBC84SekBJ1mTBVDlCC0JOvwbUg=;
 b=veq3jBKJovDDNEF+paI8F+5lV3ne13eVfmGJgwP7an4xR3TlI8zTn9BbfdrQqJNsVP
 7RT4oLEWGWYU6OAogmMLvSfKdbL5ilD2/r3PEPNEe2YqzwKfyB2GLa8Aio6bYD8v9czh
 W8MAWyh7qrUkKsxK6NyzrpArUs1rPjfRb8ok0BofECnet26RwvWx2T9gam9seFXAo7AD
 sumra7NEEHRDpqI32Y5p/PIJWDAMxSZbtYKVmVMlr2Cb9DsnELqeneRdE0HGw+JKhn02
 QhfHlF82ToLJl4BRYUK+hqpN2LiJiUlwgzMwNKl8bl5u3VSSGGzU+qeKeUdiUCmKIIWq
 3g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mfeDfc4lVfoPDFypdBC84SekBJ1mTBVDlCC0JOvwbUg=;
 b=dmo0qbHBbO5ib7w5Ht5J/kEHxgI/ulO69hV5jXgyQ/pnEj6OPDzr283naSTXME6P/C
 BEUNwFfc3d9dsaRw//p2j9VhuoWOwAdV94fdcOuV3B0H4GsYhO+N+tFZHbs+mDIsYwCz
 3AZfqgF6XuXif8M1XrQIJlVm4E7jxCEcAgwz8+mcHgW6K6vbJa69p2cwDialfQ2bjXHQ
 36TZ6+UtP2S3BUdnubO8x4xJ4aHbcqQTimBpKyv9xe9PGWRi2LGmeVJt9S8fJuS1W+Ur
 ALr8mCO4dEcNjKVwrE7rcd4pvbsLNtzJmhIJFE/cSrRSU26td93/LAuuC+cL5xDTicKC
 4oBw==
X-Gm-Message-State: AA6/9RkIKsdFzbM6sPaAurBH+6jak/Kl1PFg0+lBih5+VrTJeJrXbYdG0YB+VGqDn4NNvfXmPlnbB8bJrr2RAw==
X-Received: by 10.31.115.207 with SMTP id o198mr19592820vkc.2.1475110478134;
 Wed, 28 Sep 2016 17:54:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 17:54:17 -0700 (PDT)
In-Reply-To: <9364de84d3be30a5349298e219ca827d176d7ba8.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <9364de84d3be30a5349298e219ca827d176d7ba8.1474986045.git-series.andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 10:24:17 +0930
X-Google-Sender-Auth: L3anU4roVZ8L7l6NjIOU91_eWvg
Message-ID: <CACPK8Xewvdj-zW7xS7PT6LPt8GJRh9_nDNew_6UeGZzmgtcT-A@mail.gmail.com>
Subject: Re: [PATCH 3/8] pinctrl: aspeed-g5: Fix GPIOE1 typo
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 29 Sep 2016 00:54:40 -0000

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This prevented C20 from successfully being muxed as GPIO.
>
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 14639834a5eb..235d929e74fd 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -182,7 +182,7 @@ SIG_EXPR_LIST_DECL_SINGLE(NDCD3, NDCD3, SIG_DESC_SET(SCU80, 17));
>  SIG_EXPR_DECL(GPIE0OUT, GPIE0, GPIE0_DESC);
>  SIG_EXPR_DECL(GPIE0OUT, GPIE, GPIE_DESC);
>  SIG_EXPR_LIST_DECL_DUAL(GPIE0OUT, GPIE0, GPIE);
> -MS_PIN_DECL(C20, GPIE0, NDCD3, GPIE0OUT);
> +MS_PIN_DECL(C20, GPIOE1, NDCD3, GPIE0OUT);
>
>  FUNC_GROUP_DECL(GPIE0, B20, C20);
>
> --
> git-series 0.8.10
