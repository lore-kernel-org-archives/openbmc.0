Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVRty4NRpzDqls
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 12:20:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466043634627120.92751532362922;
 Wed, 15 Jun 2016 19:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Fix Garrison/Firestone build breaks
Date: Wed, 15 Jun 2016 21:20:32 -0500
Message-Id: <20160616022033.22873-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 02:20:43 -0000

A number of skeleton patches no longer applied due to 40a360c
and 54decc8.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/372)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/372

Brad Bishop (1):
  Fix Garrison/Firestone build breaks

 .../recipes-phosphor/skeleton/skeleton.bbappend    |   3 +-
 ...r-control-support-for-the-Garrison-system.patch |   1 +
 .../skeleton/skeleton/occ-path.patch               |   1 -
 .../skeleton/skeleton/poweron.patch                |   1 -
 .../recipes-phosphor/skeleton/skeleton.bbappend    |   3 +-
 ...r-control-support-for-the-Garrison-system.patch | 128 +++++++++++++++++++++
 .../skeleton/skeleton/occ-path.patch               |  20 ----
 .../skeleton/skeleton/poweron.patch                | 113 ------------------
 8 files changed, 131 insertions(+), 139 deletions(-)
 create mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
 delete mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
 delete mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/0001-Add-power-control-support-for-the-Garrison-system.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch

-- 
2.8.4
