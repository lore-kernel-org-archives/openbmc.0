Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 2F7351A0018
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2016 18:27:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=vAg1yeqy; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 16B672B206D;
 Tue, 16 Feb 2016 23:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id; s=aj.id.au; bh=1Qc4kPhvr4yV/C/sviaZeLc
 x51U=; b=vAg1yeqyFGqyOrE8XNZ+J5iPI1c89y3lh2Z4+egJ417Pde9Th9X2BfW
 c4xZm1NQkxfS/e2RpuKsoIn6drw+UM6hl2cAjCFu50bkY2Lk13ErFh1MUO1PQhZ1
 KEFgmqCd2ASKjwdOy1wcgr0i7ZPXTc7qESz/aqX9wC9TiEA7akkE=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 4046D2B206A;
 Tue, 16 Feb 2016 23:27:25 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH v2 0/2] openbmc: Use JFFS2 for RW overlay filesystem
Date: Wed, 17 Feb 2016 17:57:16 +1030
Message-Id: <1455694038-29771-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 17 Feb 2016 07:27:27 -0000

Hopefully less convoluted this time! I've (re)boot tested the JFFS2 image with
success, and I've tested generation of an ext4 RW filesystem as well but
haven't flashed it (binwalk claims that a ext filesystem was created).

Since v1:

  Address comments from Milton:

  * Drop mtd-utils-jffs2 for busybox-provided functionality
  * Drop re-arrangement of variables in obmc-{init,update}.sh
  * Simplify generation of image-rwfs
  * Move hard-coded ext4 mkfs options to (commented) options variable
  * Split out mount message fix

Andrew Jeffery (2):
  obmc-init.sh: Fix FS type in mount failure message
  openbmc: Use JFFS2 for RW overlay filesystem

 meta-phosphor/classes/image-overlay.bbclass                |  7 ++++++-
 .../classes/obmc-phosphor-image_types_uboot.bbclass        | 14 ++++++++++++--
 .../obmc-phosphor-initfs/files/obmc-init.sh                |  4 ++--
 .../obmc-phosphor-initfs/files/obmc-update.sh              |  2 +-
 4 files changed, 21 insertions(+), 6 deletions(-)

-- 
2.5.0
