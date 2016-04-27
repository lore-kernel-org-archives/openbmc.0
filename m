Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qw3MB1vk4zDqBX
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 01:11:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461769866454736.1184256882472;
 Wed, 27 Apr 2016 08:11:06 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH skeleton] Allow sysfs path to be passed to OCC sensor
Date: Wed, 27 Apr 2016 10:11:00 -0500
Message-Id: <1461769860-18109-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461769860-18109-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461769860-18109-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 27 Apr 2016 15:11:18 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

The previous method of overriding this didn't work because
the base class constructor disables the sensor before the path
is updated with the correct one.

Pass it into the constructor so that the path is correct from
the beginning.
---
 bin/Sensors.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/bin/Sensors.py b/bin/Sensors.py
index f951eeb..8350774 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -176,9 +176,12 @@ class BootProgressSensor(VirtualSensor):
 		pass
 		
 class OccStatusSensor(VirtualSensor):
-	def __init__(self,bus,name):
+	def __init__(self,bus,name, sysfs = None):
 		## default path. can be override
-		self.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
+		if sysfs is None:
+			self.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
+		else:
+			self.sysfs_attr = sysfs
 		VirtualSensor.__init__(self,bus,name)
 		self.setValue("Disabled")
 		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
-- 
2.8.1
