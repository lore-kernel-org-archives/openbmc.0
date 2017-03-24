Return-Path: <clg@kaod.org>
X-Greylist: delayed 2332 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Mar 2017 23:56:33 AEDT
Received: from 12.mo7.mail-out.ovh.net (12.mo7.mail-out.ovh.net
 [178.33.107.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqNhx0XdDzDq95
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 23:56:32 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6246148E9B
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:56:29 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 2AAEB18007F;
 Fri, 24 Mar 2017 13:56:27 +0100 (CET)
Subject: Re: [PATCH linux dev-4.10] clk: aspeed: fix APB and AHB clock rates
To: openbmc@lists.ozlabs.org
References: <1490357844-30007-1-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1c07a4ca-a135-862e-fdde-98f72f93e4d6@kaod.org>
Date: Fri, 24 Mar 2017 13:56:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490357844-30007-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1692509035133242323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjeehgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Mar 2017 12:56:33 -0000

I forgot to add a subject prefix : that is for 'linux dev-4.10'

Thanks,

C.  

for On 03/24/2017 01:17 PM, Cédric Le Goater wrote:
> The masking is one bit too generous which generates really low clock
> rates.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/clk/aspeed/clk-g4.c | 2 +-
>  drivers/clk/aspeed/clk-g5.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/aspeed/clk-g4.c b/drivers/clk/aspeed/clk-g4.c
> index bf61919ead52..50117ec16909 100644
> --- a/drivers/clk/aspeed/clk-g4.c
> +++ b/drivers/clk/aspeed/clk-g4.c
> @@ -94,7 +94,7 @@ static unsigned long aspeed_clk_apb_recalc_rate(struct clk_hw *hw,
>  		return ret;
>  	}
>  
> -	reg = (reg >> 23) & GENMASK(2, 0);
> +	reg = (reg >> 23) & 0x3;
>  
>  	return hpll_rate / (2 + 2 * reg);
>  }
> diff --git a/drivers/clk/aspeed/clk-g5.c b/drivers/clk/aspeed/clk-g5.c
> index 6eb0004f894d..8f8f7f796cee 100644
> --- a/drivers/clk/aspeed/clk-g5.c
> +++ b/drivers/clk/aspeed/clk-g5.c
> @@ -84,7 +84,7 @@ static unsigned long aspeed_clk_ahb_recalc_rate(struct clk_hw *hw,
>  	}
>  
>  	/* Bits 11:9 define the AXI/AHB clock frequency ratio */
> -	reg = (reg >> 9) & GENMASK(3, 0);
> +	reg = (reg >> 9) & 0x7;
>  
>  	/* A value of zero is undefined */
>  	WARN_ON(reg == 0);
> @@ -108,7 +108,7 @@ static unsigned long aspeed_clk_apb_recalc_rate(struct clk_hw *hw,
>  		return ret;
>  	}
>  
> -	reg = (reg >> 23) & GENMASK(3, 0);
> +	reg = (reg >> 23) & 0x7;
>  
>  	rate = hpll_rate / (4 * (reg + 1));
>  
> 
