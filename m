Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8bxM0g6gzDqCm
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 11:20:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463534452279673.3437009396741;
 Tue, 17 May 2016 18:20:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3 0/3] Deprecate modules provided by pyphosphor
Date: Tue, 17 May 2016 20:20:48 -0500
Message-Id: <1463534451-20356-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 May 2016 01:20:56 -0000

Removing a number of modules provided by the pyphosphor package.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/82)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/82

Brad Bishop (3):
  Deprecate Openbmc.py
  Deprecate PropertyCacher.py
  Deprecate Sensors.py

 bin/Openbmc.py          | 146 -------------------------------
 bin/PropertyCacher.py   |  50 -----------
 bin/Sensors.py          | 223 ------------------------------------------------
 bin/bmc_update.py       |  10 +--
 bin/chassis_control.py  |  11 ++-
 bin/download_manager.py |   5 +-
 bin/fan_control.py      |  10 +--
 bin/hwmon.py            |  10 +--
 bin/inventory_items.py  |  17 ++--
 bin/sensor_manager2.py  |  26 +++---
 bin/system_manager.py   |  16 ++--
 11 files changed, 52 insertions(+), 472 deletions(-)
 delete mode 100755 bin/Openbmc.py
 delete mode 100644 bin/PropertyCacher.py
 delete mode 100755 bin/Sensors.py

-- 
2.8.2
