Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.53.149; helo=2.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1203 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Aug 2018 05:36:43 AEST
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rKTl6dFPzF1S4
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 05:36:41 +1000 (AEST)
Received: from player726.ha.ovh.net (unknown [10.109.146.20])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 76C1A148BB3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 20:57:31 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-268-34.w2-14.abo.wanadoo.fr
 [2.14.239.34]) (Authenticated sender: postmaster@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 539392A008E;
 Wed, 15 Aug 2018 20:57:26 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 1/2] mtd: spi-nor: fix options for
 mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Cc: Alexander Soldatov <a.soldatov@yadro.com>
References: <03b3c32f-dcfd-54c1-b959-8067893c0758@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bcb1cf44-798c-11fe-3190-2c62d7002ac0@kaod.org>
Date: Wed, 15 Aug 2018 20:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <03b3c32f-dcfd-54c1-b959-8067893c0758@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8618200840401161159
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrudejgddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 15 Aug 2018 19:36:44 -0000

On 08/15/2018 05:13 PM, Alexander Amelkin wrote:
> Currently in driver spi-nor there is a line for mx66l51235l.
> According to Macronix site there is no such part number.
> The chip detected as such is actually mx66l51235f.
> 
> According to the datasheet for mx66l51235f,
> "The device default is in 24-bit address mode" (section 9-10).
> Hence we removed SPI_NOR_4B_OPCODES option with this commit.
> 
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>

It fixes commit d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")

You should send this one to the linux-mtd@lists.infradead.org 
mailing list.


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5bfa36e..e9f4447 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1068,7 +1068,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
> 
