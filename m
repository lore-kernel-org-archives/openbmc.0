Return-Path: <openbmc+bounces-2379-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D3DC55174
	for <openbmc@archiver.kernel.org>; Wed,  5 Aug 2026 06:14:01 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hFKpZ3k1Sz30Cj;
	Wed, 05 Aug 2026 16:13:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785910390;
	cv=none; b=AyzOTZ+0rsdrcf5OhyzT24G+LVC/YCZfOuPMc/ud3O7HDH9kGT0IHeeU+3gUO0or+YnaE6hZHqSCtFBCz1s4mwUFNR0LjQY3MrQkRMM9ZQ1mgTnG9fmmsV5MkPpJol8wFfo3bv8MX9L9vMAi2YWTo4AivQRbjSTizI8iBhAw6pg+5rrk6w3s6aopprr865eUHGRX3khqJW5La9nunDVv2zTPNUEfQXv/8WuFlbZHxfV2Aw76IEbkjx/KA2kwEagc0PynAYH+hOYY2TE20bVUYH75ZqwQI6zBi5E95EqGSZXMU0GO6tS9zVVYl91rpPQm9i8m5clhbwFwGPI46piThg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785910390; c=relaxed/relaxed;
	bh=lsjoRrHpNy7jS9KP4ML7wEcKcj9HtkzSL67sDe8rnac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+tc5OtustfC8MDJT8MG6+4pMsv76bgyiqD4my1g0GfA/RfVo2lZyVtX4ZR5lRNLbGJJ0zxHZdPNhuLDESWSCIdTpepnjLhKOfklFJsGj8TNoxylm0fDW8AjC/stdrlpFP+fwoTMJXSlX9bQryW1UsMUWAYMp+72tdRr/zFVYUFv0BzObcbjOuMRr7fUqY9oqb8QukHH8w5hT/UoIXuq5nMPQl5g+g3BByCNLUcKp+YuLIB0s7TtwaFZxFdCNTF7w9sTamKWfo0yHPQicGMZNTscFXccAwHSDpRIjqWVnY85Jd9CYfrLCxtdLDjzlgmTqExEfZy9br26cyF2QiQ11Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NLroBK15; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NLroBK15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hFKpY59nJz2xqM
	for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2026 16:13:09 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so450554a91.2
        for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 23:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785910387; x=1786515187; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lsjoRrHpNy7jS9KP4ML7wEcKcj9HtkzSL67sDe8rnac=;
        b=NLroBK151QSyursK/oJWgsEP+M5EY31bSsVWWauyQovzwUth3P4eNvHqpkQoRPC/4c
         QZgEbWv9incBHNTJbmkroBrOMkQdOtHj2yA7IRH8Sxy9xvKz13RAz0UY2xPIFgNKd7s/
         k7tKm0mUDH4CebT/UH62uYTtPW/EStCpqQ9J6RqpXr0hBbrzaJaFRE9kSNnm9CoGzZli
         n/cGBFMlPL/IgN7PDTtDS9ob/Mv95JapOzal1XMB8ujPrGFvb0k/dg10BYJPIDpxpyHp
         uFgUmFzodaoBaPVng2CF9zpOAJNispT9RceFd5247BA/vK7UMNNdaSZ9sYCRNFIhE7pu
         RROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910387; x=1786515187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lsjoRrHpNy7jS9KP4ML7wEcKcj9HtkzSL67sDe8rnac=;
        b=PD6IraJW5D8ufKWV+h8A4dELcvPBfipg+ZCxTsW1boIoZ/QPKcpSQlOuG5b59tUuzK
         ES6UZ0B5bPUA0mNYHl9Qai8WLLnYtW/tewF3uHZw4kCY6lPWCuIbKwZa2OG3w89S8eEL
         TsisrXfm6RxpA5cx3ZyMz9C85GfWtRREJgXpZVMQEf/6/cfrgrdAN3TvqCCltm5wI5uN
         WUTrIqrwbtwkuhbmbuQthhRafO5tXRdGfNJgEBrGpr6YDh9eifdYlKYjohdPINxF4Bb8
         fQPJBhghRaR/zT324qhaKEjggb/PItvMbuKtbWiCC7w1bQELFWsLwghLH1MQVpH2XEAB
         Hn0g==
X-Forwarded-Encrypted: i=1; AHgh+RouqU9inuZqsDZHMPQT3MEcimvJlN8nalPvrp100fzNnjx8GaQQOMXt/QngSB5gG2LDRn5tkyG1@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyIYxT20FdpOzW9KTlZs5NeEv12K5S4VoSjBU5ZsAD5e1/RjiYM
	8oKIqq4paLAIpKMkRAxS2x7mgzGIWIYptMmLd1CjWgizX/Me03lmNtSG
X-Gm-Gg: AR+sD13sBSXQ/ZnAy6lzt6E3wXormNNw2WkzcCd+iDjHXwFxXehCE5uaIFfToh2L209
	ZbFnCz7zac038ihdHHPhv1MjJBoAgfAOfgm6ERX/7QksveS0zYjiH4YsT0FL5lrR+yZnr1jcEfe
	oBY0gSbffHh+FwSXhUf8Uly/4vUip6fSLyFMUOgqIeZPbNjgGhFZNbYWsZzCg2DsKYNRotoIujy
	k1zYaNpR1vild7i8H/6/A4LqaT4sNUvIOXZrQWQMQOJxCJQJCBHJW9a8SnwKICla4vIomGoGfmQ
	lxwTocnuP5RGdoQuiD9wYHkMFlvn7zlHpzvhh7lDGqvO2vK4SPkyQpqeu2y3Ax09jgeKAjhC0gd
	gNKyBGIv3k/KeleZzJSO9sSJwuQ0TS0ImVnu6iEXztLcvna8HM0jNp3d5xdZ3b+lWcpHobMI5ti
	lj6vmZ3d5xhjR66sWbDlbLEYfSwZyMt46P+XpzrxxUE9jDBAeSIVHWQjsxuKJwNEvZK+9DnRVa4
	3AQ1R/Ecpg/tbihRV/FHP4B2p23GbyvRFJU5B0VeeX+wg==
X-Received: by 2002:a17:90b:520a:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3903c54adbamr4434204a91.1.1785910387126;
        Tue, 04 Aug 2026 23:13:07 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917ae54sm2009561a91.8.2026.08.04.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:13:06 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 4/4] iio: adc: aspeed: Reserve battery sensing channel for on-demand use
Date: Wed,  5 Aug 2026 14:13:09 +0800
Message-ID: <20260805061310.1740724-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805061310.1740724-1-chou.cosmo@gmail.com>
References: <20260805061310.1740724-1-chou.cosmo@gmail.com>
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
---
 drivers/iio/adc/aspeed_adc.c | 38 +++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index a1a6296d3003..9b828a3c91da 100644
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


