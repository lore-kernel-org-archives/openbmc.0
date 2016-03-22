Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qV3jX0gblzDqDX
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 07:10:55 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145867744142933.0754512545999;
 Tue, 22 Mar 2016 13:10:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/4] Update kernel, u-boot, and eventd server
Date: Tue, 22 Mar 2016 15:10:35 -0500
Message-Id: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 22 Mar 2016 20:10:56 -0000

This request updates the kernel, boot loader, and the event logging application in the file system
to address issues encountered in testing.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/213)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/213

Milton D. Miller II (4):
  u-boot: Apply patch to stop aspeednic dma
  update phosphor-event recipe
  Add upstream jffs2 fixes to our 4.3 kernel
  Add kernel fixes for Inventory and OCC

 .../u-boot/files/aspeednic-mac-stop.patch          |  36 ++++
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |   1 +
 ...ectory-hardlinks-from-deleted-directories.patch | 195 +++++++++++++++++++++
 ...2-Fix-lock-acquisition-order-bug-in-jffs2.patch | 134 ++++++++++++++
 ...ated-SCU88-register-and-SCU90-init-values.patch |  70 ++++++++
 ...8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch | 148 ++++++++++++++++
 .../0002-jffs2-Fix-page-lock-f-sem-deadlock.patch  |  75 ++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   7 +
 .../obmc-phosphor-event/obmc-phosphor-event.bb     |   2 +-
 9 files changed, 667 insertions(+), 1 deletion(-)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/aspeednic-mac-stop.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Fix-directory-hardlinks-from-deleted-directories.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Revert-jffs2-Fix-lock-acquisition-order-bug-in-jffs2.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Updated-SCU88-register-and-SCU90-init-values.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-hwmon-power8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0002-jffs2-Fix-page-lock-f-sem-deadlock.patch

-- 
2.7.1
