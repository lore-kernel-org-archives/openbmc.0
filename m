Return-Path: <SRS0=4IXc=LX=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92707C11F68
	for <openbmc@archiver.kernel.org>; Tue, 29 Jun 2021 17:48:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BED161DD1
	for <openbmc@archiver.kernel.org>; Tue, 29 Jun 2021 17:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BED161DD1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDsQp0cxtz2yQm
	for <openbmc@archiver.kernel.org>; Wed, 30 Jun 2021 03:48:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=P5ZFg6vQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JcksOzg1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=P5ZFg6vQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JcksOzg1; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDsQF5fQNz2yLd
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jun 2021 03:48:04 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 208825C035E;
 Tue, 29 Jun 2021 13:48:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 29 Jun 2021 13:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=pvb
 hP3E37tVVbJqDLTVosCOSvDetI8qx8Hhi85B1SDM=; b=P5ZFg6vQS2Nsmh1iOin
 dzYA9NRcVLxauEfnHG0SK0HbOidR9ZTOqzlts8gqD2P384900SL1rOXSe1xBrE9l
 A2onpVw0bgNUtySTi8xAnhtr650D8P87HAcwBHXErKCjiQ2jXK+gYP4GWeu7aSFI
 qs2aLSrYS1t4d9sdM4f/J9bg3w0SOXdOWHjglsUfmtjhOstnZQaNM3eAViC9+D3e
 S6yKglkl3hY1w/wvxUBENakaH6XwGagMvE7ioN+sAXU2A5JxlVasJmT5i01xNp9E
 jFhRQLtK5kOigYgUyyNAlJe4BP5QWbStJcp9ka7FglqqRBI+l4yG8JCvbd2iX35U
 oQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pvbhP3
 E37tVVbJqDLTVosCOSvDetI8qx8Hhi85B1SDM=; b=JcksOzg17HavzYRddMdVBj
 TenTYdUr2g4x9nOdjN1BZ/ZhtM7borkVVCx4LMBhW18I+38ue+nwHUJEsmI6AHxh
 CvoJPPa74anpFf1mFY8eitXNsR2kxhDVK8c8AdF1U7q7frwCYillB1EuxKcP0JI1
 eZy3KAEz3lHpaxgjM8BHaaHff0CXCuZ8stMCxnf8NC5VnLI5Ub90MuYn/W6yd6FJ
 dg441ZMQMntONJTj0mSCtXzfXSMFx5e9GA4XjGK4Sqh3xUsorW9dATTqxUBycM2A
 JVm+WGj4EWk6IbbxgLotERX+EypQFWVbe+Z0U5ehgJZegVh0RtfUcjE0EdVzABZg
 ==
X-ME-Sender: <xms:0FzbYPLc5muoSpPlsOx-cu8_cG0ukUWF6PGkyYjio-SHJXSIC1Juow>
 <xme:0FzbYDKb2y7wNdNLSOPv6eC0k6joNKdLNjufmzh3_jPzomIghtBqW9KKRLZo5ninB
 W049roqRPj9b46sJy0>
X-ME-Received: <xmr:0FzbYHtYaKZWuome0nOHE60o5iUDVIXFGjxt8ujwu-h4-_uktin1qNPy1opQiAlBYME9SMuDItLx9R_iIARF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeekkeeliedthfdvtdeg
 ueehvddvkeeivddujefhhfevhfdujeeugeefffeltdejtdenucffohhmrghinhepohhpvg
 hnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvg
 hlrdgtohhm
X-ME-Proxy: <xmx:0FzbYIaaMxqFBHi2VuOr9MHQnwB5Xx9iqKr1NFZjtUC4JCZp5j3w5g>
 <xmx:0FzbYGbzmGhX2yFeyDoSE3tp8FXegPBx5YUbmgXrU7IlniE7SncS2g>
 <xmx:0FzbYMDiu0pyr2dx2w4qqpZzQTisC08HYwwSmmNo9I5zq2bH76E-WQ>
 <xmx:0VzbYPDpe5lbRvRDcI9by2TdTR0qhRCUXGFuBxT6GVBktNXTZrPOIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 13:48:00 -0400 (EDT)
Date: Tue, 29 Jun 2021 13:47:58 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ramesh I I1 <rameshi1@in.ibm.com>
Subject: Re: Request for a new repository to enable Hardware Isolation (Guard)
Message-ID: <20210629174758.l7qzm4wrleyjq43n@thinkpad.fuzziesquirrel.com>
References: <OF85E3AFDB.E325A182-ON002586FF.00573D13-002586FF.00574B3B@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <OF85E3AFDB.E325A182-ON002586FF.00573D13-002586FF.00574B3B@notes.na.collabserv.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Jun 25, 2021 at 03:53:28PM +0000, Ramesh I I1 wrote:
>Hi All, 
>
> 
>
>Recently a design document [https://gerrit.openbmc-project.xyz/c/openbmc/docs/+
>/27804] merged to enable the hardware isolation (guard) and it requires a new
>daemon

[snip]

>If New repository means phosphor-hw-isolation (with extension) or
>openpower-hw-isolation?

Hi Ramesh.  I'm guessing a little but this isolating of hardware is 
limited to POWER systems and even if it weren't, the implementation of 
it would very likely highly architecture specific.  Therefore, the 
common parts would be the end user interfaces and given that, I suggest 
you have an openpower-hw-isolation implementation of some optional xyz 
dbus interfaces to connect to the external BMC interfaces.

thx -brad
