Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 876411A068E
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 12:35:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446945623736860.9597105148265;
 Sat, 7 Nov 2015 17:20:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Fix bugs from test runs
Date: Sat,  7 Nov 2015 20:20:22 -0500
Message-Id: <1446945622-27994-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1446945622-27994-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1446945622-27994-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 01:35:35 -0000

From: Chris Austen <austenc@us.ibm.com>

POST and FW Boot progres where not getting set on DBUS
Memory and CPU faults now show up on DBUS
OS Boot Status was never sent
---
 ipmisensor.C    | 59 ++++++++++++++++++++++++++++++++++++++++++---------------
 sensorhandler.C | 25 +++++++++++++-----------
 2 files changed, 58 insertions(+), 26 deletions(-)

diff --git a/ipmisensor.C b/ipmisensor.C
index 513e485..6d3d3bd 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -1,6 +1,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
+#include <malloc.h>
 
 
 extern uint8_t find_sensor(uint8_t);
@@ -30,8 +31,8 @@ struct lookup_t {
 	uint8_t offset;
 	int (*func)(const sensorRES_t *, const lookup_t *, const char *);
 	char    method[16];
-	char    assertion[16];
-	char    deassertion[16];
+	char    assertion[64];
+	char    deassertion[64];
 };
 
 
@@ -46,7 +47,7 @@ int set_sensor_dbus_state_simple(const sensorRES_t *pRec, const lookup_t *pTable
 
 struct event_data_t {
 	uint8_t data;
-	char    text[32];
+	char    text[64];
 };
 
 event_data_t g_fwprogress02h[] = {
@@ -79,10 +80,26 @@ event_data_t g_fwprogress02h[] = {
 	{0xFF, "Unknown"}
 };
 
+event_data_t g_fwprogress00h[] = {
+	{0x00, "Unspecified."},
+	{0x01, "No system memory detected"},
+	{0x02, "No usable system memory"},
+	{0x03, "Unrecoverable hard-disk/ATAPI/IDE"},
+	{0x04, "Unrecoverable system-board"},
+	{0x05, "Unrecoverable diskette"},
+	{0x06, "Unrecoverable hard-disk controller"},
+	{0x07, "Unrecoverable PS/2 or USB keyboard"},
+	{0x08, "Removable boot media not found"},
+	{0x09, "Unrecoverable video controller"},
+	{0x0A, "No video device detected"},
+	{0x0B, "Firmware ROM corruption detected"},
+	{0x0C, "CPU voltage mismatch"},
+	{0x0D, "CPU speed matching"},
+	{0xFF, "unknown"},
+};
 
-char *getfw02string(uint8_t b) {
 
-	event_data_t *p = g_fwprogress02h;
+char *event_data_lookup(event_data_t *p, uint8_t b) {
 
 	while(p->data != 0xFF) {
 		if (p->data == b) {
@@ -93,20 +110,24 @@ char *getfw02string(uint8_t b) {
 
 	return p->text;
 }
+
+
+
 //  The fw progress sensor contains some additional information that needs to be processed
 //  prior to calling the dbus code.  
 int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
 
-	char valuestring[64];
+	char valuestring[128];
 	char* p = valuestring;
 
 	switch (pTable->offset) {
 
-		case 0x00 : snprintf(p, sizeof(valuestring), "POST Error, 0x%02x", pRec->event_data2);
+		case 0x00 : snprintf(p, sizeof(valuestring), "POST Error, %s", event_data_lookup(g_fwprogress00h, pRec->event_data2));
 					break;
-		case 0x01 : snprintf(p, sizeof(valuestring), "FW Hang, 0x%02x", pRec->event_data2);
+		case 0x01 : /* Using g_fwprogress02h for 0x01 because thats what the ipmi spec says to do */
+					snprintf(p, sizeof(valuestring), "FW Hang, %s", event_data_lookup(g_fwprogress02h, pRec->event_data2));
 					break;
-		case 0x02 : snprintf(p, sizeof(valuestring), "FW Progress, %s", getfw02string(pRec->event_data2));
+		case 0x02 : snprintf(p, sizeof(valuestring), "FW Progress, %s", event_data_lookup(g_fwprogress02h, pRec->event_data2));
 					break;
 	}
 
@@ -115,7 +136,7 @@ int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pT
 
 // Handling this special OEM sensor by coping what is in byte 4.  I also think that is odd
 // considering byte 3 is for sensor reading.  This seems like a misuse of the IPMI spec
-int set_sensor_dbus_state_osboot(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
+int set_sensor_dbus_state_osbootcount(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
 	char valuestring[32];
 	char* pStr = valuestring;
 
@@ -125,13 +146,14 @@ int set_sensor_dbus_state_osboot(const sensorRES_t *pRec, const lookup_t *pTable
 }
 
 
+
 //  This table lists only senors we care about telling dbus about.
 //  Offset definition cab be found in section 42.2 of the IPMI 2.0
 //  spec.  Add more if/when there are more items of interest.
 lookup_t g_ipmidbuslookup[] = {
 
-	{0x07, 0x00, set_sensor_dbus_state_simple, "setPresent", "False", "False"}, // OCC Inactive 0
-	{0x07, 0x01, set_sensor_dbus_state_simple, "setPresent", "True", "True"},   // OCC Active 1
+	{0xe9, 0x00, set_sensor_dbus_state_simple, "setValue", "Disabled", ""}, // OCC Inactive 0
+	{0xe9, 0x01, set_sensor_dbus_state_simple, "setValue", "Enabled", ""},   // OCC Active 1
 	{0x07, 0x07, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
 	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", ""},
 	{0x0C, 0x06, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
@@ -140,13 +162,19 @@ lookup_t g_ipmidbuslookup[] = {
 	{0x0F, 0x01, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x00, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", ""},
-	{0xc3, 0x00, set_sensor_dbus_state_osboot, "setValue", "" ,""},
+	{0xc3, 0x00, set_sensor_dbus_state_osbootcount, "setValue", "" ,""},
+	{0x1F, 0x00, set_sensor_dbus_state_simple, "setValue", "Boot completed (00)", ""},
+	{0x1F, 0x01, set_sensor_dbus_state_simple, "setValue", "Boot completed (01)", ""},
+	{0x1F, 0x02, set_sensor_dbus_state_simple, "setValue", "PXE boot completed", ""},
+	{0x1F, 0x03, set_sensor_dbus_state_simple, "setValue", "Diagnostic boot completed", ""},
+	{0x1F, 0x04, set_sensor_dbus_state_simple, "setValue", "CD-ROM boot completed", ""},
+	{0x1F, 0x05, set_sensor_dbus_state_simple, "setValue", "ROM boot completed", ""},
+	{0x1F, 0x06, set_sensor_dbus_state_simple, "setValue", "Boot completed (06)", ""},
 
 	{0xFF, 0xFF, NULL, "", "", ""}
 };
 
 
-
 void reportSensorEventAssert(sensorRES_t *pRec, int index) {
 	lookup_t *pTable = &g_ipmidbuslookup[index];
 	(*pTable->func)(pRec, pTable, pTable->assertion);
@@ -198,8 +226,8 @@ int updateSensorRecordFromSSRAESC(const void *record) {
 	sensorRES_t *pRec = (sensorRES_t *) record;
 	uint8_t stype;
 	int index, i=0;
-	stype = find_sensor(pRec->sensor_number);
 
+	stype = find_sensor(pRec->sensor_number);
 
 	// 0xC3 types use the assertion7_0 for the value to be set
 	// so skip the reseach and call the correct event reporting
@@ -213,6 +241,7 @@ int updateSensorRecordFromSSRAESC(const void *record) {
 		// Scroll through each bit position .  Determine
 		// if any bit is either asserted or Deasserted.
 		for(i=0;i<8;i++) {
+
 			if ((ISBITSET(pRec->assert_state7_0,i))  &&
 				(shouldReport(stype, i, &index)))
 			{
diff --git a/sensorhandler.C b/sensorhandler.C
index 9344abd..cd57dd4 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -12,22 +12,24 @@ void register_netfn_sen_functions()   __attribute__((constructor));
 
 struct sensorTypemap_t {
     uint8_t number;
+    uint8_t typecode;
     char dbusname[32];
 } ;
 
 
 sensorTypemap_t g_SensorTypeMap[] = {
 
-    {0x01, "Temp"},
-    {0x0C, "DIMM"},
-    {0x0C, "MEMORY_BUFFER"},
-    {0x07, "PROC"},
-    {0x07, "CORE"},
-    {0x07, "CPU"},
-    {0x0F, "BootProgress"},
-    {0xC3, "OccStatus"},
-    {0xC3, "BootCount"},
-    {0xFF, ""}
+    {0x01, 0x6F, "Temp"},
+    {0x0C, 0x6F, "DIMM"},
+    {0x0C, 0x6F, "MEMORY_BUFFER"},
+    {0x07, 0x6F, "PROC"},
+    {0x07, 0x6F, "CORE"},
+    {0x07, 0x6F, "CPU"},
+    {0x0F, 0x6F, "BootProgress"},
+    {0xe9, 0x09, "OccStatus"},  // E9 is an internal mapping to handle sensor type code os 0x09
+    {0xC3, 0x6F, "BootCount"},
+    {0x1F, 0x6F, "OperatingSystemStatus"},
+    {0xFF, 0x00, ""},
 };
 
 
@@ -50,6 +52,7 @@ uint8_t dbus_to_sensor_type(char *p) {
         s++;
     }
 
+
     if (s->number == 0xFF)
         printf("Failed to find Sensor Type %s\n", p);
 
@@ -84,7 +87,7 @@ uint8_t find_sensor(uint8_t sensor_number) {
     // This is where sensors that do not exist in dbus but do
     // exist in the host code stop.  This should indicate it
     // is not a supported sensor
-    if (a.bus[0] == 0) { return 0;}
+    if (a.interface[0] == 0) { return 0;}
 
     if (strstr(a.interface, "InventoryItem")) {
         // InventoryItems are real frus.  So need to get the
-- 
2.6.3
