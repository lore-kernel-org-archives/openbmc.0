Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3jR64gZnzDqCD
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 12:11:14 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462846270648276.4911397149408;
 Mon, 9 May 2016 19:11:10 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v8 19/22] Support FAN LED feature
Date: Mon,  9 May 2016 21:10:47 -0500
Message-Id: <1462846250-29392-20-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462846250-29392-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462846250-29392-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 May 2016 02:11:15 -0000

From: johnhcwang <hsienchiang@gmail.com>

---
 objects/fan_algorithm.c | 475 ++++++++++++++++++++++++++----------------------
 1 file changed, 261 insertions(+), 214 deletions(-)

diff --git a/objects/fan_algorithm.c b/objects/fan_algorithm.c
index 9665860..9bb3f4c 100755
--- a/objects/fan_algorithm.c
+++ b/objects/fan_algorithm.c
@@ -6,45 +6,59 @@
 #include "i2c-dev.h"
 #include "log.h"
 
+
+#define NUM_DIMM	32
+#define NUM_FAN		12
+#define NUM_CPU_CORE	12
+#define NUM_PWM		6
+
 const char *gService = "org.openbmc.Sensors";
 const char *fanService = "org.openbmc.control.Fans";
-
-const char *gfanflagObjPath = "/org/openbmc/sensors/FanParameter/flag";
-const char *gfanCPUvaribleObjPath = "/org/openbmc/sensors/FanParameter/flag";
-const char *gfanDIMMvaribleObjPath = "/org/openbmc/sensors/FanParameter/flag";
-			
-const char *gfanpidObjPath [3] = {"/org/openbmc/sensors/FanParameter/Kp",
-							      "/org/openbmc/sensors/FanParameter/Ki",
-							      "/org/openbmc/sensors/FanParameter/Kd"};
-
-
-const char *gCPU0ObjPath [12] = {"/org/openbmc/sensors/temperature/cpu0/core0",
-								 "/org/openbmc/sensors/temperature/cpu0/core1",
-								 "/org/openbmc/sensors/temperature/cpu0/core2",
-								 "/org/openbmc/sensors/temperature/cpu0/core3",
-								 "/org/openbmc/sensors/temperature/cpu0/core4",
-								 "/org/openbmc/sensors/temperature/cpu0/core5",
-								 "/org/openbmc/sensors/temperature/cpu0/core6",
-								 "/org/openbmc/sensors/temperature/cpu0/core7",
-								 "/org/openbmc/sensors/temperature/cpu0/core8",
-								 "/org/openbmc/sensors/temperature/cpu0/core9",
-								 "/org/openbmc/sensors/temperature/cpu0/core10",
-								 "/org/openbmc/sensors/temperature/cpu0/core11"};
+const char *gService_Power = "org.openbmc.control.Chassis";
+const char *gObjPath_Power = "/org/openbmc/control/chassis0";
+const char *gIntPath_Power = "org.openbmc.control.Chassis";
+
+const char *fanInObjPath [NUM_FAN] = {"/org/openbmc/sensors/tach/fan0H",
+				"/org/openbmc/sensors/tach/fan0L",
+				"/org/openbmc/sensors/tach/fan1H",
+				"/org/openbmc/sensors/tach/fan1L",
+				"/org/openbmc/sensors/tach/fan2H",
+				"/org/openbmc/sensors/tach/fan2L",
+				"/org/openbmc/sensors/tach/fan3H",
+				"/org/openbmc/sensors/tach/fan3L",
+				"/org/openbmc/sensors/tach/fan4H",
+				"/org/openbmc/sensors/tach/fan4L",
+				"/org/openbmc/sensors/tach/fan5H",
+				"/org/openbmc/sensors/tach/fan5L",
+				};
+
+const char *gCPU0ObjPath[NUM_CPU_CORE] = {"/org/openbmc/sensors/temperature/cpu0/core0",
+						 "/org/openbmc/sensors/temperature/cpu0/core1",
+						 "/org/openbmc/sensors/temperature/cpu0/core2",
+						 "/org/openbmc/sensors/temperature/cpu0/core3",
+						 "/org/openbmc/sensors/temperature/cpu0/core4",
+						 "/org/openbmc/sensors/temperature/cpu0/core5",
+						 "/org/openbmc/sensors/temperature/cpu0/core6",
+						 "/org/openbmc/sensors/temperature/cpu0/core7",
+						 "/org/openbmc/sensors/temperature/cpu0/core8",
+						 "/org/openbmc/sensors/temperature/cpu0/core9",
+						 "/org/openbmc/sensors/temperature/cpu0/core10",
+						 "/org/openbmc/sensors/temperature/cpu0/core11"};
 								
-const char *gCPU1ObjPath [12] = {"/org/openbmc/sensors/temperature/cpu0/core0",
-								 "/org/openbmc/sensors/temperature/cpu0/core1",
-								 "/org/openbmc/sensors/temperature/cpu0/core2",
-								 "/org/openbmc/sensors/temperature/cpu0/core3",
-								 "/org/openbmc/sensors/temperature/cpu0/core4",
-								 "/org/openbmc/sensors/temperature/cpu0/core5",
-								 "/org/openbmc/sensors/temperature/cpu0/core6",
-								 "/org/openbmc/sensors/temperature/cpu0/core7",
-								 "/org/openbmc/sensors/temperature/cpu0/core8",
-								 "/org/openbmc/sensors/temperature/cpu0/core9",
-								 "/org/openbmc/sensors/temperature/cpu0/core10",
-								 "/org/openbmc/sensors/temperature/cpu0/core11"};
-
-const char *gDIMMObjPath [32] = {"/org/openbmc/sensors/temperature/dimm0",
+const char *gCPU1ObjPath[NUM_CPU_CORE] = {"/org/openbmc/sensors/temperature/cpu1/core0",
+						 "/org/openbmc/sensors/temperature/cpu1/core1",
+						 "/org/openbmc/sensors/temperature/cpu1/core2",
+						 "/org/openbmc/sensors/temperature/cpu1/core3",
+						 "/org/openbmc/sensors/temperature/cpu1/core4",
+						 "/org/openbmc/sensors/temperature/cpu1/core5",
+						 "/org/openbmc/sensors/temperature/cpu1/core6",
+						 "/org/openbmc/sensors/temperature/cpu1/core7",
+						 "/org/openbmc/sensors/temperature/cpu1/core8",
+						 "/org/openbmc/sensors/temperature/cpu1/core9",
+						 "/org/openbmc/sensors/temperature/cpu1/core10",
+						 "/org/openbmc/sensors/temperature/cpu1/core11"};
+
+const char *gDIMMObjPath [NUM_DIMM] = {"/org/openbmc/sensors/temperature/dimm0",
 								 "/org/openbmc/sensors/temperature/dimm1",
 								 "/org/openbmc/sensors/temperature/dimm2",
 								 "/org/openbmc/sensors/temperature/dimm3",
@@ -91,22 +105,6 @@ const char *fanObjPath [6] ={"/org/openbmc/sensors/speed/fan0",
 const char *gIntPath = "org.openbmc.SensorValue";
 
 
-char *gMessage = NULL;
-
-#define MAX_BYTES 255
-
-int g_use_pec = 0;
-int g_has_write = 1;
-int g_n_write = 0;
-uint8_t g_write_bytes[MAX_BYTES];
-uint8_t g_write_color_bytes[MAX_BYTES];
-
-int g_has_read = 1;
-int g_n_read = -1;
-uint8_t g_read_bytes[MAX_BYTES];
-uint8_t g_read_tmp[MAX_BYTES];
-uint8_t g_bus = -1;
-uint8_t g_slave_addr = 0xff;
 double g_Kp = 0.7;
 double g_Ki = -0.025;
 double g_Kd = 1.0;
@@ -120,18 +118,16 @@ int Interal_DIMM_Err[20]={0};
 
 int g_fanspeed = 0;
 
-
 int Openloopspeed = 0;
 int Closeloopspeed = 0;
 int Finalfanspeed = 0;
 
-static int i2c_open()
+static int i2c_open(int bus)
 {
 	int rc = 0, fd = -1;
 	char fn[32];
 
-	g_bus = 6;
-	snprintf(fn, sizeof(fn), "/dev/i2c-%d", g_bus);
+	snprintf(fn, sizeof(fn), "/dev/i2c-%d", bus);
 	fd = open(fn, O_RDWR);
 	if (fd == -1) {
 		LOG_ERR(errno, "Failed to open i2c device %s", fn);
@@ -141,48 +137,30 @@ static int i2c_open()
 	return fd;
 }
 
-static int SetFanLed(int fd,int color)
+#define CMD_OUTPUT_PORT_0 2
+#define PCA9535_ADDR 0x20
+static int SetFanLed(int fd, uint8_t port0, uint8_t port1)
 {
 	struct i2c_rdwr_ioctl_data data;
-	struct i2c_msg msg[2];
-	int rc = 0, n_msg = 0;
+	struct i2c_msg msg[1];
+	int rc = 0, use_pec = 0;
+	uint8_t write_bytes[3];
 
-	memset(&msg, 0, sizeof(msg));
+//	fprintf(stderr,"SetFanLed: port0 = %02X,port1 = %02X\n",port0,port1);
 
-	g_slave_addr = 0x20;
-	g_use_pec = 0;
-	g_n_write = 2;
+	memset(&msg, 0, sizeof(msg));
 
-	if(color == 1) {
-		//blue light
-		g_write_bytes[0] = 0x03;
-		g_write_bytes[1] = 0x55;
-		g_write_color_bytes[0] = 0x02;
-		g_write_color_bytes[1] = 0xaa;
-	} else {
-		//red light
-		g_write_bytes[0] = 0x03;
-		g_write_bytes[1] = 0xaa;
-		g_write_color_bytes[0] = 0x02;
-		g_write_color_bytes[1] = 0x55;
-	}
+	write_bytes[0] = CMD_OUTPUT_PORT_0;
+	write_bytes[1] = port0;
+	write_bytes[2] = port1;
   
-	if (1) {
-		msg[n_msg].addr = g_slave_addr;
-		msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
-		msg[n_msg].len = g_n_write;
-		msg[n_msg].buf = g_write_bytes;
-		n_msg++;
-	}
-	 if (1) {
-		msg[n_msg].addr = g_slave_addr;
-		msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
-		msg[n_msg].len = g_n_write;
-		msg[n_msg].buf = g_write_color_bytes;
-		n_msg++;
-	}
+	msg[0].addr = PCA9535_ADDR;
+	msg[0].flags = (use_pec) ? I2C_CLIENT_PEC : 0;
+	msg[0].len = sizeof(write_bytes);
+	msg[0].buf = write_bytes;
+
 	data.msgs = msg;
-	data.nmsgs = n_msg;
+	data.nmsgs = 1;
 	rc = ioctl(fd, I2C_RDWR, &data);
 	if (rc < 0) {
 		LOG_ERR(errno, "Failed to do raw io");
@@ -302,22 +280,26 @@ int OpenLoop (int sensorreading)
 	return 0;
 }
 
-
+#define FAN_LED_OFF     0xFF
+#define FAN_LED_PORT0_ALL_BLUE  0xAA
+#define FAN_LED_PORT1_ALL_BLUE  0x55
+#define FAN_LED_PORT0_ALL_RED   0x55
+#define FAN_LED_PORT1_ALL_RED   0xAA
+#define PORT0_FAN_LED_RED_MASK  0x02
+#define PORT0_FAN_LED_BLUE_MASK	0x01
+#define PORT1_FAN_LED_RED_MASK  0x40
+#define PORT1_FAN_LED_BLUE_MASK	0x80
 int Fan_control_algorithm(void)
 {
 	sd_bus *bus = NULL;
 	sd_bus_error bus_error = SD_BUS_ERROR_NULL;
 	sd_bus_message *response = NULL;
-	int Ambient_reading = 0, rc = 0, i = 0;
-	int CPU0_core_temperature[12];
-	int CPU1_core_temperature[12];
-	int DIMM_temperature[32];
-	int HighestCPUtemp = 0;
-	int HighestDIMMtemp = 0;
-	int CPUnocore[2];
-	int fd = -1;
-	int FinalFanSpeed = 0;
-	int CPUtemp = 0;
+	int rc = 0, i = 0, fd = -1, offset = 0;
+	int CPU0_core_temperature[NUM_CPU_CORE], CPU1_core_temperature[NUM_CPU_CORE], HighestCPUtemp = 0;
+	int DIMM_temperature[NUM_DIMM], HighestDIMMtemp = 0;
+	int Ambient_reading = 0;
+	int Fan_tach[NUM_FAN], FinalFanSpeed = 255;
+	int Power_state = 0, fan_led_port0 = 0xFF, fan_led_port1 = 0xFF;
 	
 	do {
 		/* Connect to the user bus this time */
@@ -330,147 +312,209 @@ int Fan_control_algorithm(void)
 	} while (rc < 0);
 
 	while (1) {
-		CPUtemp = 0;
-		for(i=0; i<12; i++) {
-			rc = sd_bus_call_method(bus,                   // On the System Bus
-						gService,               // Service to contact
-						gCPU0ObjPath[i],            // Object path
-						gIntPath,              // Interface name
-						"getValue",          // Method to be called
-						&bus_error,                 // object to return error
-						&response,                  // Response message on success
-						NULL);                       // input message (string,byte)
-			if(rc < 0) {
-//				fprintf(stderr, "Failed to get CPU 0 temperature from dbus: %s\n", bus_error.message);
-				CPU0_core_temperature[i] = 0;
-			} else {
-				rc = sd_bus_message_read(response, "v","i", &CPU0_core_temperature[i]);
-				if (rc < 0 ) {
-					fprintf(stderr, "Failed to parse GetCpu0Temp response message:[%s]\n", strerror(-rc));
+		rc = sd_bus_call_method(bus,					// On the System Bus
+					gService_Power,				// Service to contact
+					gObjPath_Power,			 // Object path
+					gIntPath_Power,			   // Interface name
+					"getPowerState",			// Method to be called
+					&bus_error,				  // object to return error
+					&response,				  // Response message on success
+					NULL);					   // input message (string,byte)
+		if(rc < 0) {
+			fprintf(stderr, "Failed to get power state from dbus: %s\n", bus_error.message);
+			goto finish;
+		}
+
+		rc = sd_bus_message_read(response, "i", &Power_state);
+		if (rc < 0 ) {
+			fprintf(stderr, "Failed to parse GetPowerState response message:[%s]\n", strerror(-rc));
+			goto finish;
+		}
+		sd_bus_error_free(&bus_error);
+		response = sd_bus_message_unref(response);
+//		fprintf(stderr,"Power State = [%d]\n",Power_state);
+
+		if (Power_state == 1 ) {
+			for(i=0; i<NUM_CPU_CORE; i++) {
+				rc = sd_bus_call_method(bus,                   // On the System Bus
+							gService,               // Service to contact
+							gCPU0ObjPath[i],            // Object path
+							gIntPath,              // Interface name
+							"getValue",          // Method to be called
+							&bus_error,                 // object to return error
+							&response,                  // Response message on success
+							NULL);                       // input message (string,byte)
+				if(rc < 0) {
+//					fprintf(stderr, "Failed to get CPU 0 temperature from dbus: %s\n", bus_error.message);
 					CPU0_core_temperature[i] = 0;
+				} else {
+					rc = sd_bus_message_read(response, "v","i", &CPU0_core_temperature[i]);
+					if (rc < 0 ) {
+						fprintf(stderr, "Failed to parse GetCpu0Temp response message:[%s]\n", strerror(-rc));
+						CPU0_core_temperature[i] = 0;
+					}
 				}
+//				fprintf(stderr, "CPU0 core %d temperature is %d\n",i ,CPU0_core_temperature[i]);
+				if(CPU0_core_temperature[i] > HighestCPUtemp)
+					HighestCPUtemp = CPU0_core_temperature[i];
+
+				sd_bus_error_free(&bus_error);
+				response = sd_bus_message_unref(response);
 			}
-//			fprintf(stderr, "CPU0 core %d temperature is %d\n",i ,CPU0_core_temperature[i]);
-			if(CPU0_core_temperature[i] > HighestCPUtemp) {
-				HighestCPUtemp = CPU0_core_temperature[i];
-				CPUnocore[0] = 0;
-				CPUnocore[1] = i;
-			}
-			CPUtemp = CPUtemp + CPU0_core_temperature[i];
-			sd_bus_error_free(&bus_error);
-			response = sd_bus_message_unref(response);
-		}
 
-		for(i=0; i<12; i++) {
-			rc = sd_bus_call_method(bus,                   // On the System Bus
-						gService,               // Service to contact
-						gCPU1ObjPath[i],            // Object path
-						gIntPath,              // Interface name
-						"getValue",          // Method to be called
-						&bus_error,                 // object to return error
-						&response,                  // Response message on success
-						NULL);                       // input message (string,byte)
-			if(rc < 0) {
-//				fprintf(stderr, "Failed to get CPU 1 temperature from dbus: %s\n", bus_error.message);
-				CPU1_core_temperature[i] = 0;
-			} else {
-				rc = sd_bus_message_read(response, "v","i", &CPU1_core_temperature[i]);
-				if (rc < 0 ) {
-					fprintf(stderr, "Failed to parse GetCpu1Temp response message:[%s]\n", strerror(-rc));
+			for(i=0; i<NUM_CPU_CORE; i++) {
+				rc = sd_bus_call_method(bus,                   // On the System Bus
+							gService,               // Service to contact
+							gCPU1ObjPath[i],            // Object path
+							gIntPath,              // Interface name
+							"getValue",          // Method to be called
+							&bus_error,                 // object to return error
+							&response,                  // Response message on success
+							NULL);                       // input message (string,byte)
+				if(rc < 0) {
+//					fprintf(stderr, "Failed to get CPU 1 temperature from dbus: %s\n", bus_error.message);
 					CPU1_core_temperature[i] = 0;
+				} else {
+					rc = sd_bus_message_read(response, "v","i", &CPU1_core_temperature[i]);
+					if (rc < 0 ) {
+						fprintf(stderr, "Failed to parse GetCpu1Temp response message:[%s]\n", strerror(-rc));
+						CPU1_core_temperature[i] = 0;
+					}
 				}
+//				fprintf(stderr, "CPU1 core %d temperature is %d\n",i ,CPU1_core_temperature[i]);
+				if(CPU1_core_temperature[i] > HighestCPUtemp )
+					HighestCPUtemp = CPU1_core_temperature[i];
+
+				sd_bus_error_free(&bus_error);
+				response = sd_bus_message_unref(response);
 			}
-//			fprintf(stderr, "CPU1 core %d temperature is %d\n",i ,CPU1_core_temperature[i]);
-			if(CPU1_core_temperature[i] > HighestCPUtemp ) {
-				HighestCPUtemp = CPU1_core_temperature[i];
-				CPUnocore[0] = 1;
-				CPUnocore[1] = i;
-			}
-			sd_bus_error_free(&bus_error);
-			response = sd_bus_message_unref(response);
-		}
-//		fprintf(stderr, "Highest CPU temperature = [%d]\n", HighestCPUtemp);
-	
-		for(i=0; i<32; i++) {
+//			fprintf(stderr, "Highest CPU temperature = [%d]\n", HighestCPUtemp);
+
 			rc = sd_bus_call_method(bus,                   // On the System Bus
 						gService,               // Service to contact
-						gDIMMObjPath[i],            // Object path
+						gObjPath_Ambient,            // Object path
 						gIntPath,              // Interface name
 						"getValue",          // Method to be called
 						&bus_error,                 // object to return error
 						&response,                  // Response message on success
 						NULL);                       // input message (string,byte)
 			if(rc < 0) {
-//				fprintf(stderr, "Failed to get DIMM temperature from dbus: %s\n", bus_error.message);
-				DIMM_temperature[i] = 0;
+				fprintf(stderr, "Failed to get ambient temperature from dbus: %s\n", bus_error.message);
+				Ambient_reading = 0;
 			} else {
-				rc = sd_bus_message_read(response, "v","i", &DIMM_temperature[i]);
+				rc = sd_bus_message_read(response, "v","i", &Ambient_reading);
 				if (rc < 0 ) {
 					fprintf(stderr, "Failed to parse GetDimmTemp response message:[%s]\n", strerror(-rc));
-					DIMM_temperature[i] = 0;
+					Ambient_reading = 0;
 				}
 			}
-//			fprintf(stderr, "DIMM %d temperature is %d\n", i, DIMM_temperature[i]);
-			if(DIMM_temperature[i] > HighestDIMMtemp )
-				HighestDIMMtemp = DIMM_temperature[i];
 			sd_bus_error_free(&bus_error);
 			response = sd_bus_message_unref(response);
-		}
-//		fprintf(stderr, "Highest DIMM temperature = [%d]\n",HighestDIMMtemp);
-
-		rc = sd_bus_call_method(bus,                   // On the System Bus
-					gService,               // Service to contact
-					gObjPath_Ambient,            // Object path
-					gIntPath,              // Interface name
-					"getValue",          // Method to be called
-					&bus_error,                 // object to return error
-					&response,                  // Response message on success
-					NULL);                       // input message (string,byte)
-		if(rc < 0) {
-//			fprintf(stderr, "Failed to get ambient temperature from dbus: %s\n", bus_error.message);
-			Ambient_reading = 0;
-		} else {
-			rc = sd_bus_message_read(response, "v","i", &Ambient_reading);
-			if (rc < 0 ) {
-				fprintf(stderr, "Failed to parse GetDimmTemp response message:[%s]\n", strerror(-rc));
-				Ambient_reading = 0;
-			}
-		}
-		sd_bus_error_free(&bus_error);
-		response = sd_bus_message_unref(response);
-//		fprintf(stderr, "Highest ambient inlet temperature = [%d]\n", HighestCPUtemp);
+//			fprintf(stderr, "Highest ambient inlet temperature = [%d]\n", HighestCPUtemp);
+
+			if (HighestCPUtemp > 0 && Ambient_reading > 0) {
+				for(i=0; i<NUM_DIMM; i++) {
+					rc = sd_bus_call_method(bus,                   // On the System Bus
+								gService,               // Service to contact
+								gDIMMObjPath[i],            // Object path
+								gIntPath,              // Interface name
+								"getValue",          // Method to be called
+								&bus_error,                 // object to return error
+								&response,                  // Response message on success
+								NULL);                       // input message (string,byte)
+					if(rc < 0) {
+//						fprintf(stderr, "Failed to get DIMM temperature from dbus: %s\n", bus_error.message);
+						DIMM_temperature[i] = 0;
+					} else {
+						rc = sd_bus_message_read(response, "v","i", &DIMM_temperature[i]);
+						if (rc < 0 ) {
+							fprintf(stderr, "Failed to parse GetDimmTemp response message:[%s]\n", strerror(-rc));
+							DIMM_temperature[i] = 0;
+						}
+					}
+//					fprintf(stderr, "DIMM %d temperature is %d\n", i, DIMM_temperature[i]);
+					if(DIMM_temperature[i] > HighestDIMMtemp )
+						HighestDIMMtemp = DIMM_temperature[i];
+					sd_bus_error_free(&bus_error);
+					response = sd_bus_message_unref(response);
+				}
+//				fprintf(stderr, "Highest DIMM temperature = [%d]\n",HighestDIMMtemp);
 
-		if (CPUtemp == 0)	{
-			HighestCPUtemp = 0;
-			HighestDIMMtemp = 0;
-		}
+				CloseLoop(HighestCPUtemp,HighestDIMMtemp);
+				OpenLoop(Ambient_reading);
 
-		CloseLoop(HighestCPUtemp,HighestDIMMtemp);
-		OpenLoop(Ambient_reading);
+				if(Openloopspeed > Closeloopspeed)
+					g_fanspeed = Openloopspeed;
+				else
+					g_fanspeed = Closeloopspeed;
 
-		if(Openloopspeed > Closeloopspeed)
-			g_fanspeed = Openloopspeed;
-		else
-			g_fanspeed = Closeloopspeed;
-	
-		fd = i2c_open();
-		if (fd == -1) {
-			fprintf(stderr, "Fail to set FAN LED\n");
-		} else {
-			if(g_fanspeed > 30)
-				SetFanLed(fd,1);
-			else
-				SetFanLed(fd,2);
-			close(fd);
-		}
+				FinalFanSpeed = g_fanspeed * 255;
+				FinalFanSpeed = FinalFanSpeed / 100;
 
-		FinalFanSpeed = g_fanspeed * 255;
-		FinalFanSpeed = FinalFanSpeed / 100;
+				if(g_fanspeed > 30) {
+					fan_led_port0 = FAN_LED_PORT0_ALL_BLUE;
+					fan_led_port1 = FAN_LED_PORT1_ALL_BLUE;
+				} else {
+					fan_led_port0 = FAN_LED_PORT0_ALL_RED;
+					fan_led_port1 = FAN_LED_PORT1_ALL_RED;
+				}
+			} else {//HighestCPUtemp == 0 || Ambient_reading == 0
+				FinalFanSpeed = 255;
+				fan_led_port0 = FAN_LED_PORT0_ALL_BLUE;
+				fan_led_port1 = FAN_LED_PORT1_ALL_BLUE;
+			}
 
-		if(HighestCPUtemp == 0) //OCC sensor does not enable
+//			fprintf(stderr,"fan_led compute: port0=%02X,port1=%02X\n",fan_led_port0,fan_led_port1);
+			for(i=0;i<NUM_FAN;i++) {
+				rc = sd_bus_call_method(bus,                               // On the System Bus
+							gService,                               // Service to contact
+							fanInObjPath[i],                        // Object path
+							gIntPath,                          // Interface name
+							"getValue",              // Method to be called
+							&bus_error,                             // object to return error
+							&response,                                      // Response message on success
+							NULL);                                           // input message (string,byte)
+				if(rc < 0) {
+					fprintf(stderr, "Failed to get fan tach from dbus: %s\n", bus_error.message);
+					Fan_tach[i] = 0;
+				} else {
+					rc = sd_bus_message_read(response, "v","i", &Fan_tach[i]);
+					if (rc < 0 ) {
+						fprintf(stderr, "Failed to parse GetFanTach response message:[%s]\n", strerror(-rc));
+						Fan_tach[i] = 0;
+					}
+				}
+				sd_bus_error_free(&bus_error);
+				response = sd_bus_message_unref(response);
+
+				if (Fan_tach[i] == 0) {
+					FinalFanSpeed = 255;
+					if (i <= 3) { //FAN 1 & 2
+						offset = i / 2 * 2;
+						fan_led_port1 &= ~(PORT1_FAN_LED_RED_MASK >> offset); //turn on red led
+						fan_led_port1 |= PORT1_FAN_LED_BLUE_MASK >> offset; //turn off blue led
+//						fprintf(stderr,"i=%d,offset=%d,fan_led_port1=%02X\n",i,offset,fan_led_port1);
+					} else { //FAN 3~6
+						offset = (i - 4) / 2 * 2;
+						fan_led_port0 &= ~(PORT0_FAN_LED_RED_MASK << offset); //turn on red led
+						fan_led_port0 |= PORT0_FAN_LED_BLUE_MASK << offset; //turn off blue led
+//						fprintf(stderr,"i=%d,offset=%d,fan_led_port0=%02X\n",i,offset,fan_led_port0);
+					}
+				}
+			}
+		} else {//Power_state == 0
 			FinalFanSpeed = 255;
+			fan_led_port0 = FAN_LED_OFF;
+			fan_led_port1 = FAN_LED_OFF;
+		}
+
+		fd = i2c_open(6);
+		if (fd != -1) {
+			SetFanLed(fd,fan_led_port0,fan_led_port1);
+			close(fd);
+		}
 
-		for(i=0; i<6; i++) {
+		for(i=0; i<NUM_PWM; i++) {
 			rc = sd_bus_call_method(bus,				   // On the System Bus
 						gService,			   // Service to contact
 						fanObjPath[i],			// Object path
@@ -490,6 +534,9 @@ finish:
 		sd_bus_error_free(&bus_error);
 		response = sd_bus_message_unref(response);
 		sd_bus_flush(bus);
+		HighestCPUtemp = 0;
+		HighestDIMMtemp = 0;
+		Ambient_reading = 0;
 		sleep(1);
 	}
 	bus = sd_bus_flush_close_unref(bus);
-- 
2.8.1
