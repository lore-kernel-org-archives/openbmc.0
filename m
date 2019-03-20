Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RO9rPHir"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WuSaYWBU"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PBKX1VS3zDqFH
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 11:55:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 49C7421F3A;
 Tue, 19 Mar 2019 20:55:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 19 Mar 2019 20:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=sO7EqI9OibWz1KcaX0+caYtFFo1rKDp
 GI/4jqe/8cwM=; b=RO9rPHirBCbJl1hsuDlHN8H/MYfOtXQj5g5t1EmvR1ypMyQ
 JlfBZiFTIX4DIVg3ucw36hN/TkUIB5v+5tLc3HlbFSNOHLEo8xD6WhziE13TQMOk
 6RI6AqInfjB2qH7j+mnepN+JBvuNRf17JBC80xIHYn+fC6uecbHrc36nRdtE/Yuu
 0Rk03ByW8w6Vt+uoH2HoOn0Zwr2vZdX1IHXVOwDc22RY5tO6bVWAyZ0EmISa1UCt
 54cWFyrIZitYsEETFzOWZK50JTdT6bfTG7FRj34P7PVfW2SfLJhYb2LkHrmmJI1t
 t0ahqXDNMjKX6hNWDXNQscxpi60XB/c03PgfqbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sO7EqI
 9OibWz1KcaX0+caYtFFo1rKDpGI/4jqe/8cwM=; b=WuSaYWBUMzBs19aDiwkf1A
 dg8hwFngc46oskxYOrtTExO+kI/14H8QjCD3RRL7/ZmU/k4KBVQb7OfceQHFYNyu
 rbJl4ELIKxZKdBZrrbYY2eqLOIzJYRLgiOtYN8OyEJVn0hdC1ZSZw1RW94RUW1Ll
 cQzP9HGulvfrEykgSoharxTHuCV2ltYU9Z/S9luV+iXdnKSTyPcDYKkw/qJfhm8J
 kuUxBbwsQ4UPSOncW+E4fQ4VFyTw8VNuHxD98PMrOXvsZBESQQPlwOMaJRfLaD8e
 DiVXkIHHIAnn/SZ7keuOzAGJr7qx3BKV2V1tFc00tT4TBG676Jub9UQLlHUv7jmQ
 ==
X-ME-Sender: <xms:ao-RXD3Gc3-MkS1iwoIwlPE5LZKAllzNadXMaUbAcieEzAQNoxXHlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrieehgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:ao-RXN60xP1XnIV8ov0NbBDA3WXKiDl-jOp7JQ6xPMKaKqLnP2YuXg>
 <xmx:ao-RXLOkxUJwld9bndqd6LH6koTgj6IAuSNp51RddepDcpaYl0MsWw>
 <xmx:ao-RXMHVrgyptKTF-js8dX0ZZXW5higiBullu8Z_durkA3inAC0Bwg>
 <xmx:a4-RXPvd0qUbaZNb2I61TQ_9OsnCWUz5pzMi63y5VmKsS0dcZiceLQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3BBB17C63D; Tue, 19 Mar 2019 20:55:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-976-g376b1f3-fmstable-20190314v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <88b92943-0fe7-467e-ba61-17dff19018d9@www.fastmail.com>
In-Reply-To: <e78f778a53ac5a2bf13d463e12de0d6fd08f4138.1553018953.git.dthompson@mellanox.com>
References: <e78f778a53ac5a2bf13d463e12de0d6fd08f4138.1553018953.git.dthompson@mellanox.com>
Date: Tue, 19 Mar 2019 20:54:51 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "David Thompson" <dthompson@mellanox.com>, andrew@aj.id.au,
 "Joel Stanley" <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[Patch_U-Boot_v2]_aspeed/ast-scu.c:_add_ast=5Fget=5Fm=5Fpl?=
 =?UTF-8?Q?l=5Fclk()_for_AST=5FSOC=5FG5?=
Content-Type: text/plain
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
X-List-Received-Date: Wed, 20 Mar 2019 00:55:17 -0000



On Wed, 20 Mar 2019, at 04:45, David Thompson wrote:
> This code change adds the AST_SOC_G5 version of ast_get_m_pll_clk(),
> which is relevant to AST1520, AST2500, and AST3200 devices.
> 
> This change properly enables the AST_SOC_G5 logic in print_cpuinfo(),
> which can be turned on by defining CONFIG_DISPLAY_CPUINFO.
> 
> Signed-off-by: David Thompson <dthompson@mellanox.com>
> Reviewed-by: Shravan Ramani <sramani@mellanox.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v2: Move info in commit msg to code comments, re-word commit msg
> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
>  arch/arm/mach-aspeed/ast-scu.c             | 42 ++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h 
> b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> index d248416..dcbc673 100644
> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> @@ -37,6 +37,7 @@ extern void ast_scu_get_who_init_dram(void);
>  
>  extern u32 ast_get_clk_source(void);
>  extern u32 ast_get_h_pll_clk(void);
> +extern u32 ast_get_m_pll_clk(void);
>  extern u32 ast_get_ahbclk(void);
>  
>  extern u32 ast_scu_get_vga_memsize(void);
> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
> index 0cc0d67..12de9b8 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -72,6 +72,12 @@ struct soc_id {
>  
>  #define SOC_ID(str, rev) { .name = str, .rev_id = rev, }
>  
> +/*
> + * The values for the silicon revision IDs shown below are from
> + * the ASPEED Technology document "AST2500/AST2520 Integrated
> + * Remote Management Processor A2 Datasheet", v1.6, pp 373-374.
> + */
> +
>  static struct soc_id soc_map_table[] = {
>  	SOC_ID("AST1100/AST2050-A0", 0x00000200),
>  	SOC_ID("AST1100/AST2050-A1", 0x00000201),
> @@ -100,6 +106,10 @@ static struct soc_id soc_map_table[] = {
>  	SOC_ID("AST2510-A1", 0x04010103),
>  	SOC_ID("AST2520-A1", 0x04010203),
>  	SOC_ID("AST2530-A1", 0x04010403),
> +	SOC_ID("AST2500-A2", 0x04030303),
> +	SOC_ID("AST2510-A2", 0x04030103),
> +	SOC_ID("AST2520-A2", 0x04030203),
> +	SOC_ID("AST2530-A2", 0x04030403),
>  };
>  
>  void ast_scu_init_eth(u8 num)
> @@ -235,6 +245,38 @@ u32 ast_get_h_pll_clk(void)
>  	return clk;
>  }
>  
> +/*
> + * The source code for ast_get_m_pll_clk() is adapted from
> + * the file "arch/arm/mach-aspeed/ast-bmc-scu.c" contained
> + * in the bootloader portion of the ASPEED AST2500 SDK, v4.05
> + */
> +
> +u32 ast_get_m_pll_clk(void)
> +{
> +	u32 clk = 0;
> +	u32 m_pll_set = ast_scu_read(AST_SCU_M_PLL);
> +
> +	if (m_pll_set & SCU_M_PLL_OFF)
> +		return 0;
> +
> +	/* Programming */
> +	clk = ast_get_clk_source();
> +	if (m_pll_set & SCU_M_PLL_BYPASS) {
> +		return clk;
> +	} else {
> +		/* P = SCU20[13:18]
> +		 * M = SCU20[5:12]
> +		 * N = SCU20[0:4]
> +		 * mpll = 24MHz * [(M+1) /(N+1)] / (P+1)
> +		 */
> +		clk = ((clk * (SCU_M_PLL_GET_MNUM(m_pll_set) + 1)) /
> +			   (SCU_M_PLL_GET_NNUM(m_pll_set) + 1)) /
> +			(SCU_M_PLL_GET_PDNUM(m_pll_set) + 1);
> +	}
> +	debug("m_pll = %d\n", clk);
> +	return clk;
> +}
> +
>  u32 ast_get_ahbclk(void)
>  {
>  	unsigned int axi_div, ahb_div, hpll;
> -- 
> 2.1.2
> 
>
