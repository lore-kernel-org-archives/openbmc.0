Return-Path: <SRS0=4h5l=KC=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9196FC433ED
	for <openbmc@archiver.kernel.org>; Fri,  7 May 2021 01:35:27 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB96461106
	for <openbmc@archiver.kernel.org>; Fri,  7 May 2021 01:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB96461106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbtLP3HsCz2yXG
	for <openbmc@archiver.kernel.org>; Fri,  7 May 2021 11:35:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=H0VaL6uA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QJd5Lg4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=H0VaL6uA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=QJd5Lg4V; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbtKs1zbgz2xv5;
 Fri,  7 May 2021 11:34:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 023F35810C7;
 Thu,  6 May 2021 21:34:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 06 May 2021 21:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=c0thzQ1BF7F1omp2k2G1U/AvXAUKLwr
 TwJgBzVRc+88=; b=H0VaL6uAv6Iygud6DgE9x6r8QQlOgIhO4osZNoUT75wePO/
 9HvG7fHM2+IggQF6NK2svK73mMORwZtFucA7gWpIe25deGSmntihiSF53ea9zYRp
 KgMrxffB+Yr2JQ+LX/koWgZbsJekpiZi9TruSPg87j5k0SqUVPHLg2Hw5PXVzm8t
 wc0ZK3t+MgTbJt8TxSiZ5J1nKmDxze8rNPM3r+rg74hgco0HXWQ7BVUMwt/LETWR
 GrgMoLR2kbODeIEwtU9JlLqBo9TghmNJd5oVOO3HCtQxdAKYv/GxOn2MDkavEEJU
 Ytorb0UReFZwXyrYETOIzPNpuc1yAr3rNPP2f6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c0thzQ
 1BF7F1omp2k2G1U/AvXAUKLwrTwJgBzVRc+88=; b=QJd5Lg4V5yCohzdzSlQxoT
 YEtTJ9UjY0qjPl6OFK9AisPA8d8Oo4/VWyBRNXUUqUXP3eja8zGrt9w3ganl3FX6
 uT+Zx6SMiRBZVcZbaQeFtk0mjsdeM3IkvmN3N0b/3+6iLWqiZtuKR3i5gTRkUXOS
 HDMvuWauKpRYw75BYskEnEBdpbgt9lqFxvd5xsfAS0dVlJpvprwKgKZYThL1fwMP
 sU5E7S8blUtVHzr3OtG9KQYHRL27J5dEt+eAsORUGOBSelgNZQh7ow37WOd/gv0O
 5Kz8T1EjbpvCp8y6lUajyJpiCYC7zSMTO5vyBUWROLmL1prsy9ldlBkFrYUZl1cw
 ==
X-ME-Sender: <xms:PJmUYJ7yeYColLJBfPsn5t2znwU7TFOR0gu95ReBrWZX-omugnWqPg>
 <xme:PJmUYG5dhDnEA8uEl8_FdhADkhVuiHBj8Pu91TmrbkUtpssCUStVTbGKzO6xqF4WQ
 J-3w57zSh4eNO1GCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:PJmUYAf0FObHvzQ4Pl-fYpfZHXuM-EhI7V8ACmMYObeeWeZYooVtow>
 <xmx:PJmUYCKdgRfnptvFp48cLIMLLIG_PvgwHNNqASwWfH2ZeyLDxom3zQ>
 <xmx:PJmUYNI3-AiK8HYHSMm3EwFlpXvtyOgjQ5xfX5EEpCbvLKl3Jst4Cw>
 <xmx:PpmUYEYhctyj1T-_4-MgqT54zr564zp-KeeZqCJs2Ah0-I6Hr0GbcA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5C19BA0007A; Thu,  6 May 2021 21:34:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <b67abd65-4919-4de7-8795-b56fe0d36dcb@www.fastmail.com>
In-Reply-To: <20210506100312.1638-4-steven_lee@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-4-steven_lee@aspeedtech.com>
Date: Fri, 07 May 2021 11:04:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>, "Adrian Hunter" <adrian.hunter@intel.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Ryan Chen" <ryanchen.aspeed@gmail.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_3/5]_ARM:_dts:_aspeed:_ast2600evb:_Add_phase_cor?=
 =?UTF-8?Q?rection_for_emmc_controller.?=
Content-Type: text/plain
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



On Thu, 6 May 2021, at 19:33, Steven Lee wrote:
> Set MMC timing-phase register by adding the phase correction binding in the
> device tree.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
