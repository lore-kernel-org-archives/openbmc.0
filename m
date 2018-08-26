Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oLKPFqfa"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41yxZh0lJWzDr42
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 00:03:55 +1000 (AEST)
Received: by mail-it0-x243.google.com with SMTP id h23-v6so7409864ita.5
 for <openbmc@lists.ozlabs.org>; Sun, 26 Aug 2018 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iPwbEDTPByu5LSTSxhIZyxzfliU7zI5i4FxRIj1eT3s=;
 b=oLKPFqfaCcdQ7TBLlnHTTfxDm26qdDAIDlHVg+jrhpVpuepk9PA7wrc+0v9mnGzBGv
 7nxuVqxq5ne1iWa4xF/FPWZQWsJfsZqyqsr/ti4LGOUROiURzAaPwW2EN7yaAWrMJ+ZP
 GWs8Ofk9sWTA7y7uco1QAdSKPlmNaZqxDTtDi96OG+wlfsqrwiOfJkEIetQh0dGVi1M3
 efuhn7fg7ccjjKN/Hvyf5cJFSTuH9NnSi2InYs1PN6b/riAYMqFSuGuYZAo4nmb61DOa
 fI+hgBVTXHCNQUtGMWNBM6rMp6JANDexNQFx0W2k8pSYN198uF0kD0QpEXOaRDOPbLn3
 xaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iPwbEDTPByu5LSTSxhIZyxzfliU7zI5i4FxRIj1eT3s=;
 b=D+p7RZm9BmfJN6sqB7m2eLQMS4aUICqh82XKvLQj/AcFJboZXFG2JoT4zoLvs7w7XM
 f/MVdCFzmD8b5B7t9IfhHg1IdH0GPiibC4HbOwCOISd0Z0y859LIIjpEBoGow9yjOQh0
 qF4GUu+Os7Yprt8K2U2mpydvkiPp7XPCLBeXhYtgzjK7qn6uML2TuSkR+8gPrOKn/h2/
 PylDCEfMciy6s4K32JeYiWERuv/zzIlvB54lG3chBnwYRTEu2hzhqZ2O8KyP8SoiolGC
 dL3OK4MgPnMorwUOVLHw/4hbjE2vsvgXlbilLTn0gkwp5c+pam9aqUH2+2sXB5MLM8+q
 AOJg==
X-Gm-Message-State: APzg51C8/WUeGENdTS82U1NGxkpdg4VfvzrtokA/hzzzMRXrvuz1xeq6
 IM1ERq6Ah96k1g9cuBic23rWjqSSlhcQpgLYbg==
X-Google-Smtp-Source: ANB0VdaddUkoF3z7uNCz4IJf8dd9xuHzqSQ4DLvYI+3joaLQD/UtetG9PB5Hi8tSRWwoEqSfSqtx4KfFu7neFysdW0k=
X-Received: by 2002:a02:2a48:: with SMTP id
 w69-v6mr1298270jaw.106.1535292232934; 
 Sun, 26 Aug 2018 07:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180823230654.GA11576@embeddedor.com>
 <CAGXu5jK7VQSo=xsYVp5DPmUgULNt+wopyAXnK20z+LxZtyPfZA@mail.gmail.com>
In-Reply-To: <CAGXu5jK7VQSo=xsYVp5DPmUgULNt+wopyAXnK20z+LxZtyPfZA@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 26 Aug 2018 17:03:33 +0300
Message-ID: <CAKKbWA53F-LJhax7OD8jA2VkNAqoRJE21GxdOJwPP5XQANkyzA@mail.gmail.com>
Subject: Re: [PATCH] clk: npcm7xx: fix memory allocation
To: keescook@chromium.org
Cc: gustavo@embeddedor.com, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, mturquette@baylibre.com,
 sboyd@kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-clk@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Sun, 26 Aug 2018 14:03:57 -0000

On Fri, Aug 24, 2018 at 2:18 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Aug 23, 2018 at 4:06 PM, Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> > One of the more common cases of allocation size calculations is finding
> > the size of a structure that has a zero-sized array at the end, along
> > with memory for some number of elements for that array. For example:
> >
> > struct foo {
> >         int stuff;
> >         void *entry[];
> > };
> >
> > instance = kzalloc(sizeof(struct foo) + sizeof(void *) * count,
> > GFP_KERNEL);
> >
> > Instead of leaving these open-coded and prone to type mistakes, we can
> > now use the new struct_size() helper:
> >
> > instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);
> >
> > Notice that, currently, there is a bug during the allocation:
> >
> > sizeof(npcm7xx_clk_data) should be sizeof(*npcm7xx_clk_data)
> >
> > Fix this bug by using struct_size() in kzalloc()
> >
> > This issue was detected with the help of Coccinelle.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>
> -Kees
>
> > ---
> >  drivers/clk/clk-npcm7xx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
> > index 740af90..c5edf8f 100644
> > --- a/drivers/clk/clk-npcm7xx.c
> > +++ b/drivers/clk/clk-npcm7xx.c
> > @@ -558,8 +558,8 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
> >         if (!clk_base)
> >                 goto npcm7xx_init_error;
> >
> > -       npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
> > -               NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data), GFP_KERNEL);
> > +       npcm7xx_clk_data = kzalloc(struct_size(npcm7xx_clk_data, hws,
> > +                                  NPCM7XX_NUM_CLOCKS), GFP_KERNEL);
> >         if (!npcm7xx_clk_data)
> >                 goto npcm7xx_init_np_err;
> >
> > --
> > 2.7.4
> >
>
>
>
> --
> Kees Cook
> Pixel Security



-- 
Regards,
Avi
