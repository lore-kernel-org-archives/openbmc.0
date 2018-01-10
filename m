Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tkXfoCRq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nSww+P6q"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH3xG34cBzF0gv
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:45:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BDED20CCB;
 Wed, 10 Jan 2018 17:45:01 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 10 Jan 2018 17:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=nUW1AGUn9BNPjGiSkgP2zPYlN7IqswgzigP/2sUR/
 DY=; b=tkXfoCRqNyMmfuvAdarVBSKu80gG0GDt/gLpdtBHSK6k4VkCsTyNleCzC
 DSWkdlF0tBOGYwx7jmr8FmksB271CQjbsqp7jjqe498YkpxmK5m1EkkKcFXN7RpS
 5BgQRC1SmWl9A1Zy6pXIUY/YrDlSuz4KLqwAEjA3hqdQ4/W4mkutm0Zuf32w6viF
 77ej+CNsAxRmTmIIe942T0ENoJIPO0nsvdSJMkcMBN3y9iobEKbUzyVP1TzAHsdD
 D5A4u5Mx6LcWOdyVvKY/8Ht6lpy1qjfB4+FkaAXSC4Ni5o2AZZSDYfvn3u35y90M
 J7BrJx4+lTWzqU77AIipWklnZ+K2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nUW1AGUn9BNPjGiSk
 gP2zPYlN7IqswgzigP/2sUR/DY=; b=nSww+P6q3CBB9L8iwz2fYO7HPyXhUu0fQ
 3fq2RSJkNP3THdVVjMmDTayp0VlXOmSXH06mMy4/vNkElLhJ54aVz8Nh270Mjn4K
 /Kaq1MClJ49XdTQRrxpPygm5/QX5OrM/ryUjSMoGtlzD8jh9OI5adFHcGRqljgx4
 zWh7dz94N98RUdQUU4cKAuZJRefhCuyISgkiLL4lTU2+V4xNvvJZ6a9rGD037ouF
 B4F9RVR3cg7ibMgRFX0rRPbLFDeoFMJDSARciOQqsebGDNhveGS0+qVqr75N0lz3
 1f8QPk+B/qO/LFEVm29EQMCbh8W4y3Musc8Gvgk9Op6XEIg4HcRCQ==
X-ME-Sender: <xms:bZdWWsvQJZNhFbZacwOH30upn00Fam9klS1jNe78MH0c9PNsTaqARQ>
Received: from dave.google.com (unknown [104.133.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id A1ADF24802;
 Wed, 10 Jan 2018 17:45:00 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/4] gpio: Implement per-pin reset tolerance on
 Aspeed
Date: Wed, 10 Jan 2018 14:44:10 -0800
Message-Id: <20180110224414.21516-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 10 Jan 2018 22:45:08 -0000

Hello,

This series backports the upstream commits necessary to enable reset tolerance
for GPIOs on the Aspeed platforms.

Two of the patches come from others, these were useful in the backport to
resolve some of the conflicts.

Cheers,

Andrew

Andrew Jeffery (2):
  gpio: gpiolib: Generalise state persistence beyond sleep
  gpio: aspeed: Add support for reset tolerance

Andy Shevchenko (1):
  gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO

Laxman Dewangan (1):
  gpio: core: Decouple open drain/source flag with active low/high

 drivers/gpio/devres.c                     |  9 +++-
 drivers/gpio/gpio-aspeed.c                | 39 +++++++++++++-
 drivers/gpio/gpiolib-of.c                 |  7 ++-
 drivers/gpio/gpiolib-sysfs.c              | 14 +++--
 drivers/gpio/gpiolib.c                    | 89 +++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.h                    |  1 +
 drivers/input/keyboard/gpio_keys.c        |  9 +---
 drivers/input/keyboard/gpio_keys_polled.c | 11 +---
 drivers/leds/leds-gpio.c                  |  2 +-
 drivers/video/fbdev/amba-clcd-nomadik.c   | 15 ++----
 include/dt-bindings/gpio/gpio.h           | 16 ++++--
 include/linux/gpio/consumer.h             | 27 +++++++---
 include/linux/gpio/machine.h              |  2 +
 include/linux/of_gpio.h                   |  2 +
 include/linux/pinctrl/pinconf-generic.h   | 10 +++-
 15 files changed, 199 insertions(+), 54 deletions(-)

-- 
2.14.1
