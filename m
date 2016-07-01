Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgx9H2YzQzDqhC
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 22:50:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467377454467710.9243239511565;
 Fri, 1 Jul 2016 05:50:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH skeleton v3] Remove Product and Chassis area from IOBoard
Date: Fri,  1 Jul 2016 07:50:52 -0500
Message-Id: <20160701125052.9712-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160701125052.9712-1-openbmc-patches@stwcx.xyz>
References: <20160701125052.9712-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 01 Jul 2016 12:50:59 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Remove Product and Chassis area for IO board vpd
since only board area is present in the latest
version of the IO eeprom.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 configs/Barreleye.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/Barreleye.py b/configs/Barreleye.py
index 7b74179..6403ed6 100644
--- a/configs/Barreleye.py
+++ b/configs/Barreleye.py
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
