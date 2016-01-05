Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 07C961A113E
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 18:00:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1451977235077782.4525424557752;
 Mon, 4 Jan 2016 23:00:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] [PATCH] HWMON: Add OCC hwmon driver
Date: Tue,  5 Jan 2016 01:00:33 -0600
Message-Id: <1451977234-31446-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 07:00:42 -0000

This patch add a hwmon driver for BMC to monitor POWER CPU sensors
via OCC (On-Chip-Controller).

Changes for this version:
1. Fixed checkpatch.pl warnings and errors.
2. Fixed issue from Joel Stanley's review
3. Add a new sysfs interface: '/sys/class/i2c-adaptor/i2c-x/x-yyyy/online',
to notify the driver OCC is active.
4. Use device table to instantiate the occ-i2c device.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/linux/pull/36

Yi Li (1):
  HWMON: Add OCC hwmon driver

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |   10 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |    7 +
 drivers/hwmon/Kconfig                          |   10 +
 drivers/hwmon/Makefile                         |    1 +
 drivers/hwmon/occ_i2c.c                        | 1339 ++++++++++++++++++++++++
 5 files changed, 1367 insertions(+)
 create mode 100644 drivers/hwmon/occ_i2c.c

-- 
2.6.4
