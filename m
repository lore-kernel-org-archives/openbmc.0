Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3HFL3YMRzDqCD
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 19:31:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462786275807133.69753924052816;
 Mon, 9 May 2016 02:31:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v7 15/21] Fix memory leak
Date: Mon,  9 May 2016 04:30:48 -0500
Message-Id: <1462786254-18000-16-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462786254-18000-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 09:31:19 -0000

From: johnhcwang <hsienchiang@gmail.com>

1. Multi-processes if we call fan_algorithm.py every HOST_POWERED state
2. Occupy the memory if we don't unref sdbus message
---
 bin/Barreleye.py        |   2 +-
 objects/fan_algorithm.c | 615 ++++++++++++++++++++++--------------------------
 objects/info.c          | 558 +++++++++++++++++++++----------------------
 3 files changed, 542 insertions(+), 633 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 6e8a8a4..e05d985 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -212,7 +212,7 @@ APPS = {
                 'process_name'    : 'info',
         },
     'fan_algorithm' : {
-                'system_state'    : 'HOST_POWERED_ON',
+                'system_state'    : 'BMC_READY',
                 'start_process'   : True,
                 'monitor_process' : True,
                 'process_name'    : 'fan_algorithm',
diff --git a/objects/fan_algorithm.c b/objects/fan_algorithm.c
index 477b7cb..1077d55 100755
--- a/objects/fan_algorithm.c
+++ b/objects/fan_algorithm.c
@@ -92,7 +92,6 @@ const char *gIntPath = "org.openbmc.SensorValue";
 
 
 char *gMessage = NULL;
-sd_bus *bus = NULL;
 
 #define MAX_BYTES 255
 
@@ -126,73 +125,72 @@ int Openloopspeed = 0;
 int Closeloopspeed = 0;
 int Finalfanspeed = 0;
 
-static int i2c_open() {
-  int fd;
-  char fn[32];
-  int rc;
-
-  g_bus = 6;
-  snprintf(fn, sizeof(fn), "/dev/i2c-%d", g_bus);
-  fd = open(fn, O_RDWR);
-  if (fd == -1) {
-    LOG_ERR(errno, "Failed to open i2c device %s", fn);
-	close(fd);
-    return -1;
-  }
-  return fd;
+static int i2c_open()
+{
+	int rc = 0, fd = -1;
+	char fn[32];
+
+	g_bus = 6;
+	snprintf(fn, sizeof(fn), "/dev/i2c-%d", g_bus);
+	fd = open(fn, O_RDWR);
+	if (fd == -1) {
+		LOG_ERR(errno, "Failed to open i2c device %s", fn);
+		close(fd);
+		return -1;
+	}
+	return fd;
 }
 
-static int SetFanLed(int fd,int color) {
-  struct i2c_rdwr_ioctl_data data;
-  struct i2c_msg msg[2];
-  int n_msg = 0;
-  int rc;
-
-  memset(&msg, 0, sizeof(msg));
-
-  g_slave_addr = 0x20;
-  g_use_pec = 0;
-  g_n_write = 2;
-
-  if(color==1) //blue light
-  {
-  g_write_bytes[0] = 0x03;
-  g_write_bytes[1] = 0x55;
-  g_write_color_bytes[0] = 0x02;
-  g_write_color_bytes[1] = 0xaa;
-  }
-    else //red light
-	{
-    g_write_bytes[0] = 0x03;
-   	g_write_bytes[1] = 0xaa;
-    g_write_color_bytes[0] = 0x02;
-    g_write_color_bytes[1] = 0x55;
-  	}
+static int SetFanLed(int fd,int color)
+{
+	struct i2c_rdwr_ioctl_data data;
+	struct i2c_msg msg[2];
+	int rc = 0, n_msg = 0;
+
+	memset(&msg, 0, sizeof(msg));
+
+	g_slave_addr = 0x20;
+	g_use_pec = 0;
+	g_n_write = 2;
+
+	if(color == 1) {
+		//blue light
+		g_write_bytes[0] = 0x03;
+		g_write_bytes[1] = 0x55;
+		g_write_color_bytes[0] = 0x02;
+		g_write_color_bytes[1] = 0xaa;
+	} else {
+		//red light
+		g_write_bytes[0] = 0x03;
+		g_write_bytes[1] = 0xaa;
+		g_write_color_bytes[0] = 0x02;
+		g_write_color_bytes[1] = 0x55;
+	}
   
-  if (1) {
-    msg[n_msg].addr = g_slave_addr;
-    msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
-    msg[n_msg].len = g_n_write;
-    msg[n_msg].buf = g_write_bytes;
-    n_msg++;
-  }
-  if (1) {
-	  msg[n_msg].addr = g_slave_addr;
-	  msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
-	  msg[n_msg].len = g_n_write;
-	  msg[n_msg].buf = g_write_color_bytes;
-	  n_msg++;
-  }
-  data.msgs = msg;
-  data.nmsgs = n_msg;
-  rc = ioctl(fd, I2C_RDWR, &data);
-  if (rc < 0) {
-    LOG_ERR(errno, "Failed to do raw io");
-	close(fd);
-    return -1;
-  }
-
-  return 0;
+	if (1) {
+		msg[n_msg].addr = g_slave_addr;
+		msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
+		msg[n_msg].len = g_n_write;
+		msg[n_msg].buf = g_write_bytes;
+		n_msg++;
+	}
+	 if (1) {
+		msg[n_msg].addr = g_slave_addr;
+		msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
+		msg[n_msg].len = g_n_write;
+		msg[n_msg].buf = g_write_color_bytes;
+		n_msg++;
+	}
+	data.msgs = msg;
+	data.nmsgs = n_msg;
+	rc = ioctl(fd, I2C_RDWR, &data);
+	if (rc < 0) {
+		LOG_ERR(errno, "Failed to do raw io");
+		close(fd);
+		return -1;
+	}
+
+	return 0;
 }
 
 
@@ -218,76 +216,63 @@ int CloseLoop (int cpureading,int dimmreading)
 	static int DIMM_differential_error = 0;
 	static int DIMM_last_error = 0;
 		
-//CPU closeloop
-CPU_tracking_error = cpureading - g_CPUVariable;
-Interal_CPU_Err[intergral_i]=CPU_tracking_error;
-CPU_integral_error = 0;
-for(i=0;i<g_Sampling_N;i++)
-{
-	CPU_integral_error += Interal_CPU_Err[i] ;
-}			
+	//CPU closeloop
+	CPU_tracking_error = cpureading - g_CPUVariable;
+	Interal_CPU_Err[intergral_i] = CPU_tracking_error;
+	CPU_integral_error = 0;
 
-CPU_differential_error = CPU_tracking_error - CPU_last_error;			
-CPU_PID_value = g_Kp * CPU_tracking_error +  g_Ki * CPU_integral_error + g_Kd * CPU_differential_error;
+	for(i=0;i<g_Sampling_N;i++)
+		CPU_integral_error += Interal_CPU_Err[i] ;
 
-CPU_PWM_speed= CPU_PID_value + g_fanspeed;
-if(CPU_PWM_speed > 100)
-{
-	CPU_PWM_speed = 100;
-}
-if(CPU_PWM_speed < 0)
-{
-	CPU_PWM_speed = 0;
-}
+	CPU_differential_error = CPU_tracking_error - CPU_last_error;
+	CPU_PID_value = g_Kp * CPU_tracking_error +  g_Ki * CPU_integral_error + g_Kd * CPU_differential_error;
+	CPU_PWM_speed = CPU_PID_value + g_fanspeed;
 
-CPU_last_error = CPU_tracking_error;
+	if(CPU_PWM_speed > 100)
+		CPU_PWM_speed = 100;
 
+	if(CPU_PWM_speed < 0)
+		CPU_PWM_speed = 0;
 
-//DIMM closeloop
+	CPU_last_error = CPU_tracking_error;
 
+	//DIMM closeloop
 	DIMM_tracking_error = dimmreading - g_DIMMVariable;
-		Interal_DIMM_Err[intergral_i]=DIMM_tracking_error;
-		intergral_i++;		
-		DIMM_integral_error = 0;
-		for(i=0;i<g_Sampling_N;i++)
-		{
-			DIMM_integral_error += Interal_DIMM_Err[i] ;
-		}	
-		if(intergral_i == g_Sampling_N)
-			intergral_i = 0;
+	Interal_DIMM_Err[intergral_i] = DIMM_tracking_error;
+	intergral_i++;
+	DIMM_integral_error = 0;
+
+	for(i=0;i<g_Sampling_N;i++)
+		DIMM_integral_error += Interal_DIMM_Err[i] ;
+
+	if(intergral_i == g_Sampling_N)
+		intergral_i = 0;
 		
 
     	DIMM_differential_error = DIMM_tracking_error - DIMM_last_error;			
-		DIMM_PID_value = g_Kp * DIMM_tracking_error +  g_Ki * DIMM_integral_error + g_Kd * DIMM_differential_error;		
-		DIMM_PWM_speed = DIMM_PID_value + g_fanspeed;
+	DIMM_PID_value = g_Kp * DIMM_tracking_error +  g_Ki * DIMM_integral_error + g_Kd * DIMM_differential_error;
+	DIMM_PWM_speed = DIMM_PID_value + g_fanspeed;
 
-		if(DIMM_PWM_speed > 100)
-		{
-			DIMM_PWM_speed = 100;
-		}
-		if(DIMM_PWM_speed < 0)
-		{
-			DIMM_PWM_speed = 0;
-		}
+	if(DIMM_PWM_speed > 100)
+		DIMM_PWM_speed = 100;
+
+	if(DIMM_PWM_speed < 0)
+		DIMM_PWM_speed = 0;
 	
 		DIMM_last_error = DIMM_tracking_error;
 
-	if (DIMM_PWM_speed>CPU_PWM_speed)
-		Closeloopspeed=DIMM_PWM_speed;
+	if (DIMM_PWM_speed > CPU_PWM_speed)
+		Closeloopspeed = DIMM_PWM_speed;
 	else
-		Closeloopspeed=CPU_PWM_speed;
+		Closeloopspeed = CPU_PWM_speed;
 
 	if(intergral_i == g_Sampling_N)
 		intergral_i = 0;
-
-
 }
 
 
 int OpenLoop (int sensorreading)
 {
-
-
 	int speed = 0;
 	float paramA= 0;
 	float paramB= 2; 
@@ -295,268 +280,220 @@ int OpenLoop (int sensorreading)
 	int Low_Amb = 20;
 	int Up_Amb = 40;
 	
-    if (sensorreading >= Up_Amb)
-    {
-    	speed = 100;
-		//printf("## Ambient >=%dC, the Fan duty is %d \n",Up_Amb,speed);	
-    }
-	else if (sensorreading <= Low_Amb)
-    {
-    	speed = 40;
-		//printf("## Ambient <=%dC, the Fan duty is %d \n",Low_Amb,speed);	
-    }
-	else
-	{
+	if (sensorreading >= Up_Amb) {
+		speed = 100;
+//		printf("## Ambient >=%dC, the Fan duty is %d \n",Up_Amb,speed);
+	} else if (sensorreading <= Low_Amb) {
+		speed = 40;
+//		printf("## Ambient <=%dC, the Fan duty is %d \n",Low_Amb,speed);
+	} else {
 		speed = ( paramA * sensorreading * sensorreading ) + ( paramB * sensorreading ) + paramC;
+
 		if(speed > 100)
-		{
 			speed = 100;
-		}	
+
 		if(speed < 40)
-		{
 			speed = 40;
-		}
-	//	printf("The Fan duty is %d \n",speed);
-
+//		printf("The Fan duty is %d \n",speed);
 	}
 
-	Openloopspeed=speed;
+	Openloopspeed = speed;
 
-return 0;
+	return 0;
 }
 
 
-
-
-int Fan_control_algorithm(void) {
-
-	sd_bus *bus;
-	sd_bus_slot *slot;
-	int r, Ambient_reading, rc,retry,i;
+int Fan_control_algorithm(void)
+{
+	sd_bus *bus = NULL;
+	sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+	sd_bus_message *response = NULL;
+	int Ambient_reading = 0, rc = 0, i = 0;
 	int CPU0_core_temperature[12];
 	int CPU1_core_temperature[12];
 	int DIMM_temperature[32];
 	int HighestCPUtemp = 0;
 	int HighestDIMMtemp = 0;
 	int CPUnocore[2];
-	int fd;
+	int fd = -1;
 	int FinalFanSpeed = 0;
-	int CPUtemp=0;
-	
-	r = -1;
-	while(r < 0) {
-	/* Connect to the user bus this time */
-	r = sd_bus_open_system(&bus);
-		if(r < 0){	
-			fprintf(stderr, "fan 1 Failed to connect to system bus: %s\n", strerror(-r));
-		sleep(1);
-			}
+	int CPUtemp = 0;
 	
+	do {
+		/* Connect to the user bus this time */
+		rc = sd_bus_open_system(&bus);
+		if(rc < 0) {
+			fprintf(stderr, "fan 1 Failed to connect to system bus: %s\n", strerror(-rc));
+			bus = sd_bus_flush_close_unref(bus);
+			sleep(1);
 		}
-	// SD Bus error report mechanism.
-	sd_bus_error bus_error = SD_BUS_ERROR_NULL;
-	sd_bus_message *response = NULL, *m = NULL;;
-    sd_bus_error_free(&bus_error);
-    sd_bus_message_unref(response);
-
-
-while(1){
-  	fd = i2c_open();
-	CPUtemp=0;
-	for(i=0;i<12;i++){
-       sd_bus_error_free(&bus_error);
-
-        rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService,               // Service to contact
-                                gCPU0ObjPath[i],            // Object path
-                                gIntPath,              // Interface name
-                                "getValue",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-
-        if(rc < 0)
-        {
-            //fprintf(stderr, "gCPU0ObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
-           // goto finish;
-           CPU0_core_temperature[i]=0;
-        }
-		else
-		{
-			rc = sd_bus_message_read(response, "v","i", &CPU0_core_temperature[i]);
-			if (rc < 0 )
-			{ 
-         	 // fprintf(stderr, "gCPU0ObjPath Failed to parse response message:[%s]\n", strerror(-rc));
-          // goto finish;
+	} while (rc < 0);
+
+	while (1) {
+		CPUtemp = 0;
+		for(i=0; i<12; i++) {
+			rc = sd_bus_call_method(bus,                   // On the System Bus
+						gService,               // Service to contact
+						gCPU0ObjPath[i],            // Object path
+						gIntPath,              // Interface name
+						"getValue",          // Method to be called
+						&bus_error,                 // object to return error
+						&response,                  // Response message on success
+						NULL);                       // input message (string,byte)
+			if(rc < 0) {
+//				fprintf(stderr, "gCPU0ObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+				CPU0_core_temperature[i] = 0;
+			} else {
+				rc = sd_bus_message_read(response, "v","i", &CPU0_core_temperature[i]);
+				if (rc < 0 ) {
+					fprintf(stderr, "gCPU0ObjPath Failed to parse response message:[%s]\n", strerror(-rc));
+					CPU0_core_temperature[i] = 0;
+				}
 			}
+//			fprintf(stderr, "CPU0 core %d temperature is %d\n",i ,CPU0_core_temperature[i]);
+			if(CPU0_core_temperature[i] > HighestCPUtemp) {
+				HighestCPUtemp = CPU0_core_temperature[i];
+				CPUnocore[0] = 0;
+				CPUnocore[1] = i;
+			}
+			CPUtemp = CPUtemp + CPU0_core_temperature[i];
+			sd_bus_error_free(&bus_error);
+			response = sd_bus_message_unref(response);
 		}
-	//printf("CPU0 core %d value=[%d] \n",i,CPU0_core_temperature[i]);
-	if(CPU0_core_temperature[i] > HighestCPUtemp )
-		{
-		HighestCPUtemp = CPU0_core_temperature[i];
-		CPUnocore[0]=0;
-		CPUnocore[1]=i;
-		}
-	CPUtemp=CPUtemp+CPU0_core_temperature[i];
-	}
-	
-	for(i=0;i<12;i++){
-       sd_bus_error_free(&bus_error);
-
-        rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService,               // Service to contact
-                                gCPU1ObjPath[i],            // Object path
-                                gIntPath,              // Interface name
-                                "getValue",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-
-        if(rc < 0)
-        {
-            //fprintf(stderr, "gCPU1ObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
-			CPU1_core_temperature[i]=0;
-			//goto finish;
-        }
-		else
-		{
-		rc = sd_bus_message_read(response, "v","i", &CPU1_core_temperature[i]);
-
-		}
-
 
-		if(CPU1_core_temperature[i] > HighestCPUtemp )
-		{
-		HighestCPUtemp = CPU1_core_temperature[i];
-		CPUnocore[0]=1;
-		CPUnocore[1]=i;
+		for(i=0; i<12; i++) {
+			rc = sd_bus_call_method(bus,                   // On the System Bus
+						gService,               // Service to contact
+						gCPU1ObjPath[i],            // Object path
+						gIntPath,              // Interface name
+						"getValue",          // Method to be called
+						&bus_error,                 // object to return error
+						&response,                  // Response message on success
+						NULL);                       // input message (string,byte)
+			if(rc < 0) {
+//				fprintf(stderr, "gCPU1ObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+				CPU1_core_temperature[i] = 0;
+			} else {
+				rc = sd_bus_message_read(response, "v","i", &CPU1_core_temperature[i]);
+				if (rc < 0 ) {
+					fprintf(stderr, "gCPU1ObjPath Failed to parse response message:[%s]\n", strerror(-rc));
+					CPU1_core_temperature[i] = 0;
+				}
+			}
+//			fprintf(stderr, "CPU1 core %d temperature is %d\n",i ,CPU1_core_temperature[i]);
+			if(CPU1_core_temperature[i] > HighestCPUtemp ) {
+				HighestCPUtemp = CPU1_core_temperature[i];
+				CPUnocore[0] = 1;
+				CPUnocore[1] = i;
+			}
+			sd_bus_error_free(&bus_error);
+			response = sd_bus_message_unref(response);
 		}
-
-	}
-
+//		fprintf(stderr, "Highest CPU temperature = [%d]\n", HighestCPUtemp);
 	
-	for(i=0;i<32;i++){
-       sd_bus_error_free(&bus_error);
-
-        rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService,               // Service to contact
-                                gDIMMObjPath[i],            // Object path
-                                gIntPath,              // Interface name
-                                "getValue",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-
-        if(rc < 0)
-        {
-  
-            DIMM_temperature[i]=0;
-        }
-		else
-		{
-		rc = sd_bus_message_read(response, "v","i", &DIMM_temperature[i]);
-
-			if (rc < 0 )
-			{ 
-         	  fprintf(stderr, "gDIMMObjPath Failed to parse response message:[%s]\n", strerror(-rc));
-      
+		for(i=0; i<32; i++) {
+			rc = sd_bus_call_method(bus,                   // On the System Bus
+						gService,               // Service to contact
+						gDIMMObjPath[i],            // Object path
+						gIntPath,              // Interface name
+						"getValue",          // Method to be called
+						&bus_error,                 // object to return error
+						&response,                  // Response message on success
+						NULL);                       // input message (string,byte)
+			if(rc < 0) {
+//				fprintf(stderr, "gDIMMObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+				DIMM_temperature[i] = 0;
+			} else {
+				rc = sd_bus_message_read(response, "v","i", &DIMM_temperature[i]);
+				if (rc < 0 ) {
+					fprintf(stderr, "gDIMMObjPath Failed to parse response message:[%s]\n", strerror(-rc));
+					DIMM_temperature[i] = 0;
+				}
 			}
-
+//			fprintf(stderr, "DIMM %d temperature is %d\n", i, DIMM_temperature[i]);
+			if(DIMM_temperature[i] > HighestDIMMtemp )
+				HighestDIMMtemp = DIMM_temperature[i];
+			sd_bus_error_free(&bus_error);
+			response = sd_bus_message_unref(response);
 		}
+//		fprintf(stderr, "Highest DIMM temperature = [%d]\n",HighestDIMMtemp);
+
+		rc = sd_bus_call_method(bus,                   // On the System Bus
+					gService,               // Service to contact
+					gObjPath_Ambient,            // Object path
+					gIntPath,              // Interface name
+					"getValue",          // Method to be called
+					&bus_error,                 // object to return error
+					&response,                  // Response message on success
+					NULL);                       // input message (string,byte)
+		if(rc < 0) {
+//			fprintf(stderr, "fan2 Failed to resolve fruid to dbus: %s\n", bus_error.message);
+			Ambient_reading = 0;
+		} else {
+			rc = sd_bus_message_read(response, "v","i", &Ambient_reading);
+			if (rc < 0 ) {
+				fprintf(stderr, "fan3 Failed to parse response message:[%s]\n", strerror(-rc));
+				Ambient_reading = 0;
+			}
+		}
+		sd_bus_error_free(&bus_error);
+		response = sd_bus_message_unref(response);
+//		fprintf(stderr, "Highest ambient inlet temperature = [%d]\n", HighestCPUtemp);
 
-	if(DIMM_temperature[i] > HighestDIMMtemp )
-		HighestDIMMtemp = DIMM_temperature[i];
-	}
-	printf("Highest DIMM temperatur is value %d \n",HighestDIMMtemp);
-
-
-
-	sd_bus_error_free(&bus_error);
-     rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService,               // Service to contact
-                                gObjPath_Ambient,            // Object path
-                                gIntPath,              // Interface name
-                                "getValue",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-                                // NULL);                  // First argument to getObjectFromId
-                                //"BOARD_1");             // Second Argument
-
-        if(rc < 0)
-        {
-            fprintf(stderr, "fan2 Failed to resolve fruid to dbus: %s\n", bus_error.message);
-       
-        }
-
-	rc = sd_bus_message_read(response, "v","i", &Ambient_reading);
-	if (rc < 0 )
-	{ 
-           fprintf(stderr, "fan3 Failed to parse response message:[%s]\n", strerror(-rc));
-  
-	}
-
-	  if (CPUtemp==0)
-	  	{
-		HighestCPUtemp=0;
-		HighestDIMMtemp=0;
-	  	}
-
-	CloseLoop(HighestCPUtemp,HighestDIMMtemp);
-	OpenLoop(Ambient_reading);
+		if (CPUtemp == 0)	{
+			HighestCPUtemp = 0;
+			HighestDIMMtemp = 0;
+		}
 
-	
+		CloseLoop(HighestCPUtemp,HighestDIMMtemp);
+		OpenLoop(Ambient_reading);
 
-		if(Openloopspeed>Closeloopspeed)
-		g_fanspeed=Openloopspeed;
+		if(Openloopspeed > Closeloopspeed)
+			g_fanspeed = Openloopspeed;
 		else
-		g_fanspeed=Closeloopspeed;
+			g_fanspeed = Closeloopspeed;
 	
-	if(g_fanspeed>30) 
-		SetFanLed(fd,1);
-	else
-		SetFanLed(fd,2);
-
-	FinalFanSpeed=g_fanspeed*255;
-	FinalFanSpeed=FinalFanSpeed/100;
-
-	if(HighestCPUtemp==0) //OCC sensor does not enable
-	{
-	FinalFanSpeed=255;
-	}
-
+		fd = i2c_open();
+		if (fd == -1) {
+			fprintf(stderr, "Fail to set FAN LED\n");
+		} else {
+			if(g_fanspeed > 30)
+				SetFanLed(fd,1);
+			else
+				SetFanLed(fd,2);
+			close(fd);
+		}
 
- 	for(i=0;i<6;i++){
-		
-		sd_bus_error_free(&bus_error);
-	rc = sd_bus_call_method(bus,				   // On the System Bus
-							   gService,			   // Service to contact
-							   fanObjPath[i],			// Object path
-							   gIntPath,			  // Interface name
-							   "setValue",			// Method to be called
-							   &bus_error,				   // object to return error
-							   &response,				   // Response message on success
-							   "i",						// input message (string,byte)
-							   FinalFanSpeed);                  // First argument
-
-	  if(rc < 0)
-        {
-            fprintf(stderr, "fanObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
-          //  goto finish;
-        }
-
-
- 	}
-
-	close(fd);
-	sleep(1);
+		FinalFanSpeed = g_fanspeed * 255;
+		FinalFanSpeed = FinalFanSpeed / 100;
+
+		if(HighestCPUtemp == 0) //OCC sensor does not enable
+			FinalFanSpeed = 255;
+
+		for(i=0; i<6; i++) {
+			rc = sd_bus_call_method(bus,				   // On the System Bus
+						gService,			   // Service to contact
+						fanObjPath[i],			// Object path
+						gIntPath,			  // Interface name
+						"setValue",			// Method to be called
+						&bus_error,				   // object to return error
+						&response,				   // Response message on success
+						"i",						// input message (string,byte)
+						FinalFanSpeed);                  // First argument
+			if(rc < 0)
+				fprintf(stderr, "fanObjPath Failed to resolve fruid to dbus: %s\n", bus_error.message);
+			sd_bus_error_free(&bus_error);
+			response = sd_bus_message_unref(response);
+		}
 	
-
-	finish:
-		sd_bus_unref(bus);
+finish:
+		sd_bus_error_free(&bus_error);
+		response = sd_bus_message_unref(response);
+		sd_bus_flush(bus);
 		sleep(1);
-}
-	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+	}
+	bus = sd_bus_flush_close_unref(bus);
+	return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
 
 
diff --git a/objects/info.c b/objects/info.c
index d872c3f..2b98dbb 100644
--- a/objects/info.c
+++ b/objects/info.c
@@ -17,7 +17,6 @@ const char *gIntPath_c = "org.openbmc.control.Chassis";
 //const char *chassis_iface = "org.openbmc.SensorValue";
 
 char *gMessage = NULL;
-sd_bus *bus = NULL;
 
 #define MAX_BYTES 255
 
@@ -32,323 +31,296 @@ uint8_t g_read_tmp[MAX_BYTES];
 uint8_t g_bus = -1;
 uint8_t g_slave_addr = 0xff;
 
-static int i2c_open() {
-  int fd;
-  char fn[32];
-  int rc;
-
-  g_bus = 6;
-  snprintf(fn, sizeof(fn), "/dev/i2c-%d", g_bus);
-  fd = open(fn, O_RDWR);
-  if (fd == -1) {
-    LOG_ERR(errno, "Failed to open i2c device %s", fn);
-    close(fd);
-    return -1;
-  }
-
-  g_slave_addr = 0x4f;
-  rc = ioctl(fd, I2C_SLAVE, g_slave_addr);
-  if (rc < 0) {
-    LOG_ERR(errno, "Failed to open slave @ address 0x%x", g_slave_addr);
-    close(fd);
-  }
-
-  return fd;
+static int i2c_open()
+{
+	int rc = 0, fd = -1;
+	char fn[32];
+
+	g_bus = 6;
+	snprintf(fn, sizeof(fn), "/dev/i2c-%d", g_bus);
+	fd = open(fn, O_RDWR);
+	if (fd == -1) {
+		LOG_ERR(errno, "Failed to open i2c device %s", fn);
+		close(fd);
+		return -1;
+	}
+
+	g_slave_addr = 0x4f;
+
+	rc = ioctl(fd, I2C_SLAVE, g_slave_addr);
+	if (rc < 0) {
+		LOG_ERR(errno, "Failed to open slave @ address 0x%x", g_slave_addr);
+		close(fd);
+	}
+
+	return fd;
 }
 
 static int i2c_io(int fd) {
-  struct i2c_rdwr_ioctl_data data;
-  struct i2c_msg msg[2];
-  int n_msg = 0;
-  int rc;
-
-  memset(&msg, 0, sizeof(msg));
-
-  g_slave_addr = 0x5f;
-  g_use_pec = 0;
-  g_n_write = 3;
-  g_write_bytes[0] = 0xfc;
-  g_write_bytes[1] = 0x3;
-  g_write_bytes[2] = 0x0;
-  
-
-  g_n_read = 5;
-  
-
-  if (1) {
-    msg[n_msg].addr = g_slave_addr;
-    msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
-    msg[n_msg].len = g_n_write;
-    msg[n_msg].buf = g_write_bytes;
-    n_msg++;
-  }
-
-  if (1) {
-    msg[n_msg].addr = g_slave_addr;
-    msg[n_msg].flags = I2C_M_RD
-      | ((g_use_pec) ? I2C_CLIENT_PEC : 0)
-      | ((g_n_read == 0) ? I2C_M_RECV_LEN : 0);
-    /*
-     * In case of g_n_read is 0, block length will be added by
-     * the underlying bus driver.
-     */
-    msg[n_msg].len = (g_n_read) ? g_n_read : 256;
-    msg[n_msg].buf = g_read_bytes;
-    if (g_n_read == 0) {
-      /* If we're using variable length block reads, we have to set the
-       * first byte of the buffer to at least one or the kernel complains.
-       */
-      g_read_bytes[0] = 1;
-    }
-    n_msg++;
-  }
-
-  data.msgs = msg;
-  data.nmsgs = n_msg;
-
-  rc = ioctl(fd, I2C_RDWR, &data);
-  if (rc < 0) {
-    LOG_ERR(errno, "Failed to do raw io");
-    close(fd);
-    return -1;
-  }
-
-  return 0;
+	struct i2c_rdwr_ioctl_data data;
+	  struct i2c_msg msg[2];
+	int rc = 0, n_msg = 0;
+
+	memset(&msg, 0, sizeof(msg));
+
+	g_slave_addr = 0x5f;
+	g_use_pec = 0;
+	g_n_write = 3;
+	g_write_bytes[0] = 0xfc;
+	g_write_bytes[1] = 0x3;
+	g_write_bytes[2] = 0x0;
+	g_n_read = 5;
+
+	if (1) {
+		msg[n_msg].addr = g_slave_addr;
+		msg[n_msg].flags = (g_use_pec) ? I2C_CLIENT_PEC : 0;
+		msg[n_msg].len = g_n_write;
+		msg[n_msg].buf = g_write_bytes;
+		n_msg++;
+	}
+
+	if (1) {
+		msg[n_msg].addr = g_slave_addr;
+		msg[n_msg].flags = I2C_M_RD | ((g_use_pec) ? I2C_CLIENT_PEC : 0)
+					| ((g_n_read == 0) ? I2C_M_RECV_LEN : 0);
+		/*
+		* In case of g_n_read is 0, block length will be added by
+		* the underlying bus driver.
+		*/
+		msg[n_msg].len = (g_n_read) ? g_n_read : 256;
+		msg[n_msg].buf = g_read_bytes;
+		if (g_n_read == 0) {
+			/* If we're using variable length block reads, we have to set the
+			* first byte of the buffer to at least one or the kernel complains.
+			*/
+			g_read_bytes[0] = 1;
+		}
+		n_msg++;
+	  }
+
+	data.msgs = msg;
+	data.nmsgs = n_msg;
+
+	rc = ioctl(fd, I2C_RDWR, &data);
+	if (rc < 0) {
+		LOG_ERR(errno, "Failed to do raw io");
+		close(fd);
+		return -1;
+	}
+
+	return 0;
 }
 
 int get_hdd_status(void)
 {
-  int fd, i;
-  char *test;
-  test="Ken";
-  char str[10];
-  fd = i2c_open();
-  if (fd < 0) {
-    return -1;
-  }
-
-  if (i2c_io(fd) < 0) {
-    close(fd);
-    return -1;
-  }
-
-    //printf("Received:\n ");
-    if (g_n_read == 0) {
-      g_n_read = g_read_bytes[0] + 1;
-    }
-    for (i = 0; i < g_n_read; i++) {
-      //printf(" 0x%x", g_read_bytes[i]);
-    }
-    if ((g_read_tmp[2]!=g_read_bytes[2])||(g_read_tmp[3]!=g_read_bytes[3]))
-    {
-    sprintf(str, "HDD change:0x%x,0x%x", g_read_bytes[2], g_read_bytes[3]);
-   
-	send_esel_to_dbus(str, "Low", "assoc", "hack", 3);
-    }
-
-    g_read_tmp[2]=g_read_bytes[2];
-    g_read_tmp[3]=g_read_bytes[3];
-    close(fd);
-}
+	int fd = -1, i = 0;
+	char *test = NULL;
+	test = "Ken";
+	char str[10];
+
+	fd = i2c_open();
+	if (fd < 0)
+		return -1;
+
+	if (i2c_io(fd) < 0) {
+		close(fd);
+		return -1;
+	}
 
-int send_esel_to_dbus(const char *desc, const char *sev, const char *details, uint8_t *debug, size_t debuglen) {
+//	printf("Received:\n ");
+	if (g_n_read == 0)
+		g_n_read = g_read_bytes[0] + 1;
 
+#if 0
+	for (i = 0; i < g_n_read; i++)
+		printf(" 0x%x", g_read_bytes[i]);
+#endif
+
+	if ((g_read_tmp[2] != g_read_bytes[2]) || (g_read_tmp[3] != g_read_bytes[3])) {
+		sprintf(str, "HDD change:0x%x,0x%x", g_read_bytes[2], g_read_bytes[3]);
+		send_esel_to_dbus(str, "Low", "assoc", "hack", 3);
+	}
+
+	g_read_tmp[2]=g_read_bytes[2];
+	g_read_tmp[3]=g_read_bytes[3];
+	close(fd);
+}
+
+int send_esel_to_dbus(const char *desc, const char *sev, const char *details, uint8_t *debug, size_t debuglen)
+{
 	sd_bus *mbus = NULL;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
-    sd_bus_message *reply = NULL, *m=NULL;
-    uint16_t x;
-    int r;
-	sd_bus_error_free(&error);
+	sd_bus_error error = SD_BUS_ERROR_NULL;
+	sd_bus_message *reply = NULL, *m = NULL;
+	uint16_t value = 0;
+	int ret = 0;
+
+	fprintf(stderr,"add sel\n");
+	ret = sd_bus_open_system(&mbus);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-ret));
+		goto finish;
+	}
 
-	printf("add sel\n");
- 	r = sd_bus_open_system(&mbus);
-	if (r < 0) {
-		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+	ret = sd_bus_message_new_method_call(mbus,&m,
+						"org.openbmc.records.events",
+						"/org/openbmc/records/events",
+						"org.openbmc.recordlog",
+						"acceptHostMessage");
+	if (ret < 0) {
+		fprintf(stderr, "Failed to add the method object: %s\n", strerror(-ret));
 		goto finish;
 	}
 
-    r = sd_bus_message_new_method_call(mbus,&m,
-    									"org.openbmc.records.events",
-    									"/org/openbmc/records/events",
-    									"org.openbmc.recordlog",
-    									"acceptHostMessage");
-    if (r < 0) {
-        fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
-        goto finish;
-    }
-
-    r = sd_bus_message_append(m, "sss", desc, sev, details);
-    if (r < 0) {
-        fprintf(stderr, "Failed add the message strings : %s\n", strerror(-r));
-        goto finish;
-    }
-
-    r = sd_bus_message_append_array(m, 'y', debug, debuglen);
-    if (r < 0) {
-        fprintf(stderr, "Failed to add the raw array of bytes: %s\n", strerror(-r));
-        goto finish;
-    }
-    // Call the IPMI responder on the bus so the message can be sent to the CEC
-    r = sd_bus_call(mbus, m, 0, &error, &reply);
-    if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION__, strerror(-r));
-        goto finish;
-    }
-    r = sd_bus_message_read(reply, "q", &x);
-    if (r < 0) {
-        fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
-    }
+	ret = sd_bus_message_append(m, "sss", desc, sev, details);
+	if (ret < 0) {
+		fprintf(stderr, "Failed add the message strings : %s\n", strerror(-ret));
+		goto finish;
+	}
+
+	ret = sd_bus_message_append_array(m, 'y', debug, debuglen);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to add the raw array of bytes: %s\n", strerror(-ret));
+		goto finish;
+	}
+
+	// Call the IPMI responder on the bus so the message can be sent to the CEC
+	ret = sd_bus_call(mbus, m, 0, &error, &reply);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION__, strerror(-ret));
+		goto finish;
+	}
+	ret = sd_bus_message_read(reply, "q", &value);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-ret));
+	}
 
 finish:
-    sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
-    sd_bus_message_unref(reply);
-    return r;	
+	sd_bus_error_free(&error);
+	m = sd_bus_message_unref(m);
+	reply = sd_bus_message_unref(reply);
+	mbus = sd_bus_flush_close_unref(mbus);
+	return ret;
 }
-int start_system_information(void) {
-
-	sd_bus *bus;
-	sd_bus_slot *slot;
-	int r, x, rc,retry;
-	char *OccStatus;
-    r = -1;
-	while(r < 0) {
+
+int start_system_information(void)
+{
+	sd_bus *bus = NULL;
+	sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+	sd_bus_message *response = NULL;
+	int ret = 0, value = 0;
+	char *OccStatus = NULL;
+
 	/* Connect to the user bus this time */
-	r = sd_bus_open_system(&bus);
-		if(r < 0){	
-			fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+	do {
+		ret = sd_bus_open_system(&bus);
+		if(ret < 0) {
+			fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-ret));
+			bus = sd_bus_flush_close_unref(bus);
+		}
 		sleep(1);
-			}
-	//	goto finish;
+	} while (ret < 0);
 	
+	while (1) {
+		ret = sd_bus_call_method(bus,                   // On the System Bus
+					gService_c,               // Service to contact
+					gObjPath_c,            // Object path
+					gIntPath_c,              // Interface name
+					"getPowerState",          // Method to be called
+					&bus_error,                 // object to return error
+					&response,                  // Response message on success
+					NULL);                       // input message (string,byte)
+		if(ret < 0) {
+//			fprintf(stderr, "Failed to resolve getPowerState to dbus: %s\n", bus_error.message);
+			goto finish;
 		}
-	// SD Bus error report mechanism.
-	sd_bus_error bus_error = SD_BUS_ERROR_NULL;
-	sd_bus_message *response = NULL, *m = NULL;;
-        sd_bus_error_free(&bus_error);
-        sd_bus_message_unref(response);
-//		send_esel_to_dbus("desc", "sev", "assoc", "hack", 3);
-
-while(1){
-       sd_bus_error_free(&bus_error);
-
-
-	   
-       rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService_c,               // Service to contact
-                                gObjPath_c,            // Object path
-                                gIntPath_c,              // Interface name
-                                "getPowerState",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-                                // NULL);                  // First argument to getObjectFromId
-                                //"BOARD_1");             // Second Argument
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to resolve getPowerState to dbus: %s\n", bus_error.message);
-	    r = sd_bus_open_system(&bus);
-                if(r < 0){
-                        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
-                        sleep(1);
-                        }
-
-            goto finish;
-        }
-
-        rc = sd_bus_message_read(response, "i", &x);
-        if (rc < 0 )
-        {
-           fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
-           goto finish;
-        }
-        printf("PowerState value=[%d] \n",x);
-	if (x == 0 ) goto finish;
-	get_hdd_status();	
-        sleep(1);
-       sd_bus_error_free(&bus_error);
-       rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService,               // Service to contact
-                                gObjPath_o,            // Object path
-                                gIntPath,              // Interface name
-                                "getValue",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-                                // NULL);                  // First argument to getObjectFromId
-                                //"BOARD_1");             // Second Argument
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
-            goto finish;
-        }
-
-        rc = sd_bus_message_read(response, "v","s", &OccStatus);
-        if (rc < 0 )
-        {
-           fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
-           goto finish;
-        }
-        printf("OCCtate value=[%s][%d] \n",OccStatus,strcmp(OccStatus, "Disable"));
+
+		ret = sd_bus_message_read(response, "i", &value);
+		if (ret < 0 ) {
+			fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-ret));
+			goto finish;
+		}
+		sd_bus_error_free(&bus_error);
+		response = sd_bus_message_unref(response);
+//		fprintf(stderr,"PowerState value = [%d] \n",value);
+		if (value == 0 )
+			goto finish;
 	
-        if (strcmp(OccStatus, "Disable") != 1 ) goto finish;
-
-        rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService,               // Service to contact
-                                gObjPath,            // Object path
-                                gIntPath,              // Interface name
-                                "getValue",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-                                // NULL);                  // First argument to getObjectFromId
-                                //"BOARD_1");             // Second Argument
-
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
-            goto finish;
-        }
-
-	rc = sd_bus_message_read(response, "v","i", &x);
-	if (rc < 0 )
-	{ 
-           fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
-           goto finish;
-	}
-	printf("CPU value=[%d] \n",x);
-
-	if(x >= 90)
-	{
-	//printf("====Ken poweroff==== \n");
-	send_esel_to_dbus("CPU thermal trip", "High", "assoc", "hack", 3);
-	sd_bus_error_free(&bus_error);
-        rc = sd_bus_call_method(bus,                   // On the System Bus
-                                gService_c,               // Service to contact
-                                gObjPath_c,            // Object path
-                                gIntPath_c,              // Interface name
-                                "powerOff",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                NULL);                       // input message (string,byte)
-                                // NULL);                  // First argument to getObjectFromId
-                                //"BOARD_1");             // Second Argument
-
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to resolve poweroff to dbus: %s\n", bus_error.message);
-            goto finish;
-        }
+		get_hdd_status();
 
-	}
+		sleep(1);
+
+		ret = sd_bus_call_method(bus,                   // On the System Bus
+					gService,               // Service to contact
+					gObjPath_o,            // Object path
+					gIntPath,              // Interface name
+					"getValue",          // Method to be called
+					&bus_error,                 // object to return error
+					&response,                  // Response message on success
+					NULL);                       // input message (string,byte)
+		if(ret < 0) {
+			fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
+			goto finish;
+		}
+		ret = sd_bus_message_read(response, "v","s", &OccStatus);
+		if (ret < 0 ) {
+			fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-ret));
+			goto finish;
+		}
+		sd_bus_error_free(&bus_error);
+		response = sd_bus_message_unref(response);
+		fprintf(stderr,"OCCState value = [%s][%d] \n",OccStatus,strcmp(OccStatus, "Disable"));
+		if (strcmp(OccStatus, "Disable") != 1 )
+			goto finish;
+
+		ret = sd_bus_call_method(bus,                   // On the System Bus
+					gService,               // Service to contact
+					gObjPath,            // Object path
+					gIntPath,              // Interface name
+					"getValue",          // Method to be called
+					&bus_error,                 // object to return error
+					&response,                  // Response message on success
+					NULL);                       // input message (string,byte)
+		if(ret < 0) {
+			fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
+			goto finish;
+		}
+		ret = sd_bus_message_read(response, "v","i", &value);
+		if (ret < 0 ) {
+			fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-ret));
+			goto finish;
+		}
+		sd_bus_error_free(&bus_error);
+		response = sd_bus_message_unref(response);
+		fprintf(stderr,"CPU value = [%d] \n",value);
+		if(value >= 90) {
+			//printf("====Ken poweroff==== \n");
+			send_esel_to_dbus("CPU thermal trip", "High", "assoc", "hack", 3);
+
+			ret = sd_bus_call_method(bus,                   // On the System Bus
+						gService_c,               // Service to contact
+						gObjPath_c,            // Object path
+						gIntPath_c,              // Interface name
+						"powerOff",          // Method to be called
+						&bus_error,                 // object to return error
+						&response,                  // Response message on success
+						NULL);                       // input message (string,byte)
+
+			if(ret < 0) {
+				fprintf(stderr, "Failed to resolve poweroff to dbus: %s\n", bus_error.message);
+				goto finish;
+			}
+			sd_bus_error_free(&bus_error);
+		}
 	
-	sleep(1);
-///		sd_bus_unref(bus);
-	finish:
-		sd_bus_unref(bus);
+finish:
+		sd_bus_error_free(&bus_error);
+		response = sd_bus_message_unref(response);
+		sd_bus_flush(bus);
 		sleep(1);
-}
-	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+	}
+
+	bus = sd_bus_flush_close_unref(bus);
+	return ret < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
 
 
-- 
2.8.1
