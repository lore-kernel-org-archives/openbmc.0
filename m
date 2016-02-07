Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A598E1A02C0
 for <openbmc@lists.ozlabs.org>; Sun,  7 Feb 2016 11:00:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454803222093936.772312131092;
 Sat, 6 Feb 2016 16:00:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/7] initfs: check and auto-repair read/write file
 system
Date: Sat,  6 Feb 2016 18:00:14 -0600
Message-Id: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 07 Feb 2016 00:00:27 -0000

This series of patches to the obmc init, shutdown, and update scripts adds several features, including

Run fsck on the read write filesystem before mounting.
More information on what to do and options when init fails
Consistent location of update images even during init repair cases

Plus these developer features
All mount arguments consolidated into variables
Clean unmount when testing rofs image in RAM (from the /run file system)
Other clean ups

This second version has 1 update over the first version #165.  The prior version had
mistakenly used rodir for both device and directory options to mount in "use variables" patch.  I had caught and corrected when moving the line up in the "run fsck" patch but missed the same error occurred in the prior location.

i've now done a boot and shutdown test on each of the patches and an update of u-boot-env on most of them.  In addition I've used the penultimate and final version several times including the debug-init-sh option and the failed to fsck path and done end-to-end image-rwfs update with preserved files.


https://github.com/openbmc/openbmc/pull/166

Milton Miller (7):
  obmc-initfs: minor updates
  obmc-initfs: look for images in /run/initramfs/image-
  obmc-initfs: use varables for paths and mount arguments
  obmc-initfs: factor debug and takeover
  obmc-initfs: run fsck on read/write file system
  obmc-initfs: run update as a sub-script
  obmc-initfs: shutdown when rofs is a loop mounted image in /run

 .../obmc-phosphor-initfs/files/obmc-init.sh        | 91 +++++++++++++++++-----
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    | 22 ++++--
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 59 +++++++-------
 3 files changed, 114 insertions(+), 58 deletions(-)

-- 
2.6.4
