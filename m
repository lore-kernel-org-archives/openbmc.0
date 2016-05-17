Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8WkJ4wp9zDqCC
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 08:11:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463523054536355.0020094721127;
 Tue, 17 May 2016 15:10:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Move board config files to their own directory
Date: Tue, 17 May 2016 17:10:52 -0500
Message-Id: <1463523053-13422-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 22:11:05 -0000

This allows them to be easily installed in the correct place
rather than /usr/sbin by a Makefile or build recipe.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/84)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/84

Brad Bishop (1):
  Move board config files to their own directory

 bin/Barreleye.py        | 742 ------------------------------------------------
 bin/Firestone.py        | 610 ---------------------------------------
 bin/Garrison.py         | 610 ---------------------------------------
 bin/Palmetto.py         | 314 --------------------
 bin/download_manager.py |   6 +-
 bin/hwmon.py            |   6 +-
 bin/inventory_items.py  |   6 +-
 bin/system_manager.py   |   6 +-
 configs/Barreleye.py    | 742 ++++++++++++++++++++++++++++++++++++++++++++++++
 configs/Firestone.py    | 610 +++++++++++++++++++++++++++++++++++++++
 configs/Garrison.py     | 610 +++++++++++++++++++++++++++++++++++++++
 configs/Palmetto.py     | 314 ++++++++++++++++++++
 12 files changed, 2288 insertions(+), 2288 deletions(-)
 delete mode 100755 bin/Barreleye.py
 delete mode 100755 bin/Firestone.py
 delete mode 100755 bin/Garrison.py
 delete mode 100755 bin/Palmetto.py
 create mode 100644 configs/Barreleye.py
 create mode 100644 configs/Firestone.py
 create mode 100644 configs/Garrison.py
 create mode 100644 configs/Palmetto.py

-- 
2.8.2
