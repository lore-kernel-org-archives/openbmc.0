Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLpv6Mf5zDqJ1
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:11:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186260355562.1907181097855;
 Sun, 5 Jun 2016 21:11:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/3] Inventory upload fixes
Date: Sun,  5 Jun 2016 23:10:56 -0500
Message-Id: <20160606041059.18824-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Mon, 06 Jun 2016 04:11:04 -0000

This patchset aims to correct a number of issues with the timing of kicking off the inventory upload procedure.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/98)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/98

Brad Bishop (3):
  Don't make pointless sensor update method calls
  Add goto system state wrapper script
  Add inventory upload state for Barreleye

 bin/Barreleye.py         | 12 ++++++++--
 bin/goto_system_state.py | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
 bin/hwmon.py             | 23 ++++++++++++++----
 3 files changed, 89 insertions(+), 7 deletions(-)
 create mode 100644 bin/goto_system_state.py

-- 
2.8.3
