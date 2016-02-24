Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 75C641A04B0
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 05:40:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456339225427645.369963045993;
 Wed, 24 Feb 2016 10:40:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/9] Change Read/Write overlay filesystem to jffs2
Date: Wed, 24 Feb 2016 12:40:15 -0600
Message-Id: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Wed, 24 Feb 2016 18:40:31 -0000

This series updates the build and init scripts to allow, nee require, that the rwfs be a jffs2 instead of our former ext4 filesystem.  

An kernel command line parameter clean-rwfs-filesystem, is also detected to clean the filesystem back to the whitelisted files.

The init and update scripts now use blkid to detect known filesystems, and assume jffs2 if blkid produces no output (as there is no current probe for jffs2).  The erased nor is also considered jffs2 and the kernel is happy to mount and use such a flash partition.

The requirement can be turned off with a 1 word edit to a flag in the init script.  Another flag can be
set to allow images to be built into an initrd for netboot updating.  Images can also be downloaded at the debug-init-sh sulogin shell if that is set in the command line.

The build system now initializes the image to 0xFF, the nor erase value, to allow the filesystem to be implicit.

There is also a  correction to an error path takeover message.
I have exercised all paths of the final init script.

https://github.com/openbmc/openbmc/pull/189

Andrew Jeffery (6):
  oe_mkimage: Use consistent indentation
  obmc-init.sh: Fix FS type in mount failure message
  obmc-{init,update}.sh: Cope with alternate RW FS types
  openbmc: Generate images with empty NOR sections in the erased state
  openbmc: Lift mkfs opts to variables and use OVERRIDES capability
  openbmc: Switch RW FS from ext4 to jffs2

Milton D. Miller II (1):
  initfs: Use stty to drain output before reboot

Milton Miller (2):
  initfs: Do not warn on missing jffs2 fsck
  initfs: Add flash clear and update during init

 meta-phosphor/classes/image-overlay.bbclass        |  2 +-
 .../obmc-phosphor-image_types_uboot.bbclass        | 31 +++++++--
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 75 ++++++++++++++++++++--
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |  2 +
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 19 +++++-
 5 files changed, 115 insertions(+), 14 deletions(-)

-- 
2.7.1
