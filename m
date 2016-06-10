Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZj1R9qzDqQw
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:35 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465596631897150.38074693429223;
 Fri, 10 Jun 2016 15:10:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3 00/11] initial ast2500 stubs
Date: Fri, 10 Jun 2016 17:10:19 -0500
Message-Id: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 22:10:38 -0000

This patchset consists of a number of cleanup things in prep for a new ast2500 bsp layer, a new ast2500 bsp layer, and a layer for the ast2500 evaluation board.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/312)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/312

Brad Bishop (10):
  AST2400: Remove unused patches
  Add recipes-bsp to recipes.txt
  Remove empty devtrees
  Remove duplicate kernel config fragments
  AST2400: Set kernel preferred provider version
  Add a kernel 4.6 recipe
  Add a u-boot 2016.05 recipe
  AST2400: Use Palmetto as the default uboot target
  AST2500: Initial AST2500 BSP layer
  AST2500: Add AST2500 evaluation board layer

Rick Altherr (1):
  AST2400: Set u-boot preferred provider version

 .../meta-ast2400/conf/machine/include/ast2400.inc  |     5 +-
 .../patch-2013.07/0000-u-boot-aspeed-064.patch     | 44658 -------------------
 .../files/patch-2013.07/0001-u-boot-openbmc.patch  |  1937 -
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |     6 -
 .../recipes-kernel/linux/linux-obmc/hwmon.cfg      |     4 -
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     2 +-
 .../meta-aspeed/meta-ast2500/conf/layer.conf       |    10 +
 .../meta-ast2500/conf/machine/include/ast2500.inc  |    15 +
 .../recipes-bsp/u-boot/files/fw_env.config         |    24 +
 .../recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend  |    12 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend           |     3 +
 .../recipes-kernel/linux/linux-obmc/defconfig      |   208 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     2 +
 .../meta-aspeed/meta-ast2500/recipes.txt           |     2 +
 meta-openbmc-machines/meta-evb/conf/layer.conf     |     5 +
 .../meta-evb/meta-evb-aspeed/conf/layer.conf       |     5 +
 .../meta-evb-ast2500/conf/bblayers.conf.sample     |    27 +
 .../meta-evb-ast2500/conf/conf-notes.txt           |     2 +
 .../meta-evb-ast2500/conf/layer.conf               |     5 +
 .../meta-evb-ast2500/conf/local.conf.sample        |    21 +
 .../meta-evb-ast2500/conf/machine/evb-ast2500.conf |     6 +
 .../recipes-kernel/linux/linux-obmc/firestone.cfg  |     2 -
 .../recipes-kernel/linux/linux-obmc/firestone.dts  |     1 -
 .../recipes-kernel/linux/linux-obmc/garrison.cfg   |     2 -
 .../recipes-kernel/linux/linux-obmc/garrison.dts   |     1 -
 .../recipes-kernel/linux/linux-obmc/palmetto.dts   |     1 -
 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |     4 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     2 +
 .../recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb  |    46 +
 .../recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb   |    29 +
 .../common/recipes-bsp/u-boot/u-boot_2016.05.bb    |    12 +
 .../common/recipes-kernel/linux/linux-obmc.inc     |    27 +
 .../common/recipes-kernel/linux/linux-obmc_4.4.bb  |    27 +-
 .../common/recipes-kernel/linux/linux-obmc_4.6.bb  |     5 +
 meta-phosphor/common/recipes.txt                   |     1 +
 35 files changed, 479 insertions(+), 46640 deletions(-)
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0000-u-boot-aspeed-064.patch
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/files/fw_env.config
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot-fw-utils_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
 create mode 100644 meta-openbmc-machines/meta-evb/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/evb-ast2500.conf
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb

-- 
2.8.3
