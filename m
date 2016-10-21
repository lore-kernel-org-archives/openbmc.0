Return-Path: <clg@kaod.org>
Received: from 5.mo69.mail-out.ovh.net (5.mo69.mail-out.ovh.net
 [46.105.43.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0gwJ56SJzDvHG
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 20:53:04 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id B031D80D9
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 11:53:01 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id BF38154008E;
 Fri, 21 Oct 2016 11:52:57 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7] mtd: spi-nor: add SECT_4K to mx25l25635e
To: openbmc@lists.ozlabs.org
References: <1477039467-25076-1-git-send-email-clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyril.bur@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d2ad5ccb-90b0-b5fa-1d70-f0bd6757ee1e@kaod.org>
Date: Fri, 21 Oct 2016 11:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477039467-25076-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16536091932587821972
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddriedtgddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 21 Oct 2016 09:53:05 -0000

On 10/21/2016 10:44 AM, Cédric Le Goater wrote:
> The current setting is to erase blocks (64KB) but the chip supports
> sector (4KB) erase and it is currently a problem to erase "partitions"
> which are smaller than the block size (64KB), the GUARD partition for
> instance.

There are few other macronixs that would need a similar change but 
this has an impact on existing jffs2 filesystems on the flash. I am 
not sure we will be able to merge this change in mainline.

C.


> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-openbmc-4.7.git/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux-openbmc-4.7.git.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux-openbmc-4.7.git/drivers/mtd/spi-nor/spi-nor.c
> @@ -855,7 +855,7 @@ static const struct flash_info spi_nor_i
>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> -	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> +	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SECT_4K) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_QUAD_READ) },
> 
