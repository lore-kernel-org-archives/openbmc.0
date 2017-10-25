Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="E2pQLDrc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kshDVCZG"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMJ3W33TyzDqkp;
 Wed, 25 Oct 2017 16:04:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BA99A20A82;
 Wed, 25 Oct 2017 01:04:51 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 25 Oct 2017 01:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=XfEk6yHcAH093R/+ibwLA9m3YzQeaovER9q34DlyB
 lY=; b=E2pQLDrc0l+1T++yxWd5p7pCM5seuByjOCYwitGmd72sxWuVKHNbZcIxT
 x36vvO7+EQsP1RZZ5OY6+iy+WlfiN3tdo1d3mWJjs365C5GDgfQOyaNZc9FZx+VG
 RbD6PWMcLiYHwXuNkN3fCL7jbjCbZlP2lSVd4XvOzUs6HWweyD216660/Zmaj712
 VjHtUAkuxtBxd3Wj6QbFhqdf/dc7f3FmltQuXOmeU+w2AFLKjnMaQLbDsFcputFv
 Y6u5+pC0sLnyLx5PT9r2o1UWOA5n5X2xI2KucDvN8bmZXOmlfQJwvI0suAc1ZYmJ
 cOBhfepUuaWswYcGQCXKL+2mT8sQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XfEk6yHcAH093R/+i
 bwLA9m3YzQeaovER9q34DlyBlY=; b=kshDVCZGNJKVPKfhGgjVim4Zb8Xmc+LEk
 HRiG2lQuVIPjzjv1HqpizWSqSmqOZv0MO4WJZPkJe+/LxAZItCXq75vvYgC7fz+o
 CNspZ6atuGhBeBUQ8McqWrNL6/9N2fkwm9TI3OaaCymdkCpmDIzSpmt5Zl539cyh
 T+XfIqY/Y2p3wEU4gLc3IUK4+2fHOtI5V0UUYpqpruD2Q0x9RINMAK5Mg/RV2SIH
 m5DSL/A+pREu87XgZCOWsMLRq4FtedlBo5jB44N+FN53R/sSkrGGhCtdA5GTiVHo
 i3+EzVcPgMnOyrQNwYb3KFtE6iUtDKSctDhU7e52qcjnlVRLy9aMQ==
X-ME-Sender: <xms:cxvwWclc_SjIWsTtBgjDoDBTy7k7_PkI56MPf1gN0tlubFwPo3bHtA>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B80F24620;
 Wed, 25 Oct 2017 01:04:47 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
 robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com,
 joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, bgolaszewski@baylibre.com, mwelling@emacinc.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 0/2] gpio: Expose reset tolerance capability
Date: Wed, 25 Oct 2017 15:34:15 +1030
Message-Id: <20171025050417.27992-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Oct 2017 05:04:57 -0000

Hello,

This short series enables GPIO state persistence across controller resets,
modifying gpiolib to expose control of the behaviour and providing an initial
implementation in the Aspeed GPIO controller.

This is a follow-up to the initial RFC series[1], which had some undesirable
features (and bugs).

From the RFC, I've:

1. Dropped the idea of distinguishing between sleep and reset cases[2]
2. Changed the default behaviour from transitory to persistent (must explicitly
   request transitory behaviour for controllers supporting reset tolerance)[3]
3. Dropped the ability for userspace to configure whether or not the exported
   GPIO is persistent[4][5]

On point 2, whilst the patch modifying the sysfs interface ABI no-longer lives,
gpiolib-sysfs still requires modification to provide consistent behaviour with
the chardev interface in providing a default-persistent GPIO on export.

Regarding point 3, I figured this is something we can add later once there's
been some discussion on how much of a good idea it is.

As some of the capabilities in the RFC have been dropped, I've squashed the
gpiolib support into a single patch as it's not really that complex.

Hopefully that addresses the feedback on the RFC. Please review!

Andrew

[1] https://www.spinics.net/lists/devicetree/msg199559.html
[2] https://www.spinics.net/lists/devicetree/msg199566.html
[3] https://www.spinics.net/lists/devicetree/msg199574.html
[4] https://www.spinics.net/lists/devicetree/msg199568.html
[5] https://www.spinics.net/lists/devicetree/msg199569.html 

Andrew Jeffery (2):
  gpio: gpiolib: Expand sleep tolerance to include controller reset
  gpio: aspeed: Add support for reset tolerance

 drivers/gpio/gpio-aspeed.c              | 39 ++++++++++++++++++++--
 drivers/gpio/gpiolib-of.c               |  6 ++--
 drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
 drivers/gpio/gpiolib.c                  | 58 ++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h                  |  2 +-
 include/dt-bindings/gpio/gpio.h         |  6 ++--
 include/linux/gpio/consumer.h           |  8 +++++
 include/linux/gpio/machine.h            |  4 +--
 include/linux/of_gpio.h                 |  2 +-
 include/linux/pinctrl/pinconf-generic.h |  2 ++
 10 files changed, 121 insertions(+), 20 deletions(-)

-- 
2.11.0
