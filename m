Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2391F1A0976
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:31:20 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549477525790.6757295045096;
 Thu, 22 Oct 2015 14:31:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/4] Barreleye build updates
Date: Thu, 22 Oct 2015 16:31:12 -0500
Message-Id: <1445549476-2786-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Thu, 22 Oct 2015 21:31:21 -0000

https://github.com/openbmc/openbmc/pull/33

Brad Bishop (4):
  Move Aspeed kernel/U-Boot appends to ast2400 layer
  Move Aspeed kernel/U-Boot appends to ast2400 layer
  Point Barreleye at Palmetto configs
  Changed name of barreleye parent layer

 .../meta-aspeed/meta-ast2400/conf/layer.conf       |     7 +-
 .../recipes-bsp/u-boot/files/config.patch          |    14 +
 .../recipes-bsp/u-boot/files/fw_env.config         |    22 +
 .../patch-2013.07/0000-u-boot-aspeed-064.patch     | 44658 +++++++++++++++++++
 .../files/patch-2013.07/0001-u-boot-openbmc.patch  |  1937 +
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |    13 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     1 +
 .../meta-aspeed/meta-ast2400/recipes.txt           |     2 +
 .../meta-openpower/meta-foxconn/conf/layer.conf    |     5 -
 .../meta-foxconn/conf/machine/include/foxconn.inc  |     1 -
 .../meta-barreleye/conf/bblayers.conf.sample       |    27 -
 .../meta-barreleye/conf/conf-notes.txt             |     2 -
 .../meta-foxconn/meta-barreleye/conf/layer.conf    |     5 -
 .../meta-barreleye/conf/local.conf.sample          |   245 -
 .../meta-barreleye/conf/machine/barreleye.conf     |    12 -
 .../meta-ibm/meta-palmetto/conf/layer.conf         |     4 -
 .../recipes-bsp/u-boot/files/config.patch          |    14 -
 .../recipes-bsp/u-boot/files/fw_env.config         |    22 -
 .../patch-2013.07/0000-u-boot-aspeed-064.patch     | 44658 -------------------
 .../files/patch-2013.07/0001-u-boot-openbmc.patch  |  1937 -
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |    13 -
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |     1 -
 .../meta-ibm/meta-palmetto/recipes.txt             |     2 -
 .../meta-openpower/meta-rackspace/conf/layer.conf  |     5 +
 .../conf/machine/include/rackspace.inc             |     1 +
 .../meta-barreleye/conf/bblayers.conf.sample       |    27 +
 .../meta-barreleye/conf/conf-notes.txt             |     2 +
 .../meta-rackspace/meta-barreleye/conf/layer.conf  |     5 +
 .../meta-barreleye/conf/local.conf.sample          |   245 +
 .../meta-barreleye/conf/machine/barreleye.conf     |    12 +
 30 files changed, 46950 insertions(+), 46949 deletions(-)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/config.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0000-u-boot-aspeed-064.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes.txt
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/conf/layer.conf
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/conf/machine/include/foxconn.inc
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/bblayers.conf.sample
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/conf-notes.txt
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/layer.conf
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/local.conf.sample
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/config.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/fw_env.config
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0000-u-boot-aspeed-064.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/conf/machine/include/rackspace.inc
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/machine/barreleye.conf

-- 
2.6.0
