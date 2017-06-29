Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wz0w973GXzDr2f
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 23:32:57 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 29 Jun 2017 16:32:54 +0300
Received: from r-vnc15.mtr.labs.mlnx (r-vnc15.mtr.labs.mlnx [10.208.0.15])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v5TDWrec013034;
 Thu, 29 Jun 2017 16:32:53 +0300
Received: from r-vnc15.mtr.labs.mlnx (localhost [127.0.0.1])
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4) with ESMTP id v5TDWoKD018037;
 Thu, 29 Jun 2017 16:32:50 +0300
Received: (from c_mykolak@localhost)
 by r-vnc15.mtr.labs.mlnx (8.14.4/8.14.4/Submit) id v5TDWe1t017828;
 Thu, 29 Jun 2017 16:32:40 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10] aspeed-g5: add gpiolib irqchip support.
Date: Thu, 29 Jun 2017 16:32:39 +0300
Message-Id: <20170629133239.17711-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Thu, 29 Jun 2017 13:32:59 -0000

To allow support gpio class infrastructure for Aspeed SOC.
To allow gpio_to_irq conversion.

Enable irqchip and libgpio_irqchip for aspeed-g5.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
 arch/arm/mach-aspeed/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index f3f8c5c658db..e098b7a780ee 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -27,6 +27,9 @@ config MACH_ASPEED_G5
 	depends on ARCH_MULTI_V6
 	select CPU_V6
 	select PINCTRL_ASPEED_G5
+	select GENERIC_IRQ_CHIP
+	select GPIOLIB_IRQCHIP
+
 	help
 	 Say yes if you intend to run on an Aspeed ast2500 or similar
 	 fifth generation Aspeed BMCs.
-- 
2.11.0
