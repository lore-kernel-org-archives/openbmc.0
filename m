Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3pJx3797zDqCF
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 15:51:12 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462859470101374.9723859027646;
 Mon, 9 May 2016 22:51:10 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v9 17/23] Generate thermaltrip event
Date: Tue, 10 May 2016 00:50:43 -0500
Message-Id: <1462859449-5466-18-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 05:51:14 -0000

From: johnhcwang <hsienchiang@gmail.com>

Keep the original design from v2.10
---
 objects/info.c | 121 ++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 95 insertions(+), 26 deletions(-)

diff --git a/objects/info.c b/objects/info.c
index 8e08974..386133c 100644
--- a/objects/info.c
+++ b/objects/info.c
@@ -6,9 +6,37 @@
 #include "i2c-dev.h"
 #include "log.h"
 
+
+#define NUM_CPU_CORE	12
+
 const char *gService = "org.openbmc.Sensors";
-const char *gObjPath = "/org/openbmc/sensors/temperature/cpu0/core0";
-const char *gObjPath_o = "/org/openbmc/sensors/host/OccStatus";
+const char *gCPU0ObjPath[NUM_CPU_CORE] = {"/org/openbmc/sensors/temperature/cpu0/core0",
+						"/org/openbmc/sensors/temperature/cpu0/core1",
+						"/org/openbmc/sensors/temperature/cpu0/core2",
+						"/org/openbmc/sensors/temperature/cpu0/core3",
+						"/org/openbmc/sensors/temperature/cpu0/core4",
+						"/org/openbmc/sensors/temperature/cpu0/core5",
+						"/org/openbmc/sensors/temperature/cpu0/core6",
+						"/org/openbmc/sensors/temperature/cpu0/core7",
+						"/org/openbmc/sensors/temperature/cpu0/core8",
+						"/org/openbmc/sensors/temperature/cpu0/core9",
+						"/org/openbmc/sensors/temperature/cpu0/core10",
+						"/org/openbmc/sensors/temperature/cpu0/core11"};
+
+const char *gCPU1ObjPath[NUM_CPU_CORE] = {"/org/openbmc/sensors/temperature/cpu1/core0",
+						"/org/openbmc/sensors/temperature/cpu1/core1",
+						"/org/openbmc/sensors/temperature/cpu1/core2",
+						"/org/openbmc/sensors/temperature/cpu1/core3",
+						"/org/openbmc/sensors/temperature/cpu1/core4",
+						"/org/openbmc/sensors/temperature/cpu1/core5",
+						"/org/openbmc/sensors/temperature/cpu1/core6",
+						"/org/openbmc/sensors/temperature/cpu1/core7",
+						"/org/openbmc/sensors/temperature/cpu1/core8",
+						"/org/openbmc/sensors/temperature/cpu1/core9",
+						"/org/openbmc/sensors/temperature/cpu1/core10",
+						"/org/openbmc/sensors/temperature/cpu1/core11"};
+
+const char *gObjPath_o = "/org/openbmc/sensors/host/cpu0/OccStatus";
 const char *gIntPath = "org.openbmc.SensorValue";
 
 const char *gService_c = "org.openbmc.control.Chassis";
@@ -207,7 +235,7 @@ int start_system_information(void)
 	sd_bus *bus = NULL;
 	sd_bus_error bus_error = SD_BUS_ERROR_NULL;
 	sd_bus_message *response = NULL;
-	int ret = 0, value = 0;
+	int ret = 0, value = 0, i = 0, HighestCPUtemp = 0, thermaltrip_lock = 0;
 	char *OccStatus = NULL;
 
 	/* Connect to the user bus this time */
@@ -242,13 +270,16 @@ int start_system_information(void)
 		sd_bus_error_free(&bus_error);
 		response = sd_bus_message_unref(response);
 //		fprintf(stderr,"PowerState value = [%d] \n",value);
-		if (value == 0 )
+		if (value == 0 ) {
+			thermaltrip_lock = 0;
 			goto finish;
+		} else {
+			if (thermaltrip_lock == 1)	//probabily log two thermaltrip events, so block by this flag
+				goto finish;
+		}
 	
 		get_hdd_status();
 
-		sleep(1);
-
 		ret = sd_bus_call_method(bus,                   // On the System Bus
 					gService,               // Service to contact
 					gObjPath_o,            // Object path
@@ -268,37 +299,75 @@ int start_system_information(void)
 		}
 		sd_bus_error_free(&bus_error);
 		response = sd_bus_message_unref(response);
-		fprintf(stderr,"OCCState value = [%s][%d] \n",OccStatus,strcmp(OccStatus, "Disable"));
+//		fprintf(stderr,"OCCState value = [%s][%d] \n",OccStatus,strcmp(OccStatus, "Disable"));
 		if (strcmp(OccStatus, "Disable") != 1 )
 			goto finish;
 
-		ret = sd_bus_call_method(bus,                   // On the System Bus
-					gService,               // Service to contact
-					gObjPath,            // Object path
-					gIntPath,              // Interface name
-					"getValue",          // Method to be called
-					&bus_error,                 // object to return error
-					&response,                  // Response message on success
-					NULL);                       // input message (string,byte)
-		if(ret < 0) {
-			fprintf(stderr, "Failed to get CPU core0 temperature from dbus: %s\n", bus_error.message);
-			goto finish;
+		for(i=0; i<NUM_CPU_CORE; i++) {
+			ret = sd_bus_call_method(bus,                   // On the System Bus
+						gService,               // Service to contact
+						gCPU0ObjPath[i],            // Object path
+						gIntPath,              // Interface name
+						"getValue",          // Method to be called
+						&bus_error,                 // object to return error
+						&response,                  // Response message on success
+						NULL);                       // input message (string,byte)
+			if(ret < 0) {
+//				fprintf(stderr, "Failed to get CPU 0 temperature from dbus: %s\n", bus_error.message);
+				value = 0;
+			} else {
+				ret = sd_bus_message_read(response, "v","i", &value);
+				if (ret < 0 ) {
+					fprintf(stderr, "Failed to parse GetCpu0Temp response message:[%s]\n", strerror(-ret));
+					value = 0;
+				}
+			}
+//			fprintf(stderr, "CPU0 core %d temperature is %d\n",i ,value);
+			if(value > HighestCPUtemp)
+				HighestCPUtemp = value;
+
+			sd_bus_error_free(&bus_error);
+			response = sd_bus_message_unref(response);
 		}
-		ret = sd_bus_message_read(response, "v","i", &value);
-		if (ret < 0 ) {
-			fprintf(stderr, "Failed to parse GetCpuCore0Temp response message:[%s]\n", strerror(-ret));
-			goto finish;
+
+		for(i=0; i<NUM_CPU_CORE; i++) {
+			ret = sd_bus_call_method(bus,                   // On the System Bus
+						gService,               // Service to contact
+						gCPU1ObjPath[i],            // Object path
+						gIntPath,              // Interface name
+						"getValue",          // Method to be called
+						&bus_error,                 // object to return error
+						&response,                  // Response message on success
+						NULL);                       // input message (string,byte)
+			if(ret < 0) {
+//				fprintf(stderr, "Failed to get CPU 1 temperature from dbus: %s\n", bus_error.message);
+				value = 0;
+			} else {
+				ret = sd_bus_message_read(response, "v","i", &value);
+				if (ret < 0 ) {
+					fprintf(stderr, "Failed to parse GetCpu1Temp response message:[%s]\n", strerror(-ret));
+					value = 0;
+				}
+			}
+//			fprintf(stderr, "CPU1 core %d temperature is %d\n",i ,value);
+			if(value > HighestCPUtemp )
+				HighestCPUtemp = value;
+
+			sd_bus_error_free(&bus_error);
+			response = sd_bus_message_unref(response);
 		}
-		sd_bus_error_free(&bus_error);
-		response = sd_bus_message_unref(response);
-		fprintf(stderr,"CPU value = [%d] \n",value);
-		if(value >= 90)
+//		fprintf(stderr, "Highest CPU temperature = [%d]\n", HighestCPUtemp);
+
+		if(HighestCPUtemp >= 90) {
+			thermaltrip_lock = 1;
 			send_esel_to_dbus("CPU thermal trip", "High", "assoc", "hack", 3);
+		}
 	
 finish:
 		sd_bus_error_free(&bus_error);
 		response = sd_bus_message_unref(response);
 		sd_bus_flush(bus);
+		HighestCPUtemp = 0;
 		sleep(1);
 	}
 
-- 
2.8.1
