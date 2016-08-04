Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4Y7x4p7bzDqRt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 12:01:16 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1470276072528332.41906385934954;
 Wed, 3 Aug 2016 19:01:12 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH skeleton] Load inventory from cache
Date: Wed,  3 Aug 2016 21:01:09 -0500
Message-Id: <20160804020109.11885-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160804020109.11885-1-openbmc-patches@stwcx.xyz>
References: <20160804020109.11885-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 04 Aug 2016 02:01:18 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The inventory is persisted across BMC reboots, so load this
data at BMC startup to not need a system power off/on to
load the inventory.
Fixes openbmc/openbmc#487

Change-Id: I67099508edcdbc0077b3cbc5fd47fcacfbace5af
Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 pyinventorymgr/inventory_items.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/pyinventorymgr/inventory_items.py b/pyinventorymgr/inventory_items.py
index 772fb3e..4b8169c 100644
--- a/pyinventorymgr/inventory_items.py
+++ b/pyinventorymgr/inventory_items.py
@@ -31,7 +31,6 @@ class InventoryItem(DbusProperties):
 
 		self.name = name
 		
-		## this will load properties from cache
 		if (data.has_key('present') == False):
 			data['present'] = 'False'
 		if (data.has_key('fault') == False):
@@ -40,7 +39,9 @@ class InventoryItem(DbusProperties):
 			data['version'] = ''
 
 		self.SetMultiple(INTF_NAME,data)
-		
+
+		## this will load properties from cache
+		PropertyCacher.load(name, INTF_NAME, self.properties)
 		
 	@dbus.service.method(INTF_NAME,
 		in_signature='a{sv}', out_signature='')
-- 
2.9.0
