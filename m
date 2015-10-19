Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BE8DE1A0B1F
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:57:18 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259435296381.71231329956856;
 Mon, 19 Oct 2015 05:57:15 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 5/6] Add virtual sensor support
Date: Mon, 19 Oct 2015 07:57:05 -0500
Message-Id: <1445259426-10511-6-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445259426-10511-1-git-send-email-patches@stwcx.xyz>
References: <1445259426-10511-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:57:19 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile     |   1 +
 ipmid.C      |  44 ++++++++++++++++
 ipmisensor.C | 170 +++++++++++++++++++++++++++++++++++++++++++++--------------
 testit.C     |   8 ++-
 4 files changed, 180 insertions(+), 43 deletions(-)

diff --git a/Makefile b/Makefile
index f9580bd..e848983 100755
--- a/Makefile
+++ b/Makefile
@@ -8,6 +8,7 @@ LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
               storagehandler.o \
               dcmihandler.o    \
+              ipmisensor.o     \
 
 
 TESTER_OBJ = ipmisensor.o 	   \
diff --git a/ipmid.C b/ipmid.C
index db2f6b9..fb46212 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -547,3 +547,47 @@ int set_sensor_dbus_state(uint8_t number, const char *method, const char *value)
 
 
 }
+
+int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
+
+
+    dbus_interface_t a;
+    int r;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+
+    printf("Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
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
+    r = sd_bus_message_append(m, "v", "s", value);
+    if (r < 0) {
+        fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+    }
+
+
+    // Call the IPMI responder on the bus so the message can be sent to the CEC
+    r = sd_bus_call(bus, m, 0, &error, NULL);
+    if (r < 0) {
+        fprintf(stderr, "12 Failed to call the method: %s", strerror(-r));
+    }
+
+
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
+    return 0;
+}
diff --git a/ipmisensor.C b/ipmisensor.C
index c2370b8..72cb576 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -4,6 +4,9 @@
 
 
 extern unsigned char findSensor(char);
+extern int set_sensor_dbus_state_v(uint8_t , const char *, char *);
+
+
 
 struct sensorRES_t {
 	uint8_t sensor_number;
@@ -18,48 +21,136 @@ struct sensorRES_t {
 	uint8_t event_data3;	
 } __attribute__ ((packed));
 
-#define ISBITSET(x,y) ((x>>y)&0x01)
+#define ISBITSET(x,y) (((x)>>(y))&0x01)
 #define ASSERTINDEX 0
 #define DEASSERTINDEX 1
 
-
-extern int updateDbusInterface(uint8_t , const char *, const char *) ;
-extern int set_sensor_dbus_state(uint8_t ,const char *, const char *);
-
-
-
 // Sensor Type,  Offset, function handler, Dbus Method, Assert value, Deassert value
 struct lookup_t {
 	uint8_t sensor_type;
 	uint8_t offset;
-	int (*func)(uint8_t, const char *, const char *);
+	int (*func)(const sensorRES_t *, const lookup_t *, const char *);
 	char    method[16];
 	char    assertion[16];
 	char    deassertion[16];
 };
 
 
+extern int updateDbusInterface(uint8_t , const char *, const char *) ;
+extern int set_sensor_dbus_state(uint8_t ,const char *, const char *);
+
+
+int set_sensor_dbus_state_simple(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
+
+	return set_sensor_dbus_state(pRec->sensor_number, pTable->method, value);
+}
+
+struct event_data_t {
+	uint8_t data;
+	char    text[32];
+};
+
+event_data_t g_fwprogress02h[] = {
+	{0x00, "Unspecified"},
+	{0x01, "Memory Init"},
+	{0x02, "HD Init"},
+	{0x03, "Secondary Proc Init"},
+	{0x04, "User Authentication"},
+	{0x05, "User init system setup"},
+	{0x06, "USB configuration"},
+	{0x07, "PCI configuration"},
+	{0x08, "Option ROM Init"},
+	{0x09, "Video Init"},
+	{0x0A, "Cache Init"},
+	{0x0B, "SM Bus init"},
+	{0x0C, "Keyboard Init"},
+	{0x0D, "Embedded ctrl init"},
+	{0x0E, "Docking station attachment"},
+	{0x0F, "Enable docking station"},
+	{0x10, "Docking station ejection"},
+	{0x11, "Disabling docking station"},
+	{0x12, "Calling OS Wakeup"},
+	{0x13, "Starting OS"},
+	{0x14, "Baseboard Init"},
+	{0x15, ""},
+	{0x16, "Floppy Init"},
+	{0x17, "Keyboard Test"},
+	{0x18, "Pointing Device Test"},
+	{0x19, "Primary Proc Init"},
+	{0xFF, "Unknown"}
+};
+
+
+char *getfw02string(uint8_t b) {
+
+	int i = 0;
+	event_data_t *p = g_fwprogress02h;
+
+	do {
+
+		if ((p+i)->data == b)
+			break;
+		i++;
+	} while ((p+i)->data != 0xFF);
+
+	return p->text;
+}
+//  The fw progress sensor contains some additional information that needs to be processed
+//  prior to calling the dbus code.  
+int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
+
+	char valuestring[32];
+	char* pStr = valuestring;
+
+	switch (pTable->offset) {
+
+		case 0x00 : sprintf(valuestring, "POST Error, 0x%02x", pRec->event_data2);
+					break;
+		case 0x01 : sprintf(valuestring, "FW Hang, 0x%02x", pRec->event_data2);
+					break;
+		case 0x02 : sprintf(valuestring, "FW Progress, 0x%02x", getfw02string(pRec->event_data2));
+	}
+
+	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
+}
+
+
 //  This table lists only senors we care about telling dbus about.
 //  Offset definition cab be found in section 42.2 of the IPMI 2.0 
 //  spec.  Add more if/when there are more items of interest.
-lookup_t ipmidbuslookup[] = {
+lookup_t g_ipmidbuslookup[] = {
 
-	{0x07, 0x07, set_sensor_dbus_state, "setPresent", "True", "False"},
-	{0x07, 0x08, set_sensor_dbus_state, "setFault",   "True", "False"},
-	{0x0C, 0x06, set_sensor_dbus_state, "setPresent", "True", "False"},
-	{0x0C, 0x04, set_sensor_dbus_state, "setFault",   "True", "False"},
-	{0xFF, 0xFF, NULL,                  "",            "" ,    ""}
+	{0x07, 0x07, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
+	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
+	{0x0C, 0x06, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
+	{0x0C, 0x04, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
+	{0x0F, 0x02, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
+	{0x0F, 0x01, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
+	{0x0F, 0x00, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
+
+	{0xFF, 0xFF, NULL, "", "", ""}
 };
 
+
+
+void reportSensorEventAssert(sensorRES_t *pRec, int index) {
+	lookup_t *pTable = &g_ipmidbuslookup[index];
+	(*pTable->func)(pRec, pTable, pTable->assertion);
+}
+void reportSensorEventDeassert(sensorRES_t *pRec, int index) {
+	lookup_t *pTable = &g_ipmidbuslookup[index];
+	(*pTable->func)(pRec, pTable, pTable->deassertion);
+}
+
+
 int findindex(const uint8_t sensor_type, int offset, int *index) {
 	
 	int i=0, rc=0;
-	lookup_t *pTable = ipmidbuslookup;
+	lookup_t *pTable = g_ipmidbuslookup;
 
 	do {
-
 		if ( ((pTable+i)->sensor_type == sensor_type) && 
-			 ((pTable+i)->offset  == offset)  ) {
+			 ((pTable+i)->offset  == offset) ) {
 			rc = 1;
 			*index = i;
 			break;
@@ -70,23 +161,12 @@ int findindex(const uint8_t sensor_type, int offset, int *index) {
 	return rc;
 }
 
-int shouldReport(sensorRES_t *pRec, uint8_t sensorType, int offset, int assertState) {
-
-	int index;
-	char *pState;
-	lookup_t *pTable = ipmidbuslookup;
+bool shouldReport(uint8_t sensorType, int offset, int *index) {
 
-	if (findindex(sensorType, offset, &index)) {
+	bool rc = false;
+	if (findindex(sensorType, offset, index)) { rc = true;	}
 
-		if (assertState == ASSERTINDEX) {
-			pState = (pTable+index)->assertion;
-		} else {
-			pState = (pTable+index)->deassertion;
-		}
-		(*((pTable+index)->func))(pRec->sensor_number, (pTable+index)->method, pState);
-	}
-
-	return 0;
+	return rc;
 }
 
 
@@ -95,23 +175,31 @@ int updateSensorRecordFromSSRAESC(const void *record) {
 	sensorRES_t *pRec = (sensorRES_t *) record;
 	unsigned char stype;
 	int index, i=0;
-
 	stype = findSensor(pRec->sensor_number);
 
+
 	// Scroll through each bit position .  Determine 
 	// if any bit is either asserted or Deasserted.
 	for(i=0;i<8;i++) {
-		if (ISBITSET(pRec->assert_state7_0,i)) { 
-			shouldReport(pRec, stype, i, ASSERTINDEX);
+		if ((ISBITSET(pRec->assert_state7_0,i))  &&
+			(shouldReport(stype, i, &index)))
+		{
+			reportSensorEventAssert(pRec, index);
 		}
-		if (ISBITSET(pRec->assert_state14_8,i)) { 
-			shouldReport(pRec, stype, i+8, ASSERTINDEX);
+		if ((ISBITSET(pRec->assert_state14_8,i+8))  &&
+			(shouldReport(stype, i+8, &index)))
+		{
+			reportSensorEventAssert(pRec, index);
 		}
-		if (ISBITSET(pRec->deassert_state7_0,i)) { 
-			shouldReport(pRec, stype, i, DEASSERTINDEX);
+		if ((ISBITSET(pRec->deassert_state7_0,i))  &&
+			(shouldReport(stype, i, &index)))
+		{
+			reportSensorEventDeassert(pRec, index);
 		}
-		if (ISBITSET(pRec->deassert_state14_8,i)) { 
-			shouldReport(pRec, stype, i+8, DEASSERTINDEX);
+		if ((ISBITSET(pRec->deassert_state14_8,i+8))  &&
+			(shouldReport(stype, i+8, &index)))
+		{
+			reportSensorEventDeassert(pRec, index);
 		}
 	}
 
diff --git a/testit.C b/testit.C
index 0641a55..021d534 100644
--- a/testit.C
+++ b/testit.C
@@ -120,6 +120,12 @@ unsigned char findSensor(char sensor_number) {
 }
 
 
+int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
+    printf("Attempting to log Variant Sensor 0x%02x via %s with a value of %s\n", 
+        number, method, value);
+
+}
+
 int set_sensor_dbus_state(uint8_t number, const char *method, const char *value) {
 
 	printf("Attempting to log Sensor 0x%02x via %s with a value of %s\n", 
@@ -133,8 +139,6 @@ extern int updateSensorRecordFromSSRAESC(const void *record);
 
 
 
-
-
 uint8_t testrec_boot1[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00};
 uint8_t testrec_boot2[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00};
 uint8_t testrec_boot3[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00};
-- 
2.6.0
