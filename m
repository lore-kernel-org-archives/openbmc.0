Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0rXR6N5WzDq5y
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 20:20:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462443651824895.4239047136442;
 Thu, 5 May 2016 03:20:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] [skeleton]: Fix hard-coded path name when creating
 sensor object
Date: Thu,  5 May 2016 05:20:49 -0500
Message-Id: <1462443650-31013-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Thu, 05 May 2016 10:20:56 -0000

This patch fixes skeleton issue: https://github.com/openbmc/skeleton/issues/33
The non-poll sensors have system specific properties. Define the sensor properties
in system files, and generate sensor objects dynamically.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/72)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/72

Yi Li (1):
  [skeleton]: Fix hard-coded path name when creating sensor object

 bin/Barreleye.py       | 25 +++++++++++++++++++++++++
 bin/Firestone.py       | 27 +++++++++++++++++++++++++++
 bin/Garrison.py        | 26 ++++++++++++++++++++++++++
 bin/Palmetto.py        | 22 ++++++++++++++++++++++
 bin/sensor_manager2.py | 35 +++++++++--------------------------
 5 files changed, 109 insertions(+), 26 deletions(-)

-- 
2.8.1
