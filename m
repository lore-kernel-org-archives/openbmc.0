Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AB1C28D13
	for <openbmc@archiver.kernel.org>; Thu, 25 Aug 2022 13:07:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD3CP5wsRz3bls
	for <openbmc@archiver.kernel.org>; Thu, 25 Aug 2022 23:07:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=Shu7Au1H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=4F5vrCYO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=Shu7Au1H;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=4F5vrCYO;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD3BW6vhdz2xGS
	for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2022 23:06:26 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4DCA8320098C;
	Thu, 25 Aug 2022 09:06:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 25 Aug 2022 09:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661432779; x=1661519179; bh=iinfrsnwqG
	5rGBDWWomEfSYrtyLdKCeucH3Hf949FWM=; b=Shu7Au1Hv/8N2Kf+CS5pc9sUMI
	yZ41Mpv8OpDNdQGaRewA6zGMo/52O3NOtaYXGlV4y67fS7CceHCdGqjGxYmW/gtQ
	Aqs6L0Qd5tpc2syGtpytnCecMjF3ADm+O1p08bJKdgfvHwq6e/W3BqgPfUAjAloA
	XkG2n6WuruiHryIWCqft1DKvm6un8jVxKrVPu23/qf11NhtufQrcJWEM7ENBkAfd
	Pl87SOOTaOXZ0eow404j9KvLnXRX92NdwCK/UXIl03wlntIJkbr3LxPgetmfqOuH
	1GW+wMfDVgdabdU8FXqRM8sz92o7pgt2Mk1IxA1wLr9FCCWvjiu2abXYL/Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661432779; x=
	1661519179; bh=iinfrsnwqG5rGBDWWomEfSYrtyLdKCeucH3Hf949FWM=; b=4
	F5vrCYOCB1ayWodw6x3TJuqe7lGUisZoTTRGju/2DtUz0Jw++jKBy4fVrwpeo4U7
	KCvrARnb+BKgOGvlMsUhR9Q2U1afFx+5w2C5muWgJej6nxK/M176DKjXcRculcEI
	IaufvuBTRpFeQi+slpa1EO+WzJNPuUwohbPJ/QYZx1DctGol6X1xaWgbbTnCfw6y
	SGjRGuj8oO4HpyCzmfHnudjMy0IC0xLFH1GvLiKLaR08cwdxEOjmb8mJFJ7IdjPi
	rzON8p/sYECK5dFMUvYuizdeQivGKYspGywcMLZaA21MKeD8mnwaXz3wXOqKrPJ3
	72yfCca8jZw/+R3ANnZ3Q==
X-ME-Sender: <xms:y3MHY4Im_wXgEy47EukOr40FiG3eoESbVCEqPD2xfODjR230EZj2mw>
    <xme:y3MHY4JNCk7RBaNAel_fwjtoVgg8dEXgDeHVvs49agPw3rYifW27ZgvuBTBHcwEB_
    we_9LJddMdSmntwg00>
X-ME-Received: <xmr:y3MHY4skPqNp2NAwQfMtfAJ3gztUX9Pwwg3QdSxG7g9aNkOmX7ROZPrsidL4YcN7OS6B9ia9X7tamfG1QNvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:y3MHY1bdUdXyS2p6D4RSJLiOpuK1ocZNJGJE0jfXXmsDVWijKVwbog>
    <xmx:y3MHY_ZFQjxAlxofq-llDmY1KERHbo78wQ0E22EJVH6afFYVHw7H0A>
    <xmx:y3MHYxBqwYZUbPThnGIAhxV8ojCQ44ncJkAsiNOqf5pmyDYKUkT2JA>
    <xmx:y3MHY-nbV5FUvtMs-tRo4PQvaSlcROwvr25vMuQjUC7_0IfbSXxjsw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 09:06:19 -0400 (EDT)
Message-ID: <3a78e200967593b319b107c3a31744fd0dbe0bde.camel@fuzziesquirrel.com>
Subject: Re: AMD's Signed CCLA
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>, 
 "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>,
 "'manager@lfprojects.org'" <manager@lfprojects.org>
Date: Thu, 25 Aug 2022 09:06:18 -0400
In-Reply-To: <SN6PR12MB4752077B3255E94D865769EE96739@SN6PR12MB4752.namprd12.prod.outlook.com>
References: 	<SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
	 <SN6PR12MB4752077B3255E94D865769EE96739@SN6PR12MB4752.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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
Cc: "Spottswood, Jason" <Jason.Spottswood@amd.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 2022-08-24 at 19:25 +0000, Venkatesh, Supreeth wrote:
> [AMD Official Use Only - General]
>=20
> Please find the updated signed CCLA from AMD attached.
> Updated CCLA necessitated because of both CLA Manager change and
> Schedule A change.

Hi Supreeth

CCLA accepted.

Thanks,
Brad
