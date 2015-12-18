Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C7D991A1A21
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482036017571.7440713121325;
 Fri, 18 Dec 2015 15:40:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 00/15] Add LED behavior, soft reset, voltage sensors.
Date: Fri, 18 Dec 2015 17:40:20 -0600
Message-Id: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:41 -0000

https://github.com/openbmc/skeleton/pull/22

Ken (10):
  Set default LED status, pull high BMC_Throttle
  Init GPIO Thottle, add BMC heartbeat, change power LED status
  Fix THROTTLE typo:
  sync to 14caa527e0b10e0aece119693bf003ec95929370
  Add all voltage sensors
  remove in15_input sensor
  Remove setblinkslow
  Add all voltage sensors
  remove in15_input sensor
  Add reset button

Norman James (5):
  use real names for occ sensors
  add introspect=False to get_object calls for performance
  add new flash ids
  new process to discover initial power state on bmc reboot
  add softreboot

 Makefile                           |   6 +-
 bin/Barreleye.py                   | 296 +++++++++++++++++++++++--------------
 bin/chassis_control.py             |  10 +-
 bin/discover_system_state.py       |  49 ++++++
 bin/fan_control.py                 |   2 +-
 bin/hwmon.py                       |  94 +++++++-----
 bin/obmcutil                       |   2 +-
 bin/system_manager.py              |   2 +-
 includes/gpio.c                    |   0
 objects/button_reset_obj.c         | 179 ++++++++++++++++++++++
 objects/control_bmc_obj.c          |   1 +
 objects/control_host_obj.c         |   5 +
 objects/led_controller.c           |   6 +-
 objects/pflash/libflash/libflash.c |   6 +
 14 files changed, 504 insertions(+), 154 deletions(-)
 mode change 100644 => 100755 Makefile
 create mode 100755 bin/discover_system_state.py
 mode change 100644 => 100755 includes/gpio.c
 create mode 100755 objects/button_reset_obj.c
 mode change 100644 => 100755 objects/control_host_obj.c
 mode change 100644 => 100755 objects/led_controller.c

-- 
2.6.3
