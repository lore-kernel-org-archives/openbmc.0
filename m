Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 120CE1A01E7
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 03:50:21 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449420619269660.6756762571522;
 Sun, 6 Dec 2015 08:50:19 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/8] Update occ hwmon patch
Date: Sun,  6 Dec 2015 11:50:10 -0500
Message-Id: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Sun, 06 Dec 2015 16:50:22 -0000

How can I just include my commit only in the pull request?

    1. Add a R/W attribute "update_interval". By default, it is set to 1000ms.
    This defines the minimum interval occ driver poll occ for latest sensor data.
    When reading occ hwmon attributes within the update_interval, the driver
    will no poll occ and it returns sendor data from cached data.

    You can do e.g. "echo 5000 > /sys/class/hwmon0/update_interval" to change it to 5000ms.

    2. Revise code based on Jeremy's comments.
    The driver name is changed to occ_i2c.c

    3. This patch will be removed when the occ_i2c driver is merged into Linux tree.



https://github.com/openbmc/openbmc/pull/116

Brad Bishop (1):
  Bump mapper and rest server revisions

Chris Austen (5):
  Updating base build with sprint 3 candidate 3
  Updates for Skeleton
  Add debug mode
  Sprint 3 Candidate
  Sprint 3 candidate 6

Joel Stanley (1):
  Update kernel version

adamliyi (1):
  1. Add a R/W attribute "update_interval". By default, it is set to
    1000ms.     This defines the minimum interval occ driver poll occ
    for latest sensor data.     When reading occ hwmon attributes within
    the update_interval, the driver     will no poll occ and it returns
    sendor data from cached data.

 .../linux/linux-obmc/occ_hwmon.patch               | 1667 +++++++++-----------
 .../common/recipes-kernel/linux/linux-obmc_4.3.bb  |    2 +-
 .../common/recipes-phosphor/dbus/obmc-mapper.bb    |    6 +-
 .../common/recipes-phosphor/dbus/obmc-rest.bb      |    6 +-
 .../recipes-phosphor/host-ipmid/btbridged.bb       |    4 +-
 .../host-ipmid/btbridged/makefile.patch            |   18 -
 .../recipes-phosphor/host-ipmid/host-ipmid-fru.bb  |   11 +-
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |    2 +-
 .../obmc-phosphor-event/obmc-phosphor-event.bb     |    2 +-
 .../common/recipes-phosphor/skeleton/skeleton.bb   |    2 +-
 10 files changed, 745 insertions(+), 975 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch

-- 
2.6.3
