Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Dyk5vB7o"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="coFVUEBb"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ld590zJhzDqRt
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 11:03:24 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D056F21B8C;
 Thu, 18 Apr 2019 21:03:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 21:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=Qq8No
 pwMavGeBXO/2qdKVv+ADhOBNPLS1YdiFrDUScs=; b=Dyk5vB7o2rFddinxnNXaa
 /GvIS4ah1iwzdA7olVSHtmWKM0yXA0Q6j+ubn45yulfED5mLDuuWYYgN10SQcIAV
 Fhj/TjNzMYG/Ua1YtLvRdv/V6T7rUojTIH+xjS9lJgZ9PTu8R4nfrWWiHtsKFP9u
 G2Tr9lIhqlAKp/k+iXl45CZvJkcT90DmZEhs4boa2AR5zy99Lil7u4rtlH7dKm32
 jkI9qH/NHcSbPel4s0BjNB9Drw0kcQVKztvFYRihV2ubv/7QoWyX4X2v4f48xcrj
 dElPnH1A/GQ9KiF9eJ0r/SKN+e/urRG033rb6weEP7S1MhspSXvR4VaqFAFCe15T
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Qq8NopwMavGeBXO/2qdKVv+ADhOBNPLS1YdiFrDUS
 cs=; b=coFVUEBbmBzuIBmRppl0/YqdC7tMp3abM21mso2dKUi1P7ykfRiH+J5ki
 7Arqeb+9fEm2+ez2CCccT3AWmQUL9rB0eJceUbDGynSnfVugRqe9WxGKk20V2+82
 KhSSGizVcjXG8ctytSPE9xjZvOtw5TI9TF41uApx2uY6eJrNIyO3JSN9BU+0wAyo
 nj6WpKpSqauV+nkLIZymQYnIKiB4caXOYq71PrecmwV3bd2Z7PikL8o7j2wvbEaS
 3F5thpAdBO84UxieyOM+xLr1x4NW+HZV9JpmClcFfaL6Z1kFvHqi5SSyVbjDysGg
 7+2xyd56yM0DeuuilpENULNMhz+iA==
X-ME-Sender: <xms:WR65XLNkOv3TSZQwU06cfl7osxcyqQBMgeSao8jNcV_fwvKLlsd6rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WR65XNapKwmhE2Mv5IAp_MyeKFo_AXJ9LZ_pAxB4min9_XgQAT3yLw>
 <xmx:WR65XHqc83sFN8nlWeG_p0IabKxcNHi86a5hnuBb_DcedkE_JArPkg>
 <xmx:WR65XJa_kZpAEIbTDBZG7saxZdPAVZKbK6oh_EjV4YnBorjVOCXPVQ>
 <xmx:WR65XBbAzyMCgolWNLVMEnHgJk4xYRC2xV2-S_fLXLN17yQsaE1Ncw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4F3FC7C199; Thu, 18 Apr 2019 21:03:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
In-Reply-To: <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
References: <20190417133941.22962-4-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
Date: Thu, 18 Apr 2019 21:03:20 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Milton Miller II" <miltonm@us.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 19 Apr 2019 01:03:25 -0000



On Fri, 19 Apr 2019, at 06:53, Milton Miller II wrote:
> About 04/17/2019 09:20AM in some timezone, C=C3=A9dric Le Goater wrote=
:
>=20
>=20
> >aspeed_smc_read_from_ahb() only reads the first word which is not
> >what
> >we want. We want to capture a CALIBRATE_BUF_SIZE size window of the
> >flash contents to optimize the read.
> >
>=20
> NACK
>=20
> This justifcation is false.  The routine reads the whole buffer
> because it calls the _rep routine and takes the size.
>=20
> In addition, the comment just before aspeed_smc_read_from_ahb
> tells why memcpy_fromio and memcpy_toio are broken on 32 bit
> arm, and this is still the case judging from the recent bug
> reportfrom a Nuvaton user [1].
>=20
> [1] https://github.com/openbmc/openbmc/issues/3521
>=20
> Andrew, Please revert this patch.

Yeah, I had a briefly nagging thought about this when I applied it. I
should have gone with that gut instinct and inspected it in more
depth.

Thanks for calling it out.

Reverting for dev-5.0, this is an isolated issue (arguably should have
been separated from the current series).

Andrew

>=20
> >Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >---
> > drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
> > 1 file changed, 2 insertions(+), 4 deletions(-)
> >
> >diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
> >b/drivers/mtd/spi-nor/aspeed-smc.c
> >index 1437732fdea1..7e289ecb1c99 100644
> >--- a/drivers/mtd/spi-nor/aspeed-smc.c
> >+++ b/drivers/mtd/spi-nor/aspeed-smc.c
> >@@ -796,8 +796,7 @@ static bool aspeed_smc_check_reads(struct
> >aspeed_smc_chip *chip,
> > 	int i;
> >=20
> > 	for (i =3D 0; i < 10; i++) {
> >-		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
> >-					 CALIBRATE_BUF_SIZE);
> >+		memcpy_fromio(test_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> > 		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) !=3D 0)
> > 			return false;
> > 	}
> >@@ -921,8 +920,7 @@ static int aspeed_smc_optimize_read(struct
> >aspeed_smc_chip *chip,
> >=20
> > 	writel(chip->ctl_val[smc_read], chip->ctl);
> >=20
> >-	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
> >-				 CALIBRATE_BUF_SIZE);
> >+	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> >=20
> > 	/* Establish our read mode with freq field set to 0 (HCLK/16) */
> > 	chip->ctl_val[smc_read] =3D save_read_val & 0xfffff0ff;
> >--=20
> >2.20.1
> >
> >
>=20
>
