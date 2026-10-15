Return-Path: <openbmc+bounces-2786-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620CDCC6B2D
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:33:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5X7l31kgz3btt;
	Fri, 16 Oct 2026 15:31:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.28.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792030227;
	cv=none; b=Cmgx9Ir8/LofxtWUroQ+rqJ7oA5qQ49vnDIXMWt5Q7lTJR12rL4tI1Yrd1cUG+oZ3iyE9lpVXSai7fQlx91e/th8GG+XCHSKy8wT+3etSkFNbOep8jb/oCcVw5iUQ7gAPd8v9fCUoaVFSXsY0ycIfywc4EGo0grHhv7FvPhe84Hkx6nretFBQBRHWB1bnM2sOpT/9WIIbxp1vE+Yr1gJSRNVLJaLEiajLXUHbgUrGcJ5FdaKo8oEKCUqDvM3kSLX8nw39Hc6Bg6CPSvLjeSFGQNEU7aR+7NaOR2BWKDpVe+mGMwfxR9UgpQHSwgIlgq1ncvoxwhD0M0QNAbBI9Guzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792030227; c=relaxed/relaxed;
	bh=wHwAcuqNgX1w8cGpzkrIWY0kOgSy8n/NTCpBn8jlIEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lbe5hg2aPjH/hs8stZKdddzDr9F4pgzeefw/QkZ+Fp991TZhtW0M/lf73O5k26d4qX9eI3AE52n/3Oh9178Kx9Wwy6Wf5wa7v4XhzayZC2zPUrbzFCQa3mnD+YRkp1XzpYdy/jl5zGJQgvTBMcQaWm0Vie/cztocIiML+rmG7/UTqt4me2pTWVWVLkfH+vdjokCDer6hPGn9JDhki04UM6QGpA3Y5C7Km1H7NAp6rINn5/a50myiIbezWpd7w6Sx7mEBBYb2oZMGbZXdF3+5qn92XPM32ZItt3FuLkKaKXHcezROrBsT3kO8R4+XikkE4jfULM0IJ+q/zD+Us7sxHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; dkim=pass (1024-bit key; unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ctm2A1FJ; dkim-atps=neutral; spf=pass (client-ip=115.124.28.51; helo=out28-51.mail.aliyun.com; envelope-from=liuwb@xiaopeng.com; receiver=lists.ozlabs.org) smtp.mailfrom=xiaopeng.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ctm2A1FJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xiaopeng.com (client-ip=115.124.28.51; helo=out28-51.mail.aliyun.com; envelope-from=liuwb@xiaopeng.com; receiver=lists.ozlabs.org)
Received: from out28-51.mail.aliyun.com (out28-51.mail.aliyun.com [115.124.28.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j4s3h3Wjfz2xwN
	for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2026 13:10:21 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1792030215; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
	bh=wHwAcuqNgX1w8cGpzkrIWY0kOgSy8n/NTCpBn8jlIEg=;
	b=ctm2A1FJ8vUQz7hrfn1+VGpoVktMs70uwLAE0ECJK0/P7Pt8AlzYWkb7gd3y/fsXP0MBPhF9n4F6qt/Ku/wzD0y+M+KEJeIGjt6G/xYEFCiXTeA+Re8HBpuFajo6Dx6ATE2W9uYoV+9g65v6ZRzHRnmT4vIWS60gqs12xf/rbxI=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07574709|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00277256-0.000464609-0.996763;FP=9667071803597065642|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037025160;MF=liuwb@xiaopeng.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jdzWobX_1792030212;
Received: from 127.0.0.1(mailfrom:liuwb@xiaopeng.com fp:SMTPD_---.jdzWobX_1792030212 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 15 Oct 2026 10:10:13 +0800
From: Weibin Liu <liuwb@xiaopeng.com>
Date: Thu, 15 Oct 2026 10:10:12 +0800
Subject: [PATCH] spi: npcm-fiu: limit UMA data_size to the 16-byte staging
 buffer
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-npcm-fiu-uma-datasize-v1-1-7dee91cadee6@xiaopeng.com>
X-B4-Tracking: v=1; b=H4sIAAQ20GoC/x3MQQ5AMBBA0avIrE3SimriKmIxajALJS0ipHfXW
 L7F/y9EDsIR2uKFwJdE2XyGLgtwC/mZUcZsqFTVaKUN+t2tOMmJ50o40kFRHsZhYEPGOGtrC7n
 dA09y/9+uT+kD723namcAAAA=
X-Change-ID: 20261015-npcm-fiu-uma-datasize-bbe5a55c7747
To: linux-spi@vger.kernel.org, tmaimon77@gmail.com, broonie@kernel.org
Cc: venture@google.com, andrew@codeconstruct.com.au, yuenn@google.com, 
 tali.perry1@gmail.com, benjaminfair@google.com, avifishman70@gmail.com, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 stable@vger.kernel.org, Guanglei Zhu <zhugl3@xiaopeng.com>, 
 Weibin Liu <liuwb@xiaopeng.com>
X-Mailer: b4 0.14.3

npcm_fiu_uma_read() and npcm_fiu_uma_write() use a 16-byte on-stack
staging buffer (u32 data_reg[4]) and move data_size bytes to or from
it. data_size comes straight from op->data.nbytes, which is supplied
by the SPI MEM operation and is not bounded by the driver:
npcm_fiu_exec_op() only validates op->addr.nbytes, and no
adjust_op_size callback truncates the transfer to the controller FIFO
size.

A SPI MEM operation with addr.nbytes == 0 and data.nbytes > 16
therefore overflows data_reg[] on the kernel stack (write path) or
reads past it (read path), corrupting the stack.

Reject data_size larger than the staging buffer in both UMA helpers
by returning -EOPNOTSUPP, so spi_mem falls back to the generic SPI
message path. The chunked path in npcm_fiu_manualwrite() always passes
at most CHUNK_SIZE bytes, so it is unaffected.

Fixes: ace55c411b11 ("spi: npcm-fiu: add NPCM FIU controller driver")
Cc: stable@vger.kernel.org # 5.4+
Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---
 drivers/spi/spi-npcm-fiu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index 96dfef4d9067..9c0a655a54b3 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -343,6 +343,10 @@ static int npcm_fiu_uma_read(struct spi_mem *mem,
 	u32 val;
 	u32 i;
 
+	/* data_reg holds at most 16 bytes */
+	if (data_size > sizeof(data_reg))
+		return -EOPNOTSUPP;
+
 	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
 			   NPCM_FIU_UMA_CTS_DEV_NUM,
 			   (spi_get_chipselect(mem->spi, 0) <<
@@ -398,6 +402,10 @@ static int npcm_fiu_uma_write(struct spi_mem *mem,
 	u32 val;
 	u32 i;
 
+	/* data_reg holds at most 16 bytes */
+	if (data_size > sizeof(data_reg))
+		return -EOPNOTSUPP;
+
 	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
 			   NPCM_FIU_UMA_CTS_DEV_NUM,
 			   (spi_get_chipselect(mem->spi, 0) <<

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261015-npcm-fiu-uma-datasize-bbe5a55c7747

Best regards,
-- 
Weibin Liu <liuwb@xiaopeng.com>


