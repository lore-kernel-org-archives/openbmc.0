Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDlxn0rtNzDvhT
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 12:36:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="g2gA93uk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LL/9GhAh"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5412320A3C;
 Wed,  9 Nov 2016 20:36:07 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 09 Nov 2016 20:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=PzABENuOypGY5wpfLn79BleB0DY
 =; b=g2gA93ukX05nmTyQjOGyXz/Cy8/hHQ6VG4NsusoH90nw8d0kW3Rn6Uu8U1/
 h1t4Vgnrv7pjl9Cm3RYEsZknhH5vcQdgZEBvf1O9gVw2/6kYAF4uuaJQBJgfnneJ
 ui+dV35LokRXZ8sYR9CYz5Hv8kqJNFRoNsYspgnsWinKlDoo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Pz
 ABENuOypGY5wpfLn79BleB0DY=; b=LL/9GhAhIT2yd/JAfARw9CtmMHgt1XALn9
 CR+BndcwF7lRNdgz5oBm9u/8bjz0nOR2lKTZHYZC4x+4IZtU9WOvoKPx7FRp9dQG
 9bAFc4rGZmAYMly7UAfaYjeehERhCsNjIC1oTA6BnoqqDT1P/s7X1hAImoFvNcRI
 zYdykS/wY=
X-ME-Sender: <xms:B88jWBig9eGYjjD9ya9VNa5RmnpK8DC18d5Nl0zyqdcIP2Z_wgVAIw>
X-Sasl-enc: ZeetcIvtLWO7uPdwOYV4vaQMKlblpjNjFFKEp9HArDAg 1478741766
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B4D9F29CD;
 Wed,  9 Nov 2016 20:36:05 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.7 0/4] SuperIO and Host Interface Controllers
Date: Thu, 10 Nov 2016 12:05:52 +1030
Message-Id: <20161110013556.8542-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 10 Nov 2016 01:36:14 -0000

Hello,

This series adds some sysfs drivers exposing parts of the LPC controller. The
patches are pretty bare-bones in that they provide zero sanity checking and
leave decisions entirely to userspace. They're also slightly tedious, so I
expect (hope) their current form will be short-lived.

Cheers,

Andrew

Andrew Jeffery (4):
  misc: Expose Aspeed SuperIO scratch registers (SCRxSIO)
  misc: Add partial Aspeed LPC Host Interface Control (HIC) driver
  arm: aspeed: dt: Add SuperIO scratch register nodes
  arm: aspeed: dt: Add LPC Host Interface Controller nodes

 arch/arm/boot/dts/aspeed-g4.dtsi |  10 ++
 arch/arm/boot/dts/aspeed-g5.dtsi |  10 ++
 drivers/misc/Kconfig             |  14 +++
 drivers/misc/Makefile            |   2 +
 drivers/misc/aspeed-hic.c        | 198 +++++++++++++++++++++++++++++++++++++++
 drivers/misc/aspeed-scrsio.c     | 141 ++++++++++++++++++++++++++++
 6 files changed, 375 insertions(+)
 create mode 100644 drivers/misc/aspeed-hic.c
 create mode 100644 drivers/misc/aspeed-scrsio.c

-- 
2.9.3
