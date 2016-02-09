Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6B96E1A039D
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 10:00:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455058846577891.509983590509;
 Tue, 9 Feb 2016 15:00:46 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2 0/2] Implement new LED driver
Date: Tue,  9 Feb 2016 17:00:43 -0600
Message-Id: <1455058845-30270-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 23:00:50 -0000

Verification for the new LED driver is completed so time to replace the
previous gpio implementation with the new one. This entails
replacing the led_controller file with the led_controller_new file,
updating the dbus interface name so that it is the same as the previous
one, and updating the code with the new led names.

https://github.com/openbmc/skeleton/pull/46

Adriana Kobylak (2):
  Implement new LED driver
  LED Makefile and polarity fixes

 Makefile                     |   9 +-
 bin/Barreleye.py             |  12 +-
 bin/Palmetto.py              |   6 +-
 bin/chassis_control.py       |   2 +-
 bin/obmcutil                 |   2 +-
 objects/led_controller.c     | 611 ++++++++++++++++++++++++++++++++-----------
 objects/led_controller_new.c | 488 ----------------------------------
 7 files changed, 466 insertions(+), 664 deletions(-)
 delete mode 100755 objects/led_controller_new.c

-- 
2.7.1
