Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 65E2A1A01DF
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 11:20:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449102029012210.98401118159802;
 Wed, 2 Dec 2015 16:20:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Alignment and double error
Date: Wed,  2 Dec 2015 19:20:26 -0500
Message-Id: <1449102026-16402-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449102026-16402-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449102026-16402-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Dec 2015 00:20:35 -0000

From: Chris Austen <austenc@us.ibm.com>

Fixed a pointer pointer issue where no one had the storage for a uint16_t
Fixed the double error log on palmetto systems needed a reconfig loop
---
 ipmid.C         | 19 ++++++++++---------
 sensorhandler.C | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 sensorhandler.h |  1 +
 storageaddsel.C | 30 ++++++------------------------
 4 files changed, 65 insertions(+), 33 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index f1f938c..5b17036 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -186,7 +186,7 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
 
     r = sd_bus_message_new_method_call(bus,&m,dest,path,DBUS_INTF,"sendMessage");
     if (r < 0) {
-        fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
+        fprintf(stderr, "Failed to add the method object: %s %s\n", __FUNCTION__, strerror(-r));
         return -1;
     }
 
@@ -198,14 +198,14 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     // Add the bytes needed for the methods to be called
     r = sd_bus_message_append(m, "yyyyy", seq, netfn, lun, cmd, cc);
     if (r < 0) {
-        fprintf(stderr, "Failed add the netfn and others : %s\n", strerror(-r));
-        return -1;
+        fprintf(stderr, "Failed add the netfn and others : %s %s\n", __FUNCTION__, strerror(-r));
+        goto final;
     }
 
     r = sd_bus_message_append_array(m, 'y', buf, len);
     if (r < 0) {
-        fprintf(stderr, "Failed to add the string of response bytes: %s\n", strerror(-r));
-        return -1;
+        fprintf(stderr, "Failed to add the string of response bytes: %s %s\n", __FUNCTION__, strerror(-r));
+        goto final;
     }
 
 
@@ -213,18 +213,19 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(bus, m, 0, &error, &reply);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
-        return -1;
+        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION__, strerror(-r));
+        goto final;
     }
 
     r = sd_bus_message_read(reply, "x", &pty);
     if (r < 0) {
-       fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
-
+       fprintf(stderr, "Failed to get a rc from the method: %s %s\n", __FUNCTION__, strerror(-r));
     }
 
+final:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
 
 
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
diff --git a/sensorhandler.C b/sensorhandler.C
index dd83152..131da71 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -29,6 +29,7 @@ sensorTypemap_t g_SensorTypeMap[] = {
     {0xe9, 0x09, "OccStatus"},  // E9 is an internal mapping to handle sensor type code os 0x09
     {0xC3, 0x6F, "BootCount"},
     {0x1F, 0x6F, "OperatingSystemStatus"},
+    {0x12, 0x6F, "SYSTEM"},
     {0xFF, 0x00, ""},
 };
 
@@ -39,6 +40,14 @@ struct sensor_data_t {
 }  __attribute__ ((packed)) ;
 
 
+struct sensor_reading_ret_t {
+    uint8_t reading;
+    uint8_t options;
+    uint8_t assert[2];
+}  __attribute__ ((packed)) ;
+
+
+
 uint8_t dbus_to_sensor_type(char *p) {
 
     sensorTypemap_t *s = g_SensorTypeMap;
@@ -155,6 +164,42 @@ ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+
+ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    sensor_data_t *reqptr = (sensor_data_t*)request;
+    sensor_reading_ret_t ret;
+    ipmi_ret_t rc;
+
+    printf("IPMI GET_SENSOR_READING [0x%02x]\n",reqptr->sennum);
+
+
+    // TODO Call dbus method to get teh real state of the sensor and
+    // translate it to IPMI.  For now stop every boot of a Palmetto
+    // from creating error logs about missing the Reboot Sensor.
+    if (reqptr->sennum == 9) {
+        ret.reading = 2;
+        ret.options = 0;
+        ret.assert[0] = 0;
+        ret.assert[1] = 0;
+
+        *data_len = sizeof(ret);
+        memcpy(response, &ret, *data_len);
+        rc = IPMI_CC_OK;
+
+    } else {
+        *data_len = 0;
+        rc = IPMI_CC_SENSOR_INVALID;
+    }
+
+
+    return rc;
+}
+
+
+
 ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
@@ -179,5 +224,8 @@ void register_netfn_sen_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_SET_SENSOR);
     ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_SET_SENSOR, NULL, ipmi_sen_set_sensor);
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_READING);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_READING, NULL, ipmi_sen_get_sensor_reading);
+
     return;
 }
diff --git a/sensorhandler.h b/sensorhandler.h
index 7b89a18..dd940dc 100644
--- a/sensorhandler.h
+++ b/sensorhandler.h
@@ -6,6 +6,7 @@
 // IPMI commands for net functions.
 enum ipmi_netfn_sen_cmds
 {
+    IPMI_CMD_GET_SENSOR_READING = 0x2D,
     IPMI_CMD_GET_SENSOR_TYPE = 0x2F,
     IPMI_CMD_SET_SENSOR      = 0x30,
 };
diff --git a/storageaddsel.C b/storageaddsel.C
index 345dfd5..991c78d 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -155,7 +155,7 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
 	sd_bus *mbus = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
-    uint16_t *pty;
+    uint16_t x;
     int r;
 
     mbus = ipmid_get_sd_bus_connection();
@@ -181,26 +181,22 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
         fprintf(stderr, "Failed to add the raw array of bytes: %s\n", strerror(-r));
         return -1;
     }
-
     // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(mbus, m, 0, &error, &reply);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION__, strerror(-r));
         return -1;
     }
-
-    r = sd_bus_message_read(reply, "q", &pty);
+    r = sd_bus_message_read(reply, "q", &x);
     if (r < 0) {
         fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
-    } else {
-        r = *pty;
     }
 
+finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_message_unref(reply);
-
-    return r;
+    return 0;
 }
 
 
@@ -213,41 +209,27 @@ void send_esel(uint16_t recordid) {
 	int r;
 
 	uint8_t hack[] = {0x30, 0x32, 0x34};
-
 	asprintf(&path,"%s%04x", "/tmp/esel", recordid);
-
 	sz = getfilestream(path, &buffer);
-
 	if (sz == 0) {
 		printf("Error file does not exist %d\n",__LINE__);
 		free(path);
 		return;
 	}
 
-
 	sev = create_esel_severity(buffer);
-
 	create_esel_association(buffer, &assoc);
-
 	create_esel_description(buffer, sev, &desc);
 
-
 	// TODO until ISSUE https://github.com/openbmc/rest-dbus/issues/2
 	// I cant send extended ascii chars.  So 0,2,4 for now...
-	r = send_esel_to_dbus(desc, sev, assoc, hack, 3);
-
-	asprintf(&pathsent,"%s_%d", path, r);
-
-
-	rename(path, pathsent);
+	send_esel_to_dbus(desc, sev, assoc, hack, 3);
 
 	free(path);
 	free(pathsent);
 	free(assoc);
 	free(desc);
-
 	delete[] buffer;
 
-
 	return;
 }
-- 
2.6.3
