Return-Path: <SRS0=u/Aq=LM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF84AC48BDF
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 04:02:25 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A23261059
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 04:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A23261059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lcc5n1Tz3c0S
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 14:02:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=l32DEDOm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rLIMydfZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=l32DEDOm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rLIMydfZ; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lY71jrpz3c0W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 13:59:23 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 89B1B5C01C1;
 Thu, 17 Jun 2021 23:59:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 17 Jun 2021 23:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=GIg7atdVJMpTa
 9pPfshWYX4/mYLGiJP9aYaj5tqxSmA=; b=l32DEDOmcso8sxzE7r3wfVrF59Apo
 Rhq7JUThih3XfepmMuw7flIS5X+6gEs2Ad7OrPGp/UlDDTjleBBrDDCxUjjaSzv0
 ePb1CWW6PP7jbLtRz7vTUFwtdUcpx8duUJnryMJHsHalLImD/Cw3EzUS1+zAmqAy
 CEXeSKfiP5nFLPySRjm33WpMz2xU6aysFfjWKk2VE5AmCZrCF6ZcmiEFBJWK2NPx
 hnXkqf3uuUTJTuYRlBEXJ1pcuy8N7YWIpNc+NWniVNZXZslYPrzPwTNofmaxW3VP
 CX36VUIxV211602WzF+Q0OMcm/lXk1ApCZ6Iqr5wXvChx4eVxxlHphkjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=GIg7atdVJMpTa9pPfshWYX4/mYLGiJP9aYaj5tqxSmA=; b=rLIMydfZ
 xHVR8V9SJPPn2dZlalq+MF3KwPUkEwBszA+koE/3RknvwOyZVl9c41v0mXkvzRTq
 I+d6GdSIQzXEZ2eqB8sW0jjbdVkbEeS5FPtxKJVWdcO4rmLT43oVgG0/d9o9buaz
 X2cXkpEdmvaSg9PHq41Ldew4UCfpvJ06qXFkziSHXGu1JbL7F/8WwhvGiefm22cm
 zMPehvQtRG4F9qRNZdWuRJKYAgN89/itGIdNHY0Whm2IaSlvZpJJA7wbGqA9Oius
 JUy6YbipLYmPgRU6PHsXUoHTm7EKkXOw45fndZdlx/VIwH8MSJuZeqaMDPDDwNk3
 dQU0N3VpdnZK0Q==
X-ME-Sender: <xms:GBrMYF2RII8uTm0cHjdhx4pywnruWfb-HLhhVLOl2rcalCzKV0QtIw>
 <xme:GBrMYMGOKSMgGfGHxmuvw8crEh3tvbipeZo0GZCsgsNnhwafCuTrwq1Jq7v8Pbr3A
 g9PQawe3niiSQq8bg>
X-ME-Received: <xmr:GBrMYF6GPz73nxzGnQRh9BnjSbYzXeUFz3wmTfe278nZQ_ODjQjf_JMRDU8dOBdRCTjBOBjGrFvlPlirvazY2tRhjsrQhSneBuI68pIp1TXTdjmhcItgsAh6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:GBrMYC0WUDsVGHze0Cazdg3Jj9Gylrw5uOqX99hs5TMub1xRx9islQ>
 <xmx:GBrMYIGjxehpSueGEr2pHaY5ccQsbZqGF-xDYVIShfviWxPBJxhIBQ>
 <xmx:GBrMYD8g38a3GH-CCytQpKW8W1JqIcA9rLshzdOr2bmfABDpPAsdPw>
 <xmx:GBrMYDPRh3AflhJUPFWjrkIA5SLuoy_yTANDVRH-Ek_t4qShy5ywlw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 23:59:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 6/7] ARM: dts: rainier: Switch to KCS 3 for
 MCTP binding
Date: Fri, 18 Jun 2021 13:28:57 +0930
Message-Id: <20210618035858.4024689-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618035858.4024689-1-andrew@aj.id.au>
References: <20210618035858.4024689-1-andrew@aj.id.au>
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

The reset state of the status bits on KCS 4 is inappropriate for the
MCTP LPC binding. Switch to KCS 3 which has a different reset behaviour.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 9ea3864651d6..9d57f9f6a1c3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1780,7 +1780,7 @@ &xdma {
 	memory-region = <&vga_memory>;
 };
 
-&kcs4 {
+&kcs3 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-- 
2.30.2

