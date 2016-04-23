Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qsJDY59JNzDq60
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2016 13:41:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461382856821822.3248077907456;
 Fri, 22 Apr 2016 20:40:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3] skeleton: Add dbus objects for adm1278 hwmon
 sensors
Date: Fri, 22 Apr 2016 22:40:54 -0500
Message-Id: <1461382854-31385-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461382854-31385-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461382854-31385-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 23 Apr 2016 03:41:02 -0000

From: Yi Li <adamliyi@msn.com>

Add dbus object for adm1278 Vout and Iout sensors.
Add the sense resistor as scaling factor in skeleton.

The sense resistor value is used while converting adm1278 'current' and 'power'
register value to real world value. The adm1278 driver does the conversion,
but without taking into account of the sense resistor.
The resistor value need to be set according to Barreleye design.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/Barreleye.py | 22 ++++++++++++++++++++++
 bin/Sensors.py   |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 09fefa0..2769800 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -717,5 +717,27 @@ HWMON_CONFIG = {
 		'101' :  { 'object_path' : 'temperature/membuf7','poll_interval' : 5000,'scale' : 1000,'units' : 'C' },
 		}
 	},
+	'4-0010' :  {
+		'names' : {
+			# Barreleye uses 0.25 millioohms sense resistor for adm1278
+			# To convert Iout register value Y to real-world value X, use an equation:
+			# X= 1/m * (Y * 10^-R - b), here m = 800 * R_sense, and R_sense is expressed in milliohms.
+			# The adm1278 driver did the conversion, but the R_sense is set here as a scale factor. 
+			'curr1_input' : { 'object_path' : 'HSCA/Iout','poll_interval' : 5000,'scale' : 0.25,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCA/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
+	'5-0010' :  {
+		'names' : {
+			'curr1_input' : { 'object_path' : 'HSCB/Iout','poll_interval' : 5000,'scale' : 0.25,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCB/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
+	'6-0010' :  {
+		'names' : {
+			'curr1_input' : { 'object_path' : 'HSCC/Iout','poll_interval' : 5000,'scale' : 0.25,'units' : 'mA' },
+			'in2_input' : { 'object_path' : 'HSCC/Vout','poll_interval' : 5000,'scale' : 1,'units' : 'mV' },
+		}
+	},
 }
 
diff --git a/bin/Sensors.py b/bin/Sensors.py
index f951eeb..06e0b5f 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -124,7 +124,8 @@ class HwmonSensor(SensorValue,SensorThresholds):
 			val = (self.properties[SensorValue.IFACE_NAME]['value']-offset) * scale
 			return [True,val]
 		else:
-			val = (value/scale) + offset
+			# Keep the val as integer. scale may be floating point
+			val = int(value/scale + offset)
 			if (val != self.value):
 				SensorValue.setValue(self,val)
 				self.check_thresholds(val)
-- 
2.8.1
