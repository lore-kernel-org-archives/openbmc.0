Return-Path: <SRS0=u/Aq=LM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2DDC48BDF
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 04:13:08 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D116D610A5
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 04:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D116D610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lry6kxnz3c20
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 14:13:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=RPPm9BLi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gyK5O4AT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=RPPm9BLi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=gyK5O4AT; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lrR2hwjz2xMw
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 14:12:39 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B8545C00D7;
 Fri, 18 Jun 2021 00:12:36 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 18 Jun 2021 00:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=+uJwmhh6diT3TpOFjIuxMRbVg7wfcAm
 Mz/g5DqxAHbE=; b=RPPm9BLi6B6B2/Jfs5sp5IaYFiLV0ZXmKef9AfNDo1Zubnw
 e/UJDbuTUbT38XPkY4jAW9OsrXlDx2T/Mx55tbrbVj0PjpkpRhMs75uwmRVS8bVF
 AQBuL/ikxFgIjoZOS63M66iyO07s2MIdBHLCDkrr2bJ7r3noTtNSCUoqZXFigxjx
 N/QLUcim+LbVelyTcp6SyjWmdavGcRiwfLeARnFiwgE6jS8XKeyrXLHr/H7fmun7
 QUEl+HCsNDa2kWz3YA4xLoRiH6QPXJlAe0Gcy3pB2w4sE13+3G4A4AaBPeG+D6pD
 yuEXxIiwgtDF0QmJjS/5P82KlJSqKPdSynXOngw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+uJwmh
 h6diT3TpOFjIuxMRbVg7wfcAmMz/g5DqxAHbE=; b=gyK5O4ATJDfUbNhWZFkQUm
 xl8y32ywZOGqFIyqHxIAcxg5I1gXHj8XN4RYJqRFEi02I3IhhzsJuYlVE/4nkEQ4
 7oZ7fk5QM/+HAb1uoFp0RrZTn4xaNxWjOK+T18uwSsbG6hrxkgpfo77czGSSChiI
 CGyqRwJglwjYc/8csEkY/zrWym92aquBBMXemUY6s1pAJ6+JmqT+Jal0ICWSLdiB
 1kRwl1NKR5ZCVGG86sDaaGRoLR2ksiAKfiL+S3hmJLAz/fRN8QIN4GIsK5vKZ5OX
 T+HSZKATeAgP/KMT2hbleEkTZxpwZ1LVzUHAsaGhyzX5aft+sBqOhiYl8YehhSBg
 ==
X-ME-Sender: <xms:Mx3MYFv1fP8l5RCsrRJj2R0disEklBOhGPB0a3VPT6uDHrpNU2JWWg>
 <xme:Mx3MYOdVfm6FHV8mimKt69iobe4YHesjXuTBvpP9I-HgJo8wDMWVbkgzbeZomMwZj
 MkH2e2jVCNFdYZcKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Mx3MYIx1TAdoKYoZRIDJ_B9HaQwYiyxagAH4M-_981dtY0wV9MGv_Q>
 <xmx:Mx3MYMNAHddIjhIlW4uyPRXQ2MxfQ24NCic_kMoxDzDTbeuQsK_ywA>
 <xmx:Mx3MYF-Jq-kB4xGvTgLXfACCQZv5XrfoB1N94PoLW0rs2eZesc96FA>
 <xmx:NB3MYHmBhHrASznHBwNhhIdYfBjTspFoz4YsRD5VX2lRZ3vW7Nlf6g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 384C9A00079; Fri, 18 Jun 2021 00:12:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-526-gf020ecf851-fm-20210616.001-gf020ecf8
Mime-Version: 1.0
Message-Id: <d83a94d5-4e3e-4560-94d2-ea6f19b9e864@www.fastmail.com>
In-Reply-To: <20210618024758.892642-1-joel@jms.id.au>
References: <20210618024758.892642-1-joel@jms.id.au>
Date: Fri, 18 Jun 2021 13:42:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 "Eddie James" <eajames@linux.ibm.com>, "Adriana Kobylak" <anoo@us.ibm.com>
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_0/2]_Store_default_u?=
 =?UTF-8?Q?-boot_env_in?=
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



On Fri, 18 Jun 2021, at 12:17, Joel Stanley wrote:
> This patch adds the u-boot environment to the u-boot binary, and a build
> fix for the new configuration that I have also sent upstream.
> 
> We currently rely on the default environment being populated in the
> image. This has the downside that if something corrupts the environment,
> the system won't know how to boot itself.
> 
> The ast2600_openbmc_mmc.txt is copied from
> meta-aspeed/recipes-bsp/u-boot/files/u-boot-env-ast2600.txt.
> 
> The downside of this approach is we would need to keep the files in
> sync, or change the yocto tooling so the in-flash environment is
> generated from this copy.

I think we just go ahead with your approach here until such time that we get sick of having to manually fix things up. When we get sick of it we figure out how we want to solve the synchronisation problem. What you have here is at least a step in the right direction.

Andrew
