Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 69F961A04BF
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 01:45:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=gVQTun3Q; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id C6F9D458085;
 Tue, 23 Feb 2016 06:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id; s=aj.id.au; bh=NSCJNs+Xbq1l+TKu6jR/W+1
 JRCQ=; b=gVQTun3QqyH/9BuJ/K0cPPWXl01YFDCQ8p2YX5wBJ1EhKTJt64CBH7h
 HhhDTQ9LMRTYTYFA4GSxAKuazNcx7VfWg6oWdSKspCfs047TJSFz2mcp3VUWm2ae
 9yY16R97rG5hkJKvf29V+kNvWFyWXgus4sEIRnOGjY8DxQQ5Ebag=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 11129458081;
 Tue, 23 Feb 2016 06:45:13 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 0/6] openbmc: Use JFFS2 for RW overlay filesystem
Date: Wed, 24 Feb 2016 01:14:57 +1030
Message-Id: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
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
X-List-Received-Date: Tue, 23 Feb 2016 14:45:18 -0000

The changes now include support for migrating between arbitrary^ filesystem
types (tested back and forth between ext4 and jffs2). The final patch in the
series switches the RWFS image to JFFS2. Lastly, a couple of clean-ups are
thrown in.

NOTE: This series requires the (pending) kernel fix for the spi-nor driver, and
is why I haven't done this as a pull-request. The fix has been applied to
openbmc/linux but is not yet integrated into openbmc/openbmc. If you'd like to
test this series I've added an extra patch which hacks the fix in. You can
fetch it all from github:

    git fetch git@github.com:amboar/openbmc.git jffs2-mtd6

Upgrading the BMC should be done in two stages after building the necessary
images:

1. Build image-kernel, image-initramfs and image-rwfs
2. Apply image-kernel and image-initramfs, and after the reboot,
3. Apply image-rwfs

To apply an image file, copy the it into /run/initramfs on the BMC, then reboot
(the BMC).

^ Migration is limited to filesystems detected by blkid(1), and JFFS2. JFFS2 is
  assumed if the filesystem is not identified by blkid(1).

Since v2:

  * Minor whitespace changes for consistency

  Address further suggestions from Milton:

  * Support migration with RW FS type detection in obmc-{init,update}.sh
  * Use bitbake OVERRIDES support for mkfs options
  * Pre-fill images with 0xFF to set NOR to erased state

Since v1:

  Address comments from Milton:

  * Drop mtd-utils-jffs2 for busybox-provided functionality
  * Drop re-arrangement of variables in obmc-{init,update}.sh
  * Simplify generation of image-rwfs
  * Move hard-coded ext4 mkfs options to (commented) options variable
  * Split out mount message fix

Andrew Jeffery (6):
  oe_mkimage: Use consistent indentation
  obmc-init.sh: Fix FS type in mount failure message
  obmc-{init,update}.sh: Cope with alternate RW FS types
  openbmc: Generate images that erase empty NOR sections
  openbmc: Lift mkfs opts to variables and use OVERRIDES capability
  openbmc: Switch RW FS from ext4 to jffs2

 meta-phosphor/classes/image-overlay.bbclass        |  2 +-
 .../obmc-phosphor-image_types_uboot.bbclass        | 29 +++++++++++++++++-----
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 17 +++++++++++--
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 18 +++++++++++---
 4 files changed, 54 insertions(+), 12 deletions(-)

-- 
2.5.0
