Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EEPExunA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PKKqLmz5"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DTCd2dGlzF18k
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 09:34:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 29FD8218FD;
 Sun, 24 Jun 2018 19:34:03 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 24 Jun 2018 19:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=xX3KtN46S1tLyQy1SsbV8qX1ERAz3
 NAfh5MU8TXruNY=; b=EEPExunA2/0Oej6vLPZt/CMIZMyAJtqwU9AqnhCbzRIcj
 HwBm2UjlpvCaPfLhbs/ZBpBzUgxIh2y9ux3R+CMfR8cOLPnKYYkwy3ycHPYLkhD5
 GwoZ5yy7Ad+LuCEwLsDwiqJftdNzyb/dQ1lEeDlxVnR7JyD8ceBj9Gr8sQRmSVE8
 ILPq0iqjR2sZcYhL0aO7OF2WMqernoqTztg0Ddvh/c8DwhhcYN9L0vC7TPq+8dav
 2QvqH+NGtXtUf50YDuKXoc6qGgdhwwnwjzoSIyC55sEnFFetOGlTLzzXRwDtSuXa
 TzRFp83J+FKDzpBsW03LQ/qop3hw2lbAxH9Tmh7YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xX3KtN
 46S1tLyQy1SsbV8qX1ERAz3NAfh5MU8TXruNY=; b=PKKqLmz5x2jsT/faoEUkAA
 oDUVYOVFoJlN4+j4gehPQpdNkHJ8iEkSt0uxRZoKqqLI/ycn15mZYOiD2imfzmhj
 ARKkhSm4fxlK70D7QPfe6M5QW4R27r4Lr4+rdE6xjTEpk3UyA31TF/ymPSWM4VKI
 VS5a9YWMMr1728EvUNI/Qkvjt7hL35IaqzhtEep7tasnCyifhXBE70jPEpW6a6da
 gPUYxiAiIIc47MrnblA61tEo8T7kpoYQulEM1fDUAdDAbz5RbkkKyR9nP0j3TEAF
 9y7SM8q0k0oT58BZUbhWt9oUzraFR6ffFUygglN4HvIhYxo/WHjzTxy5uPCjxT1g
 ==
X-ME-Proxy: <xmx:aiowW4U9uhGu9ONrEP5qIF6e3419MDIY0eI7RCScD1kJKxYZ5PRGjg>
 <xmx:aiowW2q6F4UuyR57HbMA7fMaGEEfpFCfQAGj_hJhVTcqlkJsbQOneQ>
 <xmx:aiowWxXn988K1PwExM-xGQKNmAqP_V4UaqgQQj3VV-jwuIIeXtinGA>
 <xmx:aiowW_EkdP3jMbcb50fyqFga9zmicTXj-WFndfplLsr06ZXUMpi00A>
 <xmx:aiowWwA0lu3Y98ya9Ujxz5XJfOauFy_W4AC7FQ5h0-tdE7eKNGa6uw>
 <xmx:ayowW2sqH9yjibdp_aS-8qUCg4Rl5QHnfSxtCUfjfFSsHjDaCXp9TA>
X-ME-Sender: <xms:aiowW9HtgHGp-nTVSlyNjkEFuo2_x62ryBAP38lUj0vYrzMjcJXnIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C3E45BA43D; Sun, 24 Jun 2018 19:34:02 -0400 (EDT)
Message-Id: <1529883242.2168796.1418891112.74552A08@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
Subject: Re: [PATCH linux dev-4.17 v2 2/2] mtd: spi-nor: aspeed: limit the
 maximum SPI frequency
In-Reply-To: <20180622070937.21498-3-clg@kaod.org>
Date: Mon, 25 Jun 2018 09:04:02 +0930
References: <20180622070937.21498-1-clg@kaod.org>
 <20180622070937.21498-3-clg@kaod.org>
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
X-List-Received-Date: Sun, 24 Jun 2018 23:34:06 -0000

On Fri, 22 Jun 2018, at 16:39, C=C3=A9dric Le Goater wrote:
> The optimize read algo can choose a 100MHz SPI frequency which might
> be a bit too high for dual output IO on some chips, for the W25Q256 on
> palmetto for instance. The MX66L1G45G on witherspoon should be fine
> though. Also, the second chip of the FMC controller does not get any
> optimize settings for reads. Only the first is configured by U-Boot.
>=20
> To fix these two issues, we introduce a "spi-max-frequency" property
> in the device tree which will be used to cap the optimize read
> algorithm and we run the algo on the FMC controller chips as well.
>=20
> By default, the frequency setting is 50MHz.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index a301895d1f06..c9cd20f199d9 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -62,6 +62,7 @@ static const struct aspeed_smc_info fmc_2400_info =3D {
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
> +	.optimize_read =3D aspeed_smc_optimize_read,
>  };
>=20=20
>  static const struct aspeed_smc_info spi_2400_info =3D {
> @@ -83,6 +84,7 @@ static const struct aspeed_smc_info fmc_2500_info =3D {
>  	.ctl0 =3D 0x10,
>  	.timing =3D 0x94,
>  	.set_4b =3D aspeed_smc_chip_set_4b,
> +	.optimize_read =3D aspeed_smc_optimize_read,
>  };
>=20=20
>  static const struct aspeed_smc_info spi_2500_info =3D {
> @@ -114,6 +116,7 @@ struct aspeed_smc_chip {
>  	u32 ctl_val[smc_max];			/* control settings */
>  	enum aspeed_smc_flash_type type;	/* what type of flash */
>  	struct spi_nor nor;
> +	u32 clk_rate;
>  };
>=20=20
>  struct aspeed_smc_controller {
> @@ -130,6 +133,8 @@ struct aspeed_smc_controller {
>  	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
>  };
>=20=20
> +#define ASPEED_SPI_DEFAULT_FREQ		50000000
> +
>  /*
>   * SPI Flash Configuration Register (AST2500 SPI)
>   *     or
> @@ -993,11 +998,8 @@ static int aspeed_smc_chip_setup_finish(struct=20
> aspeed_smc_chip *chip)
>  	dev_info(controller->dev, "read control register: %08x\n",
>  		chip->ctl_val[smc_read]);
>=20=20
> -	/*
> -	 * TODO: get max freq from chip
> -	 */
>  	if (optimize_read && info->optimize_read)
> -		info->optimize_read(chip, 104000000);
> +		info->optimize_read(chip, chip->clk_rate);
>  	return 0;
>  }
>=20=20
> @@ -1051,6 +1053,13 @@ static int aspeed_smc_setup_flash(struct=20
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
