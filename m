Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vM9Hj0x6tzDqBQ
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:59:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C9jW1ecx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IxTZD7KI"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AD87206EA;
 Sun, 12 Feb 2017 21:59:11 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 12 Feb 2017 21:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=lkF
 /AhMGperrybd8h5Hba2WGABk=; b=C9jW1ecxq857ljZ9Gvz/kpfbHkPcQx0rV35
 IKJr2NX2Rnpeo2X90DvEK0PJNd0gWon4a28rFqk4IFme2K482gb67diQI0l4vKVM
 lLGpiAlWds6lbFFhbi4hhXP0xzqlm5qNnxqbz/X3+l0RGnGlLS+4c+pR+LWbt5M/
 7PS0xhJA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=lkF/AhMGperrybd8h5Hba2WGABk=; b=IxTZD
 7KIh2TkOtOpqCu3+sMpO0+rXg+wulFYrucnvl/2Z9HF+jF5j8bPX+80nQIbUei6Z
 8D7s72/Xa1fzZwxWS8t/oDyEABPVO6wcQIcI8dSyG25uFO8ugPFDfM5CFwrNMI4G
 Ea0/HULii/naXklqZLXIv4Vp3ZfSQFXrt2kBKA=
X-ME-Sender: <xms:_iChWJhm1qEm-oswnjBGT6rSBDBbXMaiZK5vSey_ZCMO-gLitbdQaA>
X-Sasl-enc: 71dbzYZz+2ZNWMvbsu/QGya2v95yvhwPoBmcjxbdZOBa 1486954750
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DCF02241D7;
 Sun, 12 Feb 2017 21:59:08 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
Date: Mon, 13 Feb 2017 13:28:50 +1030
Message-Id: <20170213025851.6051-3-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 13 Feb 2017 02:59:13 -0000

Required for pinmux, which tests some bits in the LHC's IO space.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

This is extracted from commit cec822f89ec19b181dc02e2a0c6441d107d8b4d9 in the
ARM next/dt tree.

 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5ce0a7a65e77..fcbaa759d523 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -117,6 +117,11 @@
 					status = "disabled";
 				};
 
+				lhc: lhc@20 {
+					compatible = "aspeed,ast2500-lhc";
+					reg = <0x20 0x24 0x48 0x8>;
+				};
+
 				mbox: mbox@180 {
 					compatible = "aspeed,ast2500-mbox";
 					reg = <0x180 0x5c>;
-- 
2.9.3
