Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgXlr2j3bzDqmQ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 07:31:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467322260116633.67811366512;
 Thu, 30 Jun 2016 14:31:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Andrew Geissler <andrewg@us.ibm.com>
Subject: [PATCH skeleton v4 2/2] Disable watchdog timer if debug_mode is set
Date: Thu, 30 Jun 2016 16:30:56 -0500
Message-Id: <20160630213056.12725-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630213056.12725-1-openbmc-patches@stwcx.xyz>
References: <20160630213056.12725-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 21:31:04 -0000

From: Andrew Geissler <andrewg@us.ibm.com>

resolves https://github.com/openbmc/openbmc/issues/246

debug_mode is used when the host is not going to be started.
In this case, we do not want the watchdog timer to be started
because there is no one to keep it from resetting.

This code change prevents the watchdog from being started
during poweron.

Potential side affects could be if we do start the host
in this code path.  The watchdog is un-tested when it's
not started but software comes in and tries to reset it.
The code in control_host_obj.c currently enforces the
no-host-power-on when debug_mode is set.
---
 pychassisctl/chassis_control.py | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)
 mode change 100644 => 100755 pychassisctl/chassis_control.py

diff --git a/pychassisctl/chassis_control.py b/pychassisctl/chassis_control.py
old mode 100644
new mode 100755
index 8d34e2e..56a2116
--- a/pychassisctl/chassis_control.py
+++ b/pychassisctl/chassis_control.py
@@ -67,6 +67,11 @@ class ChassisControlObject(DbusProperties, DbusObjectManager):
                 'object_name': '/org/openbmc/settings/host0',
                 'interface_name': 'org.freedesktop.DBus.Properties'
             },
+            'host_control': {
+                'bus_name': 'org.openbmc.control.Host',
+                'object_name': '/org/openbmc/control/host0',
+                'interface_name': 'org.openbmc.control.Host'
+            },
         }
 
         # uuid
@@ -129,11 +134,22 @@ class ChassisControlObject(DbusProperties, DbusObjectManager):
         if (self.getPowerState() == 0):
             intf = self.getInterface('power_control')
             intf.setPowerState(POWER_ON)
-            intfwatchdog = self.getInterface('watchdog')
-            # Start watchdog with 30s timeout per the OpenPower Host IPMI Spec
-            #Once the host starts booting, it'll reset and refresh the timer
-            intfwatchdog.set(30000)
-            intfwatchdog.start()
+
+            # Determine if debug_mode is set.  If it is then we don't
+            # want to start the watchdog since debug mode
+            intfcontrol = self.getInterface('host_control')
+            intfproperties = dbus.Interface(intfcontrol,
+                                            "org.freedesktop.DBus.Properties")
+            debug_mode = intfproperties.Get('org.openbmc.control.Host',
+                                            'debug_mode')
+            if(not debug_mode):
+                intfwatchdog = self.getInterface('watchdog')
+                # Start watchdog with 30s timeout per the OpenPower Host IPMI Spec
+                #Once the host starts booting, it'll reset and refresh the timer
+                intfwatchdog.set(30000)
+                intfwatchdog.start()
+            else:
+                print "Debug mode is on, no watchdog"
         return None
 
     @dbus.service.method(DBUS_NAME,
-- 
2.9.0
