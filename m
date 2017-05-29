Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wbrhS1DnMzDq9m
 for <openbmc@lists.ozlabs.org>; Mon, 29 May 2017 19:16:23 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 29 May 2017 12:16:16 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v4T9GGYh005088;
 Mon, 29 May 2017 12:16:16 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10 v3] ARM: aspeed: Add Mellanox MSN machine
 (defconfig)
Date: Mon, 29 May 2017 12:16:15 +0300
Message-Id: <20170529091615.54310-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Mon, 29 May 2017 09:16:25 -0000

Initial introduction of Mellanox switches of MSNXXXX family equipped
with Aspeed 2520 BMC SoC. This adds defconfig changes.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
v1->v2
Fixed issues pointed out by Joel:
- Make commit title shorter.
- Replace flash layout from separate dtsi to dts.
- Change compatible = "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
- Remove no-hw-checksum from dts.
- Add comments.
- Remove WD2 disable from aspeed.c
- Add wdt2 to dts.

v2->v3
- Split v2 patch into three separate.
---
 arch/arm/configs/aspeed_g5_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 25332b07d887..3fc3eb0e8867 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -141,6 +141,7 @@ CONFIG_SENSORS_ADM1275=y
 CONFIG_SENSORS_IR35221=y
 CONFIG_SENSORS_LM25066=y
 CONFIG_SENSORS_UCD9000=y
+CONFIG_SENSORS_UCD9200=y
 CONFIG_SENSORS_TMP421=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
@@ -165,6 +166,7 @@ CONFIG_MAILBOX=y
 CONFIG_ASPEED_LPC_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
+CONFIG_MAX1363=y
 CONFIG_ASPEED_ADC=y
 CONFIG_BMP280=y
 CONFIG_FSI=y
-- 
2.11.0
