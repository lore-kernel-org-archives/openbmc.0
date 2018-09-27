Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UXvaYBe/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nrDXGL7J"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LQNS37lVzF33c
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 16:47:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4718222012;
 Thu, 27 Sep 2018 02:47:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 27 Sep 2018 02:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=5F52lyyZfjLBtMYsft8bpn+Bsdc3quKudYaKA4+ce
 g4=; b=UXvaYBe/QQIadmIvrkxNPi8v0Ckotnd8Wa/9YNZoYveR2YO4pk+t1MBPu
 Dmd9/OgyDDxYVKBTQ0mc5eUyy6dANKOXKcw+ogbfF3IS5Uwqfjh35lTNV1UOxrJ3
 MEiwbp0kH8CIS9PoAFD4CQmYMWRbsXt0q9uqQh2RUpup67084fA54LC6zaUUIIvB
 LsvfH/936o7ggaTRrR/J9+lJxYtDUnB5p+VtEDagxzzakt2opbs+LwZk4uycXxR2
 ZlHWNQMmG2dOoRu+YLgXsCQZpZOS8+UvJKH9QVsdKkDWC4vyEedudsif1RxkSWjz
 0+BzOQmJ3lX23Q0nMMLTc7UDKGxYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5F52lyyZfjLBtMYsf
 t8bpn+Bsdc3quKudYaKA4+ceg4=; b=nrDXGL7J8K+nhLqCIesN+RsWdpsE5rLgr
 svrw9a4CTsegTexRKtOFW/0gKLesToFkoG5xwGpQMoumvy9nslUTyCEQaMtNdgtv
 gsD9s4veVezkP9xTf4ohNagMBwzcCcM39WrMLSU1IHkWniwElz01pQ0kPki+itzi
 ZSF2e903UPQWIIJXmcgspE+PDXZc4YgEiIGQS0QDtQkWi9u6aj96AiGpgGIUEgJu
 34iwaO91rWLMG2eJYBc+Tg3pQwLKT9sBTPtlhPXZN37trVWtbMcYRecfrcYfuvVO
 IZr669fR52IQNXXWVvcEhIAbFwvdjheSSIM+nJGWxISctJGdiLmHA==
X-ME-Proxy: <xmx:BH2sW2IdS0UuXvpeMcHvJcx2_j3IGTtr4vegWUxc54KKKKSDTcmYNA>
 <xmx:BH2sW06Ci6X5g-ZIFX_nbfHSFihS7qcj8XeMjGTKay5myt7uE4ntlg>
 <xmx:BH2sW0mMkLH_wlk87BJ6oWcMkvaUgmbr3TwYOHkcQ2NqhQ7f9XxJWw>
 <xmx:BH2sW2Zm52jdF2lXbdpim2zghkV1yB4Ct8NGmnnkdem-ruSoZ37XfQ>
 <xmx:BH2sW5wE7bShvVooGeNeqhvLFKxIL96TFCVQESckOgg5P2l6vA2npQ>
 <xmx:BX2sW_X9syWq-UmdC62PmpmDwTj1OU97nVrlUCPCxCXXHjakizAh4A>
X-ME-Sender: <xms:BH2sW926XiM7Vi2CvRg-clCk8hGqKRGz_jm3YUlM77Vi5OxOh89n8w>
Received: from dave.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 09F6CE405E;
 Thu, 27 Sep 2018 02:47:30 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.18] arm: dts: aspeed: Use ColdFire FSI offload on
 Witherspoon
Date: Thu, 27 Sep 2018 16:16:51 +0930
Message-Id: <20180927064651.3118-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
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
X-List-Received-Date: Thu, 27 Sep 2018 06:47:40 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index f4739ec8051b..b8184c8283d1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -33,6 +33,11 @@
 			compatible = "shared-dma-pool";
 			reusable;
 		};
+
+		coldfire_memory: codefire_memory@9ef00000 {
+			reg = <0x9ef00000 0x00100000>;
+			no-map;
+		};
 	};
 
 	gpio-keys {
@@ -157,10 +162,13 @@
 	};
 
 	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
+		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
-		no-gpio-delays;
+
+		memory-region = <&coldfire_memory>;
+		aspeed,sram = <&sram>;
+		aspeed,cvic = <&cvic>;
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
-- 
2.17.1
