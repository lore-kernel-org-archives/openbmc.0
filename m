Return-Path: <openbmc+bounces-2127-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F640CD4F26
	for <openbmc@archiver.kernel.org>; Tue, 23 Jun 2026 06:36:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gkwMl4Ylwz2ySV;
	Tue, 23 Jun 2026 16:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782193659;
	cv=none; b=bZAQf1OW2+FiheGROCbHqsbC2z8Rx8agTnJbJApFWrdCSaTOGEiyRp7R0eA3bzZEo2bC2RAW7RnaztYZ+l5xZN/rHG+ltVYVYYrdPwbPKog0zh6tWPs2XiUyRpdunDpplHBdQpuSJxfY91dW1ANiEcvcX6XLdDUfDvVij1x0FnxhVX19zStLp+E/LD/9kGSz2yhjkdd6SvGkqhT+beW04/eXOhimHHm/dj3WdDH6p6TbtEGaG0uStjsxFUI4vQU1The1JfqZXp03qIbh5TDaBndKJSZ5/KKJpatV0WMId+vza2STf7JsVLgp9Yk76d8SvjmPZQKyswTt1KnuMAOQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782193659; c=relaxed/relaxed;
	bh=1sRMU+kgRpHS0jEZ+Rz/PmPVUD26Z4UtlWktthJUcyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrXWHUKBKV6JGt3DSo+sN49ZYpAMtll68XxiNpNxqvukv/TW7UWuQ4eWPqKQwqfvsTfv+9jAwB2PWu6i50Dzyy6Fm1JNXT8DvtNYDESgZNtrrHHAeSbmAFcAX6/N1STnJhxF90bVAK8+qbQEEOqHZWgkI2snJCwIsTE0bTNDr/T4QY33t+7PABUDdNaEqgYvZ8njK2s2ijU57zeMaf7wEi28AixIOcU2L9mMtGeJq3uRFVdCueZjwsUmooo99Z/rqusFGglMjXIuzPJSekjT5ynukMEgTh0btutaSYHD6S51MMXlUvnnAmJuzGvqqGsmwZsE4nzsNNAWckxP1HijGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pji6p8tE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pji6p8tE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gkvGy4N0jz2yVZ
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2026 15:47:38 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-37cae998401so2322490a91.0
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 22:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782193656; x=1782798456; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sRMU+kgRpHS0jEZ+Rz/PmPVUD26Z4UtlWktthJUcyQ=;
        b=Pji6p8tEMHbjP7rezSx9czp78PhJNB7Nvn8+MSpKYERWwT8R3eTMtgOu7TiIAaWPUJ
         N2FvBbE/tZ2Qh70Wvr50/jmLmylMAeQ0SR7rZKi5rK2Qp0Wz/ctz26rstMBsjLfgHDop
         +xBKy5hERDWPj+08baBm0djfVpbhDJdfxaAe0Om/DvzWcJGqjjqxoLw301EtowHdbmxP
         7s2zUd/la/C322tBZxk6JfqBwXba6ll/2UEBmn4fO/dU3XoztFvBBQC6ZSzpdbdngJ0+
         XOBXoPhUDHrbAR8w3vFMSaemfAy3pp4gmGltkcz2JToUKL1BuvdTWpZqhMi+9oje4HvV
         vCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782193656; x=1782798456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sRMU+kgRpHS0jEZ+Rz/PmPVUD26Z4UtlWktthJUcyQ=;
        b=Fpas21IGsTZhOBssV9r6EyiCYnA696WSduor6Fg/XcEf4EpAEyhNMREglz/4LCgQG3
         UD6jvuQL0pVdPn3ct/IxykQWQ2QoSntWcrTPFKqutkuYum4hhokcy92rL42cNmliIHgO
         EB+w/A0lfghB43HPfxESIWVuuZ7i5ildrAlrxw+D6pAZupP3oosw2iNyqDS4tnEGG6jk
         yaLAQCsAYUD2yzNk7uCuoEs+DU5K4D+9J/W7J3DUusSwf3nBJ8WPPl4nQIGCn1pYlEmW
         l23XVk/JMhSLVvJw7sTqROaZQZXLHNVBDlihcJjraHroWDJBbnsE1jXjsPSf55t6wxEJ
         Y6xg==
X-Gm-Message-State: AOJu0YzHKGR5ea4G/a3NPkbWy9DNrIcprUTGhH8DR8JTq+GjuY6VytT4
	TL76bqjT6MB8e1buX4I1/FnAlo2nccmJiWiSUt+em7sJbULf2XwB9amB
X-Gm-Gg: AfdE7clS4sUtp/2tvZBUXm+seSfu7gPIpd1JcQ+RIV9aH1GqGvkHiha+LH9qe8cYpo8
	YEFaCXq/Shyqj3Tok7AcrXjAfYjBFzwHHmBu9jPSpzmHPiFuQTtcX2I7B8CiPwNK1vU19h/adz+
	LoXR4wS3ntkqQue6fD39fTgHe7cmQ8Jr7NUEZf7I1AnGeTkwQmbq8F1DA/Il2OGDMMH+H1XM1Ju
	stivg/qnJiPDwwZ7P9sH+fe9QdzYeOekdAI9TYK+9ydJPEMIe4/YjF9rZB4FXn92B/JxsmUuMXK
	eZ6jP3bVn9RxYrmBeRdKaxqOiGu70lQuMB/q2C+hPL1A382EK6j7UgksHy+AGX5mKxHv+J+9qJl
	Pa6/ChgXy34IBBnruKfELlihZMOczW/P9ifZDeSClIuttXm1qLAZVj32NpLImkK+WMxutIt2wY4
	4gBj5OtmzS2dAXyFAQ6Jr4UTimQEs46C/bl24azwtm6rUA2ageSuuu
X-Received: by 2002:a17:90b:5444:b0:36d:81b3:61a1 with SMTP id 98e67ed59e1d1-37d160479a6mr18032176a91.7.1782193656231;
        Mon, 22 Jun 2026 22:47:36 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm11506913a91.16.2026.06.22.22.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:47:35 -0700 (PDT)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kwliu@nuvoton.com,
	kfting@nuvoton.com,
	kcfeng0@nuvoton.com
Subject: [PATCH v1 1/1] i2c: npcm: unexpected SLVRSTR IRQ in master mode
Date: Tue, 23 Jun 2026 13:46:35 +0800
Message-Id: <20260623054635.1214525-2-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623054635.1214525-1-kcfeng0@nuvoton.com>
References: <20260623054635.1214525-1-kcfeng0@nuvoton.com>
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

From: Ban Feng <kcfeng0@nuvoton.com>

SLVRSTR IRQ occurs even when BMC acts as master role only.
This case was not handled in the master IRQ handler,
resulting in IRQ storming.
Handle this condition to prevent the spurious interrupt.

Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index f667a873b81e..02dd8c3ba44b 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -593,6 +593,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	u64 ab_slvrstr_cnt;
 	bool ber_state; /* Indicate the bus error state */
 };
 
@@ -1709,6 +1710,24 @@ static void npcm_i2c_irq_master_handler_read(struct npcm_i2c *bus)
 	}
 }
 
+static void npcm_i2c_irq_handle_ab_slvrstr(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	if (bus->ab_slvrstr_cnt < ULLONG_MAX)
+		bus->ab_slvrstr_cnt++;
+	npcm_i2c_clear_tx_fifo(bus);
+	npcm_i2c_clear_rx_fifo(bus);
+	iowrite8(0, bus->reg + NPCM_I2CRXF_CTL);
+	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
+	val = NPCM_I2CFIF_CTS_CLR_FIFO | NPCM_I2CFIF_CTS_SLVRSTR |
+	      NPCM_I2CFIF_CTS_RXF_TXE;
+	iowrite8(val, bus->reg + NPCM_I2CFIF_CTS);
+	bus->stop_ind = I2C_BUS_ERR_IND;
+	npcm_i2c_callback(bus, bus->stop_ind, npcm_i2c_get_index(bus));
+	bus->state = I2C_IDLE;
+}
+
 static void npcm_i2c_irq_handle_nmatch(struct npcm_i2c *bus)
 {
 	iowrite8(NPCM_I2CST_NMATCH, bus->reg + NPCM_I2CST);
@@ -1777,6 +1796,8 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
 	if (npcm_i2c_is_master(bus)) {
 		npcm_i2c_master_abort(bus);
 	} else {
+		/* Clear the FIFO */
+		iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO, bus->reg + NPCM_I2CFIF_CTS);
 		bus->ber_state = true;
 		npcm_i2c_clear_master_status(bus);
 
@@ -2237,6 +2258,10 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 	}
 #endif
 	/* Clear status bits for spurious interrupts */
+	if (bus->fifo_use && FIELD_GET(NPCM_I2CFIF_CTS_SLVRSTR,
+				ioread8(bus->reg + NPCM_I2CFIF_CTS))) {
+		npcm_i2c_irq_handle_ab_slvrstr(bus);
+	}
 	npcm_i2c_clear_master_status(bus);
 
 	return IRQ_HANDLED;
@@ -2487,6 +2512,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_fail_cnt", 0444, bus->adap.debugfs, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, bus->adap.debugfs, &bus->timeout_cnt);
 	debugfs_create_u64("tx_complete_cnt", 0444, bus->adap.debugfs, &bus->tx_complete_cnt);
+	debugfs_create_u64("ab_slvrstr_cnt", 0444, bus->adap.debugfs, &bus->ab_slvrstr_cnt);
 }
 
 static int npcm_i2c_probe_bus(struct platform_device *pdev)
-- 
2.34.1


