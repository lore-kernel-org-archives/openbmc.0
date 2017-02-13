Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vM9Hl3jJTzDqGW
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:59:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PzqDXAYN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="POnkXG/S"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DD8420692;
 Sun, 12 Feb 2017 21:59:13 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 12 Feb 2017 21:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=qlk
 ZKMVUIFo94ht0VU61/s/EB1U=; b=PzqDXAYN5TlVHRSjgFlz1FCW6gtnAHNow+s
 Q17tKlQhG5CHd+b2zoL9kVYNDYg93LSRDbErLv8U5AdfEwKEqj0+c+c2ceOmkF7R
 RMm1U6EmKd7OlI0xT8cJH6F/gMU+43ObOWuH/CtmbUWEtkIlZYPbDrY6E1pqqsTE
 JmG8tPHU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=qlkZKMVUIFo94ht0VU61/s/EB1U=; b=POnkX
 G/STRE0pqeZ7vEpcra0kmdcMVj/BHlX5wEg3cjnLpDVB0er5u273PyVdD8QUaDc5
 AByfwTfPLS78/SHmFIQwJMkZFJajl8NNLyOTs03KxnfJGG/s5Fc70g5dxM59YZG9
 rLsTaL72vOZB76jgv3TWP+o01eWO0p4BMEA6iM=
X-ME-Sender: <xms:ASGhWNRCFZlIxlx6GwUhXLiEiav4T9fzNedygayKHhcaHe5HfU8qiA>
X-Sasl-enc: k0Zr8x1nRS7qSX1G72cJpGsYyZ7h1OTRmgkoOXO0ODim 1486954752
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B9DF241D7;
 Sun, 12 Feb 2017 21:59:11 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 3/3] ARM: dts: aspeed-g5: Give pinctrl phandles
 for gfx and lhc
Date: Mon, 13 Feb 2017 13:28:51 +1030
Message-Id: <20170213025851.6051-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170213025851.6051-1-andrew@aj.id.au>
References: <20170213025851.6051-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Feb 2017 02:59:15 -0000

The g5's pinctrl reported:

[    0.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: No GFX phandle found, some mux configurations may fail
[    0.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: No LHC phandle found, some mux configurations may fail

as the aspeed,external-nodes property was missing from the pinctrl
node. Fix the mux capability by adding the required phandles.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

This is extracted from commit b590c8d2eed5748dfe52c4fc13df6cadb1b56d58 in the
ARM next/dt tree.

 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index fcbaa759d523..cff11868a136 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -174,6 +174,7 @@
 
 				pinctrl: pinctrl@1e6e2000 {
 					compatible = "aspeed,g5-pinctrl";
+					aspeed,external-nodes = <&gfx &lhc>;
 
 					pinctrl_acpi_default: acpi_default {
 						function = "ACPI";
-- 
2.9.3
