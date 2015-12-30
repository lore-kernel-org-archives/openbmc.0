Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DECF91A0CDB
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2015 17:40:52 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1451457637258133.61357347465298;
 Tue, 29 Dec 2015 22:40:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton] Add inventory fan5
Date: Wed, 30 Dec 2015 00:40:35 -0600
Message-Id: <1451457635-23250-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451457635-23250-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1451457635-23250-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 30 Dec 2015 06:40:53 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index f068ea1..ec4fab5 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -223,6 +223,7 @@ FRU_INSTANCES = {
 	'<inventory_root>/system/chassis/fan2' : { 'fru_type' : 'FAN','is_fru' : True, },
 	'<inventory_root>/system/chassis/fan3' : { 'fru_type' : 'FAN','is_fru' : True, },
 	'<inventory_root>/system/chassis/fan4' : { 'fru_type' : 'FAN','is_fru' : True, },
+        '<inventory_root>/system/chassis/fan5' : { 'fru_type' : 'FAN','is_fru' : True, },
 
 	'<inventory_root>/system/chassis/motherboard/bmc' : { 'fru_type' : 'BMC','is_fru' : False, 'manufacturer' : 'ASPEED' },
 
-- 
2.6.4
