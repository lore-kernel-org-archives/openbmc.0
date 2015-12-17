Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 550A51A0327
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 12:20:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450315226705168.3690380550322;
 Wed, 16 Dec 2015 17:20:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4 1/2] Support host reboot
Date: Wed, 16 Dec 2015 19:20:24 -0600
Message-Id: <1450315225-22284-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450315225-22284-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450315225-22284-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 17 Dec 2015 01:20:31 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 chassishandler.C | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index 56b8375..1389db9 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -31,7 +31,7 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 //------------------------------------------------------------
 // Calls into Chassis Control Dbus object to do the power off
 //------------------------------------------------------------
-int ipmi_chassis_power_off()
+int ipmi_chassis_power_control(const char *method)
 {
 	// sd_bus error
 	int rc = 0;
@@ -50,7 +50,7 @@ int ipmi_chassis_power_off()
 							chassis_bus_name,        // Service to contact
 							chassis_object_name,     // Object path 
 							chassis_intf_name,       // Interface name
-							"powerOff",      		 // Method to be called
+							method,      		 // Method to be called
 							&bus_error,      		 // object to return error
 							&response,		 		 // Response buffer if any
 							NULL);			 		 // No input arguments
@@ -69,6 +69,7 @@ int ipmi_chassis_power_off()
 	return rc;
 }
 
+
 //----------------------------------------------------------------------
 // Chassis Control commands
 //----------------------------------------------------------------------
@@ -89,11 +90,11 @@ ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	switch(chassis_ctrl_cmd)
 	{
 		case CMD_POWER_OFF:
+			rc = ipmi_chassis_power_control("powerOff");
+			break;
 		case CMD_HARD_RESET:
-		{
-			rc = ipmi_chassis_power_off();
+			rc = ipmi_chassis_power_control("reboot");
 			break;
-		}
 		default:
 		{
 			fprintf(stderr, "Invalid Chassis Control command:[0x%X] received\n",chassis_ctrl_cmd);
-- 
2.6.3
