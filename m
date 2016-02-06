Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D8B771A0193
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2016 11:20:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454718030650491.6318047943291;
 Fri, 5 Feb 2016 16:20:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/7] initfs: check and auto-repair read/write file
 system
Date: Fri,  5 Feb 2016 18:20:22 -0600
Message-Id: <1454718029-3441-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 06 Feb 2016 00:20:36 -0000

This series if patches to the obmc init and shutdown scripts adds several features, including

Run fsck on the read write filesystem before mounting.
More information on what to do and options when init fails
Consistent location of update  images even during init repair cases

Plus these developer features
All mount arguments consolidated into variables
Clean unmount when testing rofs image in RAM (/run filesystem)
Other clean ups

I've done basic testing on my system but have only done light testing with the final cleanups.
It appears that the current obmc-phosphor-image is picking up e2fsutils-fsck already.

https://github.com/openbmc/openbmc/pull/165

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
