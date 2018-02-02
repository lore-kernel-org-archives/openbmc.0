Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXhkM352NzDqkY
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 14:07:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Cc: andrew@aj.id.au,
	raltherr@google.com,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed: un-hardcode FIT
 configuration selection
Date: Thu,  1 Feb 2018 22:07:25 -0500
Message-Id: <20180202030725.11771-1-bradleyb@fuzziesquirrel.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 03:07:55 -0000

Rely on the FDT parser to select a FIT config when looking for a
ramdisk_conf.  This allows image builders to use arbitrary configuration
names like /configurations/conf@foo.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 include/configs/ast-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index 89b0cd8533..fbae281811 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -110,7 +110,7 @@
 
 #define CONFIG_BOOTCOMMAND	\
 	"fdt addr 20080000; " \
-	"if fdt get value ramdisk_conf /configurations/conf@1 ramdisk; then " \
+	"if fdt get value ramdisk_conf /configurations/conf ramdisk; then " \
 	"    bootm 20080000; else bootm 20080000 20300000; " \
 	"fi"
 #define CONFIG_ENV_OVERWRITE
-- 
2.14.3
