Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbqhx1FrszDqlP
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 06:30:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466800235695846.1572016150344;
 Fri, 24 Jun 2016 13:30:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v9 00/10] Phosphor changes needed for Yocto 2.1
Date: Fri, 24 Jun 2016 15:30:24 -0500
Message-Id: <20160624203034.29228-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 20:30:42 -0000



<!-- Reviewable:start -->
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/397)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/397

Brad Bishop (1):
  Fix systemd packageconfig

Patrick Williams (9):
  meta-phosphor: Use obmc-phosphor-event for qemu systems
  meta-phosphor: use obmc-phosphor-user for qemu systems
  meta-phosphor: Remove unused systemd patch
  meta-phosphor: Make image-overlay an optional feature
  meta-phosphor: Ensure INITRAMFS_CTYPE defined
  obmc-phosphor-image: Improper use of DATETIME
  btbridged: Change how kernel-source depend is specified
  u-boot: Upgrade AST2400 machines to 2016.05 tree.
  u-boot: Remove unused 2013.07 packages.

 .../meta-ast2400/conf/machine/include/ast2400.inc  |    6 +-
 ...013.07%.bbappend => u-boot-fw-utils_%.bbappend} |    1 -
 ...{u-boot_2013.07%.bbappend => u-boot_%.bbappend} |    1 -
 .../meta-firestone/conf/machine/firestone.conf     |    2 +-
 .../meta-garrison/conf/machine/garrison.conf       |    2 +-
 .../meta-palmetto/conf/machine/palmetto.conf       |    2 +-
 .../meta-barreleye/conf/machine/barreleye.conf     |    2 +-
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |    3 -
 meta-phosphor/classes/obmc-phosphor-image.bbclass  |   11 +-
 .../obmc-phosphor-image_types_uboot.bbclass        |    2 +
 .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  |   55 -
 .../recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb  |    4 +-
 .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    |   23 -
 .../common/recipes-bsp/u-boot/u-boot_2016.05.bb    |    4 +-
 .../images/core-image-minimal-initramfs.bbappend   |    1 +
 .../0100-systemd_networkd_dbus_setaddress.patch    | 1209 --------------------
 .../common/recipes-core/systemd/systemd_%.bbappend |    4 +-
 .../recipes-phosphor/host-ipmid/btbridged.bb       |    2 +-
 .../conf/machine/include/obmc-bsp-common.inc       |    2 +-
 meta-phosphor/conf/machine/include/sample.inc      |    4 +-
 20 files changed, 26 insertions(+), 1314 deletions(-)
 rename meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/{u-boot-fw-utils_2013.07%.bbappend => u-boot-fw-utils_%.bbappend} (90%)
 rename meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/{u-boot_2013.07%.bbappend => u-boot_%.bbappend} (71%)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
 delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
 delete mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch

-- 
2.9.0
