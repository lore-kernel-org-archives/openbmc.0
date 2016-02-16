Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489891A0018
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 11:30:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455582623134602.02500970823;
 Mon, 15 Feb 2016 16:30:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/3] Split whitelist into files by package.
Date: Mon, 15 Feb 2016 18:30:19 -0600
Message-Id: <1455582622-9849-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 16 Feb 2016 00:30:26 -0000

The whitelist, a list of files and directories to preserve when updating the file system image, is not maintainable as a single file.  Each package should specify which files it wants saved, and a combined list generated.

This series does the split into files, and has the update work on the combined result.

The work to move the files to other recipes will require further investigation into the build system.

Do we want to differentiate directories from plain files?

milton

https://github.com/openbmc/openbmc/pull/180

Milton D. Miller II (3):
  update: look for whitelist in directory with images
  initfs: use S instead of WORKDIR when installing
  initfs: split whitelist into a directory of files

 .../obmc-phosphor-initfs/files/obmc-init.sh             |  2 +-
 .../obmc-phosphor-initfs/files/obmc-update.sh           | 11 +++++++----
 .../obmc-phosphor-initfs/files/whitelist                |  9 ---------
 .../obmc-phosphor-initfs/files/whitelist.d/dropbear     |  1 +
 .../obmc-phosphor-initfs/files/whitelist.d/events       |  1 +
 .../obmc-phosphor-initfs/files/whitelist.d/networkd     |  1 +
 .../obmc-phosphor-initfs/files/whitelist.d/users        |  4 ++++
 .../obmc-phosphor-initfs/files/whitelist.d/uuid         |  1 +
 .../obmc-phosphor-initfs/obmc-phosphor-init.bb          | 17 +++++++++++------
 9 files changed, 27 insertions(+), 20 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/dropbear
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/events
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/networkd
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/users
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/uuid

-- 
2.7.1
