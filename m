Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CBD606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 01:35:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFRcF3QZfz303B;
	Thu, 29 Oct 2026 12:34:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793237693;
	cv=none; b=WrTXFJog2l2Echc07j88Tl9vX9rFsTJVgAS3KAr/04ZAyk27T2+HKQpC1B8SOFWnVb3VnJfSFkudCmC3j+hRadRiw0S7O7li4ioLe0rQ3Q0+69lAr95+RABT/98pHxiYUeWMt4ALJf21xmGgxw9IHB6/eouqrtvVui+WorlWLUsMs7pCIWX8nBjTav7OEZA2yErJZU3CMxq8XjwIOItuFY2sDq21gcO6f4sK0iQJEI79VIos4NYH4C7MeI0WOrBcfkmCjELAEpos8bJpnJ8WGoGj+qPXS7ka/TCjLjny/EfL7YWbs+YkNQF3z6xysOPgn0NitsKxX3aGAft9TBoWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793237693; c=relaxed/relaxed;
	bh=mp1tv+FQon/PMyOOoJYPyWb0Mx/O+UmwKYjC0CAf9i8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKZhzqZM+W0wR+QWqsOFelO3cwUzGDLtl1s7L3b+M9vgtpmHiLYHLhcOIYL1ysz2fyL4P34yhGa1R5E3qnSku1ogIXkvqEQR3NyIif7WcuHx+TbqvwvrhayRMp2ft6xBlb+ndk6bOhDV78ReMT1/ufIlvQC1+BgUlwfhv6MoNoWpGpIbs2kyzpPqd4pvOUIKoGLbxEZD5mxD1KUjApJ+bN6HlaMb/ymH/ekXTrDRgZvxi4EtHdUQUKiC01/RtFtPdJoh6zGv6hIj07kkvSBLOZR9u8+3Sn+31f59tt3gkDA9AEjGNJn/RydUJhnMW1kt+0csgrs+cuRIaPwZCGVrUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFRcD15M1z2yqq
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 12:34:52 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 09:34:31 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 09:34:31 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <joel@jms.id.au>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH linux dev-6.18 4/6] spi: aspeed: Centralize address decoding region management
Date: Thu, 29 Oct 2026 09:34:20 +0800
Message-ID: <20261029013428.277816-5-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029013428.277816-1-vince_chang@aspeedtech.com>
References: <20261029013428.277816-1-vince_chang@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

The original approach to handling address decoding overlaps was to trim
the next region directly. If the next CS's decoding range was fully
overlapped by the current one, it would be forcibly closed by trimming
its size to zero. This could lead expected behavior, especially on
the platform with multiple flashes layout.

To solve improper trimming problem, this patch collects the required
address decoding size at each stage, then, (re-)arragne address decoding
region to each CS centrally with knowing the total AHB decoding size.
If a segment register cannot be updated (e.g. due to bootloader write
protection), the original value is kept to avoid breaking access and
an error is reported if the total decoding size of all CS exceeds
the total AHB decoding size.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Link: https://patch.msgid.link/20251001112605.1130723-5-chin-ting_kuo@aspeedtech.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit b546e0023a203e7edf9377ac8f4f490a6965afd6)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 156 +++++++++++++----------------------
 1 file changed, 58 insertions(+), 98 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index bbd173924ed8..1257b8c81272 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -379,61 +379,59 @@ static const char *aspeed_spi_get_name(struct spi_mem *mem)
 			      spi_get_chipselect(mem->spi, 0));
 }
 
-struct aspeed_spi_window {
-	u32 cs;
-	u32 offset;
-	u32 size;
-};
-
-static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
-				   struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS])
+static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 {
-	const struct aspeed_spi_data *data = aspi->data;
-	u32 reg_val;
+	struct device *dev = aspi->dev;
+	off_t offset = 0;
+	phys_addr_t start;
+	phys_addr_t end;
+	void __iomem *seg_reg_base = aspi->regs + CE0_SEGMENT_ADDR_REG;
+	void __iomem *seg_reg;
+	u32 seg_val_backup;
+	u32 seg_val;
 	u32 cs;
+	size_t window_size;
 
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
-		reg_val = readl(aspi->regs + CE0_SEGMENT_ADDR_REG + cs * 4);
-		windows[cs].cs = cs;
-		windows[cs].size = data->segment_end(aspi, reg_val) -
-			data->segment_start(aspi, reg_val);
-		windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
-		dev_vdbg(aspi->dev, "CE%d offset=0x%.8x size=0x%x\n", cs,
-			 windows[cs].offset, windows[cs].size);
-	}
-}
+		seg_reg = seg_reg_base + cs * 4;
+		seg_val_backup = readl(seg_reg);
 
-static int aspeed_spi_set_window(struct aspeed_spi *aspi,
-				 const struct aspeed_spi_window *win)
-{
-	u32 start = aspi->ahb_base_phy + win->offset;
-	u32 end = start + win->size;
-	void __iomem *seg_reg = aspi->regs + CE0_SEGMENT_ADDR_REG + win->cs * 4;
-	u32 seg_val_backup = readl(seg_reg);
-	u32 seg_val = aspi->data->segment_reg(aspi, start, end);
+		start = aspi->ahb_base_phy + offset;
+		window_size = aspi->chips[cs].ahb_window_size;
+		end = start + window_size;
 
-	if (seg_val == seg_val_backup)
-		return 0;
+		seg_val = aspi->data->segment_reg(aspi, start, end);
+		writel(seg_val, seg_reg);
 
-	writel(seg_val, seg_reg);
+		/*
+		 * Restore initial value if something goes wrong or the segment
+		 * register is written protected.
+		 */
+		if (seg_val != readl(seg_reg)) {
+			dev_warn(dev, "CE%d expected window [ 0x%.9llx - 0x%.9llx ] %zdMB\n",
+				 cs, (u64)start, (u64)end - 1, window_size >> 20);
+			writel(seg_val_backup, seg_reg);
+			window_size = aspi->data->segment_end(aspi, seg_val_backup) -
+				      aspi->data->segment_start(aspi, seg_val_backup);
+			aspi->chips[cs].ahb_window_size = window_size;
+			end = start + window_size;
+		}
 
-	/*
-	 * Restore initial value if something goes wrong else we could
-	 * loose access to the chip.
-	 */
-	if (seg_val != readl(seg_reg)) {
-		dev_err(aspi->dev, "CE%d invalid window [ 0x%.8x - 0x%.8x ] %dMB",
-			win->cs, start, end - 1, win->size >> 20);
-		writel(seg_val_backup, seg_reg);
-		return -EIO;
+		if (window_size != 0)
+			dev_dbg(dev, "CE%d window [ 0x%.9llx - 0x%.9llx ] %zdMB\n",
+				cs, (u64)start, (u64)end - 1,  window_size >> 20);
+		else
+			dev_dbg(dev, "CE%d window closed\n", cs);
+
+		aspi->chips[cs].ahb_base = aspi->ahb_base + offset;
+		offset += window_size;
+		if (offset > aspi->ahb_window_size) {
+			dev_err(dev, "CE%d offset value 0x%llx is too large.\n",
+				cs, (u64)offset);
+			return -ENOSPC;
+		}
 	}
 
-	if (win->size)
-		dev_dbg(aspi->dev, "CE%d new window [ 0x%.8x - 0x%.8x ] %dMB",
-			win->cs, start, end - 1,  win->size >> 20);
-	else
-		dev_dbg(aspi->dev, "CE%d window closed", win->cs);
-
 	return 0;
 }
 
@@ -443,9 +441,7 @@ static const struct aspeed_spi_data ast2600_fmc_data;
 
 static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 {
-	int ret;
 	u32 cs;
-	struct aspeed_spi_window win;
 
 	/* No segment registers for the AST2400 SPI controller */
 	if (aspi->data == &ast2400_spi_data) {
@@ -456,36 +452,17 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 
 	/* Assign the minimum window size to each CS */
 	for (cs = 0; cs < aspi->num_cs; cs++) {
-		if (cs == 0)
-			aspi->chips[cs].ahb_base = aspi->ahb_base;
-		else
-			aspi->chips[cs].ahb_base =
-				aspi->chips[cs - 1].ahb_base +
-				aspi->chips[cs - 1].ahb_window_size;
-
 		aspi->chips[cs].ahb_window_size = aspi->data->min_window_size;
-
 		dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ]",
 			cs, aspi->ahb_base_phy + aspi->data->min_window_size * cs,
 			aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1);
 	}
 
 	/* Close unused CS */
-	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++) {
-		aspi->chips[cs].ahb_base = aspi->ahb_base;
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
 		aspi->chips[cs].ahb_window_size = 0;
-	}
-
-	for (cs = 0; cs < aspi->num_cs; cs++) {
-		win.cs = cs;
-		win.offset = aspi->chips[cs].ahb_base - aspi->ahb_base;
-		win.size = aspi->chips[cs].ahb_window_size;
-		ret = aspeed_spi_set_window(aspi, &win);
-		if (ret)
-			return ret;
-	}
 
-	return 0;
+	return aspeed_spi_set_window(aspi);
 }
 
 /*
@@ -498,8 +475,8 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 					 u32 local_offset, u32 size)
 {
 	struct aspeed_spi *aspi = chip->aspi;
-	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] = { 0 };
-	struct aspeed_spi_window *win = &windows[chip->cs];
+	u32 cs;
+	u32 total_window_size;
 	int ret;
 
 	/* No segment registers for the AST2400 SPI controller */
@@ -527,41 +504,24 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 			 chip->cs, size >> 20);
 	}
 
-	aspeed_spi_get_windows(aspi, windows);
-
 	/* Adjust this chip window */
-	win->offset += local_offset;
-	win->size = size;
+	aspi->chips[chip->cs].ahb_window_size = size;
 
-	if (win->offset + win->size > aspi->ahb_window_size) {
-		win->size = aspi->ahb_window_size - win->offset;
-		dev_warn(aspi->dev, "CE%d window resized to %dMB", chip->cs, win->size >> 20);
+	total_window_size = 0;
+	for (cs = 0; cs < aspi->data->max_cs; cs++)
+		total_window_size += aspi->chips[cs].ahb_window_size;
+
+	if (total_window_size > aspi->ahb_window_size) {
+		aspi->chips[chip->cs].ahb_window_size -= (total_window_size -
+							  aspi->ahb_window_size);
+		dev_warn(aspi->dev, "CE%d window resized to %zdMB",
+			 chip->cs, aspi->chips[chip->cs].ahb_window_size >> 20);
 	}
 
-	ret = aspeed_spi_set_window(aspi, win);
+	ret = aspeed_spi_set_window(aspi);
 	if (ret)
 		return ret;
 
-	/* Update chip mapping info */
-	chip->ahb_base = aspi->ahb_base + win->offset;
-	chip->ahb_window_size = win->size;
-
-	/*
-	 * Also adjust next chip window to make sure that it does not
-	 * overlap with the current window.
-	 */
-	if (chip->cs < aspi->data->max_cs - 1) {
-		struct aspeed_spi_window *next = &windows[chip->cs + 1];
-
-		/* Change offset and size to keep the same end address */
-		if ((next->offset + next->size) > (win->offset + win->size))
-			next->size = (next->offset + next->size) - (win->offset + win->size);
-		else
-			next->size = 0;
-		next->offset = win->offset + win->size;
-
-		aspeed_spi_set_window(aspi, next);
-	}
 	return 0;
 }
 
-- 
2.43.0


