Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rM8SG1x3lzDq80
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 15:20:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465017641017881.0010280167165;
 Fri, 3 Jun 2016 22:20:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 00/10] initial ast2500 stubs
Date: Sat,  4 Jun 2016 00:20:29 -0500
Message-Id: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 04 Jun 2016 05:20:46 -0000

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
  Move static kernel recipe configuration to include
  Add a kernel 4.6 recipe
  AST2400: Use Palmetto as the default uboot target
  AST2500: Initial AST2500 BSP layer
  AST2500: Add AST2500 evaluation board layer

 .../meta-ast2400/conf/machine/include/ast2400.inc  |     3 +-
 .../patch-2013.07/0000-u-boot-aspeed-064.patch     | 44658 -------------------
 .../files/patch-2013.07/0001-u-boot-openbmc.patch  |  1937 -
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |     6 -
 .../recipes-kernel/linux/linux-obmc/hwmon.cfg      |     4 -
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     2 +-
 .../meta-aspeed/meta-ast2500/conf/layer.conf       |    10 +
 .../meta-ast2500/conf/machine/include/ast2500.inc  |    14 +
 .../recipes-kernel/linux/linux-obmc/defconfig      |   104 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     2 +
 .../meta-aspeed/meta-ast2500/recipes.txt           |     2 +
 meta-openbmc-machines/meta-evb/conf/layer.conf     |     5 +
 .../meta-evb/meta-evb-aspeed/conf/layer.conf       |     5 +
 .../meta-evb-ast2500/conf/bblayers.conf.sample     |    27 +
 .../meta-evb-ast2500/conf/conf-notes.txt           |     2 +
 .../meta-evb-ast2500/conf/layer.conf               |     5 +
 .../meta-evb-ast2500/conf/local.conf.sample        |   245 +
 .../meta-evb-ast2500/conf/machine/ast2500-evb.conf |     6 +
 .../recipes-kernel/linux/linux-obmc/firestone.cfg  |     3 -
 .../recipes-kernel/linux/linux-obmc/firestone.dts  |     1 -
 .../recipes-kernel/linux/linux-obmc/garrison.cfg   |     3 -
 .../recipes-kernel/linux/linux-obmc/garrison.dts   |     1 -
 .../recipes-kernel/linux/linux-obmc/palmetto.cfg   |     1 -
 .../recipes-kernel/linux/linux-obmc/palmetto.dts   |     1 -
 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |     3 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     2 +
 .../common/recipes-kernel/linux/linux-obmc.inc     |    18 +
 .../recipes-kernel/linux/linux-obmc/hwmon.cfg      |     1 +
 .../common/recipes-kernel/linux/linux-obmc_4.4.bb  |    17 +-
 .../common/recipes-kernel/linux/linux-obmc_4.6.bb  |     5 +
 meta-phosphor/common/recipes.txt                   |     1 +
 31 files changed, 461 insertions(+), 46633 deletions(-)
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0000-u-boot-aspeed-064.patch
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
 create mode 100644 meta-openbmc-machines/meta-evb/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb

-- 
2.8.3
