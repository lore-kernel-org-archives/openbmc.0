Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 732691A0B18
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218032879455.74998146507187;
 Tue, 15 Dec 2015 14:20:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH linux 2/3] aspeed: add spi nor to aspeed_defconfig
Date: Tue, 15 Dec 2015 16:20:29 -0600
Message-Id: <1450218030-11874-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218030-11874-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218030-11874-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:38 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Enable the new spi-nor mtd driver.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/configs/aspeed_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/aspeed_defconfig b/arch/arm/configs/aspeed_defconfig
index a83da91..adb054a 100644
--- a/arch/arm/configs/aspeed_defconfig
+++ b/arch/arm/configs/aspeed_defconfig
@@ -57,6 +57,8 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
 CONFIG_MTD_DATAFLASH=y
 CONFIG_MTD_NAND=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_GLUEBI=y
 CONFIG_BLK_DEV_LOOP=y
-- 
2.6.3
