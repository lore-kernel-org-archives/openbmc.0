Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcYQR6S3LzDqlj
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:50:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466902234032764.3469499493419;
 Sat, 25 Jun 2016 17:50:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v7 00/15] Update flash update to be useable at runtime.
Date: Sat, 25 Jun 2016 19:50:18 -0500
Message-Id: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 26 Jun 2016 00:50:40 -0000
X-List-Received-Date: Sun, 26 Jun 2016 00:50:40 -0000
X-List-Received-Date: Sun, 26 Jun 2016 00:50:40 -0000

The underlying storage for a file system can not be updated when it is in use.  The initial solution was to update the flash as the system was being shutdown, with output to the console.

Updates were made to the init script that allows the flash to not be used for a given boot but the update script was not enhanced to make this user friendly, and no documentation was provided to prepare the system for this mode.

This series partially addresses #293 by enhancing the update script to
1. provide more fine grained checks on update conflicts allowing use at runtime
2. provide additional checks that would cause failure to flash
3. provide user help and consistent tagging of error output
4. provide an error return code if the checks fail
5. provide a nice diagnostic if no images were presented for update (and not generate an error).

Two patches in this series provide fixes #378 in different ways:
1. Correct the code to address the issue
2. Avoid the issue by changing the line in the `whitelist`

In addition the series provides
* A fix to properly assemble the flash image, filling with `0xff` characters as intended.
* A cleanup to the build recipe and naming.
* A diagnostic message to shutdown if the update did not remove a file indicating it was successful.
* A method to build `init-options-base` into the initramfs providing options to `init` while allowing additional sources of options like the kernel command line. 
* A self contained image `initramfs-netboot.cpio.u-boot` for loading over the network.

These last two are intended to ease creating and using images for alternate network based deployment and testing, using the features and option parsing already in the `init` script.


<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/297)
<!-- Reviewable:end -->
---
This update addresses several review comments and fixes some spelling errors.  The changed
lines compared to the previous version were exercised.

https://github.com/openbmc/openbmc/pull/297

Milton Miller (15):
  image_types_uboot: Don't truncate when assembling flash
  initfs: Fix recipe, remove unnecessary class
  initfs: shutdown: comment on update success
  initfs: update: Don't exec sh or sulogin on error just exit 1
  initfs: update: Do not cause an error if no files were saved
  initfs: update: Consistently add ERROR: and print to stderr
  initfs: update: add option to perform checks but skip actual update
  initfs: update: check individual mtd partitions for mounts
  initfs: update: add check for image size vs mtd size
  initfs: update: add --help message
  initfs: init: add file for base options
  image-types_uboot: Package a self contained netboot image
  initfs: update: handle no images to update
  initfs: update: Sanitize whitelist directory entries
  initfs: whitelist: Sanitize obmc events whitelist entry

 .../obmc-phosphor-image_types_uboot.bbclass        |  20 ++-
 meta-phosphor/classes/obmc-phosphor-initfs.bbclass |   4 -
 .../obmc-phosphor-initfs/files/obmc-init.sh        |  10 +-
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |   8 ++
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 159 ++++++++++++++++-----
 .../obmc-phosphor-initfs/files/whitelist           |   2 +-
 ...mc-phosphor-init.bb => obmc-phosphor-initfs.bb} |   1 -
 7 files changed, 158 insertions(+), 46 deletions(-)
 delete mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbclass
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/{obmc-phosphor-init.bb => obmc-phosphor-initfs.bb} (96%)

-- 
2.9.0
