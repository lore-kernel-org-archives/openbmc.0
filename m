Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGRh61lQhzF0Sh
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 09:31:34 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2018 14:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,337,1511856000"; d="scan'208";a="18805654"
Received: from maru.jf.intel.com ([10.54.51.80])
 by orsmga003.jf.intel.com with ESMTP; 09 Jan 2018 14:31:28 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Subject: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
Date: Tue,  9 Jan 2018 14:31:20 -0800
Message-Id: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 09 Jan 2018 22:31:34 -0000
X-List-Received-Date: Tue, 09 Jan 2018 22:31:34 -0000

From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>

Hello,

This patch set provides support for PECI of AST2400/2500 which can give us PECI
functionalities such as temperature monitoring, platform manageability,
processor diagnostics and failure analysis. Also provides generic peci.h and
peci_ioctl.h headers to provide compatibility to peci drivers that can be
implemented later e.g. Nuvoton's BMC SoC family.

The misc peci driver can be used as a multi-purpose PECI controller driver which
serializes all PECI transactions that coming from user space and from other
kernel modules. This misc peci driver could be replaced with other BMC chipsets'
implementation if the implementation provide compatible 'peci_ioctl'
inter-module call and ioctl scheme defined in peci.h and peci_ioctl.h files.

The hwmon peci driver implements a generic PECI hwmon feature which is running
with a PECI misc driver supports compatible native PECI command suite for
retrieving temperatures of the CPU package, CPU cores and DIMM components.

Please review.

-Jae

Jae Hyun Yoo (6):
  Documentation: dt-bindings: Add Aspeed PECI
  ARM: dts: aspeed: peci: Add Aspeed PECI
  drivers/misc: Add driver for Aspeed PECI and generic PECI headers
  Documentation: dt-bindings: Add a generic PECI hwmon
  Documentation: hwmon: Add a generic PECI hwmon
  drivers/hwmon: Add a driver for a generic PECI hwmon

 .../devicetree/bindings/hwmon/peci-hwmon.txt       |   33 +
 .../devicetree/bindings/misc/aspeed-peci.txt       |   55 +
 Documentation/hwmon/peci-hwmon                     |   74 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |   14 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   14 +
 drivers/hwmon/Kconfig                              |    6 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/peci-hwmon.c                         |  953 +++++++++++++++++
 drivers/misc/Kconfig                               |    9 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/aspeed-peci.c                         | 1130 ++++++++++++++++++++
 include/misc/peci.h                                |   11 +
 include/uapi/linux/Kbuild                          |    1 +
 include/uapi/linux/peci_ioctl.h                    |  270 +++++
 14 files changed, 2572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-peci.txt
 create mode 100644 Documentation/hwmon/peci-hwmon
 create mode 100644 drivers/hwmon/peci-hwmon.c
 create mode 100644 drivers/misc/aspeed-peci.c
 create mode 100644 include/misc/peci.h
 create mode 100644 include/uapi/linux/peci_ioctl.h

-- 
2.7.4
