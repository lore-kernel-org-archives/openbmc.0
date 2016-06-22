Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZT7z5q1NzDq66
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 01:30:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466609448852655.2485304810622;
 Wed, 22 Jun 2016 08:30:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Update skeleton and pyphosphor.
Date: Wed, 22 Jun 2016 10:30:45 -0500
Message-Id: <20160622153047.13620-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 15:30:56 -0000

Closes openbmc/openbmc#218.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/406)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/406

Patrick Williams (2):
  skeleton: update package
  pyphosphor: update package

 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.9.0
