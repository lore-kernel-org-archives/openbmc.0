Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FmyGPpAU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BU0j5wsH"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418Gyg1307zF0XQ
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 13:38:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DF9020F01;
 Sun, 17 Jun 2018 23:38:16 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 17 Jun 2018 23:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=iQruUCzJpnrAuAqWuAPlUBQuouoiy
 3jfWNoWuAe6gDg=; b=FmyGPpAUIOPPwHMPQU89P0rV0KnxDuZ9/xn5u+YMF0O/6
 SOKbxd0AvL3hn438guSrhyvQtcpTMvlriKs6OWV8kOT55Y3OLbw//s5wFjRw6Z9H
 LJsCN5uFVkYSLC/HZ1N0e+1t3Y2d44KI637Dm0y8JvaHe6ny5uw1tmSb6bhO3mZ4
 XcuU+6pXkOU3bzoiewuwanpznNFGpPVmpN4HhezAqc6/c0ieCcQPjyNJVIqLjvTW
 FyXYfOhQZRY9lAQRxopETWcm3sp45lBubgg616yZOFKx69mq27Xq3Vv90BFQmsAF
 y2DZFB0T7oht1CE4OI+Hkw8gESHMU1dn3ffHnNZxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iQruUC
 zJpnrAuAqWuAPlUBQuouoiy3jfWNoWuAe6gDg=; b=BU0j5wsHdEp5MxH60yA8je
 mrwCqqhC0SGtDQnBJmj5AUVo4Est79WqH2dCQaadeuKYT79Iy3f3dVdS+2IV1xTq
 ixBxq1Ry9tY1ojXtRxetJSgjy1Fy53cZCjofOOgHMZ936Z9J023mSubaX/wWaXC8
 JGrfBJxbPilLf8yuqF19aqpH6gxFzQTSUJmPeNmv9xL5cXk+7mk7K/OmN+j8r8bS
 GBsmvzpVN2Yn/tHnPQ0UV6jpwHJG7Ndgru2V9x9br4IVPQhEcHKr1iTShoN2lIPe
 247IOaPdnh0lVtJ+KC9JvY+uY+/2yOZt6PYh/7+hcKvaO9+vuV238Rjt5B6uLZfw
 ==
X-ME-Proxy: <xmx:JyknWxjFNpxq5lb9jYWixyhPCck4PwFzwIrZuqF-eAtKMpXHN-nX3w>
 <xmx:JyknW9bxjUih2XOY0e5bZRNFZm1aJ622RO1YAIwgb2bKtlW0mCagRg>
 <xmx:JyknW2pAzO-mb93sxgSk9BakQbS6Var4209I6TLWoaVjkVm4lpyIUQ>
 <xmx:JyknWyOF0tQpbkQ5DHp8IAFH5nnw763H2C-bwVOw2j6OWROiJMsW2g>
 <xmx:JyknWxqQM2ZdU4w2JMxq7h-KczKfhm8QgMW_RkDu1gzyl7oLnKcyzA>
 <xmx:KCknWwaUSlEAV4os4Jigto6fNuA4vGZFkga005MUC5cvgOO0o5qsOA>
X-ME-Sender: <xms:JyknWw2BCdmZMxHwfWxR6nOdT_mgpjkHN60ct9mhHgJMEOhnLPgurw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 87DCEBA43D; Sun, 17 Jun 2018 23:38:15 -0400 (EDT)
Message-Id: <1529293095.2204606.1411267976.3E89DDC7@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-498d70f2
References: <20180608130000.22627-1-clg@kaod.org>
 <20180608130000.22627-3-clg@kaod.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: aspeed: limit the maximum SPI frequency
Date: Mon, 18 Jun 2018 13:08:15 +0930
In-Reply-To: <20180608130000.22627-3-clg@kaod.org>
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
X-List-Received-Date: Mon, 18 Jun 2018 03:38:21 -0000

On Fri, 8 Jun 2018, at 22:30, C=C3=A9dric Le Goater wrote:
> The optimize read algo can choose a 100MHz SPI frequency which might
> be a bit too high for dual output IO on some chips, for the W25Q256 on
> palmetto for instance. The MX66L1G45G on witherspoon should be fine
> though. Also, the second chip of the FMC controller does not get any
> optimize settings for reads. Only the first is configured by U-Boot.
>=20
> To fix these two issues, we introduce a "spi-max-frequency" property
> in the device tree which will be used to cap the optimize read
> algorithm and we run the algo on the FMC controller chips as well.

Might be a silly question, but why didn't you add support for optimized rea=
ds for the AST2400 FMC given we can limit the speed through the devicetree =
property?

>=20
> By default, the frequency setting is 50MHz.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index a301895d1f06..e4a0123b12b3 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -83,6 +83,7 @@ static const struct aspeed_smc_info fmc_2500_info =3D {
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
> +	.optimize_read =3D aspeed_smc_optimize_read,

i.e. here you add the support for the 2500 FMC, but the 2400 FMC info struc=
t is unchanged.

>  };
>=20=20
>  static const struct aspeed_smc_info spi_2500_info =3D {
> @@ -114,6 +115,7 @@ struct aspeed_smc_chip {
>  	u32 ctl_val[smc_max];			/* control settings */
>  	enum aspeed_smc_flash_type type;	/* what type of flash */
>  	struct spi_nor nor;
> +	u32 clk_rate;
>  };
>=20=20
>  struct aspeed_smc_controller {
> @@ -130,6 +132,8 @@ struct aspeed_smc_controller {
>  	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
>  };
>=20=20
> +#define ASPEED_SPI_DEFAULT_FREQ		50000000
> +
>  /*
>   * SPI Flash Configuration Register (AST2500 SPI)
>   *     or
> @@ -993,11 +997,10 @@ static int aspeed_smc_chip_setup_finish(struct=20
> aspeed_smc_chip *chip)
>  	dev_info(controller->dev, "read control register: %08x\n",
>  		chip->ctl_val[smc_read]);
>=20=20
> -	/*
> -	 * TODO: get max freq from chip
> -	 */
> +
>  	if (optimize_read && info->optimize_read)
> -		info->optimize_read(chip, 104000000);
> +		info->optimize_read(chip, chip->clk_rate);
> +
>  	return 0;
>  }
>=20=20
> @@ -1051,6 +1054,13 @@ static int aspeed_smc_setup_flash(struct=20
> aspeed_smc_controller *controller,
>  			break;
>  		}
>=20=20
> +		if (of_property_read_u32(child, "spi-max-frequency",
> +					 &chip->clk_rate)) {
> +			chip->clk_rate =3D ASPEED_SPI_DEFAULT_FREQ;
> +		}
> +		dev_info(dev, "Using %d MHz SPI frequency\n",
> +			 chip->clk_rate / 1000000);
> +
>  		chip->controller =3D controller;
>  		chip->ctl =3D controller->regs + info->ctl0 + cs * 4;
>  		chip->cs =3D cs;
> --=20
> 2.13.6
>=20
