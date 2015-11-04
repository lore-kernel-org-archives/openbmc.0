Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411621A027B
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:37:53 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446654803424125.18301062237947;
 Wed, 4 Nov 2015 08:33:23 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] linux-ombc: Fixes for i2c bus & device drivers
Date: Wed,  4 Nov 2015 10:32:21 -0600
Message-Id: <1446654741-4367-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446654741-4367-1-git-send-email-patches@stwcx.xyz>
References: <1446654741-4367-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:37:56 -0000

From: Jeremy Kerr <jk@ozlabs.org>

We have an update for the kernel, containing fixes for the i2c subsystem.
This includes a defconfig update.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 .../meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig           | 5 ++---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb          | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
index 64abc65..5899b6c 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
@@ -65,6 +65,7 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_ASPEED_BT_IPMI_HOST=y
+CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_93CX6=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
@@ -125,12 +126,10 @@ CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_SLAVE_EEPROM=y
-CONFIG_I2C_DEBUG_CORE=y
-CONFIG_I2C_DEBUG_ALGO=y
-CONFIG_I2C_DEBUG_BUS=y
 CONFIG_SPI=y
 CONFIG_DEBUG_PINCTRL=y
 CONFIG_GPIO_ASPEED=y
+CONFIG_SENSORS_TMP421=y
 CONFIG_WATCHDOG=y
 CONFIG_ASPEED_24xx_WATCHDOG=y
 CONFIG_SSB=y
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
index 3284fda..1d8106d 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.2"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20151102-1"
+SRCREV="openbmc-20151104-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.6.0
