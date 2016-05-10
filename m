Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3pJy30GKzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 15:51:14 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462859470937661.5514706573664;
 Mon, 9 May 2016 22:51:10 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v9 18/23] Keep original design to generate
 thermaltrip event
Date: Tue, 10 May 2016 00:50:44 -0500
Message-Id: <1462859449-5466-19-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 May 2016 05:51:15 -0000

From: johnhcwang <hsienchiang@gmail.com>

The shutdown action have to execute by info instead of emergency
shutdown, otherwise probably can't log the event in time.
So disable emergency for all CPU core in Barreleye.py.

The bast implementation is do log in EmergencyShutdown function.
Improve in the future.
---
 bin/Barreleye.py | 48 ++++++++++++++++++++++++------------------------
 objects/info.c   | 19 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index dc7b14a..86a5a97 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -649,29 +649,29 @@ HWMON_CONFIG = {
 		},
 		'labels' : {
 		'176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'177' :  { 'object_path' : 'temperature/cpu0/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'178' :  { 'object_path' : 'temperature/cpu0/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'179' :  { 'object_path' : 'temperature/cpu0/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'180' :  { 'object_path' : 'temperature/cpu0/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'181' :  { 'object_path' : 'temperature/cpu0/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'182' :  { 'object_path' : 'temperature/cpu0/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'183' :  { 'object_path' : 'temperature/cpu0/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'184' :  { 'object_path' : 'temperature/cpu0/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'185' :  { 'object_path' : 'temperature/cpu0/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'186' :  { 'object_path' : 'temperature/cpu0/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'187' :  { 'object_path' : 'temperature/cpu0/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'102' :  { 'object_path' : 'temperature/dimm0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
 			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'103' :  { 'object_path' : 'temperature/dimm1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
@@ -717,29 +717,29 @@ HWMON_CONFIG = {
 	'3-0051' : {
 		'labels' :  {
 		'188' :  { 'object_path' : 'temperature/cpu1/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'189' :  { 'object_path' : 'temperature/cpu1/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'190' :  { 'object_path' : 'temperature/cpu1/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'191' :  { 'object_path' : 'temperature/cpu1/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'192' :  { 'object_path' : 'temperature/cpu1/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'193' :  { 'object_path' : 'temperature/cpu1/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'194' :  { 'object_path' : 'temperature/cpu1/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'195' :  { 'object_path' : 'temperature/cpu1/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'196' :  { 'object_path' : 'temperature/cpu1/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'197' :  { 'object_path' : 'temperature/cpu1/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'198' :  { 'object_path' : 'temperature/cpu1/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'199' :  { 'object_path' : 'temperature/cpu1/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : False },
 		'118' :  { 'object_path' : 'temperature/dimm16','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
 			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'119' :  { 'object_path' : 'temperature/dimm17','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
diff --git a/objects/info.c b/objects/info.c
index 386133c..2da0dbc 100644
--- a/objects/info.c
+++ b/objects/info.c
@@ -360,13 +360,30 @@ int start_system_information(void)
 
 		if(HighestCPUtemp >= 90) {
 			thermaltrip_lock = 1;
-			send_esel_to_dbus("CPU thermal trip", "High", "assoc", "hack", 3);
+			send_esel_to_dbus("thermal shutdown, CPU temperature = 90degC", "High", "assoc", "hack", 3);
+
+			ret = sd_bus_call_method(bus,                   // On the System Bus
+						gService_c,               // Service to contact
+						gObjPath_c,            // Object path
+						gIntPath_c,              // Interface name
+						"powerOff",          // Method to be called
+						&bus_error,                 // object to return error
+						&response,                  // Response message on success
+						NULL);                       // input message (string,byte)
+			if(ret < 0)
+			{
+				fprintf(stderr, "Failed to power off from dbus: %s\n", bus_error.message);
+				goto finish;
+			}
+			sd_bus_error_free(&bus_error);
+			response = sd_bus_message_unref(response);
 		}
 	
 finish:
 		sd_bus_error_free(&bus_error);
 		response = sd_bus_message_unref(response);
 		sd_bus_flush(bus);
+		OccStatus = NULL;
 		HighestCPUtemp = 0;
 		sleep(1);
 	}
-- 
2.8.1
