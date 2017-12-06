Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysWK95gVZzDrZW
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 08:02:36 +1100 (AEDT)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2017 13:02:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; 
   d="scan'208";a="719402"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga006.jf.intel.com with ESMTP; 06 Dec 2017 13:02:34 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 0/6] Add Aspeed PECI support
Date: Wed,  6 Dec 2017 13:02:25 -0800
Message-Id: <20171206210225.6949-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.15.1
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
X-List-Received-Date: Wed, 06 Dec 2017 21:02:38 -0000

Hello,

This patch set provides support for PECI of AST2400/2500 which can give us
functionalities such as temperature monitoring, platform manageability,
processor diagnostics and failure analysis. These patches introduce two kernel
drivers, an misc peci driver for general purpose PECI controller which
serializes all PECI transactions and a hwmon driver for temperature monitoring.

Please review.

-Jae

Jae Hyun Yoo (6):
  Documentation: dt-bindings: Add Aspeed PECI
  ARM: dts: aspeed: peci: Add Aspeed PECI
  drivers/misc: Add driver for Aspeed PECI
  Documentation: dt-bindings,hwmon: Add Aspeed PECI hwmon
  ARM: dts: aspeed: peci-hwmon: Add aspeed PECI hwmon
  drivers/hwmon: Add driver for Aspeed PECI hwmon

 .../bindings/hwmon/aspeed-peci-hwmon.txt           |   89 ++
 .../devicetree/bindings/misc/aspeed-peci.txt       |   52 +
 Documentation/hwmon/aspeed-peci-hwmon              |   64 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   78 ++
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   78 ++
 drivers/hwmon/Kconfig                              |    7 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/aspeed-peci-hwmon.c                  |  954 +++++++++++++++++
 drivers/misc/Kconfig                               |    7 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/aspeed-peci.c                         | 1113 ++++++++++++++++++++
 include/misc/aspeed_peci.h                         |   19 +
 include/uapi/linux/Kbuild                          |    1 +
 include/uapi/linux/aspeed_peci_ioctl.h             |  281 +++++
 14 files changed, 2745 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-peci-hwmon.txt
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-peci.txt
 create mode 100644 Documentation/hwmon/aspeed-peci-hwmon
 create mode 100644 drivers/hwmon/aspeed-peci-hwmon.c
 create mode 100644 drivers/misc/aspeed-peci.c
 create mode 100644 include/misc/aspeed_peci.h
 create mode 100644 include/uapi/linux/aspeed_peci_ioctl.h

-- 
2.15.1
