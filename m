Return-Path: <SRS0=FvJ2=JT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF987C433B4
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 12:30:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 044E461452
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 12:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 044E461452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQxbM06L3z2yx9
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 22:30:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=OOuxfRnM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZMmdoPNa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=OOuxfRnM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ZMmdoPNa; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQxZs4B7sz2xgJ
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 22:30:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 880975C00AF;
 Thu, 22 Apr 2021 08:30:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Apr 2021 08:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :mime-version:content-type; s=fm2; bh=VzH3ajw1oPJNmGgKo4a7jlSupK
 x3dRf3RwHyDVEZaeI=; b=OOuxfRnMdFRA6wHRWPoJ9Fy1W3z8FuCxrGRBAEQxgk
 EBwJ0KXwsIOexh1Yu53rUw9Y7SjD9oR2QSeIeZutfSAsX2v30VqrGV67zFTEGg2h
 3bPIVkSYFQbQ48cmtAuJVt7bLnuY7fPzq1/grIYgNpvM8Qhgc9Nep3j1hUCnj57y
 BsSAh3Mr0t4MSypGxlQCA0jkH4shmEA5fA3AAWgWQzDiYljOpfSj4mC7HuQpy6if
 IftKw/syTZcNEa4tfTGrWsbzbXCvEszzY+g5Hs+LwHdS8j6tcZXXDcOKtVX9p+kH
 cj5ZlQmT8E+3l5BySoQEhr45KAJ+C+elVfCFYUVVVbRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=VzH3ajw1oPJNmGgKo4a7jlSupKx3d
 Rf3RwHyDVEZaeI=; b=ZMmdoPNa5xkG7eCaO1/RbRL5NAGT7QCQ5VUM7yQ8Vu/aN
 lY8beDUFvZOXkvq734OurbEoCusFCDvgfg4cPoLxEBD1HwqwPfSiZksnT/ezKL4i
 SkoSO7aj9VkREt4dm3YDg0bVYWNeN0ZjWcqLTpYIpZ9grs8Xqq3h5sg43wZIUAQr
 CScdRLRsEJtaFoOeXKD73OERhIj12n/gCglzMCHVwcd+WkV73hfuUvwcalN9MuAf
 Ix2+QknmUSvsYujaVLjbsQGBTKYmTBM32mDTXqqeCxhq57hteJ34Ia2go1yCoL46
 HYsxnZVAHPozUF/aREYS07LzRFIQTRz7NGxTkuxAg==
X-ME-Sender: <xms:TWyBYMsu6u7mjBs3mKHbov6XJuapTji7uBtnrgnlhe_NMZLrNBZ3UQ>
 <xme:TWyBYJdq2pQJeea1g4zth_xts_iE2PlFZO-8WS-8kyEyZ4PG6pQidY34ru5VSLGTa
 HiNnZosgiAv3j2YCHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkgggtugesthdtredttddtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegs
 rhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtth
 gvrhhnpedvleduueegveegkeeuiefhkeehledvjeehffffueekhedtffegvdevvdegvdfh
 feenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucfkphepud
 ejfedrudeijedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homh
X-ME-Proxy: <xmx:TWyBYHxkV8lJt_1tGB3L9Pvh7HMm8B7xaUw6RBG_7x5LY9q14SPaQw>
 <xmx:TWyBYPOcsK3kKZSPbPsUSZMys7MWRB7EfCLKSJo8wREmhroriv8syw>
 <xmx:TWyBYM_pfEfiEjkvbMsarJN5J3ZC6guqEdiAwYpRFtFpQ2N39DU6jg>
 <xmx:TmyBYKkztcxJWB34HgymFi13do_UBAf4d4IvhdDOQtKPeAjT078cCw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CC19108006B;
 Thu, 22 Apr 2021 08:30:05 -0400 (EDT)
Date: Thu, 22 Apr 2021 08:30:01 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: edtanous@google.com, Charlotte_Li@asrockrack.com, Jeff9_Chan@asrockrack.com
Subject: asrock rack layer
Message-ID: <20210422123001.fb6knneedeqrfgaz@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

Hi Ed

The folks at ASRock Rack are looking to get a layer added to OpenBMC.  
You already started this here:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40463

You mentioned the device tree needs to be upstreamed - is that the only 
remaining work item?

ASRock Rack team - if you have any questions about how to help Ed (or 
even take over the patch) please ask here - we are here to help!

thx - brad
