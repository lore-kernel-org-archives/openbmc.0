Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rB0292WP8zDq8B
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 17:29:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ATGcyNqJ; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id 2054F31A078;
 Fri, 20 May 2016 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:mime-version:content-type:
 content-transfer-encoding; s=aj.id.au; bh=zuQD33eNmvLFBqLI4Csz6x
 GyztU=; b=ATGcyNqJyUZjybPahUfea77VSHC35pYYIHrzBvGy7lNGNsSroIFON/
 v0z0IgkTXHxj2LUiCnCm5AThCUkUQ8f4t8Dlc/jQtQ1zDr6GpGJ7+I7xtqKdbxYI
 njjlAwWVydYZM9xzx6yIiDOB6koY+BrtfO0hxycfUbE4vCou/psEk=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id CB66131A073;
 Fri, 20 May 2016 00:29:46 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] aspeed_defconfig: Enable SHMEM and TMPFS
Date: Fri, 20 May 2016 16:59:20 +0930
Message-Id: <1463729360-4883-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 20 May 2016 07:29:53 -0000

Without enabling these options we get strange behaviour under qemu,
where it appears uevents aren't generated to create device nodes for
ttyS{0,4,5}. As a consequence we don't receive a getty on the console.

C=C3=A9dric narrowed down the list of options initially at [1],
and with a patch to the qemu timer model[2] we can retain the
CONFIG_NO_HZ_IDLE=3Dy configuration.

[1] https://github.com/openbmc/qemu/issues/4
[2] https://lists.ozlabs.org/pipermail/openbmc/2016-May/003209.html

Cc: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/aspeed_defconfig b/arch/arm/configs/aspeed_=
defconfig
index cd4cdeb07fd9..f08064c64cb2 100644
--- a/arch/arm/configs/aspeed_defconfig
+++ b/arch/arm/configs/aspeed_defconfig
@@ -13,7 +13,7 @@ CONFIG_BLK_DEV_INITRD=3Dy
 # CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
 CONFIG_BPF_SYSCALL=3Dy
-# CONFIG_SHMEM is not set
+CONFIG_SHMEM=3Dy
 # CONFIG_AIO is not set
 CONFIG_EMBEDDED=3Dy
 # CONFIG_COMPAT_BRK is not set
@@ -128,6 +128,9 @@ CONFIG_FIRMWARE_MEMMAP=3Dy
 CONFIG_FANOTIFY=3Dy
 CONFIG_OVERLAY_FS=3Dy
 CONFIG_CONFIGFS_FS=3Dy
+CONFIG_TMPFS=3Dy
+CONFIG_TMPFS_POSIX_ACL=3Dy
+CONFIG_TMPFS_XATTR=3Dy
 CONFIG_JFFS2_FS=3Dy
 CONFIG_JFFS2_SUMMARY=3Dy
 CONFIG_NFS_FS=3Dy
--=20
2.7.4
