Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6B7DC1A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:00:04 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536801236986.1310455504986;
 Thu, 22 Oct 2015 11:00:01 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Added Dynamic lookup for sensor types
Date: Thu, 22 Oct 2015 12:59:58 -0500
Message-Id: <1445536798-14692-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445536798-14692-1-git-send-email-patches@stwcx.xyz>
References: <1445536798-14692-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:00:05 -0000

From: Chris Austen <austenc@us.ibm.com>

Fixed bug where ipmi sensor readings > offset 7 where not asserted
Added testcases for code
Kept sensors 35,37-3A hardcoded until dbus side decides if they
want to represent them.
---
 ipmid.C         |  74 +++++++++++-------
 ipmisensor.C    |  89 ++++++++++++----------
 sensorhandler.C | 232 ++++++++++++++++++++++++--------------------------------
 sensorhandler.h |  13 +++-
 testit.C        | 174 +++++++++++++++---------------------------
 5 files changed, 269 insertions(+), 313 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 4f0831e..6514849 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -11,6 +11,7 @@
 #include "ipmid.H"
 #include <sys/time.h>
 #include <errno.h>
+#include "sensorhandler.h"
 
 
 sd_bus *bus = NULL;
@@ -427,18 +428,54 @@ finish:
 
 }
 
+// Use a lookup table to find the interface name of a specific sensor
+// This will be used until an alternative is found.  this is the first
+// step for mapping IPMI
+int find_interface_property_fru_type(dbus_interface_t *interface, const char *property_name, char *property_value) {
+
+    char  *str1, *str2, *str3;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+
+
+    int r;
 
-#define MAX_DBUS_PATH 128
-struct dbus_interface_t {
-    uint8_t  sensornumber;
-    uint8_t  sensortype;
 
-    char  bus[MAX_DBUS_PATH];
-    char  path[MAX_DBUS_PATH];
-    char  interface[MAX_DBUS_PATH];
-};
+    r = sd_bus_message_new_method_call(bus,&m,interface->bus,interface->path,"org.freedesktop.DBus.Properties","Get");
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
+        fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
+                interface->bus, interface->path, interface->interface);
+    }
 
+    r = sd_bus_message_append(m, "ss", "org.openbmc.InventoryItem", property_name);
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+        fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
+                interface->bus, interface->path, interface->interface);
+    }
 
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        goto final;
+    }
+
+    r = sd_bus_message_read(reply, "v",  "s", &str1) ;
+    if (r < 0) {
+        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
+        goto final;
+    }
+
+    strcpy(property_value, str1);
+
+final:
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
+    return r;
+}
 
 // Use a lookup table to find the interface name of a specific sensor
 // This will be used until an alternative is found.  this is the first
@@ -485,6 +522,8 @@ int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *int
 
     interface->sensornumber = num;
 
+    printf("%s\n", str2);
+
 
 final:
 
@@ -516,12 +555,6 @@ int set_sensor_dbus_state(uint8_t number, const char *method, const char *value)
 
     r = find_openbmc_path("SENSOR", number, &a);
 
-    printf("**********************\n");
-    printf("%s\n", a.bus);
-    printf("%s\n", a.path);
-    printf("%s\n", a.interface);
-
-
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
@@ -532,20 +565,15 @@ int set_sensor_dbus_state(uint8_t number, const char *method, const char *value)
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
     }
 
-    // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(bus, m, 0, &error, &reply);
     if (r < 0) {
         fprintf(stderr, "Failed to call the method: %s", strerror(-r));
     }
 
-
-
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
 
     return 0;
-
-
 }
 
 int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
@@ -561,12 +589,6 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
 
     r = find_openbmc_path("SENSOR", number, &a);
 
-    printf("**********************\n");
-    printf("%s\n", a.bus);
-    printf("%s\n", a.path);
-    printf("%s\n", a.interface);
-
-
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
@@ -578,14 +600,12 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
     }
 
 
-    // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(bus, m, 0, &error, NULL);
     if (r < 0) {
         fprintf(stderr, "12 Failed to call the method: %s", strerror(-r));
     }
 
 
-
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
 
diff --git a/ipmisensor.C b/ipmisensor.C
index 1a40411..dadee9f 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -3,7 +3,7 @@
 #include <stdint.h>
 
 
-extern unsigned char findSensor(char);
+extern uint8_t find_sensor(uint8_t);
 extern int set_sensor_dbus_state_v(uint8_t , const char *, char *);
 
 
@@ -82,13 +82,12 @@ event_data_t g_fwprogress02h[] = {
 
 char *getfw02string(uint8_t b) {
 
-	int i = 0;
 	event_data_t *p = g_fwprogress02h;
 
 	while(p->data != 0xFF) {
 		if (p->data == b) {
 			break;
-		} 
+		}
 		p++;
 	}
 
@@ -98,19 +97,20 @@ char *getfw02string(uint8_t b) {
 //  prior to calling the dbus code.  
 int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
 
-	char valuestring[48];
-	char* pStr = valuestring;
+	char valuestring[64];
+	char* p = valuestring;
 
 	switch (pTable->offset) {
 
-		case 0x00 : snprintf(valuestring, sizeof(valuestring), "POST Error, 0x%02x", pRec->event_data2);
+		case 0x00 : snprintf(p, sizeof(valuestring), "POST Error, 0x%02x", pRec->event_data2);
 					break;
-		case 0x01 : snprintf(valuestring, sizeof(valuestring), "FW Hang, 0x%02x", pRec->event_data2);
+		case 0x01 : snprintf(p, sizeof(valuestring), "FW Hang, 0x%02x", pRec->event_data2);
+					break;
+		case 0x02 : snprintf(p, sizeof(valuestring), "FW Progress, %s", getfw02string(pRec->event_data2));
 					break;
-		case 0x02 : snprintf(valuestring, sizeof(valuestring), "FW Progress, %s", getfw02string(pRec->event_data2));
 	}
 
-	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
+	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, p);
 }
 
 // Handling this special OEM sensor by coping what is in byte 4.  I also think that is odd
@@ -126,10 +126,12 @@ int set_sensor_dbus_state_osboot(const sensorRES_t *pRec, const lookup_t *pTable
 
 
 //  This table lists only senors we care about telling dbus about.
-//  Offset definition cab be found in section 42.2 of the IPMI 2.0 
+//  Offset definition cab be found in section 42.2 of the IPMI 2.0
 //  spec.  Add more if/when there are more items of interest.
 lookup_t g_ipmidbuslookup[] = {
 
+	{0x07, 0x00, set_sensor_dbus_state_simple, "setPresent", "False", "False"}, // OCC Inactive 0
+	{0x07, 0x01, set_sensor_dbus_state_simple, "setPresent", "True", "True"},   // OCC Active 1 
 	{0x07, 0x07, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
 	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
 	{0x0C, 0x06, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
@@ -138,8 +140,6 @@ lookup_t g_ipmidbuslookup[] = {
 	{0x0F, 0x01, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x00, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", "False"},
-	{0x07, 0x00, set_sensor_dbus_state_simple, "setPresent", "False", "False"}, // OCC Inactive 0
-	{0x07, 0x01, set_sensor_dbus_state_simple, "setPresent", "True", "True"},   // OCC Active 1 
 	{0xc3, 0x00, set_sensor_dbus_state_osboot, "setValue", "" ,""},
 
 	{0xFF, 0xFF, NULL, "", "", ""}
@@ -177,7 +177,7 @@ int findindex(const uint8_t sensor_type, int offset, int *index) {
 
 void debug_print_ok_to_dont_care(uint8_t stype, int offset)
 {
-	printf("Sensor should not be reported:  Type 0x%02x, Offset 0x%02x\n",
+	printf("LOOKATME: Sensor should not be reported:  Type 0x%02x, Offset 0x%02x\n",
 		stype, offset);
 }
 
@@ -196,34 +196,47 @@ bool shouldReport(uint8_t sensorType, int offset, int *index) {
 int updateSensorRecordFromSSRAESC(const void *record) {
 
 	sensorRES_t *pRec = (sensorRES_t *) record;
-	unsigned char stype;
+	uint8_t stype;
 	int index, i=0;
-	stype = findSensor(pRec->sensor_number);
-
-	// Scroll through each bit position .  Determine 
-	// if any bit is either asserted or Deasserted.
-	for(i=0;i<8;i++) {
-		if ((ISBITSET(pRec->assert_state7_0,i))  &&
-			(shouldReport(stype, i, &index)))
-		{
-			reportSensorEventAssert(pRec, index);
-		}
-		if ((ISBITSET(pRec->assert_state14_8,i+8))  &&
-			(shouldReport(stype, i+8, &index)))
-		{
-			reportSensorEventAssert(pRec, index);
-		}
-		if ((ISBITSET(pRec->deassert_state7_0,i))  &&
-			(shouldReport(stype, i, &index)))
-		{
-			reportSensorEventDeassert(pRec, index);
-		}
-		if ((ISBITSET(pRec->deassert_state14_8,i+8))  &&
-			(shouldReport(stype, i+8, &index)))
-		{
-			reportSensorEventDeassert(pRec, index);
+	stype = find_sensor(pRec->sensor_number);
+
+
+	// 0xC3 types use the assertion7_0 for the value to be set
+	// so skip the reseach and call the correct event reporting
+	// function
+	if (stype == 0xC3) {
+
+		shouldReport(stype, 0x00, &index);
+		reportSensorEventAssert(pRec, index);
+
+	} else {
+		// Scroll through each bit position .  Determine
+		// if any bit is either asserted or Deasserted.
+		for(i=0;i<8;i++) {
+			if ((ISBITSET(pRec->assert_state7_0,i))  &&
+				(shouldReport(stype, i, &index)))
+			{
+				reportSensorEventAssert(pRec, index);
+			}
+			if ((ISBITSET(pRec->assert_state14_8,i))  &&
+				(shouldReport(stype, i+8, &index)))
+			{
+				reportSensorEventAssert(pRec, index);
+			}
+			if ((ISBITSET(pRec->deassert_state7_0,i))  &&
+				(shouldReport(stype, i, &index)))
+			{
+				reportSensorEventDeassert(pRec, index);
+			}
+			if ((ISBITSET(pRec->deassert_state14_8,i))  &&
+				(shouldReport(stype, i+8, &index)))
+			{
+				reportSensorEventDeassert(pRec, index);
+			}
 		}
+
 	}
 
+
 	return 0;
 }
diff --git a/sensorhandler.C b/sensorhandler.C
index 0b16d10..9344abd 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -5,132 +5,102 @@
 #include <stdint.h>
 
 extern int updateSensorRecordFromSSRAESC(const void *);
+extern int find_interface_property_fru_type(dbus_interface_t *interface, const char *property_name, char *property_value) ;
+extern int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *interface) ;
 
 void register_netfn_sen_functions()   __attribute__((constructor));
 
+struct sensorTypemap_t {
+    uint8_t number;
+    char dbusname[32];
+} ;
+
+
+sensorTypemap_t g_SensorTypeMap[] = {
+
+    {0x01, "Temp"},
+    {0x0C, "DIMM"},
+    {0x0C, "MEMORY_BUFFER"},
+    {0x07, "PROC"},
+    {0x07, "CORE"},
+    {0x07, "CPU"},
+    {0x0F, "BootProgress"},
+    {0xC3, "OccStatus"},
+    {0xC3, "BootCount"},
+    {0xFF, ""}
+};
+
+
 
 struct sensor_data_t {
     uint8_t sennum;
 }  __attribute__ ((packed)) ;
 
-unsigned char g_sensortype [][2] = {
-    {0xc7, 58},
-{0x01, 113},
-{0xc7, 56},
-{0x01, 114},
-{0xc6, 54},
-{0x07, 40},
-{0xC1, 121},
-{0xC2, 137},
-{0x07, 36},
-{0x07, 43},
-{0xC1, 122},
-{0xC1, 119},
-{0x01, 12},
-{0x01, 111},
-{0x01, 116},
-{0xC1, 127},
-{0xC2, 134},
-{0xC2, 130},
-{0xc, 33},
-{0xC1, 125},
-{0x01, 115},
-{0x22, 4},
-{0xC2, 138},
-{0x01, 108},
-{0x01, 102},
-{0xc, 46},
-{0x7, 11},
-{0xC1, 120},
-{0x07, 39},
-{0x07, 42},
-{0x5, 21},
-{0xC2, 131},
-{0xc1, 48},
-{0x12, 53},
-{0xC1, 124},
-{0x01, 117},
-{0xC1, 126},
-{0xf, 5},
-{0x23, 0},
-{0xC2, 139},
-{0x07, 34},
-{0x09, 146},
-{0x02, 178},
-{0xC2, 140},
-{0xC1, 118},
-{0xC2, 133},
-{0x07, 38},
-{0xC2, 143},
-{0x01, 101},
-{0xc3, 9},
-{0x7, 10},
-{0xc2, 51},
-{0x01, 109},
-{0xc, 32},
-{0x7, 8},
-{0xC1, 129},
-{0x01, 112},
-{0x01, 107},
-{0x07, 37},
-{0x07, 44},
-{0x1f, 50},
-{0xC2, 144},
-{0xc7, 52},
-{0xC2, 141},
-{0x01, 106},
-{0x01, 110},
-{0x01, 103},
-{0x9, 28},
-{0x07, 35},
-{0xc7, 55},
-{0x03, 179},
-{0x07, 41},
-{0xc, 30},
-{0x01, 100},
-{0xC1, 128},
-{0xC2, 135},
-{0x01, 105},
-{0x7, 47},
-{0xC2, 145},
-{0xc7, 57},
-{0x01, 104},
-{0x07, 45},
-{0xC2, 132},
-{0xc4, 49},
-{0xC1, 123},
-{0xC2, 142},
-{0x01, 13},
-{0xC2, 136},
-{0xc, 31},
-{0xff,0xff}
-};
-
 
-unsigned char findSensor(char sensor_number) {
+uint8_t dbus_to_sensor_type(char *p) {
 
-    int i=0;
+    sensorTypemap_t *s = g_SensorTypeMap;
+    char r=0;
 
-    // TODO : This function should actually call
-    // a dbus object and have it return the data
-    // it is not ready yet so use a Palmetto 
-    // based lookup table for now.  The g_sensortype
-    // can be removed once the dbus method exists
-    while (g_sensortype[i][0] != 0xff) {
-        if (g_sensortype[i][1] == sensor_number) {
-            break;
-        } else {
-            i++;
+    while (s->number != 0xFF) {
+        if (!strcmp(s->dbusname,p)) {
+            r = s->number;
+             break;
         }
-
+        s++;
     }
 
-    return g_sensortype[i][0];
+    if (s->number == 0xFF)
+        printf("Failed to find Sensor Type %s\n", p);
 
+    return r;
 }
 
-ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+
+uint8_t dbus_to_sensor_type_from_dbus(dbus_interface_t *a) {
+    char fru_type_name[64];
+    int r= 0;
+
+    r = find_interface_property_fru_type(a, "fru_type", fru_type_name);
+    if (r<0) {
+        fprintf(stderr, "Failed to get a fru type: %s", strerror(-r));
+        return -1;
+    } else {
+        return dbus_to_sensor_type(fru_type_name);
+    }
+}
+
+
+uint8_t find_sensor(uint8_t sensor_number) {
+
+    dbus_interface_t a;
+    char *p;
+    char r;
+
+    r = find_openbmc_path("SENSOR", sensor_number, &a);
+
+    if (r < 0) { return 0; }
+
+    // This is where sensors that do not exist in dbus but do
+    // exist in the host code stop.  This should indicate it
+    // is not a supported sensor
+    if (a.bus[0] == 0) { return 0;}
+
+    if (strstr(a.interface, "InventoryItem")) {
+        // InventoryItems are real frus.  So need to get the
+        // fru_type property
+        r = dbus_to_sensor_type_from_dbus(&a);
+    } else {
+        // Non InventoryItems
+        p = strrchr (a.path, '/');
+        r = dbus_to_sensor_type(p+1);
+    }
+
+    return r;
+ }
+
+ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     sensor_data_t *reqptr = (sensor_data_t*)request;
@@ -142,55 +112,51 @@ ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // need to ask Hostboot team
     unsigned char buf[] = {0x00,0x6F};
 
-    buf[0] = findSensor(reqptr->sennum);
+    buf[0] = find_sensor(reqptr->sennum);
 
-    *data_len = sizeof(buf);
-    memcpy(response, &buf, *data_len);
+    // HACK UNTIL Dbus gets updated or we find a better way
+    if (buf[0] == 0) {
+
+        switch(reqptr->sennum) {
+            case 0x35 : buf[0] = 0x12; buf[1] = 0x6F; break;
+            case 0x37 : buf[0] = 0xC7; buf[1] = 0x03; break;
+            case 0x38 : buf[0] = 0xC7; buf[1] = 0x03; break;
+            case 0x39 : buf[0] = 0xC7; buf[1] = 0x03; break;
+            case 0x3A : buf[0] = 0xC7; buf[1] = 0x03; break;
+            default: rc = IPMI_CC_SENSOR_INVALID;
+        }
+    }
 
 
+    *data_len = sizeof(buf);
+    memcpy(response, &buf, *data_len);
 
     return rc;
 }
 
 
 
-// TODO: Saves the sensor information to a file in /tmp.  This
-// will need to change to calling the correct method 
-// once it exists in the stack.  
-ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
-    FILE *fp;
-    char string[16];
     sensor_data_t *reqptr = (sensor_data_t*)request;
     ipmi_ret_t rc = IPMI_CC_OK;
     unsigned short rlen;
 
     rlen = (unsigned short) *data_len;
 
-    sprintf(string, "%s%02x", "/tmp/sen", reqptr->sennum);
-
-    printf("IPMI SET_SENSOR [%s]\n",string);
-
-    if ((fp = fopen(string, "wb")) != NULL) {
-        fwrite(reqptr,rlen,1,fp);
-        fclose(fp);
-    } else {
-        fprintf(stderr, "Error trying to write to sensor file %s\n",string);
-        ipmi_ret_t rc = IPMI_CC_INVALID;        
-    }
+    printf("IPMI SET_SENSOR [0x%02x]\n",reqptr->sennum);
 
     updateSensorRecordFromSSRAESC(reqptr);
 
     *data_len=0;
 
-
     return rc;
 }
 
-ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
diff --git a/sensorhandler.h b/sensorhandler.h
index da63bcb..7b89a18 100644
--- a/sensorhandler.h
+++ b/sensorhandler.h
@@ -1,13 +1,22 @@
 #ifndef __HOST_IPMI_SEN_HANDLER_H__
 #define __HOST_IPMI_SEN_HANDLER_H__
 
+#include <stdint.h>
+
 // IPMI commands for net functions.
 enum ipmi_netfn_sen_cmds
 {
-    // Get capability bits
     IPMI_CMD_GET_SENSOR_TYPE = 0x2F,
     IPMI_CMD_SET_SENSOR      = 0x30,
-
 };
 
+#define MAX_DBUS_PATH 128
+struct dbus_interface_t {
+    uint8_t  sensornumber;
+    uint8_t  sensortype;
+
+    char  bus[MAX_DBUS_PATH];
+    char  path[MAX_DBUS_PATH];
+    char  interface[MAX_DBUS_PATH];
+};
 #endif
diff --git a/testit.C b/testit.C
index 021d534..bfd9334 100644
--- a/testit.C
+++ b/testit.C
@@ -5,132 +5,56 @@
 
 
 unsigned char g_sensortype [][2] = {
-    {0xc7, 58},
-{0x01, 113},
-{0xc7, 56},
-{0x01, 114},
-{0xc6, 54},
-{0x07, 40},
-{0xC1, 121},
-{0xC2, 137},
-{0x07, 36},
-{0x07, 43},
-{0xC1, 122},
-{0xC1, 119},
-{0x01, 12},
-{0x01, 111},
-{0x01, 116},
-{0xC1, 127},
-{0xC2, 134},
-{0xC2, 130},
-{0xc, 33},
-{0xC1, 125},
-{0x01, 115},
-{0x22, 4},
-{0xC2, 138},
-{0x01, 108},
-{0x01, 102},
-{0xc, 46},
-{0x7, 11},
-{0xC1, 120},
-{0x07, 39},
-{0x07, 42},
-{0x5, 21},
-{0xC2, 131},
-{0xc1, 48},
-{0x12, 53},
-{0xC1, 124},
-{0x01, 117},
-{0xC1, 126},
-{0xf, 5},
-{0x23, 0},
-{0xC2, 139},
-{0x07, 34},
-{0x09, 146},
-{0x02, 178},
-{0xC2, 140},
-{0xC1, 118},
-{0xC2, 133},
-{0x07, 38},
-{0xC2, 143},
-{0x01, 101},
-{0xc3, 9},
-{0x7, 10},
-{0xc2, 51},
-{0x01, 109},
-{0xc, 32},
-{0x7, 8},
-{0xC1, 129},
-{0x01, 112},
-{0x01, 107},
-{0x07, 37},
-{0x07, 44},
-{0x1f, 50},
-{0xC2, 144},
-{0xc7, 52},
-{0xC2, 141},
-{0x01, 106},
-{0x01, 110},
-{0x01, 103},
-{0x9, 28},
-{0x07, 35},
-{0xc7, 55},
-{0x03, 179},
-{0x07, 41},
-{0xc, 30},
-{0x01, 100},
-{0xC1, 128},
-{0xC2, 135},
-{0x01, 105},
-{0x7, 47},
-{0xC2, 145},
-{0xc7, 57},
-{0x01, 104},
-{0x07, 45},
-{0xC2, 132},
-{0xc4, 49},
-{0xC1, 123},
-{0xC2, 142},
-{0x01, 13},
-{0xC2, 136},
-{0xc, 31},
-{0xff,0xff}
+    {0xC3, 0x01},
+    {0x07, 0x02},
+    {0x0F, 0x05},
+    {0x0c, 0x1F},
+    {0xFF ,0xff}
 };
 
-unsigned char findSensor(char sensor_number) {
+uint8_t find_sensor(uint8_t sensor_number) {
 
     int i=0;
+    uint8_t rc; 
 
-    // TODO : This function should actually call
-    // a dbus object and have it return the data
-    // it is not ready yet so use a Palmetto 
-    // based lookup table for now.  The g_sensortype
-    // can be removed once the dbus method exists
     while (g_sensortype[i][0] != 0xff) {
         if (g_sensortype[i][1] == sensor_number) {
             break;
         } else {
             i++;
         }
-
     }
 
-    return g_sensortype[i][0];
+    rc = g_sensortype[i][0];
 
+    if (rc == 0xFF)  {
+        rc = 0;
+    }
+    return rc;
 }
 
+char g_results_method[64];
+char g_results_value[64];
+
 
 int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
-    printf("Attempting to log Variant Sensor 0x%02x via %s with a value of %s\n", 
+    printf("Attempting to log Variant Sensor 0x%02x via %s with a value of %s\n",
         number, method, value);
 
+    strcpy(g_results_method, method);
+    strcpy(g_results_value, value);
+
+    return 0;
 }
 
 int set_sensor_dbus_state(uint8_t number, const char *method, const char *value) {
 
-	printf("Attempting to log Sensor 0x%02x via %s with a value of %s\n", 
+	printf("Attempting to log Sensor 0x%02x via %s with a value of %s\n",
 		number, method, value);
 
+    strcpy(g_results_method, method);
+    strcpy(g_results_value, value);
+
 	return 0;
 }
 
@@ -139,28 +63,52 @@ extern int updateSensorRecordFromSSRAESC(const void *record);
 
 
 
-uint8_t testrec_boot1[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00};
-uint8_t testrec_boot2[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00};
-uint8_t testrec_boot3[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00};
-uint8_t testrec_boot4[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00};                       
+// DIMM Present
+uint8_t testrec_sensor1[]      = {0x1F, 0xa9, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 
+// DIMM Not present
+uint8_t testrec_sensor2[]      = {0x1F, 0xa9, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00};
 
+// DIMM Not present
+uint8_t testrec_procfailed[]   = {0x02, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00};
 
-// DIMM Present
-uint8_t testrec_sensor1[] {0x1F, 0xa9, 0x00, 0x40, 0x00, 0x10, 0x00, 0x00};
+// Virtual Sensor 5, setting a Value of 0h
+uint8_t testrec_bootprogress[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00};
 
-// DIMM Not present
-uint8_t testrec_sensor2[] {0x1F, 0xa9, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00};
+// Virtual Sensor setting a boot count 
+uint8_t testrec_bootcount[]    = {0x01, 0x09, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 
+// Invalid sensor number
+uint8_t testrec_invalidnumber[]= {0x35, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00};
 
-uint8_t testrec_bootprogress[]  = {05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x14, 0x00 };
 
-int main() {
+int check_results(int rc, const char *method, const char *value) {
+    if (strcmp(g_results_method, method)) { 
+        printf("ERROR: Method Failed, expect %s found %s\n", method, g_results_method);
+        return -1;
+    }
+    if (strcmp(g_results_value, value)) {
+        printf("ERROR: Value failed, expected %s found %s\n", value, g_results_value);
+        return -2;
+    }
+
+    return 0;
+}
 
-	updateSensorRecordFromSSRAESC(testrec_bootprogress);
-	updateSensorRecordFromSSRAESC(testrec_sensor1);
-	updateSensorRecordFromSSRAESC(testrec_sensor2);
+void testprep(void) {
+    memset(g_results_method, 0, sizeof(g_results_method));
+    memset(g_results_value, 0, sizeof(g_results_value));
+}
+
+
+int main() {
 
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootprogress), "setValue", "FW Progress, Docking station attachment");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor1), "setPresent", "True");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_sensor2), "setPresent", "False");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_procfailed), "setFault", "False");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_bootcount), "setValue", "3");
+    testprep(); check_results(updateSensorRecordFromSSRAESC(testrec_invalidnumber), "", "");
 
 	return 0;
 }
\ No newline at end of file
-- 
2.6.0
