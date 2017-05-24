Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wXxCN5PktzDqcg
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 01:29:35 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 24 May 2017 18:29:28 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v4OFTSD6017688;
 Wed, 24 May 2017 18:29:28 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] Add WD2 reset support for
 ast-g5
Date: Wed, 24 May 2017 18:28:20 +0300
Message-Id: <20170524152820.43150-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Wed, 24 May 2017 15:29:38 -0000

Add support for WATCHDOG_RESET macro for aspeed g5 boards

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 board/aspeed/ast-g5/ast-g5.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
index da79d7b79a..412b632a41 100644
--- a/board/aspeed/ast-g5/ast-g5.c
+++ b/board/aspeed/ast-g5/ast-g5.c
@@ -46,3 +46,17 @@ int board_eth_init(bd_t *bd)
         return aspeednic_initialize(bd);
 }
 #endif
+
+/*Called by macro WATCHDOG_RESET*/
+#if defined(CONFIG_HW_WATCHDOG)
+
+#define AST_WDT2_RESTART_REG 0x28 /*WDT2 Counter Restart Register*/
+#define AST_WDT2_RESTART_SET 0x4755 /*WDT2 Restart Counter programming value*/
+
+void hw_watchdog_reset(void)
+{
+	/*restart WD2 timer*/
+	writel(AST_WDT2_RESTART_SET, AST_BASE_WD | AST_WDT2_RESTART_REG);
+}
+
+#endif /* CONFIG_WATCHDOG */
-- 
2.11.0
