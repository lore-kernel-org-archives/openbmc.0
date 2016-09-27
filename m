Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sk3gz2D8wzDrVT
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 00:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=EsLmmJd9; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Iker5aS7; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1346A206D3;
 Tue, 27 Sep 2016 10:51:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Tue, 27 Sep 2016 10:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
 mesmtp; bh=jRL/Ih3VNZd3XKY9vFWWKePLWUQ=; b=EsLmmJd9ll2S5KID2iHL+
 Spq0RlIfSNTaclnM0U/po2cnKbQjo0hpr8jotg+1zZyUZ1B3SQNGOcWC6LVrl2b7
 j1DU/sXGUsMJrkcVFN08ZsJnVxE/06rSlCBbJGv6PqnVz9gi0OViMxdZLLwbf2pT
 Gp7Lzl9jhqnehE3UvaIR2s=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-sasl-enc:x-sasl-enc; s=smtpout; bh=jRL/Ih3VNZd3XKY9vFWWKePLWU
 Q=; b=Iker5aS74E1gFWvXUTPg4ji0ci8TlYicXPIm7gmDlia/4M8Us7kf5qCtCZ
 et4pCAJkoT6xF23ia3v9deZVpFGSOY9WBL86qnVlg9OCykURlqCIEmIXw9lUjnnB
 r98Koy9CZZVWXJqCMuZudJlw8zwEm/jPhoXkTWInWJfjCN1kU=
X-Sasl-enc: HFTSx+4J4j2peS4N+NKK7qRD3lsaKLw/Eyk2pcz7NgV1 1474987898
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC80CF29CF;
 Tue, 27 Sep 2016 10:51:35 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/8] pinctrl: aspeed: Fixes for core and g5,
 implement remaining pins
Date: Wed, 28 Sep 2016 00:20:12 +0930
Message-Id: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 28 Sep 2016 08:21:03 +1000
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
X-List-Received-Date: Tue, 27 Sep 2016 14:51:43 -0000

Hi all,

The initial Aspeed pinctrl patches implemented a subset of pins for each of the
g4 and g5 SoCs. This series provides a number of fixes to the initial patches,
mostly for issues identified in the g5 driver. The fixes account for the first
half of the series (up to and including "pinctrl: aspeed-g5: Fix pin
association of SPI1 function") and should be applied for 4.9.

The second half, from "pinctrl: aspeed: Enable capture of off-SCU pinmux
state", implements some additional functionality in the core engine for the
Aspeed SoCs and follows up with patches implementing mux configuration tables
for all remaining pins. Given the significant additions in the last few
patches, their lateness in the cycle and the light testing they have received
they are best left for 4.10, but I'm keen to get them out for review.

Cheers,

Andrew

Andrew Jeffery (8):
  pinctrl: aspeed: "Not enabled" is a significant mux state
  pinctrl: aspeed-g5: Fix names of GPID2 pins
  pinctrl: aspeed-g5: Fix GPIOE1 typo
  pinctrl: aspeed-g5: Fix pin association of SPI1 function
  pinctrl: aspeed: Enable capture of off-SCU pinmux state
  pinctrl: aspeed-g4: Capture SuperIO pinmux dependency
  pinctrl: aspeed-g4: Add mux configuration for all pins
  pinctrl: aspeed-g5: Add mux configuration for all pins

 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   36 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c                   | 1098 ++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 1574 ++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c                      |   65 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h                      |   19 +-
 5 files changed, 2737 insertions(+), 55 deletions(-)

base-commit: 8d0a0ac0abcdba5b5d52726055c95f1f6234e85e
-- 
git-series 0.8.10
