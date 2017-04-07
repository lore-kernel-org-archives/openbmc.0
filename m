Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w003Z50X6zDqJX
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:57:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="saXJ7/d7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aB9aD3p1"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E05F206FC;
 Fri,  7 Apr 2017 08:57:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=3FJ8eqItLI1WfcGC1aBOpxnTnpYPP2
 aV+ckgbxyy1N8=; b=saXJ7/d7LvkR7dGAPqIn4pVvbi+PxEcFGZ/AkQG92NIYc+
 IAfrNy1McgHDz/dljKA3hJNGlXQZHYgOXo5zQLqOrdjYrSQei3LHNDD1zJZtiNWh
 NZaMYhY5sFklNtz0ITFO6SLcio/dYNbYo88BuC52NFQpSepp/PaS09VAKA6cRlV6
 /hXMyLPzM0E4vfB2rNBNbdf+k6AnoAxY6EauItM/kfQDPzsvx/1DC3ukeCrzahFr
 Sw8Wm4+UCAgY8l4m3H2pt5HcZhMHpGxXHR0Acdyp3ZPSjVFgrFUcPrYEUUII7M3n
 cKXI3uVsDMGDktp4PA9M0nJALtGHZxS1B9WuMVVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=3FJ8eq
 ItLI1WfcGC1aBOpxnTnpYPP2aV+ckgbxyy1N8=; b=aB9aD3p1cV210tA3JsSPPv
 HP+MipYxwBojd6OWfSKDcw4Q42G+7PgvxIzWFOs+FV1YWAZ+lCP0fMj2Aha/8Hx8
 mm3DSD8az4Yh0NWO4Fhnjj09WyiPVkQ0vivvk57arqyPOsKiSbT4Xg1yhc0XrLSo
 oLsGYjPzodqEvOlyTLgagbRfUss4hIeOwqqpfx0sC1sKB1/qDykiABA460pekRUQ
 47hw2YvA+7hxZSedYNGLBolungkAlUUu70Wbn9rHM49AdDWGJv9qao4lvlMu8m3z
 ewnSpiqHpHrzyyphh31bE49OKCYdKEDqei5jlmPNrrDfCsfgabpOtSyCycd+x+/A
 ==
X-ME-Sender: <xms:uIznWGZ39CHOy7eC0XNbVDZIOPnNO3flirTENDMPKDz_DKaPaNPnVQ>
X-Sasl-enc: QEgb9VxJ2nXUO48E61a2swYvskArbQiIWtS4Bh8Li774 1491569847
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id D2E977E669;
 Fri,  7 Apr 2017 08:57:24 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/4] pinctrl: aspeed: Add initial pinconf support
Date: Fri,  7 Apr 2017 22:27:09 +0930
Message-Id: <20170407125713.15678-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:57:32 -0000

Hi Linus,

v2 breaks the pinconf patch for the Aspeed pin controller out into a series,
adding explicit documentation to the devicetree bindings and breaking out
changes to the core from those to the SoC drivers.

The changes also address review comments from Joel.

Cheers,

Andrew

Andrew Jeffery (4):
  pinctrl: aspeed: Document pinconf in devicetree bindings
  pinctrl: aspeed: Add core pinconf support
  pinctrl: aspeed: g4: Add pinconf support
  pinctrl: aspeed: g5: Add pinconf support

 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  40 +++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 117 +++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 153 ++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            | 211 +++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  28 +++
 5 files changed, 538 insertions(+), 11 deletions(-)

-- 
2.9.3
