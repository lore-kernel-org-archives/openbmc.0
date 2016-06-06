Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLq13q25zDqHv
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:11:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186264959532.221896530522;
 Sun, 5 Jun 2016 21:11:04 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 3/3] Add inventory upload state for Barreleye
Date: Sun,  5 Jun 2016 23:10:59 -0500
Message-Id: <20160606041059.18824-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606041059.18824-1-openbmc-patches@stwcx.xyz>
References: <20160606041059.18824-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 04:11:10 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Insert the inventory upload step into the boot sequence.

The current triggers ( host powered off and bmc boot )
don't handle a BMC reset while the host is running.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 bin/Barreleye.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 66691fa..c23f657 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -18,6 +18,7 @@ SYSTEM_STATES = [
 	'BMC_READY',
 	'HOST_POWERING_ON',
 	'HOST_POWERED_ON',
+	'INVENTORY_UPLOADED',
 	'HOST_BOOTING',
 	'HOST_BOOTED',
 	'HOST_POWERED_OFF',
@@ -42,7 +43,7 @@ EXIT_STATE_DEPEND = {
 
 ## method will be called when state is entered
 ENTER_STATE_CALLBACK = {
-	'HOST_POWERED_ON' : {
+	'INVENTORY_UPLOADED' : {
 		'boot' : {
 			'bus_name'    : 'org.openbmc.control.Host',
 			'obj_name'    : '/org/openbmc/control/host0',
@@ -95,10 +96,17 @@ APPS = {
 		'process_name'    : 'inventory_items.py',
 		'args'            : [ SYSTEM_NAME ]
 	},
-	'pcie_present' : {
+	'inventory_upload' : {
 		'system_state'    : 'HOST_POWERED_ON',
 		'start_process'   : True,
 		'monitor_process' : False,
+		'process_name'    : 'goto_system_state.py',
+		'args'            : [ 'INVENTORY_UPLOADED', 'inventory_upload.py' ]
+	},
+	'pcie_present' : {
+		'system_state'    : 'INVENTORY_UPLOADED',
+		'start_process'   : True,
+		'monitor_process' : False,
 		'process_name'    : 'pcie_slot_present.exe',
 	},
 	'fan_control' : {
-- 
2.8.3
