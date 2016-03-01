Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3AA201A06C2
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 07:10:53 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456863047425347.16015019159033;
 Tue, 1 Mar 2016 12:10:47 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Fix host watchdog timer taking double the time to
 expire
Date: Tue,  1 Mar 2016 14:10:45 -0600
Message-Id: <1456863045-28360-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456863045-28360-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456863045-28360-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Mar 2016 20:10:53 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The g_timeout_add() glib interface does not spawn immediately after it's called
but instead it runs for the first time after the specified interval.

Therefore need to set the watchdog property to 0 instead of 1 when the watchdog starts, and let
subsequent watchdog refresh calls set it to 1, otherwise the watchdog timer expires in double the time that was specified: it waits the interval time and sees it's 1 then waits a 2nd round to see it's 0.
---
 objects/host_watchdog_obj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/objects/host_watchdog_obj.c b/objects/host_watchdog_obj.c
index e3da8cb..dbc4119 100644
--- a/objects/host_watchdog_obj.c
+++ b/objects/host_watchdog_obj.c
@@ -59,7 +59,7 @@ on_start        (Watchdog  *wd,
                 gpointer                user_data)
 {
   	remove_watchdog();
-  	watchdog_set_watchdog(wd,1);
+  	watchdog_set_watchdog(wd,0);
 	guint poll_interval = watchdog_get_poll_interval(wd);
     g_print("Starting watchdog with poll interval: %d\n", poll_interval);
   	watchdogid = g_timeout_add(poll_interval, poll_watchdog, user_data);
-- 
2.7.1
