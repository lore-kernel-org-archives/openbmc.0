Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 332DF1A09C0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 18:10:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452496220431176.91059024150377;
 Sun, 10 Jan 2016 23:10:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] HWMON: Add OCC hwmon driver v5
Date: Mon, 11 Jan 2016 01:10:18 -0600
Message-Id: <1452496219-29079-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 07:10:26 -0000

This patch add a hwmon driver for BMC to monitor POWER CPU sensors
via OCC (On-Chip-Controller).

This patch will finally be integrated into Linux Kernel after the review process.
The "occ_hwmon.patch" will be temporarily used for testing.

Changes for this version:
1. Fixed checkpatch.pl warnings and errors.
2. Fixed issue from Joel Stanley's review.
3. Add a new sysfs interface: '/sys/class/i2c-adaptor/i2c-x/x-yyyy/online',
to notify the driver OCC is active.
4. Use device table to instantiate the occ-i2c device.
5. Add a new hwmon sysfs interface: '/sys/class/hwmon/hwmonX/user_powercap',
to send "Set User Power Cap" command to OCC.
6. Enable the occ-i2c driver for both Palmetto and Barreleye.

Updated the wiki document for the change:
https://github.com/openbmc/kernel-hwmon-occ/wiki/OCC-HWMON-driver

https://github.com/openbmc/openbmc/pull/129

Yi Li (1):
  HWMON: Add OCC hwmon driver

 .../linux/linux-obmc/occ_hwmon.patch               | 1517 ++++++++++++++++
 .../recipes-kernel/linux/linux-obmc/palmetto.cfg   |    1 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |    1 +
 .../linux/linux-obmc/occ_hwmon.patch               | 1898 ++++++++++----------
 4 files changed, 2444 insertions(+), 973 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/occ_hwmon.patch

-- 
2.6.4
