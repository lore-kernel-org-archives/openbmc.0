Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.179.142; helo=17.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 150958 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Jun 2018 17:23:52 AEST
Received: from 17.mo1.mail-out.ovh.net (17.mo1.mail-out.ovh.net
 [87.98.179.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BCqX1L9gzDrcd
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 17:23:51 +1000 (AEST)
Received: from player798.ha.ovh.net (unknown [10.109.122.113])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 71718109CF9
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 09:23:47 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 977FE5400B8;
 Thu, 21 Jun 2018 09:23:40 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.17] clk: aspeed: Support HPLL strapping on
 ast2400
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>
References: <20180621065759.21109-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ab47b73e-4b07-049f-a64c-886cb0053cbd@kaod.org>
Date: Thu, 21 Jun 2018 09:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180621065759.21109-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5945032986369887147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdefgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 21 Jun 2018 07:23:52 -0000

On 06/21/2018 08:57 AM, Joel Stanley wrote:
> The HPLL can be configured through a register (SCU24), however most
> some platforms chose to configure it through the strapping settings and
> do not use the register. This was not noticed as the logic for bit 18 in
> SCU24 was confused: set means programmed, but the driver read it as set
> means strapped.
> 
> This gives us the correct HPLL value on Palmetto systems, from which
> most of the peripheral clocks are generated.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/clk/clk-aspeed.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index c17032bc853a..c4770cbb6f32 100644
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
> +		/* hpll is configured by the strap register */
> +		aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
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

we should try to cover the clkin 25MHz case also. The frequencies are : 

	400Mhz 375Mhz 350Mhz 425Mhz

> +			clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0, freq);
> +	}
>  
>  	/*
>  	 * Strap bits 11:10 define the CPU/AHB clock frequency ratio (aka HCLK)
> 

On a palmetto system :

	SCU[70] 0x120CE416 /* 408 MHz */
	SCU[24] 0x00000291 /* Freqs are strapped */


but these freqs are set, which is much better, but not correct compared 
to the SCU value. 

root@palmetto:~# cat /sys/kernel/debug/clk/clk_summary 
                                 enable  prepare  protect                               
   clock                          count    count    count        rate   accuracy   phase
----------------------------------------------------------------------------------------
 sdclk-gate                           0        0        0           0          0 0  
 rsaclk-gate                          0        0        0           0          0 0  
 espiclk-gate                         0        0        0           0          0 0  
 usb-port1-gate                       0        0        0           0          0 0  
 yclk-gate                            0        0        0           0          0 0  
 d1clk-gate                           0        0        0           0          0 0  
 usb-uhci-gate                        0        0        0           0          0 0  
 lclk-gate                            1        1        0           0          0 0  
 usb-port2-gate                       0        0        0           0          0 0  
 dclk-gate                            1        1        0           0          0 0  
 vclk-gate                            0        0        0           0          0 0  
 gclk-gate                            0        0        0           0          0 0  
 uart                                 2        2        0    24000000          0 0  
    uart4clk-gate                     0        0        0    24000000          0 0  
    uart3clk-gate                     0        0        0    24000000          0 0  
    uart5clk-gate                     1        1        0    24000000          0 0  
    uart2clk-gate                     0        0        0    24000000          0 0  
    uart1clk-gate                     1        1        0    24000000          0 0  
 clkin                                3        3        0    48000000          0 0  
    refclk-gate                       1        1        0    48000000          0 0  
    fixed-24m                         0        0        0    24000000          0 0  
    mpll                              1        1        0   792000000          0 0  
       mclk-gate                      1        1        0   792000000          0 0  
    hpll                              3        3        0   384000000          0 0  
       bclk                           1        1        0   192000000          0 0  
          bclk-gate                   1        1        0   192000000          0 0  
       lhclk                          0        0        0   192000000          0 0  
          lhclk-gate                  0        0        0   192000000          0 0  
       mac                            1        1        0    38400000          0 0  
          mac2clk-gate                0        0        0    38400000          0 0  
          mac1clk-gate                1        1        0    38400000          0 0  
       sdio                           0        0        0   192000000          0 0  
       apb                            2        2        0    48000000          0 0  
       ahb                            0        0        0   192000000          0 0  
 eclk-gate                            0        0        0           0          0 0  


Thanks,

C.
