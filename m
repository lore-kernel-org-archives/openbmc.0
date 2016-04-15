Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmjhH5qZPzDq62
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 02:30:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460737834310626.7939613149566;
 Fri, 15 Apr 2016 09:30:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/4] Use pflash from upstream skiboot instead of
 skeleton.
Date: Fri, 15 Apr 2016 11:30:29 -0500
Message-Id: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 16:30:40 -0000

Fixes #103.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/233)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/233

Joel Stanley (1):
  pflash: Add pflash recipe

Patrick Williams (3):
  meta-openpower: add common/recipes-* tree
  pflash: Use skiboot-5.2.0
  skeleton: Use pflash recipe

 .../common/recipes-bsp/pflash/pflash.bb            | 23 +++++
 .../0001-pflash-Allow-building-under-yocto.patch   | 98 ++++++++++++++++++++++
 .../meta-openpower/conf/layer.conf                 |  3 +
 .../conf/machine/include/openpower.inc             |  1 +
 .../common/recipes-phosphor/skeleton/skeleton.bb   |  7 ++
 5 files changed, 132 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Allow-building-under-yocto.patch

-- 
2.7.1
