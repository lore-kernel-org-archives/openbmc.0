Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wfJWT6t0hzDqLt
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 19:17:09 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 2 Jun 2017 12:17:03 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v529H3Bu002217;
 Fri, 2 Jun 2017 12:17:03 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5 change
 configuration order to allow 2-nd boot
Date: Fri,  2 Jun 2017 12:17:01 +0300
Message-Id: <20170602091701.189794-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Fri, 02 Jun 2017 09:17:11 -0000

Add configuration for FIRMWARE_2ND_BOOT.
Change SYS_CONFIG_NAME default order to use ast-g5-ncsi-2boot
if FIRMWARE_2ND_BOOT is set.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 board/aspeed/ast-g5/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/board/aspeed/ast-g5/Kconfig b/board/aspeed/ast-g5/Kconfig
index 0a8b38b9db..f5613ac297 100644
--- a/board/aspeed/ast-g5/Kconfig
+++ b/board/aspeed/ast-g5/Kconfig
@@ -15,9 +15,13 @@ config SYS_VENDOR
 config SYS_SOC
 	default "aspeed"
 
+config FIRMWARE_2ND_BOOT
+	bool "Firmware second boot WD2 enable."
+	default n
+
 config SYS_CONFIG_NAME
 	default "ast-g5-phy" if ASPEED_NET_PHY
-	default "ast-g5-ncsi" if ASPEED_NET_NCSI
 	default "ast-g5-ncsi-2boot" if ASPEED_NET_NCSI && FIRMWARE_2ND_BOOT
+	default "ast-g5-ncsi" if ASPEED_NET_NCSI
 
 endif
-- 
2.11.0
