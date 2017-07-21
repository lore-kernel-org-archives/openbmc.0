Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDlt82Zy7zDqyQ
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 08:33:52 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1500676427418893.4154731951277;
 Fri, 21 Jul 2017 15:33:47 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 1/1] config/ast-common: hack bootopts
Date: Fri, 21 Jul 2017 17:33:26 -0500
Message-Id: <20170721223326.28674-2-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170721223326.28674-1-patrick@stwcx.xyz>
References: <20170721223326.28674-1-patrick@stwcx.xyz>
X-ZohoMailClient: External
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jul 2017 22:33:53 -0000

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 include/configs/ast-common.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 110c780070..6f2a50b854 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -84,7 +84,10 @@
 #define CONFIG_SYS_MAXARGS		16
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
 
+#if 0
 #define CONFIG_BOOTARGS			"console=ttyS4,115200n8 root=/dev/ram rw"
+#endif
+#define CONFIG_BOOTARGS                         "console=ttyS4,115200n8 root=/dev/mtdblock4 ro"
 
 #define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
 #define CONFIG_FMC_CS			1
@@ -96,11 +99,14 @@
 #define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
 #define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
 
+#if 0
 #define CONFIG_BOOTCOMMAND	\
 	"fdt addr 20080000; " \
 	"if fdt get value ramdisk_conf /configurations/conf@1 ramdisk; then " \
 	"    bootm 20080000; else bootm 20080000 20300000; " \
 	"fi"
+#endif
+#define CONFIG_BOOTCOMMAND                      "fdt addr 20080000; bootm 20080000"
 #define CONFIG_ENV_OVERWRITE
 
 #define ASPEED_ENV_SETTINGS \
-- 
2.13.0
