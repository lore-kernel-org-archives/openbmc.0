Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s7yTt3wxczDqQp
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 01:13:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MOr2pxlH; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 74so1220369uau.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2016 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=DDW/47nJiSACOd7x/IIUwaly64m1Gh40XioTXFCsrh8=;
 b=MOr2pxlHjvXePeQYL3oJsyEIlYMhefGZk7+V7WuTsXjU4tsH6i9IrCEbmtbupmGPtJ
 WV1fq4XaEFu6LVpLQ18oIAPttJDSXNJ2Ely+c5eZOV91sDKYKdFuOx11bLqJAB/52uEs
 HLCxcf93AEsoP5fPmuugSWPNAJCjh4p0D7CyLUjjeNUge2Dk6jd6IOdWMQhlp9i/Vfx3
 TTCtrdJ+MuvIBo5wEvcF7q/guqWgz6wJjrjKUxxF1UvUfLcNoiodcB1hjjO0OH4JXLK6
 G6bN4UkTM4ufsMj9RLTItH+PNrfcnsDcO5NVVQbmJWlxNnoytnTMCnPZNsRXrjrH7p07
 sb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=DDW/47nJiSACOd7x/IIUwaly64m1Gh40XioTXFCsrh8=;
 b=cFlTRJY4+JkWBlej1fkjSLBmaLu72GveWy7HMPMOQ+7Pzips5r8oT13OcizKwOUWvk
 fXnpGpLjv4qKvInbTK+7Yl1wizWQvfbFwTZfkSUhQct99xiBEBvvlG7RDYFvcm4pFGrs
 q1oWQT+xQHPpKrwaCxlIBdAB2gKqCRmyKMUokHtQ8SPrgCTmZb0IyCMDcFk+I6eOEhTU
 KmwT76Bjmblmfa3fbh/W6WsJ5KPMwspt/mMNEgzDD3vHv1PpVx9GxfKeqJklYEktG3kp
 6NaoP1In0vQcQLCXiC8GZ4gqZk6NZw8oVW7QLBv2AVHM4lSzNpxTzGQJX/TOXjvy+i3F
 7gdg==
X-Gm-Message-State: AEkoousuiJVik0d8iKIxNiPTOrLeRtA2dikimlTPxw0BpOnnfUXZSBeJai5rPiKkB//nSlUoHekZ/tZDgFD7Sg==
X-Received: by 10.31.78.6 with SMTP id c6mr49894225vkb.41.1470755615045; Tue,
 09 Aug 2016 08:13:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 9 Aug 2016 08:13:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Aug 2016 00:43:14 +0930
X-Google-Sender-Auth: HKC3B7y-ukyT0LYs7m2FrAdeV24
Message-ID: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
Subject: Linux dev-4.7 tree: Request for testing
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2016 15:13:39 -0000

Hello OpenBMCers,

I've pushed a new Linux tree to https://github.com/openbmc/linux as
dev-4.7. I intend this to become the new tree used for openbmc's
master branch.

Linux 4.7 contained basic Aspeed SoC support. This tree contains 50
patches atop v4.7 that fall in to four categories:

 * backports of code that has gone into 4.8-rc1
   * nsci
   * ftgmac100 changes for ncsi
   * watchdog
   * irqchip

 * drivers that are out for review
   * pinmux
   * gpio
   * clk
   * clocksource

 * backports of dependencies for the above

 * drivers that require further cleanup and submission upstream
   * i2c
   * vuart
   * ftgmac100 fixes for ast2500
   * bt
   * spi-nor
   * p8 occ hwmon

This represents a lot of work done by Andrew, Gavin, Milton and
myself, with help from Yi, Jeremy, Cedric, Alistair and Ben. Recently
we've had contributions from Xo and Brendan too which has been great
to see.

I will not be rebasing this branch. We will use it for development
until 4.8 is released, at which time we will move to that as a base.
As we move our drivers upstream, each subsequent dev- branch will
contain fewer patches, with the goal being to use upstream as-is.

Before switching the builds over to this tree I would like to have
some testing done. Please give the kernel a spin on your development
system(s) and report back to the list on how it goes.

I recommend testing with the 2016.07-aspeed-openbmc u-boot tree.
Testing on other u-boot versions is welcome, as the kernel should not
be making assumptions about the system state (outside of those that
are required, such as system UART being available).

Please jump on #openbmc at irc.freenode.net and ping me ('shenki') if
you have any questions.

Cheers,

Joel

--
Alistair Popple (1):
  misc: Add Aspeed BT IPMI host driver

Andrew Jeffery (13):
  pinctrl: dt-bindings: Add documentation for Aspeed pin controllers
  pinctrl: Add core pinctrl support for Aspeed SoCs
  pinctrl: Add pinctrl-aspeed-g4 driver
  pinctrl: Add pinctrl-aspeed-g5 driver
  gpio: dt-bindings: Add documentation for Aspeed GPIO controllers
  syscon: dt-bindings: Add documentation for Aspeed system control units
  aspeed-g4: Add syscon and pin controller nodes
  palmetto: Request relevant mux functions in devicetree
  aspeed-g4: Add gpio controller to devicetree
  aspeed-g5: Add syscon and pin controller nodes
  aspeed-g5: Add gpio controller to devicetree
  net/ftgmac100: Separate rx page storage from rxdesc
  net/ftgmac100: Make EDO{R,T}R bits configurable

Arnd Bergmann (1):
  net/ncsi: avoid maybe-uninitialized warning

Benjamin Herrenschmidt (1):
  irqchip/aspeed-vic: Add irq controller for Aspeed

Brendan Higgins (1):
  i2c: aspeed: added support for slave mode

Daniel Lezcano (4):
  of: Add a new macro to declare_of for one parameter function returning
    a value
  clocksource/drivers/clksrc-probe: Introduce init functions with return
    code
  clocksource/drivers/moxart: Add the COMPILE_TEST option
  clocksource/drivers/moxart: Convert init function to return error

Gavin Shan (13):
  net/ncsi: Resource management
  net/ncsi: NCSI command packet handler
  net/ncsi: NCSI response packet handler
  net/ncsi: Package and channel management
  net/ncsi: NCSI AEN packet handler
  net/faraday: Helper functions to create or destroy MDIO interface
  net/faraday: Read MAC address from chip
  net/faraday: Support NCSI mode
  net/faraday: Match driver according to compatible property
  net/faraday: Mask PHY interrupt with NCSI mode
  net/faraday: Disallow using reversed MAC address from hardware
  net/faraday: Avoid PHYSTS_CHG interrupt
  net/faraday: Clear stale interrupts

Jeremy Kerr (2):
  drivers/serial: Add driver for Aspeed virtual UART
  arm/aspeed: Enable VUART driver

Joel Stanley (12):
  gpio: Add Aspeed driver
  net/ftgmac100: Adapt for Aspeed SoCs
  watchdog: Add Aspeed watchdog driver
  drivers/clocksource/moxart: Refactor enable/disable
  drivers/clocksource/moxart: Use struct to hold state
  drivers/clocksource/moxart: Add Aspeed support
  clk: Add driver for Aspeed SoCs
  i2c: Add driver for Aspeed i2c master
  rtc: Add Aspeed AST2400 rtc driver
  arm/aspeed: Add board file
  arm/dts/aspeed: Add dts for all OpenBMC platforms
  arm/configs/aspeed: Update defconfigs

Milton D. Miller II (1):
  mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs

Yi Li (1):
  hwmon: Add Power8 OCC hwmon driver

 .../devicetree/bindings/gpio/gpio-aspeed.txt       |   42 +
 .../devicetree/bindings/i2c/i2c-ibm-occ.txt        |   13 +
 .../devicetree/bindings/mfd/aspeed-scu.txt         |   18 +
 .../devicetree/bindings/mtd/aspeed-smc.txt         |   75 ++
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   63 +
 Documentation/devicetree/bindings/serial/8250.txt  |    1 +
 .../bindings/timer/moxa,moxart-timer.txt           |    4 +-
 MAINTAINERS                                        |    2 +
 arch/arm/Makefile                                  |    1 +
 arch/arm/boot/dts/Makefile                         |    4 +
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |   50 +-
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |  179 +++
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |  147 +++
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi |   28 +
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |   99 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  151 ++-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  168 +++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  524 +++++++-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  358 +++++-
 arch/arm/configs/aspeed_g4_defconfig               |   78 +-
 arch/arm/configs/aspeed_g5_defconfig               |   75 +-
 arch/arm/mach-aspeed/Kconfig                       |    7 +
 arch/arm/mach-aspeed/Makefile                      |    3 +
 arch/arm/mach-aspeed/aspeed.c                      |  225 ++++
 arch/arm/mach-moxart/Kconfig                       |    2 +-
 drivers/clk/Makefile                               |    1 +
 drivers/clk/aspeed/Makefile                        |    3 +
 drivers/clk/aspeed/clk-g4.c                        |  109 ++
 drivers/clk/aspeed/clk-g5.c                        |  189 +++
 drivers/clk/aspeed/clk-uart.c                      |   52 +
 drivers/clocksource/Kconfig                        |    7 +
 drivers/clocksource/Makefile                       |    5 +-
 drivers/clocksource/clksrc-probe.c                 |   22 +
 drivers/clocksource/moxart_timer.c                 |  228 ++--
 drivers/gpio/Kconfig                               |    8 +-
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-aspeed.c                         |  468 ++++++++
 drivers/hwmon/Kconfig                              |   13 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/power8_occ_i2c.c                     | 1254 ++++++++++++++++++++
 drivers/i2c/busses/Kconfig                         |   10 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-aspeed.c                    | 1104 +++++++++++++++++
 drivers/irqchip/Makefile                           |    1 +
 drivers/irqchip/irq-aspeed-vic.c                   |  230 ++++
 drivers/misc/Kconfig                               |    5 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/bt-host.c                             |  427 +++++++
 drivers/mtd/spi-nor/Kconfig                        |   11 +
 drivers/mtd/spi-nor/Makefile                       |    1 +
 drivers/mtd/spi-nor/aspeed-smc.c                   |  567 +++++++++
 drivers/net/ethernet/faraday/ftgmac100.c           |  345 ++++--
 drivers/net/ethernet/faraday/ftgmac100.h           |    3 +-
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/aspeed/Kconfig                     |   24 +
 drivers/pinctrl/aspeed/Makefile                    |    5 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1092 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  682 +++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  373 ++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  562 +++++++++
 drivers/rtc/Kconfig                                |   11 +
 drivers/rtc/Makefile                               |    1 +
 drivers/rtc/rtc-aspeed.c                           |  150 +++
 drivers/tty/serial/Kconfig                         |   10 +
 drivers/tty/serial/Makefile                        |    1 +
 drivers/tty/serial/aspeed-vuart.c                  |  333 ++++++
 drivers/watchdog/Kconfig                           |   13 +
 drivers/watchdog/Makefile                          |    1 +
 drivers/watchdog/aspeed_wdt.c                      |  212 ++++
 include/asm-generic/vmlinux.lds.h                  |    2 +
 include/dt-bindings/gpio/aspeed-gpio.h             |   47 +
 include/linux/clocksource.h                        |    3 +
 include/linux/of.h                                 |    3 +
 include/net/ncsi.h                                 |   52 +
 include/uapi/linux/Kbuild                          |    1 +
 include/uapi/linux/bt-host.h                       |   18 +
 include/uapi/linux/if_ether.h                      |    1 +
 net/Kconfig                                        |    1 +
 net/Makefile                                       |    1 +
 net/ncsi/Kconfig                                   |   12 +
 net/ncsi/Makefile                                  |    4 +
 net/ncsi/internal.h                                |  328 +++++
 net/ncsi/ncsi-aen.c                                |  193 +++
 net/ncsi/ncsi-cmd.c                                |  367 ++++++
 net/ncsi/ncsi-manage.c                             | 1205 +++++++++++++++++++
 net/ncsi/ncsi-pkt.h                                |  415 +++++++
 net/ncsi/ncsi-rsp.c                                | 1035 ++++++++++++++++
 88 files changed, 14353 insertions(+), 191 deletions(-)
