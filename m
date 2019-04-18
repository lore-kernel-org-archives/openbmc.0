Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NL8E7lBF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OWHTuU9p"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l7tq4chszDq5k
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:07:47 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 29AB121B2A;
 Thu, 18 Apr 2019 02:07:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=XVAiO
 /e8gov6XexzvR0UUep6p0kHHLLoMPLBMsLeD7c=; b=NL8E7lBFDsAAz3bwsI800
 v9DMZWA2WX52T0U4a5uZdxRUFM3xYL+TvWCTHBWrUsh52rDNuJSTo8d0XDT4CyNy
 NnsYcHNqm8GdL73Tu1OxdJm67CFwIXwKOkHEM/FlL1tCXChdyBA26ARx7avSgkGy
 0Pkh/oxC9ILM6dl6P3xOqFuB7VjoPDS2ybllRnaU1BrpTxR0etAlHx++m0AW7NTt
 ESUFZQkLTvSz8Mr8V1ezT7phqJ/3LwxIi8ns6a32+CftokACVWGmaF6ZJcW5Hg7g
 fn7vhAahxmKM4kKcACyvKwYc9Cw9Bif+DoWWcllwY7nit4sfoChMOYN5tz/RY+h0
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=XVAiO/e8gov6XexzvR0UUep6p0kHHLLoMPLBMsLeD
 7c=; b=OWHTuU9pceVSB52WeWlf2e6BikZ6sfsm989mBAY+3+SHgQXqF8BiD+ZvN
 rS2XagkVlV0emDEP8cq9PRlfT/WE2Da/9rh8s67k+mPFeX5LWnS5q3hwi2+g0/8k
 6m4t1P3L6a/dTOaetY1llIaiVO/beKvofnqx1BFAhvuQl1VWQCca0JsRFTuY+fl0
 LeNnJqNvXzkWF9Dn9Karu4ESnb2hfGoytXIioCtiUR8JZcth8OZ/ajtTZdthLPH/
 OtBzKPuk4M8nbvu06/hUgEerxc8z+Oaw74T36E2RD19PPATyP5W/y4TgcEk/rwjX
 ruVlZwuuopaQodol+t7ErmbxXgT2Q==
X-ME-Sender: <xms:LxS4XCbI5ekMZ-2pugiqMjw6Vn-ZGZ1vyWs5S0iRHwqFmiNqpx6HPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhephigrughrohdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:LxS4XNC3ivMpfl_FiWw1YFq8wIJCZtAWZehioytsQDZs_Qp2TCYiCw>
 <xmx:LxS4XKkeXrWTn9gN6kNsRqEgRGnHA2NBJil-E-6XkKxTWmtGuVvKDw>
 <xmx:LxS4XOyh9y3pYAgdmbNd_JiS3F3qop_Ge6ps53YhKaLHeu832pyi3g>
 <xmx:MBS4XPgLGj7S1NaqyQQrbc1458vCOYIv4qzb1WU6I9g0NDmxG7TFtw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E89977C50A; Thu, 18 Apr 2019 02:07:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <397cfc74-ec02-4aba-b3ea-f84bea664549@www.fastmail.com>
In-Reply-To: <c5b1bb17-87c2-ff06-91ab-4c5924661caa@yadro.com>
References: <20190417133941.22962-1-clg@kaod.org>
 <20190417133941.22962-2-clg@kaod.org>
 <c5b1bb17-87c2-ff06-91ab-4c5924661caa@yadro.com>
Date: Thu, 18 Apr 2019 02:07:42 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander Amelkin" <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_1/4]_mtd:_spi-nor:_aspeed:_introduce_a_aspe?=
 =?UTF-8?Q?ed=5Fsmc=5Fdefault=5Fread()_helper?=
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
X-List-Received-Date: Thu, 18 Apr 2019 06:07:48 -0000



On Thu, 18 Apr 2019, at 03:40, Alexander Amelkin wrote:
> 17.04.2019 16:39, C=C3=A9dric Le Goater wrote:
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  drivers/mtd/spi-nor/aspeed-smc.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/=
aspeed-smc.c
> > index ddf7ae78aa0a..ee3059b27c07 100644
> > --- a/drivers/mtd/spi-nor/aspeed-smc.c
> > +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> > @@ -882,6 +882,17 @@ static const uint32_t aspeed_smc_hclk_divs[] =3D=
 {
> >  };
> >  #define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)=

> > =20
> > +static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
> > +{
> > +	return (chip->ctl_val[smc_read] & 0x2000) |
>=20
> C=C3=A9dric, isn't this a good time to get rid of these cached ctl_val=
 values?
>=20
> Why not read/modify/store the actual register?
>=20
> What's the profit of this caching?

Reasonable question, but I've merged the change as-is to dev-5.0 on the
basis that it helps fix read corruption on AC-cycles.

We can address this in a follow-up patch if necessary.

Cheers,

Andrew

>=20
> With best regards,
> Alexander Amelkin,
> Leading BMC Software Engineer, YADRO
> https://yadro.com
>=20
>=20
>=20
> Attachments:
> * signature.asc
