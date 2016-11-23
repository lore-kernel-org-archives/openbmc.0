Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNqnZ38hLzDw1F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 15:57:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GmsLr/5I"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 50so134461uae.2
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 20:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2EhjE6GDGiDqLIxl33Z83Mn0LgvMtnUJf7TX/24OZuE=;
 b=GmsLr/5IOt03WchAZ/4M7wwkggclFdF1eQyya0IF9QxxL2nKjLZhyTJnnVsVkMm1l3
 Rs85sHLGelejL1GNFZwdy7vfAp7C4JPtHXLo+Q8gOAYq1Ku+fq+nZpWsGLM1L75a7o8Q
 24MA34447+83oeFpOE32o8vH/WDsCs/KJa/nAWAnlrqc7Ltj8fQMRUj0nj/taRP1/GYf
 FWOcoZZo8erXv6JpIqCNmXqTX2zwLtdFKuH/v1vAU+93T1YUhI5TSOauNX2inHiIvZnZ
 TGiuiWtnXdIEF/Wz7jaE5xTNdVw1orf2FXU0rc3F+kYWCBQbnunE44nwLQ43+ZXiHGQJ
 t0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2EhjE6GDGiDqLIxl33Z83Mn0LgvMtnUJf7TX/24OZuE=;
 b=GITher+fFYLWKARsaNPWpGtWYM7XWIokpSsL6lzLAlIgpFiT2qZsJ8T/doBRXOh8sL
 A+UZbt2Q+VjYfMnmZNWjjc1UxjLLomXXOITOj85yw3Z0kJZeybM9RPpXCKbg6FK0CQpq
 NMFyX+YLkNVjxgw1U8xaMzHvmceN65cNUEmEjVJBgxRwkMrF8+e957TmMctYWN/mzOsr
 g5kGHgUKQ/swlddc5m0cUfxAeqVZD6B+bwuJdMwvnffB5Y2LbilYe41h6PfZoKyzICGB
 glEnMcmyDVqUCjZW+FJFCt9i/hc2fRbA0E0p6A1IFz7qZBqvwZ1E2fPohhlHBZ5e5w0L
 9Udg==
X-Gm-Message-State: AKaTC03JE06Zhd82rKqKG6eLNv91L/K+rBwCSluNrzftJFeth+8QpOMS6VRG+/Dr/wpKI2BxfzgTBZ747grpIw==
X-Received: by 10.176.84.207 with SMTP id q15mr665210uaa.177.1479877024391;
 Tue, 22 Nov 2016 20:57:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Tue, 22 Nov 2016 20:56:44 -0800 (PST)
In-Reply-To: <12131479795846@webcorp02g.yandex-team.ru>
References: <12131479795846@webcorp02g.yandex-team.ru>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Nov 2016 15:26:44 +1030
X-Google-Sender-Auth: A1L2pSu3PQaCP1Jk6e6ultwRSac
Message-ID: <CACPK8Xc+dgohMYhShGoifNf4pxWTHzoas1G1+FiffPGBG-7j7Q@mail.gmail.com>
Subject: Re: [PATCH] ftgmac100: fixup MAC address set during board bringup
To: "Anton D. Kachalov" <mouse@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 23 Nov 2016 04:57:07 -0000

On Tue, Nov 22, 2016 at 4:54 PM, Anton D. Kachalov <mouse@yandex-team.ru> wrote:
> Hardware reset leads to clear all registers.
> Make the hardware reset first before actual MAC address set in ftgmac100_initialization loop.
> Based on datasheet only one bit (SW_RST) have to be set in order to proper MAC reset.
>
> Signed-off-by: Anton D. Kachalov <mouse@yandex-team.ru>

Thanks for the patch!

> ---
>  drivers/net/ftgmac100.c       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
> --- a/drivers/net/ftgmac100.c   2016-11-22 07:07:44.000000000 +0300
> +++ b/drivers/net/ftgmac100.c   2016-11-22 07:27:12.131940971 +0300
> @@ -457,7 +457,7 @@ static void ftgmac100_reset(struct eth_d
>         debug("%s()\n", __func__);
>
>         //Ryan modify
> -       __raw_writel(__raw_readl(&ftgmac100->maccr) | FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
> +       __raw_writel(FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);

I assume all of the other values in MACCR will be reset when we do the
software reset, so that's why you don't need to read-modify-write?

>
>         while (__raw_readl(&ftgmac100->maccr) & FTGMAC100_MACCR_SW_RST);
>
> @@ -791,11 +791,11 @@ int ftgmac100_initialize(bd_t *bd)
>                 miiphy_register(dev->name, ftgmac100_reg_read, ftgmac100_reg_write);
>  #endif
>
> +               ftgmac100_reset(dev);
> +

This part of the change looks good.

Cheers,

Joel

>                 /* set the ethernet address */
>                 ftgmac100_set_mac_from_env(dev);
>
> -               ftgmac100_reset(dev);
> -
>                 card_number++;
>         }
>         return card_number;
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
