Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9SmJ3fS1zDvZR
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:36 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2E5E8169D6
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:33 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id E819E3C0085;
 Fri,  4 Nov 2016 18:01:29 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 7/8] mtd: spi-nor: aspeed: rework io routines
Date: Fri,  4 Nov 2016 18:00:46 +0100
Message-Id: <1478278847-9164-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478278847-9164-1-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13757652438378711810
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeelgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 04 Nov 2016 17:01:36 -0000

The IO accessors from pflash are shorter and simpler.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 110 +++++++++++++--------------------------
 1 file changed, 36 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 444af3aff8b5..88cbfe7c4340 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -65,84 +65,46 @@ module_param(dma_timeout, uint, 0644);
  * the memory buffer pointer and count via explicit code. The final updates
  * to len are optimistically suppressed.
  */
-
-static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop, size_t len)
+static int aspeed_smc_from_ahb(void *buf, const void __iomem *src, size_t len)
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
+static int aspeed_smc_to_ahb(void __iomem *dst, const void *buf, size_t len)
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
@@ -507,8 +469,8 @@ static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	mutex_lock(&chip->controller->mutex);
 
 	aspeed_smc_start_user(nor);
-	aspeed_smc_to_fifo(chip->base, &opcode, 1);
-	aspeed_smc_from_fifo(buf, chip->base, len);
+	aspeed_smc_to_ahb(chip->base, &opcode, 1);
+	aspeed_smc_from_ahb(buf, chip->base, len);
 	aspeed_smc_stop_user(nor);
 
 	mutex_unlock(&chip->controller->mutex);
@@ -524,8 +486,8 @@ static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 	mutex_lock(&chip->controller->mutex);
 
 	aspeed_smc_start_user(nor);
-	aspeed_smc_to_fifo(chip->base, &opcode, 1);
-	aspeed_smc_to_fifo(chip->base, buf, len);
+	aspeed_smc_to_ahb(chip->base, &opcode, 1);
+	aspeed_smc_to_ahb(chip->base, buf, len);
 	aspeed_smc_stop_user(nor);
 
 	mutex_unlock(&chip->controller->mutex);
@@ -550,12 +512,12 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 		cmdaddr |= (u32)cmd << 24;
 
 		temp = cpu_to_be32(cmdaddr);
-		aspeed_smc_to_fifo(chip->base, &temp, 4);
+		aspeed_smc_to_ahb(chip->base, &temp, 4);
 		break;
 	case 4:
 		temp = cpu_to_be32(addr);
-		aspeed_smc_to_fifo(chip->base, &cmd, 1);
-		aspeed_smc_to_fifo(chip->base, &temp, 4);
+		aspeed_smc_to_ahb(chip->base, &cmd, 1);
+		aspeed_smc_to_ahb(chip->base, &temp, 4);
 		break;
 	}
 }
@@ -582,7 +544,7 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
-	aspeed_smc_from_fifo(read_buf, chip->base, len);
+	aspeed_smc_from_ahb(read_buf, chip->base, len);
 	aspeed_smc_stop_user(nor);
 
 out:
@@ -615,7 +577,7 @@ static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
-	aspeed_smc_to_fifo(chip->base, write_buf, len);
+	aspeed_smc_to_ahb(chip->base, write_buf, len);
 	aspeed_smc_stop_user(nor);
 
 out:
-- 
2.7.4
