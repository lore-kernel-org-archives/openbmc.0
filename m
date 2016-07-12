Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rplJJ2YBWzDqFK
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 00:50:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468335036212148.6490507007312;
 Tue, 12 Jul 2016 07:50:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Move ast2400 platforms to the dev-4.6 kernel tree
Date: Tue, 12 Jul 2016 09:50:33 -0500
Message-Id: <20160712145034.15569-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 12 Jul 2016 14:50:40 -0000

The defconfig is regnerated with the newer kernel base. A large number
of unused options are disabled to reduce the kernel binary size.

Signed-off-by: Joel Stanley <joel@jms.id.au>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/467)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/467

Joel Stanley (1):
  Move ast2400 platforms to the dev-4.6 kernel tree

 .../recipes-kernel/linux/linux-obmc/defconfig      | 85 +++++-----------------
 .../common/recipes-kernel/linux/linux-obmc_4.4.bb  |  5 --
 .../common/recipes-kernel/linux/linux-obmc_4.6.bb  |  2 +-
 3 files changed, 21 insertions(+), 71 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb

-- 
2.9.0
