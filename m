Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9DEED1A1054
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 09:50:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454021421091610.2463366464274;
 Thu, 28 Jan 2016 14:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/8] update kernel defconfig
Date: Thu, 28 Jan 2016 16:50:12 -0600
Message-Id: <1454021419-16743-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 22:50:27 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Turn on the new spi-nor and occ drivers.  Also add file system
support for the initial filesystem layout.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
index 64f097d..998323c 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
@@ -60,6 +60,8 @@ CONFIG_MTD_DATAFLASH=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_GLUEBI=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=4
@@ -128,6 +130,7 @@ CONFIG_I2C_SLAVE_EEPROM=y
 CONFIG_SPI=y
 CONFIG_DEBUG_PINCTRL=y
 CONFIG_GPIO_ASPEED=y
+CONFIG_SENSORS_POWER8_OCC_I2C=y
 CONFIG_WATCHDOG=y
 CONFIG_ASPEED_24xx_WATCHDOG=y
 CONFIG_SSB=y
@@ -169,12 +172,15 @@ CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_AUTOFS4_FS=y
+CONFIG_OVERLAY_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
 CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
-- 
2.6.4
