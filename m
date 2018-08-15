Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.76.148; helo=9.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Aug 2018 05:00:45 AEST
Received: from 9.mo179.mail-out.ovh.net (9.mo179.mail-out.ovh.net
 [46.105.76.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rJhF56kyzF1Rx
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 05:00:44 +1000 (AEST)
Received: from player694.ha.ovh.net (unknown [10.109.160.226])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id B749AE1AC2
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 20:54:35 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-268-34.w2-14.abo.wanadoo.fr
 [2.14.239.34]) (Authenticated sender: postmaster@kaod.org)
 by player694.ha.ovh.net (Postfix) with ESMTPSA id BABFC2C009C;
 Wed, 15 Aug 2018 20:54:30 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 2/2] mtd: spi-nor: fix spi register address
 for AST2400
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Cc: Alexander Soldatov <a.soldatov@yadro.com>
References: <48463736-e6c5-05e2-8e64-cb11151542f7@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <977b378d-011d-dd08-6e75-6d8da2c1fa95@kaod.org>
Date: Wed, 15 Aug 2018 20:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <48463736-e6c5-05e2-8e64-cb11151542f7@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8568942716660648903
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrudejgddufeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 15 Aug 2018 19:00:46 -0000

On 08/15/2018 05:14 PM, Alexander Amelkin wrote:
> According to AST2400 datasheet v1.4 the SPI Flash Read Timing
> Setting register is at offset 0x14. There is no register at
> offset 0x94 (unlike FMC controller and AST2500).

ouch :/ Typo of mine.  

> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

I will merge this fix in the patchset I have sent to mainline, if you 
don't mine.

Thanks,

C.

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index c9cd20f..9ddf24b 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -71,7 +71,7 @@ static const struct aspeed_smc_info spi_2400_info = {
>  	.hastype = false,
>  	.we0 = 0,
>  	.ctl0 = 0x04,
> -	.timing = 0x94,
> +	.timing = 0x14,
>  	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
>  	.optimize_read = aspeed_smc_optimize_read,
>  };
> 
