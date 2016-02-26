Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1C82E1A0B51
 for <openbmc@lists.ozlabs.org>; Sat, 27 Feb 2016 05:01:03 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456509649562322.81267300489617;
 Fri, 26 Feb 2016 10:00:49 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Fix memory leak in good paths in ipmid
Date: Fri, 26 Feb 2016 12:00:44 -0600
Message-Id: <1456509644-22601-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456509644-22601-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456509644-22601-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 26 Feb 2016 18:01:04 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 apphandler.C       |  3 +++
 transporthandler.C | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/apphandler.C b/apphandler.C
index a48059f..59eedd4 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -203,6 +203,7 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
 
     return rc;
 }
@@ -311,6 +312,7 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
 
     return rc;
 }
@@ -347,6 +349,7 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
 
     return rc;
 }
diff --git a/transporthandler.C b/transporthandler.C
index d43f1f9..f511d58 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -189,6 +189,10 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         return IPMI_CC_PARM_NOT_SUPPORTED;
     }
 
+    sd_bus_message_unref(reply);
+    sd_bus_message_unref(m);
+    sd_bus_error_free(&error);
+
     return rc;
 }
 
@@ -287,6 +291,10 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             return -1;
         }
 
+        sd_bus_message_unref(reply);
+        sd_bus_message_unref(m);
+        sd_bus_error_free(&error);
+
         printf("%s:%d:%d:%d:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
 
         memcpy((void*)&buf[0], &current_revision, 1);
@@ -347,6 +355,10 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             return IPMI_CC_RESPONSE_ERROR;
         }
 
+        sd_bus_message_unref(reply);
+        sd_bus_message_unref(m);
+        sd_bus_error_free(&error);
+
         memcpy((void*)&buf[0], &current_revision, 1);
 
         char *tokptr = NULL;
-- 
2.7.1
