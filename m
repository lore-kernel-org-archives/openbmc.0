Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjkrH1tJ4zF1QB
 for <openbmc@lists.ozlabs.org>; Sat, 17 Feb 2018 07:14:22 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	ralther@google.com,
	andrew@aj.id.au
Subject: [PATCH u-boot v2016.07-aspeed-openbmc v2] aspeed: Drop bootcmd
 support for legacy images
Date: Fri, 16 Feb 2018 15:14:01 -0500
Message-Id: <20180216201401.2703-1-bradleyb@fuzziesquirrel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 20:14:23 -0000

Assume booting from a FIT image by default.  This allows image builders
to use arbitrary configuration names like
/configurations/conf@foo.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v2: 
 - Reworked to drop legacy image support entirely.
 - Updated commit message accordingly.

 include/configs/ast-common.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 89b0cd8533..eff6d2b529 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -108,11 +108,7 @@
 #define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
 #define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
 
-#define CONFIG_BOOTCOMMAND	\
-	"fdt addr 20080000; " \
-	"if fdt get value ramdisk_conf /configurations/conf@1 ramdisk; then " \
-	"    bootm 20080000; else bootm 20080000 20300000; " \
-	"fi"
+#define CONFIG_BOOTCOMMAND		"bootm 20080000"
 #define CONFIG_ENV_OVERWRITE
 
 #define ASPEED_ENV_SETTINGS \
-- 
2.14.3
