Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVR166xHNzDqln
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 11:40:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466041251937106.71445202431869;
 Wed, 15 Jun 2016 18:40:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Fix Firestone,Garrison i2c addresses for OCC
Date: Wed, 15 Jun 2016 20:40:50 -0500
Message-Id: <20160616014050.21267-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616014050.21267-1-openbmc-patches@stwcx.xyz>
References: <20160616014050.21267-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 01:41:00 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Previously these were hardcoded via a garrison layer patch.
When skeleton started looking for addresses in the system
configuration file and stopped hardcoding them, the garrison
and firestone files were updated but with the barreleye
addresses.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 configs/Firestone.py | 4 ++--
 configs/Garrison.py  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/Firestone.py b/configs/Firestone.py
index 4767178..988d09e 100644
--- a/configs/Firestone.py
+++ b/configs/Firestone.py
@@ -617,9 +617,9 @@ MISC_SENSORS = {
 	0x5f : { 'class' : 'BootCountSensor' },
 	0x05 : { 'class' : 'BootProgressSensor' },
 	0x08 : { 'class' : 'OccStatusSensor',
-		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
+		'os_path' : '/sys/class/i2c-adapter/i2c-4/4-0050/online' },
 	0x09 : { 'class' : 'OccStatusSensor',
-		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
+		'os_path' : '/sys/class/i2c-adapter/i2c-5/5-0050/online' },
 	0xb5 : { 'class' : 'OperatingSystemStatusSensor' },
 	0xb3 : { 'class' : 'PowerCap',
 		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
diff --git a/configs/Garrison.py b/configs/Garrison.py
index e8f0927..617f083 100644
--- a/configs/Garrison.py
+++ b/configs/Garrison.py
@@ -617,9 +617,9 @@ MISC_SENSORS = {
 	0x5f : { 'class' : 'BootCountSensor' },
 	0x05 : { 'class' : 'BootProgressSensor' },
 	0x08 : { 'class' : 'OccStatusSensor',
-		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0050/online' },
+		'os_path' : '/sys/class/i2c-adapter/i2c-4/4-0050/online' },
 	0x09 : { 'class' : 'OccStatusSensor',
-		'os_path' : '/sys/class/i2c-adapter/i2c-3/3-0051/online' },
+		'os_path' : '/sys/class/i2c-adapter/i2c-5/5-0050/online' },
 	0xb5 : { 'class' : 'OperatingSystemStatusSensor' },
 	0xb3 : { 'class' : 'PowerCap',
 		'os_path' : '/sys/class/hwmon/hwmon3/user_powercap' },
-- 
2.8.4
