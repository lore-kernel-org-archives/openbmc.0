Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 391DB1A1A21
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 11:00:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450483240880520.2634975914011;
 Fri, 18 Dec 2015 16:00:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/5] Update for ken
Date: Fri, 18 Dec 2015 18:00:35 -0600
Message-Id: <1450483240-5182-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 19 Dec 2015 00:00:45 -0000

https://github.com/openbmc/skeleton/pull/23

Ken (5):
  Set default LED status, pull high BMC_Throttle
  Fix THROTTLE typo:
  sync to 14caa527e0b10e0aece119693bf003ec95929370
  Add reset button
  Extract latest Barreleye.py

 Makefile                   |   6 +-
 bin/Barreleye.py           |  98 ++++++++++++++++++++-----
 bin/chassis_control.py     |   6 ++
 includes/gpio.c            |   0
 objects/button_reset_obj.c | 179 +++++++++++++++++++++++++++++++++++++++++++++
 objects/control_bmc_obj.c  |   1 +
 objects/control_host_obj.c |   5 ++
 objects/led_controller.c   |   6 +-
 8 files changed, 279 insertions(+), 22 deletions(-)
 mode change 100644 => 100755 Makefile
 mode change 100644 => 100755 includes/gpio.c
 create mode 100755 objects/button_reset_obj.c
 mode change 100644 => 100755 objects/control_host_obj.c
 mode change 100644 => 100755 objects/led_controller.c

-- 
2.6.3
