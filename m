Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 66F181A023F
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2016 07:50:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454619045902668.584953730618;
 Thu, 4 Feb 2016 12:50:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Stop watchdog on power off
Date: Thu,  4 Feb 2016 14:50:44 -0600
Message-Id: <1454619044-21851-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454619044-21851-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454619044-21851-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 04 Feb 2016 20:50:50 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Stop watchdog if any on a power off request so that it does not
expire if the system is powered off in the middle of a power on.
Clear any existing watchdog timers before honoring a start
watchdog request so that there is only one timer at a time.
---
 bin/chassis_control.py      |  2 ++
 objects/host_watchdog_obj.c | 19 ++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 2ed954e..e8c82d5 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -118,6 +118,8 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		in_signature='', out_signature='')
 	def powerOff(self):
 		print "Turn off power"
+		intfwatchdog = self.getInterface('watchdog')
+		intfwatchdog.stop()
 		intf = self.getInterface('power_control')
 		intf.setPowerState(POWER_OFF)
 		return None
diff --git a/objects/host_watchdog_obj.c b/objects/host_watchdog_obj.c
index a4651ea..e3da8cb 100644
--- a/objects/host_watchdog_obj.c
+++ b/objects/host_watchdog_obj.c
@@ -33,6 +33,16 @@ poll_watchdog(gpointer user_data)
 }
 
 static gboolean
+remove_watchdog(void)
+{
+    if (watchdogid)
+    {
+        g_source_remove(watchdogid);
+        watchdogid = 0;
+    }
+}
+
+static gboolean
 set_poll_interval (Watchdog  *wd,
                 GDBusMethodInvocation  *invocation,
                 guint                   interval,
@@ -48,6 +58,7 @@ on_start        (Watchdog  *wd,
                 GDBusMethodInvocation  *invocation,
                 gpointer                user_data)
 {
+  	remove_watchdog();
   	watchdog_set_watchdog(wd,1);
 	guint poll_interval = watchdog_get_poll_interval(wd);
     g_print("Starting watchdog with poll interval: %d\n", poll_interval);
@@ -72,13 +83,7 @@ on_stop         (Watchdog  *wd,
                 gpointer                user_data)
 {
     g_print("Stopping watchdog\n");
-
-    if (watchdogid)
-    {
-        g_source_remove(watchdogid);
-        watchdogid = 0;
-    }
-
+    remove_watchdog();
     watchdog_complete_stop(wd,invocation);
     return TRUE;
 }
-- 
2.6.4
