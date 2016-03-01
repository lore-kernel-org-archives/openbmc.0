Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 67CDB1A01D6
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 06:30:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456860641495423.2056950523953;
 Tue, 1 Mar 2016 11:30:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Read/Write Boot Count Sensor as int
Date: Tue,  1 Mar 2016 13:30:38 -0600
Message-Id: <1456860638-26968-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456860638-26968-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456860638-26968-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Mar 2016 19:30:49 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Change the dbus request to read/write the boot count sensor from byte to int.
Passing a type of byte causes the dbus interfaces to fail with ENXIO (no such device or address).
---
 ipmid.C         |  4 ++--
 sensorhandler.C | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 0f4139c..6b45c5c 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -614,7 +614,7 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
     }
 
-    r = sd_bus_message_append(m, "v", "y", value);
+    r = sd_bus_message_append(m, "v", "i", value);
     if (r < 0) {
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
     }
@@ -630,4 +630,4 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
     sd_bus_message_unref(m);
 
     return 0;
-}
\ No newline at end of file
+}
diff --git a/sensorhandler.C b/sensorhandler.C
index d171bf5..d1ff5a7 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -173,7 +173,7 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     dbus_interface_t a;
     sd_bus *bus = ipmid_get_sd_bus_connection();
     sd_bus_message *reply = NULL;
-    uint8_t reading;
+    int reading = 0;
 
 
     printf("IPMI GET_SENSOR_READING [0x%02x]\n",reqptr->sennum);
@@ -189,7 +189,7 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     switch(type) {
         case 0xC3:
         case 0xC2:
-            r = sd_bus_get_property(bus,a.bus, a.path, a.interface, "value", NULL, &reply, "y");
+            r = sd_bus_get_property(bus,a.bus, a.path, a.interface, "value", NULL, &reply, "i");
             if (r < 0) {
                 fprintf(stderr, "Failed to call sd_bus_get_property:%d,  %s\n", r, strerror(-r));
                 fprintf(stderr, "Bus: %s, Path: %s, Interface: %s\n",
@@ -197,9 +197,9 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                 break;
             }
 
-            r = sd_bus_message_read(reply, "y", &reading);
+            r = sd_bus_message_read(reply, "i", &reading);
             if (r < 0) {
-                fprintf(stderr, "Failed to read byte: %s\n", strerror(-r));
+                fprintf(stderr, "Failed to read sensor: %s\n", strerror(-r));
                 break;
             }
 
@@ -208,7 +208,7 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             rc = IPMI_CC_OK;
             *data_len=sizeof(sensorreadingresp_t);
 
-            resp->value         = reading;
+            resp->value         = (uint8_t)reading;
             resp->operation     = 0;
             resp->indication[0] = 0;
             resp->indication[1] = 0;
-- 
2.7.1
