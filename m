Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4LxR3Z4PzDqHH
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 13:21:15 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462936871724847.5954265045625;
 Tue, 10 May 2016 20:21:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v10 16/22] Support FAN tach sensors
Date: Tue, 10 May 2016 22:20:46 -0500
Message-Id: <1462936852-25327-17-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 03:21:16 -0000

From: johnhcwang <hsienchiang@gmail.com>

1. Support FAN tach sensors
2. Remove shut down action from info.
   It'll be done by Emergency ShutDown.
---
 bin/Barreleye.py        | 24 ++++++++++++++++++------
 objects/fan_algorithm.c | 20 ++++++++++----------
 objects/info.c          | 35 +++++++++--------------------------
 3 files changed, 37 insertions(+), 42 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index e05d985..8570db3 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -581,9 +581,15 @@ HWMON_CONFIG = {
 	},
 	'6-002d' : {
 		'names' : {
-			'pwm1' : { 'object_path' : 'speed/fan0','poll_interval' : 10000,'scale' : 1,'units' : '' },
-			'pwm2' : { 'object_path' : 'speed/fan1','poll_interval' : 10000,'scale' : 1,'units' : '' },
-                        'pwm3' : { 'object_path' : 'speed/fan2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm1' : { 'object_path' : 'speed/fan5','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm2' : { 'object_path' : 'speed/fan4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm3' : { 'object_path' : 'speed/fan3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan1_input' : { 'object_path' : 'tach/fan5L','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan2_input' : { 'object_path' : 'tach/fan5H','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan3_input' : { 'object_path' : 'tach/fan4L','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan4_input' : { 'object_path' : 'tach/fan4H','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan5_input' : { 'object_path' : 'tach/fan3L','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan6_input' : { 'object_path' : 'tach/fan3H','poll_interval' : 10000,'scale' : 1,'units' : '' },
                         'in1_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
                         'in2_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
                         'in3_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
@@ -602,9 +608,15 @@ HWMON_CONFIG = {
 	},
 	'6-002e' : {
 		'names' : {
-			'pwm1' : { 'object_path' : 'speed/fan3','poll_interval' : 10000,'scale' : 1,'units' : '' },
-			'pwm2' : { 'object_path' : 'speed/fan4','poll_interval' : 10000,'scale' : 1,'units' : '' },
-			'pwm3' : { 'object_path' : 'speed/fan5','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm1' : { 'object_path' : 'speed/fan2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm2' : { 'object_path' : 'speed/fan1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'pwm3' : { 'object_path' : 'speed/fan0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan1_input' : { 'object_path' : 'tach/fan2L','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan2_input' : { 'object_path' : 'tach/fan2H','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan3_input' : { 'object_path' : 'tach/fan1L','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan4_input' : { 'object_path' : 'tach/fan1H','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan5_input' : { 'object_path' : 'tach/fan0L','poll_interval' : 10000,'scale' : 1,'units' : '' },
+			'fan6_input' : { 'object_path' : 'tach/fan0H','poll_interval' : 10000,'scale' : 1,'units' : '' },
    			'in1_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
                         'in2_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
                         'in3_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
diff --git a/objects/fan_algorithm.c b/objects/fan_algorithm.c
index 1077d55..9665860 100755
--- a/objects/fan_algorithm.c
+++ b/objects/fan_algorithm.c
@@ -323,7 +323,7 @@ int Fan_control_algorithm(void)
 		/* Connect to the user bus this time */
 		rc = sd_bus_open_system(&bus);
 		if(rc < 0) {
-			fprintf(stderr, "fan 1 Failed to connect to system bus: %s\n", strerror(-rc));
+			fprintf(stderr, "Failed to connect to system bus for fan_algorithm: %s\n", strerror(-rc));
 			bus = sd_bus_flush_close_unref(bus);
 			sleep(1);
 		}
@@ -341,12 +341,12 @@ int Fan_control_algorithm(void)
 						&response,                  // Response message on success
 						NULL);                       // input message (string,byte)
 			if(rc < 0) {
-//				fprintf(stderr, "gCPU0ObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+//				fprintf(stderr, "Failed to get CPU 0 temperature from dbus: %s\n", bus_error.message);
 				CPU0_core_temperature[i] = 0;
 			} else {
 				rc = sd_bus_message_read(response, "v","i", &CPU0_core_temperature[i]);
 				if (rc < 0 ) {
-					fprintf(stderr, "gCPU0ObjPath Failed to parse response message:[%s]\n", strerror(-rc));
+					fprintf(stderr, "Failed to parse GetCpu0Temp response message:[%s]\n", strerror(-rc));
 					CPU0_core_temperature[i] = 0;
 				}
 			}
@@ -371,12 +371,12 @@ int Fan_control_algorithm(void)
 						&response,                  // Response message on success
 						NULL);                       // input message (string,byte)
 			if(rc < 0) {
-//				fprintf(stderr, "gCPU1ObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+//				fprintf(stderr, "Failed to get CPU 1 temperature from dbus: %s\n", bus_error.message);
 				CPU1_core_temperature[i] = 0;
 			} else {
 				rc = sd_bus_message_read(response, "v","i", &CPU1_core_temperature[i]);
 				if (rc < 0 ) {
-					fprintf(stderr, "gCPU1ObjPath Failed to parse response message:[%s]\n", strerror(-rc));
+					fprintf(stderr, "Failed to parse GetCpu1Temp response message:[%s]\n", strerror(-rc));
 					CPU1_core_temperature[i] = 0;
 				}
 			}
@@ -401,12 +401,12 @@ int Fan_control_algorithm(void)
 						&response,                  // Response message on success
 						NULL);                       // input message (string,byte)
 			if(rc < 0) {
-//				fprintf(stderr, "gDIMMObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+//				fprintf(stderr, "Failed to get DIMM temperature from dbus: %s\n", bus_error.message);
 				DIMM_temperature[i] = 0;
 			} else {
 				rc = sd_bus_message_read(response, "v","i", &DIMM_temperature[i]);
 				if (rc < 0 ) {
-					fprintf(stderr, "gDIMMObjPath Failed to parse response message:[%s]\n", strerror(-rc));
+					fprintf(stderr, "Failed to parse GetDimmTemp response message:[%s]\n", strerror(-rc));
 					DIMM_temperature[i] = 0;
 				}
 			}
@@ -427,12 +427,12 @@ int Fan_control_algorithm(void)
 					&response,                  // Response message on success
 					NULL);                       // input message (string,byte)
 		if(rc < 0) {
-//			fprintf(stderr, "fan2 Failed to resolve fruid to dbus: %s\n", bus_error.message);
+//			fprintf(stderr, "Failed to get ambient temperature from dbus: %s\n", bus_error.message);
 			Ambient_reading = 0;
 		} else {
 			rc = sd_bus_message_read(response, "v","i", &Ambient_reading);
 			if (rc < 0 ) {
-				fprintf(stderr, "fan3 Failed to parse response message:[%s]\n", strerror(-rc));
+				fprintf(stderr, "Failed to parse GetDimmTemp response message:[%s]\n", strerror(-rc));
 				Ambient_reading = 0;
 			}
 		}
@@ -481,7 +481,7 @@ int Fan_control_algorithm(void)
 						"i",						// input message (string,byte)
 						FinalFanSpeed);                  // First argument
 			if(rc < 0)
-				fprintf(stderr, "fanObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+				fprintf(stderr, "Failed to adjust fan speed via dbus: %s\n", bus_error.message);
 			sd_bus_error_free(&bus_error);
 			response = sd_bus_message_unref(response);
 		}
diff --git a/objects/info.c b/objects/info.c
index 2b98dbb..8e08974 100644
--- a/objects/info.c
+++ b/objects/info.c
@@ -154,7 +154,7 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
 	uint16_t value = 0;
 	int ret = 0;
 
-	fprintf(stderr,"add sel\n");
+	fprintf(stderr,"Add SEL due to Thermal Trip\n");
 	ret = sd_bus_open_system(&mbus);
 	if (ret < 0) {
 		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-ret));
@@ -214,7 +214,7 @@ int start_system_information(void)
 	do {
 		ret = sd_bus_open_system(&bus);
 		if(ret < 0) {
-			fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-ret));
+			fprintf(stderr, "Failed to connect to system bus for info: %s\n", strerror(-ret));
 			bus = sd_bus_flush_close_unref(bus);
 		}
 		sleep(1);
@@ -230,13 +230,13 @@ int start_system_information(void)
 					&response,                  // Response message on success
 					NULL);                       // input message (string,byte)
 		if(ret < 0) {
-//			fprintf(stderr, "Failed to resolve getPowerState to dbus: %s\n", bus_error.message);
+			fprintf(stderr, "Failed to get power state from dbus: %s\n", bus_error.message);
 			goto finish;
 		}
 
 		ret = sd_bus_message_read(response, "i", &value);
 		if (ret < 0 ) {
-			fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-ret));
+			fprintf(stderr, "Failed to parse GetPowerState response message:[%s]\n", strerror(-ret));
 			goto finish;
 		}
 		sd_bus_error_free(&bus_error);
@@ -258,12 +258,12 @@ int start_system_information(void)
 					&response,                  // Response message on success
 					NULL);                       // input message (string,byte)
 		if(ret < 0) {
-			fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
+			fprintf(stderr, "Failed to get OCC state from dbus: %s\n", bus_error.message);
 			goto finish;
 		}
 		ret = sd_bus_message_read(response, "v","s", &OccStatus);
 		if (ret < 0 ) {
-			fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-ret));
+			fprintf(stderr, "Failed to parse GetOccState response message:[%s]\n", strerror(-ret));
 			goto finish;
 		}
 		sd_bus_error_free(&bus_error);
@@ -281,36 +281,19 @@ int start_system_information(void)
 					&response,                  // Response message on success
 					NULL);                       // input message (string,byte)
 		if(ret < 0) {
-			fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
+			fprintf(stderr, "Failed to get CPU core0 temperature from dbus: %s\n", bus_error.message);
 			goto finish;
 		}
 		ret = sd_bus_message_read(response, "v","i", &value);
 		if (ret < 0 ) {
-			fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-ret));
+			fprintf(stderr, "Failed to parse GetCpuCore0Temp response message:[%s]\n", strerror(-ret));
 			goto finish;
 		}
 		sd_bus_error_free(&bus_error);
 		response = sd_bus_message_unref(response);
 		fprintf(stderr,"CPU value = [%d] \n",value);
-		if(value >= 90) {
-			//printf("====Ken poweroff==== \n");
+		if(value >= 90)
 			send_esel_to_dbus("CPU thermal trip", "High", "assoc", "hack", 3);
-
-			ret = sd_bus_call_method(bus,                   // On the System Bus
-						gService_c,               // Service to contact
-						gObjPath_c,            // Object path
-						gIntPath_c,              // Interface name
-						"powerOff",          // Method to be called
-						&bus_error,                 // object to return error
-						&response,                  // Response message on success
-						NULL);                       // input message (string,byte)
-
-			if(ret < 0) {
-				fprintf(stderr, "Failed to resolve poweroff to dbus: %s\n", bus_error.message);
-				goto finish;
-			}
-			sd_bus_error_free(&bus_error);
-		}
 	
 finish:
 		sd_bus_error_free(&bus_error);
-- 
2.8.1
