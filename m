Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0FB6A1A06B9
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 02:43:39 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444923816084224.44934496957944;
 Thu, 15 Oct 2015 08:43:36 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 3/4] Suport examining sensor records and
 calling dbus
Date: Thu, 15 Oct 2015 10:43:22 -0500
Message-Id: <1444923803-24688-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
References: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 15:43:40 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile        |   5 ++-
 ipmisensor.C    | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sensorhandler.C |   8 +++-
 3 files changed, 128 insertions(+), 4 deletions(-)
 create mode 100644 ipmisensor.C

diff --git a/Makefile b/Makefile
index 2177c9d..e27fe2d 100755
--- a/Makefile
+++ b/Makefile
@@ -5,7 +5,8 @@ DAEMON_OBJ  = $(DAEMON).o
 LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
               storagehandler.o \
-              dcmihandler.o
+              dcmihandler.o    \
+              ipmisensor.o
 
 LIB_APP     = libapphandler.so
 
@@ -25,4 +26,4 @@ $(DAEMON): $(DAEMON_OBJ)
 	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
 
 clean:
-	rm -f $(DAEMON) *.o *.so
+	rm -f $(DAEMON) *.o *.so
\ No newline at end of file
diff --git a/ipmisensor.C b/ipmisensor.C
new file mode 100644
index 0000000..c2370b8
--- /dev/null
+++ b/ipmisensor.C
@@ -0,0 +1,119 @@
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+
+extern unsigned char findSensor(char);
+
+struct sensorRES_t {
+	uint8_t sensor_number;
+	uint8_t operation;
+	uint8_t sensor_reading;
+	uint8_t assert_state7_0;
+	uint8_t assert_state14_8;	
+	uint8_t deassert_state7_0;
+	uint8_t deassert_state14_8;	
+	uint8_t event_data1;
+	uint8_t event_data2;
+	uint8_t event_data3;	
+} __attribute__ ((packed));
+
+#define ISBITSET(x,y) ((x>>y)&0x01)
+#define ASSERTINDEX 0
+#define DEASSERTINDEX 1
+
+
+extern int updateDbusInterface(uint8_t , const char *, const char *) ;
+extern int set_sensor_dbus_state(uint8_t ,const char *, const char *);
+
+
+
+// Sensor Type,  Offset, function handler, Dbus Method, Assert value, Deassert value
+struct lookup_t {
+	uint8_t sensor_type;
+	uint8_t offset;
+	int (*func)(uint8_t, const char *, const char *);
+	char    method[16];
+	char    assertion[16];
+	char    deassertion[16];
+};
+
+
+//  This table lists only senors we care about telling dbus about.
+//  Offset definition cab be found in section 42.2 of the IPMI 2.0 
+//  spec.  Add more if/when there are more items of interest.
+lookup_t ipmidbuslookup[] = {
+
+	{0x07, 0x07, set_sensor_dbus_state, "setPresent", "True", "False"},
+	{0x07, 0x08, set_sensor_dbus_state, "setFault",   "True", "False"},
+	{0x0C, 0x06, set_sensor_dbus_state, "setPresent", "True", "False"},
+	{0x0C, 0x04, set_sensor_dbus_state, "setFault",   "True", "False"},
+	{0xFF, 0xFF, NULL,                  "",            "" ,    ""}
+};
+
+int findindex(const uint8_t sensor_type, int offset, int *index) {
+	
+	int i=0, rc=0;
+	lookup_t *pTable = ipmidbuslookup;
+
+	do {
+
+		if ( ((pTable+i)->sensor_type == sensor_type) && 
+			 ((pTable+i)->offset  == offset)  ) {
+			rc = 1;
+			*index = i;
+			break;
+		}
+		i++;
+	} while ((pTable+i)->sensor_type  != 0xFF);
+
+	return rc;
+}
+
+int shouldReport(sensorRES_t *pRec, uint8_t sensorType, int offset, int assertState) {
+
+	int index;
+	char *pState;
+	lookup_t *pTable = ipmidbuslookup;
+
+	if (findindex(sensorType, offset, &index)) {
+
+		if (assertState == ASSERTINDEX) {
+			pState = (pTable+index)->assertion;
+		} else {
+			pState = (pTable+index)->deassertion;
+		}
+		(*((pTable+index)->func))(pRec->sensor_number, (pTable+index)->method, pState);
+	}
+
+	return 0;
+}
+
+
+int updateSensorRecordFromSSRAESC(const void *record) {
+
+	sensorRES_t *pRec = (sensorRES_t *) record;
+	unsigned char stype;
+	int index, i=0;
+
+	stype = findSensor(pRec->sensor_number);
+
+	// Scroll through each bit position .  Determine 
+	// if any bit is either asserted or Deasserted.
+	for(i=0;i<8;i++) {
+		if (ISBITSET(pRec->assert_state7_0,i)) { 
+			shouldReport(pRec, stype, i, ASSERTINDEX);
+		}
+		if (ISBITSET(pRec->assert_state14_8,i)) { 
+			shouldReport(pRec, stype, i+8, ASSERTINDEX);
+		}
+		if (ISBITSET(pRec->deassert_state7_0,i)) { 
+			shouldReport(pRec, stype, i, DEASSERTINDEX);
+		}
+		if (ISBITSET(pRec->deassert_state14_8,i)) { 
+			shouldReport(pRec, stype, i+8, DEASSERTINDEX);
+		}
+	}
+
+	return 0;
+}
diff --git a/sensorhandler.C b/sensorhandler.C
index 9f0c975..0b16d10 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -4,6 +4,7 @@
 #include <string.h>
 #include <stdint.h>
 
+extern int updateSensorRecordFromSSRAESC(const void *);
 
 void register_netfn_sen_functions()   __attribute__((constructor));
 
@@ -166,20 +167,22 @@ ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t rc = IPMI_CC_OK;
     unsigned short rlen;
 
-    rlen = (unsigned short) *data_len - 1;
+    rlen = (unsigned short) *data_len;
 
     sprintf(string, "%s%02x", "/tmp/sen", reqptr->sennum);
 
     printf("IPMI SET_SENSOR [%s]\n",string);
 
     if ((fp = fopen(string, "wb")) != NULL) {
-        fwrite(reqptr+1,rlen,1,fp);
+        fwrite(reqptr,rlen,1,fp);
         fclose(fp);
     } else {
         fprintf(stderr, "Error trying to write to sensor file %s\n",string);
         ipmi_ret_t rc = IPMI_CC_INVALID;        
     }
 
+    updateSensorRecordFromSSRAESC(reqptr);
+
     *data_len=0;
 
 
@@ -209,5 +212,6 @@ void register_netfn_sen_functions()
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_SET_SENSOR);
     ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_SET_SENSOR, NULL, ipmi_sen_set_sensor);
+
     return;
 }
-- 
2.6.0
