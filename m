Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 025C01A0CEF
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:43:11 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208987688878.8290845615162;
 Fri, 30 Oct 2015 05:43:07 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] rename watchdog interface because it was
 renamed on the dbus side
Date: Fri, 30 Oct 2015 07:43:04 -0500
Message-Id: <1446208984-26388-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446208984-26388-1-git-send-email-patches@stwcx.xyz>
References: <1446208984-26388-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:43:12 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 apphandler.C | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 109aaa9..5d81fb4 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -182,7 +182,7 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     const char  *busname = "org.openbmc.watchdog.Host";
-    const char  *objname = "/org/openbmc/watchdog/HostWatchdog_0";
+    const char  *objname = "/org/openbmc/watchdog/host0";
     const char  *iface = "org.openbmc.Watchdog";
     sd_bus_message *reply = NULL, *m = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
@@ -259,7 +259,7 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     const char  *busname = "org.openbmc.watchdog.Host";
-    const char  *objname = "/org/openbmc/watchdog/HostWatchdog_0";
+    const char  *objname = "/org/openbmc/watchdog/host0";
     const char  *iface = "org.openbmc.Watchdog";
     sd_bus_message *reply = NULL, *m = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
-- 
2.6.0
