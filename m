Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="p8jYcgps"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OW0r047j"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhf2T01zDrK8
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BC41620D5F;
 Tue,  7 Nov 2017 02:31:24 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DRMrmO+fEwwjZBqTAt5qOfoBBCZ1lcpYl39FHDDjXGc=; b=p8jYcgps
 kjT9wOEyRDVCnOooeDzOksSiXd7L9YwRbsFk/skeXY6hsYVOdR/TSipQtKYc71R+
 eAOhgcw5GLGOj+Y2U7JrjELWQCD8vPmp4+JG/mDzlr6ywx2cuaVhJyEvHOAC4lZ0
 vyFgrPS8rpVNu2s5yrhFy5QReorYfDVbjd7kZrsDYjHeGuYz5y68Ewo1hr1s19aH
 /w+phhpQs2FvBZdLgwjAGIS8uSt34hpPwO57VeobyLpiq9LMfmp2V4ia78Nw984O
 q7hSzV+63pO5G+TBHSJb+EBMv4Kf618GmFMnDzdKGzyb/YoOQWJFTPNPsV07dpKs
 0r8M9lFzl/vQNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=DRMrmO+fEwwjZBqTAt5qOfoBBCZ1l
 cpYl39FHDDjXGc=; b=OW0r047jBLhtci8rpKYEeftQM3R8g4MI/HHPMT87/TL3D
 gvMuEs/2G1wsEfujqVa1JL8v3g3saVGx5q/fGV4HQBG32zGownvSl407tBl4um+5
 U8FUPX9OyM0h1gk8Yf8Wvm15KxOnJ6oSvoCbB1nbCeEBD5h2aBSt367lbfeegieI
 fWS4Ouv9LYAPr9hxB+9rMqHsetu3tHf97Ukl8TcLawS5sh6Kb9FuRW3V3FkArXKU
 2cSiydfY8LMUQnyhYpEsqIGIan4d+PVFxLYYitJbUdSa+5TrLddnIU0+iiINBNXv
 wsgZoaE2IeZ8qfvmSaoDbttmcTT9mNjCeTqThzmEA==
X-ME-Sender: <xms:TGEBWhG6prvdjPGiNw254OdrnQ1vMd6wyhRqCBPnmYT-WLX54dF-Ig>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20E8B24108;
 Tue,  7 Nov 2017 02:31:22 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 00/23] Migrate changes in dev-4.10 to dev-4.13
Date: Tue,  7 Nov 2017 18:00:23 +1030
Message-Id: <20171107073046.13319-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:33 -0000
X-List-Received-Date: Tue, 07 Nov 2017 07:31:33 -0000

Hello,

This is a patchbomb series partly to instigate discussion about how to do this
kind of thing in the future, but also to bring most of the changes I'm
responsible for in dev-4.10 forward to dev-4.13 where appropriate.

The series brings, along with their dependencies:

* The MAX31785 driver
* LEDs enhancements and fixes
* Watchdog enhancements and fixes

Patchbombing like this probably isn't the best thing to do, so we should
probably figure out what is. The approach - rebasing the dev-4.10 stack on
dev-4.13 - seemed to me the easiest way to get the result of having all my
patches up to date where possible, aside from some effort spent cherry-picking
back those which are now upstream but are so beyond 4.13.

It might be slightly less of a patchbomb to split this into smaller
series, which is a bit more fiddly but nothing major. Arguably the end result
is the same as a single series, as the patches themselves are still consumable
on an individual basis.

Another approach is sending some mail detailing the upstream commit IDs to be
cherry-picked back, and further mail for any remaining patches.

Regardless, we need to consider how the OpenBMC-Staging-Count tag is managed in
any case. I haven't fixed the tags in the patches I'm sending here - I figure
it's up to the maintainers to bump that as appropriate when they apply the
change.

Which approach should we take?

In the mean time, here are the patches for your viewing pleasure.

Andrew

Andrew Jeffery (16):
  ARM: aspeed: g4: Add LPC devicetree node and children
  ARM: aspeed: palmetto: Configure mbox and lpc nodes
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  hwmon: pmbus: Add fan control support
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
  pmbus: max31785: Work around back-to-back writes with FAN_CONFIG_1_2
  dt-bindings: leds: gpio: Add optional retain-state-shutdown property
  leds: gpio: Allow LED to retain state at shutdown
  ARM: dts: aspeed-palmetto: Request mux as per strapping configuration
  dt-bindings: watchdog: aspeed: External reset signal properties
  watchdog: aspeed: Support configuration of external signal properties
  leds: pca955x: Don't invert requested value in
    pca955x_gpio_set_value()
  watchdog: aspeed: Retain watchdog enabled state
  watchdog: aspeed: Fix 'Apseed' typo in Kconfig
  watchdog: aspeed: Remove specific reference to AST2400 in Kconfig
  watchdog: aspeed: Move init to arch_initcall

Christopher Bostic (2):
  drivers/watchdog: Add optional ASPEED device tree properties
  drivers/watchdog: ASPEED reference dev tree properties for config

Cédric Le Goater (5):
  dt-bindings: leds: add pca955x
  leds: pca955x: add device tree support
  leds: pca955x: use devm_led_classdev_register
  leds: pca955x: add GPIO support
  leds: pca955x: check for I2C errors

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 123 ++++
 .../devicetree/bindings/leds/leds-gpio.txt         |   3 +
 .../devicetree/bindings/leds/leds-pca955x.txt      |  88 +++
 .../devicetree/bindings/watchdog/aspeed-wdt.txt    |  40 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  18 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  38 +
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 762 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 222 +++++-
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/leds-gpio.c                           |   7 +-
 drivers/leds/leds-pca955x.c                        | 343 ++++++++--
 drivers/watchdog/Kconfig                           |   4 +-
 drivers/watchdog/aspeed_wdt.c                      | 149 +++-
 include/dt-bindings/leds/leds-pca955x.h            |  16 +
 include/linux/leds.h                               |   2 +
 18 files changed, 1779 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
 create mode 100644 drivers/hwmon/pmbus/max31785.c
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

-- 
2.11.0
