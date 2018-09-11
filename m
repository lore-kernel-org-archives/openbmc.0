Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428tjZ6LK4zF1nb
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 04:29:22 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2018 11:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,361,1531810800"; d="scan'208,223";a="87876245"
Received: from mauery.jf.intel.com ([10.54.51.74])
 by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2018 11:29:19 -0700
Date: Tue, 11 Sep 2018 11:28:56 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: OpenBMC Development <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] Aspeed FMC to use readX/writeX instead of direct access
Message-ID: <20180911182856.GB21308@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 18:29:23 -0000


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-Aspeed-FMC-should-use-readX-writeX-instead-of-direct.patch"

From 5eb691cc6b19b32722746f997819dbd2252fa5be Mon Sep 17 00:00:00 2001
From: Vernon Mauery <vernon.mauery@linux.intel.com>
Date: Tue, 11 Sep 2018 11:19:20 -0700
Subject: [PATCH] Aspeed FMC to use readX/writeX instead of direct access

The Aspeed FMC driver was using direct register access without using a
volatile pointer, and masking the compiler optimizations by adding in a
udelay after every register access. This patch replaces the direct
register access with readX and writeX calls and removes the delays,
resulting in much more efficient SPI access.

Change-Id: Ifa720a88ed38c615069a714817115e6b020bd0f9
Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
---
 arch/arm/mach-aspeed/flash.c | 229 ++++++++++++++---------------------
 1 file changed, 88 insertions(+), 141 deletions(-)

diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index 907e785d8c..f9f1345523 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -28,6 +28,7 @@
 #include <common.h>
 #include <asm/processor.h>
 #include <asm/byteorder.h>
+#include <asm/io.h>
 #include <environment.h>
 
 #include <asm/arch/ast_scu.h>
@@ -199,7 +200,7 @@ static void reset_flash (flash_info_t * info)
         if (info->dualport)
             ulCtrlData  |= 0x08;
 #endif
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
 }
 
@@ -228,28 +229,22 @@ static void enable_write (flash_info_t * info)
 
         ulCtrlData  = (info->tCK_Write << 8);
         ulCtrlData |= CE_LOW | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-        *(uchar *) (base) = (uchar) (0x06);
-        udelay(10);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
+        writeb(0x06, base);
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_HIGH | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_LOW | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-        *(uchar *) (base) = (uchar) (0x05);
-        udelay(10);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
+        writeb(0x05, base);
         do {
-            jReg = *(volatile uchar *) (base);
+            jReg = readb(base);
         } while (!(jReg & 0x02));
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_HIGH | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
 }
 
@@ -280,30 +275,23 @@ static void write_status_register (flash_info_t * info, uchar data)
 
         ulCtrlData  = (info->tCK_Write << 8);
         ulCtrlData |= CE_LOW | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-        *(uchar *) (base) = (uchar) (0x01);
-        udelay(10);
-        *(uchar *) (base) = (uchar) (data);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
+        writeb(0x01, base);
+        writeb(data, base);
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_HIGH | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_LOW | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-        *(uchar *) (base) = (uchar) (0x05);
-        udelay(10);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
+        writeb(0x05, base);
         do {
-            jReg = *(volatile uchar *) (base);
+            jReg = readb(base);
         } while (jReg & 0x01);
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_HIGH | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 }
 
 static void enable4b (flash_info_t * info)
@@ -330,13 +318,11 @@ static void enable4b (flash_info_t * info)
 
         ulCtrlData  = (info->tCK_Write << 8);
         ulCtrlData |= CE_LOW | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-        *(uchar *) (base) = (uchar) (0xb7);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
+        writeb(0xb7, base);
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_HIGH | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
 } /* enable4b */
 
@@ -366,29 +352,23 @@ static void enable4b_spansion (flash_info_t * info)
 	/* Enable 4B: BAR0 D[7] = 1 */
 	ulCtrlData  = (info->tCK_Write << 8);
 	ulCtrlData |= CE_LOW | USERMODE;
-	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
-	*(uchar *) (base) = (uchar) (0x17);
-	udelay(10);
-	*(uchar *) (base) = (uchar) (0x80);
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
+	writeb(0x17, base);
+	writeb(0x80, base);
 	ulCtrlData &= CMD_MASK;
 	ulCtrlData |= CE_HIGH | USERMODE;
-	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
 
 	ulCtrlData &= CMD_MASK;
 	ulCtrlData |= CE_LOW | USERMODE;
-	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
-	*(uchar *) (base) = (uchar) (0x16);
-	udelay(10);
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
+	writeb(0x16, base);
 	do {
-            jReg = *(volatile uchar *) (base);
+            jReg = readb(base);
 	} while (!(jReg & 0x80));
 	ulCtrlData &= CMD_MASK;
 	ulCtrlData |= CE_HIGH | USERMODE;
-	 *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
 
 } /* enable4b_spansion */
 
@@ -420,14 +400,11 @@ static void enable4b_numonyx (flash_info_t * info)
 	/* Enable 4B: CMD:0xB7 */
 	ulCtrlData  = (info->tCK_Write << 8);
 	ulCtrlData |= CE_LOW | USERMODE;
-	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
-	*(uchar *) (base) = (uchar) (0xB7);
-	udelay(10);
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
+	writeb(0xB7, base);
 	ulCtrlData &= CMD_MASK;
 	ulCtrlData |= CE_HIGH | USERMODE;
-	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
 
 } /* enable4b_numonyx */
 
@@ -463,63 +440,49 @@ static void flash_write_buffer (flash_info_t *info, uchar *src, ulong addr, int
 
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_LOW | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-        *(uchar *) (base) = (uchar) (0x02);
-        udelay(10);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
+        writeb(0x02, base);
         if (info->address32)
         {
-            *(uchar *) (base) = (uchar) ((offset & 0xff000000) >> 24);
-            udelay(10);
+            writeb((uchar) ((offset & 0xff000000) >> 24), base);
         }
-        *(uchar *) (base) = (uchar) ((offset & 0xff0000) >> 16);
-        udelay(10);
-        *(uchar *) (base) = (uchar) ((offset & 0x00ff00) >> 8);
-        udelay(10);
-        *(uchar *) (base) = (uchar) ((offset & 0x0000ff));
-        udelay(10);
+        writeb((uchar) ((offset & 0xff0000) >> 16), base);
+        writeb((uchar) ((offset & 0x00ff00) >> 8), base);
+        writeb((uchar) ((offset & 0x0000ff)), base);
 
         for (j=0; j<len; j++)
         {
-            *(uchar *) (base) = *(uchar *) (src++);
-            udelay(10);
+            writeb(*src++, base);
         }
 
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_HIGH | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_LOW | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
-        *(uchar *) (base) = (uchar) (0x05);
-        udelay(10);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
+        writeb(0x05, base);
         do {
-            jReg = *(volatile uchar *) (base);
+            jReg = readb(base);
         } while ((jReg & 0x01));
         ulCtrlData &= CMD_MASK;
         ulCtrlData |= CE_HIGH | USERMODE;
-        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-        udelay(200);
+        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
         /* RFSR */
         if (info->specificspi == SpecificSPI_N25Q512)
         {
             ulCtrlData &= CMD_MASK;
             ulCtrlData |= CE_LOW | USERMODE;
-            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-            udelay(200);
-            *(uchar *) (base) = (uchar) (0x70);
-            udelay(10);
+            writel(ulCtrlData, info->reg_base + CtrlOffset);
+            writeb(0x70, base);
             do {
-                jReg = *(volatile uchar *) (base);
+                jReg = readb(base);
             } while (!(jReg & 0x80));
             ulCtrlData &= CMD_MASK;
             ulCtrlData |= CE_HIGH | USERMODE;
-            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-            udelay(200);
+            writel(ulCtrlData, info->reg_base + CtrlOffset);
         }
 }
 
@@ -603,57 +566,44 @@ int flash_erase (flash_info_t * info, int s_first, int s_last)
 
                         ulCtrlData &= CMD_MASK;
                         ulCtrlData |= CE_LOW | USERMODE;
-                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-                        udelay(200);
-                        *(uchar *) (base) = (uchar) (0xd8);
-                        udelay(10);
+                        writel(ulCtrlData, info->reg_base + CtrlOffset);
+                        writeb(0xd8, base);
                         if (info->address32)
                         {
-                            *(uchar *) (base) = (uchar) ((offset & 0xff000000) >> 24);
-                            udelay(10);
+                            writeb((uchar) ((offset & 0xff000000) >> 24), base);
                         }
-                        *(uchar *) (base) = (uchar) ((offset & 0xff0000) >> 16);
-                        udelay(10);
-                        *(uchar *) (base) = (uchar) ((offset & 0x00ff00) >> 8);
-                        udelay(10);
-                        *(uchar *) (base) = (uchar) ((offset & 0x0000ff));
-                        udelay(10);
+                        writeb((uchar) ((offset & 0xff0000) >> 16), base);
+                        writeb((uchar) ((offset & 0x00ff00) >> 8), base);
+                        writeb((uchar) ((offset & 0x0000ff)), base);
 
                         ulCtrlData &= CMD_MASK;
                         ulCtrlData |= CE_HIGH | USERMODE;
-                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-                        udelay(200);
+                        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
                         ulCtrlData &= CMD_MASK;
                         ulCtrlData |= CE_LOW | USERMODE;
-                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-                        udelay(200);
-                        *(uchar *) (base) = (uchar) (0x05);
-                        udelay(10);
+                        writel(ulCtrlData, info->reg_base + CtrlOffset);
+                        writeb(0x05, base);
                         do {
-                            jReg = *(volatile uchar *) (base);
+                            jReg = readb(base);
                         } while ((jReg & 0x01));
                         ulCtrlData &= CMD_MASK;
                         ulCtrlData |= CE_HIGH | USERMODE;
-                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-                        udelay(200);
+                        writel(ulCtrlData, info->reg_base + CtrlOffset);
 
                         /* RFSR */
                         if (info->specificspi == SpecificSPI_N25Q512)
                         {
                             ulCtrlData &= CMD_MASK;
                             ulCtrlData |= CE_LOW | USERMODE;
-                            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-                            udelay(200);
-                            *(uchar *) (base) = (uchar) (0x70);
-                            udelay(10);
+                            writel(ulCtrlData, info->reg_base + CtrlOffset);
+                            writeb(0x70, base);
                             do {
-                                jReg = *(volatile uchar *) (base);
+                                jReg = readb(base);
                             } while (!(jReg & 0x80));
                             ulCtrlData &= CMD_MASK;
                             ulCtrlData |= CE_HIGH | USERMODE;
-                            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-                            udelay(200);
+                            writel(ulCtrlData, info->reg_base + CtrlOffset);
                         }
 
 			putc ('.');
@@ -764,22 +714,16 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
 	}
 
 	/* Get Flash ID */
-	ulCtrlData  = *(ulong *) (info->reg_base + CtrlOffset) & CMD_MASK;
+	ulCtrlData  = readl(info->reg_base + CtrlOffset) & CMD_MASK;
 	ulCtrlData |= CE_LOW | USERMODE;
-	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
-	*(uchar *) (vbase) = (uchar) (0x9F);
-	udelay(10);
-	ch[0] = *(volatile uchar *)(vbase);
-	udelay(10);
-	ch[1] = *(volatile uchar *)(vbase);
-	udelay(10);
-	ch[2] = *(volatile uchar *)(vbase);
-	udelay(10);
-	ulCtrlData  = *(ulong *) (info->reg_base + CtrlOffset) & CMD_MASK;
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
+	writeb(0x9F, vbase);
+	ch[0] = readb(vbase);
+	ch[1] = readb(vbase);
+	ch[2] = readb(vbase);
+	ulCtrlData  = readl(info->reg_base + CtrlOffset) & CMD_MASK;
 	ulCtrlData |= CE_HIGH | USERMODE;
-	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
-	udelay(200);
+	writel(ulCtrlData, info->reg_base + CtrlOffset);
 	ulID = ((ulong)ch[0]) | ((ulong)ch[1] << 8) | ((ulong)ch[2] << 16) ;
 	info->flash_id = ulID;
 
@@ -1294,13 +1238,13 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
 
 	if (info->address32) {
 #ifndef AST_SOC_G5
-		reg = *((volatile ulong*) 0x1e6e2070);	/* set H/W Trappings */
+		reg = readl(0x1e6e2070);	/* set H/W Trappings */
 		reg |= 0x10;
-		*((volatile ulong*) 0x1e6e2070) = reg;
+		writel(reg, 0x1e6e2070);
 #endif
-		reg  = *((volatile ulong*) (info->reg_base + 0x4));	/* enable 32b control bit*/
+		reg  = readl(info->reg_base + 0x4);	/* enable 32b control bit*/
 		reg |= (0x01 << info->CE);
-		*((volatile ulong*) (info->reg_base + 0x4)) = reg;
+		writel(reg, info->reg_base + 0x4);
 
 		/* set flash chips to 32bits addressing mode */
 		if ((info->flash_id & 0xFF) == 0x01)	/* Spansion */
@@ -1322,7 +1266,7 @@ unsigned long flash_init (void)
 	unsigned long size = 0;
 	int i;
 
-	*((volatile ulong*) AST_FMC_BASE) |= 0x800f0000;	/* enable Flash Write */
+	writel(readl(AST_FMC_BASE) | 0x800f0000, AST_FMC_BASE);	/* enable Flash Write */
 
 	/* Init: FMC  */
 	/* BANK 0 : FMC CS0 , 1: FMC CS1, */
@@ -1352,7 +1296,7 @@ unsigned long flash_init (void)
 #ifdef CONFIG_SPI0_CS
 	//pin switch by trap[13:12]	-- [0:1] Enable SPI Master
 	ast_scu_spi_master(1);	/* enable SPI master */
-	*((volatile ulong*) AST_FMC_SPI0_BASE) |= 0x10000;	/* enable Flash Write */
+	writel(readl(AST_FMC_SPI0_BASE) | 0x10000, AST_FMC_SPI0_BASE);	/* enable Flash Write */
 	flash_info[CONFIG_FMC_CS].sysspi = 1;
 	flash_info[CONFIG_FMC_CS].reg_base = AST_FMC_SPI0_BASE;
 	flash_info[CONFIG_FMC_CS].flash_id = FLASH_UNKNOWN;
@@ -1403,21 +1347,24 @@ void memmove_dma(void * dest,const void *src,size_t count)
         poll_time = 100;			/* set 100 us as default */
 
         /* force end of burst read */
-	*(volatile ulong *) (AST_FMC_BASE + CS0_CTRL) |= CE_HIGH;
-	*(volatile ulong *) (AST_FMC_BASE + CS0_CTRL) &= ~CE_HIGH;
+	data = readl(AST_FMC_BASE + CS0_CTRL);
+	writel(data |  CE_HIGH, AST_FMC_BASE + CS0_CTRL);
+	writel(data & ~CE_HIGH, AST_FMC_BASE + CS0_CTRL);
 
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_CONTROL) = (ulong) (~FLASH_DMA_ENABLE);
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE) = (ulong) (src);
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE) = (ulong) (dest);
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_LENGTH) = (ulong) (count_align);
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_CONTROL) = (ulong) (FLASH_DMA_ENABLE);
+	writel(~FLASH_DMA_ENABLE, AST_FMC_BASE + REG_FLASH_DMA_CONTROL);
+	writel((ulong)src, AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE);
+	writel((ulong)dest, AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE);
+	writel(count_align, AST_FMC_BASE + REG_FLASH_DMA_LENGTH);
+	writel(FLASH_DMA_ENABLE, AST_FMC_BASE + REG_FLASH_DMA_CONTROL);
 
 	/* wait poll */
 	do {
 		udelay(poll_time);
-		data = *(ulong *) (AST_FMC_BASE + REG_FLASH_INTERRUPT_STATUS);
+		data = readl(AST_FMC_BASE + REG_FLASH_INTERRUPT_STATUS);
 	} while (!(data & FLASH_STATUS_DMA_READY));
 
 	/* clear status */
-	*(ulong *) (AST_FMC_BASE + REG_FLASH_INTERRUPT_STATUS) |= FLASH_STATUS_DMA_CLEAR;
+	data = readl(AST_FMC_BASE + REG_FLASH_INTERRUPT_STATUS);
+	writel(data | FLASH_STATUS_DMA_CLEAR,
+		AST_FMC_BASE + REG_FLASH_INTERRUPT_STATUS);
 }
-- 
2.17.1


--UugvWAfsgieZRqgk--
