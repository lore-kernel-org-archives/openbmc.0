Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQD0P1zmSzDq68
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 15:10:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465449033130619.2286353342378;
 Wed, 8 Jun 2016 22:10:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Bump pflash version
Date: Thu,  9 Jun 2016 00:10:31 -0500
Message-Id: <20160609051032.10806-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 09 Jun 2016 05:10:46 -0000

Move to pflash 5.2.2.
Pick up a couple patches that allow building a shared library
and dynamically linked pflash binary.
Add pflash to SDK.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/316)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/316

Brad Bishop (1):
  Bump pflash version

 .../common/recipes-bsp/pflash/pflash.bb            |  18 +-
 .../pflash/0001-Make-links-target-reusable.patch   | 186 +++++++++++++++++++++
 ...ernal-Remove-external-shared-link-targets.patch |  40 +++++
 .../0003-external-Fix-pflash-install-target.patch  |  28 ++++
 ...rnal-Remove-m64-from-shared-CFLAGS-on-ARM.patch |  32 ++++
 .../0005-external-Create-shared-rules.mk.patch     |  60 +++++++
 ...06-external-Add-dynamically-linked-pflash.patch |  68 ++++++++
 7 files changed, 428 insertions(+), 4 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-Make-links-target-reusable.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0002-external-Remove-external-shared-link-targets.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0003-external-Fix-pflash-install-target.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0005-external-Create-shared-rules.mk.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0006-external-Add-dynamically-linked-pflash.patch

-- 
2.8.3
