Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTq384nVlzDqh5
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 11:40:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465954832390243.98071417516906;
 Tue, 14 Jun 2016 18:40:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v4 00/10] Update flash update to be useable at runtime.
Date: Tue, 14 Jun 2016 20:40:21 -0500
Message-Id: <20160615014031.32062-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 01:40:37 -0000

The underlying storage for a file system can not be updated when it is in use.  The initial solution was to update the flash as the system was being shutdown, with output to the console.

Updates were made to the init script that allows the flash to not be used for a given boot but the update script was not enhanced to make this user friendly, and no documentation was provided to prepare the system for this mode.

This series partially addresses #293 by enhancing the update script to 
1. provide more fine grained checks on update conflicts
2. provide additional checks that would cause failures
3. allow the flash to be updated at runtime if the in-use image is not in flash.

In addition it provides
* a method to build `init-options-base` into the initramfs providing options to `init` while allowing additional sources of options like the kernel command line.
* a diagnostic message to shutdown if the update did not remove a file indicating it was successful.
* a cleanup to the build recipe and naming

I anticipate creating packaging to put this initramfs with a cpio of the squashfs for net booting,
wrapping the result with a u-boot header.
I would like to have the init-options-base be built from a yocto variable instead of the inflexable hard coded files.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/297)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/297

Milton D. Miller II (9):
  image_types_uboot: Don't truncate when assembling flash
  initfs: Fix recipe, remove unnecessary class
  initfs: shutdown: comment on update success
  initfs: update: Don't exec sh or sulogin on error just exit 1
  initfs: update: no error if no files to copy to ram
  initfs: update: add option to perform checks but skip actual update
  initfs: update: check individual mtd partitions for mounts
  initfs: update: add check for image size vs mtd size
  initfs: init: add file for base options

Milton Miller (1):
  image-types_uboot: Package a self contained netboot image

 .../obmc-phosphor-image_types_uboot.bbclass        |  20 +++-
 meta-phosphor/classes/obmc-phosphor-initfs.bbclass |   4 -
 .../obmc-phosphor-initfs/files/obmc-init.sh        |  10 +-
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |   8 ++
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 109 +++++++++++++++------
 .../obmc-phosphor-initfs/obmc-phosphor-init.bb     |  31 ------
 .../obmc-phosphor-initfs/obmc-phosphor-initfs.bb   |  30 ++++++
 7 files changed, 141 insertions(+), 71 deletions(-)
 delete mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbclass
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb

-- 
2.8.4
