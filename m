Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 75F751A0EB4
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jan 2016 04:50:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1451584227380717.8625530221888;
 Thu, 31 Dec 2015 09:50:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: William <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid] Add ipmi cold-reset command, which call a
 dbus method. 1. A method dbus_cold_reset() to talk with the dbus method
 'place_holder'; 2. Also get service name by object mapper which is
 object_mapper_get_connection(); 3. Register the ipmi command;
 4. Add related .o to the Makefile.
Date: Thu, 31 Dec 2015 11:50:25 -0600
Message-Id: <1451584225-22761-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451584225-22761-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1451584225-22761-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 31 Dec 2015 17:50:34 -0000

From: William <bjlinan@cn.ibm.com>

---
 Makefile        |   2 +-
 globalhandler.C | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 globalhandler.h |  12 +++++
 3 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 globalhandler.C
 create mode 100644 globalhandler.h

diff --git a/Makefile b/Makefile
index 57ad6fe..2c9b37e 100644
--- a/Makefile
+++ b/Makefile
@@ -15,7 +15,7 @@ LIB_APP_OBJ = apphandler.o     \
               ipmisensor.o     \
               storageaddsel.o  \
               transporthandler.o  \
-
+              globalhandler.o  \
 
 TESTADDSEL_OBJ = $(TESTADDSEL).o \
                  storageaddsel.o
diff --git a/globalhandler.C b/globalhandler.C
new file mode 100644
index 0000000..0e2aec4
--- /dev/null
+++ b/globalhandler.C
@@ -0,0 +1,160 @@
+#include "globalhandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+const char  *control_object_name  =  "/org/openbmc/control/bmc0";
+const char  *control_intf_name    =  "org.openbmc.control.Bmc";
+
+const char  *objectmapper_service_name =  "org.openbmc.objectmapper";
+const char  *objectmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
+const char  *objectmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
+
+void register_netfn_global_functions() __attribute__((constructor));
+
+int obj_mapper_get_connection(char** buf, const char* obj_path)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char *temp_buf = NULL, *intf = NULL;
+    size_t buf_size = 0;
+    int r;
+
+    // Open the system bus where most system services are provided.
+    r = sd_bus_open_system(&bus);
+    if (r < 0) {
+        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+        goto finish;
+    }
+
+    // Bus, service, object path, interface and method are provided to call
+    // the method.
+    // Signatures and input arguments are provided by the arguments at the
+    // end.
+    r = sd_bus_call_method(bus,
+            objectmapper_service_name,                      /* service to contact */
+            objectmapper_object_name,                       /* object path */
+            objectmapper_intf_name,                         /* interface name */
+            "GetObject",                                 /* method name */
+            &error,                                      /* object to return error in */
+            &m,                                          /* return message on success */
+            "s",                                         /* input signature */
+            obj_path                                     /* first argument */
+            );
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+        goto finish;
+    }
+
+    // Get the key, aka, the connection name
+    sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
+    // TODO: check the return code. Currently for no reason the message
+    // parsing of object mapper is always complaining about
+    // "Device or resource busy", but the result seems OK for now. Need
+    // further checks.
+    //r = sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
+    //if (r < 0) {
+    //    fprintf(stderr, "Failed to parse response message: %s\n", strerror(-r));
+    //    goto finish;
+    //}
+
+    buf_size = strlen(temp_buf) + 1;
+    printf("IPMID connection name: %s\n", temp_buf);
+    *buf = (char*)malloc(buf_size);
+
+    if (*buf == NULL) {
+        fprintf(stderr, "Malloc failed for get_sys_boot_options");
+        r = -1;
+        goto finish;
+    }
+
+    memcpy(*buf, temp_buf, buf_size);
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    sd_bus_unref(bus);
+
+    return r;
+}
+
+int dbus_cold_reset()
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char* temp_buf = NULL;
+    uint8_t* get_value = NULL;
+    char* connection = NULL;
+    int r, i;
+
+    r = obj_mapper_get_connection(&connection, control_object_name);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get connection, return value: %d.\n", r);
+        goto finish;
+    }
+
+    printf("connection: %s\n", connection);
+
+    // Open the system bus where most system services are provided.
+    r = sd_bus_open_system(&bus);
+    if (r < 0) {
+        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+        goto finish;
+    }
+
+    // Bus, service, object path, interface and method are provided to call
+    // the method.
+    // Signatures and input arguments are provided by the arguments at the
+    // end.
+    // TODO: the method is a place holder, not cold reset, need to call the correct
+    // method.
+    r = sd_bus_call_method(bus,
+            connection,                                /* service to contact */
+            control_object_name,                       /* object path */
+            control_intf_name,                         /* interface name */
+            "place_holder",                            /* method name */
+            &error,                                    /* object to return error in */
+            &m,                                        /* return message on success */
+            NULL,
+            NULL
+            );
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+        goto finish;
+    }
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    sd_bus_unref(bus);
+    free(connection);
+
+    return r;
+}
+
+ipmi_ret_t ipmi_global_cold_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    printf("Handling GLOBAL COLD RESET Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+
+    // TODO: call the correct dbus method for cold reset.
+    // Currently the reboot method called is just a placeholder. 
+    dbus_cold_reset();
+
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+    return rc;
+}
+
+void register_netfn_global_functions()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_COLD_RESET);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_COLD_RESET, NULL, ipmi_global_cold_reset);
+}
diff --git a/globalhandler.h b/globalhandler.h
new file mode 100644
index 0000000..185e7df
--- /dev/null
+++ b/globalhandler.h
@@ -0,0 +1,12 @@
+#ifndef __HOST_IPMI_GLOBAL_HANDLER_H__
+#define __HOST_IPMI_GLOBAL_HANDLER_H__
+
+#include <stdint.h>
+
+// Various GLOBAL operations under a single command.
+enum ipmi_global_control_cmds : uint8_t
+{
+	IPMI_CMD_COLD_RESET 			   = 0x02,
+};
+
+#endif
-- 
2.6.4
