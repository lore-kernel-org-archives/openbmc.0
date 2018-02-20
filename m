Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZzliEP6D"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlq775bBczF0TH
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 16:34:27 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id n198so15057775qke.7
 for <openbmc@lists.ozlabs.org>; Mon, 19 Feb 2018 21:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Mf0OSUsK7HQtfW9lZUyVo6tzcbQJ3JTdAoy90/vDqxs=;
 b=ZzliEP6DskCKNQ6LcLZCRQVlEbvsrgEyFB7LwjeUau6Dd1M7rSYkN8/RC1G62ok/bQ
 JnWLqvLQ+hORa1qYuw/UJVFWCfqWBIPRsruEvnwYsVAOzBmHhi1MgwTbz9WBOgiA4Fue
 dFgC2IvbmmCrVXr355ldfeKYgFX4/SGpruPuR65MOFrNEnCqXtizturJqKQ+tNy/KD7Q
 ZEQ0FJdgFvV4IkYgq0I8AmqB4xNMx5PYnyVhqQX7Y/KRovTnFsMUqM+fROQdsBWBkMpc
 l1uW6V9Wq/Ngo0WoJWIPHd3TKRLsHgvXzVedz8wRmQpzfDAuJ5OzUauTQrNQlWyoLc6b
 i+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Mf0OSUsK7HQtfW9lZUyVo6tzcbQJ3JTdAoy90/vDqxs=;
 b=R15OK0hHHsxYUKNEUcz3+0zaQUQ8bW58aMEZVpp3NSZs9JYQVU00QHgnTeNzMou7ob
 lA3RODKSVGT/TJWyqEpL6eZzuyFXO/ga+LZ8zYvIwUOLU1Xiw51ta+INDulqCp0jHNCw
 XnO/u9DGfizDbdUBGeyFPfhKo2fg4M579ZdsBtIm6Zsd5V82VfiI57Z3Z0l5L1cH/JOC
 zpxO9UTE/PNP4Chc6bO3jzNk+7fA50QXfMgOageHM7gH9l2tPTOTzQbbPLQseBY2rfGL
 ebK8XHh2rKdVpa9KDsDWJM5klCyXlCCRi08ZiQfO7M3CJgt4Q5FiDZVWGalee47eWPRo
 oGNQ==
X-Gm-Message-State: APf1xPD9kx7tPNLvvsYuODgwfniWzKH2frDRaw0yZpI+5nuOgujCigYf
 X11maU2fzsqW6ZzmCQLs1H6rN8kgNj6wC9vJgtVO3Q==
X-Google-Smtp-Source: AH8x227XMesmaS8WM62pbAX0wGTJtCkCZkbTrrkVzd758uSk4KRFaorRe8aw6sNOrkTmPLP998bhFgFJ55fcdIuG/0M=
X-Received: by 10.55.56.84 with SMTP id f81mr15697031qka.25.1519104864601;
 Mon, 19 Feb 2018 21:34:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 19 Feb 2018 21:34:04 -0800 (PST)
In-Reply-To: <20180220040339.11632-1-andrew@aj.id.au>
References: <20180220040339.11632-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Feb 2018 16:04:04 +1030
X-Google-Sender-Auth: Xz9S_CmzarPMF4tiEOnc-zkgwdc
Message-ID: <CACPK8Xc5JEJMGg+4HJn9HLgsZo7N0sBygU3feSYxwJZnZAhvrQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] clk: aspeed: Update to upstream to avoid
 schedule()ing from atomic context
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 20 Feb 2018 05:34:28 -0000

On Tue, Feb 20, 2018 at 2:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The patch is generated against v4.16-rc2. Critically, it fixes a bug where
> we schedule() from an atomic context:

Thanks for pointing this out. I chose to backport the fixes that were
upstream and make the s/msleep/mdelay/ fix in it's own patch.

Cheers,

Joel

>
> [    1.570455] BUG: scheduling while atomic: swapper/1/0x00000003
> [    1.576541] 4 locks held by swapper/1:
> [    1.580326]  #0:  (&dev->mutex){......}, at: [<802b7ac0>] __driver_attach+0x64/0x10c
> [    1.588177]  #1:  (&dev->mutex){......}, at: [<802b7ad0>] __driver_attach+0x74/0x10c
> [    1.596002]  #2:  (enable_lock){......}, at: [<80286f68>] clk_enable_lock+0x28/0x130
> [    1.603839]  #3:  (aspeed_clk_lock){......}, at: [<8028ff30>] aspeed_clk_enable+0x38/0xf4
> [    1.612096] irq event stamp: 157268
> [    1.615630] hardirqs last  enabled at (157267): [<804c10a0>] _raw_spin_unlock_irqrestore+0x40/0x6c
> [    1.624621] hardirqs last disabled at (157268): [<80286f60>] clk_enable_lock+0x20/0x130
> [    1.632670] softirqs last  enabled at (156064): [<80116160>] bdi_register_va+0xf4/0x240
> [    1.640713] softirqs last disabled at (156062): [<80116144>] bdi_register_va+0xd8/0x240
> [    1.648744] CPU: 0 PID: 1 Comm: swapper Not tainted 4.13.16-00190-g78a200cb21ab #2393
> [    1.656583] Hardware name: Generic DT based system
> [    1.661438] [<8001141c>] (unwind_backtrace) from [<8000e87c>] (show_stack+0x20/0x24)
> [    1.669235] [<8000e87c>] (show_stack) from [<804a65ec>] (dump_stack+0x20/0x28)
> [    1.676527] [<804a65ec>] (dump_stack) from [<80047680>] (__schedule_bug+0x70/0xa4)
> [    1.684150] [<80047680>] (__schedule_bug) from [<804bb8e0>] (__schedule+0x648/0x8a4)
> [    1.691933] [<804bb8e0>] (__schedule) from [<804bbbec>] (schedule+0x5c/0xcc)
> [    1.699025] [<804bbbec>] (schedule) from [<804bffec>] (schedule_timeout+0x220/0x498)
> [    1.706819] [<804bffec>] (schedule_timeout) from [<80073af0>] (msleep+0x48/0x58)
> [    1.714264] [<80073af0>] (msleep) from [<8028ffac>] (aspeed_clk_enable+0xb4/0xf4)
> [    1.721796] [<8028ffac>] (aspeed_clk_enable) from [<80288654>] (clk_core_enable+0xac/0x248)
> [    1.730189] [<80288654>] (clk_core_enable) from [<80288818>] (clk_core_enable_lock+0x28/0x3c)
> [    1.738760] [<80288818>] (clk_core_enable_lock) from [<8028aab4>] (clk_enable+0x24/0x28)
> [    1.746907] [<8028aab4>] (clk_enable) from [<802df144>] (aspeed_lpc_ctrl_probe+0x148/0x25c)
> [    1.755315] [<802df144>] (aspeed_lpc_ctrl_probe) from [<802b97c8>] (platform_drv_probe+0x60/0xbc)
> [    1.764230] [<802b97c8>] (platform_drv_probe) from [<802b78f0>] (driver_probe_device+0x2e4/0x450)
> [    1.773135] [<802b78f0>] (driver_probe_device) from [<802b7b28>] (__driver_attach+0xcc/0x10c)
> [    1.781699] [<802b7b28>] (__driver_attach) from [<802b58a4>] (bus_for_each_dev+0x5c/0xac)
> [    1.789915] [<802b58a4>] (bus_for_each_dev) from [<802b7d04>] (driver_attach+0x28/0x30)
> [    1.797958] [<802b7d04>] (driver_attach) from [<802b62dc>] (bus_add_driver+0x194/0x254)
> [    1.806001] [<802b62dc>] (bus_add_driver) from [<802b8b54>] (driver_register+0x88/0x104)
> [    1.814133] [<802b8b54>] (driver_register) from [<802ba42c>] (__platform_driver_register+0x3c/0x50)
> [    1.823234] [<802ba42c>] (__platform_driver_register) from [<8068a814>] (aspeed_lpc_ctrl_driver_init+0x20/0x28)
> [    1.833381] [<8068a814>] (aspeed_lpc_ctrl_driver_init) from [<80669f1c>] (do_one_initcall+0xb0/0x170)
> [    1.842651] [<80669f1c>] (do_one_initcall) from [<8066a0f4>] (kernel_init_freeable+0x118/0x1d0)
> [    1.851406] [<8066a0f4>] (kernel_init_freeable) from [<804b9b94>] (kernel_init+0x18/0x104)
> [    1.859717] [<804b9b94>] (kernel_init) from [<8000a868>] (ret_from_fork+0x14/0x2c)
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/clk/clk-aspeed.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 4a0d2649d907..9f7f931d6b2f 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -1,13 +1,4 @@
> -/*
> - * Copyright 2017 IBM Corporation
> - *
> - * Joel Stanley <joel@jms.id.au>
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License
> - * as published by the Free Software Foundation; either version
> - * 2 of the License, or (at your option) any later version.
> - */
> +// SPDX-License-Identifier: GPL-2.0+
>
>  #define pr_fmt(fmt) "clk-aspeed: " fmt
>
> @@ -220,6 +211,7 @@ static int aspeed_clk_enable(struct clk_hw *hw)
>         unsigned long flags;
>         u32 clk = BIT(gate->clock_idx);
>         u32 rst = BIT(gate->reset_idx);
> +       u32 enval;
>
>         spin_lock_irqsave(gate->lock, flags);
>
> @@ -232,12 +224,12 @@ static int aspeed_clk_enable(struct clk_hw *hw)
>         }
>
>         /* Enable clock */
> -       regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, 0);
> +       enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
> +       regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
>
>         if (gate->reset_idx >= 0) {
> -               /* Delay 10ms */
> -               /* TODO: can we sleep here? */
> -               msleep(10);
> +               /* A delay of 10ms is specified by the ASPEED docs */
> +               mdelay(10);
>
>                 /* Take IP out of reset */
>                 regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
> @@ -253,10 +245,12 @@ static void aspeed_clk_disable(struct clk_hw *hw)
>         struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
>         unsigned long flags;
>         u32 clk = BIT(gate->clock_idx);
> +       u32 enval;
>
>         spin_lock_irqsave(gate->lock, flags);
>
> -       regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, clk);
> +       enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? clk : 0;
> +       regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
>
>         spin_unlock_irqrestore(gate->lock, flags);
>  }
> @@ -488,7 +482,12 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>
>         for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>                 const struct aspeed_gate_data *gd = &aspeed_gates[i];
> +               u32 gate_flags;
>
> +               /* Special case: the USB port 1 clock (bit 14) is always
> +                * working the opposite way from the other ones.
> +                */
> +               gate_flags = (gd->clock_idx == 14) ? 0 : CLK_GATE_SET_TO_DISABLE;
>                 hw = aspeed_clk_hw_register_gate(dev,
>                                 gd->name,
>                                 gd->parent_name,
> @@ -496,7 +495,7 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>                                 map,
>                                 gd->clock_idx,
>                                 gd->reset_idx,
> -                               CLK_GATE_SET_TO_DISABLE,
> +                               gate_flags,
>                                 &aspeed_clk_lock);
>                 if (IS_ERR(hw))
>                         return PTR_ERR(hw);
> @@ -619,7 +618,7 @@ static void __init aspeed_cc_init(struct device_node *np)
>         int i;
>
>         scu_base = of_iomap(np, 0);
> -       if (IS_ERR(scu_base))
> +       if (!scu_base)
>                 return;
>
>         aspeed_clk_data = kzalloc(sizeof(*aspeed_clk_data) +
> --
> 2.14.1
>
