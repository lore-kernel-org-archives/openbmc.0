Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0CD361A0060
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 15:50:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456980631080555.0048414792192;
 Wed, 2 Mar 2016 20:50:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] hwmon: Add adm1278 support in adm1275 hwmon pmbus driver
Date: Wed,  2 Mar 2016 22:50:29 -0600
Message-Id: <1456980630-1383-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Thu, 03 Mar 2016 04:50:37 -0000

This patch adds adm1278 Hot Swap Controller and Digital Power and
Energy Monitor support in the adm1275 hwmon pmbus driver.
The patch enables reading adm1278 sensors via hwmon sysfs interface.
The enabled sensors are: current, voltage (In and Out), power and temperature.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/linux/pull/57

Yi Li (1):
  hwmon: Add adm1278 support in adm1275 hwmon pmbus driver

 drivers/hwmon/pmbus/Kconfig   |   4 +-
 drivers/hwmon/pmbus/adm1275.c | 102 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 100 insertions(+), 6 deletions(-)

-- 
2.7.1
