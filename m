Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVR153HQkzDqln
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 11:40:57 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466041250932602.2162408963417;
 Wed, 15 Jun 2016 18:40:50 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Fix Firestone,Garrison i2c addresses for OCC
Date: Wed, 15 Jun 2016 20:40:49 -0500
Message-Id: <20160616014050.21267-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Thu, 16 Jun 2016 01:40:58 -0000

Previously these were hardcoded via a garrison layer patch.
When skeleton started looking for addresses in the system
configuration file and stopped hardcoding them, the garrison
and firestone files were updated but with the barreleye
addresses.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/104)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/104

Brad Bishop (1):
  Fix Firestone,Garrison i2c addresses for OCC

 configs/Firestone.py | 4 ++--
 configs/Garrison.py  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.8.4
