Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8EC771A038E
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 05:00:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455040823678938.4183531920522;
 Tue, 9 Feb 2016 10:00:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/9] Initfs fsck v3
Date: Tue,  9 Feb 2016 12:00:13 -0600
Message-Id: <1455040822-14038-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 09 Feb 2016 18:00:28 -0000

This series of patches to the obmc init, shutdown, and update scripts adds several features, including

Run fsck on the read write filesystem before mounting.
More information on what to do and options when init fails
Consistent location of update images even during init repair cases

Plus these developer features
All mount arguments consolidated into variables
Clean unmount when testing rofs image in RAM (from the /run file system)
Other clean ups

This version splits the first commit into 3 changes, and updates the messages to have more whitespace and a more explicit statement of the chroot test along with commit message edits.
It corrects a missed variable conversion of rwdir in update and loops on the chroot test.

https://github.com/openbmc/openbmc/pull/169

Milton Miller (9):
  obmc-initfs: shutdown: don't follow links
  obmc-initfs: shutdown: use absolute paths
  obmc-initfs: init: check init is an executable file
  obmc-initfs: look for images in /run/initramfs/image-
  obmc-initfs: use varables for paths and mount arguments
  obmc-initfs: factor debug and takeover
  obmc-initfs: run fsck on read/write file system
  obmc-initfs: run update as a sub-script
  obmc-initfs: shutdown when rofs is a loop mounted image in /run

 .../obmc-phosphor-initfs/files/obmc-init.sh        | 106 ++++++++++++++++-----
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |  22 +++--
 .../obmc-phosphor-initfs/files/obmc-update.sh      |  59 ++++++------
 3 files changed, 126 insertions(+), 61 deletions(-)

-- 
2.6.4
