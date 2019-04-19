Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UhN5qr58"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lN3HwcgC"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lmbK6m0CzDqSp
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 16:41:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5DD67560;
 Fri, 19 Apr 2019 02:41:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 19 Apr 2019 02:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=Ffd8G
 SJXd/7PtYIGmCN2OuSTr32k2lSeqVlS6M1E0Vk=; b=UhN5qr58iOwnPDn3Fdgd/
 9NuK0ZHXd+FSL/FJKHmuJ48qw02d8wACitOa78ZrPca3cIwwh/EJ3bzYQdBft9ur
 Yr0Myu20kfrEEX7N9oIBxSntKGjUZo7yJER0HzYbmSba4obD7B9Z/PeOZwUHRacI
 L6rnhPj2qCdK+gCQbt4xOMGqWPwHj8Ynh2gLEszStxx6v9bh/kPN+Tmg5BTw6LSB
 DLW+K3GOP/K+WH0+dG0IACHSRXlt7WG92gqq/F1xQtCsI9uUh7aJJBtKa+kfG/HG
 0zBYnMuMWJ2qGxXu/kLw4PJxjj0EgiOOmCpyGdFHef78FN3CDpgt7cTZEWK3w4CA
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Ffd8GSJXd/7PtYIGmCN2OuSTr32k2lSeqVlS6M1E0
 Vk=; b=lN3HwcgC3k054ju0vFdB2d9SPkoMThO6gn50tczPv+9cqzll0M5wfz8NB
 rs2QXkQCuIhdUt5qOnjGyF6K9MG2ZDdPvjd3gCORxGHxRXVEIFv3bK96eSsmK62v
 CfcRpRd1MfNaTxWg+4mKiJZNx0QZAdyHdJLjWARbcXLcPI+T9ESC9Ns4hUfUAwTO
 yInunEabxw0ATrsamvECgjy9Mw/HA8XResT+4Du2WU/mD4zdePEQfy6IKzrmX7PL
 niNGCcsTuxxdkSbEbrs/0Hta7gIAKTRu90q8l0LZ5U0h644r6JCibjV+B0XsX/lt
 zs4fnRzHog2QE/onpsK02bkUzw1ew==
X-ME-Sender: <xms:lm25XMz9I_AtcPJBrXwgSkj8dx7p2otRRtjGuVOtHBxistGjh7xIJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:lm25XBjZQRH7jbb60XToKCaEiz0TTB3ErTJLBbuS22ajReT1jBY-nQ>
 <xmx:lm25XDq61MEPQ6g2mz9pFuQKbdXhJp-i4DebUnOhsoDoDuVmd4TWcQ>
 <xmx:lm25XIf4k2-s49rhCCV4849EH10GKVTyh9a9sLJShhPWdMhfFdORJQ>
 <xmx:lm25XC83lIhrSL6Ly5btVO3kfIUZwpSMz-KALwoewlChxlm_KNVw1Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7F8767C199; Fri, 19 Apr 2019 02:41:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <a90b09ef-4ba4-422a-93fd-c041084b143e@www.fastmail.com>
In-Reply-To: <92f87d93-f120-98c0-aa02-44f17c9f7a5b@kaod.org>
References: <20190417133941.22962-3-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF6182D899.1A05425F-ON002583E0.0076364D-002583E0.007B584C@notes.na.collabserv.com>
 <92f87d93-f120-98c0-aa02-44f17c9f7a5b@kaod.org>
Date: Fri, 19 Apr 2019 02:41:25 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Milton Miller II" <miltonm@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 19 Apr 2019 06:41:37 -0000



On Fri, 19 Apr 2019, at 15:39, C=C3=A9dric Le Goater wrote:
> On 4/19/19 12:27 AM, Milton Miller II wrote:
> > About 04/17/2019 09:18AM in some timezone, C=C3=A9dric Le Goater wro=
te:
> >=20
> >>Subject: [PATCH dev-5.0 2/4] mtd: spi-nor: aspeed: clarify 4BYTE
> >>address mode mask
> >>
> >=20
> > Missing=C2=A0 change log here.
>=20
> This is a oneliner patch.

Yes, I think the comment more than made up for the lack of a changelog.

Easy enough to view both together, and I find that acceptable for now.

Andrew

>=20
> >=20
> >>Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org <mailto:clg@kaod.=
org>>
> >>---
> >> drivers/mtd/spi-nor/aspeed-smc.c | 10 +++++++++-
> >> 1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
> >>b/drivers/mtd/spi-nor/aspeed-smc.c
> >>index ee3059b27c07..1437732fdea1 100644
> >>--- a/drivers/mtd/spi-nor/aspeed-smc.c
> >>+++ b/drivers/mtd/spi-nor/aspeed-smc.c
> >>@@ -884,7 +884,15 @@ static const uint32_t aspeed_smc_hclk_divs[] =3D=
 {
> >>
> >> static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
> >> {
> >>- return (chip->ctl_val[smc_read] & 0x2000) |
> >>+ /*
> >>+ * Keep the 4Byte address mode on the AST2400 SPI controller.
> >>+ * Other controllers set the 4Byte mode in the CE Control
> >>+ * Register
> >>+ */
> >>+ u32 ctl_mask =3D chip->controller->info =3D=3D &spi_2400_info ?
> >>+ CONTROL_IO_ADDRESS_4B : 0;
> >>+
> >=20
> > I dislike this patch because it violates the data driven model of th=
e types.
> >=20
> > Either a dupicate method should be created or at least a member of t=
he
> > type structure should be used instead of a compare to a specific ins=
tance.
>=20
> we could add a ops returning the bitmask. yes. I think this is a effic=
ient
> considering the patch is not in mainline and was not reviewed by the L=
inux
> maintainers.
>=20
> C.
>=20
>=20
> >=20
> >>+ return (chip->ctl_val[smc_read] & ctl_mask) |
> >> (0x00 << 28) | /* Single bit */
> >> (0x00 << 24) | /* CE# max */
> >> (0x03 << 16) | /* use normal reads */
> >>--
> >>2.20.1
> >>
> >>
>=20
>
