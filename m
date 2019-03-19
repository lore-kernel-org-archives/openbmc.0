Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XDC1cyAz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="m/iGzFni"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NYrV2JPPzDqDG
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 11:31:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 705E13729;
 Mon, 18 Mar 2019 20:31:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 18 Mar 2019 20:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=dCA6DCfIVUEZqYEUV2BVgOhBZtsxZsi
 erL4lkWnB9h4=; b=XDC1cyAzgQsZkTGBBgNYmjwrxIVwlOi7d2DfFPAmSClzeiX
 /mRo+OiSzQRxqh1k6K0RuHvgEEDaMLuiv7lv38mKFTHWEyA0kkds8r+9NWy181ul
 6YeBeU84SZ3+hUk+gm51MBC1/2EtpqrHKp3D2psxIZRQ2win4rLO3Z/p2s+4D1Yh
 dySlxJU17Dv93N7hT59G5GnGg0ntb5w6y/fcEca/0mC9AJ+4XZCOUqDGPk3x8HLE
 1iaVCrtxs1CAhnqfWh3kRTUb1NqjNb2cyTt3V0m37071gY/4Il20yjqxgIKs/qoR
 ExEjqDRRkwkwCrqv+UXyBcTTUpHJjUSMiNg7XWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dCA6DC
 fIVUEZqYEUV2BVgOhBZtsxZsierL4lkWnB9h4=; b=m/iGzFniizCFA4497CmHQv
 jBDE12oaT2+Tl65O50T4OdzBnN16t3WRNd5fQ92RxGzL04oFtAy0JFQHTGvsAGxs
 6h4TLGeHGVfU61mLo3d1yLGvV/77YnF/xUFDI7AvqwvGIObYIappBpWl4ivhq89n
 wAugntH0RHeXnXyxD/16Puaxv4sNp/oz35yceW7zVq2I9Q2RZDFrY8cUH+KN4cfM
 EkPxjs/YaCTfeBL9ciNAV81500CspIk2GK275Br9jWTbpfg3YjGUvK6Qx+fPzKgF
 Vao9cf0Mrbf/u5wEsA6kEmCVpEIeZe7E6JgQrFxVs5qNm9gyudMVddLiuzYHLMQw
 ==
X-ME-Sender: <xms:VTiQXDZOlB70L08GJ8iowyfuqO2HaLv9W21k56rU6K8MaTyOYvl5Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrieefgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:VTiQXGrGVtKVH_IfPyVoy5MDbwoQ0fTY65xdgx5cVbITCfuJSPS5-g>
 <xmx:VTiQXA-kmBzIqDt61sbJzY3OsqogvG330VB0S7128IE2fj5_UombXw>
 <xmx:VTiQXN9dNp8oCw0Z2l-ml8aQc6yl5VJuyfvMThRkXuQF2uLdqAFCPw>
 <xmx:VjiQXFeqIf-i250mTBQyO4uAxInbXcJ03tdCp7ZRO264KoFpoR0Jeg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 028027C651; Mon, 18 Mar 2019 20:31:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-976-g376b1f3-fmstable-20190314v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <0160aa1e-f52b-46e8-b71b-086a1dc93f0c@www.fastmail.com>
In-Reply-To: <b0566f5d7195c4f2dba0343e02ca96635c36a7c2.1550259966.git.dthompson@mellanox.com>
References: <b0566f5d7195c4f2dba0343e02ca96635c36a7c2.1550259966.git.dthompson@mellanox.com>
Date: Mon, 18 Mar 2019 20:31:16 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "David Thompson" <dthompson@mellanox.com>, "Joel Stanley" <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_U-Boot_v1]_aspeed/ast-scu.c:_add_ast=5Fget=5Fm=5Fpl?=
 =?UTF-8?Q?l=5Fclk()_support?=
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
X-List-Received-Date: Tue, 19 Mar 2019 00:31:23 -0000

Hi David,

Apologies for the long turn-around time.

On Sat, 16 Feb 2019, at 06:56, David Thompson wrote:
> The source code for ast_get_m_pll_clk() is adapted from
> the file "arch/arm/mach-aspeed/ast-bmc-scu.c" contained
> in the bootloader portion of the ASPEED AST2500 SDK.
> 
> The values for "A2" silicon revision IDs are from the
> document "AST2500/AST2520 Integrated Remote Management
> Processor A2 Datasheet", version 1.6, pages 373-374.

This tells us the what but doesn't tell us the why. A lot of what's
in the commit message would be more useful as comments in the
code in the appropriate places. The only reference I've found in
the source is in arch/arm/mach-aspeed/cpuinfo.c which is only
required if CONFIG_DISPLAY_CPUINFO is enabled.  Is the
motivation for the patch that you want to enable
CONFIG_DISPLAY_CPUINFO, or something else?

> 
> Signed-off-by: David Thompson <dthompson@mellanox.com>
> Reviewed-by: Shravan Ramani <sramani@mellanox.com>
> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
>  arch/arm/mach-aspeed/ast-scu.c             | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
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
> index 0cc0d67..6184ff4 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -100,6 +100,10 @@ static struct soc_id soc_map_table[] = {
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
> @@ -235,6 +239,32 @@ u32 ast_get_h_pll_clk(void)
>  	return clk;
>  }
>  
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

The implementation itself looks correct to me.

Andrew

>  u32 ast_get_ahbclk(void)
>  {
>  	unsigned int axi_div, ahb_div, hpll;
> -- 
> 2.1.2
> 
>
