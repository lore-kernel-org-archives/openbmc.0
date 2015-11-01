Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498C01A060B
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:14:55 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446340490405533.1889723288551;
 Sat, 31 Oct 2015 18:14:50 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] remove False from fault property when
 nothing wrong
Date: Sat, 31 Oct 2015 20:14:47 -0500
Message-Id: <1446340487-9066-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446340487-9066-1-git-send-email-patches@stwcx.xyz>
References: <1446340487-9066-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:14:55 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmisensor.C | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ipmisensor.C b/ipmisensor.C
index dadee9f..513e485 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -131,15 +131,15 @@ int set_sensor_dbus_state_osboot(const sensorRES_t *pRec, const lookup_t *pTable
 lookup_t g_ipmidbuslookup[] = {
 
 	{0x07, 0x00, set_sensor_dbus_state_simple, "setPresent", "False", "False"}, // OCC Inactive 0
-	{0x07, 0x01, set_sensor_dbus_state_simple, "setPresent", "True", "True"},   // OCC Active 1 
+	{0x07, 0x01, set_sensor_dbus_state_simple, "setPresent", "True", "True"},   // OCC Active 1
 	{0x07, 0x07, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
-	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
+	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", ""},
 	{0x0C, 0x06, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
-	{0x0C, 0x04, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
+	{0x0C, 0x04, set_sensor_dbus_state_simple, "setFault",   "True", ""},
 	{0x0F, 0x02, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x01, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x00, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
-	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", "False"},
+	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", ""},
 	{0xc3, 0x00, set_sensor_dbus_state_osboot, "setValue", "" ,""},
 
 	{0xFF, 0xFF, NULL, "", "", ""}
-- 
2.6.0
