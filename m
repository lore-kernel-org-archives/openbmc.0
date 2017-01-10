Return-Path: <clg@kaod.org>
X-Greylist: delayed 1176 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Jan 2017 19:14:24 AEDT
Received: from 7.mo179.mail-out.ovh.net (7.mo179.mail-out.ovh.net
 [46.105.61.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyPv438q3zDqMF
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 19:14:24 +1100 (AEDT)
Received: from player698.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 57304127EA
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 08:54:50 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 2B3C152007A;
 Tue, 10 Jan 2017 08:54:48 +0100 (CET)
Subject: Re: [PATCH linux 3/3] mtd: spi-nor: aspeed: fix DMA access on AST2500
To: Robert Lippert <roblip@gmail.com>, openbmc@lists.ozlabs.org
References: <20170110010524.116687-1-rlippert@google.com>
 <20170110010524.116687-4-rlippert@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <503dc33b-63e7-3281-b261-0619a36d084b@kaod.org>
Date: Tue, 10 Jan 2017 08:54:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170110010524.116687-4-rlippert@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10613295473044523868
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrvdehgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 10 Jan 2017 08:14:24 -0000

On 01/10/2017 02:05 AM, Robert Lippert wrote:
> AST2500 has additional bits in the dma_addr field.  Its easier
> to just write the full address into the register as the hardware
> will handle the masking properly.

Yes definitely, 

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Not for mainline yet though.

C.

> Signed-off-by: Robert Lippert <rlippert@google.com>
> ---
> 
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index a8ca2ab308d7..6cf159741acd 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -349,7 +349,7 @@ static int aspeed_smc_dma_wait(struct aspeed_smc_chip *chip)
>  }
>  
>  #define DMA_LENGTH(x) (((x) - 4) & ~0xFE000003)
> -#define DMA_ADDR(x) ((x) & ~0xE0000003)
> +#define DMA_ADDR(x) ((x) & ~0x00000003)
>  
>  static inline void aspeed_smc_chip_configure(struct aspeed_smc_chip *chip,
>  					     u32 ctl)
> 
