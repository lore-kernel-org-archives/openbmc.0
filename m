Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4Y7x4p1BzDqQs
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 12:01:16 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1470276070607793.3686400809418;
 Wed, 3 Aug 2016 19:01:10 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH skeleton] Load inventory from cache - v1.0-stable
Date: Wed,  3 Aug 2016 21:01:08 -0500
Message-Id: <20160804020109.11885-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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

The inventory is persisted across BMC reboots, so load this
data at BMC startup to not need a system power off/on to
load the inventory.
Fixes openbmc/openbmc#487

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

https://github.com/openbmc/skeleton/pull/128

Adriana Kobylak (1):
  Load inventory from cache

 pyinventorymgr/inventory_items.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.9.0
