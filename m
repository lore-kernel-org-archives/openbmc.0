Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFVRl2SzdzDqKM
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 10:30:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464222635554258.720734772441;
 Wed, 25 May 2016 17:30:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/7] Update flash update to be useable at runtime.
Date: Wed, 25 May 2016 19:30:27 -0500
Message-Id: <20160526003034.30491-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 26 May 2016 00:30:43 -0000

The underlying storage for a file system can not be updated when it is in use.  The initial solution was to update the flash as the system was being shutdown, with output to the console.

Updates were made to the init script that allows the flash to not be used for a given boot but the update script was not enhanced to make this user friendly, and no documentation was provided to prepare the system for this mode.

This series partially addresses #293 by enhancing the update script to 
1. provide more fine grained checks on update conflicts
2. provide additional checks that would cause failures
3. allow the flash to be updated at runtime if the in-use image is not in flash.

I anticipate adding options to allow init to have some options in the initramfs and get further from the command line.

This series is still in RFC state and has not been tested.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/297)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/297

Milton D. Miller II (7):
  initfs: shutdown: comment on update success
  initfs: update: Don't exec sh or sulogin on error just exit 1
  initfs: update: no error if no files to copy to ram
  initfs: update: add option to perform checks but skip actual update
  initfs: update: check individual mtd partitions for mounts
  initfs: update: add check for image size vs mtd size
  initfs: init: add file for base options

 .../obmc-phosphor-initfs/files/obmc-init.sh        |  10 +-
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |   8 ++
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 109 +++++++++++++++------
 3 files changed, 96 insertions(+), 31 deletions(-)

-- 
2.8.3
