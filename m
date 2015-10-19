Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 81C8D1A0B1A
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:57:31 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259446552806.0779756432667;
 Mon, 19 Oct 2015 05:57:26 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 4/7] Added testcases for sensor record
 parsing
Date: Mon, 19 Oct 2015 07:57:16 -0500
Message-Id: <1445259439-10608-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445259439-10608-1-git-send-email-patches@stwcx.xyz>
References: <1445259439-10608-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:57:32 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile |  14 ++++--
 testit.C | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+), 3 deletions(-)
 create mode 100644 testit.C

diff --git a/Makefile b/Makefile
index e27fe2d..f9580bd 100755
--- a/Makefile
+++ b/Makefile
@@ -1,12 +1,17 @@
 CXX ?= $(CROSS_COMPILE)g++
 
+TESTER = testit
+
 DAEMON = ipmid
 DAEMON_OBJ  = $(DAEMON).o
 LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
               storagehandler.o \
               dcmihandler.o    \
-              ipmisensor.o
+
+
+TESTER_OBJ = ipmisensor.o 	   \
+			 testit.o
 
 LIB_APP     = libapphandler.so
 
@@ -14,7 +19,7 @@ INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
 LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
 
-all: $(DAEMON) $(LIB_APP) 
+all: $(DAEMON) $(LIB_APP) $(TESTER)
 
 %.o: %.C
 	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
@@ -25,5 +30,8 @@ $(LIB_APP): $(LIB_APP_OBJ)
 $(DAEMON): $(DAEMON_OBJ)
 	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
 
+$(TESTER): $(TESTER_OBJ)
+	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
+
 clean:
-	rm -f $(DAEMON) *.o *.so
\ No newline at end of file
+	rm -f $(DAEMON) $(TESTER) *.o *.so
\ No newline at end of file
diff --git a/testit.C b/testit.C
new file mode 100644
index 0000000..0641a55
--- /dev/null
+++ b/testit.C
@@ -0,0 +1,162 @@
+
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+
+unsigned char g_sensortype [][2] = {
+    {0xc7, 58},
+{0x01, 113},
+{0xc7, 56},
+{0x01, 114},
+{0xc6, 54},
+{0x07, 40},
+{0xC1, 121},
+{0xC2, 137},
+{0x07, 36},
+{0x07, 43},
+{0xC1, 122},
+{0xC1, 119},
+{0x01, 12},
+{0x01, 111},
+{0x01, 116},
+{0xC1, 127},
+{0xC2, 134},
+{0xC2, 130},
+{0xc, 33},
+{0xC1, 125},
+{0x01, 115},
+{0x22, 4},
+{0xC2, 138},
+{0x01, 108},
+{0x01, 102},
+{0xc, 46},
+{0x7, 11},
+{0xC1, 120},
+{0x07, 39},
+{0x07, 42},
+{0x5, 21},
+{0xC2, 131},
+{0xc1, 48},
+{0x12, 53},
+{0xC1, 124},
+{0x01, 117},
+{0xC1, 126},
+{0xf, 5},
+{0x23, 0},
+{0xC2, 139},
+{0x07, 34},
+{0x09, 146},
+{0x02, 178},
+{0xC2, 140},
+{0xC1, 118},
+{0xC2, 133},
+{0x07, 38},
+{0xC2, 143},
+{0x01, 101},
+{0xc3, 9},
+{0x7, 10},
+{0xc2, 51},
+{0x01, 109},
+{0xc, 32},
+{0x7, 8},
+{0xC1, 129},
+{0x01, 112},
+{0x01, 107},
+{0x07, 37},
+{0x07, 44},
+{0x1f, 50},
+{0xC2, 144},
+{0xc7, 52},
+{0xC2, 141},
+{0x01, 106},
+{0x01, 110},
+{0x01, 103},
+{0x9, 28},
+{0x07, 35},
+{0xc7, 55},
+{0x03, 179},
+{0x07, 41},
+{0xc, 30},
+{0x01, 100},
+{0xC1, 128},
+{0xC2, 135},
+{0x01, 105},
+{0x7, 47},
+{0xC2, 145},
+{0xc7, 57},
+{0x01, 104},
+{0x07, 45},
+{0xC2, 132},
+{0xc4, 49},
+{0xC1, 123},
+{0xC2, 142},
+{0x01, 13},
+{0xC2, 136},
+{0xc, 31},
+{0xff,0xff}
+};
+
+unsigned char findSensor(char sensor_number) {
+
+    int i=0;
+
+    // TODO : This function should actually call
+    // a dbus object and have it return the data
+    // it is not ready yet so use a Palmetto 
+    // based lookup table for now.  The g_sensortype
+    // can be removed once the dbus method exists
+    while (g_sensortype[i][0] != 0xff) {
+        if (g_sensortype[i][1] == sensor_number) {
+            break;
+        } else {
+            i++;
+        }
+
+    }
+
+    return g_sensortype[i][0];
+
+}
+
+
+int set_sensor_dbus_state(uint8_t number, const char *method, const char *value) {
+
+	printf("Attempting to log Sensor 0x%02x via %s with a value of %s\n", 
+		number, method, value);
+
+	return 0;
+}
+
+
+extern int updateSensorRecordFromSSRAESC(const void *record);
+
+
+
+
+
+uint8_t testrec_boot1[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00};
+uint8_t testrec_boot2[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00};
+uint8_t testrec_boot3[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00};
+uint8_t testrec_boot4[] = {0x05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00};                       
+
+
+
+// DIMM Present
+uint8_t testrec_sensor1[] {0x1F, 0xa9, 0x00, 0x40, 0x00, 0x10, 0x00, 0x00};
+
+// DIMM Not present
+uint8_t testrec_sensor2[] {0x1F, 0xa9, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00};
+
+
+uint8_t testrec_bootprogress[]  = {05, 0xa9, 0x00, 0x04, 0x00, 0x00, 0x14, 0x00 };
+
+int main() {
+
+	updateSensorRecordFromSSRAESC(testrec_bootprogress);
+	updateSensorRecordFromSSRAESC(testrec_sensor1);
+	updateSensorRecordFromSSRAESC(testrec_sensor2);
+
+
+	return 0;
+}
\ No newline at end of file
-- 
2.6.0
