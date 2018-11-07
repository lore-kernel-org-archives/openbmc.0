Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ilkOvlVB"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qxrl2KFCzF3Gm
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 06:52:07 +1100 (AEDT)
Received: by mail-it1-x141.google.com with SMTP id j79-v6so12617025itb.2
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 11:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F4KMUeVBB2PsW2s3eUbDweq1jpGXsySqNaHA3LrsjEo=;
 b=ilkOvlVBXaVi9CSnAf3YDKBTmPO9iMiZVWX/1TXzBLJNYaXkG9Q7H0akE/H270wshs
 vOfJZ4k24ocLFgZbrlczmzBvdNwTRamOw6+zRxA4lXfbjQl6KCYFmsm/eMBlA2fBA5EY
 5TYIsvQphkKs1MmH1PyIN58AU8VfyESCYpMIuXfC9GgUnyfChRm7mzK/7vECyQ+FulCr
 N9TvQ9rWKTzKdwh9Df8WXwugQ3mXoRg9NXJXRJB2JshIHILhipJrklpLs22SPb8G7NzZ
 1u4GdDjJInIkiCboL+ww49totYp7hT3e23VZOspsDdAA5cd6Q2RzMU46pXojDagvofKK
 gT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F4KMUeVBB2PsW2s3eUbDweq1jpGXsySqNaHA3LrsjEo=;
 b=LvqTPP/yleHmZcpaqom7BLjk4TwVEnTsKS/5meKzpK9RbDeeJaXQZCJ5bDC/JIIiWR
 EJOM/omGhrdw3S22R5TZiWT40mjjq5/W57PAN8GkkgYORoCkyT+71Yj4n5jwCu/D9iL/
 QATvAUsKuK2gz16n+4FEe0pDYm4pSbmgG2Or7OHT0lvaz/H5dYzIKweFPwl91HLdoiZY
 8hPlFdE0q6JpjjTD7brrHeQsZsbsLnwY58ys/utCpu+fJ1ZdWNBT2qnqCj0NRL/Ok0Ur
 Tk5Yi7c2jtNtvFhGu6LYNW92sEy3pqgd3oSpkNEo0VuvKwtoIcHWjgUvc4QlV8VckOrs
 izLw==
X-Gm-Message-State: AGRZ1gL7UeE9nvARtr6kKeKF93az1xeoeQQpNks/w+MLgiT9LlFDmLcI
 iQpIygIoUhdXhfaCLU4af7t+PCPinoXNQLSPEctEpg==
X-Google-Smtp-Source: AJdET5dCDidE0yqPAnp1/W3asym3xWDwdkeG29hFFkYEwObxSQWYxnVAaudvAwAc1yKwYkgWhouMCXrghzdNlP1+CqM=
X-Received: by 2002:a24:b804:: with SMTP id m4-v6mr1332566ite.72.1541620324553; 
 Wed, 07 Nov 2018 11:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20181107134434.354795-1-tmaimon77@gmail.com>
 <20181107134434.354795-2-tmaimon77@gmail.com>
In-Reply-To: <20181107134434.354795-2-tmaimon77@gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Wed, 7 Nov 2018 11:51:37 -0800
Message-ID: <CAGMNF6Vn1J3eo529zPqAHeD+CfZFUHE2T8ZJK71EA2EN=j7mnQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: modify NPCM7xx pin configuration
 function
To: tmaimon77@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>,
 Benjamin Fair <benjaminfair@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, 
 Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org
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
X-List-Received-Date: Wed, 07 Nov 2018 19:52:08 -0000

On Wed, Nov 7, 2018 at 5:44 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Modify GPIO direction setting in pin configuration function by using
> generic GPIO functions to set the GPIO direction instead of direct
> access to the GPIO direction register.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Kun Yi <kunyi@google.com>

Thanks for sending the patch Tomer!
> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> index 7ad50d9268aa..b455209382a5 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -1799,19 +1799,12 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
>                 npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_PU, gpio);
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
> -               if (arg) {
> -                       iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
> -                       npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
> -                                     gpio);
> -               } else
> -                       npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
> -                                     gpio);
> +               iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
> +               bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
>                 break;
>         case PIN_CONFIG_OUTPUT:
> -               npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM, gpio);
> -               iowrite32(gpio, arg ? bank->base + NPCM7XX_GP_N_DOS :
> -                         bank->base + NPCM7XX_GP_N_DOC);
>                 iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
> +               bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
>                 break;
>         case PIN_CONFIG_DRIVE_PUSH_PULL:
>                 npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_OTYP, gpio);
> --
> 2.14.1
>


--
Regards,
Kun
