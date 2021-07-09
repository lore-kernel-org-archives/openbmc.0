Return-Path: <SRS0=EwST=MB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA88C07E99
	for <openbmc@archiver.kernel.org>; Fri,  9 Jul 2021 15:12:08 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A70613C1
	for <openbmc@archiver.kernel.org>; Fri,  9 Jul 2021 15:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A70613C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLxTd2g9zz3blf
	for <openbmc@archiver.kernel.org>; Sat, 10 Jul 2021 01:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=XW8q25BW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=qIMQL0bg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=XW8q25BW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=qIMQL0bg; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLxT36NKBz2ysv
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jul 2021 01:11:34 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D04475C0041;
 Fri,  9 Jul 2021 11:11:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 09 Jul 2021 11:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=2In42sV1vrXZWAneknbWr1ACBl
 n2azgx+VuykIY4pGo=; b=XW8q25BWvi6lqGbmeh2DVumBMssOfRjEJ0zRxauMNk
 fy9rrc7OIBWNP+UiRya0ysMagARdwPqJThrbRL0ypAOM4dLegPqBXMU9w0X5wQwB
 YivYKyxUO39dlr+5FkV8RqM43r/Hz9b+bHrsNUt3s/7Q7jJDBAW+g7mS5+RGpxuJ
 KcJQIog1+vppewCG7jEaU9eatY0i8H7rH7Ihf5f8KqSBO54G9dlBrbBgh4Nv9Cnr
 k1DkyGhLtQyYv9+jwCTr4FITD2CT0SVLMbxypOmfykZzC4OCZyiCXVeNYJi5Z8KM
 9wD/LXcSRG35+XCOh5UGIgscIUPPRj/1QM/rbQjPS2TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2In42sV1vrXZWAnek
 nbWr1ACBln2azgx+VuykIY4pGo=; b=qIMQL0bgofodqv27mEMpmTmUf5qfd3mgb
 aglL0KC7JDNSC4TSLe0AHzsMFSV2mQxjfv3h5ZIi/lJDiHPAouRv+YEsz+nHOH0Q
 PzfaQTd5HZHJFO0HfhPqUUhpOuAWfwXREKZIGzUBT35Dz7+opCasWrJT0AZhAimf
 KhIb6MpyJPIgmZ8s6HpsPMTbplWGKXexqYKDe/8TOmuzcJ32vIJvGomzMVTStprm
 O6zpDbGhF8FepRG6Yt8jnM4JsDlt4jNRWw3h9RnyE6Vqs/jWdBTptXeUbpvmuNQr
 Ig9ILVJrfRVrhmrmDoxNAGLFO5nAihEAihXGS0P22ldRzW35e0BUw==
X-ME-Sender: <xms:IWfoYGdsyl3n6iMdUSGSLMGcN2x-rtTrnggLpC44v-jg6FWFKXbVFg>
 <xme:IWfoYAPOflUqawZaZ7e-JBrySagITsscnUxgVMyu9LDl1TgAc31l5iPYkaoo8PYxp
 4Cz-nP8ZkosSWYdSQ>
X-ME-Received: <xmr:IWfoYHjBONBrfqWpAn8cMVqUW8D3LH_JIq1Xc_VsNG0AnIbG-NMSddenDi5oZTeVBP2vCJpRIMEucvdSXG_N6QyfDDF9aQRUDOiwZ9sF1VgOmAPJYjfbvZ9Pg-t27s4HqgkvTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeigdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:IWfoYD-cf1WOei8lUGqRpuVALPIYs3yr0eb6QXHmzxmn98DCL8k-aA>
 <xmx:IWfoYCvlDfYyyQD5RLnFLRV40HRe2MTOBYZuCUPJu8-DDpwWKhQT1Q>
 <xmx:IWfoYKHRWU6ASoqsrFvR1hDzoMBb2aO61RzPJaifdBiHal6nGGL31A>
 <xmx:ImfoYI2VH76VK10qshuSxffA_Sgq0oDWKvwLDbJZYLRwXfgRDdGI0w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 11:11:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] ARM: dts: tacoma: Clean up KCS nodes
Date: Sat, 10 Jul 2021 00:41:19 +0930
Message-Id: <20210709151119.2683600-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Make the Tacoma KCS nodes reflect the configuration of the Rainier and
Everest nodes.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index eb512b202447..677b65195f47 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -880,7 +880,13 @@ &xdma {
 	memory-region = <&vga_memory>;
 };
 
-&kcs4 {
-	compatible = "openbmc,mctp-lpc";
+&kcs2 {
 	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
-- 
2.30.2

