Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.175; helo=3.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 3.mo179.mail-out.ovh.net (3.mo179.mail-out.ovh.net
 [178.33.251.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BGTb1tnwzF0wq
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 19:23:30 +1000 (AEST)
Received: from player688.ha.ovh.net (unknown [10.109.120.26])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3C1A3D3D17
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 11:23:26 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id A2A39200BF;
 Thu, 21 Jun 2018 11:23:21 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.17 v3] clk: aspeed: Support HPLL strapping on
 ast2400
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>
References: <20180621084310.13688-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9a630af7-d2e9-7166-1d40-66e4764f1fed@kaod.org>
Date: Thu, 21 Jun 2018 11:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180621084310.13688-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7966304791529229227
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdeggdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 21 Jun 2018 09:23:31 -0000

On 06/21/2018 10:43 AM, Joel Stanley wrote:
> The HPLL can be configured through a register (SCU24), however some
> platforms chose to configure it through the strapping settings and do
> not use the register. This was not noticed as the logic for bit 18 in
> SCU24 was confused: set means programmed, but the driver read it as set
> means strapped.
> 
> This gives us the correct HPLL value on Palmetto systems, from which
> most of the peripheral clocks are generated.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> v2: Fix comment and commit message
> v3: Support 25MHz clkin by changing the way the calculations
> ---
>  drivers/clk/clk-aspeed.c | 45 +++++++++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index c17032bc853a..5deb246c0184 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -24,7 +24,7 @@
>  #define ASPEED_MPLL_PARAM	0x20
>  #define ASPEED_HPLL_PARAM	0x24
>  #define  AST2500_HPLL_BYPASS_EN	BIT(20)
> -#define  AST2400_HPLL_STRAPPED	BIT(18)
> +#define  AST2400_HPLL_PROGRAMMED BIT(18)
>  #define  AST2400_HPLL_BYPASS_EN	BIT(17)
>  #define ASPEED_MISC_CTRL	0x2c
>  #define  UART_DIV13_EN		BIT(12)
> @@ -565,29 +565,40 @@ builtin_platform_driver(aspeed_clk_driver);
>  static void __init aspeed_ast2400_cc(struct regmap *map)
>  {
>  	struct clk_hw *hw;
> -	u32 val, freq, div;
> +	u32 val, reg, div, clkin, hpll;
> +	const u16 hpll_rates[][4] = {
> +		{384, 360, 336, 408},
> +		{400, 375, 350, 425},
> +	};
> +	int rate;
>  
>  	/*
>  	 * CLKIN is the crystal oscillator, 24, 48 or 25MHz selected by
>  	 * strapping
>  	 */
> -	regmap_read(map, ASPEED_STRAP, &val);
> -	if (val & CLKIN_25MHZ_EN)
> -		freq = 25000000;
> -	else if (val & AST2400_CLK_SOURCE_SEL)
> -		freq = 48000000;
> +	regmap_read(map, ASPEED_STRAP, &reg);
> +	rate = (reg >> 8) & 3;
> +	if (reg & CLKIN_25MHZ_EN) {
> +		clkin = 25000000;
> +		hpll = hpll_rates[1][rate];
> +	} else if (reg & AST2400_CLK_SOURCE_SEL) {
> +		clkin = 48000000;
> +		hpll = hpll_rates[0][rate];
> +	} else {
> +		clkin = 24000000;
> +		hpll = hpll_rates[0][rate];
> +	}
> +	hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, clkin);
> +	pr_debug("clkin @%u MHz\n", clkin / 1000000);
> +
> +	regmap_read(map, ASPEED_HPLL_PARAM, &reg);
> +	if (reg & AST2400_HPLL_PROGRAMMED)
> +		hw = aspeed_ast2400_calc_pll("hpll", val);
>  	else
> -		freq = 24000000;
> -	hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
> -	pr_debug("clkin @%u MHz\n", freq / 1000000);
> +		hw = clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0,
> +				hpll * 1000000);
>  
> -	/*
> -	 * High-speed PLL clock derived from the crystal. This the CPU clock,
> -	 * and we assume that it is enabled
> -	 */
> -	regmap_read(map, ASPEED_HPLL_PARAM, &val);
> -	WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not configured");
> -	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
> +	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = hw;
>  
>  	/*
>  	 * Strap bits 11:10 define the CPU/AHB clock frequency ratio (aka HCLK)
> 
