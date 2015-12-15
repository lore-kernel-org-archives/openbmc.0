Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0806B1A06CD
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:58 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218054626197.76926864941754;
 Tue, 15 Dec 2015 14:20:54 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 1/2] Add support for get-sensor-reading
Date: Tue, 15 Dec 2015 16:20:52 -0600
Message-Id: <1450218053-12108-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218053-12108-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218053-12108-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:59 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C         | 24 ++++++++---------
 ipmid.H         |  4 ++-
 ipmisensor.C    | 32 ++++++++++++-----------
 sensorhandler.C | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sensorhandler.h |  1 +
 testit.C        | 36 +++++++++++++++-----------
 6 files changed, 133 insertions(+), 44 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 76e612d..ee8b0ca 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -560,18 +560,15 @@ final:
 // Routines used by ipmi commands wanting to interact on the dbus
 //
 /////////////////////////////////////////////////////////////////////
-
-
-// Simple set routine because some methods are standard.
-int set_sensor_dbus_state(uint8_t number, const char *method, const char *value) {
+int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *value) {
 
 
     dbus_interface_t a;
     int r;
     sd_bus_error error = SD_BUS_ERROR_NULL;
-    sd_bus_message *reply = NULL, *m=NULL;
+    sd_bus_message *m=NULL;
 
-    fprintf(ipmidbus, "Attempting to set a dbus Sensor 0x%02x via %s with a value of %s\n",
+    fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
         number, method, value);
 
     r = find_openbmc_path("SENSOR", number, &a);
@@ -581,23 +578,24 @@ int set_sensor_dbus_state(uint8_t number, const char *method, const char *value)
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
     }
 
-    r = sd_bus_message_append(m, "s", value);
+    r = sd_bus_message_append(m, "v", "s", value);
     if (r < 0) {
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
     }
 
-    r = sd_bus_call(bus, m, 0, &error, &reply);
+
+    r = sd_bus_call(bus, m, 0, &error, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed to call the method: %s", strerror(-r));
     }
 
+
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
 
     return 0;
 }
-
-int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
+int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t value) {
 
 
     dbus_interface_t a;
@@ -605,7 +603,7 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m=NULL;
 
-    fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
+    fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of 0x%02x\n",
         number, method, value);
 
     r = find_openbmc_path("SENSOR", number, &a);
@@ -615,7 +613,7 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
     }
 
-    r = sd_bus_message_append(m, "v", "s", value);
+    r = sd_bus_message_append(m, "v", "y", value);
     if (r < 0) {
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
     }
@@ -631,4 +629,4 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
     sd_bus_message_unref(m);
 
     return 0;
-}
+}
\ No newline at end of file
diff --git a/ipmid.H b/ipmid.H
index 3de2c8c..e00faad 100644
--- a/ipmid.H
+++ b/ipmid.H
@@ -20,4 +20,6 @@ ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_
 
 extern FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
-#endif
+int set_sensor_dbus_state_s(uint8_t , const char *, const char *);
+int set_sensor_dbus_state_y(uint8_t , const char *, const uint8_t);
+#endif
\ No newline at end of file
diff --git a/ipmisensor.C b/ipmisensor.C
index 1f60f64..b6927ac 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -2,10 +2,10 @@
 #include <string.h>
 #include <stdint.h>
 #include <malloc.h>
-
+#include <ipmid.H>
+#include "sensorhandler.h"
 
 extern uint8_t find_sensor(uint8_t);
-extern int set_sensor_dbus_state_v(uint8_t , const char *, char *);
 
 
 struct sensorRES_t {
@@ -30,19 +30,20 @@ struct lookup_t {
 	uint8_t sensor_type;
 	uint8_t offset;
 	int (*func)(const sensorRES_t *, const lookup_t *, const char *);
-	char    method[16];
+	char    member[16];
 	char    assertion[64];
 	char    deassertion[64];
 };
 
-
-extern int updateDbusInterface(uint8_t , const char *, const char *) ;
-extern int set_sensor_dbus_state(uint8_t ,const char *, const char *);
+extern int updateDbusInterface(uint8_t , const char *, const char *);
+extern int find_openbmc_path(const char *, const uint8_t , dbus_interface_t *) ;
 
 
 int set_sensor_dbus_state_simple(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
 
-	return set_sensor_dbus_state(pRec->sensor_number, pTable->method, value);
+	return set_sensor_dbus_state_s(pRec->sensor_number,
+                                   pTable->member,
+                                   value);
 }
 
 struct event_data_t {
@@ -133,18 +134,17 @@ int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pT
 					break;
 	}
 
-	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, p);
+	return set_sensor_dbus_state_s(pRec->sensor_number,
+                                   pTable->member,
+                                   p);
 }
 
 // Handling this special OEM sensor by coping what is in byte 4.  I also think that is odd
 // considering byte 3 is for sensor reading.  This seems like a misuse of the IPMI spec
 int set_sensor_dbus_state_osbootcount(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
-	char valuestring[32];
-	char* pStr = valuestring;
-
-	sprintf(valuestring, "%d", pRec->assert_state7_0);
-
-	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
+	return set_sensor_dbus_state_y(pRec->sensor_number,
+                                   "setValue",
+                                   pRec->assert_state7_0);
 }
 
 int set_sensor_dbus_state_system_event(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
@@ -167,7 +167,9 @@ int set_sensor_dbus_state_system_event(const sensorRES_t *pRec, const lookup_t *
 					break;
 	}
 
-	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, p);
+	return set_sensor_dbus_state_s(pRec->sensor_number,
+                                   pTable->member,
+                                   p);
 }
 
 
diff --git a/sensorhandler.C b/sensorhandler.C
index c96b7a7..d171bf5 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -3,6 +3,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
+#include <systemd/sd-bus.h>
 
 extern int updateSensorRecordFromSSRAESC(const void *);
 extern int find_interface_property_fru_type(dbus_interface_t *interface, const char *property_name, char *property_value) ;
@@ -32,6 +33,7 @@ sensorTypemap_t g_SensorTypeMap[] = {
     {0x12, 0x6F, "SYSTEM_EVENT"},
     {0xC7, 0x03, "SYSTEM"},
     {0xC7, 0x03, "MAIN_PLANAR"},
+    {0xC2, 0x6F, "PowerCap"},
     {0xFF, 0x00, ""},
 };
 
@@ -40,6 +42,11 @@ struct sensor_data_t {
     uint8_t sennum;
 }  __attribute__ ((packed)) ;
 
+struct sensorreadingresp_t {
+    uint8_t value;
+    uint8_t operation;
+    uint8_t indication[2];
+}  __attribute__ ((packed)) ;
 
 uint8_t dbus_to_sensor_type(char *p) {
 
@@ -104,6 +111,10 @@ uint8_t find_sensor(uint8_t sensor_number) {
     return r;
  }
 
+
+
+
+
 ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
@@ -149,6 +160,72 @@ ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+
+ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    sensor_data_t *reqptr = (sensor_data_t*)request;
+    ipmi_ret_t rc = IPMI_CC_SENSOR_INVALID;
+    uint8_t type;
+    sensorreadingresp_t *resp = (sensorreadingresp_t*) response;
+    int r;
+    dbus_interface_t a;
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+    sd_bus_message *reply = NULL;
+    uint8_t reading;
+
+
+    printf("IPMI GET_SENSOR_READING [0x%02x]\n",reqptr->sennum);
+
+    r = find_openbmc_path("SENSOR", reqptr->sennum, &a);
+
+    type = find_sensor(reqptr->sennum);
+
+    fprintf(stderr, "Bus: %s, Path: %s, Interface: %s\n", a.bus, a.path, a.interface);
+
+    *data_len=0;
+
+    switch(type) {
+        case 0xC3:
+        case 0xC2:
+            r = sd_bus_get_property(bus,a.bus, a.path, a.interface, "value", NULL, &reply, "y");
+            if (r < 0) {
+                fprintf(stderr, "Failed to call sd_bus_get_property:%d,  %s\n", r, strerror(-r));
+                fprintf(stderr, "Bus: %s, Path: %s, Interface: %s\n",
+                        a.bus, a.path, a.interface);
+                break;
+            }
+
+            r = sd_bus_message_read(reply, "y", &reading);
+            if (r < 0) {
+                fprintf(stderr, "Failed to read byte: %s\n", strerror(-r));
+                break;
+            }
+
+            printf("Contents of a 0x%02x is 0x%02x\n", type, reading);
+
+            rc = IPMI_CC_OK;
+            *data_len=sizeof(sensorreadingresp_t);
+
+            resp->value         = reading;
+            resp->operation     = 0;
+            resp->indication[0] = 0;
+            resp->indication[1] = 0;
+            break;
+
+        default:
+            *data_len=0;
+            rc = IPMI_CC_SENSOR_INVALID;
+            break;
+    }
+
+
+    sd_bus_message_unref(reply);
+
+    return rc;
+}
+
 ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
@@ -173,5 +250,8 @@ void register_netfn_sen_functions()
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
diff --git a/testit.C b/testit.C
index bfd9334..7ea5d5d 100644
--- a/testit.C
+++ b/testit.C
@@ -37,25 +37,31 @@ char g_results_method[64];
 char g_results_value[64];
 
 
-int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
-    printf("Attempting to log Variant Sensor 0x%02x via %s with a value of %s\n",
-        number, method, value);
+int set_sensor_dbus_state_s(unsigned char number, const char *member, const char *value) {
+    printf("Attempting to log 0x%02x via %s with a value of %s\n",
+        number, member, value);
 
-    strcpy(g_results_method, method);
+    strcpy(g_results_method, member);
     strcpy(g_results_value, value);
 
     return 0;
 }
 
-int set_sensor_dbus_state(uint8_t number, const char *method, const char *value) {
+int set_sensor_dbus_state_y(unsigned char number, char const* member, uint8_t value) {
+    
+    char val[2];
 
-	printf("Attempting to log Sensor 0x%02x via %s with a value of %s\n",
-		number, method, value);
 
-    strcpy(g_results_method, method);
-    strcpy(g_results_value, value);
+    printf("Attempting to log Variant Sensor 0x%02x via %s with a value of 0x%02x\n",
+        number, member, value);
 
-	return 0;
+
+    snprintf(val, 2, "%d", value);
+
+    strcpy(g_results_method, member);
+    strcpy(g_results_value, val);
+
+    return 0;
 }
 
 
@@ -103,11 +109,11 @@ void testprep(void) {
 
 int main() {
 
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootprogress), "setValue", "FW Progress, Docking station attachment");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor1), "setPresent", "True");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor2), "setPresent", "False");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_procfailed), "setFault", "False");
-    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootcount), "setValue", "3");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootprogress), "value", "FW Progress, Docking station attachment");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor1), "present", "True");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor2), "present", "False");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_procfailed), "fault", "False");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootcount), "value", "3");
     testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_invalidnumber), "", "");
 
 	return 0;
-- 
2.6.3
