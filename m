Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Vt6heW3b"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HGB+PmMy"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRZPy66dCzDr4H;
 Wed,  1 Nov 2017 15:05:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9831820B9E;
 Wed,  1 Nov 2017 00:05:37 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 01 Nov 2017 00:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=u8ATg5LyvbLK41/wg1pvBN7l3C0asmUl6PBPLx24u
 FI=; b=Vt6heW3b3TK+KO0O3lesPd8RrgurLiuSSA5u9fT0N5aGk25SAX+FQSE+U
 AwzAsoJh5MOwJ19QBh6yZhW2n/7TI5rMMnt4QeRMAwZ3tX1jOo14TxUhzcIwuDnM
 leWH0UvfquYWQiB0iKJlzl3thF+jgugVTfvt5aXUbYRwepb4m/95TchxA9tQvwkR
 vMMbK3MospTfNtahn0tBH0wm8g3AQLdZVG12eizAhm/6oV9BuY4ElEUlkjtzWlmf
 qZ4Y9E1yh52ydKjvYZB/IaQ1EA53oAo37NIBpJ/QZI3r58C0wJLok1WGKp3aWPN3
 o+B0pp3YA6LYMBmOKdQ3qQLLAFx8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=u8ATg5LyvbLK41/wg
 1pvBN7l3C0asmUl6PBPLx24uFI=; b=HGB+PmMyA4m8CFCzsWRrFRKKIskABDMIX
 6irqlrLCy8GYT3FJl7z8DiwHiEwhyDEPAOh4l9LQ0hsRa7cnb1EwLG3b9kLP45g4
 NxRu5dL2N27lW/Cx0sZ/hQxx8Q12zbF7xggYE6g/Fg+CrqquerncxXVN/nNpktQH
 qk93h/bOwxLWqWj6ncLWEnBYM1I0njth/+E7Qe6m/3JV9LDmKD6v2moWB2U5B1LI
 5j4HP9dwg5Flgu1m9E0z/HvMR/FZYsxiy1NocHjty9lQZZ+TGL93C8+YPpzLeX5z
 N9wqvgsErxllTbWPGyV0rmndsMfqMbIvEuXYVikMqOOJhDDFoOf7g==
X-ME-Sender: <xms:EUj5Welc-R3nLjzw4NMyYQg9Y9kWBVavdLHJGhc39HfahtkQrTIOyA>
Received: from keelia.au.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1B507F96B;
 Wed,  1 Nov 2017 00:05:33 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
 robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com,
 joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3 0/2] gpio: Generalise state persistence
Date: Wed,  1 Nov 2017 15:04:55 +1100
Message-Id: <20171101040457.1200-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 01 Nov 2017 04:05:44 -0000

Hello,

This series provides an API to configure general GPIO state persistence in
gpiolib. Previously, only sleep persistence was considered, but controllers
like one found in Aspeed BMCs also support persistence of state across
controller resets. There is some prior discussion on v1[1] and the initial
RFC[2], and minor comments on v2[3]. v3 addresses minor issues with comments
and debug statements[4], removing remaining references to reset tolerance.

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
2.11.0
