Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="POD/V0Mh"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TczN4XLqzDqDp
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 17:09:52 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id k14so17568857qtb.0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sC3uW13DT6NGJjZNq4iPqYirzLO4Rf7Hz96c20la5sw=;
 b=POD/V0MhHAO0MjEdAgEGjyupGuC5SAIjDPaBDTs1msFCvdsEwBEPmbHxq6vfltxddA
 SWHm4i4nTVNbKRs2xnzR0Q3Ay+hWS/klubJmUgkV2cO4JKLmFaXFnEG3RLi8CuZivFmu
 VhlCwjbkXnR2XSp3m/si6qfHaTFriBLDyj5Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sC3uW13DT6NGJjZNq4iPqYirzLO4Rf7Hz96c20la5sw=;
 b=ZEqp4A0y7WMrkYjr3L+AWlgy2yLMCdxvI/6lp+FQde+4hovS1kkIMPYbdR0kOSgskb
 1mCe8NmQ0jEfWvt5Yx8/Ub3MH86qR1H86+BM+k9vCuq7U5R83h2SS+EnXpKctJl+0Dqo
 Bm85DxKYa20MgdQQFUslglQPxbvx5Kbpz80cN3DwgsMbtyHxEYgoOe0gAQrWxzPxDLTe
 /aMt1CbcKbH4PzyVAeU2bwCGJuWxJFMyiRONw9SMha/NAROj9fujckdGAJyiFDXBbfFA
 bbUDGvbCI1D+7sO55n2Q172O+0XKYPjpCg8sfYGhiT+d9K36ppoLLOYQqOEPqjGHcO0A
 GKgQ==
X-Gm-Message-State: APjAAAURwRy1h6aaQDwsKQgpstrt7Xt5pBwxrBN840mQYmPvLoM1h/Va
 vAUinqqSlF5sdmA/hHm94zbvTDPEwKRSD3jn84QxFzTF
X-Google-Smtp-Source: APXvYqyWEHW3kTlFm14UkgksFNUh6Ou0hY+4UTP8ix5VszRxoN7jElb4ovpDB9tWT3/YPu3Qshou//8RbtgDUSx40to=
X-Received: by 2002:ac8:3687:: with SMTP id a7mr27022060qtc.284.1553666988951; 
 Tue, 26 Mar 2019 23:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
 <1553196610-29595-4-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1553196610-29595-4-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2019 06:09:37 +0000
Message-ID: <CACPK8XefZZiT5=XxMsTiwtfgea67TwaPiKoLithbQhAw_bNweQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 3/7] clk: aspeed: Setup video engine clocking
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 27 Mar 2019 06:09:52 -0000

On Thu, 21 Mar 2019 at 19:30, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add the video engine reset bit. Add eclk mux and clock divider table.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk-aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 5961367..f16ce7d 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -87,7 +87,7 @@ struct aspeed_clk_gate {
>  /* TODO: ask Aspeed about the actual parent data */
>  static const struct aspeed_gate_data aspeed_gates[] = {
>         /*                               clk rst   name                 parent  flags */
> -       [ASPEED_CLK_GATE_ECLK] =        {  0, -1, "eclk-gate",          "eclk", 0 }, /* Video Engine */
> +       [ASPEED_CLK_GATE_ECLK] =        {  0,  6, "eclk-gate",          "eclk", 0 }, /* Video Engine */

As I've said on previous reviews, it's incorrect to add the reset line
to the clock, and have it be a separate reset device.

When you add the reset bit to the clk device, we control both the
clock gating (bit 0, SCU0C) and the reset line (bit 6, SCU04) with the
clk device. You can see this happen in aspeed_clk_enable if
gate->reset_idx >= 0.

Assuming you are doing this on purpose, can you explain why you want
to have the reset device and the clk device both control the one bit?

Cheers,

Joel


>         [ASPEED_CLK_GATE_GCLK] =        {  1,  7, "gclk-gate",          NULL,   0 }, /* 2D engine */
>         [ASPEED_CLK_GATE_MCLK] =        {  2, -1, "mclk-gate",          "mpll", CLK_IS_CRITICAL }, /* SDRAM */
>         [ASPEED_CLK_GATE_VCLK] =        {  3,  6, "vclk-gate",          NULL,   0 }, /* Video Capture */
> @@ -113,6 +113,24 @@ struct aspeed_clk_gate {
>         [ASPEED_CLK_GATE_LHCCLK] =      { 28, -1, "lhclk-gate",         "lhclk", 0 }, /* LPC master/LPC+ */
>  };
>
> +static const char * const eclk_parent_names[] = {
> +       "mpll",
> +       "hpll",
> +       "dpll",
> +};
> +
> +static const struct clk_div_table ast2500_eclk_div_table[] = {
> +       { 0x0, 2 },
> +       { 0x1, 2 },
> +       { 0x2, 3 },
> +       { 0x3, 4 },
> +       { 0x4, 5 },
> +       { 0x5, 6 },
> +       { 0x6, 7 },
> +       { 0x7, 8 },
> +       { 0 }
> +};
> +
>  static const struct clk_div_table ast2500_mac_div_table[] = {
>         { 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
>         { 0x1, 4 },
> @@ -192,18 +210,21 @@ static struct clk_hw *aspeed_ast2500_calc_pll(const char *name, u32 val)
>
>  struct aspeed_clk_soc_data {
>         const struct clk_div_table *div_table;
> +       const struct clk_div_table *eclk_div_table;
>         const struct clk_div_table *mac_div_table;
>         struct clk_hw *(*calc_pll)(const char *name, u32 val);
>  };
>
>  static const struct aspeed_clk_soc_data ast2500_data = {
>         .div_table = ast2500_div_table,
> +       .eclk_div_table = ast2500_eclk_div_table,
>         .mac_div_table = ast2500_mac_div_table,
>         .calc_pll = aspeed_ast2500_calc_pll,
>  };
>
>  static const struct aspeed_clk_soc_data ast2400_data = {
>         .div_table = ast2400_div_table,
> +       .eclk_div_table = ast2400_div_table,
>         .mac_div_table = ast2400_div_table,
>         .calc_pll = aspeed_ast2400_calc_pll,
>  };
> @@ -317,6 +338,7 @@ struct aspeed_reset {
>         [ASPEED_RESET_PECI]     = 10,
>         [ASPEED_RESET_I2C]      =  2,
>         [ASPEED_RESET_AHB]      =  1,
> +       [ASPEED_RESET_VIDEO]    =  6,
>
>         /*
>          * SCUD4 resets start at an offset to separate them from
> @@ -522,6 +544,22 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
>
> +       hw = clk_hw_register_mux(dev, "eclk-mux", eclk_parent_names,
> +                                ARRAY_SIZE(eclk_parent_names), 0,
> +                                scu_base + ASPEED_CLK_SELECTION, 2, 0x3, 0,
> +                                &aspeed_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] = hw;
> +
> +       hw = clk_hw_register_divider_table(dev, "eclk", "eclk-mux", 0,
> +                                          scu_base + ASPEED_CLK_SELECTION, 28,
> +                                          3, 0, soc_data->eclk_div_table,
> +                                          &aspeed_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
> +
>         /*
>          * TODO: There are a number of clocks that not included in this driver
>          * as more information is required:
> @@ -531,7 +569,6 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>          *   RGMII
>          *   RMII
>          *   UART[1..5] clock source mux
> -        *   Video Engine (ECLK) mux and clock divider
>          */
>
>         for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
> --
> 1.8.3.1
>
