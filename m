Return-Path: <keescook@chromium.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::c41; helo=mail-yw1-xc41.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZxoAYnI3";
 dkim-atps=neutral
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xL1Z4D6XzDqC8
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 09:18:06 +1000 (AEST)
Received: by mail-yw1-xc41.google.com with SMTP id y134-v6so2453210ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 16:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=LAES9gX+SQq3A9ke8uOhWLm+0UsOm6t3NtXOL5NYcnI=;
 b=ZxoAYnI3EGLzTUdoHMyRso57uRnVnLAPGhO299G5ht4gtpAL5E8ABAyOJCer6dMF45
 GB+7a9e1SvCd7UL4nxccrvruIgHP46Pv8aqMNR4G2V8ONGkTaH7L7BbKOm3nvmHK97DQ
 Jc7CtCN4jIaj6bBjKY9HN5Hm9lwVmVzj6nV1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=LAES9gX+SQq3A9ke8uOhWLm+0UsOm6t3NtXOL5NYcnI=;
 b=FwXnjqbkM5KcMCngjrospL84H9sHSru/++OgYePDah18kn+4V7oCLe2etHFz58HDfM
 MG4EOuug67BIBfjuDA3OLc9aOzHEsEMIVPCXF6SxAubRk4LovxOdtazTJySq1MtdKjvG
 bLjxVhca2o6Bwz96dC4q47eqIKRR+aEOOyGVkmE0dH31yGSiaNf7Xwu273NWlXV60HhL
 MqSeIe9SaUpES87Xw0SQOrBRHaPNSpuLEf/96Ol8Zl92Ici1nr13cMcndUz9AxAiWgI3
 SJSKwxX+vKrP1hdYbn2ZdlqROcGHD+FRMxsx/jnss3zw0O+oS3ZgBXo0mZMBNjWOJR3E
 j0+Q==
X-Gm-Message-State: APzg51CrtVnTCRX3R2+y5fOK4J9jdJix/VjrTwQi8cOWiMS75Tm+htnU
 pP9EregvX20y8QcLURmmq3j3d3w4Av8=
X-Google-Smtp-Source: ANB0VdYkMtd/bMoomuhRNVZo0/RCjUzuu289Sbwi/4IClYq6Iy92KrpQUjeFRml9ZsbETJyeC3D7SA==
X-Received: by 2002:a81:f00a:: with SMTP id
 p10-v6mr4162253ywm.511.1535066282326; 
 Thu, 23 Aug 2018 16:18:02 -0700 (PDT)
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com.
 [209.85.213.182])
 by smtp.gmail.com with ESMTPSA id d13-v6sm3137059ywd.20.2018.08.23.16.18.00
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Aug 2018 16:18:00 -0700 (PDT)
Received: by mail-yb0-f182.google.com with SMTP id l16-v6so2833118ybk.11
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 16:18:00 -0700 (PDT)
X-Received: by 2002:a25:103:: with SMTP id 3-v6mr34452501ybb.421.1535066280062; 
 Thu, 23 Aug 2018 16:18:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:2c11:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 16:17:59
 -0700 (PDT)
In-Reply-To: <20180823230654.GA11576@embeddedor.com>
References: <20180823230654.GA11576@embeddedor.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 23 Aug 2018 16:17:59 -0700
X-Gmail-Original-Message-ID: <CAGXu5jK7VQSo=xsYVp5DPmUgULNt+wopyAXnK20z+LxZtyPfZA@mail.gmail.com>
Message-ID: <CAGXu5jK7VQSo=xsYVp5DPmUgULNt+wopyAXnK20z+LxZtyPfZA@mail.gmail.com>
Subject: Re: [PATCH] clk: npcm7xx: fix memory allocation
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, openbmc@lists.ozlabs.org,
 linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 26 Aug 2018 12:35:48 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 23:18:11 -0000

On Thu, Aug 23, 2018 at 4:06 PM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>
> struct foo {
>         int stuff;
>         void *entry[];
> };
>
> instance = kzalloc(sizeof(struct foo) + sizeof(void *) * count,
> GFP_KERNEL);
>
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
>
> instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);
>
> Notice that, currently, there is a bug during the allocation:
>
> sizeof(npcm7xx_clk_data) should be sizeof(*npcm7xx_clk_data)
>
> Fix this bug by using struct_size() in kzalloc()
>
> This issue was detected with the help of Coccinelle.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/clk/clk-npcm7xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
> index 740af90..c5edf8f 100644
> --- a/drivers/clk/clk-npcm7xx.c
> +++ b/drivers/clk/clk-npcm7xx.c
> @@ -558,8 +558,8 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
>         if (!clk_base)
>                 goto npcm7xx_init_error;
>
> -       npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
> -               NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data), GFP_KERNEL);
> +       npcm7xx_clk_data = kzalloc(struct_size(npcm7xx_clk_data, hws,
> +                                  NPCM7XX_NUM_CLOCKS), GFP_KERNEL);
>         if (!npcm7xx_clk_data)
>                 goto npcm7xx_init_np_err;
>
> --
> 2.7.4
>



-- 
Kees Cook
Pixel Security
