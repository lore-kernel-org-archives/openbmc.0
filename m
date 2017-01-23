Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6Kb50ZwYzDqRl
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 16:28:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NijyknmX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eqdZBfSt"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F2CC8212AF;
 Mon, 23 Jan 2017 00:27:58 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 23 Jan 2017 00:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=vyBBGi2nGIF7X6334QklF7R++Ws
 =; b=NijyknmXufPu7crvAmhu2c6YegRTCwRyn+GpN9/G83qlE2GNaNZpBmOyPMd
 8VtVinzUueLI+5muTSWf9DTupJsoRWPE5t001cXvndON+MjcJWj6LeYkrW2mqEdY
 2QgJLVd2kJuLvIzNANowHMe4QXKHDoLeFq1aL6GwbYqC2/hg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=vy
 BBGi2nGIF7X6334QklF7R++Ws=; b=eqdZBfSt2CUXVmfpkQmuqIku9QAdJmzdnB
 gzbsKRI6hnOZrfozab8JGiG1Cp6uDUSRZrmgUD692ojoP2YsUD7kHN8dBSFhM6go
 UMwCITBo/pi+KcfjPmmPdWrrWz4TBqPx3oeWokz4HYTLr8POgq7dLH7Io8mdvxjD
 NPG1HJKZI=
X-ME-Sender: <xms:XpSFWHPH8BLn-IGIsuerq-GiKDYHK3Izh5jgd0sgkfEFPkHbLHAWjQ>
X-Sasl-enc: I3xcWgxXRWn8wUOTkY6te9OZUWnEadWxrNQ9iOhnFJu+ 1485149278
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D7567E0EC;
 Mon, 23 Jan 2017 00:27:55 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH] aspeed: dts: g5: Update GPIO pin range to mux extra banks
Date: Mon, 23 Jan 2017 15:57:45 +1030
Message-Id: <20170123052745.9575-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 23 Jan 2017 05:28:01 -0000

The Aspeed GPIO driver recently gained support for banks Y, Z, AA, AB and AC.
Update the devicetree so GPIO requests for these pins are routed via pinmux,
else the export succeeds but the GPIOs are non-functional.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index b664fe380936..a9305b964b11 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -920,8 +920,8 @@
 				compatible = "aspeed,ast2500-gpio";
 				reg = <0x1e780000 0x1000>;
 				interrupts = <20>;
-				gpio-ranges = <&pinctrl 0 0 220>;
 				interrupt-controller;
+				gpio-ranges = <&pinctrl 0 0 232>;
 			};
 
 			timer: timer@1e782000 {
-- 
2.9.3
