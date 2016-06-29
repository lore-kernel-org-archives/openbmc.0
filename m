Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfmq22xCLzDqpL
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 01:31:10 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467214259824472.8094368266318;
 Wed, 29 Jun 2016 08:30:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH skeleton v2] Add IO Board VPD handling
Date: Wed, 29 Jun 2016 10:30:57 -0500
Message-Id: <20160629153057.1177-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629153057.1177-1-openbmc-patches@stwcx.xyz>
References: <20160629153057.1177-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 15:31:11 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add argument to phosphor-read-eeprom to add additional handling
for reading the IO Board VPD.
Remove Product and Chassis area for IO vpd, since only board exists.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 configs/Barreleye.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configs/Barreleye.py b/configs/Barreleye.py
index 7b74179..863bc9b 100644
--- a/configs/Barreleye.py
+++ b/configs/Barreleye.py
@@ -202,7 +202,7 @@ APPS = {
 		'start_process'   : True,
 		'monitor_process' : False,
 		'process_name'    : 'phosphor-read-eeprom',
-		'args'            : ['--eeprom','/sys/bus/i2c/devices/0-0050/eeprom','--fruid','64'],
+		'args'            : ['--eeprom','/sys/bus/i2c/devices/0-0050/eeprom','--fruid','64','--iob'],
 	},
 	'motherboard_vpd' : {
 		'system_state'    : 'BMC_STARTING2',
@@ -405,8 +405,6 @@ ID_LOOKUP = {
 		'PRODUCT_0'  : '<inventory_root>/system/bios',
 		'BOARD_3'    : '<inventory_root>/system/misc',
 		'PRODUCT_51' : '<inventory_root>/system/misc',
-		'PRODUCT_100': '<inventory_root>/system',
-		'CHASSIS_100': '<inventory_root>/system/chassis',
 		'BOARD_100'  : '<inventory_root>/system/chassis/io_board',
 		'BOARD_101'  : '<inventory_root>/system/chassis/sas_expander',
 		'BOARD_102'  : '<inventory_root>/system/chassis/hdd_backplane',
-- 
2.9.0
