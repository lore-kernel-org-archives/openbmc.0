Return-Path: <clg@kaod.org>
Received: from mo1.mail-out.ovh.net (mo1.mail-out.ovh.net [178.32.228.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDK5502VkzDvWV
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 19:26:00 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D827317168
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 09:16:14 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 99FFA2600B3;
 Wed,  9 Nov 2016 09:16:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.7 7/7] mtd: spi-nor: aspeed: rework io routines
Date: Wed,  9 Nov 2016 09:15:43 +0100
Message-Id: <1478679343-25354-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478679343-25354-1-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15802568144446458626
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleekgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 09 Nov 2016 08:26:01 -0000

The io accessors from pflash are shorter and simpler.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---

 Changes since v1:

 - renamed the routine

 drivers/mtd/spi-nor/aspeed-smc.c | 112 +++++++++++++--------------------------
 1 file changed, 38 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 231d4bda4e97..d3bed34f5aa0 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -65,84 +65,48 @@ module_param(dma_timeout, uint, 0644);
  * the memory buffer pointer and count via explicit code. The final updates
  * to len are optimistically suppressed.
  */
-
-static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop, size_t len)
+static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
+				    size_t len)
 {
-	if (!len)
-		return;
-
-	/* Expect a 4 byte input port.  Otherwise just read bytes. */
-	if (unlikely((unsigned long)iop & 3)) {
-		while (len--) {
-			*(u8 *)buf = readb(iop);
-			buf++;
+	if ((((unsigned long) src | (unsigned long) buf | len) & 3) == 0) {
+		while (len > 3) {
+			*(u32 *) buf = readl(src);
+			buf += 4;
+			src += 4;
+			len -= 4;
 		}
 	}
 
-	/* Align target to word: first byte then half word */
-	if ((unsigned long)buf & 1) {
-		*(u8 *)buf = readb(iop);
-		buf++;
-		len--;
-	}
-	if (((unsigned long)buf & 2) && (len >= 2)) {
-		*(u16 *)buf = readw(iop);
-		buf += 2;
-		len -= 2;
-	}
-
-	/* Transfer words, then remaining halfword and remaining byte */
-	while (len >= 4) {
-		*(u32 *)buf = readl(iop);
-		buf += 4;
-		len -= 4;
-	}
-	if (len & 2) {
-		*(u16 *)buf = readw(iop);
-		buf += 2;
+	while (len--) {
+		*(u8 *) buf = readb(src);
+		buf += 1;
+		src += 1;
 	}
-	if (len & 1)
-		*(u8 *)buf = readb(iop);
+	return 0;
 }
 
-static void aspeed_smc_to_fifo(void __iomem *iop, const void *buf, size_t len)
+static int aspeed_smc_write_to_ahb(void __iomem *dst, const void *buf,
+				   size_t len)
 {
-	if (!len)
-		return;
-
-	/* Expect a 4 byte output port.  Otherwise just write bytes. */
-	if ((unsigned long)iop & 3) {
-		while (len--) {
-			writeb(*(u8 *)buf, iop);
-			buf++;
+	if ((((unsigned long) dst | (unsigned long) buf | len) & 3) == 0) {
+		while (len > 3) {
+			u32 val = *(u32 *) buf;
+
+			writel(val, dst);
+			buf += 4;
+			dst += 4;
+			len -= 4;
 		}
-		return;
 	}
 
-	/* Align target to word: first byte then half word */
-	if ((unsigned long)buf & 1) {
-		writeb(*(u8 *)buf, iop);
-		buf++;
-		len--;
-	}
-	if (((unsigned long)buf & 2) && (len >= 2)) {
-		writew(*(u16 *)buf, iop);
-		buf += 2;
-		len -= 2;
-	}
+	while (len--) {
+		u8 val = *(u8 *) buf;
 
-	/* Transfer words, then remaining halfword and remaining byte */
-	while (len >= 4) {
-		writel(*(u32 *)buf, iop);
-		buf += 4;
-		len -= 4;
+		writeb(val, dst);
+		buf += 1;
+		dst += 1;
 	}
-	if (len & 2) {
-		writew(*(u16 *)buf, iop);
-		buf += 2;
-	}
-	if (len & 1)
-		writeb(*(u8 *)buf, iop);
+	return 0;
 }
 
 enum smc_flash_type {
@@ -518,8 +482,8 @@ static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	mutex_lock(&chip->controller->mutex);
 
 	aspeed_smc_start_user(nor);
-	aspeed_smc_to_fifo(chip->base, &opcode, 1);
-	aspeed_smc_from_fifo(buf, chip->base, len);
+	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
+	aspeed_smc_read_from_ahb(buf, chip->base, len);
 	aspeed_smc_stop_user(nor);
 
 	mutex_unlock(&chip->controller->mutex);
@@ -535,8 +499,8 @@ static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 	mutex_lock(&chip->controller->mutex);
 
 	aspeed_smc_start_user(nor);
-	aspeed_smc_to_fifo(chip->base, &opcode, 1);
-	aspeed_smc_to_fifo(chip->base, buf, len);
+	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
+	aspeed_smc_write_to_ahb(chip->base, buf, len);
 	aspeed_smc_stop_user(nor);
 
 	mutex_unlock(&chip->controller->mutex);
@@ -561,12 +525,12 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 		cmdaddr |= (u32)cmd << 24;
 
 		temp = cpu_to_be32(cmdaddr);
-		aspeed_smc_to_fifo(chip->base, &temp, 4);
+		aspeed_smc_write_to_ahb(chip->base, &temp, 4);
 		break;
 	case 4:
 		temp = cpu_to_be32(addr);
-		aspeed_smc_to_fifo(chip->base, &cmd, 1);
-		aspeed_smc_to_fifo(chip->base, &temp, 4);
+		aspeed_smc_write_to_ahb(chip->base, &cmd, 1);
+		aspeed_smc_write_to_ahb(chip->base, &temp, 4);
 		break;
 	}
 }
@@ -593,7 +557,7 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
-	aspeed_smc_from_fifo(read_buf, chip->base, len);
+	aspeed_smc_read_from_ahb(read_buf, chip->base, len);
 	aspeed_smc_stop_user(nor);
 
 out:
@@ -626,7 +590,7 @@ static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
-	aspeed_smc_to_fifo(chip->base, write_buf, len);
+	aspeed_smc_write_to_ahb(chip->base, write_buf, len);
 	aspeed_smc_stop_user(nor);
 
 out:
-- 
2.7.4
