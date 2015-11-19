Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 216421A073D
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 13:30:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447900240215584.418492908046;
 Wed, 18 Nov 2015 18:30:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 7/8] Remove git
 1e751075d5a11736df67c40ead5a8375141269d3
Date: Wed, 18 Nov 2015 21:30:31 -0500
Message-Id: <1447900232-1928-8-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447900232-1928-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447900232-1928-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 02:30:49 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 0e92e83..64decbf 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -6,12 +6,6 @@ FLASH_DOWNLOAD_PATH = "/tmp"
 GPIO_BASE = 320
 SYSTEM_NAME = "Barreleye"
 
-import sys
-import gobject
-import dbus
-import dbus.service
-import dbus.mainloop.glib
-
 ## System states
 ##   state can change to next state in 2 ways:
 ##   - a process emits a GotoSystemState signal with state name to goto
@@ -428,15 +422,6 @@ GPIO_CONFIG['SLOT2_PRESENT'] =         { 'gpio_pin': 'N5', 'direction': 'in' }
 GPIO_CONFIG['MEZZ0_PRESENT'] =         { 'gpio_pin': 'O0', 'direction': 'in' }
 GPIO_CONFIG['MEZZ1_PRESENT'] =         { 'gpio_pin': 'O1', 'direction': 'in' }
 
-
-bus = dbus.SystemBus()
-
-for i in range(1,6):
- print i
- obj = bus.get_object("org.openbmc,sensors,hwmon","/org/openbmc/sensors/speed/fan"+str(i))
- intf = dbus.Interface (obj,"org.openbmc.SensorValue")
- intf.setValue(dbus.UInt32(255))
-
 def convertGpio(name):
 	name = name.upper()
 	c = name[0:1]
-- 
2.6.3
