Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW6xy3fStzDqsQ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 14:40:38 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466138432935372.28276918518895;
 Thu, 16 Jun 2016 21:40:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3 0/2] support for building witherspoon images
Date: Thu, 16 Jun 2016 23:40:29 -0500
Message-Id: <20160617044031.15231-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 17 Jun 2016 04:40:39 -0000

This patchset aims to enable support for building a Witherspoon image.  Witherspoon is an IBM branded OpenPOWER system.

At the moment the layer points at the 4.6 kernel branch which will not boot cleanly.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/373)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/373

Brad Bishop (2):
  Initial Witherspoon layer
  Add 4.7 kernel recipe

 .../meta-witherspoon/conf/bblayers.conf.sample     | 27 ++++++++++
 .../meta-ibm/meta-witherspoon/conf/conf-notes.txt  |  2 +
 .../meta-ibm/meta-witherspoon/conf/layer.conf      |  9 ++++
 .../meta-witherspoon/conf/local.conf.sample        | 21 ++++++++
 .../meta-witherspoon/conf/machine/witherspoon.conf |  8 +++
 .../0001-Witherspoon-OpenBMC-configuration.patch   | 29 +++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend           |  2 +
 ...d-flash-and-layout-to-Witherspoon-devtree.patch | 57 ++++++++++++++++++++++
 .../linux/linux-obmc/witherspoon.cfg               |  2 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |  3 ++
 .../recipes-kernel/linux/linux-obmc_4.7.bb         |  6 +++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  2 +
 ...-Set-witherspoon-power-pin-and-pgood-nets.patch | 30 ++++++++++++
 .../workbook/witherspoon-config.bb                 |  8 +++
 .../meta-ibm/meta-witherspoon/recipes.txt          |  2 +
 15 files changed, 208 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/machine/witherspoon.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/files/0001-Witherspoon-OpenBMC-configuration.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/0001-Add-flash-and-layout-to-Witherspoon-devtree.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc/witherspoon.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/skeleton/skeleton/0001-Set-witherspoon-power-pin-and-pgood-nets.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-phosphor/workbook/witherspoon-config.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes.txt

-- 
2.8.4
