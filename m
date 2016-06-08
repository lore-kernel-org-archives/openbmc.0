Return-Path: <clg@kaod.org>
Received: from 4.mo178.mail-out.ovh.net (4.mo178.mail-out.ovh.net
 [46.105.49.171])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPvsd2ZkszDvZp
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 03:03:49 +1000 (AEST)
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 9789B1000ABE
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 18:47:11 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id B9A8E52006F;
 Wed,  8 Jun 2016 18:47:08 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] aspeed_defconfig: add extra configs  
Date: Wed,  8 Jun 2016 18:46:56 +0200
Message-Id: <1465404416-19067-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5480599274625862402
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrjeefgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 08 Jun 2016 17:03:49 -0000

To support lzma compressed ramfs and some aspeed devices.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/configs/aspeed_g5_defconfig |   10 ++++++++++
 1 file changed, 10 insertions(+)

Index: linux-shenki-4.7.git/arch/arm/configs/aspeed_g5_defconfig
===================================================================
--- linux-shenki-4.7.git.orig/arch/arm/configs/aspeed_g5_defconfig
+++ linux-shenki-4.7.git/arch/arm/configs/aspeed_g5_defconfig
@@ -102,3 +102,13 @@ CONFIG_CRYPTO_ECHAINIV=y
 # CONFIG_XZ_DEC_POWERPC is not set
 # CONFIG_XZ_DEC_IA64 is not set
 # CONFIG_XZ_DEC_SPARC is not set
+CONFIG_KERNEL_LZMA=y
+CONFIG_RD_LZMA=y
+CONFIG_MTD=y
+CONFIG_SHMEM=y
+CONFIG_TMPFS=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_OF_MTD=y
+CONFIG_ASPEED_FLASH_SPI=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_ASPEED_BT_IPMI_HOST=y
