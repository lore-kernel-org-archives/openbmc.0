Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8JsQ0hWhzDqB5
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:01:29 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463493676608140.8889384812975;
 Tue, 17 May 2016 07:01:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Deprecate Openbmc.py
Date: Tue, 17 May 2016 09:01:14 -0500
Message-Id: <1463493675-26570-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Tue, 17 May 2016 14:01:30 -0000

The pyphosphor package provides equivalent function
so use that and drop the duplicated code.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/81)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/81

Brad Bishop (1):
  Deprecate Openbmc.py

 bin/Openbmc.py          | 146 ------------------------------------------------
 bin/PropertyCacher.py   |   1 -
 bin/Sensors.py          |  11 ++--
 bin/bmc_update.py       |  10 ++--
 bin/chassis_control.py  |  11 ++--
 bin/download_manager.py |   5 +-
 bin/fan_control.py      |  10 ++--
 bin/hwmon.py            |   4 +-
 bin/inventory_items.py  |  14 ++---
 bin/sensor_manager2.py  |  10 ++--
 bin/system_manager.py   |  14 ++---
 11 files changed, 44 insertions(+), 192 deletions(-)
 delete mode 100755 bin/Openbmc.py

-- 
2.8.2
