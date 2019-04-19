Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="geWrBZ6n"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="g763XdLl"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lpqd4KJXzDqTG
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 18:22:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BA7B6578;
 Fri, 19 Apr 2019 04:22:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 19 Apr 2019 04:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=tSkzF
 6OG2v00RgrFFJVjaX1Ec2TKqW5LpPI0u3g8Fqk=; b=geWrBZ6nvNVfDa7I3iBMy
 PSZhL3aeFcZqIoMjyLYzP+J1BMnyZJCyj9HSD40dvL0CczdMg7/INXb/jqKUPkJh
 S3p6mIZRNMqm/AR12ZMNMLyBocDls0yrr0PLY8b9BV1Jot8It37FerSP7jCn75x9
 c2Rumjy7g/tDuZEuwAMqnAqe7ZCk8ANToZlAvHfWaLkrpyu11xV0RlJ8/AWS6TtH
 P/TMWPKCwahYKeihJHWRc7oqK/NWiwsRi9hIprusqbpdi87MZwKiE9dR5TErQxxe
 vgxD4fJQ9z08RPZdbSnZZm3lf4iCyZg8MoOiDcT17DF3V+RhNi6mxlcv/RWfQ86h
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=tSkzF6OG2v00RgrFFJVjaX1Ec2TKqW5LpPI0u3g8F
 qk=; b=g763XdLlmaTpcBl1BosTrJYWWbbTHCuM+DfJHDvbHUhOy9TZ2S8gsqX1o
 k4EEMy2tGU51XbUHA8ze9IoiNOyp4W8srg7TCMWv2ls4SD4yw+oBy3+YAeOIR5o+
 /A7w+5BrYahkYPCPL5G1vWQGsqkDlJVtjCltz3MY/f3jN7AUr87BQT2DuYpF4TD2
 ASrgU59OF5LTTYGZapeO7eZ6mmL1iUiOAV+YfA8DK1Zxsxytxva3194E9EdZEbkV
 pv3E0bn0ty09hJYQY+7aTYDbE4GileEUGDQ5mTx2htIe5/Dc3J/OxuxNTqttnG/3
 G+QCqmsceo7kb2A3ZFrbdMc4R0+vA==
X-ME-Sender: <xms:OYW5XBmw6KFs5a-ppmDFTpjSXAmgVi7jApoffCCVQQTbM7Kw120gmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeejgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OYW5XDK0E9g7E-XfhU-uq6Gz18PWU0wQDjvBrUp1sejtCr489KXkDQ>
 <xmx:OYW5XEX8mERdyCqtUkF_TxqBckB1JW0OueOgRv-NhcMlHJ05hDPWXA>
 <xmx:OYW5XAPgHAUroXSGq7gQzxT_06UrjLjw1-VNIYOol7RFSGrjTs9PNQ>
 <xmx:OoW5XHhNswhqMXUXQbnw2eInPI1CHjcGqQ_ZeKHvf8k6kxT6vgAK1g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 892C87C199; Fri, 19 Apr 2019 04:22:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <b80938b4-339f-4f21-8660-e8bbbcaa8e49@www.fastmail.com>
In-Reply-To: <a914efb5-758f-b586-15f8-460ea6cbb225@kaod.org>
References: <20190417133941.22962-4-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
 <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
 <d3ca43d0-0b47-bcd4-c2ae-d70226b5d12f@kaod.org>
 <090455f7-21dd-4e96-888e-1b23592bdfa3@www.fastmail.com>
 <a914efb5-758f-b586-15f8-460ea6cbb225@kaod.org>
Date: Fri, 19 Apr 2019 04:22:05 -0400
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
X-List-Received-Date: Fri, 19 Apr 2019 08:22:26 -0000



On Fri, 19 Apr 2019, at 17:39, C=C3=A9dric Le Goater wrote:
> On 4/19/19 9:23 AM, Andrew Jeffery wrote:
> > Hi C=C3=A9dric
> >=20
> > On Fri, 19 Apr 2019, at 15:32, C=C3=A9dric Le Goater wrote:
> >> On 4/19/19 3:03 AM, Andrew Jeffery wrote:
> >>>
> >>>
> >>> On Fri, 19 Apr 2019, at 06:53, Milton Miller II wrote:
> >>>> About 04/17/2019 09:20AM in some timezone, C=C3=A9dric Le Goater =
wrote:
> >>>>
> >>>>
> >>>>> aspeed_smc_read_from_ahb() only reads the first word which is no=
t
> >>>>> what
> >>>>> we want. We want to capture a CALIBRATE_BUF_SIZE size window of =
the
> >>>>> flash contents to optimize the read.
> >>>>>
> >>>>
> >>>> NACK
> >>>>
> >>>> This justifcation is false.  The routine reads the whole buffer
> >>>> because it calls the _rep routine and takes the size.
> >>
> >> It doesn't AFAICT looking at other drivers and also from my test.
> >>
> >>>> In addition, the comment just before aspeed_smc_read_from_ahb
> >>>> tells why memcpy_fromio and memcpy_toio are broken on 32 bit
> >>
> >> That might have been the case on Linux 4.7. It doesn't seem to be=20=

> >> the case anymore. See below.
> >>
> >>>> arm, and this is still the case judging from the recent bug
> >>>> reportfrom a Nuvaton user [1].
> >>>>
> >>>> [1] https://github.com/openbmc/openbmc/issues/3521
> >>>>
> >>>> Andrew, Please revert this patch.
> >>
> >> I don't think you have enough convincing arguments for that.
> >=20
> > That may be the case, but having seen the pain of the original corru=
ption
> > problems that drove the ioreadX_rep() implementation above, Milton's=

> > protest combined with my initial, briefly nagging concern was enough=
 for
> > me to revert. Two things here:
> >=20
> > 1. We've run without this patch for quite some time. Despite odditie=
s,
> > the existing implementation has been stable
> > 2. With patch 4/4, you've resolved the 4B corruption problem. This w=
as
> > the immediate concern, as it was impacting teams developing and
> > testing OpenBMC master. I appreciate the effort you put into hunting=

> > that down, the root cause was certainly not obvious.
> >=20
> > From *my* testing we appear to be stable both with and without this
> > change, however my concern is that *my* testing is not complete enou=
gh
> > to be confident that we're not going to hit the subtle corruption pr=
oblems
> > that drove the introduction of the existing code.
>=20
> QEMU would have caught this regression if SFDP was modeled. It does to=
day
> if 4B opcodes are forced on the mx25l25635e. Given the time the team s=
pent
> on this, I would say 1 or 2PM overall, QEMU is a good investment.=20
>                                                   ^
>                                                   |
> Managers are you reading this ? ------------------+=20
>=20
> > For some additional context, I'm now on leave until the 30th, and Jo=
el to
> > the 29th. These patches have been through a process that has proceed=
ed
> > much more hastily than I would have liked, and that's lead to where =
we
> > are now.
> >=20
> > With that in mind, less change is better, and so I have decided to b=
ack
> > this patch out. It's a risk-based decision, not a reflection of the =
effort,
> > desires or technicalities involved.
>=20
> Back to where we were before, it's fine as it works.=20
>=20
> The optimize reads are just reading the first 4 bytes :
>=20
> [   14.130480] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
> [   14.136664] aspeed-smc 1e630000.spi: write control register: 001223=
02
> [   14.143326] aspeed-smc 1e630000.spi: read control register: 203c234=
1
> [   14.149750] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
> [   14.181561] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.188894] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.196230] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.203558] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.210751] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.218067] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.225397] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.232722] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.239912] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.247232] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
>=20
> with memcpy_fromio :
>=20
> [   13.779087] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
> [   13.785255] aspeed-smc 1e630000.spi: write control register: 001223=
02
> [   13.791762] aspeed-smc 1e630000.spi: read control register: 203c234=
1
> [   13.798326] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
> [   13.815420] 50 41 52 54 00 00 00 01 00 00 00 01 00 00 00 80  PART..=
..........
> [   13.822759] 00 00 00 1b 00 00 10 00 00 00 20 00 00 00 00 00  ......=
.... .....
> [   13.829946] 00 00 00 00 00 00 00 00 00 00 00 00 50 41 62 cf  ......=
......PAb.
> [   13.837266] 70 61 72 74 00 00 00 00 00 00 00 00 00 00 00 00  part..=
..........
> [   13.844597] 00 00 00 00 00 00 00 01 ff ff ff ff 00 00 00 01  ......=
..........
> [   13.851788] 00 00 00 03 00 00 00 01 00 00 10 00 00 00 00 00  ......=
..........
> [   13.859105] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ......=
..........
> [   13.866433] 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00  .@....=
..........
> [   13.873759] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ......=
..........
> [   13.880951] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ......=
..........
> [   13.888267] 00 00 00 00 00 00 00 00 00 00 00 00 8f de 9d 89  ......=
..........
> [   13.895591] 48 42 49 00 00 00 00 00 00 00 00 00 00 00 00 00  HBI...=
..........
> [   13.902917] 00 00 00 10 00 00 05 a0 ff ff ff ff 00 00 00 02  ......=
..........
>=20
>=20
> I should have added these tests in the commit log. Sorry about that.

Not to worry! Thanks for the data. It paints a good picture of why the
change is desirable :)

> We will see later on. There are no hurries for this fix. Optimization
> is still being done.

Yes. A silly situation all told. Thanks for your effort again.

Andrew

>=20
> Thanks,
>=20
> C.
>=20
>=20
> > So there are lessons in this for me too as I've felt squeezed by the=

> > impact the 4B corruption bug has had on teams testing master, and
> > my impending leave. With that reasoning and 20/20 hindsight I should=

> > probably have held off to begin with. Next time. Some reflection is =
in
> > order.
> >=20
> > Anyway, I hope that helps clarify. Time to resolve the disagreement =
here.
> >=20
> > Milton: Given your protest, can you please verify whether there cont=
inue
> > to be issues with memcpy_fromio() that prevent us from making use of=
 it.
> > As C=C3=A9dric points out we do make heavy use of it anyway, and usi=
ng a
> > well-worn implementation rather than something bespoke for this part=
icular
> > case would improve maintainability.
> >=20
> > Cheers,
> >=20
> > Andrew
> > =20
> >>
> >>> Yeah, I had a briefly nagging thought about this when I applied it=
. I
> >>> should have gone with that gut instinct and inspected it in more
> >>> depth.
> >>>
> >>> Thanks for calling it out.
> >>
> >> I think this needs more thinking and tests. Witherspoon and palmett=
o
> >> are fine. What's the problem.
> >>
> >>> Reverting for dev-5.0, this is an isolated issue (arguably should =
have
> >>> been separated from the current series).
> >>
> >> We have been using memcpy_fromio for reads for a very long time=20
> >> since 4.13 in the Aspeed SMC driver on *all* platforms*.=20
> >>
> >> See aspeed_smc_read() for the "Command mode".
> >>
> >> C.
> >>
> >>
> >>
> >>
> >>>
> >>> Andrew
> >>>
> >>>>
> >>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>>>> ---
> >>>>> drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
> >>>>> 1 file changed, 2 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
> >>>>> b/drivers/mtd/spi-nor/aspeed-smc.c
> >>>>> index 1437732fdea1..7e289ecb1c99 100644
> >>>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> >>>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> >>>>> @@ -796,8 +796,7 @@ static bool aspeed_smc_check_reads(struct
> >>>>> aspeed_smc_chip *chip,
> >>>>> 	int i;
> >>>>>
> >>>>> 	for (i =3D 0; i < 10; i++) {
> >>>>> -		aspeed_smc_read_from_ahb(test_buf, chip->ahb_base,
> >>>>> -					 CALIBRATE_BUF_SIZE);
> >>>>> +		memcpy_fromio(test_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
> >>>>> 		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE) !=3D 0)
> >>>>> 			return false;
> >>>>> 	}
> >>>>> @@ -921,8 +920,7 @@ static int aspeed_smc_optimize_read(struct
> >>>>> aspeed_smc_chip *chip,
> >>>>>
> >>>>> 	writel(chip->ctl_val[smc_read], chip->ctl);
> >>>>>
> >>>>> -	aspeed_smc_read_from_ahb(golden_buf, chip->ahb_base,
> >>>>> -				 CALIBRATE_BUF_SIZE);
> >>>>> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);=

> >>>>>
> >>>>> 	/* Establish our read mode with freq field set to 0 (HCLK/16) *=
/
> >>>>> 	chip->ctl_val[smc_read] =3D save_read_val & 0xfffff0ff;
> >>>>> --=20
> >>>>> 2.20.1
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>
> >>
>=20
>
