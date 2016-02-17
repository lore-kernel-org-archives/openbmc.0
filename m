Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E8A061A0331
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2016 21:30:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455705025763183.38126484672068;
 Wed, 17 Feb 2016 02:30:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add temporary adm1278 hwmon pmbus driver patch
Date: Wed, 17 Feb 2016 04:30:23 -0600
Message-Id: <1455705024-15045-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 17 Feb 2016 10:30:37 -0000

This patch temporarily adds adm1278 hwmon driver as a kernel patch to openbmc,
for testing on Barreleye.
If in the future this patch will still be useful, it should be put into linux kernel.

Barreleye has three adm1278 devices on three i2c buses.
This patch enables reading adm1278 sensors via hwmon sysfs interface.
The enabled sensors are: current, voltage (In and Out), power and temperature.
Detail usage can be found in 'readme_adm1278.txt'.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/openbmc/pull/181

Yi Li (1):
  Add temporary adm1278 hwmon pmbus driver patch

 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 +
 .../linux/linux-obmc/hwmon_adm1278.patch           | 165 +++++++++++++++++++++
 .../linux/linux-obmc/readme_adm1278.txt            |  78 ++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   3 +
 4 files changed, 249 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend

-- 
2.7.1
