Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpxHS16RZzDqHf
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 08:20:35 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468362033196893.2411856489158;
 Tue, 12 Jul 2016 15:20:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3] Split whitelist into files by package.
Date: Tue, 12 Jul 2016 17:20:31 -0500
Message-Id: <20160712222032.31868-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 12 Jul 2016 22:20:36 -0000

The whitelist, a list of files and directories to preserve when updating the file system image, is not maintainable as a single file.  Each package should specify which files it wants saved, and a combined list generated.

This  patch is the first step of moving the white list content to a directory in the image and updating the scripts to look at the directory.  With this patch additional recipes can be added to the initramfs recipe that add additional files to be preserved across a "revert to factory image", such as adding shell history files as mentioned in #293.

Some design is needed to assemble the whitelist content from the various recipes because the whitelist is in the initramfs but it affects the packages in the main rootfs image.  Splitting the whitelist into fragments in the various package recipes is deferred for that design.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/180)
<!-- Reviewable:end -->

https://github.com/openbmc/openbmc/pull/180

Milton Miller (1):
  initfs: Store whiltelist in a directory of files

 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh | 2 +-
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh      | 6 ++++--
 .../recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb   | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.9.0
