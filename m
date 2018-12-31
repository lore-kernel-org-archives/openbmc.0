Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43SsyV731PzDqF0
 for <openbmc@lists.ozlabs.org>; Mon, 31 Dec 2018 20:51:11 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wBV9L46I000541;
 Mon, 31 Dec 2018 11:21:04 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id E1F4562DA4; Mon, 31 Dec 2018 11:51:01 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 v1 4/4] arm: configs: add NPCM7xx ADC and MMIO
 configuration
Date: Mon, 31 Dec 2018 11:50:56 +0200
Message-Id: <20181231095056.86234-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181231095056.86234-1-tmaimon77@gmail.com>
References: <20181231095056.86234-1-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2018 09:51:16 -0000

Add ADC and MMIO configuration to NPCM7xx (Poleg) BMC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/configs/npcm7xx_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/npcm7xx_defconfig b/arch/arm/configs/npcm7xx_defconfig
index f3cefe303a21..15d345a8c99b 100644
--- a/arch/arm/configs/npcm7xx_defconfig
+++ b/arch/arm/configs/npcm7xx_defconfig
@@ -67,6 +67,8 @@ CONFIG_SENSORS_LM75=y
 CONFIG_SENSORS_NPCM7XX=y
 CONFIG_SENSORS_TMP102=y
 CONFIG_WATCHDOG=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_USB_HIDDEV=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
@@ -81,6 +83,9 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_IIO=y
+CONFIG_NPCM_ADC=y
+CONFIG_IIO_MUX=y
+CONFIG_MUX_MMIO=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.14.1
