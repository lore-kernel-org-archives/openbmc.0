Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Mq8vOMN/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BFQwQ486"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l7yK2X6ZzDqNL
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:10:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F6F4220CB;
 Thu, 18 Apr 2019 02:10:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=d4YQI
 Ph5yvhdBgFqRMNCtwK9sVN4PLyeSD6zhbPLOn4=; b=Mq8vOMN/PRxkOD6iwE2T7
 ziwdDpzVBTOv5KL/Vs7d/GFVs1md28eKVjyfx+fenVoasLqIaVn7xlR+iKTin42D
 UypP2GztomZOWXRfC1o+spKXa4vJjIanpVZfuI5umbAdcRW2CD8uA6R1qRqol8hL
 lWz3JyhZK+VGcUyxsOeBFVOoCCo69F7Me098rcYyCpShAliBsHiSmptR/V14rLkv
 JdSmkmusHIr0sg9dU9HoqFmAJumGuyjUwPB9Z/+p0BrV+T6yEoW0lHvN2kf9lkbU
 ur2KM7LyaKJ+BV+mif7Z1DJ0KQDSnJuf4rtgoKfzL/tNa3R0TA6HjqS6iJfapXpE
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=d4YQIPh5yvhdBgFqRMNCtwK9sVN4PLyeSD6zhbPLO
 n4=; b=BFQwQ486/+c8iptfZphh7LasOxh4YH1LVM+nduJn5+LmkTn2w7FnO//+G
 SiTg8+6mVu5C2/nva5tC2s/uJ1f/ZbFI5L8Zqz4UFtbiqwA9J5FKk+Vp2fR9uDzr
 6o3rmPe73sOMmLOWpJOkwpgF+meGGJfyfjX5Xhb+99nDF2Iy8j5k1towJZN31OzQ
 qKKmhiSTPczkBNklygATM2C3cDNVyh1Pyyu+HKdkVO6uilRAHrGeTBBI5cgEW1AZ
 sSouWproPLbueiA9RiC+ImDRV9Ym0gw3wyzgTocEBswONF8GvrURxC88aScKjRY6
 QDS9s4eY3zllAqibrJAURVV9pYRtQ==
X-ME-Sender: <xms:5RS4XN9XApmU_bANES_Pe5G1p9a8ojzULEpNQgqXd82ixtJwrlOTzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:5RS4XKy59P0iXKV28jDmzw35oMP3lQ7B76InkrZJqIPAJ1v3xTJTIA>
 <xmx:5RS4XEHz_1ajHqXW8wBIhmfYuKER8nVaYavwdCYY_TcD0_MwWH-uXQ>
 <xmx:5RS4XNN3Vb4eGfhltrrdJpGZukr5XBbSWf0INMYu9eGvaUkgDTLPIg>
 <xmx:5RS4XKkLT--htp66-qqTQZq4ohVZKEJN6bBT2PSCLBj0A8LDtc8N2Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 11D1D7C50A; Thu, 18 Apr 2019 02:10:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <1bc914b9-8a5f-4933-a341-f743714de894@www.fastmail.com>
In-Reply-To: <20190417133941.22962-5-clg@kaod.org>
References: <20190417133941.22962-1-clg@kaod.org>
 <20190417133941.22962-5-clg@kaod.org>
Date: Thu, 18 Apr 2019 02:10:44 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_4/4]_mtd:_spi-nor:_aspeed:_add_support_for_?=
 =?UTF-8?Q?the_4B_opcodes?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 06:10:50 -0000



On Wed, 17 Apr 2019, at 23:10, C=C3=A9dric Le Goater wrote:
> Switch the default controller value to use the read mode in order to
> customize the command and use SPINOR_OP_READ_4B (0x13) when the chip
> supports 4B opcodes.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c=20
> b/drivers/mtd/spi-nor/aspeed-smc.c
> index 7e289ecb1c99..1200b23416e3 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -890,14 +890,21 @@ static u32 aspeed_smc_default_read(struct=20
> aspeed_smc_chip *chip)
>  	 */
>  	u32 ctl_mask =3D chip->controller->info =3D=3D &spi_2400_info ?
>  		 CONTROL_IO_ADDRESS_4B : 0;
> +	u8 cmd =3D chip->nor.flags & SNOR_F_4B_OPCODES ? SPINOR_OP_READ_4B :=

> +		SPINOR_OP_READ;
> =20
> +	/*
> +	 * Use the "read command" mode to customize the opcode. In
> +	 * normal command mode, the value is necessarily READ (0x3) on
> +	 * the AST2400/2500 SoCs.
> +	 */
>  	return (chip->ctl_val[smc_read] & ctl_mask) |
>  		(0x00 << 28) | /* Single bit */
>  		(0x00 << 24) | /* CE# max */
> -		(0x03 << 16) | /* use normal reads */
> +		(cmd  << 16) | /* use read mode to support 4B opcode */
>  		(0x00 <<  8) | /* HCLK/16 */
>  		(0x00 <<  6) | /* no dummy cycle */
> -		(0x00);        /* normal mode */
> +		(0x01);        /* read mode */
>  }
> =20
>  static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
> --=20
> 2.20.1
>=20
>

Applied to dev-5.0.

Cheers,

Andrew
