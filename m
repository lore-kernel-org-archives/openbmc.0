Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C588F1A00E9
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 21:10:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1451988621762542.3212197191251;
 Tue, 5 Jan 2016 02:10:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] HWMON: Add OCC hwmon driver
Date: Tue,  5 Jan 2016 04:10:19 -0600
Message-Id: <1451988620-5410-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 05 Jan 2016 10:10:28 -0000

This patch add a hwmon driver for BMC to monitor POWER CPU sensors
via OCC (On-Chip-Controller).

Changes for this version:
1. Fixed checkpatch.pl warnings and errors.
2. Fixed issue from Joel Stanley's review
3. Add a new sysfs interface: '/sys/class/i2c-adaptor/i2c-x/x-yyyy/online',
to notify the driver OCC is active.
4. Use device table to instantiate the occ-i2c device.

https://github.com/openbmc/openbmc/pull/126

Yi Li (1):
  HWMON: Add OCC hwmon driver

 .../linux/linux-obmc/occ_hwmon.patch               | 1789 +++++++++-----------
 1 file changed, 822 insertions(+), 967 deletions(-)

-- 
2.6.4
