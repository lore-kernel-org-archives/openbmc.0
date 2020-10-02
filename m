Return-Path: <SRS0=Jj5P=DJ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B92DC4363D
	for <openbmc@archiver.kernel.org>; Fri,  2 Oct 2020 06:39:06 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB6B206DD
	for <openbmc@archiver.kernel.org>; Fri,  2 Oct 2020 06:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="W7/5GVaq";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YXrpij+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB6B206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2gLt6r9kzDqcc
	for <openbmc@archiver.kernel.org>; Fri,  2 Oct 2020 16:39:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=W7/5GVaq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=YXrpij+X; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2gGK2cm6zDqGm
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 16:35:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C49228D5;
 Fri,  2 Oct 2020 02:35:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 02 Oct 2020 02:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=pmcqke0rJgtfD
 ftwRhvbuVVxltLD+4H2257Rk9nuVNU=; b=W7/5GVaqCT4ZwlMNHLLcJ0cGzKYuR
 3/2P+ng3C8hpeM+peLBqAHhw1iu2IF2+RW49UaI4/zeffnjqNE6y5JTJD8PENNfN
 r7+iHH1oMsD4ujl18Von5Yq84WbyzJwjy2yX0nqYBaoaMBeekrI+TRhd+GW1ehBP
 HDd31ayNPgUcnj8xydN6EuMU3ovgm8HHIU95L+0DDvzcGcwFcddtfwXghNlrZyeq
 OvqYCBNT7t4ozxqRSe9lSo1JPaxNiHiM1q8XQt65yGcwzY3d+4+BAcyAfejwbQbP
 uDnn84FU9C+a/HxsG/krExMUsv+Yp4GhFoT7w4F838JjFgJl8AqylZ4qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pmcqke0rJgtfDftwRhvbuVVxltLD+4H2257Rk9nuVNU=; b=YXrpij+X
 bhADy+Njh39q9R6KsBGOPGWYqGlqSryabhGYa/G2aUmzlQLL/pnSeBL5aJFbWx4Y
 KCyPTXwtQ8BRWw6xnG6cETi4X2K3CpQls/Ph9t7bNFCO349JGTXrM1jIT4e65273
 MVEM/nCZEeGwyn0gwTB70R6PHozqEKhnwmONglXJY+jEHhfdvch50PRa/aESyFa6
 5UwDZODD8Eb3TGJpqYTYIseJ2/GkI13lww47OKTy5awakMd9GKorfGnTIhGpBruQ
 o3jY0zkjXkkaAEF778g+qfIhr0iwer1fjomDev2j9139mY8Bfisq0ob7A8ttNf6O
 dxg2DS7EpJ9CeA==
X-ME-Sender: <xms:Fsp2X4KMEwYfjcyGv2XDtzaMoBbNZj-y08vjrZfpWzQj2lRq1cYgJA>
 <xme:Fsp2X4K7XbLbogbaC92ZY4892g8I5W85PHI33F-HOSCRAHX1zDG80iGBmEiuNV6C5
 0MFAmVPc6ezkeDMnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeehgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukeekrddu
 jeehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Fsp2X4v6l7fHk7fEwit6CXqfiY05h_doNKQ4pmyvuoMxEmFLJzmVSA>
 <xmx:Fsp2X1b71X2KtZ36z77asau6r5WSvy4XEJM5Cm_O2Te1i6TtmxAQNA>
 <xmx:Fsp2X_YLd1fzSf1zSv1OgkSbkRoWIPfHyBQvWqhf7AY2hRr096YJTg>
 <xmx:Fsp2X50cGX0jcl3Kp9ZuIyh-eURVOBEwygRZW7UeCbOl4l16Ffptzw>
Received: from localhost.localdomain
 (ppp118-210-188-175.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.188.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D9533064688;
 Fri,  2 Oct 2020 02:35:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH 3/3] ARM: dts: rainier: Don't shout addresses
Date: Fri,  2 Oct 2020 16:04:14 +0930
Message-Id: <20201002063414.275161-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002063414.275161-1-andrew@aj.id.au>
References: <20201002063414.275161-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Make them lowercase.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 46a0e95049fd..2e9206b65883 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -55,9 +55,9 @@ ramoops@b7f00000 {
 			pmsg-size = <0x4000>;
 		};
 
-		flash_memory: region@B8000000 {
+		flash_memory: region@b8000000 {
 			no-map;
-			reg = <0xB8000000 0x04000000>; /* 64M */
+			reg = <0xb8000000 0x04000000>; /* 64M */
 		};
 
 		vga_memory: region@bf000000 {
-- 
2.25.1

