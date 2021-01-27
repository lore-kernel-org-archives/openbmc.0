Return-Path: <SRS0=cMHj=G6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C1EC433E0
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 23:47:29 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1687F64D99
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 23:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1687F64D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR0dV2fLvzDqYP
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 10:47:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=CQgupweU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZokICQnU; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR0bt6jHfzDqD1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 10:46:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D27FB5C01EF;
 Wed, 27 Jan 2021 18:46:00 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 18:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=KjXLpjGGbSYLm1g8422/+9yOA7+qjp0
 Xbgxr8u5W06c=; b=CQgupweUpRrV07SWf0bpU3mOOIUqp2dvOV+3tdM8liRi/U7
 XoiuQxHqiy8Rs+yBt9Ri47WfH3BSuU1T91E7LXEgBJJufn7NmyrmM6zG8VgP6iIB
 NUCDGZDbpnCHHhmF9ZyDvVgk/hOABuqyiCtAKcjg3iV9Bjetf6hlw9ITY1/oWeMj
 MkJedzp5xosmmFdCQQRfX4Wmsvx2GzD5wwOpNQrPewu2AbrLRHa0P1ZIjBhxDtEt
 544SuntqL6YYP2qDH9GLt89+PI+FPUuWPBVU72Ac8zcW1PQbuZrMG7ZgzUQUyjmo
 H1eaqWhlt+SxCK5k1RIxbfyG2WCA7NwvWC0srNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KjXLpj
 GGbSYLm1g8422/+9yOA7+qjp0Xbgxr8u5W06c=; b=ZokICQnUuxSSljkTb4dQI0
 iTaF3ElkCAFyWFHju4tJyqhfHas7sxoRp1azBGdO7xod27gxCCMuTT5uI0L/TTHr
 sygvC04QV+77bmIgrTj6eMYd/qgkcgr6XUPfTxfIkNkYMyDPGI/wBMwY3wM3RGl0
 sHvUSd452GSrHomXex4sZClSTK8a1tx7l1wtjJqb6+iP6VrWDPHk7/fF7IvCuwPI
 EyGwj4XzOXtUiB3Hoj8wGs6EOt52K45Wl1kL7xA3JnQzWwGPM9PDi9oyGpsFsoZ8
 4qVhJhDa5//aRgTJM6kF66+rWuevznLyjjJvixkFvLTkZjXpc2sx91ZrB/gub8aw
 ==
X-ME-Sender: <xms:N_sRYINmcg5v-FMnF_EfWasUfl9z84Vdn8z7avRMwTVddJc3hOp5Aw>
 <xme:N_sRYO9ziVGBmbnTorrPfxudNcl-wE9L2XCVL0vbwDGUGqMOd9R79493hORGEkg3e
 t2OF2c9EfjHgKFEbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:N_sRYPRuY08F4ecViHT7z_kQPIv_HRH11uQGy1eYrBtVo7_J72djdg>
 <xmx:N_sRYAvi2Eh-3KMD6YyWIZ86QJxu6ybhHL25dDVOsnhHAhBQqgEOzg>
 <xmx:N_sRYAfl1QefNWRxMbD5eFN9KeYRoqh1HMwk9z8VjluWAAQo3-5TDg>
 <xmx:OPsRYMEDSLRo4Dwy6zx976oHS2TJpzF_5Q-Cz-yC5_E9aZ0t5qsJOQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 24908A0005D; Wed, 27 Jan 2021 18:45:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <aca59b33-0575-406b-b998-7ffe498b7e23@www.fastmail.com>
In-Reply-To: <20210127070054.81719-6-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-6-joel@jms.id.au>
Date: Thu, 28 Jan 2021 10:15:38 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_v2_5/6]_config:_ast2?=
 =?UTF-8?Q?600:_Disable_SPL_ymodem_support?=
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



On Wed, 27 Jan 2021, at 17:30, Joel Stanley wrote:
> This feature consumes 3656 bytes. Without it systems will need to load a
> new SPL over the UART with the AST2600's recovery feature if they flash
> a bad u-boot proper.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

As mentioned in my reply to the cover letter, I think we should drop this one.

Andrew
