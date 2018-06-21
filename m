Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.76.150; helo=10.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 10.mo178.mail-out.ovh.net (10.mo178.mail-out.ovh.net
 [46.105.76.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BFbt2sdYzF0tr
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 18:43:53 +1000 (AEST)
Received: from player729.ha.ovh.net (unknown [10.109.122.117])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 2EBA81BDC2
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 10:07:24 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 246AF5E00B7;
 Thu, 21 Jun 2018 10:07:19 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.17] clk: aspeed: Support HPLL strapping on
 ast2400
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>
References: <20180621065759.21109-1-joel@jms.id.au>
 <ab47b73e-4b07-049f-a64c-886cb0053cbd@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8afd24be-33f4-7916-d129-4b33458291b5@kaod.org>
Date: Thu, 21 Jun 2018 10:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <ab47b73e-4b07-049f-a64c-886cb0053cbd@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6682215948533337003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 21 Jun 2018 08:43:55 -0000

On 06/21/2018 09:23 AM, Cédric Le Goater wrote:
> On 06/21/2018 08:57 AM, Joel Stanley wrote:
>> The HPLL can be configured through a register (SCU24), however most
>> some platforms chose to configure it through the strapping settings and
>> do not use the register. This was not noticed as the logic for bit 18 in
>> SCU24 was confused: set means programmed, but the driver read it as set
>> means strapped.
>>
>> This gives us the correct HPLL value on Palmetto systems, from which
>> most of the peripheral clocks are generated.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  drivers/clk/clk-aspeed.c | 22 +++++++++++++++++++---
>>  1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index c17032bc853a..c4770cbb6f32 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -24,7 +24,7 @@
>>  #define ASPEED_MPLL_PARAM	0x20
>>  #define ASPEED_HPLL_PARAM	0x24
>>  #define  AST2500_HPLL_BYPASS_EN	BIT(20)
>> -#define  AST2400_HPLL_STRAPPED	BIT(18)
>> +#define  AST2400_HPLL_PROGRAMMED BIT(18)
>>  #define  AST2400_HPLL_BYPASS_EN	BIT(17)
>>  #define ASPEED_MISC_CTRL	0x2c
>>  #define  UART_DIV13_EN		BIT(12)
>> @@ -586,8 +586,24 @@ static void __init aspeed_ast2400_cc(struct regmap *map)
>>  	 * and we assume that it is enabled
>>  	 */
>>  	regmap_read(map, ASPEED_HPLL_PARAM, &val);
>> -	WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not configured");
>> -	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
>> +	if (val & AST2400_HPLL_PROGRAMMED) {
>> +		/* hpll is configured by the strap register */
>> +		aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
>> +	} else {
>> +		/* hpll is configured by the strap register */
>> +		regmap_read(map, ASPEED_STRAP, &val);
>> +		val = (val >> 8) & 0x3;
>> +		if (val == 0x00)
>> +			freq = 384000000;
>> +		else if (val == 0x01)
>> +			freq = 360000000;
>> +		else if (val == 0x02)
>> +			freq = 336000000;
>> +		else if (val == 0x03)
>> +			freq = 408000000;
>> +		aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
> 
> we should try to cover the clkin 25MHz case also. The frequencies are : 
> 
> 	400Mhz 375Mhz 350Mhz 425Mhz
> 
>> +			clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0, freq);
>> +	}
>>  
>>  	/*
>>  	 * Strap bits 11:10 define the CPU/AHB clock frequency ratio (aka HCLK)
>>
> 
> On a palmetto system :
> 
> 	SCU[70] 0x120CE416 /* 408 MHz */

oups. bit 9:8 are set to 0x0 so that's 384Mhz. All is fine.

Thanks,

C.
