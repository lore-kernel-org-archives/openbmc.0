Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHkVF0j9hzDqN1
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 01:40:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464536433744754.5919122969194;
 Sun, 29 May 2016 08:40:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3] Build adm1275 driver into linux kernel by default
Date: Sun, 29 May 2016 10:40:31 -0500
Message-Id: <20160529154031.19962-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160529154031.19962-1-openbmc-patches@stwcx.xyz>
References: <20160529154031.19962-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 29 May 2016 15:40:37 -0000

From: Yi Li <adamliyi@msn.com>

Barreleye requires adm1278 driver be built into kernel.
Add config to defconfig, instead of hwmon.cfg.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 .../meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
index 2b7d6e8..d2266e9 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
@@ -134,6 +134,9 @@ CONFIG_SPI=y
 CONFIG_DEBUG_PINCTRL=y
 CONFIG_GPIO_ASPEED=y
 CONFIG_SENSORS_POWER8_OCC_I2C=y
+CONFIG_PMBUS=y
+CONFIG_SENSORS_PMBUS=y
+CONFIG_SENSORS_ADM1275=y
 CONFIG_WATCHDOG=y
 CONFIG_ASPEED_24xx_WATCHDOG=y
 CONFIG_SSB=y
-- 
2.8.3
