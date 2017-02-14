Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMkQ7098hzDqBW
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 11:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WtxC0RKU"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LKwjG+Vu"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6AA2C209F1;
 Mon, 13 Feb 2017 19:51:40 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 13 Feb 2017 19:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=9qSwiLNPq8eqcUeJFzXBBJIgYAo
 =; b=WtxC0RKU/qMyZTl81kAwcpqJzh0Jz9mEJ8wdxsrJYoMGlr7teNGBj/UKF4R
 IAlDupAOLPYEAP4EDAlXnUx5BECCjtdc75LvhrJ9WrmUpuR2T0mxqKFkLLUvNArx
 7Y/9Dt2Qs+xKeJfjmxRawn4s5/rMt9ATzfgzxH+Rg7eWAFpQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=9q
 SwiLNPq8eqcUeJFzXBBJIgYAo=; b=LKwjG+VuKZPrNQesKLZ53ibaYqeorTnk18
 W+gQso16F0G6M2di62Vhgn9hazTu8rrs8aOBy65akX6mvHRRSeX25noUC1UHmg0C
 fI6KfWLDmOmnrITkYOUIykZuf5petGvW00kbEKAcpMOPy2fWlRtlfWZUQru5xnhL
 RmQg2fDZc=
X-ME-Sender: <xms:nFSiWG3-7RTP-i8S075Pbq_2qm4YsFN6FJjs75sf41Djc07u4xSN3w>
X-Sasl-enc: NI1c4ER7cOcotIihcPwbnI/qdl8PLvqPF8A8hztG6l8c 1487033499
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE6097E0D3;
 Mon, 13 Feb 2017 19:51:37 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 v2 0/3] pinctrl devicetree fixes for aspeed-g5
Date: Tue, 14 Feb 2017 11:21:01 +1030
Message-Id: <20170214005104.11940-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Tue, 14 Feb 2017 00:51:43 -0000

Hi Joel,

Testing on Romulus showed warnings on boot from pinctrl about missing phandles.
These phandles are required to ensure full mux functionality on the g5 SoCs.
This series adds the required devicetree nodes and the missing phandles
property to the pinctrl node.

I've confirmed the bug and the fixes using the QEMU romulus-bmc machine.

Cheers,

Andrew

Since v1:

* Set gfx to "status = disabled" in aspeed-g5.dtsi, as the AST2520 removes this
  IP block.
* Define aspeed,external-nodes pinctrl devicetree property in the board dts for
  the same reason.

Andrew Jeffery (3):
  ARM: dts: aspeed-g5: Add SoC Display Controller node
  ARM: dts: aspeed-g5: Add LPC Host Controller node to LPC
  ARM: dts: aspeed-g5: Give pinctrl phandles for gfx and lhc

 arch/arm/boot/dts/aspeed-ast2500-evb.dts         |  8 ++++++++
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    |  8 ++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  8 ++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  8 ++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  8 ++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                 | 14 ++++++++++++++
 6 files changed, 54 insertions(+)

-- 
2.9.3
