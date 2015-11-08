Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2329F1A0C4E
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 12:36:02 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446945632568624.698821880139;
 Sat, 7 Nov 2015 17:20:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/7] Set default LED status.
Date: Sat,  7 Nov 2015 20:20:24 -0500
Message-Id: <1446945631-28089-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 01:36:03 -0000

BEEP LED (GPION7) light on for when system has someting abnormal. This LED is used to warning user.
So default is OFF. We will check when this LED on for what event.
BMC_READY LED (GPIOH2) is OFF when standby power active and system power off. So default is OFF.  When system power on, the LED on.
So far user can know the timing of push power button after BEEP LED off. But it needs to wait about 15 seconds. I want  BEEP LED off right after BMC Ready status, can you suggest how can I achive this?

For Identify feature, we use the same LED with BMC_READY LED. Below is the behavior.
Power off, Chassis identify off: BMC_READY LED consistently off 
Power off, Chassis identify on: BMC_READY LED on for 0.1sec, off for 0.9sec, and loop 
Power on, Chassis identify off: BMC_READY LED consistently on 
Power on, Chassis identify on: BMC_READY LED on for 0.9sec, off for 0.1sec, and loop
You may confuse about GPIOR5. FXN BMC will check with EE and implement this part.


https://github.com/openbmc/skeleton/pull/13

Ken (7):
  LED test
  LED test 2
  LED test3
  Remove ;
  Force fan duty to 100%
  Workarounf for fan PWM 100%
  Remove git 1e751075d5a11736df67c40ead5a8375141269d3

 bin/Barreleye.py         | 7 ++++++-
 bin/startup_hacks.sh     | 9 +++++++++
 objects/led_controller.c | 9 +++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 objects/led_controller.c

-- 
2.6.3
