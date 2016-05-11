Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4LxP3V62zDqDW
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 13:21:13 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462936869826668.2945828386423;
 Tue, 10 May 2016 20:21:09 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: [PATCH skeleton v10 14/22] Set lower threshold for ambient/CPU/DIMM
 sensors
Date: Tue, 10 May 2016 22:20:44 -0500
Message-Id: <1462936852-25327-15-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 03:21:14 -0000

From: johnhcwang <hsienchiang@gmail.com>

The default value is 0, so we have to configure it to avoid the critical
assertion while power off.
---
 bin/Barreleye.py | 130 +++++++++++++++++++++++++++----------------------------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 6e8a8a4..a270f43 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -576,7 +576,7 @@ HWMON_CONFIG = {
 	'0-004a' :  {
 		'names' : {
 			'temp1_input' : { 'object_path' : 'temperature/ambient','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-					'critical_upper' : 40, 'warning_upper' : 36, 'emergency_enabled' : True },
+					'critical_upper' : 40, 'critical_lower' : -100, 'warning_upper' : 36, 'warning_lower' : -99, 'emergency_enabled' : True },
 		}
 	},
 	'6-002d' : {
@@ -637,137 +637,137 @@ HWMON_CONFIG = {
 		},
 		'labels' : {
 		'176' :  { 'object_path' : 'temperature/cpu0/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'177' :  { 'object_path' : 'temperature/cpu0/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'178' :  { 'object_path' : 'temperature/cpu0/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'179' :  { 'object_path' : 'temperature/cpu0/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'180' :  { 'object_path' : 'temperature/cpu0/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'181' :  { 'object_path' : 'temperature/cpu0/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'182' :  { 'object_path' : 'temperature/cpu0/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'183' :  { 'object_path' : 'temperature/cpu0/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'184' :  { 'object_path' : 'temperature/cpu0/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'185' :  { 'object_path' : 'temperature/cpu0/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'186' :  { 'object_path' : 'temperature/cpu0/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'187' :  { 'object_path' : 'temperature/cpu0/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'102' :  { 'object_path' : 'temperature/dimm0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'103' :  { 'object_path' : 'temperature/dimm1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'104' :  { 'object_path' : 'temperature/dimm2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'105' :  { 'object_path' : 'temperature/dimm3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'106' :  { 'object_path' : 'temperature/dimm4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'107' :  { 'object_path' : 'temperature/dimm5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'108' :  { 'object_path' : 'temperature/dimm6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'109' :  { 'object_path' : 'temperature/dimm7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'110' :  { 'object_path' : 'temperature/dimm8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'111' :  { 'object_path' : 'temperature/dimm9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'112' :  { 'object_path' : 'temperature/dimm10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'113' :  { 'object_path' : 'temperature/dimm11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'114' :  { 'object_path' : 'temperature/dimm12','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'115' :  { 'object_path' : 'temperature/dimm13','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'116' :  { 'object_path' : 'temperature/dimm14','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'117' :  { 'object_path' : 'temperature/dimm15','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'94' :  { 'object_path' : 'temperature/membuf0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'95' :  { 'object_path' : 'temperature/membuf1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'96' :  { 'object_path' : 'temperature/membuf2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'97' :  { 'object_path' : 'temperature/membuf3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		}
 	},
 	'3-0051' : {
 		'labels' :  {
 		'188' :  { 'object_path' : 'temperature/cpu1/core0','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'189' :  { 'object_path' : 'temperature/cpu1/core1','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'190' :  { 'object_path' : 'temperature/cpu1/core2','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'191' :  { 'object_path' : 'temperature/cpu1/core3','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'192' :  { 'object_path' : 'temperature/cpu1/core4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'193' :  { 'object_path' : 'temperature/cpu1/core5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'194' :  { 'object_path' : 'temperature/cpu1/core6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'195' :  { 'object_path' : 'temperature/cpu1/core7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'196' :  { 'object_path' : 'temperature/cpu1/core8','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'197' :  { 'object_path' : 'temperature/cpu1/core9','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'198' :  { 'object_path' : 'temperature/cpu1/core10','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'199' :  { 'object_path' : 'temperature/cpu1/core11','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 90, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 90, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'118' :  { 'object_path' : 'temperature/dimm16','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'119' :  { 'object_path' : 'temperature/dimm17','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'120' :  { 'object_path' : 'temperature/dimm18','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'121' :  { 'object_path' : 'temperature/dimm19','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'122' :  { 'object_path' : 'temperature/dimm20','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'123' :  { 'object_path' : 'temperature/dimm21','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'124' :  { 'object_path' : 'temperature/dimm22','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'125' :  { 'object_path' : 'temperature/dimm23','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'126' :  { 'object_path' : 'temperature/dimm24','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'127' :  { 'object_path' : 'temperature/dimm25','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'128' :  { 'object_path' : 'temperature/dimm26','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'129' :  { 'object_path' : 'temperature/dimm27','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'130' :  { 'object_path' : 'temperature/dimm28','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'131' :  { 'object_path' : 'temperature/dimm29','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'132' :  { 'object_path' : 'temperature/dimm30','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'133' :  { 'object_path' : 'temperature/dimm31','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 95, 'warning_upper' : 85, 'emergency_enabled' : True },
+			'critical_upper' : 95, 'critical_lower' : -100, 'warning_upper' : 85, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'98' :  { 'object_path' : 'temperature/membuf4','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'99' :  { 'object_path' : 'temperature/membuf5','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'100' :  { 'object_path' : 'temperature/membuf6','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		'101' :  { 'object_path' : 'temperature/membuf7','poll_interval' : 5000,'scale' : 1000,'units' : 'C',
-			'critical_upper' : 100, 'warning_upper' : 93, 'emergency_enabled' : True },
+			'critical_upper' : 100, 'critical_lower' : -100, 'warning_upper' : 93, 'warning_lower' : -99, 'emergency_enabled' : True },
 		}
 	},
 }
-- 
2.8.1
