Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r51mh2jz9zDqCm
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 15:31:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146303105629217.54929401641175;
 Wed, 11 May 2016 22:30:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] replace centaur0 with membuf0 for Palmetto.py
Date: Thu, 12 May 2016 00:30:54 -0500
Message-Id: <1463031054-23900-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463031054-23900-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463031054-23900-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 May 2016 05:31:01 -0000

From: Chris Austen <austenc@us.ibm.com>

All the other systems call it membuf not centaur.  Time to fix
the palmetto system so test cases can match
---
 bin/Palmetto.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index ee824e1..bbfc2e1 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -190,7 +190,7 @@ FRU_INSTANCES = {
 	'<inventory_root>/system/chassis/motherboard/cpu0/core11' : { 'fru_type' : 'CORE', 'is_fru' : False, },
 
 	
-	'<inventory_root>/system/chassis/motherboard/centaur0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
+	'<inventory_root>/system/chassis/motherboard/membuf0' : { 'fru_type' : 'MEMORY_BUFFER', 'is_fru' : False, },
 
 	'<inventory_root>/system/chassis/motherboard/dimm0' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
 	'<inventory_root>/system/chassis/motherboard/dimm1' : { 'fru_type' : 'DIMM', 'is_fru' : True,},
@@ -212,7 +212,7 @@ ID_LOOKUP = {
 		0x0d : '<inventory_root>/system/chassis',
 		0x34 : '<inventory_root>/system/chassis/motherboard',
 		0x01 : '<inventory_root>/system/chassis/motherboard/cpu0',
-		0x02 : '<inventory_root>/system/chassis/motherboard/centaur0',
+		0x02 : '<inventory_root>/system/chassis/motherboard/membuf0',
 		0x03 : '<inventory_root>/system/chassis/motherboard/dimm0',
 		0x04 : '<inventory_root>/system/chassis/motherboard/dimm1',
 		0x05 : '<inventory_root>/system/chassis/motherboard/dimm2',
@@ -223,7 +223,7 @@ ID_LOOKUP = {
 		'PRODUCT_15' : '<inventory_root>/system',
 		'CHASSIS_2' : '<inventory_root>/system/chassis',
 		'BOARD_1'   : '<inventory_root>/system/chassis/motherboard/cpu0',
-		'BOARD_2'   : '<inventory_root>/system/chassis/motherboard/centaur0',
+		'BOARD_2'   : '<inventory_root>/system/chassis/motherboard/membuf0',
 		'BOARD_14'   : '<inventory_root>/system/chassis/motherboard',
 		'PRODUCT_3'   : '<inventory_root>/system/chassis/motherboard/dimm0',
 		'PRODUCT_4'   : '<inventory_root>/system/chassis/motherboard/dimm1',
@@ -250,7 +250,7 @@ ID_LOOKUP = {
 		0x2b : '<inventory_root>/system/chassis/motherboard/cpu0/core9',
 		0x2c : '<inventory_root>/system/chassis/motherboard/cpu0/core10',
 		0x2d : '<inventory_root>/system/chassis/motherboard/cpu0/core11',
-		0x2e : '<inventory_root>/system/chassis/motherboard/centaur0',
+		0x2e : '<inventory_root>/system/chassis/motherboard/membuf0',
 		0x1e : '<inventory_root>/system/chassis/motherboard/dimm0',
 		0x1f : '<inventory_root>/system/chassis/motherboard/dimm1',
 		0x20 : '<inventory_root>/system/chassis/motherboard/dimm2',
-- 
2.8.1
