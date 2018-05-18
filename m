Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EfwSjUUV"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="C5YZ8d2Y"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40nL4V2KbzzF29L
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 17:52:42 +1000 (AEST)
Received: by mail-qk0-x244.google.com with SMTP id l132-v6so5743552qke.3
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mjU8rT5NkU910K2otjXRcI6g5mu86Ta2fCFO5+S23Dk=;
 b=EfwSjUUV4/rhMr9wJ8a8X84Nccp8O+aDk/GVOzhNAKko8ZHjLEWXEXk7b/T+JqgiDI
 h/CX6kSAvy0AbR9kMx73VGccJHhXpM4gy5rpLNOrjXMPqEzeNMuQoTzcoa2DLaAnLA+u
 nckoWHOCf5mm86W6I8CVJUR4tCXC4dGY7cAmHLiTWkLz7gRrhMe85iDvIWx0d/Nk0LZH
 QSFUd0n4Pij7jDaq6WviS3JnevZjU62FPXY26B5FwhUpJmOlenLGBeXjdm853LvmGh5q
 Chd1HN16KzHbvUnvDDv58IbzEXn0fKcJCRYXzx03QyiI3QvVIenK+rFk/M2uQr2IrMrV
 fzCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mjU8rT5NkU910K2otjXRcI6g5mu86Ta2fCFO5+S23Dk=;
 b=C5YZ8d2Y1h/eVZI9ZE7FnDr8GxxCfvRJsM4u1utXwC+S0tOKUjbO9SouvwvCt9m7jA
 ZnFTP4Jv1HlvVjsUpAL1YGERVUeKNgjb15QsRZHtLzP6yQkofwbQTGAL9iQwgg3cTWY/
 F0/OwtAhrf47UaVGAulA6YFl92MgOuapSb3/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mjU8rT5NkU910K2otjXRcI6g5mu86Ta2fCFO5+S23Dk=;
 b=kihUxbTgKxXT1YU4PR7wwy4agVVRrbfmL/hGa0GqLMxfUz3J+7VfiIym9uiO14/Yud
 +/S1mELbIGOSdQdFF069otpbokdnWggatEaE97yGCRnYuR0/Gzd01y6WDsvMf/tsVFl2
 SLeQn6uwguQcyAWWJTzNobTULfDTOQxv74/KyUt0lJmL576gJr+ULoTE30eAPosfYmBK
 TyjNmON5UTgs3J9RLTCw+BXi1sgETiIk+RTxFceDKpbqcnszjI7xDZbANUE2/5Eh+y+X
 9Wg345GNzJRUrBhWI0rG6xnGKWgZPliPgFoFdvR3T6+lD/twI1tzyRhct4VMllMZMsE/
 tqOQ==
X-Gm-Message-State: ALKqPwcDhIhiME8rD/WoqiQDsZJqdEWbjNgcXIzshnNcThb5jrRdkGUs
 gDUkgGHQZrodTljmDbJzZmZxpcNbR/v7loKGVGk=
X-Google-Smtp-Source: AB8JxZr03dlYZMP0lsD1QRG9LX8foU+mE+0KRpIoA2HNVqBorgD/kCWGT77Vd9DiLmbb/kxxLRFSdG2JNQyv0wakoP4=
X-Received: by 2002:a37:5d84:: with SMTP id
 r126-v6mr7596613qkb.352.1526629959516; 
 Fri, 18 May 2018 00:52:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Fri, 18 May 2018 00:52:19 -0700 (PDT)
In-Reply-To: <1525858559-130220-1-git-send-email-mine260309@gmail.com>
References: <1525858559-130220-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 May 2018 17:22:19 +0930
X-Google-Sender-Auth: DeTFYax4yiDkA_CYV7ymrw2z4Z0
Message-ID: <CACPK8XfeFU9msw_HHwgSuUL_WGSygGYoTyzyXktHprusf7qsrw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 1/2] clk: aspeed: Add 24MHz fixed clock
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Fri, 18 May 2018 07:52:44 -0000

On 9 May 2018 at 19:05, Lei YU <mine260309@gmail.com> wrote:
> Add a 24MHz fixed clock.
> This clock will be used for certain devices, e.g. pwm.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  drivers/clk/clk-aspeed.c                 | 8 +++++++-
>  include/dt-bindings/clock/aspeed-clock.h | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index c5d2af2..2ea1ec1 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -23,7 +23,7 @@
>
>  #include <dt-bindings/clock/aspeed-clock.h>
>
> -#define ASPEED_NUM_CLKS                35
> +#define ASPEED_NUM_CLKS                36
>
>  #define ASPEED_RESET2_OFFSET   32
>
> @@ -517,6 +517,12 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_clk_data->hws[ASPEED_CLK_BCLK] = hw;
>
> +       /* Fixed 24MHz clock */
> +       hw = clk_hw_register_fixed_rate(NULL, "fixed-24m", NULL, 0, 24000000);

Ryan had this to say:

>  it comes from external osc is soc input clock source.

So we should set the parent to be "clkin".

Please add that and send upstream. I'll have this with the fix to dev-4.13.

Cheers,

Joel


> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
> +
>         /*
>          * TODO: There are a number of clocks that not included in this driver
>          * as more information is required:
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
> index e983d17..9733c77 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -37,6 +37,7 @@
>  #define ASPEED_CLK_MAC                 32
>  #define ASPEED_CLK_BCLK                        33
>  #define ASPEED_CLK_MPLL                        34
> +#define ASPEED_CLK_24M                 35
>
>  #define ASPEED_RESET_XDMA              0
>  #define ASPEED_RESET_MCTP              1
> --
> 2.7.4
>
