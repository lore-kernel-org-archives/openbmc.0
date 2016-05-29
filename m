Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHkGp3QctzDqDD
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 01:30:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464535836513737.478656193632;
 Sun, 29 May 2016 08:30:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Build adm1275 driver into linux kernel by default
Date: Sun, 29 May 2016 10:30:34 -0500
Message-Id: <20160529153034.19571-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160529153034.19571-1-openbmc-patches@stwcx.xyz>
References: <20160529153034.19571-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 29 May 2016 15:30:43 -0000

From: Yi Li <adamliyi@msn.com>

Barreleye requires adm1278 driver be built into kernel.
Add config to defconfig, instead of hwmon.cfg.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 .../meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
index 053fea3..0a61ee8 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
@@ -2,3 +2,6 @@ CONFIG_HWMON=y
 CONFIG_SENSORS_NCT7904=y
 CONFIG_SENSORS_LM75=y
 CONFIG_EEPROM_AT24=y
+CONFIG_PMBUS=y
+CONFIG_SENSORS_PMBUS=y
+CONFIG_SENSORS_ADM1275=y
-- 
2.8.3
