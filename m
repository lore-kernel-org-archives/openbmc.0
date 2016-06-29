Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfl2V6xxWzDqvq
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:10:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467209454830279.1860645937171;
 Wed, 29 Jun 2016 07:10:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH skeleton] Add IO Board VPD handling
Date: Wed, 29 Jun 2016 09:10:52 -0500
Message-Id: <20160629141052.29327-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629141052.29327-1-openbmc-patches@stwcx.xyz>
References: <20160629141052.29327-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 14:10:59 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add argument to phosphor-read-eeprom to add additional handling
for reading the IO Board VPD.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 configs/Barreleye.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/Barreleye.py b/configs/Barreleye.py
index 7b74179..942bf51 100644
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
-- 
2.9.0
