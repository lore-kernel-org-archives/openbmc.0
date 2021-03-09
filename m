Return-Path: <SRS0=GYqG=IH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9FAC433DB
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 13:58:19 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3084F65141
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 13:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3084F65141
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvxcn3j17z3cJw
	for <openbmc@archiver.kernel.org>; Wed, 10 Mar 2021 00:58:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=LYek1z1m;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=e4sjEUvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=LYek1z1m; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=e4sjEUvf; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvxcK3JQrz2yjD
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 00:57:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2CB19207B;
 Tue,  9 Mar 2021 08:57:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 08:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=TfB
 7/kLTfPtHYEGK7QRBgTOdL8EB+HEIlJ7FvQg6ws8=; b=LYek1z1mwqcj3LyyZVU
 xTak9ujvsS3aQRJc1vQYSZ+jiNqA7gpkAfQfA2ThuWZQzjjPLZCpGpmOMXyFE8X5
 ByRfu5zGQVJ8OxAWx/jAqxT25ZV8r7xCxWpgFseQwtzZZS4b9Z+SfgEl7lbCvwWS
 E/jJYxMhfsimAf7bz1re/Yfq5TRmr65Jk/iqq/0PhIZ/VIYvI7zNWqlfWZMsuZ5h
 t1fwsqAhN/WVSl/O3ZYa7fybBcNDpNYBLo76N8RwgAv010yI3Eoj4Qo0hyy3DKCt
 VYdLhwUxKpY194iVTLCbW5HYEq2C0EfrUTKCe/cj04oPlnjYza3f/U6nw+MbBHiR
 7HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TfB7/k
 LTfPtHYEGK7QRBgTOdL8EB+HEIlJ7FvQg6ws8=; b=e4sjEUvf/A7ThT4jgfupXr
 rF0aGRE/KxjlaXp+KEjGTRDU7/2l9r5lMC8BnZgI7zJG4K7askwdkSEYoUQTW9Xz
 KTFQoFTjk0A8whxp+UxzV00N+GUWZE3Ok9Kv8psDntL6bm6KvTVvhWV9ESGfq3HY
 CmvUhuIvw9ZLc+Geu5x0w1KUufQPzbO5sibR2toVbg7WjNOGFTXiQ+jF1fxDbdfp
 2E1YacYuRyiQ35AKHdfKALDI9ORNUG1nDahAnCz5dbSrysOq74VIJcj+PfLUvpia
 QlzfMJ5HSPUjFIEaslxNrXYZlM6/5q5UCjsxBvWjeoGkjZ20+KjbN399icXYJgjw
 ==
X-ME-Sender: <xms:3H5HYCrHd5nVgfKH1RUT7AO5ieilxHvNeclbPnNw5yXLLYpzMC-Euw>
 <xme:3H5HYAqlnUOm-yL9UAr4WgqBnmUca98PB8GCcwaff2fRYQ5SOg_8wG983AyhXHMQD
 JtUujr8tT_IwoLON8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeekkeeliedthfdvtdeg
 ueehvddvkeeivddujefhhfevhfdujeeugeefffeltdejtdenucffohhmrghinhepohhpvg
 hnsghmtgdqphhrohhjvggtthdrgiihiienucfkphepudejfedrudeijedrfedurdduleej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrg
 gulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:3H5HYHOZ_jSbRSWn2dpVf4jZxADTZTvfKsM-aptIUQ9b9KdOZPzL_g>
 <xmx:3H5HYB4ULMPjk-CmFRnxT9M9RrNLL7IB5ZHGm8px16B8qNkkryKfmA>
 <xmx:3H5HYB5Jw38BP0NQ0z9wu3aFpuKFlbNLp5ixRpNLr6eFyDzwcRr99Q>
 <xmx:3H5HYCWvCSEvnwFb4PrKQJxTMa070jB4KmIui4kzOapGZWdCUqaczA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E0611080059;
 Tue,  9 Mar 2021 08:57:48 -0500 (EST)
Date: Tue, 9 Mar 2021 08:57:45 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Making the "new repo" requests go faster
Message-ID: <20210309135745.vgx3mjwnfnkvilxx@thinkpad.fuzziesquirrel.com>
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
 <CACWQX82OCCAkUzdvKv4pj2YgOL+Y+SifJKAbGOEnZ_MuVyB2+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX82OCCAkUzdvKv4pj2YgOL+Y+SifJKAbGOEnZ_MuVyB2+A@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Mar 05, 2021 at 11:02:24AM -0800, Ed Tanous wrote:
>On Fri, Feb 5, 2021 at 12:02 PM Ed Tanous <ed@tanous.net> wrote:
>>
>> In an effort to fix these issues and more, I'd like to propose
>> creating a new repository for a "new daemon" template.
>
>If anyone is following this thread still, patches have been pushed to
>https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41099 for the
>moment.  As they get closer to approval, I'd like to get a new
>template repo created to house the code contained in that patch, and
>CI setup on said repo if I could.

Thanks Ed!

The only reason I haven't created this already was I wasn't sure what to 
call it.  Any ideas on a name out there?

-brad
