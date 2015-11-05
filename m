Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 869A51A0C92
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 13:40:01 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144669119083528.415930748888854;
 Wed, 4 Nov 2015 18:39:50 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] linux-ombc: Fixes for i2c bus & device drivers
Date: Wed,  4 Nov 2015 20:39:47 -0600
Message-Id: <1446691187-32148-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446691187-32148-1-git-send-email-patches@stwcx.xyz>
References: <1446691187-32148-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 02:40:02 -0000

From: Jeremy Kerr <jk@ozlabs.org>

We have an update for the kernel, containing fixes for the i2c subsystem.
This includes a defconfig update.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 .../meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig | 3 ---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb            | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
index 64abc65..64f097d 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
@@ -125,9 +125,6 @@ CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_SLAVE_EEPROM=y
-CONFIG_I2C_DEBUG_CORE=y
-CONFIG_I2C_DEBUG_ALGO=y
-CONFIG_I2C_DEBUG_BUS=y
 CONFIG_SPI=y
 CONFIG_DEBUG_PINCTRL=y
 CONFIG_GPIO_ASPEED=y
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
