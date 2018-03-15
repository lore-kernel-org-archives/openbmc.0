Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 402HJC4gybzF1DH
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 05:32:26 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au,
	eajames@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] configs/ast: Add redundnant env
Date: Thu, 15 Mar 2018 14:32:02 -0400
Message-Id: <20180315183202.29043-1-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 15 Mar 2018 18:32:28 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Configure ast chips to run redundant u-boot environments.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 include/configs/ast-common.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index eff6d2b529..a0243083bd 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -104,9 +104,12 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
 #define CONFIG_ENV_IS_IN_FLASH		1
 #define CONFIG_ENV_ADDR			(AST_FMC_CS0_BASE + 0x60000)
+#define CONFIG_ENV_ADDR_REDUND		(AST_FMC_CS0_BASE + 0x70000)
 
 #define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
-#define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
+#define CONFIG_ENV_OFFSET_REDUND	0x70000
+#define CONFIG_ENV_SIZE			0x10000	/* Total Size of Environment Sector */
+#define CONFIG_ENV_SIZE_REDUND		0x10000
 
 #define CONFIG_BOOTCOMMAND		"bootm 20080000"
 #define CONFIG_ENV_OVERWRITE
-- 
2.14.3
