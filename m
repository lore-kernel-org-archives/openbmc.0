Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.250.45; helo=2.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 601 seconds by postgrey-1.36 at bilbo;
 Fri, 17 Aug 2018 06:50:39 AEST
Received: from 2.mo179.mail-out.ovh.net (2.mo179.mail-out.ovh.net
 [178.33.250.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rz4b1HqLzDqnw
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 06:50:37 +1000 (AEST)
Received: from player695.ha.ovh.net (unknown [10.109.146.53])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 56D00E31E1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 22:33:13 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-62-88.w90-32.abo.wanadoo.fr
 [90.32.249.88]) (Authenticated sender: postmaster@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 8A5F9460087;
 Thu, 16 Aug 2018 22:33:07 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.17 2/2] mtd: spi-nor: fix spi register address
 for AST2400
To: Alexander Soldatov <a.soldatov@yadro.com>, linux-mtd@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: stable@vger.kernel.org
References: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
 <1534416055-23939-2-git-send-email-a.soldatov@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d9dc3b66-d965-42bf-2ebe-8689d615ef41@kaod.org>
Date: Thu, 16 Aug 2018 22:33:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1534416055-23939-2-git-send-email-a.soldatov@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16107124071493569396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrudelgdduheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 16 Aug 2018 20:50:39 -0000

On 08/16/2018 12:40 PM, Alexander Soldatov wrote:
> According to AST2400 datasheet v1.4 the SPI Flash Read Timing
> Setting register is at offset 0x14. There is no register at
> offset 0x94 (unlike FMC controller and AST2500).

The setting of the read timing register is not in mainline yet, 
so the patch won't apply. I will merge the fix in my patchset.



Thanks,

C. 


> 
> Cc: stable@vger.kernel.org
> Fixes: aad58eba7209 ("mtd: spi-nor: aspeed: optimize read mode")
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index c9cd20f199d9..9ddf24b042f1 100644
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
