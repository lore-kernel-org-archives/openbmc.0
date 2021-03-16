Return-Path: <SRS0=xR9f=IO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44626C433E0
	for <openbmc@archiver.kernel.org>; Tue, 16 Mar 2021 12:56:52 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9016505B
	for <openbmc@archiver.kernel.org>; Tue, 16 Mar 2021 12:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A9016505B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0Cwd3vmfz30JZ
	for <openbmc@archiver.kernel.org>; Tue, 16 Mar 2021 23:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=t/vcpv0k;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Tcp0S0Ou;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=t/vcpv0k; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Tcp0S0Ou; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Cw80n49z2xgG
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 23:56:23 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EB1255C0044;
 Tue, 16 Mar 2021 08:56:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 08:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=K3A
 qWCWpJx+cN+76a1DRqVqnC0mJKJse+dYkEyUQDqY=; b=t/vcpv0kFGN7vB6Alx6
 6Snk2q9V7rYdvS03BzecKeUwWiesGNmbXwrRg37G0HVQJkRdSu6ZXrtXoVHwILRV
 9+7IkwXdzBy0pXrIYK3hNc3RUiOSHXaee4uzngCs8/4iR2VMsb2ozOhWpow6fGaU
 uo3/E124YE+jyHB/+1x4OVWVDYS9ea008gUR2LDk4H2E7xO3yyDOch6YQTE5SNsg
 djLNh6xyKYpLANOPPZCId/3h85a9qJl3dCHdk+4+0K4xrqpjhkFX5dg1a3WKZw7k
 8BowyxCESqmqfqYlyUWwS6C+h1QCHzwmb5TTp2AfKbfvEbxrKpLIRsFOBzEHixQP
 TmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=K3AqWC
 WpJx+cN+76a1DRqVqnC0mJKJse+dYkEyUQDqY=; b=Tcp0S0OufeFKZI886B6gl+
 JU22tfjuuh0t+1KifdXblPJJOvOsdwat6S8Ntnb/2wWIsL9Nq3Aiae7b8mMP96+s
 EutP9EYDMGhav+ZEhXo8QfIxajgKyLMCV+eAYzdxPXMV7o6S5KtGQafvlSiVb954
 thbJkTUGD5JGMQCAuF1rAr1VMXlCeVm0q+eygCtyt/daAoUHJcprNBrl9kznNcgK
 HBcriFx2UEahWKlwEoRJl6Lg1zDU8O1ETuuWhCJo9fAqbY5uX/KQXFYqfTW9iZeO
 y7DQSzpQ/I8SioahkUEu8t0cXDVW6mM/pt9p1v9r8PfJmlYH7TRGJX72cnVMFCLA
 ==
X-ME-Sender: <xms:8qpQYDx70uSjCJC8cHMif4YlmAr5rLNjzki1PPyKMDD2pXFQaDV1Fg>
 <xme:8qpQYLR8nHPCOkf6VMSi1M3rCC-5hS4b5Nohv5-PjxrWDDdnc-fSnMJTk-Wyn3sfQ
 e0NxEDnTZMeOBQ9BOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepgeehjefguedtffetgeeffeehieeljedtfefghfeguefh
 udevjeelfeekjeegieeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
 ejfedrudeijedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homh
X-ME-Proxy: <xmx:8qpQYNUo-9ZVO3fe2yD5mvbC2UwB_jbrmKUCT8CPW_kx9JSBkkhsFA>
 <xmx:8qpQYNgs385x8S8pkHPjALCwo5TS17rmZKQHiMI7iYmXYx3Z_AReQg>
 <xmx:8qpQYFDss3qH2GtrLqaBam2Bz2jAl1VIp3Hte88N-ucecTMq83rivw>
 <xmx:8qpQYC77LQboL9bx_rke0t4pU8YGBr7AgOeWFkDqbxo8ms33NOIgog>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FF1E24005B;
 Tue, 16 Mar 2021 08:56:18 -0400 (EDT)
Date: Tue, 16 Mar 2021 08:56:16 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
Subject: Re: group for foxconn CI  / fii oem repo
Message-ID: <20210316125616.qnu4bxjzh5ub2fzs@thinkpad.fuzziesquirrel.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vveerach@google.com" <vveerach@google.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Mar 15, 2021 at 04:51:50PM -0400, Brad Bishop wrote:
>On Fri, Mar 12, 2021 at 07:25:42PM +0000, Mohaimen Alsamarai wrote:
>>Hi Brad,
>>               How can we create Ci group on gerrit and add people to it
>
>Created fii/ci-authorized and fii/ci-authorized-owners.  Please add
>people to fii/ci-authorized to automatically approve patch authors for
>CI.

Yesterday I learned there is an additional step to get automatic CI 
validation working.  There is a script here that needs updating with 
your fii/ci-authorized group:

https://github.com/openbmc/openbmc-build-scripts/blob/master/jenkins/userid-validation#L42

Can you please add a line similar to all the others but with 
fii/ci-authorized and then submit that for review to 
openbmc-build-scripts on our Gerrit instance?

thanks - brad
