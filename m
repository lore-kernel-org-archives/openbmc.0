Return-Path: <SRS0=YSNb=JZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD8DC433ED
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 01:08:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B18613EA
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 01:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B18613EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVL9s0Mxzz2yZB
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 11:08:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=ppC0UUg5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VqBO5a+5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=ppC0UUg5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VqBO5a+5; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVL9L3nSdz2y81
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 11:08:21 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C5B65C00ED;
 Tue, 27 Apr 2021 21:08:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 27 Apr 2021 21:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=LrQ
 XHeyc3rrUKK3o4gbr+eoxm1hDMXESYU8Du1XnV4w=; b=ppC0UUg5cFXidnQFL27
 i3+SOFvSUq5Y2pJOjMBhYrJpXLXXVdLc7SD8b+kcCaSgbBpPIKgactTuj/whPcbN
 S2UvtbgaOS6pOeKo3I+jjXp0oQnwk8ifkY+53i8oeizXhwaNjsYU5pfCW05pS+rY
 BkCQ0d/QMYFTc/NaJbbTMtKcQJok/RjQHXr68vXGDRCuHKCrNdYWlR1eYkzXk0Hx
 AkfSTZ5nroKa4UpEOT8TBLGcjyl8YRl659/fvltqk3IF18YDNvCicwQz6/agcIuB
 +TVdWC8Tlf9dx5YuwUHNJSp/xSPOR+rxvDfMggTOxNc6Ebd0KAM9mSLVpoS6cAy5
 NOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LrQXHe
 yc3rrUKK3o4gbr+eoxm1hDMXESYU8Du1XnV4w=; b=VqBO5a+5AM4DIUFAsO5ftK
 T9rNJl+jAJcsq2Ic24oQIbRdSzWwE98gg4O1+DxCUXMWHy6yX3FGmILFCh2Bt0P+
 g3Eg9w/kGi3SeMfjkDtDCzbt/8xKFFtfSbZ5TPdDhYdsaYIXGTX/iAlOd4o3gwUq
 qOehnDRTleucjXGRISngUHHUbr6QbCzCvGPqTJFjywEqdJRORlSHnp2ONIT8KW/o
 ctR6QqMeiyVx/m0cBD383Da/1fRMV7Qdx1XyNPiowJuRjibnDhd8kdGjm+2RH57t
 2OHmBd4rlWtVw3ES/+3zHwN1ZX8wEXwLNcTcJPVNH5DDF/2p8TBmmEfJtR+0C27w
 ==
X-ME-Sender: <xms:gbWIYFzcg4uAgyVCNOQrnOpsXzIBObpU42qebINit30kI7HOkEacWw>
 <xme:gbWIYFSX5RPbP1NvPQCVpbyqQnVOdRWHG1G5jFtiMJS3qEO46ofranS25hYTGtibb
 xuz5KZz2LTum-J1f7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvuddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:gbWIYPU-hw8xTv0v3pFypxhFbLY78qt8gqjCwavBEeNalAMx3pTkKw>
 <xmx:gbWIYHhY5eN1C7_8vRKE7VKpnMlKmjFPBbqMtFsCB0DQYug6xTFvZw>
 <xmx:gbWIYHA_BvFPuooo3jepr_7m5dtupBPJ2M3QLvEKGGxBvtLjQIo-Xw>
 <xmx:grWIYKplP20DsqttyUMd3EVSlTuVMdTDzCXa-JDaPhXp4_LJQUknxA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 27 Apr 2021 21:08:17 -0400 (EDT)
Date: Tue, 27 Apr 2021 21:08:16 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Subject: Re: phosphor-hwmon-maintainers group
Message-ID: <20210428010816.oeumsvfwb6kyu5fq@thinkpad.fuzziesquirrel.com>
References: <CAO=notybt0NeU6N2QFmPFv8bOs3fxHrT_+KVGZyuRJeyCGqxcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notybt0NeU6N2QFmPFv8bOs3fxHrT_+KVGZyuRJeyCGqxcg@mail.gmail.com>
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
Cc: Brandon Kim <brandonkim@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Apr 26, 2021 at 12:52:09PM -0700, Patrick Venture wrote:
>Brad;
>
>Matt Spinler and I are in the group phosphor-hwmon-maintainers, but
>neither of us in the group are maintainers of the group, so I cannot
>add "brandonkimbk" who is taking over my responsibilities on this
>repo.  Can you set Matt and myself as Maintainers in the group, and
>then I'll add Brandon and remove myself.  Or you can.

Hi Patrick, I've added the maintainer role, thanks!

-brad
