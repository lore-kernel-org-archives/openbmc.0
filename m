Return-Path: <clg@kaod.org>
X-Greylist: delayed 1024 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Sep 2016 16:49:53 AEST
Received: from 9.mo177.mail-out.ovh.net (9.mo177.mail-out.ovh.net
 [46.105.72.238])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZTYY0ssszDsWk
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 16:49:53 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 597831000EDC
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 08:32:45 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 286E9240068;
 Thu, 15 Sep 2016 08:32:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH linux dev-4.7 2/6] ARM: aspeed: remove previous
 definitions in default config
Date: Thu, 15 Sep 2016 08:32:22 +0200
Message-Id: <1473921146-19509-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473921146-19509-1-git-send-email-clg@kaod.org>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4651373992720042754
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
X-List-Received-Date: Thu, 15 Sep 2016 06:49:53 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/configs/aspeed_g4_defconfig | 1 -
 arch/arm/configs/aspeed_g5_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 5cc4d4121462..fab53889b2cc 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -60,7 +60,6 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_ASPEED_BT_IPMI_HOST=y
 CONFIG_EEPROM_AT24=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_ARC is not set
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index d19cf3b498cf..3ccc91db96e3 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -62,7 +62,6 @@ CONFIG_MTD_BLOCK=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_ASPEED_BT_IPMI_HOST=y
 CONFIG_EEPROM_AT24=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_ARC is not set
-- 
2.7.4
