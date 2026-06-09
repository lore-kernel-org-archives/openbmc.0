Return-Path: <openbmc+bounces-2055-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A57CD8CAC
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 07:15:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZKtY5m6pz2yRF;
	Tue, 09 Jun 2026 17:15:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780989317;
	cv=none; b=TGmf4F3PReEfrUd3dd6TizWb3hpVDWp7L5YX6e2pt/eQtNB8SxlKRFxFCsuJ1F6dBK8wwprLrhMBy6My4Acu0Ohe8VJgfDugPu0hHZE/EfVwO9RoAFxBh0NHzoo91JbfxwDuOP8LaIaViUNd19Nmj9HPjrd3CCdHOVPT0rspNlCCFozcuP3uoI59TOYn87ts4ylwatRtXz+Ohq/mWK0D+MXpJAZVcxjLsaVAxgrEIEGe0rCRq/L4KalaLj8oaf13XO7uv163eCH3YIkgwUvzdhRCJq03yjDqxvj2Mfb885oYPSEj0f6hR80kP1glSI8Fwi+SbBNw6XhE64MIo1jxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780989317; c=relaxed/relaxed;
	bh=IQ9qZd54/Lmmr54V4cXUb7WR3Uefj23Po4HWaeBJsic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b157C33dQsiSi3XmjwFHbw85/m59CkDezE8zT8yaNokIyHlgWQUV3JJL+id1V5V6dWU4M7gkqQ3V77f1AIjW0wcccu6IRq7HBiDhqCohqUP/CI0OybnyTy7dRgxfWcKXZ4SbcF9KePsbN5Av/L3TpZ9KlTyJpTadbaE4+BOvtcqf733weorjJlaGC52rqgXp++Bd35idIBh4lLpv6309Zqpq6OvlCqxHcv9hb5tAZoaf+9lCZQJacclGkMX6ebq2PEglDpFiyE1sOxyJTbsNY7Ub9THaqKdKUkGgfnfzrckJY7fa+LJhMrlTy9Q2K/qWJJ85jN4Vl3w1921czIrMww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AnOGu8HO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AnOGu8HO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZKtX1F05z2xM7
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 17:15:15 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b12270b3so30838705e9.1
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780989313; x=1781594113; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ9qZd54/Lmmr54V4cXUb7WR3Uefj23Po4HWaeBJsic=;
        b=AnOGu8HOoVNFN8o7+Wa3l9T6PGyk7j5BTdJE5f65pKm5+hJz3r6HIuf+YVYxRM5mbc
         y4ISCt9FlAK8AlsG1BQqlp2ZCWMc8pK6Arc8WvqfON7sPOuEa+AH539Lu/h1OK5bb0rj
         W2iZ6jGgyKF+Oh6r0MZp5mnPNv0FBRi87zl6o3WUd0GrfFAprfirA2gPngoV7vUL5kNU
         X5VcxAFid5Reug+6WD1a+L7l4ionoEUaKMLm12dTBS+F19W6srfRfExAIIoFiRWUS1hL
         1bns1BNiUYBxhxjFi7DFn4pvWaJu3vo/bxKwHE4cLQsWUvkzl3jmJk75MjfqeJeZHwz7
         Ea+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989313; x=1781594113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ9qZd54/Lmmr54V4cXUb7WR3Uefj23Po4HWaeBJsic=;
        b=RIQPC4CuS+6HlQxiU/CUB8IRXU97qnpr5bztEPTpbie1yiRwdV6qQyPCPSkSfMnHYP
         g7dj8NFyebD3N8BvN26mycugnZVtjus7USjmkhHRNDvfvwaIUZ3z042rhVJDh4IPMmss
         rNXAiFrQDjk+9lxVOkX23KXilWUl6YAPi/uZFq4dsoe8bS4nYY9UTsRZj5W6vDAKTCWS
         wAp6jJNHrHYXHRaog8HvdrHOhW5eAgwSg8eZ1671zarBgpgRiaMlDQoClnKi87EK2uCh
         ySJJIDn7RuaorgpgXc/BODU0ZIylKK2yqTPtlr5+nCqMmuCGFC7ZmGRffeAFIbAAPfyp
         ydVA==
X-Gm-Message-State: AOJu0YwsYAAI2hintBMgVTfaXDkSlEdY8HP7wKDR1xKWWzjsrYKMv571
	9REDqJcLB4pX1zW6fMWfH4szx9MzQBRptv+kYWwpYDe1dG2XnkWc80Yg
X-Gm-Gg: Acq92OH0pcNRPWT90N77T8xF0r9ayJAeDdcxavPXDuZiZSOAzZ7bYQ0mrFC7r31ZvhT
	jUhLh/uwlq3MGm7dRrBzjDDGrtBL8ePmtWmLIi83oRxTDSg3Nh0oR78m4UmVPsOe1k5GCIJGjkc
	dIGPktpGUZ+BXSpEARTkKwlWqiXsD+YbEj1BPg714bSKj5jQpbx87/EbabufW+gtm3g7B0xMoxZ
	+n+mxD7CD6jNkMCRhskatadKM30aMhSOc9JGG9Oh0lHGjU7SgqFCtW/x0nQnsSeU5ZQCLmfyqDi
	u0ToDH2f7NUmIhmDJkdjTAHyQ2Q/MvblA1NS+9N+1msy7iO9m27SXAoIYBcL12lJ7WqVZ9UzaAa
	mX+ylXgfOwRaoVZX/J7MwS4Ao+SKHhdhXEY9AcEYZxxZsaAsNphKSb2fTJPpZKgdQTzYBolzJEb
	BiGlUR5H1hkXCeJdkz0eW+PnCTHx5p9fAk8PeuDc7ptiri
X-Received: by 2002:a05:600c:34cb:b0:490:4b89:5361 with SMTP id 5b1f17b1804b1-490c25afa03mr299042535e9.7.1780989312636;
        Tue, 09 Jun 2026 00:15:12 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm57909918f8f.12.2026.06.09.00.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:15:10 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1] spi: npcm-fiu: support dual and quad UMA writes
Date: Tue,  9 Jun 2026 10:14:58 +0300
Message-Id: <20260609071458.2692482-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Content-Transfer-Encoding: 8bit

The manual page-program path used the UMA command byte for the
first byte of each continuation chunk. That forced command-lane
semantics onto chunked writes and blocked dual/quad payload
writes.

Switch continuation chunks to data-only UMA transactions so WDBPCK
controls the payload bus width.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-fiu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index 6617751009c3..ebe3387d11f5 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -393,7 +393,7 @@ static int npcm_fiu_uma_write(struct spi_mem *mem,
 {
 	struct npcm_fiu_spi *fiu =
 		spi_controller_get_devdata(mem->spi->controller);
-	u32 uma_cfg = BIT(10);
+	u32 uma_cfg = cmd ? BIT(10) : 0;
 	u32 data_reg[4] = {0};
 	u32 val;
 	u32 i;
@@ -403,8 +403,11 @@ static int npcm_fiu_uma_write(struct spi_mem *mem,
 			   (spi_get_chipselect(mem->spi, 0) <<
 			    NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
 
-	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
-			   NPCM_FIU_UMA_CMD_CMD, cmd);
+	if (cmd)
+		regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
+				   NPCM_FIU_UMA_CMD_CMD, cmd);
+	else
+		uma_cfg |= ilog2(op->data.buswidth) << NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
 
 	if (data_size) {
 		memcpy(data_reg, data, data_size);
@@ -464,8 +467,7 @@ static int npcm_fiu_manualwrite(struct spi_mem *mem,
 
 	/* Starting the data writing loop in multiples of 8 */
 	for (idx = 0; idx < num_data_chunks; ++idx) {
-		ret = npcm_fiu_uma_write(mem, op, data[0], false,
-					 &data[1], CHUNK_SIZE - 1);
+		ret = npcm_fiu_uma_write(mem, op, 0, false, &data[0], CHUNK_SIZE);
 		if (ret)
 			return ret;
 
@@ -474,8 +476,7 @@ static int npcm_fiu_manualwrite(struct spi_mem *mem,
 
 	/* Handling chunk remains */
 	if (remain_data > 0) {
-		ret = npcm_fiu_uma_write(mem, op, data[0], false,
-					 &data[1], remain_data - 1);
+		ret = npcm_fiu_uma_write(mem, op, 0, false, &data[0], remain_data);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1


