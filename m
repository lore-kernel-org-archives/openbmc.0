Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3FC261A081F
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 13:13:40 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445048017452250.25401136015876;
 Fri, 16 Oct 2015 19:13:37 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 2/5] Add routines for getting lookup data
 from the system dbus object
Date: Fri, 16 Oct 2015 21:13:29 -0500
Message-Id: <1445048012-11082-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445048012-11082-1-git-send-email-patches@stwcx.xyz>
References: <1445048012-11082-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 17 Oct 2015 02:13:40 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/ipmid.C b/ipmid.C
index 87f993e..db2f6b9 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -426,3 +426,124 @@ finish:
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 
 }
+
+
+#define MAX_DBUS_PATH 128
+struct dbus_interface_t {
+    uint8_t  sensornumber;
+    uint8_t  sensortype;
+
+    char  bus[MAX_DBUS_PATH];
+    char  path[MAX_DBUS_PATH];
+    char  interface[MAX_DBUS_PATH];
+};
+
+
+
+// Use a lookup table to find the interface name of a specific sensor
+// This will be used until an alternative is found.  this is the first
+// step for mapping IPMI
+int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *interface) {
+
+    const char  *busname = "org.openbmc.managers.System";
+    const char  *objname = "/org/openbmc/managers/System";
+
+    char  *str1, *str2, *str3;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+
+
+    int r;
+
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,busname,"getObjectFromByteId");
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
+    }
+
+    r = sd_bus_message_append(m, "sy", type, num);
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+    }
+
+    // Call the IPMI responder on the bus so the message can be sent to the CEC
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        goto final;
+    }
+
+
+    r = sd_bus_message_read(reply, "(sss)", &str1, &str2, &str3);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
+        goto final;
+    }
+
+    strncpy(interface->bus, str1, MAX_DBUS_PATH);
+    strncpy(interface->path, str2, MAX_DBUS_PATH);
+    strncpy(interface->interface, str3, MAX_DBUS_PATH);
+
+    interface->sensornumber = num;
+
+
+final:
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
+    return r;
+}
+
+
+/////////////////////////////////////////////////////////////////////
+//
+// Routines used by ipmi commands wanting to interact on the dbus
+//
+/////////////////////////////////////////////////////////////////////
+
+
+// Simple set routine because some methods are standard.
+int set_sensor_dbus_state(uint8_t number, const char *method, const char *value) {
+
+
+    dbus_interface_t a;
+    int r;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+
+    printf("Attempting to set a dbus Sensor 0x%02x via %s with a value of %s\n",
+        number, method, value);
+
+    r = find_openbmc_path("SENSOR", number, &a);
+
+    printf("**********************\n");
+    printf("%s\n", a.bus);
+    printf("%s\n", a.path);
+    printf("%s\n", a.interface);
+
+
+    r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
+    }
+
+    r = sd_bus_message_append(m, "s", value);
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+    }
+
+    // Call the IPMI responder on the bus so the message can be sent to the CEC
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+    }
+
+
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
+    return 0;
+
+
+}
-- 
2.6.0
