Return-Path: <andrew@aj.id.au>
Received: from homiemail-a101.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 394F51A033A
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 18:53:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=wE9LAW7q; 
 dkim-atps=neutral
Received: from homiemail-a101.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTP id 0E3D6117E06A
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 23:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id; s=aj.id.au; bh=7+n4Zp1mE6KED70p+wkc7C7
 maZU=; b=wE9LAW7q91kIcHd7WBS0XwQRtNxS6D2241GF//ot7sLBdsDaWgi+Mrv
 g/ulewAsUyOYJtgGKoAijNbE8+hSOs4LwEuxj0pQ4RdSXnv1k6UJVfkKrXu8qgoo
 8af2l0HVB5RUi6+JUTNuAx/VBxoD5Qminr5sLlJRtcwNVIRblMr4=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTPSA id 68C43117E065
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 23:53:37 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH] openbmc: Use JFFS2 for RW overlay filesystem
Date: Mon, 15 Feb 2016 18:23:27 +1030
Message-Id: <1455522808-22864-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 15 Feb 2016 07:53:41 -0000

The patch under the cover shouldn't be applied yet - it requires Milton's
kernel work-around to talk to the spi-nor through string io accessors before
it's functional (otherwise you'll get a corrupt filesystem on reboot - you've
been warned). However, the patch implements the necessary bits and pieces to
generate a JFFS2 filesystem as part of the bitbake process.

I've tested the patch with Milton's patch applied and it seems functional.
Posted it to get some feedback or for Milton to take over :)

Note: The execution paths for alternate filesystems (using /dev/mtdblock*)
hasn't yet been tested.

Andrew Jeffery (1):
  openbmc: Use JFFS2 for RW overlay filesystem

 meta-phosphor/classes/image-overlay.bbclass        |  3 ++-
 meta-phosphor/classes/obmc-phosphor-image.bbclass  |  2 ++
 .../obmc-phosphor-image_types_uboot.bbclass        | 12 ++++++++++--
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 22 +++++++++++++++-------
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 13 +++++++++----
 5 files changed, 38 insertions(+), 14 deletions(-)

-- 
2.5.0
