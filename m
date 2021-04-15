Return-Path: <SRS0=Tyzw=JM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC422C433ED
	for <openbmc@archiver.kernel.org>; Thu, 15 Apr 2021 13:09:06 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4683461132
	for <openbmc@archiver.kernel.org>; Thu, 15 Apr 2021 13:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4683461132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLfmw4112z3bps
	for <openbmc@archiver.kernel.org>; Thu, 15 Apr 2021 23:09:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=cColL0cq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=REOPmpjs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=cColL0cq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=REOPmpjs; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLfmT00Gcz2xMW
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 23:08:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7E5671216;
 Thu, 15 Apr 2021 09:08:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 15 Apr 2021 09:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=nYf
 Rwgmkj3JJox2uiFEEWUxhqU1UMPnYGfYKgS2y6b4=; b=cColL0cq27S53k+i+C0
 PQVUWc+6YZ4Vwb3kvfLTqaq84WoD2y0f5ssKidmYmB4s+BmQHaOMqz/U0NlZMZ3l
 LIh60thpi5bo09XsMmKN/rU52isZC7vDWpNwvmly/5ho4RST9fiytv8mPRQTjjGZ
 pnYwnXqVPKZlESvvxnFqfWxPZklVQL/Un59+s/8wW+IuUheESctwaedHHd3vfLs2
 DcNYVT10Fv4ZezxDJXjyNxwpRzo/giuyDVv7qawmPjs+lUZJSiDnDwNJtBIfDrvE
 smirhPeFeRJgcwxwy8ePayMClLm/0AMX5swwyTNdD7vosf2mffKLRMkzj0rbhkzH
 xWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nYfRwg
 mkj3JJox2uiFEEWUxhqU1UMPnYGfYKgS2y6b4=; b=REOPmpjsVfuFq6l9mRmZ4w
 7T+pgLC4yCkgzyL1xnORyYI7WC7zeHkCn+tSWP/JIR+q42Rjbv7Y58xgPFG87HhE
 psb1zs1FZ8bI5l3Gbvy4JTURPMG0HvO2m4vdhRTpjVxeH5r6sST4UaeoSI9vbrOa
 EC21TI/iFvISU7oLQ0ErDgjI41AQ5EtnqPXL0a7RmaxuflOhKk7erqpNf7WKt+EZ
 rrGr63CJxfjTZvc0DAjuXLd0vgJGz9BRQFffqt+9zNopxR5v4+8FAmNX1KPsO4Vd
 cPgThwqh0rB3Tgjckn4gYL4wqAddoKdV+HEZjWrtsLhB74Atu6vxcmzQIL4qG3fw
 ==
X-ME-Sender: <xms:1Dp4YBcMXCH_kmPqZuP-JIsMqfzTcC2cyNce_1lv_WoOdshcgGp8kg>
 <xme:1Dp4YPPrN0ZA9CxUWBC-kjWU3CFmurpj6VNyugMlNZJN-UUMOy1RG9GNXV8j1obr0
 fp6OWg-r63_ENm8YZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeeffffhfeehge
 dutddvtdeuiefhudeifeekfeeifeekfedufeeuvedulefgkefffeenucfkphepudejfedr
 udeijedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:1Dp4YKggMFkEsjxqDCHWLA2z7zKfiVT5rHRZxot2s1w04E2_45Om5Q>
 <xmx:1Dp4YK9DmEZEMWReoSiBX9llyjOuWDmBSi-MNzRbN3D4f4ZFWsQj6g>
 <xmx:1Dp4YNvPOz8KjruRiUBpAorqEhoOPHvlnIAxlHo6x-uK3EZFg0jivw>
 <xmx:1jp4YC6KpD9hRo99wKcZUmvl3kms2LJbdW1J52qn4xpYKiXG1US5ng>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id A0F82240057;
 Thu, 15 Apr 2021 09:08:36 -0400 (EDT)
Date: Thu, 15 Apr 2021 09:08:35 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: m10902803@gapps.ntust.edu.tw
Subject: Re: OpenBMC Installation
Message-ID: <20210415130835.bgl3qlql2jzskjl3@thinkpad.fuzziesquirrel.com>
References: <000a01d73108$15144bb0$3f3ce310$@gapps.ntust.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <000a01d73108$15144bb0$3f3ce310$@gapps.ntust.edu.tw>
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

On Wed, Apr 14, 2021 at 04:27:59PM +0800, m10902803@gapps.ntust.edu.tw wrote:
>Hello,
>
>
>
>I want to ask about the program. 

Which program?  OpenBMC is an entire Linux distribution composed of 
dozens of programs.

>Are there still some bugs in it? 

Almost certainly :-)

>I tried to
>clone the repository and run it in QEMU.

Which QEMU target did you use?

>I found that firmware update and network change using GUI always shown error
>message.

What was the error message?

thx - brad
