Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYwJ31sclzDqMs
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:50:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466531448046599.3826167449134;
 Tue, 21 Jun 2016 10:50:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add pflash parallel build fix patch
Date: Tue, 21 Jun 2016 12:50:45 -0500
Message-Id: <20160621175046.25171-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:51:01 -0000

This resolves https://github.com/openbmc/openbmc/issues/325

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/402)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/402

Brad Bishop (1):
  Add pflash parallel build fix patch

 .../common/recipes-bsp/pflash/pflash.bb            |  1 +
 ...-Fix-ARM-build-failure-with-parallel-make.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch

-- 
2.9.0
