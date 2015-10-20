Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4403E1A0174
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 15:04:24 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445313861827876.1004950714348;
 Mon, 19 Oct 2015 21:04:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Fix a buffer overrun
Date: Mon, 19 Oct 2015 23:04:18 -0500
Message-Id: <1445313858-25193-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445313858-25193-1-git-send-email-patches@stwcx.xyz>
References: <1445313858-25193-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 04:04:24 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmisensor.C | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ipmisensor.C b/ipmisensor.C
index f60db18..568f4a4 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -98,16 +98,16 @@ char *getfw02string(uint8_t b) {
 //  prior to calling the dbus code.  
 int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
 
-	char valuestring[32];
+	char valuestring[48];
 	char* pStr = valuestring;
 
 	switch (pTable->offset) {
 
-		case 0x00 : sprintf(valuestring, "POST Error, 0x%02x", pRec->event_data2);
+		case 0x00 : snprintf(valuestring, sizeof(valuestring), "POST Error, 0x%02x", pRec->event_data2);
 					break;
-		case 0x01 : sprintf(valuestring, "FW Hang, 0x%02x", pRec->event_data2);
+		case 0x01 : snprintf(valuestring, sizeof(valuestring), "FW Hang, 0x%02x", pRec->event_data2);
 					break;
-		case 0x02 : sprintf(valuestring, "FW Progress, %s", getfw02string(pRec->event_data2));
+		case 0x02 : snprintf(valuestring, sizeof(valuestring), "FW Progress, %s", getfw02string(pRec->event_data2));
 	}
 
 	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
-- 
2.6.0
