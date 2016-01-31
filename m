Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 128201A0070
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2016 18:10:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454224236311979.5879376482092;
 Sat, 30 Jan 2016 23:10:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: Add dbus objects for OCC CAPS sensors
Date: Sun, 31 Jan 2016 01:10:34 -0600
Message-Id: <1454224234-9353-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454224234-9353-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454224234-9353-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 31 Jan 2016 07:10:40 -0000

From: Yi Li <adamliyi@msn.com>

BMC can poll OCC for CAPS sensors. These sensors provide information
on system PowerCap. One of the sensors named 'Current System Power Reading' can
be used for reading current system power consumption.
This patch add dbus interface for the OCC CAPS sensors.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/Barreleye.py |  8 ++++++++
 bin/Palmetto.py  | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index bc05722..29d9bcc 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -610,6 +610,14 @@ HWMON_CONFIG = {
 		}
          },
 	'3-0050' : {
+		'names' : {
+			'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_curr_powerreading' : { 'object_path' : 'powercap/system_power','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_max_powercap' : { 'object_path' : 'powercap/max_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_min_powercap' : { 'object_path' : 'powercap/min_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_norm_powercap' : { 'object_path' : 'powercap/n_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_user_powerlimit' : { 'object_path' : 'powercap/user_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+		},
 		'labels' : {
 		'176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
 			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 90, 'warning_lower' : -99, 'emergency_enabled' : True },
diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index 5d53e41..4d2bf88 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -297,5 +297,15 @@ HWMON_CONFIG = {
 		'names' : {
 			'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
 		}
+	},
+	'3-0050' : {
+		'names' : {
+			'caps_curr_powercap' : { 'object_path' : 'powercap/curr_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_curr_powerreading' : { 'object_path' : 'powercap/system_power','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_max_powercap' : { 'object_path' : 'powercap/max_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_min_powercap' : { 'object_path' : 'powercap/min_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_norm_powercap' : { 'object_path' : 'powercap/n_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+			'caps_user_powerlimit' : { 'object_path' : 'powercap/user_cap','poll_interval' : 10000,'scale' : 1,'units' : 'W' },
+		}
 	}
 }
-- 
2.6.4
