Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Se7DUxfK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jVe5XKm7"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynNq15l9qzDrpm;
 Thu, 30 Nov 2017 14:55:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F34CF20BC9;
 Wed, 29 Nov 2017 22:55:38 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 29 Nov 2017 22:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=wwr35b1XR0dyZZ+f+tBZdRHKlZwWjnsE1POxglNG7
 AU=; b=Se7DUxfKP9rI9NLElJU4SwHVjhhSaOjpIgkF9x8rEgVaC8T3mm0mvleZ5
 6Mla4zAeHyJDOQIn7hC65eOWHTVc+xjXFnFQek6rtSHtwE5ihyWwpMSWU6tDgqOF
 e6guLnxHRtwwUTbKmZNlmUSuxUuqQH97r2qnfemvvnQteScuHDUKimL6y06MHSs9
 sBn5yO865oRQ3yvR0aQJ95Q0F+7JTds6ziq/1fQbdVc4y7lW681SWkePspPy9Z8X
 x33vG7WW63jjHezkWJ/uvIEN8k98elcDLL2WbR16/RBkhvWO9orKnNuChAWhmSLD
 80XRxkWGZGKal5Iv6ZTYNDzimWVqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wwr35b1XR0dyZZ+f+
 tBZdRHKlZwWjnsE1POxglNG7AU=; b=jVe5XKm7DRzH5zKlxx98QluQAAeygChWU
 tGLuZY3r685z3hSxd2d1thW+01JKfibDmLOkTqj4E3qSKa5MMA2J5fJIENItkESk
 J3AEPA1UVOGXkFRHNEM6YyieNX5kUTHHaEC9uIiCvGsUeZV0ZMW1aQX17LWtcl7I
 eB83PY5+XbzbrxDyl0+Fu+rqZUwUXtKNDG4OG75jmhLLIfqVs61IMAx979swRBE1
 vIOjQD+xnv58rr/E5dCW/GC9W15LOzXmNIpBjaJks5RlrZZfYzH1Nom1yOFw2Cm/
 Z6RSgQWZ0JW/FHPaCaH70ci0T+IobBDsO1A0Jr1nZa+dLFzByl5lA==
X-ME-Sender: <xms:OoEfWr943-tMbdNQm8DVHFfePDTnH0p9pIWyFOfuXtJ_uMB8xPdwIA>
Received: from dave.aj.id.au (ppp14-2-29-107.bras21.adl4.internode.on.net
 [14.2.29.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3BD9924738;
 Wed, 29 Nov 2017 22:55:33 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
 robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com,
 joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4 0/2] gpio: Generalise state persistence
Date: Thu, 30 Nov 2017 14:25:23 +1030
Message-Id: <20171130035525.29653-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Thu, 30 Nov 2017 03:55:43 -0000

Hello,

This series provides an API to configure general GPIO state persistence in
gpiolib. Previously, only sleep persistence was considered, but controllers
like one found in Aspeed BMCs also support persistence of state across
controller resets. There is some prior discussion on v1[1] and the initial
RFC[2], and minor comments on v2[3]. v3 addresses minor issues with comments
and debug statements[4], removing remaining references to reset tolerance.

v4 is just a rebase of v3 onto v4.15-rc1, fixing a conflict with the new
PIN_CONFIG_SKEW_DELAY pinconf parameter.

Please review!

Andrew

[1] https://www.spinics.net/lists/devicetree/msg200027.html
[2] https://www.spinics.net/lists/devicetree/msg199559.html
[3] https://www.spinics.net/lists/kernel/msg2635769.html
[4] https://www.spinics.net/lists/devicetree/msg200040.html

Andrew Jeffery (2):
  gpio: gpiolib: Generalise state persistence beyond sleep
  gpio: aspeed: Add support for reset tolerance

 drivers/gpio/gpio-aspeed.c              | 39 +++++++++++++++++++--
 drivers/gpio/gpiolib-of.c               |  6 ++--
 drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
 drivers/gpio/gpiolib.c                  | 61 ++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h                  |  2 +-
 include/dt-bindings/gpio/gpio.h         |  6 ++--
 include/linux/gpio/consumer.h           |  8 +++++
 include/linux/gpio/machine.h            |  4 +--
 include/linux/of_gpio.h                 |  2 +-
 include/linux/pinctrl/pinconf-generic.h |  2 ++
 10 files changed, 124 insertions(+), 20 deletions(-)

-- 
2.14.1
