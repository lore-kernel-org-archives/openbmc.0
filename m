Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVBps5CT1zDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 12:31:00 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458696657986201.99410979372078;
 Tue, 22 Mar 2016 18:30:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/8] Add fan control algorithm
Date: Tue, 22 Mar 2016 20:30:48 -0500
Message-Id: <1458696656-28363-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 23 Mar 2016 01:31:02 -0000
X-List-Received-Date: Wed, 23 Mar 2016 01:31:02 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/59)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/59

Ken (5):
  add i2craw tool and hdd status function
  Heartbeat Led function
  Setup FUNC_MODE[2:0]
  fix info memory leak
  Revert "Fill in the threshold settings for CPU and DIMM"

johnhcwang (3):
  Fill in the threshold settings for CPU and DIMM
  Add I2C-6 lm75 outlet temperature sensor
  Modify the hard-coded hwmon ID for PowerCap

 Makefile                        |  13 +-
 bin/Barreleye.py                | 186 +++++++++++++--------
 bin/Sensors.py                  |   2 +-
 bin/chassis_control.py          |   7 +-
 bin/sensor_manager2.py          |   4 +-
 bin/startup_hacks.sh            |   8 +
 objects/button_power_obj.c      |  17 +-
 objects/control_bmc_barreleye.c |   2 +-
 objects/control_bmc_obj.c       |  88 +++++-----
 objects/hwmons_barreleye.c      |  15 +-
 objects/i2c-dev.h               | 362 ++++++++++++++++++++++++++++++++++++++++
 objects/i2craw.c                | 245 +++++++++++++++++++++++++++
 objects/info.c                  | 358 +++++++++++++++++++++++++++++++++++++++
 objects/log.h                   |  59 +++++++
 14 files changed, 1231 insertions(+), 135 deletions(-)
 create mode 100644 objects/i2c-dev.h
 create mode 100644 objects/i2craw.c
 create mode 100644 objects/info.c
 create mode 100644 objects/log.h

-- 
2.7.1
