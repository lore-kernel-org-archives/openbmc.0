Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E2E951A04EB
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2015 08:40:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449178826502442.3079327901262;
 Thu, 3 Dec 2015 13:40:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] support for more sensors
Date: Thu,  3 Dec 2015 16:40:25 -0500
Message-Id: <1449178825-12072-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449178825-12072-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449178825-12072-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Dec 2015 21:40:32 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmisensor.C    | 35 ++++++++++++++++++++++++++++++++---
 sensorhandler.C | 14 ++++----------
 2 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/ipmisensor.C b/ipmisensor.C
index 6d3d3bd..1f60f64 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -129,6 +129,8 @@ int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pT
 					break;
 		case 0x02 : snprintf(p, sizeof(valuestring), "FW Progress, %s", event_data_lookup(g_fwprogress02h, pRec->event_data2));
 					break;
+		default : snprintf(p, sizeof(valuestring), "Internal warning, fw_progres offset unknown (0x%02x)", pTable->offset);
+					break;
 	}
 
 	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, p);
@@ -145,6 +147,28 @@ int set_sensor_dbus_state_osbootcount(const sensorRES_t *pRec, const lookup_t *p
 	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
 }
 
+int set_sensor_dbus_state_system_event(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
+	char valuestring[128];
+	char* p = valuestring;
+
+	switch (pTable->offset) {
+
+		case 0x00 : snprintf(p, sizeof(valuestring), "System Reconfigured");
+					break;
+		case 0x01 : snprintf(p, sizeof(valuestring), "OEM Boot Event");
+					break;
+		case 0x02 : snprintf(p, sizeof(valuestring), "Undetermine System Hardware Failure");
+					break;
+		case 0x03 : snprintf(p, sizeof(valuestring), "System Failure see error log for more details (0x%02x)", pRec->event_data2);
+					break;
+		case 0x04 : snprintf(p, sizeof(valuestring), "System Failure see PEF error log for more details (0x%02x)", pRec->event_data2);
+					break;
+		default : snprintf(p, sizeof(valuestring), "Internal warning, system_event offset unknown (0x%02x)", pTable->offset);
+					break;
+	}
+
+	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, p);
+}
 
 
 //  This table lists only senors we care about telling dbus about.
@@ -155,13 +179,13 @@ lookup_t g_ipmidbuslookup[] = {
 	{0xe9, 0x00, set_sensor_dbus_state_simple, "setValue", "Disabled", ""}, // OCC Inactive 0
 	{0xe9, 0x01, set_sensor_dbus_state_simple, "setValue", "Enabled", ""},   // OCC Active 1
 	{0x07, 0x07, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
-	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", ""},
+	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
 	{0x0C, 0x06, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
-	{0x0C, 0x04, set_sensor_dbus_state_simple, "setFault",   "True", ""},
+	{0x0C, 0x04, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
 	{0x0F, 0x02, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x01, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x00, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
-	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", ""},
+	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", "False"},
 	{0xc3, 0x00, set_sensor_dbus_state_osbootcount, "setValue", "" ,""},
 	{0x1F, 0x00, set_sensor_dbus_state_simple, "setValue", "Boot completed (00)", ""},
 	{0x1F, 0x01, set_sensor_dbus_state_simple, "setValue", "Boot completed (01)", ""},
@@ -170,6 +194,11 @@ lookup_t g_ipmidbuslookup[] = {
 	{0x1F, 0x04, set_sensor_dbus_state_simple, "setValue", "CD-ROM boot completed", ""},
 	{0x1F, 0x05, set_sensor_dbus_state_simple, "setValue", "ROM boot completed", ""},
 	{0x1F, 0x06, set_sensor_dbus_state_simple, "setValue", "Boot completed (06)", ""},
+	{0x12, 0x00, set_sensor_dbus_state_system_event, "setValue", "", ""},
+	{0x12, 0x01, set_sensor_dbus_state_system_event, "setValue", "", ""},
+	{0x12, 0x02, set_sensor_dbus_state_system_event, "setValue", "", ""},
+	{0x12, 0x03, set_sensor_dbus_state_system_event, "setValue", "", ""},
+	{0x12, 0x04, set_sensor_dbus_state_system_event, "setValue", "", ""},
 
 	{0xFF, 0xFF, NULL, "", "", ""}
 };
diff --git a/sensorhandler.C b/sensorhandler.C
index dd83152..c96b7a7 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -29,11 +29,13 @@ sensorTypemap_t g_SensorTypeMap[] = {
     {0xe9, 0x09, "OccStatus"},  // E9 is an internal mapping to handle sensor type code os 0x09
     {0xC3, 0x6F, "BootCount"},
     {0x1F, 0x6F, "OperatingSystemStatus"},
+    {0x12, 0x6F, "SYSTEM_EVENT"},
+    {0xC7, 0x03, "SYSTEM"},
+    {0xC7, 0x03, "MAIN_PLANAR"},
     {0xFF, 0x00, ""},
 };
 
 
-
 struct sensor_data_t {
     uint8_t sennum;
 }  __attribute__ ((packed)) ;
@@ -119,15 +121,7 @@ ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // HACK UNTIL Dbus gets updated or we find a better way
     if (buf[0] == 0) {
-
-        switch(reqptr->sennum) {
-            case 0x35 : buf[0] = 0x12; buf[1] = 0x6F; break;
-            case 0x37 : buf[0] = 0xC7; buf[1] = 0x03; break;
-            case 0x38 : buf[0] = 0xC7; buf[1] = 0x03; break;
-            case 0x39 : buf[0] = 0xC7; buf[1] = 0x03; break;
-            case 0x3A : buf[0] = 0xC7; buf[1] = 0x03; break;
-            default: rc = IPMI_CC_SENSOR_INVALID;
-        }
+        rc = IPMI_CC_SENSOR_INVALID;
     }
 
 
-- 
2.6.3
