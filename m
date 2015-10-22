Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E0A1C1A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:00:27 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536824710911.0395611756542;
 Thu, 22 Oct 2015 11:00:24 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Support for stop watchdog
Date: Thu, 22 Oct 2015 13:00:21 -0500
Message-Id: <1445536821-14903-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445536821-14903-1-git-send-email-patches@stwcx.xyz>
References: <1445536821-14903-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:00:28 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add interface to stop the currently running watchdog if any.
---
 bin/ipmi_example.py         |  4 ++++
 objects/host_watchdog_obj.c | 25 +++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/bin/ipmi_example.py b/bin/ipmi_example.py
index ba13b60..f8b921e 100755
--- a/bin/ipmi_example.py
+++ b/bin/ipmi_example.py
@@ -120,8 +120,12 @@ if __name__ == '__main__':
 	elif (cmd == "statewatchdog"):
 		intf = getWatchdog()
 		intf.start()
+	elif (cmd == "stopwatchdog"):
+		intf = getWatchdog()
+		intf.stop()
 	elif (cmd == "setwatchdog"):
 		count = int(sys.argv[2])
+		intf = getWatchdog()
 		intf.set(count)
 	else:
 		print "Unsupported command"
diff --git a/objects/host_watchdog_obj.c b/objects/host_watchdog_obj.c
index e4e4bab..b1c8f2b 100644
--- a/objects/host_watchdog_obj.c
+++ b/objects/host_watchdog_obj.c
@@ -8,7 +8,7 @@ static const gchar* dbus_object_path = "/org/openbmc/watchdog";
 static const gchar* dbus_name        = "org.openbmc.watchdog.Host";
 
 static GDBusObjectManagerServer *manager = NULL;
-
+static guint watchdogid = 0;
 
 static gboolean
 poll_watchdog(gpointer user_data)
@@ -21,6 +21,7 @@ poll_watchdog(gpointer user_data)
 	if (count == 0)
 	{
 		//watchdog error, emit error and stop watchdog
+		watchdogid = 0;
 		watchdog_emit_watchdog_error(watchdog);
 		return FALSE;
 	}
@@ -49,7 +50,7 @@ on_start        (Watchdog  *wd,
   	watchdog_set_watchdog(wd,1);
 	guint poll_interval = watchdog_get_poll_interval(wd);
     g_print("Starting watchdog with poll interval: %d\n", poll_interval);
-  	g_timeout_add(poll_interval, poll_watchdog, user_data);
+  	watchdogid = g_timeout_add(poll_interval, poll_watchdog, user_data);
 	watchdog_complete_start(wd,invocation);
 	return TRUE;
 }
@@ -64,7 +65,22 @@ on_poke         (Watchdog  *wd,
 	return TRUE;
 }
 
+static gboolean
+on_stop         (Watchdog  *wd,
+                GDBusMethodInvocation  *invocation,
+                gpointer                user_data)
+{
+    g_print("Stopping watchdog\n");
+
+    if (watchdogid)
+    {
+        g_source_remove(watchdogid);
+        watchdogid = 0;
+    }
 
+    watchdog_complete_stop(wd,invocation);
+    return TRUE;
+}
 
 static void 
 on_bus_acquired (GDBusConnection *connection,
@@ -107,6 +123,11 @@ on_bus_acquired (GDBusConnection *connection,
                     object); /* user_data */
 
         g_signal_connect (wd,
+                    "handle-stop",
+                    G_CALLBACK (on_stop),
+                    object); /* user_data */
+
+        g_signal_connect (wd,
                     "handle-set",
                     G_CALLBACK (set_poll_interval),
                     object); /* user_data */
-- 
2.6.0
