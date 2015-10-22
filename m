Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A27921A051F
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:32:11 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481129008200.5420946115728;
 Wed, 21 Oct 2015 19:32:09 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] add dynamic lookup of sensor types
Date: Wed, 21 Oct 2015 21:32:05 -0500
Message-Id: <1445481125-30036-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445481125-30036-1-git-send-email-patches@stwcx.xyz>
References: <1445481125-30036-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:32:12 -0000

From: Chris Austen <austenc@us.ibm.com>

Fix for the build break when building the testit program
---
 ipmid.C         |  79 ++++++++++++++---------
 ipmisensor.C    |  22 +++----
 sensorhandler.C | 194 +++++++++++++++++++++-----------------------------------
 sensorhandler.h |  14 ++++
 testit.C        |   9 +--
 5 files changed, 146 insertions(+), 172 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 4f0831e..aae3c0e 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -11,7 +11,7 @@
 #include "ipmid.H"
 #include <sys/time.h>
 #include <errno.h>
-
+#include "sensorhandler.h"
 
 sd_bus *bus = NULL;
 
@@ -312,7 +312,7 @@ int handler_select(const struct dirent *entry)
 }
 
 // This will do a dlopen of every .so in ipmi_lib_path and will dlopen everything so that they will
-// register a callback handler
+// register a callback handler 
 void ipmi_register_callback_handlers(const char* ipmi_lib_path)
 {
     // For walking the ipmi_lib_path
@@ -331,7 +331,7 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
     {
         // 1: Open ipmi_lib_path. Its usually "/usr/lib/phosphor-host-ipmid"
         // 2: Scan the directory for the files that end with .so
-        // 3: For each one of them, just do a 'dlopen' so that they register
+        // 3: For each one of them, just do a 'dlopen' so that they register 
         //    the handlers for callback routines.
 
         std::string handler_fqdn = ipmi_lib_path;
@@ -350,7 +350,7 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
             lib_handler = dlopen(handler_fqdn.c_str(), RTLD_NOW);
             if(lib_handler == NULL)
             {
-                fprintf(stderr,"ERROR opening [%s]: %s\n",
+                fprintf(stderr,"ERROR opening:[%s]  %s\n",
                         handler_fqdn.c_str(), dlerror());
             }
             // Wipe the memory allocated for this particular entry.
@@ -428,17 +428,55 @@ finish:
 }
 
 
-#define MAX_DBUS_PATH 128
-struct dbus_interface_t {
-    uint8_t  sensornumber;
-    uint8_t  sensortype;
 
-    char  bus[MAX_DBUS_PATH];
-    char  path[MAX_DBUS_PATH];
-    char  interface[MAX_DBUS_PATH];
-};
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
+
+
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
@@ -516,12 +554,6 @@ int set_sensor_dbus_state(uint8_t number, const char *method, const char *value)
 
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
@@ -539,13 +571,10 @@ int set_sensor_dbus_state(uint8_t number, const char *method, const char *value)
     }
 
 
-
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
 
     return 0;
-
-
 }
 
 int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
@@ -561,12 +590,6 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
 
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
@@ -578,14 +601,12 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
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
index 568f4a4..181c7cc 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -3,7 +3,7 @@
 #include <stdint.h>
 
 
-extern unsigned char findSensor(char);
+extern uint8_t find_sensor(uint8_t sensor_number) ;
 extern int set_sensor_dbus_state_v(uint8_t , const char *, char *);
 
 
@@ -82,24 +82,20 @@ event_data_t g_fwprogress02h[] = {
 
 char *getfw02string(uint8_t b) {
 
-	int i = 0;
 	event_data_t *p = g_fwprogress02h;
 
-	do {
-
-		if ((p+i)->data == b)
+	while(p->data != 0xFF) {
+		if (p->data == b)
 			break;
-		i++;
-	} while ((p+i)->data != 0xFF);
+	}
 
-	return (p+i)->text;
+	return p->text;
 }
 //  The fw progress sensor contains some additional information that needs to be processed
 //  prior to calling the dbus code.  
 int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
 
-	char valuestring[48];
-	char* pStr = valuestring;
+	char valuestring[128];
 
 	switch (pTable->offset) {
 
@@ -110,7 +106,7 @@ int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pT
 		case 0x02 : snprintf(valuestring, sizeof(valuestring), "FW Progress, %s", getfw02string(pRec->event_data2));
 	}
 
-	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
+	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, valuestring);
 }
 
 // Handling this special OEM sensor by coping what is in byte 4.  I also think that is odd
@@ -196,9 +192,9 @@ bool shouldReport(uint8_t sensorType, int offset, int *index) {
 int updateSensorRecordFromSSRAESC(const void *record) {
 
 	sensorRES_t *pRec = (sensorRES_t *) record;
-	unsigned char stype;
+	uint8_t stype;
 	int index, i=0;
-	stype = findSensor(pRec->sensor_number);
+	stype = find_sensor(pRec->sensor_number);
 
 	// Scroll through each bit position .  Determine 
 	// if any bit is either asserted or Deasserted.
diff --git a/sensorhandler.C b/sensorhandler.C
index 0b16d10..0789431 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -5,128 +5,93 @@
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
+    {0x07, "PROC"},
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
 
+uint8_t dbus_to_sensor_type(char *p) {
 
-unsigned char findSensor(char sensor_number) {
+    sensorTypemap_t *s = g_SensorTypeMap;
+    char r=0;
 
-    int i=0;
+    printf("Looking for Sensor Type %s\n", p);
 
-    // TODO : This function should actually call
-    // a dbus object and have it return the data
-    // it is not ready yet so use a Palmetto 
-    // based lookup table for now.  The g_sensortype
-    // can be removed once the dbus method exists
-    while (g_sensortype[i][0] != 0xff) {
-        if (g_sensortype[i][1] == sensor_number) {
+    while (s->number != 0xFF) {
+        if (!strcmp(s->dbusname,p)) {
+            r = s->number;
             break;
-        } else {
-            i++;
         }
+        s++;
+    }
+    return r;
+}
+
+
+uint8_t dbus_to_sensor_type_from_dbus(dbus_interface_t *a) {
+    char fru_type_name[64];
+    int r= 0;
 
+    r = find_interface_property_fru_type(a, "fru_type", fru_type_name);
+    if (r<0) {
+        fprintf(stderr, "Failed to get a fru type: %s", strerror(-r));
+        return -1;
+    } else {
+        return dbus_to_sensor_type(fru_type_name);
     }
 
-    return g_sensortype[i][0];
+}
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
+    printf("bus: %s\n", a.bus);
+    printf("path: %s\n", a.path);
+    printf("interface: %s\n", a.interface);
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
 }
 
 ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
@@ -142,7 +107,7 @@ ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // need to ask Hostboot team
     unsigned char buf[] = {0x00,0x6F};
 
-    buf[0] = findSensor(reqptr->sennum);
+    buf[0] = find_sensor(reqptr->sennum);
 
     *data_len = sizeof(buf);
     memcpy(response, &buf, *data_len);
@@ -153,39 +118,22 @@ ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 }
 
 
-
-// TODO: Saves the sensor information to a file in /tmp.  This
-// will need to change to calling the correct method 
-// once it exists in the stack.  
 ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                              ipmi_request_t request, ipmi_response_t response, 
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
 
diff --git a/sensorhandler.h b/sensorhandler.h
index da63bcb..7ac0f4e 100644
--- a/sensorhandler.h
+++ b/sensorhandler.h
@@ -1,6 +1,9 @@
 #ifndef __HOST_IPMI_SEN_HANDLER_H__
 #define __HOST_IPMI_SEN_HANDLER_H__
 
+
+#include <stdint.h>
+
 // IPMI commands for net functions.
 enum ipmi_netfn_sen_cmds
 {
@@ -10,4 +13,15 @@ enum ipmi_netfn_sen_cmds
 
 };
 
+
+#define MAX_DBUS_PATH 128
+struct  dbus_interface_t {
+    uint8_t  sensornumber;
+    uint8_t  sensortype;
+
+    char  bus[MAX_DBUS_PATH];
+    char  path[MAX_DBUS_PATH];
+    char  interface[MAX_DBUS_PATH];
+} ;
+
 #endif
diff --git a/testit.C b/testit.C
index 021d534..aaaad3d 100644
--- a/testit.C
+++ b/testit.C
@@ -97,15 +97,10 @@ unsigned char g_sensortype [][2] = {
 {0xff,0xff}
 };
 
-unsigned char findSensor(char sensor_number) {
+unsigned char find_sensor(uint8_t  sensor_number) {
 
     int i=0;
 
-    // TODO : This function should actually call
-    // a dbus object and have it return the data
-    // it is not ready yet so use a Palmetto 
-    // based lookup table for now.  The g_sensortype
-    // can be removed once the dbus method exists
     while (g_sensortype[i][0] != 0xff) {
         if (g_sensortype[i][1] == sensor_number) {
             break;
@@ -163,4 +158,4 @@ int main() {
 
 
 	return 0;
-}
\ No newline at end of file
+}
-- 
2.6.0
