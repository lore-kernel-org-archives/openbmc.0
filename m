Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8HyZ3sGMzDq9n
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 23:20:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463491243671258.63062029263733;
 Tue, 17 May 2016 06:20:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid v3] Handle errors finding openbmc_path #75
Date: Tue, 17 May 2016 08:20:40 -0500
Message-Id: <1463491240-24607-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463491240-24607-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463491240-24607-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 13:20:55 -0000

From: Nan Li <bjlinan@cn.ibm.com>

1.Check return value properly.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 ipmid.C         | 10 ++++++++++
 sensorhandler.C |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/ipmid.C b/ipmid.C
index 728ba0b..5d7fbe7 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -565,6 +565,11 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
 
     r = find_openbmc_path("SENSOR", number, &a);
 
+    if (r < 0) {
+        fprintf(stderr, "Failed to find Sensor 0x%02x\n", number);
+        return 0;
+    }
+
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
@@ -602,6 +607,11 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
 
     r = find_openbmc_path("SENSOR", number, &a);
 
+    if (r < 0) {
+        fprintf(stderr, "Failed to find Sensor 0x%02x\n", number);
+        return 0;
+    }
+
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
diff --git a/sensorhandler.C b/sensorhandler.C
index bb14e7a..39de660 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -180,6 +180,11 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     r = find_openbmc_path("SENSOR", reqptr->sennum, &a);
 
+    if (r < 0) {
+        fprintf(stderr, "Failed to find Sensor 0x%02x\n", reqptr->sennum);
+        return IPMI_CC_SENSOR_INVALID;
+    }
+
     type = find_sensor(reqptr->sennum);
 
     fprintf(stderr, "Bus: %s, Path: %s, Interface: %s\n", a.bus, a.path, a.interface);
-- 
2.8.2
