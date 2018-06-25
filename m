Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="e2m5WaOt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RiHRcJS8"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DWMt0grQzF16W
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 11:11:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D0B921BBC;
 Sun, 24 Jun 2018 21:11:19 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 24 Jun 2018 21:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=8PIE5r2qg78if4CZmmcP7HtwDAIyY
 V3mtJl+nyJ6FwM=; b=e2m5WaOtQJFCWFk5YzuDNutjsJzqGVmEHTt0WkL0acWGP
 nFuhRGj0UtqwN1biubaLT7lDNydwtHpIa6SgXOAUAwzDEO23YFC23+Eo+uIPamBh
 gPT1qMfIZIgdCnekbepS/2iHXeeCb/BdFPhJxWr3p3YTJDMZqS3MFkdg19YV8yEk
 XkvhS3fCu3f+cv7eRSOogZyHEzIWPalukUtzg53YHR3+ldBgGL0PtC0fBDwemTl5
 r85/kqSgiKw9FDC49LbeafTjyDVjuTghwTj9DBJz5O7+g00NqTSU5ZQ2d1HNMOdQ
 VjG/Fjw2/DN5Cm5+YVkAMIr7TNSgAJ1TJHTN+Me4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8PIE5r
 2qg78if4CZmmcP7HtwDAIyYV3mtJl+nyJ6FwM=; b=RiHRcJS8I8qc6IfQuwzbem
 48TrJPju2drjdgzbOD3LKuUq92gNyISLpaq4tPCgOFktUlgEjFam1LtyqYwGTHMm
 fcco6ckIROQaLoQrUMMW90WoG+436CdKHOHlHD3sTpl06gkirc6PT/e8+HHfYAk1
 St7mZuue8RTevJTvq7Lraf4WDLjJKVjH0VJuryueLvU73Rw033HiCblOmkoeMMci
 HFjWKxXyFSq9q7E/Ipt1ZrbqhMHYKJqe1Fv45n/FTO7KdLLg6bfCB6Su/IUYjcD7
 oWuMIqnuA7Z+0FSyKva8hhZb9zqZULq2djhZWN5YfV/bdAebB1aCN3ZFsss75QeQ
 ==
X-ME-Proxy: <xmx:N0EwW3iK7vD5BYUZ88Ox5xf3kZi4spAQNrSbvC7wO1onKaqSzF2Utw>
 <xmx:N0EwWxF76KAe5sXaRULs6vSgs7POM7kHz7q34uU9iOuIqI3gsgp3rw>
 <xmx:N0EwW-2FhNxVUxORFR9iLY0r-kvRi32v2L5HIJQYs6WjERRQSD_OGA>
 <xmx:N0EwWw7vLiYv-TArrRYzziZ6PeUcWOB_BgdF5Oe9R4ZFwM_x47_l5Q>
 <xmx:N0EwW1Ky_asNNQF2m5paiwI1sdIfwlEvNWkEDcSMijsYjCBx7g1GSw>
 <xmx:N0EwW01QEFvG53MbcNrHQCLAFYlelAGzP5jg-yocEJDEIQ67Ck4HXg>
X-ME-Sender: <xms:N0EwW2efbtHGlx3QRzPnmWV_EyORsQFJQvdG-3lhPC-SQdSw4K77Tw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 649D4BA43D; Sun, 24 Jun 2018 21:11:19 -0400 (EDT)
Message-Id: <1529889079.2198985.1418947520.361B7CD6@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
Date: Mon, 25 Jun 2018 10:41:19 +0930
In-Reply-To: <20180621072525.23832-1-joel@jms.id.au>
Subject: Re: [PATCH linux dev-4.17 v2] clk: aspeed: Support HPLL strapping on
 ast2400
References: <20180621072525.23832-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 25 Jun 2018 01:11:24 -0000

On Thu, 21 Jun 2018, at 16:55, Joel Stanley wrote:
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
> ---
> v2: Fix comment and commit message
> ---
>  drivers/clk/clk-aspeed.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index c17032bc853a..7d8cc412959d 100644
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
> @@ -586,8 +586,24 @@ static void __init aspeed_ast2400_cc(struct regmap *map)
>  	 * and we assume that it is enabled
>  	 */
>  	regmap_read(map, ASPEED_HPLL_PARAM, &val);
> -	WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not configured");
> -	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
> +	if (val & AST2400_HPLL_PROGRAMMED) {
> +		aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
> +			aspeed_ast2400_calc_pll("hpll", val);
> +	} else {
> +		/* hpll is configured by the strap register */
> +		regmap_read(map, ASPEED_STRAP, &val);
> +		val = (val >> 8) & 0x3;
> +		if (val == 0x00)
> +			freq = 384000000;
> +		else if (val == 0x01)
> +			freq = 360000000;
> +		else if (val == 0x02)
> +			freq = 336000000;
> +		else if (val == 0x03)
> +			freq = 408000000;
> +		aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
> +			clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0, freq);
> +	}

Logic looks fine, but I feel this might be better as a lookup table. Bikeshed will be hot pink.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>  
>  	/*
>  	 * Strap bits 11:10 define the CPU/AHB clock frequency ratio (aka HCLK)
> -- 
> 2.17.1
> 
