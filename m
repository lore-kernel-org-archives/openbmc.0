Return-Path: <SRS0=4lcr=NK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351F3C4320A
	for <openbmc@archiver.kernel.org>; Thu, 19 Aug 2021 13:28:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D766113D
	for <openbmc@archiver.kernel.org>; Thu, 19 Aug 2021 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95D766113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr5FM0ngsz3bhk
	for <openbmc@archiver.kernel.org>; Thu, 19 Aug 2021 23:28:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=UKpRMSPy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hnR7bcQK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=UKpRMSPy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=hnR7bcQK; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr5DX08v2z2xgP
 for <openbmc@lists.ozlabs.org>; Thu, 19 Aug 2021 23:27:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C683A5C00A4;
 Thu, 19 Aug 2021 09:27:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 09:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=fMpLFaobkWqwqyeetg5E6nhDhm
 JbA/v4WIz8v4KCgpU=; b=UKpRMSPy0hrNbTGML2UnctJsGOe1UEWEJfO0EQdxdr
 rqcNs668NK8jqc6VONIR2FhL9xdk/t7UUGtrVEalzr0HOqEcATk2GNKgCRe9Zg3I
 QSdmZNEMQYUPSaz+hOjtOnS59jUekkQuS7tZECxm8O7Ntmxf+YU0ulpZhBHgIiQa
 fbXorEg60Pd1H0zuV2ZdkjZ4uKSXZt4aWTn1e+6nOe5ANHI/jTwhQ7E1348XKrdt
 6sG+Yric///78aMukO0IHOh/GsPzx8htmawBgwucJpfqiZJdpPLUcxLe8wFVeVeW
 gUjytSZ4bZG7jlxw/uydP2NCjhbsYPKgNe7/zbjmDzDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=fMpLFaobkWqwqyeetg5E6nhDhmJbA/v4WIz8v4KCg
 pU=; b=hnR7bcQKGowIhSxqhgcB9aNbDpWClnzy73bsLxG6ZFf+qwYZO/DbhDZsm
 1qLorXWV5yqH+SvNsAORVnSaIKixRQ/qtJKlm2nIYFjxyFff5QEbDx5gTjbBju7E
 k6BqlCypVBM0fkXvmfnMq3QqtnQ/bXxleuEaSrSLBCp23G+Ic902GujPTQHrVIwF
 nqqgmS72MAn9MpBAmY2HW/nKc9yFx/x2PhMcr/KuEqwSRaiLzwNJyOHM+rv5nT6b
 sQeGx4KrBRZsjLqYtw7nREhsIW5ZI5a0JdlVhZgrTGpdkaSaYFqaTTBMuYQFDI/8
 wauDXmx0Qb6ivZxcNoNS9qz/lHyyQ==
X-ME-Sender: <xms:VlweYTEDY-9I169WRyQAjRO1_pXlXvEnb2VOIkapFqBQm_XICe2LGw>
 <xme:VlweYQV-KJnGebElwbev6Wl-ciNZbFqiyCbtIi855kkjCMlzZvS9YsdHwjGgd3jlS
 WdNep-q9EFNE7ROUCs>
X-ME-Received: <xmr:VlweYVJ-chEUk1sbXZZk1OQGGKeE4x0ZcIurTojknD0REKVM7xIjI-vxJ3gb6VwF5G7xASM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthejre
 dttderjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedujeefteekge
 eigfegtedtgfejleeluedthefhtefhtedufeekueeiieeffefgteenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuii
 iiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:VlweYRHhuB94WmK6UVENzo1HG5UQyN8Y4-_WrsVyWn-asRmLzRF6-Q>
 <xmx:VlweYZXe3BHMidU1lU2YnmW4Wz-7uQPhcY1bRgy0rr1g7kvvYnZo7w>
 <xmx:VlweYcM_R_PPiDfe1ixA6Z6ZTBhmHeiLIIp28JQPJlOyomG1zOCahA>
 <xmx:V1weYYedahz3SHkZHzvOFDJvEjNa_dBkUdkaAhHW9MeQsH3XE0AsWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:27:50 -0400 (EDT)
Message-ID: <64d95725ad6abd0966b193cee06c9d7e6f5464f7.camel@fuzziesquirrel.com>
Subject: Re: Wistron CCLA Schedule A update 20210816
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Claire_Ku@wistron.com, openbmc@lists.ozlabs.org
Date: Thu, 19 Aug 2021 09:27:49 -0400
In-Reply-To: <ae049cc953614f278f6493ceabd1e208@wistron.com>
References: <ae049cc953614f278f6493ceabd1e208@wistron.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Timothy_Huang@wistron.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, 2021-08-16 at 07:48 +0000, Claire_Ku@wistron.com wrote:
> Dear Sir/Madam,
> 
> Update the schedule A from Wistron Corporation.
> Please help to review it.
> Thank you very much.

Hi Claire - your CCLA update has been uploaded, thanks for keeping it
updated.

-brad

