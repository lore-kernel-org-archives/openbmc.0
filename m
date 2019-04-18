Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hyEek/G7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gxB9Httw"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l7xd35rrzDqRP
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:10:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 37CB722182;
 Thu, 18 Apr 2019 02:10:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=zt4Ga
 Z4u3UoXdeJ3ZsKZk7FOdGhPm0ek/8lr50lagiM=; b=hyEek/G7wD4F8h6C5npPJ
 uRk81iVYerlxZG3oCSssLTByTS6ow+gNoaIJ4c/5rFfP3ZljK5fqNqYGC/gNRtAP
 wmGa4QasfqKmGdXzM06++LAs7hcYE2e1pRni9Mvp90PeHhE6npdFmrRrn/x/mIJy
 onpKxCUVFJ2RGxRu7KSo/JV54EWsLd5ZaVDIiggVeEfB6Ep2uoC3BOvtowNb+BDQ
 OVcyiBxAAC0BDw3wB10kRWaDNRSnPQx+rf7Tafdkye+cSmqo6zLKSdxI59k1Cq8z
 nfXnZ7RArj1mIbRgo21nbWuLs+2fQ0Qn5HjZre0312rNL6+Jl7H8GpJyTjVbXgx7
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=zt4GaZ4u3UoXdeJ3ZsKZk7FOdGhPm0ek/8lr50lag
 iM=; b=gxB9HttwVxi+PyEAze9LA62ncpneeFAlsf9iXXMXECT2dhJoE+f3RFO0l
 HUrQoZJNIMSz5hu1fdJMxm5DPvpDgB5ekB50WYD//HBX6jlrERu8U5s+G6q7o2NK
 pQaMJ24XY/io9WX6Wx5o1Drd/0ef5bW6N5R3LPQPna2WD0SrrhR4kPf/icm6OKaY
 BqNaInT/B9ZALFMQDo7sKdAe5vOgn3alCeRyESLfxd9awf5HDz2kZz5uJjMQLTdU
 VUu4BDC+rO07Z5P2fOG7UIxhhDR/cOO7hojCoNGjMcGxtAX37Fict3QW2t/6uzSu
 tTP8+pZLRm2PHsM8cAp/w/q/R9E/Q==
X-ME-Sender: <xms:wxS4XMgQ6r4S52UeF8rGfhacZnwGR8wiX2VuvzivV5awi2yGwExAVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:wxS4XJTKQR79o8DKVk3oZVslM_P2aFV2ovMPoRArUQ1aP6IKbpkVZg>
 <xmx:wxS4XPElH9jUSCi25OPq9iMzfxwApZAI6H1Kwpu-PcqXpwzsM_I4dg>
 <xmx:wxS4XBm3hAjXouqFuzs3Ct4zeVfB2WjCH1d7C0Ns7CUee4tL2pXOfw>
 <xmx:wxS4XMFJFXAUcTswUTeCg8QsWjDG4qWlBjxVurNhfoyBeT5xoJ1vQw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DF16C7C199; Thu, 18 Apr 2019 02:10:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <76fb08d7-6278-4c33-9e4e-66c491ac603f@www.fastmail.com>
In-Reply-To: <20190417133941.22962-4-clg@kaod.org>
References: <20190417133941.22962-1-clg@kaod.org>
 <20190417133941.22962-4-clg@kaod.org>
Date: Thu, 18 Apr 2019 02:10:10 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_3/4]_mtd:_spi-nor:_aspeed:_use_memcpy=5Ffro?=
 =?UTF-8?Q?mio()_to_capture_the_optimization_buffer?=
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
X-List-Received-Date: Thu, 18 Apr 2019 06:10:14 -0000



On Wed, 17 Apr 2019, at 23:10, C=C3=A9dric Le Goater wrote:
> aspeed_smc_read_from_ahb() only reads the first word which is not what=

> we want. We want to capture a CALIBRATE_BUF_SIZE size window of the
> flash contents to optimize the read.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c=20
> b/drivers/mtd/spi-nor/aspeed-smc.c
> index 1437732fdea1..7e289ecb1c99 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -796,8 +796,7 @@ static bool aspeed_smc_check_reads(struct=20
> aspeed_smc_chip *chip,
>  	int i;
> =20
>  	for (i =3D 0; i < 10; i++) {
> -		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
> -					 CALIBRATE_BUF_SIZE);
> +		memcpy_fromio(test_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
>  		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) !=3D 0)
>  			return false;
>  	}
> @@ -921,8 +920,7 @@ static int aspeed_smc_optimize_read(struct=20
> aspeed_smc_chip *chip,
> =20
>  	writel(chip->ctl_val[smc_read], chip->ctl);
> =20
> -	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
> -				 CALIBRATE_BUF_SIZE);
> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> =20
>  	/* Establish our read mode with freq field set to 0 (HCLK/16) */
>  	chip->ctl_val[smc_read] =3D save_read_val & 0xfffff0ff;
> --=20
> 2.20.1
>=20
>

Applied to dev-5.0.

Cheers,

Andrew
