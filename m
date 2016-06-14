Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTgkz5nHvzDqgn
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 06:11:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465935061380957.890121442464;
 Tue, 14 Jun 2016 13:11:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Xo Wang <xow@google.com>
Subject: [PATCH u-boot] aspeed/ast-g5: Simplify default bootargs
Date: Tue, 14 Jun 2016 15:10:58 -0500
Message-Id: <20160614201058.18555-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160614201058.18555-1-openbmc-patches@stwcx.xyz>
References: <20160614201058.18555-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 20:11:08 -0000

From: Xo Wang <xow@google.com>

New arguments set default console for DEBUG_UART on the EVB and allow
the kernel to choose init path, root/overlay, and memory size.

Change-Id: I919f7e4027968ad000c4283f8bd80cca1b17e2eb
Google-Bug-Id: 28535971
Signed-off-by: Xo Wang <xow@google.com>
---
 include/configs/ast-g5.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h
index 6c05e6d..149cac8 100644
--- a/include/configs/ast-g5.h
+++ b/include/configs/ast-g5.h
@@ -139,7 +139,7 @@
 
 #define CONFIG_SYS_LOAD_ADDR		0x83000000	/* default load address */
 
-#define CONFIG_BOOTARGS		"console=ttyS0,115200n8 ramdisk_size=16384 root=/dev/ram rw init=/linuxrc mem=80M"
+#define CONFIG_BOOTARGS		"console=ttyS4,115200 earlyprintk"
 
 /* ------------------------------------------------------------------------- */
 
-- 
2.8.4
