Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9835B1A07C7
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 14:50:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453434624432492.0791656586679;
 Thu, 21 Jan 2016 19:50:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH linux 3/3] aspeed: update defconfig
Date: Thu, 21 Jan 2016 21:50:21 -0600
Message-Id: <1453434621-22227-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453434621-22227-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453434621-22227-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 03:50:29 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Turn on the new spi memory controller driver, plus some file systems
that will be used on the new mtd.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/configs/aspeed_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/aspeed_defconfig b/arch/arm/configs/aspeed_defconfig
index a83da91..9727eba 100644
--- a/arch/arm/configs/aspeed_defconfig
+++ b/arch/arm/configs/aspeed_defconfig
@@ -57,6 +57,8 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
 CONFIG_MTD_DATAFLASH=y
 CONFIG_MTD_NAND=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_GLUEBI=y
 CONFIG_BLK_DEV_LOOP=y
@@ -170,11 +172,16 @@ CONFIG_PWM=y
 CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
 CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_XATTR=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
-- 
2.6.4
