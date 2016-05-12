Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5KJJ1TBMzDqDV
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 03:10:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463073044219448.2175622114438;
 Thu, 12 May 2016 10:10:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid] Handle errors finding openbmc_path #75
Date: Thu, 12 May 2016 12:10:41 -0500
Message-Id: <1463073041-21479-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463073041-21479-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463073041-21479-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 May 2016 17:10:56 -0000

From: Nan Li <bjlinan@cn.ibm.com>

1.Check return value properly.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 ipmid.C         | 10 ++++++++++
 sensorhandler.C |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/ipmid.C b/ipmid.C
index 728ba0b..413c2b7 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -565,6 +565,11 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
 
     r = find_openbmc_path("SENSOR", number, &a);
 
+    if (r < 0) {
+        fprintf(stderr, "Failed to find Sensor 0x%02x\n", number);
+        goto final;
+    }
+
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
@@ -602,6 +607,11 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
 
     r = find_openbmc_path("SENSOR", number, &a);
 
+    if (r < 0) {
+        fprintf(stderr, "Failed to find Sensor 0x%02x\n", number);
+        goto final;
+    }
+
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
diff --git a/sensorhandler.C b/sensorhandler.C
index bb14e7a..d70c449 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -180,6 +180,13 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     r = find_openbmc_path("SENSOR", reqptr->sennum, &a);
 
+    if (r < 0) {
+        fprintf(stderr, "Failed to find Sensor 0x%02x\n", reqptr->sennum);
+        *data_len=0;
+        rc = IPMI_CC_SENSOR_INVALID;
+        goto final;
+    }
+
     type = find_sensor(reqptr->sennum);
 
     fprintf(stderr, "Bus: %s, Path: %s, Interface: %s\n", a.bus, a.path, a.interface);
@@ -220,6 +227,7 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             break;
     }
 
+final:
 
     reply = sd_bus_message_unref(reply);
 
-- 
2.8.1
