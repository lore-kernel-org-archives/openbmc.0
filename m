Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 33A951A0191
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 09:00:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454968827861104.25695723679996;
 Mon, 8 Feb 2016 14:00:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] linux: turn on vuart driver
Date: Mon,  8 Feb 2016 16:00:25 -0600
Message-Id: <1454968825-7310-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454968825-7310-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454968825-7310-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 08 Feb 2016 22:00:33 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Enable the vuart driver in the defconfig.

Based on the update to aspeed_defconfig in the linux repository.

Won't actually be enabled until the base recipe has the driver
merged again.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
index 998323c..2b7d6e8 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
@@ -122,6 +122,9 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_DMA is not set
 CONFIG_SERIAL_8250_NR_UARTS=6
 CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_ASPEED_VUART=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C=y
-- 
2.6.4
