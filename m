Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r91FH0gjNzDqCK
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 03:21:06 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463592059798413.1005973882276;
 Wed, 18 May 2016 10:20:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Read vpd from motherboard and add it to the inventory
Date: Wed, 18 May 2016 12:20:55 -0500
Message-Id: <1463592055-787-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463592055-787-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463592055-787-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 May 2016 17:21:07 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The motherboard eeprom is now modeled in the device tree in
Barreleye. Read its vpd with the rest of the eeproms and add
the info to the inventory.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 bin/Barreleye.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index bee0d4e..98dce40 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -190,6 +190,13 @@ APPS = {
 		'process_name'    : 'phosphor-read-eeprom',
 		'args'            : ['--eeprom','/sys/bus/i2c/devices/0-0050/eeprom','--fruid','64'],
 	},
+	'motherboard_vpd' : {
+		'system_state'    : 'BMC_STARTING2',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'phosphor-read-eeprom',
+		'args'            : ['--eeprom','/sys/bus/i2c/devices/4-0054/eeprom','--fruid','3'],
+	},
 	'exp_vpd' : {
 		'system_state'    : 'BMC_STARTING2',
 		'start_process'   : True,
-- 
2.8.2
