Return-Path: <maxims@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpT3zg7zDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="U0Ie+b8i"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id e64so8236330pfd.1
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ukEjFfzpPtCbVli1rBPEojOmAIYK+ARQ7MZ1lG42YD8=;
 b=U0Ie+b8if/l7k4EkiXf34G4WWSgcqo1jO5VRYq9o7ho9SBudxO/MdkmvFksQh5ogxy
 c7WyB3Kgr5jV8ki7O9g8QELxrG33rUKcvsVby+pjqTNXqMTkZHBsTs5waO0Q51rxmq3f
 QU6/89B+je7SU5IZvIaQ4Hxp1fAnZv0cSqtiZZj8L7G9dTWs1ll/v0GwNxmhmdcI8q7C
 OvZ6zRUL+RGToU8VcRGuuV3TUngYnYLe5D5VUdHihuGa/spMEi+BQqDhyJjKuefpoVuw
 bL3X+wuvPtDQ3LlODn9rBC6LQBiJ9TUHOkrhTYOq1Fyw1S03NHUVnBdY9t19X/J2Y4L1
 D8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ukEjFfzpPtCbVli1rBPEojOmAIYK+ARQ7MZ1lG42YD8=;
 b=Yk2gutpbDDowI4rOP+/w0/kDSi0EG9QZxBngSZEPW1lKKofE49myTLRwl2gdo5lYph
 C4ZXCEZc33IpmEa8Hzdx4xg65BYdf9yDX21D5F+Je2/Osm8703oYxoPWnx4e4Drzj/yQ
 YacT2cCvfHiO+e6wNDq4xibtWRUaH59prWuKiiPxxz4DYw1UUTyzgu9ymQwlkLTPrRQ/
 ByprUjIaVLSBJ81ZtUhPF8iBgUASSw1e0fii+WUQqvx3I7Wz00VvdrZN+dWhl7i9gUVn
 qUqQXxcMGPok1nREMttvDz5q6iN8YODQ8aLd7mn5cRTxZEKAH6TXm0bIzWfEuyhuMmo9
 xsuQ==
X-Gm-Message-State: AN3rC/69BjC+JGiOFkFtvQyBuXUIwQJoix1288A5hV3bqFsXB5ZonjA7
 0Hfg/k1O9YOKIDlt99TVSiR1
X-Received: by 10.84.237.1 with SMTP id s1mr68437026plk.157.1494021694554;
 Fri, 05 May 2017 15:01:34 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:33 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Heiko Schocher <hs@denx.de>, Konstantin Porotchkin <kostap@marvell.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tom Warren <twarren@nvidia.com>, Thomas Abraham <thomas.ab@samsung.com>,
 Wills Wang <wills.wang@live.com>, Kever Yang <kever.yang@rock-chips.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Minkyu Kang <mk7.kang@samsung.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Stephen Warren <swarren@nvidia.com>
Subject: [PATCH v2 00/15] Expand Aspeed AST2500 Support
Date: Fri,  5 May 2017 15:01:00 -0700
Message-Id: <20170505220115.143025-1-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:38 -0000
X-List-Received-Date: Fri, 05 May 2017 22:01:38 -0000
X-List-Received-Date: Fri, 05 May 2017 22:01:38 -0000

This series expands support for Aspeed AST2500 SoC, commonly used as
Board Management Controller in many servers.

The main goal of this series is I2C driver, the rest are
either cleanups or supporting patches. Most notable among them is
addition of Watchdog uclass, so that watchdog drivers can now use Driver
Model.

One notable thing that is *missing* from this series is Device Tree
configuration for I2C driver. The Linux Kernel I2C driver is still under
review and it may affect the details of how devices need to be
configured in the Device Tree. So, I decided to wait until it will show
up in Linux Kernel DT and then pull it into U-Boot.

I removed Network driver from this series. I will work on it separately
and will make it compatible with existing Faraday devices, but that is a
work better done outside of this already long series.

Also, sorry for taking long time to respond, I had to take care of some
more pressing, non-U-Boot-related issues.
I can assure you that I'm still committed to continue to work on Aspeed
in U-Boot.

Changes in v2:
- Remove "probe" function from sandbox wdt driver
- Fix include order

Changes in v1:
- Added link to the original version to commit message
- Rename wdt_reset to wdt_expire_now
- Rename wdt_restart to wdt_reset
- Clarified function documentation in few cases
- Add Sandbox WDT driver and unit tests
- Rename reset to expire_now
- Rename restart to reset
- Remove unnecessary check for error in dev_get_priv
- Fix comment
- Rename wdt_reset call to wdt_expire_now
- Rename wdt_reset call to wdt_expire_now
- Style fixes

Maxim Sloyko (15):
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

 arch/arm/dts/ast2500-evb.dts                   |  15 +
 arch/arm/dts/ast2500-u-boot.dtsi               |  59 +-
 arch/arm/dts/ast2500.dtsi                      | 881 ++++++++++++++++++++++++-
 arch/arm/include/asm/arch-aspeed/pinctrl.h     |  52 ++
 arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 132 +++-
 arch/arm/include/asm/arch-aspeed/wdt.h         |  38 +-
 arch/arm/mach-aspeed/Kconfig                   |   8 +-
 arch/arm/mach-aspeed/ast2500/clk_ast2500.c     |  15 +
 arch/arm/mach-aspeed/ast2500/sdram_ast2500.c   |  17 +-
 arch/arm/mach-aspeed/ast_wdt.c                 |  47 +-
 arch/sandbox/dts/test.dts                      |   4 +
 arch/sandbox/include/asm/state.h               |   9 +
 configs/evb-ast2500_defconfig                  |   6 +
 configs/sandbox_defconfig                      |   2 +
 drivers/clk/aspeed/clk_ast2500.c               | 321 +++++++--
 drivers/i2c/Kconfig                            |   9 +
 drivers/i2c/Makefile                           |   1 +
 drivers/i2c/ast_i2c.c                          | 357 ++++++++++
 drivers/i2c/ast_i2c.h                          | 132 ++++
 drivers/pinctrl/Kconfig                        |   9 +
 drivers/pinctrl/Makefile                       |   1 +
 drivers/pinctrl/aspeed/Makefile                |   1 +
 drivers/pinctrl/aspeed/pinctrl_ast2500.c       | 127 ++++
 drivers/reset/Kconfig                          |  10 +
 drivers/reset/Makefile                         |   1 +
 drivers/reset/ast2500-reset.c                  | 106 +++
 drivers/sysreset/sysreset_ast.c                |  24 +-
 drivers/watchdog/Kconfig                       |  32 +
 drivers/watchdog/Makefile                      |   3 +
 drivers/watchdog/ast_wdt.c                     | 125 ++++
 drivers/watchdog/sandbox_wdt.c                 |  66 ++
 drivers/watchdog/wdt-uclass.c                  |  72 ++
 include/dm/uclass-id.h                         |   1 +
 include/dt-bindings/clock/ast2500-scu.h        |   2 +
 include/dt-bindings/reset/ast2500-reset.h      |  45 ++
 include/wdt.h                                  | 107 +++
 test/dm/Makefile                               |   1 +
 test/dm/wdt.c                                  |  40 ++
 38 files changed, 2711 insertions(+), 167 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-aspeed/pinctrl.h
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h
 create mode 100644 drivers/pinctrl/aspeed/Makefile
 create mode 100644 drivers/pinctrl/aspeed/pinctrl_ast2500.c
 create mode 100644 drivers/reset/ast2500-reset.c
 create mode 100644 drivers/watchdog/ast_wdt.c
 create mode 100644 drivers/watchdog/sandbox_wdt.c
 create mode 100644 drivers/watchdog/wdt-uclass.c
 create mode 100644 include/dt-bindings/reset/ast2500-reset.h
 create mode 100644 include/wdt.h
 create mode 100644 test/dm/wdt.c

-- 
2.13.0.rc1.294.g07d810a77f-goog
