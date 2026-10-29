Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A8606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 01:35:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFRcB6W6Yz2ylj;
	Thu, 29 Oct 2026 12:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793237690;
	cv=none; b=AJ1q7KElZrEAjDR+OnK1MYHtCk1kVJQwZBc4UtvBHk+Bt84Pt+LqPwyKAp7anZ13qZomsmgeGad19W06DfK3ZI03bra5v7hx1wC5ESNr6XmEcpI/S3qS61ysclpkp+Cg4XVo7PlKnsyy4nNDzRTlLx0D4dDGGHvbrpPY3NTLLaG+8I5KfjFoQydQh6At1syJkTCObHBuLdPFYPt72u99XbXXh1bu7sb6UjZ9gfaY60Ic7uRc6tobmHrYz3l3hgx461jhcf4tiWYWRenlNgsjCc3VqqpRvPE8hubHNW1Lrrb7Fblcjec+9EIFsElN49MlTvwz8NPjCvMg0Iathy41eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793237690; c=relaxed/relaxed;
	bh=ELQkfIZ43VuQatEboFIKFQr2RFkoHagdu8i0RMJBjK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ecklkBbgFlvfNckieXgC8zB8d/ds4lcKzTooecpCjQifKc2MHlXiwd4/0Rjl+BTBo8cWeaLBhJf4TWqR6BrtE4qMTkC+DpIXHvVeDYOc29vo5WwhudWWyRRe4QPQj5WZoE2mfZDmIE4BoiJGjGj27TkI0n9nq8IYOQe5AbqHCtsvFwIk+Mxi+xYjkwLrscQEvdxV7GJI0UOlfxHpoULgH/ZbZ1tbaE4q/lS2IvV/Oe84TIDA1AwoJjseBQFY3E2siFa/L54Vd+qXY0hQzK5Uv1UCBYIt9QUJ/o2KxP7bZijtrFwGZZxJZoN2hIbSkfzlUnhkKnoW2FFi7tTwhqpQVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFRc90Rcwz2yh4
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 12:34:49 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 09:34:29 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 09:34:29 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <joel@jms.id.au>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH linux dev-6.18 2/6] spi: aspeed: Improve timing calibration algorithm for AST2600 platform
Date: Thu, 29 Oct 2026 09:34:18 +0800
Message-ID: <20261029013428.277816-3-vince_chang@aspeedtech.com>
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

Starting with the AST2600 platform, most platfom manufacturers have
adopted more complex board designs and signal routing, making SPI
timing calibration increasingly sensitive and critical. Previously,
the driver selected the first "PASS" timing point during calibration,
which may not yield the most stable result.

This patch introduces a more robust calibration method:
- It evaluates all combinations of HCLK sample point delay and DI input
  delay. The results are stored in a 2D buffer for further comparison.
- Because the timing delay behavior is non-linear across HCLK sample
  points, the optimal timing point is selected as the center of the
  longest consecutive "PASS" interval within a single HCLK sample
  point row.

This approach ensures better stability and precision in SPI read timing,
especially under complex signal integrity conditions.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Link: https://patch.msgid.link/20251001112605.1130723-3-chin-ting_kuo@aspeedtech.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit efb79de36e947d136517bac14c139d494fcc72fa)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 70 +++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 18335ba970cb..4b2afa55052f 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -1165,21 +1165,57 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
 
 #define TIMING_DELAY_DI		BIT(3)
 #define TIMING_DELAY_HCYCLE_MAX	5
+#define TIMING_DELAY_INPUT_MAX	16
 #define TIMING_REG_AST2600(chip)				\
 	((chip)->aspi->regs + (chip)->aspi->data->timing +	\
 	 (chip)->cs * 4)
 
+/*
+ * This function returns the center point of the longest
+ * continuous "pass" interval within the buffer. The interval
+ * must contains the highest number of consecutive "pass"
+ * results and not span across multiple rows.
+ */
+static u32 aspeed_spi_ast2600_optimized_timing(u32 rows, u32 cols,
+					       u8 buf[rows][cols])
+{
+	int r = 0, c = 0;
+	int max = 0;
+	int i, j;
+
+	for (i = 0; i < rows; i++) {
+		for (j = 0; j < cols;) {
+			int k = j;
+
+			while (k < cols && buf[i][k])
+				k++;
+
+			if (k - j > max) {
+				max = k - j;
+				r = i;
+				c = j + (k - j) / 2;
+			}
+
+			j = k + 1;
+		}
+	}
+
+	return max > 4 ? r * cols + c : 0;
+}
+
 static int aspeed_spi_ast2600_calibrate(struct aspeed_spi_chip *chip, u32 hdiv,
 					const u8 *golden_buf, u8 *test_buf)
 {
 	struct aspeed_spi *aspi = chip->aspi;
 	int hcycle;
+	int delay_ns;
 	u32 shift = (hdiv - 2) << 3;
-	u32 mask = ~(0xfu << shift);
+	u32 mask = ~(0xffu << shift);
 	u32 fread_timing_val = 0;
+	u8 calib_res[6][17] = {0};
+	u32 calib_point;
 
 	for (hcycle = 0; hcycle <= TIMING_DELAY_HCYCLE_MAX; hcycle++) {
-		int delay_ns;
 		bool pass = false;
 
 		fread_timing_val &= mask;
@@ -1192,14 +1228,14 @@ static int aspeed_spi_ast2600_calibrate(struct aspeed_spi_chip *chip, u32 hdiv,
 			"  * [%08x] %d HCLK delay, DI delay none : %s",
 			fread_timing_val, hcycle, pass ? "PASS" : "FAIL");
 		if (pass)
-			return 0;
+			calib_res[hcycle][0] = 1;
 
 		/* Add DI input delays  */
 		fread_timing_val &= mask;
 		fread_timing_val |= (TIMING_DELAY_DI | hcycle) << shift;
 
-		for (delay_ns = 0; delay_ns < 0x10; delay_ns++) {
-			fread_timing_val &= ~(0xf << (4 + shift));
+		for (delay_ns = 0; delay_ns < TIMING_DELAY_INPUT_MAX; delay_ns++) {
+			fread_timing_val &= ~(0xfu << (4 + shift));
 			fread_timing_val |= delay_ns << (4 + shift);
 
 			writel(fread_timing_val, TIMING_REG_AST2600(chip));
@@ -1208,18 +1244,28 @@ static int aspeed_spi_ast2600_calibrate(struct aspeed_spi_chip *chip, u32 hdiv,
 				"  * [%08x] %d HCLK delay, DI delay %d.%dns : %s",
 				fread_timing_val, hcycle, (delay_ns + 1) / 2,
 				(delay_ns + 1) & 1 ? 5 : 5, pass ? "PASS" : "FAIL");
-			/*
-			 * TODO: This is optimistic. We should look
-			 * for a working interval and save the middle
-			 * value in the read timing register.
-			 */
+
 			if (pass)
-				return 0;
+				calib_res[hcycle][delay_ns + 1] = 1;
 		}
 	}
 
+	calib_point = aspeed_spi_ast2600_optimized_timing(6, 17, calib_res);
 	/* No good setting for this frequency */
-	return -1;
+	if (calib_point == 0)
+		return -1;
+
+	hcycle = calib_point / 17;
+	delay_ns = calib_point % 17;
+
+	fread_timing_val = (TIMING_DELAY_DI | hcycle | (delay_ns << 4)) << shift;
+
+	dev_dbg(aspi->dev, "timing val: %08x, final hcycle: %d, delay_ns: %d\n",
+		fread_timing_val, hcycle, delay_ns);
+
+	writel(fread_timing_val, TIMING_REG_AST2600(chip));
+
+	return 0;
 }
 
 /*
-- 
2.43.0


