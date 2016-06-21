Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYwHp1G9tzDqCY
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:50:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466531434219684.0705555367556;
 Tue, 21 Jun 2016 10:50:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Removed unused host-ipmid-bt application
Date: Tue, 21 Jun 2016 12:50:32 -0500
Message-Id: <20160621175033.25045-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:50:47 -0000

This was deprecated in favor of btbridged.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/404)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/404

Brad Bishop (1):
  Removed unused host-ipmid-bt application

 .../common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb  | 17 -----------------
 .../host-ipmid/host-ipmi-bt/host-ipmi-bt.service        |  9 ---------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service

-- 
2.9.0
