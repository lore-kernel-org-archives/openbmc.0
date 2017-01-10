Return-Path: <clg@kaod.org>
X-Greylist: delayed 2367 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Jan 2017 19:34:22 AEDT
Received: from 2.mo179.mail-out.ovh.net (2.mo179.mail-out.ovh.net
 [178.33.250.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyQL6323kzDq7s
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 19:34:22 +1100 (AEDT)
Received: from player698.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 0BA9811EF8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 08:54:42 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 361A552006B;
 Tue, 10 Jan 2017 08:54:39 +0100 (CET)
Subject: Re: [PATCH linux 1/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to
 mx66l51235l
To: Robert Lippert <roblip@gmail.com>, openbmc@lists.ozlabs.org
References: <20170110010524.116687-1-rlippert@google.com>
 <20170110010524.116687-2-rlippert@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1d9b5e4a-9415-117c-06e4-060d1ca661d3@kaod.org>
Date: Tue, 10 Jan 2017 08:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170110010524.116687-2-rlippert@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10610762199338290012
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
X-List-Received-Date: Tue, 10 Jan 2017 08:34:22 -0000

On 01/10/2017 02:05 AM, Robert Lippert wrote:
> Signed-off-by: Robert Lippert <rlippert@google.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

This would be good to upstream I think. As I need to send
a little patchset for the label support in mainline Linux,
I can include it if you want. 

C.

> ---
> 
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index a68073afe8a8..e508c25a47f7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -857,7 +857,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
> +	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>  
> 
