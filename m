Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vM9Hc3n6DzDqBQ
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:59:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jUf1c7Ox"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hHqPP+JX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CB42A206EA;
 Sun, 12 Feb 2017 21:59:04 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 12 Feb 2017 21:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=8f/RPUB/DSpTtUyXkHUeb1hfqaw
 =; b=jUf1c7OxfMSV7LLicZO0Rxz1txybR1tcibrYUm3tVdyzVa200gjUIoH09MB
 vcr0sm1IPQdO950y0zr+Gd3INF3629NvGgtX76ybW65+eCSIH8N65Wg0Ml0ngDDn
 uRAdAsqFHxf6amvh5TDh5FUx3uUUffPY8C9XPe3os/merw/o=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=8f
 /RPUB/DSpTtUyXkHUeb1hfqaw=; b=hHqPP+JXaRNzhfux5n6ICHDVyX4gj1lcOw
 JdPS0Uud6jodbxNnZN1rmmZhdxwKx3VjL0ijbLrKz77aqvnTAH37PvvBLGTuF4KZ
 6SdIuzlCvndAcyYp8D6bZH4TnwMIkwtFQIwgEXzKwJ4dhG1D03n4I+hKBE19kYN4
 6NzXPx748=
X-ME-Sender: <xms:-CChWI6P4UpvlNJhU2oqji3d7GtCSNyvKHHB_6HqG1ipyzdim0UG_w>
X-Sasl-enc: ZtU1GVC74gRtE6YNC2KZopHmvlauI+dC2dmND9Px2ikl 1486954743
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28B76241E9;
 Sun, 12 Feb 2017 21:59:01 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 0/3] pinctrl devicetree fixes for aspeed-g5
Date: Mon, 13 Feb 2017 13:28:48 +1030
Message-Id: <20170213025851.6051-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 13 Feb 2017 02:59:09 -0000

Hi Joel,

Testing on Romulus showed warnings on boot from pinctrl about missing phandles.
These phandles are required to ensure full mux functionality on the g5 SoCs.
This series adds the required devicetree nodes and the missing phandles
property to the pinctrl node.

I've confirmed the bug and the fixes using the QEMU romulus-bmc machine.

Cheers,

Andrew

Andrew Jeffery (3):
  ARM: dts: aspeed-g5: Add SoC Display Controller node
  ARM: dts: aspeed-g5: Add LPC Host Controller node to LPC
  ARM: dts: aspeed-g5: Give pinctrl phandles for gfx and lhc

 arch/arm/boot/dts/aspeed-g5.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.9.3
