Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LLQ20g0V"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MyfN1Ts7"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41pcTY1Ss4zF0Qs
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 10:45:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C5E1E20F50;
 Sun, 12 Aug 2018 20:45:34 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 12 Aug 2018 20:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=magEwFoLDV4pVaqYnzIVYhXgTcfbZ
 /vbhRUnQmQua84=; b=LLQ20g0VCbyctpSwE+jDgg1lA/oqjtPIP9OccgZgVHn+2
 fZysOHFBWOTHhDZn+EznKRHl5EJaHjDi4BEkNyTTs0OMQ/jnfs504qyauwT3a2L+
 xgWJ64ZG6/AMqQb2tvAtGPclFpqxy8SLwBevKuFCObQCh8l4x/H77l8x0AwDJcSP
 EGberddnq1gfJT5F8+nCIT7mhs0aXms3nkaz0U3cayyexURjrdaenN67gK9A3fgx
 zARdneB5+jhRpM8icZxfwFChLmsw9iMaDE10wMg1lM7/geHa25+IBEpAOnjmhX7y
 S9dT7hOP8saHrDCS5CIdqXoy6wLhNY5/7dlRHe8Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=magEwF
 oLDV4pVaqYnzIVYhXgTcfbZ/vbhRUnQmQua84=; b=MyfN1Ts7SkgH4+7hx24Kun
 kCsOCK/oLd2yZbZ11fW8v/CLEisASv38IO2rXpvN2XS2P0Wlf60IinV1c5m7h2vC
 WOFiJH7W1mvOYM2+CbNhgw6QGD3VV/PuBM06XASFTojZWJem85SvMktmpM0tbxJL
 7fcyb9fgm1VDEBidjshiwyjq7+rk1AM0Eq+7z1ff7haVz1aMgosKwft0eMbgOj5A
 UwHWzZeBuvXVleGzPB9ZFq27xVI7DVeJKdOoKgXQnJBrh48ZWmt0sI7fDHje6wgF
 O990D43TKXGbDAfDHrhkV7vvSKQ/HiwFCds7+7F6khrWqYC2+vmsU4qme/lcYxsQ
 ==
X-ME-Proxy: <xmx:rtRwW15E_XfIq4iRZqfI23TBv_euokdwPOURoZi_mxvz08B_JRPLvw>
 <xmx:rtRwWw_rgdRy7O-cR1HzAK82qZ2JMoZ1ffHtiNNoxiMbJukw5oXeZw>
 <xmx:rtRwWzAg3VbtNQIxoq1HI-MNcd5ZG00CEeeZlEgfYH-ATNwP8pcA6g>
 <xmx:rtRwW0q7aJMnWKF3sUhfvUVtMDG-vii1lFqJKhQyQhlEhDH8YznOVw>
 <xmx:rtRwW1ceivC9L_swjcpB7zkNfRNrmUWcnoI-vvRcWa2QBE7NYGplHQ>
 <xmx:rtRwW2dbErnb3n1kH2Um8qrTFXdz63_jINpR7yItB_8HZ6jflkhnqg>
X-ME-Sender: <xms:rtRwWze0VG6V9API7kq26RML_2bsisGeOMHRN1SD3HQK7ImUbgFiYA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 40E6C9E4EC; Sun, 12 Aug 2018 20:45:34 -0400 (EDT)
Message-Id: <1534121134.259933.1471868896.39D45EC1@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-9a5384d7
Date: Mon, 13 Aug 2018 10:15:34 +0930
Subject: Re: [RFC 1/3] clock: aspeed: Setup video engine clocking
References: <1533676303-305-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1533676303-305-2-git-send-email-eajames@linux.vnet.ibm.com>
In-Reply-To: <1533676303-305-2-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 13 Aug 2018 00:45:37 -0000

On Wed, 8 Aug 2018, at 06:41, Eddie James wrote:
> Add the video engine reset bit and add the eclk clock divider table. The
> eclk can be muxed, but for the sake of simplicity, force the eclk source
> to be the mpll clock.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  drivers/clk/clk-aspeed.c                 | 61 +++++++++++++++++++++++++++++++-
>  include/dt-bindings/clock/aspeed-clock.h |  1 +
>  2 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 8796b8a..c1a64ae 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -20,6 +20,7 @@
>  
>  #define ASPEED_RESET_CTRL	0x04
>  #define ASPEED_CLK_SELECTION	0x08
> +#define  ASPEED_CLK_SEL_VE	GENMASK(3, 2)
>  #define ASPEED_CLK_STOP_CTRL	0x0c
>  #define ASPEED_MPLL_PARAM	0x20
>  #define ASPEED_HPLL_PARAM	0x24
> @@ -87,7 +88,7 @@ struct aspeed_clk_gate {
>  /* TODO: ask Aspeed about the actual parent data */
>  static const struct aspeed_gate_data aspeed_gates[] = {
>  	/*				 clk rst   name			parent	flags */
> -	[ASPEED_CLK_GATE_ECLK] =	{  0, -1, "eclk-gate",		"eclk",	0 }, /* Video 
> Engine */
> +	[ASPEED_CLK_GATE_ECLK] =	{  0,  6, "eclk-gate",		"eclk",	0 }, /* Video 
> Engine */
>  	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
>  	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	
> CLK_IS_CRITICAL }, /* SDRAM */
>  	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video 
> Capture */
> @@ -113,6 +114,18 @@ struct aspeed_clk_gate {
>  	[ASPEED_CLK_GATE_LHCCLK] =	{ 28, -1, "lhclk-gate",		"lhclk", 0 }, /* LPC 
> master/LPC+ */
>  };
>  
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
>  static const struct clk_div_table ast2500_mac_div_table[] = {
>  	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
>  	{ 0x1, 4 },
> @@ -192,18 +205,21 @@ static struct clk_hw 
> *aspeed_ast2500_calc_pll(const char *name, u32 val)
>  
>  struct aspeed_clk_soc_data {
>  	const struct clk_div_table *div_table;
> +	const struct clk_div_table *eclk_div_table;
>  	const struct clk_div_table *mac_div_table;
>  	struct clk_hw *(*calc_pll)(const char *name, u32 val);
>  };
>  
>  static const struct aspeed_clk_soc_data ast2500_data = {
>  	.div_table = ast2500_div_table,
> +	.eclk_div_table = ast2500_eclk_div_table,
>  	.mac_div_table = ast2500_mac_div_table,
>  	.calc_pll = aspeed_ast2500_calc_pll,
>  };
>  
>  static const struct aspeed_clk_soc_data ast2400_data = {
>  	.div_table = ast2400_div_table,
> +	.eclk_div_table = ast2400_div_table,
>  	.mac_div_table = ast2400_div_table,
>  	.calc_pll = aspeed_ast2400_calc_pll,
>  };
> @@ -317,6 +333,7 @@ struct aspeed_reset {
>  	[ASPEED_RESET_PECI]	= 10,
>  	[ASPEED_RESET_I2C]	=  2,
>  	[ASPEED_RESET_AHB]	=  1,
> +	[ASPEED_RESET_VIDEO]	=  6,
>  
>  	/*
>  	 * SCUD4 resets start at an offset to separate them from
> @@ -522,6 +539,48 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>  		return PTR_ERR(hw);
>  	aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
>  
> +	/* Video Engine (ECLK) clock divider (ignore mux; set parent MPLL) */
> +	regmap_read(map, ASPEED_CLK_SELECTION, &val);
> +	if (val & ASPEED_CLK_SEL_VE) {
> +		/* ECLK clock select isn't MPLL; reset to MPLL */
> +		u32 clk = BIT(aspeed_gates[ASPEED_CLK_GATE_ECLK].clock_idx);
> +		u32 rst = BIT(aspeed_gates[ASPEED_CLK_GATE_ECLK].reset_idx);
> +		u32 stop;
> +
> +		dev_info(dev, "setting eclk mux to mpll\n");
> +
> +		/* Put Video Engine in reset */
> +		regmap_update_bits(map, ASPEED_RESET_CTRL, rst, rst);
> +		udelay(100);
> +
> +		/* Stop the clock if it's running */
> +		regmap_read(map, ASPEED_CLK_STOP_CTRL, &stop);
> +		if (!(stop & clk))
> +			regmap_update_bits(map, ASPEED_CLK_STOP_CTRL, clk,
> +					   clk);
> +
> +		/* Set clock select to MPLL */
> +		regmap_update_bits(map, ASPEED_CLK_SELECTION,
> +				   ASPEED_VE_CLK_SEL, 0);
> +
> +		/* Start the clock if it was originally running */
> +		if (!(stop & clk)) {
> +			regmap_update_bits(map, ASPEED_CLK_STOP_CTRL, clk, 0);
> +			mdelay(10);
> +		}
> +
> +		/* Take Video Engine out of reset */
> +		regmap_update_bits(map, ASPEED_RESET_CTRL, rst, 0);
> +	}

This seems like a bit of hack? Shouldn't we describe the clock tree
including the mux and let it sort itself out?

> +
> +	hw = clk_hw_register_divider_table(dev, "eclk", "mpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 28, 3, 0,
> +			soc_data->eclk_div_table,
> +			&aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
> +
>  	/*
>  	 * TODO: There are a number of clocks that not included in this driver
>  	 * as more information is required:
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-
> bindings/clock/aspeed-clock.h
> index 4476184..f1813db 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -50,5 +50,6 @@
>  #define ASPEED_RESET_I2C		7
>  #define ASPEED_RESET_AHB		8
>  #define ASPEED_RESET_CRT1		9
> +#define ASPEED_RESET_VIDEO		10
>  
>  #endif
> -- 
> 1.8.3.1
> 
