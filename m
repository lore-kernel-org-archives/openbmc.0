Return-Path: <maxims@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcl28YhzDqY5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v6OLTPdy"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id x63so24676777pfx.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0merasIJ/Z6fow3Dwt5TAYovpOrX2AjSLa1pxQIpcBI=;
 b=v6OLTPdywQqylNg3360n7O00/NTUPgPd4PcYO6ojXg1+pVPXy6oTTWOtaFuvOONqBW
 YwxkGQmJ6hXuZiAbhq1P3ti9tHqOL4vRBAjIW0WiOWTXgYaglbbBSGy+eH1UPyXp+VUy
 xp+K4R2NF4EGYBNf45Tw4mBX+22BKowkSdTPAWGqTTFfvPRWdd7b8KvG6nHhfBgN8loa
 Ya4dRMOSPsYcd4KWiPUZVXjrREcS3dfnDeCekFL7PTAJag6kcr13yVVlMsiqQhpgi3qw
 +PCvv30gWufJ/gUzRX6BxyZexL59TH0fAHe/AnMVqQVqqre++A87x7PrJpmzmXON0NjE
 YVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0merasIJ/Z6fow3Dwt5TAYovpOrX2AjSLa1pxQIpcBI=;
 b=UG3Y1QvWXZ9AINatE4e6/rrxVGlpqwMqRlJzSjvYuV33OrIFvmOdNijmd7VxywCuRp
 D/3U4l9OoG9ACwKCi7cl9xmWrHNM5doWph3eqGmvZf16+hwqgh0/KduRI83VMsD5D7aO
 G0gU8ZAOOlWeUCbQi9Pwo0GSR3PMNwJoirUf3MGDgyTNz7jU0mRXE/FxEOiia+C6uaQa
 gpUzOoTHllPHgzcVOpZO2I58M8CQkUx0UEEPQ05Slih9RQUJTQk8GZ+qvO7GrGdFu5JP
 djDYEhJUq0+Htvklv2Nmf4dw37GE/YP4HGIEXLub0J5007zn8ICcLswl1jBNFphRFasw
 NMtQ==
X-Gm-Message-State: AFeK/H2WLMBXpdUaGEaxx8qCYu6jZuvW0OMJolG/c8qJHam/I/a5SDBEctJHebwTKmL3ZEN9
X-Received: by 10.84.141.129 with SMTP id 1mr15205168plv.166.1489700196217;
 Thu, 16 Mar 2017 14:36:36 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:35 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Heiko Schocher <hs@denx.de>, Konstantin Porotchkin <kostap@marvell.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tom Warren <twarren@nvidia.com>, Thomas Abraham <thomas.ab@samsung.com>,
 Wills Wang <wills.wang@live.com>, Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Minkyu Kang <mk7.kang@samsung.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Stephen Warren <swarren@nvidia.com>
Subject: [PATCH 00/17] Expand Aspeed AST2500 Support
Date: Thu, 16 Mar 2017 14:36:07 -0700
Message-Id: <20170316213624.140344-1-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:39 -0000
X-List-Received-Date: Thu, 16 Mar 2017 21:36:39 -0000
X-List-Received-Date: Thu, 16 Mar 2017 21:36:39 -0000

This series expands support for Aspeed AST2500 SoC, commonly used as
Board Management Controller in many servers, to the point where it can
actually be useful.

The main goal of this series is I2C and Network drivers, the rest are
either cleanups or supporting patches. Most notable among them is
addition of Watchdog Uclass, so that watchdog drivers can now use Driver
Model.

One notable thing that is *missing* from this series is Device Tree
configuration for I2C driver. The Linux Kernel I2C driver is still under
review and it may affect the details of how devices need to be
configured in the Device Tree. So, I decided to wait until it will show
up in Linux Kernel DT and then pull it into U-Boot.


Maxim Sloyko (17):
  aspeed: Update ast2500 Device Tree
  dm: Simple Watchdog uclass
  aspeed: Watchdog Timer Driver
  aspeed: Make SCU lock/unlock functions part of SCU API
  aspeed: Reset Driver
  aspeed: Device Tree configuration for Reset Driver
  aspeed: Refactor AST2500 RAM Driver and Sysreset Driver
  aspeed: AST2500 Pinctrl Driver
  aspeed: Enable Pinctrl Driver in AST2500 EVB
  aspeed: Add P-Bus clock in ast2500 clock driver
  aspeed: Add I2C Driver
  aspeed: Enable I2C in EVB defconfig
  aspeed: Add support for Clocks needed by MACs
  aspeed: Refactor SCU to use consistent mask & shift
  aspeed: Cleanup ast2500-u-boot.dtsi Device Tree
  aspeed: Add AST2500/AST2400 compatible NIC Driver
  aspeed: Network Driver configuration for EVB

 arch/arm/dts/ast2500-evb.dts                   |  29 +
 arch/arm/dts/ast2500-u-boot.dtsi               |  59 +-
 arch/arm/dts/ast2500.dtsi                      | 881 ++++++++++++++++++++++++-
 arch/arm/include/asm/arch-aspeed/pinctrl.h     |  52 ++
 arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 132 +++-
 arch/arm/include/asm/arch-aspeed/wdt.h         |  38 +-
 arch/arm/mach-aspeed/Kconfig                   |   8 +-
 arch/arm/mach-aspeed/ast2500/clk_ast2500.c     |  15 +
 arch/arm/mach-aspeed/ast2500/sdram_ast2500.c   |  17 +-
 arch/arm/mach-aspeed/ast_wdt.c                 |  47 +-
 configs/evb-ast2500_defconfig                  |  13 +
 drivers/clk/aspeed/clk_ast2500.c               | 321 +++++++--
 drivers/i2c/Kconfig                            |   9 +
 drivers/i2c/Makefile                           |   1 +
 drivers/i2c/ast_i2c.c                          | 355 ++++++++++
 drivers/i2c/ast_i2c.h                          | 132 ++++
 drivers/net/Kconfig                            |   8 +
 drivers/net/Makefile                           |   1 +
 drivers/net/ast_nic.c                          | 584 ++++++++++++++++
 drivers/net/ast_nic.h                          | 198 ++++++
 drivers/pinctrl/Kconfig                        |   9 +
 drivers/pinctrl/Makefile                       |   1 +
 drivers/pinctrl/aspeed/Makefile                |   1 +
 drivers/pinctrl/aspeed/pinctrl_ast2500.c       | 127 ++++
 drivers/reset/Kconfig                          |  10 +
 drivers/reset/Makefile                         |   1 +
 drivers/reset/ast2500-reset.c                  | 109 +++
 drivers/sysreset/sysreset_ast.c                |  24 +-
 drivers/watchdog/Kconfig                       |  24 +
 drivers/watchdog/Makefile                      |   2 +
 drivers/watchdog/ast_wdt.c                     | 125 ++++
 drivers/watchdog/wdt-uclass.c                  |  79 +++
 include/dm/uclass-id.h                         |   1 +
 include/dt-bindings/clock/ast2500-scu.h        |   2 +
 include/dt-bindings/reset/ast2500-reset.h      |  45 ++
 include/wdt.h                                  |  97 +++
 36 files changed, 3390 insertions(+), 167 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-aspeed/pinctrl.h
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h
 create mode 100644 drivers/net/ast_nic.c
 create mode 100644 drivers/net/ast_nic.h
 create mode 100644 drivers/pinctrl/aspeed/Makefile
 create mode 100644 drivers/pinctrl/aspeed/pinctrl_ast2500.c
 create mode 100644 drivers/reset/ast2500-reset.c
 create mode 100644 drivers/watchdog/ast_wdt.c
 create mode 100644 drivers/watchdog/wdt-uclass.c
 create mode 100644 include/dt-bindings/reset/ast2500-reset.h
 create mode 100644 include/wdt.h

-- 
2.12.0.367.g23dc2f6d3c-goog
