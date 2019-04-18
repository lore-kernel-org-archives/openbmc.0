Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cIuObaRp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V7c6I5V8"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l7wy3zwTzDqNH
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:09:38 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0BE6621B2A;
 Thu, 18 Apr 2019 02:09:36 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=TZEvh
 BoPC8pq5o+0yaS9JxQLH+j12sfT2dUCNLP5pxs=; b=cIuObaRpUHRldgFP5FYM1
 gOhSDgMtA6clS9ua12Q7m9GVdz68NUGR4e3vYJAwx+S66cVfsRaOEdF4Clku9MlE
 YzrYUONda1jQyd3OdeCtjp0DbIrja4arnsZa/i7Ue9/EruYEku7xC/jA5ZMHcF5l
 8lOHNzZoNSejg0hCx5gide5q72PBFa1zkD5wZhTTfB8V17kuIJRsQPftt6Y/O6XM
 sWj7E1RwBVY42SDSbaIpfwhLkLx1gNAmYFh+J0D11sHyjiKnDSWY+oXc8w9hH0Mo
 bKsOSkCLBbocOoG1h6BTSDFQrULEmSkerkCmFSIcpKbM85auSPakBjSODQ/VtzRm
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TZEvhBoPC8pq5o+0yaS9JxQLH+j12sfT2dUCNLP5p
 xs=; b=V7c6I5V80rQqCz1JZlYFNQom+6a1tpQ/U/FAANQs2mZ3kwsl2Bhl7YG+R
 x8U6thtZh7x5KQE6De/xfkqoGgquNEX5ZbXrNjOeppt+9W1OXafZ5g50d+oNcGxw
 M/rcUgRTmeJaI4Po/7QRpI8xZdPftzaeF6ZM9BP9rhZqfxiWzN47dlmEtfUIQH6Q
 wjCAc4CWdxl+v6jKAyvrR+InjpWS1tJTUAF3az0WPevMYrydthtzMoUdQEaqIgS1
 IX/U0iPjyVEqIfstGNU5PcX0Xz7/kwkcVIIZWO8xjrsoAO/OkrY/SfbWODmvUGlr
 7Y4ldGvAc3P0i2P7132DDAh0dXOaA==
X-ME-Sender: <xms:nhS4XCCGtpi4JfiqeE6Sq0_S8dbwP0pL5WQf0rLu1Xbzj1YhEe7nFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:nhS4XA3HTwU0hMMu1ZbCc7BIRMUogL4dSubtFAE1Z3wcf20gZLt03w>
 <xmx:nhS4XEshXpHWivnJ5sYeM4TmagJh9Di8vcSlk-zOAVp6v2eTE5JC8A>
 <xmx:nhS4XI6G8-Md0dhnruELlgju6CFYI_E9nuvRH0RwYqxMT1YBXWC6rA>
 <xmx:nxS4XOwlcXWPYnMNskQ37Fqk-AZ6D-OpUoIGSajBX2HK6Kr-Ym36lA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 34F5A7C199; Thu, 18 Apr 2019 02:09:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <069f4bdf-b10b-4ca1-8f75-db7decee10c7@www.fastmail.com>
In-Reply-To: <20190417133941.22962-3-clg@kaod.org>
References: <20190417133941.22962-1-clg@kaod.org>
 <20190417133941.22962-3-clg@kaod.org>
Date: Thu, 18 Apr 2019 02:09:33 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_2/4]_mtd:_spi-nor:_aspeed:_clarify_4BYTE_ad?=
 =?UTF-8?Q?dress_mode_mask?=
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
X-List-Received-Date: Thu, 18 Apr 2019 06:09:39 -0000



On Wed, 17 Apr 2019, at 23:10, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
> index ee3059b27c07..1437732fdea1 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -884,7 +884,15 @@ static const uint32_t aspeed_smc_hclk_divs[] =3D =
{
> =20
>  static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
>  {
> -	return (chip->ctl_val[smc_read] & 0x2000) |
> +	/*
> +	 * Keep the 4Byte address mode on the AST2400 SPI controller.
> +	 * Other controllers set the 4Byte mode in the CE Control
> +	 * Register
> +	 */
> +	u32 ctl_mask =3D chip->controller->info =3D=3D &spi_2400_info ?
> +		 CONTROL_IO_ADDRESS_4B : 0;
> +
> +	return (chip->ctl_val[smc_read] & ctl_mask) |
>  		(0x00 << 28) | /* Single bit */
>  		(0x00 << 24) | /* CE# max */
>  		(0x03 << 16) | /* use normal reads */
> --=20
> 2.20.1
>=20
>

Applied to dev-5.0.

Cheers,

Andrew
