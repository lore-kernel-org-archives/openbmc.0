Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbrr3xYczDq5d
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:50:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14673306340031009.6150699104337;
 Thu, 30 Jun 2016 16:50:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 00/16] Update flash update to be useable at runtime
 for v1.0-stable
Date: Thu, 30 Jun 2016 18:50:17 -0500
Message-Id: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 23:50:37 -0000

The underlying storage for a file system can not be updated when it is in use.  The initial solution was to update the flash as the system was being shutdown, with output to the console.

Updates were made to the `init` script that allows the flash to not be used for a given boot but the `update` script was not updated for error handling, and no documentation was provided to prepare the system for this mode.

When combined with openbmc/skeleton#111 this series is intended to address #293 by providing for the flash to be written while running the full stack after a `PrepareForFlash` mode has been initiated.

This also has fixes for saving files fixing #378.

These are the changes in #297 applied to the v1.0-stable branch.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/451)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/451

Milton Miller (16):
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
  initfs: Store whiltelist in a directory of files

 .../obmc-phosphor-image_types_uboot.bbclass        |  20 ++-
 meta-phosphor/classes/obmc-phosphor-initfs.bbclass |   4 -
 .../obmc-phosphor-initfs/files/obmc-init.sh        |  12 +-
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |   8 +
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 165 ++++++++++++++++-----
 .../obmc-phosphor-initfs/files/whitelist           |   2 +-
 ...mc-phosphor-init.bb => obmc-phosphor-initfs.bb} |   6 +-
 7 files changed, 166 insertions(+), 51 deletions(-)
 delete mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbclass
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/{obmc-phosphor-init.bb => obmc-phosphor-initfs.bb} (81%)

-- 
2.9.0
