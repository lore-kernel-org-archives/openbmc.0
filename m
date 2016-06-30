Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgPsd1wxdzDrLV
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 02:20:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146730363491174.17678029467584;
 Thu, 30 Jun 2016 09:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/3] Fixes for witherspoon kernel, pflash and skeleton
Date: Thu, 30 Jun 2016 11:20:30 -0500
Message-Id: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 16:20:37 -0000

These are build fixes I required in working towards moving us to use GCC 5

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/448)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/448

Joel Stanley (3):
  witherspoon: bump kernel revision
  meta-phosphor: Bump skeleton revision
  meta-openpower: Update pflash version

 .../common/recipes-bsp/pflash/pflash.bb            |  13 +-
 .../pflash/0001-Make-links-target-reusable.patch   | 186 ---------------------
 ...ernal-Remove-external-shared-link-targets.patch |  40 -----
 .../0003-external-Fix-pflash-install-target.patch  |  28 ----
 ...rnal-Remove-m64-from-shared-CFLAGS-on-ARM.patch |  32 ----
 .../0005-external-Create-shared-rules.mk.patch     |  60 -------
 ...06-external-Add-dynamically-linked-pflash.patch |  68 --------
 ...-Fix-ARM-build-failure-with-parallel-make.patch |  28 ----
 .../recipes-kernel/linux/linux-obmc_4.7.bb         |   2 +-
 .../common/recipes-phosphor/skeleton/skeleton.bb   |   2 +-
 10 files changed, 4 insertions(+), 455 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-Make-links-target-reusable.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0002-external-Remove-external-shared-link-targets.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0003-external-Fix-pflash-install-target.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0005-external-Create-shared-rules.mk.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0006-external-Add-dynamically-linked-pflash.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch

-- 
2.9.0
