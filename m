Return-Path: <SRS0=cMHj=G6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA57C433E0
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 23:45:03 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E7164D7F
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 23:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E7164D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR0Zj2GTwzDr3L
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 10:45:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Fq0qL+ak; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BYVvlsSU; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR0Y21QfvzDq8t
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 10:43:33 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 32B685C01E6;
 Wed, 27 Jan 2021 18:43:31 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 18:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=O6h7SGRrUN5Q1kKkh9ot1d49Jvjy76f
 /orA/FlS1hVg=; b=Fq0qL+aks9tKAGW8tymQhJj2PJdDWkJFSTYLq4ehCKEPRD7
 uIPChq4kb3KZ9nBqeNi3uKOV1qNtpMMC0JBUjJCsy+E5hvxYgYKnCM37BC087QeM
 ggO3tTkTRUoIvvRxdPwdx0A36j1OUzxr6wSsxxVTub/PBn9aexq52s5rQlQHsF12
 nYDOXMZ97PPXDzZiVNqzxTrf0RRMuiI/Z8BYIsr6zedROtzEZ9lXSMzJGdNSOtX3
 ObhKvBOT49QQvNd6N3tW+EGhl/yhtTe8vCnuaitrXdksOwuxUt+tiFoytVUZC43C
 /KdAXIGxrsU2M12p4dnXIaX20DW8GljIkN293bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=O6h7SG
 RrUN5Q1kKkh9ot1d49Jvjy76f/orA/FlS1hVg=; b=BYVvlsSU7tSl8OhxtJOxlM
 DjzPUEAIYBtrlEXE38+07a5dxDQVUk1mFSpDEVOeaQa/N/wfVDkRCOqgVd2eYxgR
 2oh+/9Od4P1P73a3wG6fS8iRQuYGjrZ4bwGqn6vNFj78F+u+GE9g/C5hTvkJ+Uk8
 peekvKxRiDnVsiWZekSK7HPA+mjRM9B78OqqspSWKUAElGlPH02oEJb1r+QS+qe4
 gDMNu1B4YAx28OGu2JV0adc65sbju+11EJ5ciG1eG5KBTpPse9TiGA6MLlvF0kvN
 McD7Q/sWr0j6NxnS4O0GFpo3pWSpFPhZwDbu/OZs5fNN7kCP6SiF9iWQInfsDLAw
 ==
X-ME-Sender: <xms:ofoRYOD737IFDBZDD1-eqoNuegDA9pU0PVzkh01Evemz29uIqqXrJw>
 <xme:ofoRYIiaHyDPdoQxX6zNF_8y_-FQQIKOqBrb2TNvEHl00o4J5WiRLNMip15WQKBcS
 ihJYVBPb3lXoSnr8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeduveejgeeljeetfffgvddutefgvdejudejfefgkeehieettdegvddtieek
 veejieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ofoRYBlUC28Nfime-v41Otc1bt7iVNMdveFyCrGwXX0id20ye2G6MQ>
 <xmx:ofoRYMywUO8YHhNxWwHkN5MZAxNse0lh-iw50s9cOho9GULEbWWMng>
 <xmx:ofoRYDRThoRrKQFts38z5gbz0rtMXJZojJZHB0KqEHLWH1FihnRybQ>
 <xmx:o_oRYKKJCFSwkRso4eB9T4mv4jhadyITYa4X0JYfgqq1LFdUM7w2BQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 70084A0005D; Wed, 27 Jan 2021 18:43:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <d8125f10-b54b-4e0d-a8d6-8e8a83c345eb@www.fastmail.com>
In-Reply-To: <20210127070054.81719-2-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-2-joel@jms.id.au>
Date: Thu, 28 Jan 2021 10:13:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_u-boot_v2019.04-aspeed-openbmc_v2_1/6]_ast2600:_Mod?=
 =?UTF-8?Q?ify_SPL_SRAM_layout?=
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
> The SRAM is 89KB on the A1 and beyond:
> 
>  0x1000_0000 to 0x1000_ffff: 64KB, with parity check
>  0x1001_0000 to 0x1001_5fff: 24KB, w/o parity check
>  0x1001_6000 to 0x1001_63ff: 1KB, w/o parity check, each byte write once
> 
> Allow the image to fill the full 64KB payload size (max that secure boot
> supports) and place the stack at the top of the 24KB of SRAM.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I've pushed a change to github that enables socsec to sign larger SPLs:

https://github.com/amboar/socsec/commit/e28d00cb8278d61b02cb65c320ab4bfa70c79ae1

Acked-by: Andrew Jeffery <andrew@aj.id.au>
