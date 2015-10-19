Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 128251A0B53
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:57:35 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259452926806.4235514016751;
 Mon, 19 Oct 2015 05:57:32 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 7/7] buffer overrun in sensor handling
Date: Mon, 19 Oct 2015 07:57:19 -0500
Message-Id: <1445259439-10608-8-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:57:36 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmisensor.C | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/ipmisensor.C b/ipmisensor.C
index f60db18..4768bc1 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -98,19 +98,18 @@ char *getfw02string(uint8_t b) {
 //  prior to calling the dbus code.  
 int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
 
-	char valuestring[32];
-	char* pStr = valuestring;
+	char message[128];
 
 	switch (pTable->offset) {
 
-		case 0x00 : sprintf(valuestring, "POST Error, 0x%02x", pRec->event_data2);
+		case 0x00 : snprintf(message, sizeof(message), "POST Error, 0x%02x", pRec->event_data2);
 					break;
-		case 0x01 : sprintf(valuestring, "FW Hang, 0x%02x", pRec->event_data2);
+		case 0x01 : snprintf(message, sizeof(message), "FW Hang, 0x%02x", pRec->event_data2);
 					break;
-		case 0x02 : sprintf(valuestring, "FW Progress, %s", getfw02string(pRec->event_data2));
+		case 0x02 : snprintf(message, sizeof(message), "FW Progress, %s", getfw02string(pRec->event_data2));
 	}
 
-	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
+	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, message);
 }
 
 // Handling this special OEM sensor by coping what is in byte 4.  I also think that is odd
-- 
2.6.0
