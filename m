Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg4784QFYzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 13:01:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467255661855241.1284852151964;
 Wed, 29 Jun 2016 20:01:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH skeleton] Add logic to sync/preserve MAC and UUID
Date: Wed, 29 Jun 2016 22:00:59 -0500
Message-Id: <20160630030100.2170-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 03:01:09 -0000

Add logic to sync/preserve the MAC and UUID in case of HW replacement.
The MAC and UUID values are set in VPD by the manufacturer. These
values are mirrored to u-boot. During BMC boot, check that VPD and u-boot
are in sync. If they are different, use the vpd value to update u-boot.
Exception is the MAC when it's been set by the admin to have a locally
administered address.
Updating the MAC takes effect immediately, updating the UUID requires a
BMC reboot.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/121)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/121

Adriana Kobylak (1):
  Add logic to sync/preserve MAC and UUID

 configs/Barreleye.py                   |  14 ++++
 pyinventorymgr/setup.py                |   2 +-
 pyinventorymgr/sync_inventory_items.py | 118 +++++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 pyinventorymgr/sync_inventory_items.py

-- 
2.9.0
