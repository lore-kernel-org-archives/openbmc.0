Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y4FJ6RRYzDqHj
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 07:48:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Apr 2019 13:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,297,1549958400"; d="scan'208";a="147135124"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga002.jf.intel.com with ESMTP; 01 Apr 2019 13:48:47 -0700
Subject: Re: [PATCH dev-5.0 v3 4/7] clk: Aspeed: Setup video engine clocking
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1554150230-24335-1-git-send-email-eajames@linux.ibm.com>
 <1554150230-24335-5-git-send-email-eajames@linux.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8d21b65e-f70d-c44e-6153-fb966137cff1@linux.intel.com>
Date: Mon, 1 Apr 2019 13:48:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1554150230-24335-5-git-send-email-eajames@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 01 Apr 2019 20:48:54 -0000

On 4/1/2019 1:23 PM, Eddie James wrote:
> Add eclk mux and clock divider table.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>   drivers/clk/clk-aspeed.c | 40 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 5961367..133e80c 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -87,7 +87,7 @@ struct aspeed_clk_gate {
>   /* TODO: ask Aspeed about the actual parent data */
>   static const struct aspeed_gate_data aspeed_gates[] = {
>   	/*				 clk rst   name			parent	flags */
> -	[ASPEED_CLK_GATE_ECLK] =	{  0, -1, "eclk-gate",		"eclk",	0 }, /* Video Engine */
> +	[ASPEED_CLK_GATE_ECLK] =	{  0,  6, "eclk-gate",		"eclk",	0 }, /* Video Engine */
>   	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
>   	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	CLK_IS_CRITICAL }, /* SDRAM */
>   	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video Capture */

Hi Eddie,

I already left a comment on it but you probably didn't see that.
With this change, both eclk and vclk will be coupled with reset bit '6'.
Actually, the reset bit 6 is for video engine so this change seems
correct, but you should replace reset bit of vclk with -1 instead
otherwise the video engine reset will be triggered twice and it will
take at least total 20ms of delay time which is a bad idea in case if
aspeed_clk_enable is called from interrupt context.

Test it again after changing the vclk rst setting to '-1' on top of this
patch series. It worked well in my H/W.

Cheers,
Jae

> @@ -113,6 +113,24 @@ struct aspeed_clk_gate {
>   	[ASPEED_CLK_GATE_LHCCLK] =	{ 28, -1, "lhclk-gate",		"lhclk", 0 }, /* LPC master/LPC+ */
>   };
>   
> +static const char * const eclk_parent_names[] = {
> +	"mpll",
> +	"hpll",
> +	"dpll",
> +};
> +
> +static const struct clk_div_table ast2500_eclk_div_table[] = {
> +	{ 0x0, 2 },
> +	{ 0x1, 2 },
> +	{ 0x2, 3 },
> +	{ 0x3, 4 },
> +	{ 0x4, 5 },
> +	{ 0x5, 6 },
> +	{ 0x6, 7 },
> +	{ 0x7, 8 },
> +	{ 0 }
> +};
> +
>   static const struct clk_div_table ast2500_mac_div_table[] = {
>   	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
>   	{ 0x1, 4 },
> @@ -192,18 +210,21 @@ static struct clk_hw *aspeed_ast2500_calc_pll(const char *name, u32 val)
>   
>   struct aspeed_clk_soc_data {
>   	const struct clk_div_table *div_table;
> +	const struct clk_div_table *eclk_div_table;
>   	const struct clk_div_table *mac_div_table;
>   	struct clk_hw *(*calc_pll)(const char *name, u32 val);
>   };
>   
>   static const struct aspeed_clk_soc_data ast2500_data = {
>   	.div_table = ast2500_div_table,
> +	.eclk_div_table = ast2500_eclk_div_table,
>   	.mac_div_table = ast2500_mac_div_table,
>   	.calc_pll = aspeed_ast2500_calc_pll,
>   };
>   
>   static const struct aspeed_clk_soc_data ast2400_data = {
>   	.div_table = ast2400_div_table,
> +	.eclk_div_table = ast2400_div_table,
>   	.mac_div_table = ast2400_div_table,
>   	.calc_pll = aspeed_ast2400_calc_pll,
>   };
> @@ -522,6 +543,22 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>   		return PTR_ERR(hw);
>   	aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
>   
> +	hw = clk_hw_register_mux(dev, "eclk-mux", eclk_parent_names,
> +				 ARRAY_SIZE(eclk_parent_names), 0,
> +				 scu_base + ASPEED_CLK_SELECTION, 2, 0x3, 0,
> +				 &aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] = hw;
> +
> +	hw = clk_hw_register_divider_table(dev, "eclk", "eclk-mux", 0,
> +					   scu_base + ASPEED_CLK_SELECTION, 28,
> +					   3, 0, soc_data->eclk_div_table,
> +					   &aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
> +
>   	/*
>   	 * TODO: There are a number of clocks that not included in this driver
>   	 * as more information is required:
> @@ -531,7 +568,6 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>   	 *   RGMII
>   	 *   RMII
>   	 *   UART[1..5] clock source mux
> -	 *   Video Engine (ECLK) mux and clock divider
>   	 */
>   
>   	for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
> 
