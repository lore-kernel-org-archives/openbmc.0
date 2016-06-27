Return-Path: <clg@kaod.org>
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
 [46.105.36.172])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdR7y6Qx4zDq5f
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 21:11:10 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 3F0ADFF99C2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 10:43:40 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 07B3924006B;
 Mon, 27 Jun 2016 10:43:37 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc/v2016.05-ast2500] aspeed: fix
 compile warning in memmove_dma()
Date: Mon, 27 Jun 2016 10:43:28 +0200
Message-Id: <1467017008-18792-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16662192725152860930
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddugddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 27 Jun 2016 11:11:11 -0000

arch/arm/mach-aspeed/flash.c: In function 'memmove_dma':
arch/arm/mach-aspeed/flash.c:1390:55: warning: assignment makes integer from pointer without a cast [enabled by default]
  *(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE) = (ulong *) (src);
                                                       ^
arch/arm/mach-aspeed/flash.c:1391:54: warning: assignment makes integer from pointer without a cast [enabled by default]
  *(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE) = (ulong *) (dest);
                                                      ^
There is no need to cast with a pointer type. memmove_dma() is not used
today but let's keep it as this is a supported feature we could use.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/mach-aspeed/flash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index 51db87261d53..9c5ead6fd7ae 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -1387,8 +1387,8 @@ void memmove_dma(void * dest,const void *src,size_t count)
 	*(volatile ulong *) (AST_FMC_BASE + CS0_CTRL) &= ~CE_HIGH;
 
 	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_CONTROL) = (ulong) (~FLASH_DMA_ENABLE);
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE) = (ulong *) (src);
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE) = (ulong *) (dest);
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE) = (ulong) (src);
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE) = (ulong) (dest);
 	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_LENGTH) = (ulong) (count_align);
 	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_CONTROL) = (ulong) (FLASH_DMA_ENABLE);
 
-- 
2.1.4
