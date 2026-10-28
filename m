Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504B606A31D
	for <openbmc@archiver.kernel.org>; Wed, 28 Oct 2026 02:19:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jDrfL5jMmz2xwL;
	Wed, 28 Oct 2026 13:19:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793153978;
	cv=none; b=PlXHbWJRwm21TqYq8OwgN+IAjHF5usJYNm74dgd6/LewVi36dxjFCYqn3fvYYjsNtuNgwYjBtxebkIXURgFQ6gC+GpLuRXIC13/siYAO0s0fkbw8eQ1w0R/P3srJKU2FZHZ8zbUoLcWVtc6GCCm+yEal+jf+plgnyj+Ck7KftpjEgyyATbyDpOr48K4wfviQtNb74vwjsbqybJBbj+dmr8yhm4m59PANWrN6QdEpCtg6L0CNBsyXuG4fMEEXWDic6hSUg5tuAspsqpBSZEfJMjXzCVHK8PfJeH4lwVF0uYG9YB6xFJmjnabyQyeM3i3r4MqNChJtVa5uN030uVRA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793153978; c=relaxed/relaxed;
	bh=exXJPjqiLGeVde2VvNDqNKko+FDtdJg3AM2vlv+sotI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VOkC8y84XqNqH4zfK15NaQSiPON5Sz522JBwYF1EqK/KBZ8oeUw1sg7+VNTzRrfJEIydDcZKa9k1Fo1Hq/zyP7X85ISvK5SUqV5lHPRnMbPEf8HLsWWIZPUl9uzBMLWZHzlZ4gu5XI49RFCK5xtuX/9ZxcwKM91XP+bzdtLR8ssYu2gx8zD8RhETLS0cBpyxALz7wcFBR/lU/6kYe/PUgZZARs0kiL70gk8U/L9+rtjl0Gx7D7TcuXrathlampBtVgMZ+DlNs46f6kk6AXLkoqJtOlGBO12NrZzqqAgNyYXgcItZbXNBF4jbOVYilAnmNzIedv3DMe+u18SL/wSGuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=cooper_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=cooper_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jDrfJ63y1z2xYw
	for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2026 13:19:36 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 28 Oct
 2026 10:19:15 +0800
Received: from aspeed-fw03.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 28 Oct 2026 10:19:14 +0800
From: Cooper Huang <cooper_huang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, <vince_chang@aspeedtech.com>, <troy_lee@aspeedtech.com>,
	<ryan_chen@aspeedtech.com>, <chin-ting_kuo@aspeedtech.com>
Subject: [PATCH u-boot v2026.10-openbmc] spi: aspeed: Add read timing calibration
Date: Wed, 28 Oct 2026 10:19:14 +0800
Message-ID: <20261028021914.1828256-1-cooper_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At high SPI clock frequencies, the controller must delay the sampling
of the read data, and the right delay depends on the board. Port the
read timing calibration from the Linux driver: golden data is read at
HCLK/16, then the timing settings of each HCLK divider, from the
fastest one allowed down to HCLK/5, are scanned until the reads match.

Until the calibration is done, the flash is accessed at HCLK/16, as in
Linux, since faster settings may not work without the timing
compensation. If no setting passes, or the calibration cannot be done,
the flash stays at HCLK/16 with a warning.

Compared to Linux:
- each setting is checked by reading 1KB twice, instead of 16KB ten
  times, to keep the boot time short. The minimum number of words that
  are neither all 0's nor all 1's is scaled to the buffer size, keeping
  the Linux ratio of 1/64.
- the AST2600 setting picked in the passing window is mapped back to
  the input delay that was tested. Linux writes the column index as
  the delay, which is one step off.

Based on the following Linux commits:
- eeaec1ea05c0 ("spi: aspeed: Calibrate read timings")
- 31dcc7e1f8a9 ("spi: aspeed: Update clock selection strategy")
- efb79de36e94 ("spi: aspeed: Improve timing calibration algorithm
  for AST2600 platform")

Link: https://git.kernel.org/torvalds/c/eeaec1ea05c0
Link: https://git.kernel.org/torvalds/c/31dcc7e1f8a9
Link: https://git.kernel.org/torvalds/c/efb79de36e94
Signed-off-by: Cooper Huang <cooper_huang@aspeedtech.com>
Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Link: https://patch.msgid.link/20261027-spi-aspeed-calibration-v2-1-26359ab2d86d@aspeedtech.com
---
 drivers/spi/spi-aspeed-smc.c | 284 ++++++++++++++++++++++++++++++++++-
 1 file changed, 282 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 0186b01ad9a..051569c453d 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -36,6 +36,15 @@
 #define CTRL_IO_MODE_CMD_WRITE  BIT(1)
 #define CTRL_STOP_ACTIVE        BIT(2)
 
+#define CALIBRATE_BUF_SIZE      SZ_1K
+#define CALIBRATE_REPEAT_COUNT  2
+#define CALIBRATE_MAX_HDIV      5
+
+#define TIMING_DELAY_DI         BIT(3)
+#define TIMING_DELAY_HCYCLE_MAX 5
+#define TIMING_DELAY_INPUT_MAX  16
+#define TIMING_MIN_PASS_WINDOW  5
+
 struct aspeed_spi_regs {
 	u32 conf;                       /* 0x00 CE Type Setting */
 	u32 ctrl;                       /* 0x04 CE Control */
@@ -85,12 +94,15 @@ struct aspeed_spi_info {
 	u32 max_bus_width;
 	u32 min_decoded_sz;
 	u32 clk_ctrl_mask;
+	u32 min_hdiv;
 	void (*set_4byte)(struct udevice *bus, u32 cs);
 	uintptr_t (*segment_start)(struct udevice *bus, u32 reg);
 	uintptr_t (*segment_end)(struct udevice *bus, u32 reg);
 	u32 (*segment_reg)(uintptr_t start, uintptr_t end);
 	int (*adjust_decoded_sz)(struct udevice *bus);
 	u32 (*get_clk_setting)(struct udevice *dev, uint hz);
+	int (*calibrate)(struct udevice *dev, u32 hdiv,
+			 const u8 *golden_buf, u8 *test_buf);
 };
 
 struct aspeed_spi_decoded_range {
@@ -724,11 +736,249 @@ static int aspeed_spi_exec_op_user_mode(struct spi_slave *slave,
 	return 0;
 }
 
+/* Read timing calibration, ported from the Linux driver */
+static bool aspeed_spi_check_reads(struct aspeed_spi_flash *flash,
+				   const u8 *golden_buf, u8 *test_buf)
+{
+	int i;
+
+	for (i = 0; i < CALIBRATE_REPEAT_COUNT; i++) {
+		memcpy_fromio(test_buf, (void __iomem *)flash->ahb_base,
+			      CALIBRATE_BUF_SIZE);
+		if (memcmp(test_buf, golden_buf, CALIBRATE_BUF_SIZE))
+			return false;
+	}
+
+	return true;
+}
+
+/* Check that at least 1/64 of the words are neither all 0's nor all 1's */
+static bool aspeed_spi_check_calib_data(const u8 *buf, size_t len)
+{
+	const u32 *buf32 = (const u32 *)buf;
+	u32 cnt = 0;
+	size_t i;
+
+	for (i = 0; i < len / sizeof(u32); i++) {
+		if (buf32[i] != 0 && buf32[i] != 0xffffffff)
+			cnt++;
+	}
+
+	return cnt >= len / 256;
+}
+
+static u32 ast2400_fread_tpass(int i)
+{
+	return (i / 2) | ((i & 1) ? 0 : TIMING_DELAY_DI);
+}
+
+/* The timing register is shared by all CS, only CE0 is calibrated. */
+static int ast2400_spi_calibrate(struct udevice *dev, u32 hdiv,
+				 const u8 *golden_buf, u8 *test_buf)
+{
+	struct aspeed_spi_priv *priv = dev_get_priv(dev->parent);
+	struct dm_spi_slave_plat *slave_plat = dev_get_parent_plat(dev);
+	u32 cs = slave_plat->cs[0];
+	struct aspeed_spi_flash *flash = &priv->flashes[cs];
+	uintptr_t timing_reg = (uintptr_t)&priv->regs->timings[0];
+	u32 shift = (hdiv - 1) * 4;
+	u32 timing_base;
+	u32 timing_val;
+	int pass_cnt = 0;
+	int i;
+
+	/*
+	 * Other CS only check that the timing set by CE0 reads correctly
+	 * three times.
+	 */
+	if (cs != 0) {
+		for (i = 0; i < 3; i++) {
+			if (!aspeed_spi_check_reads(flash, golden_buf,
+						    test_buf))
+				return -EIO;
+		}
+
+		return 0;
+	}
+
+	/* The AST2400 SPI controller has its timing register at 0x14. */
+	if (priv->info == &ast2400_spi_info)
+		timing_reg = (uintptr_t)priv->regs + 0x14;
+
+	timing_base = readl(timing_reg) & ~(0xfu << shift);
+
+	for (i = 0; i < (TIMING_DELAY_HCYCLE_MAX + 1) * 2; i++) {
+		timing_val = ast2400_fread_tpass(i);
+		writel(timing_base | (timing_val << shift), timing_reg);
+
+		if (!aspeed_spi_check_reads(flash, golden_buf, test_buf)) {
+			pass_cnt = 0;
+			continue;
+		}
+
+		/* Use the middle one of three consecutive passing settings. */
+		if (++pass_cnt == 3) {
+			timing_val = ast2400_fread_tpass(i - 1);
+			writel(timing_base | (timing_val << shift), timing_reg);
+			return 0;
+		}
+	}
+
+	return -EIO;
+}
+
+/* Column 0 is without input delay, columns 1 to 16 are input delays 0 to 15 */
+static u32 ast2600_timing_val(int hcycle, int col)
+{
+	if (!col)
+		return hcycle;
+
+	return TIMING_DELAY_DI | hcycle | ((col - 1) << 4);
+}
+
+/*
+ * Each CS has its own timing register. Use the center of the longest
+ * passing window of input delays within a single HCLK cycle delay.
+ */
+static int ast2600_spi_calibrate(struct udevice *dev, u32 hdiv,
+				 const u8 *golden_buf, u8 *test_buf)
+{
+	struct aspeed_spi_priv *priv = dev_get_priv(dev->parent);
+	struct dm_spi_slave_plat *slave_plat = dev_get_parent_plat(dev);
+	u32 cs = slave_plat->cs[0];
+	struct aspeed_spi_flash *flash = &priv->flashes[cs];
+	u32 *timing_reg = &priv->regs->timings[cs];
+	u32 shift = (hdiv - 2) * 8;
+	u32 timing_base;
+	u32 timing_val;
+	int best_hcycle = 0;
+	int best_col = 0;
+	int best_len = 0;
+	int hcycle;
+	int start;
+	int col;
+
+	timing_base = readl(timing_reg) & ~(0xffu << shift);
+
+	for (hcycle = 0; hcycle <= TIMING_DELAY_HCYCLE_MAX; hcycle++) {
+		start = 0;
+
+		for (col = 0; col <= TIMING_DELAY_INPUT_MAX; col++) {
+			timing_val = ast2600_timing_val(hcycle, col);
+			writel(timing_base | (timing_val << shift), timing_reg);
+
+			if (!aspeed_spi_check_reads(flash, golden_buf,
+						    test_buf)) {
+				start = col + 1;
+				continue;
+			}
+
+			if (col - start + 1 > best_len) {
+				best_len = col - start + 1;
+				best_hcycle = hcycle;
+				best_col = start + best_len / 2;
+			}
+		}
+	}
+
+	if (best_len < TIMING_MIN_PASS_WINDOW)
+		return -EIO;
+
+	timing_val = ast2600_timing_val(best_hcycle, best_col);
+	writel(timing_base | (timing_val << shift), timing_reg);
+
+	return 0;
+}
+
+static bool aspeed_spi_need_calibration(struct udevice *dev)
+{
+	struct aspeed_spi_plat *plat = dev_get_plat(dev->parent);
+	struct aspeed_spi_priv *priv = dev_get_priv(dev->parent);
+	struct dm_spi_slave_plat *slave_plat = dev_get_parent_plat(dev);
+
+	/* The calibration is done when the read direct mapping is created. */
+	return CONFIG_IS_ENABLED(SPI_DIRMAP) && priv->info->calibrate &&
+	       slave_plat->max_hz >= plat->hclk_rate / CALIBRATE_MAX_HDIV;
+}
+
+static int aspeed_spi_do_calibration(struct udevice *dev)
+{
+	struct udevice *bus = dev->parent;
+	struct aspeed_spi_plat *plat = dev_get_plat(bus);
+	struct aspeed_spi_priv *priv = dev_get_priv(bus);
+	struct dm_spi_slave_plat *slave_plat = dev_get_parent_plat(dev);
+	const struct aspeed_spi_info *info = priv->info;
+	u32 cs = slave_plat->cs[0];
+	struct aspeed_spi_flash *flash = &priv->flashes[cs];
+	uintptr_t ce_ctrl_reg = (uintptr_t)&priv->regs->ce_ctrl[cs];
+	u8 *golden_buf;
+	u8 *test_buf;
+	u32 clk_setting = 0;
+	u32 ctrl_val;
+	u32 hdiv;
+	int ret;
+
+	if (!aspeed_spi_need_calibration(dev))
+		return 0;
+
+	if (info == &ast2400_spi_info)
+		ce_ctrl_reg = (uintptr_t)&priv->regs->ctrl;
+
+	test_buf = malloc(CALIBRATE_BUF_SIZE * 2);
+	if (!test_buf)
+		return -ENOMEM;
+
+	golden_buf = test_buf + CALIBRATE_BUF_SIZE;
+
+	/* Read the golden data at HCLK/16. */
+	ctrl_val = flash->ce_ctrl_read & ~info->clk_ctrl_mask;
+	writel(ctrl_val, ce_ctrl_reg);
+	memcpy_fromio(golden_buf, (void __iomem *)flash->ahb_base,
+		      CALIBRATE_BUF_SIZE);
+
+	if (!aspeed_spi_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
+		dev_info(dev, "calibration area too uniform, skipped\n");
+		clk_setting = info->get_clk_setting(dev, slave_plat->max_hz);
+		goto out;
+	}
+
+	for (hdiv = info->min_hdiv; hdiv <= CALIBRATE_MAX_HDIV; hdiv++) {
+		u32 hdiv_freq = plat->hclk_rate / hdiv;
+
+		if (hdiv_freq > slave_plat->max_hz)
+			continue;
+
+		clk_setting = info->get_clk_setting(dev, hdiv_freq);
+		writel(ctrl_val | clk_setting, ce_ctrl_reg);
+
+		ret = info->calibrate(dev, hdiv, golden_buf, test_buf);
+		dev_dbg(dev, "HCLK/%u: %s\n", hdiv, ret ? "FAIL" : "PASS");
+		if (!ret)
+			break;
+	}
+
+	if (hdiv > CALIBRATE_MAX_HDIV) {
+		dev_warn(dev, "no good read timing found, using HCLK/16\n");
+		clk_setting = 0;
+		flash->max_freq = plat->hclk_rate / 16;
+	}
+
+out:
+	flash->ce_ctrl_user &= ~info->clk_ctrl_mask;
+	flash->ce_ctrl_user |= clk_setting;
+	flash->ce_ctrl_read = ctrl_val | clk_setting;
+	writel(flash->ce_ctrl_read, ce_ctrl_reg);
+	free(test_buf);
+
+	return 0;
+}
+
 static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 {
 	int ret = 0;
 	struct udevice *dev = desc->slave->dev;
 	struct udevice *bus = dev->parent;
+	struct aspeed_spi_plat *plat = dev_get_plat(bus);
 	struct aspeed_spi_priv *priv = dev_get_priv(bus);
 	struct dm_spi_slave_plat *slave_plat = dev_get_parent_plat(dev);
 	const struct aspeed_spi_info *info = priv->info;
@@ -765,7 +1015,7 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 
 		ret = aspeed_spi_decoded_range_config(bus);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	cmd_io_conf = aspeed_spi_get_io_mode(op_tmpl.data.buswidth) |
@@ -779,9 +1029,22 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 
 	writel(priv->flashes[cs].ce_ctrl_read, ce_ctrl_reg);
 
+	ret = aspeed_spi_do_calibration(dev);
+	if (ret)
+		goto err;
+
 	dev_dbg(dev, "read bus width: %d ce_ctrl_val: 0x%08x\n",
 		op_tmpl.data.buswidth, priv->flashes[cs].ce_ctrl_read);
 
+	return 0;
+
+err:
+	/* If no clock was set before, it is still HCLK/16, leave it there. */
+	if (!priv->flashes[cs].max_freq && aspeed_spi_need_calibration(dev)) {
+		dev_warn(dev, "read timing not calibrated, using HCLK/16\n");
+		priv->flashes[cs].max_freq = plat->hclk_rate / 16;
+	}
+
 	return ret;
 }
 
@@ -1056,11 +1319,13 @@ static const struct aspeed_spi_info ast2400_fmc_info = {
 	.max_bus_width = 2,
 	.min_decoded_sz = 0x800000,
 	.clk_ctrl_mask = 0x00002f00,
+	.min_hdiv = 1,
 	.set_4byte = ast2400_fmc_chip_set_4byte,
 	.segment_start = ast2400_spi_segment_start,
 	.segment_end = ast2400_spi_segment_end,
 	.segment_reg = ast2400_spi_segment_reg,
 	.get_clk_setting = ast2400_get_clk_setting,
+	.calibrate = ast2400_spi_calibrate,
 };
 
 static const struct aspeed_spi_info ast2400_spi_info = {
@@ -1068,11 +1333,13 @@ static const struct aspeed_spi_info ast2400_spi_info = {
 	.max_bus_width = 2,
 	.min_decoded_sz = 0x800000,
 	.clk_ctrl_mask = 0x00000f00,
+	.min_hdiv = 1,
 	.set_4byte = ast2400_spi_chip_set_4byte,
 	.segment_start = ast2400_spi_segment_start,
 	.segment_end = ast2400_spi_segment_end,
 	.segment_reg = ast2400_spi_segment_reg,
 	.get_clk_setting = ast2400_get_clk_setting,
+	.calibrate = ast2400_spi_calibrate,
 };
 
 static const struct aspeed_spi_info ast2500_fmc_info = {
@@ -1080,12 +1347,14 @@ static const struct aspeed_spi_info ast2500_fmc_info = {
 	.max_bus_width = 2,
 	.min_decoded_sz = 0x800000,
 	.clk_ctrl_mask = 0x00002f00,
+	.min_hdiv = 1,
 	.set_4byte = ast2500_spi_chip_set_4byte,
 	.segment_start = ast2500_spi_segment_start,
 	.segment_end = ast2500_spi_segment_end,
 	.segment_reg = ast2500_spi_segment_reg,
 	.adjust_decoded_sz = ast2500_adjust_decoded_size,
 	.get_clk_setting = ast2500_get_clk_setting,
+	.calibrate = ast2400_spi_calibrate,
 };
 
 /*
@@ -1097,12 +1366,14 @@ static const struct aspeed_spi_info ast2500_spi_info = {
 	.max_bus_width = 2,
 	.min_decoded_sz = 0x800000,
 	.clk_ctrl_mask = 0x00002f00,
+	.min_hdiv = 1,
 	.set_4byte = ast2500_spi_chip_set_4byte,
 	.segment_start = ast2500_spi_segment_start,
 	.segment_end = ast2500_spi_segment_end,
 	.segment_reg = ast2500_spi_segment_reg,
 	.adjust_decoded_sz = ast2500_adjust_decoded_size,
 	.get_clk_setting = ast2500_get_clk_setting,
+	.calibrate = ast2400_spi_calibrate,
 };
 
 static const struct aspeed_spi_info ast2600_fmc_info = {
@@ -1110,12 +1381,14 @@ static const struct aspeed_spi_info ast2600_fmc_info = {
 	.max_bus_width = 4,
 	.min_decoded_sz = 0x200000,
 	.clk_ctrl_mask = 0x0f000f00,
+	.min_hdiv = 2,
 	.set_4byte = ast2600_spi_chip_set_4byte,
 	.segment_start = ast2600_spi_segment_start,
 	.segment_end = ast2600_spi_segment_end,
 	.segment_reg = ast2600_spi_segment_reg,
 	.adjust_decoded_sz = ast2600_adjust_decoded_size,
 	.get_clk_setting = ast2600_get_clk_setting,
+	.calibrate = ast2600_spi_calibrate,
 };
 
 static const struct aspeed_spi_info ast2600_spi_info = {
@@ -1123,12 +1396,14 @@ static const struct aspeed_spi_info ast2600_spi_info = {
 	.max_bus_width = 4,
 	.min_decoded_sz = 0x200000,
 	.clk_ctrl_mask = 0x0f000f00,
+	.min_hdiv = 2,
 	.set_4byte = ast2600_spi_chip_set_4byte,
 	.segment_start = ast2600_spi_segment_start,
 	.segment_end = ast2600_spi_segment_end,
 	.segment_reg = ast2600_spi_segment_reg,
 	.adjust_decoded_sz = ast2600_adjust_decoded_size,
 	.get_clk_setting = ast2600_get_clk_setting,
+	.calibrate = ast2600_spi_calibrate,
 };
 
 static const struct aspeed_spi_info ast2700_fmc_info = {
@@ -1136,12 +1411,14 @@ static const struct aspeed_spi_info ast2700_fmc_info = {
 	.max_bus_width = 4,
 	.min_decoded_sz = 0x10000,
 	.clk_ctrl_mask = 0x0f000f00,
+	.min_hdiv = 2,
 	.set_4byte = ast2700_spi_chip_set_4byte,
 	.segment_start = ast2700_spi_segment_start,
 	.segment_end = ast2700_spi_segment_end,
 	.segment_reg = ast2700_spi_segment_reg,
 	.adjust_decoded_sz = ast2700_adjust_decoded_size,
 	.get_clk_setting = ast2600_get_clk_setting,
+	.calibrate = ast2600_spi_calibrate,
 };
 
 static const struct aspeed_spi_info ast2700_spi_info = {
@@ -1149,12 +1426,14 @@ static const struct aspeed_spi_info ast2700_spi_info = {
 	.max_bus_width = 4,
 	.min_decoded_sz = 0x10000,
 	.clk_ctrl_mask = 0x0f000f00,
+	.min_hdiv = 2,
 	.set_4byte = ast2700_spi_chip_set_4byte,
 	.segment_start = ast2700_spi_segment_start,
 	.segment_end = ast2700_spi_segment_end,
 	.segment_reg = ast2700_spi_segment_reg,
 	.adjust_decoded_sz = ast2700_adjust_decoded_size,
 	.get_clk_setting = ast2600_get_clk_setting,
+	.calibrate = ast2600_spi_calibrate,
 };
 
 static int aspeed_spi_claim_bus(struct udevice *dev)
@@ -1167,7 +1446,8 @@ static int aspeed_spi_claim_bus(struct udevice *dev)
 
 	dev_dbg(bus, "%s: claim bus CS%u\n", bus->name, slave_plat->cs[0]);
 
-	if (flash->max_freq == 0) {
+	/* Stay at HCLK/16 until the read timing is calibrated. */
+	if (flash->max_freq == 0 && !aspeed_spi_need_calibration(dev)) {
 		clk_setting = priv->info->get_clk_setting(dev, slave_plat->max_hz);
 		flash->ce_ctrl_user &= ~(priv->info->clk_ctrl_mask);
 		flash->ce_ctrl_user |= clk_setting;
-- 
2.34.1


