Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwFL34V6LzDqbC
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 08:40:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461796853313444.9192918316737;
 Wed, 27 Apr 2016 15:40:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Remove CHASSIS_2 from Barreleye.py
Date: Wed, 27 Apr 2016 17:40:51 -0500
Message-Id: <1461796851-3417-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461796851-3417-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461796851-3417-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 27 Apr 2016 22:41:00 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

FRU_ID 2 corresponds to CPU1 and it doesn't have a CHASSIS section,
so removing CHASSIS_2 since it causes an error on parsing the vpd
data from hostboot and therefore it doesn't get added to the
inventory.
---
 bin/Barreleye.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 09fefa0..0cf55a1 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -385,7 +385,6 @@ ID_LOOKUP = {
 		'BOARD_3'    : '<inventory_root>/system/misc',
 		'PRODUCT_51' : '<inventory_root>/system/misc',
 		'PRODUCT_100': '<inventory_root>/system',
-		'CHASSIS_2'  : '<inventory_root>/system/chassis',
 		'CHASSIS_100': '<inventory_root>/system/chassis',
 		'BOARD_100'  : '<inventory_root>/system/chassis/io_board',
 		'BOARD_101'  : '<inventory_root>/system/chassis/sas_expander',
-- 
2.8.1
