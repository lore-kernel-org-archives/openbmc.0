Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVmKX2Pw0zDqpp
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 00:41:20 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466088071531470.59209185146926;
 Thu, 16 Jun 2016 07:41:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v7 4/6] Add checkstop gpio to Barreleye and Palmetto
Date: Thu, 16 Jun 2016 09:40:54 -0500
Message-Id: <20160616144056.17931-5-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
References: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 14:41:21 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add checkstop gpio pin number and handling to Barreleye and
Palmetto platforms.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 configs/Barreleye.py | 7 +++++++
 configs/Palmetto.py  | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/configs/Barreleye.py b/configs/Barreleye.py
index c23f657..7b74179 100644
--- a/configs/Barreleye.py
+++ b/configs/Barreleye.py
@@ -154,6 +154,12 @@ APPS = {
                 'monitor_process' : True,
                 'process_name'    : 'button_reset.exe',
         },
+	'host_checkstop' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'host_checkstop.exe',
+	},
 	'led_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
@@ -561,6 +567,7 @@ GPIO_CONFIG['CPLD_TCK']    	  =   { 'gpio_pin': 'P0', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TDO']    	  =   { 'gpio_pin': 'P1', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TDI']    	  =   { 'gpio_pin': 'P2', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TMS']    	  =   { 'gpio_pin': 'P3', 'direction': 'out' }
+GPIO_CONFIG['CHECKSTOP']   	  =   { 'gpio_pin': 'P5', 'direction': 'falling' }
 
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
diff --git a/configs/Palmetto.py b/configs/Palmetto.py
index bb4d6f2..bbe4afc 100644
--- a/configs/Palmetto.py
+++ b/configs/Palmetto.py
@@ -111,6 +111,12 @@ APPS = {
 		'monitor_process' : False,
 		'process_name'    : 'button_power.exe',
 	},
+	'host_checkstop' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : False,
+		'monitor_process' : False,
+		'process_name'    : 'host_checkstop.exe',
+	},
 	'led_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
@@ -287,6 +293,7 @@ GPIO_CONFIG['SLOT1_PRESENT'] =         { 'gpio_pin': 'N4', 'direction': 'in' }
 GPIO_CONFIG['SLOT2_PRESENT'] =         { 'gpio_pin': 'N5', 'direction': 'in' }
 GPIO_CONFIG['MEZZ0_PRESENT'] =         { 'gpio_pin': 'O0', 'direction': 'in' }
 GPIO_CONFIG['MEZZ1_PRESENT'] =         { 'gpio_pin': 'O1', 'direction': 'in' }
+GPIO_CONFIG['CHECKSTOP']      =   { 'gpio_pin': 'P5', 'direction': 'falling' }
 
 def convertGpio(name):
 	name = name.upper()
-- 
2.8.4
