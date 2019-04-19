Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="l7W2ryFq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="4kPdk1LH"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lnZ20XBDzDqRx
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 17:25:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9C012590;
 Fri, 19 Apr 2019 03:25:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 19 Apr 2019 03:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=mDS0X
 hNyASXWQCTZOcVcDl22cljKwJhogmubmflJhH8=; b=l7W2ryFqNF48l4NVeXAUv
 Dw0I/WkQZfn/To02Ujg1jKqB1bgwnyEMlEH/uTKbiG8I/7bh30tB43fLhNql7qzr
 cYQA6QGXQQqWBPQgG9GmHRev9IMdZY7ltfbCQD6yzWdjZlpSrNDlX8oPX6X4fPUS
 RLPeiauFWvLKGUu4nB9CPgcDC11PlNqhCi0qVQDyhv5lLH3jvW7DfRm2N039TGXS
 xQHcBk4frO/QiUjrgqfz/n7FAEVLxnSi0elfvdyZ8KXqBfK3pTwG45deBrw+jXjc
 o/Xcwwc0BgZbxNrMusImxL3J7CDpBiPtOkpRqCKPsOePDTwAOLrEgiciwoy4vLbW
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=mDS0XhNyASXWQCTZOcVcDl22cljKwJhogmubmflJh
 H8=; b=4kPdk1LHG2QTrHeidTETIqo/ggFz4r6DwahIPcFyTa3tXdnOg8quZBqLl
 W90TvhaFulQ16NkxzgTgRUa5Rtum4OUSxCnPYRRXzhB+S7W4t+79kVjptlTpT4mk
 /rnHhtIep4eSfRtJ3HMuqgx7gu5Gvr/3Z4Dh9faE2fTOe2a94BESazQ1z1kwIblB
 9Z79irgaQ/KPk2ckO7JHmoRdbq1u4QT2Z6ftqW0ida0szn3Z5WY1uAUgonD56qqE
 MY+xF7tAq6EH9nUuu2gzZn1MRPnQs6vhjKxxiNgt233+IV9bTQVntZIYp2y/g6r6
 9uU8sDi6C86PxWpxsvnI/pFCK/I0Q==
X-ME-Sender: <xms:5He5XG3cE0yIZf0C4-Bpqn4nvphyp-GTlURRSU9nU9Ee4raCaU4KAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:5He5XD5aM8awn3rHlTDLsTcbViHLLfPkWN3co5pQ-j-DPWEU8vBc-w>
 <xmx:5He5XNLsQE7tQQ4kwo6mgXR4EyzzbL3931jRNIAqiH0K2HnZw0NM-w>
 <xmx:5He5XHY56R33aYG0FDOmvdvOSu_5uMHAnLRSR-cvSRCMKbSfwoBKvQ>
 <xmx:5ne5XNcMsBRAeSnHrCVP-X7cmkh6SGQk4Rn7_1ULq7WXvPn8iPP2ag>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7E1ED7C199; Fri, 19 Apr 2019 03:25:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <090455f7-21dd-4e96-888e-1b23592bdfa3@www.fastmail.com>
In-Reply-To: <d3ca43d0-0b47-bcd4-c2ae-d70226b5d12f@kaod.org>
References: <20190417133941.22962-4-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
 <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
 <d3ca43d0-0b47-bcd4-c2ae-d70226b5d12f@kaod.org>
Date: Fri, 19 Apr 2019 03:23:10 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Milton Miller II" <miltonm@us.ibm.com>
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
X-List-Received-Date: Fri, 19 Apr 2019 07:25:30 -0000

Hi C=C3=A9dric

On Fri, 19 Apr 2019, at 15:32, C=C3=A9dric Le Goater wrote:
> On 4/19/19 3:03 AM, Andrew Jeffery wrote:
> >=20
> >=20
> > On Fri, 19 Apr 2019, at 06:53, Milton Miller II wrote:
> >> About 04/17/2019 09:20AM in some timezone, C=C3=A9dric Le Goater wr=
ote:
> >>
> >>
> >>> aspeed_smc_read_from_ahb() only reads the first word which is not
> >>> what
> >>> we want. We want to capture a CALIBRATE_BUF_SIZE size window of th=
e
> >>> flash contents to optimize the read.
> >>>
> >>
> >> NACK
> >>
> >> This justifcation is false.  The routine reads the whole buffer
> >> because it calls the _rep routine and takes the size.
>=20
> It doesn't AFAICT looking at other drivers and also from my test.
>=20
> >> In addition, the comment just before aspeed_smc_read_from_ahb
> >> tells why memcpy_fromio and memcpy_toio are broken on 32 bit
>=20
> That might have been the case on Linux 4.7. It doesn't seem to be=20
> the case anymore. See below.
>=20
> >> arm, and this is still the case judging from the recent bug
> >> reportfrom a Nuvaton user [1].
> >>
> >> [1] https://github.com/openbmc/openbmc/issues/3521
> >>
> >> Andrew, Please revert this patch.
>=20
> I don't think you have enough convincing arguments for that.

That may be the case, but having seen the pain of the original corruptio=
n
problems that drove the ioreadX_rep() implementation above, Milton's
protest combined with my initial, briefly nagging concern was enough for=

me to revert. Two things here:

1. We've run without this patch for quite some time. Despite oddities,
the existing implementation has been stable
2. With patch 4/4, you've resolved the 4B corruption problem. This was
the immediate concern, as it was impacting teams developing and
testing OpenBMC master. I appreciate the effort you put into hunting
that down, the root cause was certainly not obvious.

From *my* testing we appear to be stable both with and without this
change, however my concern is that *my* testing is not complete enough
to be confident that we're not going to hit the subtle corruption proble=
ms
that drove the introduction of the existing code.

For some additional context, I'm now on leave until the 30th, and Joel t=
o
the 29th. These patches have been through a process that has proceeded
much more hastily than I would have liked, and that's lead to where we
are now.

With that in mind, less change is better, and so I have decided to back
this patch out. It's a risk-based decision, not a reflection of the effo=
rt,
desires or technicalities involved.

So there are lessons in this for me too as I've felt squeezed by the
impact the 4B corruption bug has had on teams testing master, and
my impending leave. With that reasoning and 20/20 hindsight I should
probably have held off to begin with. Next time. Some reflection is in
order.

Anyway, I hope that helps clarify. Time to resolve the disagreement here=
.

Milton: Given your protest, can you please verify whether there continue=

to be issues with memcpy_fromio() that prevent us from making use of it.=

As C=C3=A9dric points out we do make heavy use of it anyway, and using a=

well-worn implementation rather than something bespoke for this particul=
ar
case would improve maintainability.

Cheers,

Andrew
=20
>=20
> > Yeah, I had a briefly nagging thought about this when I applied it. =
I
> > should have gone with that gut instinct and inspected it in more
> > depth.
> >=20
> > Thanks for calling it out.
>=20
> I think this needs more thinking and tests. Witherspoon and palmetto
> are fine. What's the problem.
>=20
> > Reverting for dev-5.0, this is an isolated issue (arguably should ha=
ve
> > been separated from the current series).
>=20
> We have been using memcpy_fromio for reads for a very long time=20
> since 4.13 in the Aspeed SMC driver on *all* platforms*.=20
>=20
> See aspeed_smc_read() for the "Command mode".
>=20
> C.
>=20
>=20
>=20
>=20
> >=20
> > Andrew
> >=20
> >>
> >>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>> ---
> >>> drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
> >>> 1 file changed, 2 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
> >>> b/drivers/mtd/spi-nor/aspeed-smc.c
> >>> index 1437732fdea1..7e289ecb1c99 100644
> >>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> >>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> >>> @@ -796,8 +796,7 @@ static bool aspeed_smc_check_reads(struct
> >>> aspeed_smc_chip *chip,
> >>> 	int i;
> >>>
> >>> 	for (i =3D 0; i < 10; i++) {
> >>> -		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
> >>> -					 CALIBRATE_BUF_SIZE);
> >>> +		memcpy_fromio(test_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> >>> 		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) !=3D 0)
> >>> 			return false;
> >>> 	}
> >>> @@ -921,8 +920,7 @@ static int aspeed_smc_optimize_read(struct
> >>> aspeed_smc_chip *chip,
> >>>
> >>> 	writel(chip->ctl_val[smc_read], chip->ctl);
> >>>
> >>> -	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
> >>> -				 CALIBRATE_BUF_SIZE);
> >>> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> >>>
> >>> 	/* Establish our read mode with freq field set to 0 (HCLK/16) */
> >>> 	chip->ctl_val[smc_read] =3D save_read_val & 0xfffff0ff;
> >>> --=20
> >>> 2.20.1
> >>>
> >>>
> >>
> >>
>=20
>
