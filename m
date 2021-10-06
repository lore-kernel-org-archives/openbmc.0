Return-Path: <SRS0=fEQp=O2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726CEC433F5
	for <openbmc@archiver.kernel.org>; Wed,  6 Oct 2021 00:26:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD48061186
	for <openbmc@archiver.kernel.org>; Wed,  6 Oct 2021 00:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD48061186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPFd205FYz2yYl
	for <openbmc@archiver.kernel.org>; Wed,  6 Oct 2021 11:26:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=ABHrqi84;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Kcv/HvWd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ABHrqi84; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Kcv/HvWd; 
 dkim-atps=neutral
X-Greylist: delayed 532 seconds by postgrey-1.36 at boromir;
 Wed, 06 Oct 2021 11:25:57 AEDT
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPFc50dc9z2yHX
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 11:25:56 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 674C45C0342;
 Tue,  5 Oct 2021 20:17:01 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 05 Oct 2021 20:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=k/IQwRv8qfE1mjLc6Al2MngjYok6Ej9
 +iWZ9VCxwt78=; b=ABHrqi8424IaQ2UcpLb0SMbtye348GIuYoS8jRaBINURbfL
 U3u8DcfJ/F2mwqE1g1YKMx4FS/KE0degGGNhCfEVi0nHb/FUtNdNpEFmITl6P4Ex
 lkrp1Mn5CHCFdQ7bKn5aypmEANh31VFHHy1ywt3bnwt9y3Jge2nd+L5skK9BMWUa
 0gj22OY0Iod8YtCGPbuFX1Sjq64pr0hcEPTyj9apvvvGJ0XQmVEtzK11GQaTYoaz
 REVUnzCaF0ACQEqK90uR2uGduz9NOVzVvNRfWG2oW6uxR7EsQQS23TFoWc9cPUBn
 aIuqK8ml19l7AxWFkQIJTWnTtFWKLi5UxQYPiaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=k/IQwR
 v8qfE1mjLc6Al2MngjYok6Ej9+iWZ9VCxwt78=; b=Kcv/HvWdmm2lm6veRma7if
 BQosclN390HtKKCUjDN3cgqEmIIMgjnNQjTFW+EiQ1n7c1ZX+T3k//ahBZDWj73H
 C7owdCrHxGw6omk+Dg3F/hsCsuDUwrnVsKr1OGNKgfv7bWv9NYAGD6YUmJ0up7Mn
 WzZLd2glI8+LfJGeoC1HHs8G/tCMMZ0xm/Wv3OOmlr4zCI7b4Fz9cBy7BaBr0BnB
 qdhJDZiZ+OLiTo8IXZ0xAcRPcYWaWKlV2s6gEk5C+QSGQ8UAg0r5WK8cmzZXWij/
 EOCLB8sMaOPjWMKo5kt14FgRiJ4L8I2+hcJiAdk0udMWR/sO47UQ/JgDYiAQahxg
 ==
X-ME-Sender: <xms:_OpcYXrIh79T8_33jM5LWZWj3bYxew6iuZ05DB6t9FIk22s_0EvO-w>
 <xme:_OpcYRoUXG-E_5G9XLIjV9bJrBo0MjTmpeq2FL_xQSGLiVhv-nAYRJRV5THUN01L1
 dHBYs64lujrUTvbMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelhedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:_OpcYUNDnC9JpTJqXeLKTmOQDDEA4CCU_HMLQQpGDVeuo4ZGOEb9jg>
 <xmx:_OpcYa5BngrIlUqmIciiDkKJGuTsbAaANZ5nQzyKWVBJdDX3lLT9Xw>
 <xmx:_OpcYW4PEGGrcRSTwk5onhqcn_V7WWrwB3_oYWjapAgwnR8ygH5wCw>
 <xmx:_epcYR2_OUoULj0bSQvcSywk8uuFRaecqJUYiHomfBrPivzpsk5tqg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9EADCAC0380; Tue,  5 Oct 2021 20:17:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1322-g921842b88a-fm-20210929.001-g921842b8
Mime-Version: 1.0
Message-Id: <ef4d5ac6-49e8-40d6-9e6b-1fe030f3909a@www.fastmail.com>
In-Reply-To: <PS2PR02MB26959672C7002D26EB5F4A4691AF9@PS2PR02MB2695.apcprd02.prod.outlook.com>
References: <PS2PR02MB26959672C7002D26EB5F4A4691AF9@PS2PR02MB2695.apcprd02.prod.outlook.com>
Date: Wed, 06 Oct 2021 10:46:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "naveen moses" <naveen.moses@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: support for gpio  as ipmb sensor 
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 naveen moses <naveen.moses@outlook.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Naveen,

On Tue, 5 Oct 2021, at 23:46, naveen moses wrote:
> Hi All,
>
> we have a couple of gpios ( input ) accessed via ipmb commands in our platform.
> which cannot be directly monitored using gpio monitor.

What do you mean when you say "cannot be directly monitored using gpio 
monitor"?

>
> our idea is to expose them as ipmb sensors which has gpio state as 
> property which is updated based
> on the current state of the gpio.
>
> at present there is no compatible interface under 
> xyz/openbmc_project/sensors for gpio as sensor.
>
> So is this acceptable to create a new interface for gpio state under 
> xyz/openbmc_project/sensors :
> interface name : gpioState
> which has a property named value whose possible values are boolean 
> (true or false).

What about modelling the behaviour the GPIO state represents rather 
than just providing a DBus interface to the GPIO values?

Andrew
