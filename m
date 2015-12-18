Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 613BD1A1AFD
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482044931288.8578475067163;
 Fri, 18 Dec 2015 15:40:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 13/15] Add all voltage sensors
Date: Fri, 18 Dec 2015 17:40:33 -0600
Message-Id: <1450482035-4530-14-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:51 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 2e59392..93c3694 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -543,6 +543,22 @@ HWMON_CONFIG = {
 			'pwm1' : { 'object_path' : 'speed/fan0','poll_interval' : 10000,'scale' : 1,'units' : '' },
 			'pwm2' : { 'object_path' : 'speed/fan1','poll_interval' : 10000,'scale' : 1,'units' : '' },
 			'pwm3' : { 'object_path' : 'speed/fan2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in1_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in2_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in3_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in4_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in5_input' : { 'object_path' : 'voltage/P0V9_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in6_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in7_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in8_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in9_input' : { 'object_path' : 'voltage/P1V09_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in10_input' : { 'object_path' : 'voltage/P0V97_CPU0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in11_input' : { 'object_path' : 'voltage/P1V1_MEM0','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in12_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in13_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in14_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in15_input' : { 'object_path' : 'voltage/P1V35_CPU0_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+
 		}
 	},
 	'6-002e' : {
@@ -550,6 +566,22 @@ HWMON_CONFIG = {
 			'pwm1' : { 'object_path' : 'speed/fan3','poll_interval' : 10000,'scale' : 1,'units' : '' },
 			'pwm2' : { 'object_path' : 'speed/fan4','poll_interval' : 10000,'scale' : 1,'units' : '' },
 			'pwm3' : { 'object_path' : 'speed/fan5','poll_interval' : 10000,'scale' : 1,'units' : '' },
+   			'in1_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in2_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in3_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in4_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in5_input' : { 'object_path' : 'voltage/P0V9_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in6_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in7_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in8_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in9_input' : { 'object_path' : 'voltage/P1V09_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in10_input' : { 'object_path' : 'voltage/P0V97_CPU1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in11_input' : { 'object_path' : 'voltage/P1V1_MEM1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in12_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF1','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in13_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF2','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in14_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF3','poll_interval' : 10000,'scale' : 1,'units' : '' },
+                'in15_input' : { 'object_path' : 'voltage/P1V35_CPU1_BUF4','poll_interval' : 10000,'scale' : 1,'units' : '' },
+
 		}
 },
 	'3-0050' : {
-- 
2.6.3
