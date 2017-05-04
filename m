Return-Path: <clg@kaod.org>
X-Greylist: delayed 2270 seconds by postgrey-1.36 at bilbo;
 Thu, 04 May 2017 16:39:29 AEST
Received: from 8.mo173.mail-out.ovh.net (8.mo173.mail-out.ovh.net
 [46.105.46.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJQNx0WtszDqBJ
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 16:39:28 +1000 (AEST)
Received: from player791.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 8F26C3C9CF
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 08:01:35 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id 8AB24420080;
 Thu,  4 May 2017 08:01:26 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10] spi-nor: aspeed-smc: Fix flash window size
 message
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170504023416.25653-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <56159d3c-d2c2-848e-2a48-ed8b437d19b3@kaod.org>
Date: Thu, 4 May 2017 08:01:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170504023416.25653-1-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14104148134024481538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedriedtgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 04 May 2017 06:39:29 -0000

On 05/04/2017 04:34 AM, Joel Stanley wrote:
> When booting we see something like this:
> 
>  aspeed-smc 1e620000.flash-controller: Using IRQ 17
>  aspeed-smc 1e620000.flash-controller: DMA support disabled.
>  aspeed-smc 1e620000.flash-controller: mx25l25635e (32768 Kbytes)
>  aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000- 0x22000000 ] 32MB
>  aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000- 0x2a000000 ] 128MB
> 
> The lack of space after the first hex number haunts me every time I
> boot a BMC.
> 
> With this fix we see the pleasingly symmetrical:
> 
>  aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000 - 0x22000000 ] 32MB
>  aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000 - 0x2a000000 ] 128MB
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Cédric Le Goater <clg@kaod.org>

yes. I have changed that also in the patches sent to mainline, 
plus a couple of other things. I will send a refreshing patch
when they are merged.

Cheers,

C.  

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 875b029198fc..23622bf62b6b 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -709,7 +709,7 @@ static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
>  		size = end - start;
>  	}
>  
> -	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
> +	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
>  		 cs, start, end, size >> 20);
>  
>  	return size;
> 
