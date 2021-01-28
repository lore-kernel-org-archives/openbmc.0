Return-Path: <SRS0=LnGq=G7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9D9C433E0
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 02:04:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433DA60C41
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 02:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 433DA60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3gL2M5rzDr5k
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 13:04:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=IvNdTe8Z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=EOmBFo0i; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR2dj44hXzDr9M
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:17:45 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 70EE35C0210;
 Wed, 27 Jan 2021 20:17:41 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 20:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=ySm/kI9QkCCBjRE2C2yLmvzO/YQmjro
 MJYukqfjnYtg=; b=IvNdTe8Z7Ncz8TsDVg3FdlgqfEUtcdEtJcUZpeX9f0+29CK
 2xiJTJER6Ta3gku+p1W0FYJhfbjAa5Ai+z9EfnZ+Pw9AyZdNUQR996nmTU3WHbVP
 sdtJgUvR4aeE3McvhxYhTjz8csriHMqWZd2gAxL0yXqYuB1KZyQLrBD5vWaWguHP
 br0KBthyzWtV8GplsL8s4Z4uM6PeX5DeYkuZRU+aY8byCY/O0/rZ053T/eGS4K4F
 3ns41XhXDUbcSP7P119IN18KQVBKr3LBOM+qAftecU29I70uQz0SO8ecUrHMCw7n
 gdsOWPkYuhhd/giM9ZeOM6oZcfjSiyXXaiAG5TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ySm/kI
 9QkCCBjRE2C2yLmvzO/YQmjroMJYukqfjnYtg=; b=EOmBFo0i93cqos7e5Cs1UA
 xv/95j50vkFOOC9+LYtUkKkf0raFaDGcZWjEuEtYS4/aIheQ/V2swZKw4vHTNISz
 eNFBOZ2Jc9+Xa9KTMpquertqFjp7OMqZBO7GxFEz6t++Y+qyJzcux3KOHho7HwZP
 YBZgjaJvHDPobEaimiwPOqldaxv0x9XuuLfOhQGp2x0IXAVmcq6j8M45E0+q0LnG
 nZCXpyp7x483jIvnyaetxKG+ckEBiU81XIW12+RowCZ2Zxva1w4aJ+cwAwFZh8IP
 YJiEceRZPi+VP0NXXo2YwZMmYw+wGENch8vAgdYGLvWnAm3PihfQV+Wd9ZYQAKRQ
 ==
X-ME-Sender: <xms:sxASYNbE3mm_N2ywTb9c7j3kNabt78kRNysO8YO0FF6BXKI80mjkZA>
 <xme:sxASYEYv8ImtiUwpbGbWndzW3WFxyLyQmD8j3Po1Mf0vVF4B-Wv71qwU2RoR5QCPC
 fJuKlpcRMhYvwQY9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:sxASYP9cpcVHjrE_e5KbG8bGYujUjqvgxYFxEHRQBq-R-0up4Nd0dQ>
 <xmx:sxASYLoe7dqKiWb0u7DKfUVTED-0Mcx17ZHQudcvGsxQX1xA27QW-w>
 <xmx:sxASYIr1TBzm8eK4cN2thDJy3V-XHxP9QM-KQlVH2Nmc6iSGou36tg>
 <xmx:tRASYFCH35CHpYO7j7qv4gNCeuxT8VoNZRjtAxLsjA9WwNUMsSpRPw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D70BDA0005D; Wed, 27 Jan 2021 20:17:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <3606723d-d726-4b5d-81b4-fafbf46faf42@www.fastmail.com>
In-Reply-To: <20210128001521.266883-5-joel@jms.id.au>
References: <20210128001521.266883-1-joel@jms.id.au>
 <20210128001521.266883-5-joel@jms.id.au>
Date: Thu, 28 Jan 2021 11:47:19 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_v3_4/4]_config:_ast2?=
 =?UTF-8?Q?600:_Enable_FIT_signature_verification?=
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



On Thu, 28 Jan 2021, at 10:45, Joel Stanley wrote:
> This turns on FIT signature verification for the OpenBMC SPL
> configuration, for both the SPL and u-boot.
> 
> This enables rsa and sha algorithms for verifying the signature of the
> u-boot FIT when loading it.
> 
> FIT_IMAGE_TINY is selected to save approx 3KB from the image size.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
