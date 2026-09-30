Return-Path: <openbmc+bounces-2687-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2E2CA5FB1
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2026 07:13:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvmTB1pVxz30VL;
	Wed, 30 Sep 2026 17:12:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790752350;
	cv=none; b=j1Mvgo0qDkGUeXhWeNrlfeP//BrjIP73ewhoNCeW/ls1PBNMn0IHRPalMiHIXyorkW7ur6GXNHYvEg06CXT3BDwGfXudxMw2Zulrjer8YVYciXvx5792zv+Be1DnRpP704Ic2bwG6msUiE2k12mCMJtXBotfhkRuelTMEPXQt7AukWx671XL8DUGlo95xx4ukUGhjXQm9VBYUvxnmu8xCqEziAVIFUMAdExIA5YfU0hkBVb2UvlMl0aDq30Pnx8FlfJVxcpODn9L7RZI4srio3ltNlarg7MLNqEXslG8Y38vZN0eeMbak1xexSOfvL0aknmMtN8i+HoLORyswcA93g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790752350; c=relaxed/relaxed;
	bh=LHVnghP/s4M8qns9RF7HtFpm4yzqcCyF2hdV7ZHOgPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vkd8frsrgaj969W7yRx9jnjprQiIHlgb3it/RLUBEqBu792DHXiHsslO4ns2x2paWrQ5p9WeGhnShQrMbYQ3tWZg4Z8SmZHnqVooh8F9Es/GRInMnLQRXVdmHMm6auVYG9We3G7/hO8vzYmETl7C90SMKvwjpHq0kr+RxOg3VR+xTKOsXYqxSEvKux4E0/erOvlrNs0EiuiOmEcJbnF3S8ceSyhAOD3lIlY8ctvMgiPeW9GHHD1q/CgSaGiCGCz+pl0u5XUxA+lP8n7BbBevuMpc6pWr6T6keSxAv21F+BeuxEJlu6LpO/xS6DDZHvU3PYE01Y4THM38R6Q1EXf16Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lz74Mpdz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::f; helo=mail-pz2-x0f.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lz74Mpdz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::f; helo=mail-pz2-x0f.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x0f.google.com (mail-pz2-x0f.google.com [IPv6:2607:f8b0:4864:3b::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvmT92dgpz30C0
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 17:12:29 +1000 (AEST)
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469b355ffso2142554b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752347; x=1791357147; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHVnghP/s4M8qns9RF7HtFpm4yzqcCyF2hdV7ZHOgPE=;
        b=Lz74MpdzKbkIXyggz0C84x+4pr0WL9GXYCCoa1d1TBh0GBOVmR9dEL+RmHHckigerB
         37oKsg9/lNpe/OkxDX/PmnzsJhiTvRpvnu5VOQ48u7fBQ/XqKkDnJwtFILF/ebFcIJKe
         LNLGcDvgrP/m1oZhlLyTxR9JvQfe67XsPkMn98ltZtN4bn9F8xA4IEEWTyZLhHFt33Es
         tFSZlweuyE2I+XvmXqUt+U8TXRtFTp+Dl9Ny2QpJ/r8YuzLsta3vm4hKaByvzIMNkm7j
         EeyLPnaCvNoT5apBTJxA8xLz7g7QjQbpS22eee5xInO64tGDG3VQC3xoJqBOk/ld62aV
         a2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752347; x=1791357147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHVnghP/s4M8qns9RF7HtFpm4yzqcCyF2hdV7ZHOgPE=;
        b=C5CVmg4ZRSmdj4XbdCQur9PDAOkS0sz4orcVOOSocGvqIIWKsXZDGTUGVAiJBL0gLO
         XvDvu7c4F/RHadzt5ACWZZJ25m4oyIbdkNFK2YE+jdKo2f30jEwnPY/3DYSsXjKkROIz
         kCbuQ513B+cXiV/WM9YjA1McZH4daRFqVU3iexv8APsBPUUXfFjCC3IQHq5YG/4FhqGs
         GQIBFl9+eTGjruN2tKhj5QASmiUHnpbYmSJDKzmxvi9T29B9ft0ny1VwMOmeyKd8v/ts
         7ZtGcL9vdu84rk/L9KbdlSnpZgiADiYOY73Mb2Ocms114ouDY9G90N15884RRsORMJEq
         58vQ==
X-Gm-Message-State: AFuF++nrL11uT0VUOCHufJmLnfPk63aW18hZXQajTYqrqKu3AmLzkNto
	izjhcpUuP6Y5Aa9Dweh/3rikE0tnptWZG3O4/AyTXaT/lweZ5pdG1BNC2Wb+VQ==
X-Gm-Gg: AYBFou0AHjGFaigUYJhs31gNwiSKuH4N08oaxZvAMxJGPMfxGx1WWiE7kqpdGNxbFRH
	13eHwXZL+AkRVsz2h3R4cKxXbraTemr9J+kO06CTCSs+05cscmAfzw9wLlH4GOM0M51hQmMvUQW
	lRETGNS1Qa/rm1Li46DUPb3qUx0P92UJSACeVTzqHC5qz4SRlQrhgO03ZOexaqtRmzzXaLegTR2
	VTptfbqFTSq8S5kKm9EY46sgL3JmrxLAv1vgyCHpaXXJ1zxZyJNvyvj55h2eEFrkCA0QpdbT3i6
	V7byFGUq5VVtOm8phs4U+g0Xxa+fIy8Oa0gMIUZfLOUzO9AZ8HO82uASsHOQ5IaG2YMEkatqCEp
	lm5NiJGzsSWH80qjqkJSBnJu0nCfNHg1/nB0NoHJ6eXUG7SHhAVFdaVmjo1qBqqdRYJzuDOX0VY
	s4VpFnVLCEk4gcKTCzTAY5OCFWv2jybQfF1yx5dRNs8naKkkTIr6ZZIfJLvS4FuSZmujyKxtxso
	rUJhCMEQa52n9eWFu2F6SeMEu8BNtHE9Jc4gHp66Z7/
X-Received: by 2002:a05:6a00:1a89:b0:877:d02a:42f2 with SMTP id d2e1a72fcca58-887477aef90mr418258b3a.7.1790752347455;
        Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d63a9csm327622b3a.34.2026.09.30.00.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	tan.siewert@9elements.com
Cc: joel@jms.id.au,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 v2 4/4] iio: adc: aspeed: Reserve battery sensing channel for on-demand use
Date: Wed, 30 Sep 2026 15:11:35 +0800
Message-ID: <20260930071135.19297-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930071135.19297-1-chou.cosmo@gmail.com>
References: <20260930071135.19297-1-chou.cosmo@gmail.com>
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

From: Billy Tsai <billy_tsai@aspeedtech.com>

For controllers with battery sensing capability (AST2600/AST2700), the
last channel uses a different circuit design optimized for battery
voltage measurement. This channel should not be enabled by default
along with other channels to avoid potential interference and power
efficiency issues.
This ensures optimal power efficiency for normal ADC operations while
maintaining full functionality when battery sensing is needed.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
(cherry picked from commit 58b98c66e6b0e7bcd0799105dadad263a826d425)
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/iio/adc/aspeed_adc.c | 38 +++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 32eb5f89cb12..f5d5cefb5818 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -138,6 +138,13 @@ static inline u32 aspeed_adc_channels_mask(unsigned int num_channels)
 
 static inline unsigned int aspeed_adc_get_active_channels(const struct aspeed_adc_data *data)
 {
+	/*
+	 * For controllers with battery sensing capability, the last channel
+	 * is reserved for battery sensing and should not be included in
+	 * normal channel operations.
+	 */
+	if (data->model_data->bat_sense_sup)
+		return data->model_data->num_channels - 1;
 	return data->model_data->num_channels;
 }
 
@@ -256,8 +263,8 @@ static int aspeed_adc_compensation(struct iio_dev *indio_dev)
 		       ASPEED_ADC_CTRL_CHANNEL_ENABLE(0),
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 	/*
-	 * After enable compensating sensing mode need to wait some time for ADC stable
-	 * Experiment result is 1ms.
+	 * After enable compensating sensing mode need to wait some time for the
+	 * ADC stablize. Experiment result is 1ms.
 	 */
 	fsleep(1000);
 
@@ -305,9 +312,26 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
+		adc_engine_control_reg_val = readl(data->base + ASPEED_REG_ENGINE_CONTROL);
+		/*
+		 * For battery sensing capable controllers, we need to enable
+		 * the specific channel before reading. This is required because
+		 * the battery channel may not be enabled by default.
+		 */
+		if (data->model_data->bat_sense_sup &&
+		    chan->channel == ASPEED_ADC_BATTERY_CHANNEL) {
+			u32 ctrl_reg = adc_engine_control_reg_val & ~ASPEED_ADC_CTRL_CHANNEL;
+
+			ctrl_reg |= ASPEED_ADC_CTRL_CHANNEL_ENABLE(chan->channel);
+			writel(ctrl_reg, data->base + ASPEED_REG_ENGINE_CONTROL);
+			/*
+			 * After enable a new channel need to wait some time for ADC stable
+			 * Experiment result is 1ms.
+			 */
+			fsleep(1000);
+		}
+
 		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL) {
-			adc_engine_control_reg_val =
-				readl(data->base + ASPEED_REG_ENGINE_CONTROL);
 			writel(adc_engine_control_reg_val |
 				       FIELD_PREP(ASPEED_ADC_CH7_MODE,
 						  ASPEED_ADC_CH7_BAT) |
@@ -321,11 +345,11 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 			*val = readw(data->base + chan->address);
 			*val = (*val * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
-			/* Restore control register value */
-			writel(adc_engine_control_reg_val,
-			       data->base + ASPEED_REG_ENGINE_CONTROL);
 		} else
 			*val = readw(data->base + chan->address);
+		/* Restore control register value */
+		writel(adc_engine_control_reg_val,
+				data->base + ASPEED_REG_ENGINE_CONTROL);
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OFFSET:
-- 
2.53.0


