Return-Path: <clg@kaod.org>
Received: from 10.mo177.mail-out.ovh.net (10.mo177.mail-out.ovh.net
 [46.105.73.133])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZTYV48FjzDsWk
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 16:49:50 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id B4FA21000ED6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 08:32:58 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 83A81240067;
 Thu, 15 Sep 2016 08:32:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH linux dev-4.7 5/6] ARM: aspeed: Add defconfigs for
 CONFIG_ASPEED_BT_IPMI_BMC
Date: Thu, 15 Sep 2016 08:32:25 +0200
Message-Id: <1473921146-19509-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473921146-19509-1-git-send-email-clg@kaod.org>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4655033166919994114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrjeeggddutdekucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 15 Sep 2016 06:49:51 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/configs/aspeed_g4_defconfig | 2 ++
 arch/arm/configs/aspeed_g5_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index fab53889b2cc..5a1281257a49 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -100,6 +100,8 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=6
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_IPMI_HANDLER=y
+CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_SERIAL_ASPEED_VUART=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 3ccc91db96e3..dd171ac90bbd 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -102,6 +102,8 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=6
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_IPMI_HANDLER=y
+CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_SERIAL_ASPEED_VUART=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-- 
2.7.4
