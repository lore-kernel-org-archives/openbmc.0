Return-Path: <clg@kaod.org>
X-Greylist: delayed 1618 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Oct 2016 18:06:42 AEDT
Received: from 5.mo68.mail-out.ovh.net (5.mo68.mail-out.ovh.net
 [46.105.62.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3h025l3lzDvHb
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 18:06:42 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id C575F58B4
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 08:58:03 +0200 (CEST)
Received: from hermes.kaod.org.com (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id AA172180085;
 Wed, 26 Oct 2016 08:58:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 2/8] ARM: aspeed: remove previous definitions in
 default config
Date: Wed, 26 Oct 2016 08:57:41 +0200
Message-Id: <1477465067-19034-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477465067-19034-1-git-send-email-clg@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6051430526436477698
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrieekgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 26 Oct 2016 07:06:43 -0000

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
