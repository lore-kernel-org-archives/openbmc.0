Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4276E1A0734
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 23:48:58 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445431733777709.3650865497536;
 Wed, 21 Oct 2015 05:48:53 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 18/20] C7 and & virtual sensor support
Date: Wed, 21 Oct 2015 07:48:19 -0500
Message-Id: <1445431701-8681-19-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
References: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 12:48:58 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmisensor.C | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/ipmisensor.C b/ipmisensor.C
index 72cb576..f60db18 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -7,7 +7,6 @@ extern unsigned char findSensor(char);
 extern int set_sensor_dbus_state_v(uint8_t , const char *, char *);
 
 
-
 struct sensorRES_t {
 	uint8_t sensor_number;
 	uint8_t operation;
@@ -93,7 +92,7 @@ char *getfw02string(uint8_t b) {
 		i++;
 	} while ((p+i)->data != 0xFF);
 
-	return p->text;
+	return (p+i)->text;
 }
 //  The fw progress sensor contains some additional information that needs to be processed
 //  prior to calling the dbus code.  
@@ -108,12 +107,23 @@ int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pT
 					break;
 		case 0x01 : sprintf(valuestring, "FW Hang, 0x%02x", pRec->event_data2);
 					break;
-		case 0x02 : sprintf(valuestring, "FW Progress, 0x%02x", getfw02string(pRec->event_data2));
+		case 0x02 : sprintf(valuestring, "FW Progress, %s", getfw02string(pRec->event_data2));
 	}
 
 	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
 }
 
+// Handling this special OEM sensor by coping what is in byte 4.  I also think that is odd
+// considering byte 3 is for sensor reading.  This seems like a misuse of the IPMI spec
+int set_sensor_dbus_state_osboot(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
+	char valuestring[32];
+	char* pStr = valuestring;
+
+	sprintf(valuestring, "%d", pRec->assert_state7_0);
+
+	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
+}
+
 
 //  This table lists only senors we care about telling dbus about.
 //  Offset definition cab be found in section 42.2 of the IPMI 2.0 
@@ -127,6 +137,10 @@ lookup_t g_ipmidbuslookup[] = {
 	{0x0F, 0x02, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x01, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x00, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
+	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", "False"},
+	{0x07, 0x00, set_sensor_dbus_state_simple, "setPresent", "False", "False"}, // OCC Inactive 0
+	{0x07, 0x01, set_sensor_dbus_state_simple, "setPresent", "True", "True"},   // OCC Active 1 
+	{0xc3, 0x00, set_sensor_dbus_state_osboot, "setValue", "" ,""},
 
 	{0xFF, 0xFF, NULL, "", "", ""}
 };
@@ -161,11 +175,20 @@ int findindex(const uint8_t sensor_type, int offset, int *index) {
 	return rc;
 }
 
+void debug_print_ok_to_dont_care(uint8_t stype, int offset)
+{
+	printf("Sensor should not be reported:  Type 0x%02x, Offset 0x%02x\n",
+		stype, offset);
+}
+
 bool shouldReport(uint8_t sensorType, int offset, int *index) {
 
 	bool rc = false;
+
 	if (findindex(sensorType, offset, index)) { rc = true;	}
 
+	if (rc==false) { debug_print_ok_to_dont_care(sensorType, offset); }
+
 	return rc;
 }
 
@@ -177,7 +200,6 @@ int updateSensorRecordFromSSRAESC(const void *record) {
 	int index, i=0;
 	stype = findSensor(pRec->sensor_number);
 
-
 	// Scroll through each bit position .  Determine 
 	// if any bit is either asserted or Deasserted.
 	for(i=0;i<8;i++) {
-- 
2.6.0
