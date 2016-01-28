Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EB2D81A1A70
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 09:50:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454021424528529.1486328158724;
 Thu, 28 Jan 2016 14:50:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 5/8] u-boot : add fw_env.config
Date: Thu, 28 Jan 2016 16:50:16 -0600
Message-Id: <1454021419-16743-6-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 22:50:29 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Add the fw_env.config file to SRC_URI to include it in the build
tree, and update it to point to /dev/mtd2 as 128k, which the
current flash layout.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config    | 3 ++-
 .../meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend           | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
index 9cb3ad2..fe09890 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
@@ -7,11 +7,12 @@
 
 # NOR example
 # MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
-/dev/mtd1		0x0000		0x20000		0x20000
+#/dev/mtd1		0x0000		0x20000		0x20000
 #/dev/mtd2		0x0000		0x4000		0x4000
 
 # MTD SPI-dataflash example
 # MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
+/dev/mtd2		0x00000		0x20000
 #/dev/mtd5		0x4200		0x4200
 #/dev/mtd6		0x4200		0x4200
 
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
index 12fddbf..50adb9f 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
@@ -1,5 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
+SRC_URI += "file://fw_env.config"
 SRC_URI += "file://config.patch"
 
 # Do not install u-boot in rootfs
-- 
2.6.4
