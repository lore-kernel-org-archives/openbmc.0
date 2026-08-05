Return-Path: <openbmc+bounces-2377-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ABDC55174
	for <openbmc@archiver.kernel.org>; Wed,  5 Aug 2026 06:13:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hFKpV4kyrz308t;
	Wed, 05 Aug 2026 16:13:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785910386;
	cv=none; b=Ed4/2Oqy7bi5Pt1F3ogN10we1yxBtnWEUqmhXkZJYbEbETYE5VgiUnHmv6Dt8UiLzMpNeXeYST7CZ8MGNZH2fCjbtGJcNctPmxAVeu3wpzGKQWGfgZOgZQ67YyPaxisDD7i7NzkPNm6GLgncF7o1AKOrMDC+/givql/uTK6D/iUXtTemQL+m6ltACmIiI0eFghZotRirZj0IdmxKzMVn4I+ZGMjC8JcZW4BfMtG2lLhRT2Ftfcqi12A/qWJXwoLLRUdU7isJaA532qLrEik9bye2+Xe5o6ppeklAjiCFlqvoaBP0eN3FdAqmcupprnPQ6RvdYcViCxhl2zAz9t6klQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785910386; c=relaxed/relaxed;
	bh=zg54fHJsqxob2qajOY2ZU/PplLLALkFA7N5BbCg732Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcoGdw8Yzw2FBn8ICaiV7bk28yNn5+7gnlBB63BzIFFwvtmgObgFzWHapp5O/AraF5eAjSAZmBMlpl87LCMkuRDCxlIVorz5NGEMd3qUA0FPpB/uzEvwTz7rCIpLfKcyOp0Qmky4niQ1O0vRfCyK5BoVnOHX5lfFH7rxGhKdDfmZen8U9ha+Q4eB+aFl8n/SkhcYiyM2K0dj/Y0SdNuGbSA8USlcNKpRSVsbSYTwhceK0/Of8mUKJvoR6jFOAoE6AN6PCsHFj2gg1yCr3OaifO2IDIIxZ3N4PjSfydXYQQ6BNEQY2EX9NXUDXgIjT/xyMwtUorFQDfuZlREj6hjr/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r7N4s8P4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r7N4s8P4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hFKpT5HSrz2xqM
	for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2026 16:13:05 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38dcbade417so478237a91.1
        for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785910383; x=1786515183; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zg54fHJsqxob2qajOY2ZU/PplLLALkFA7N5BbCg732Q=;
        b=r7N4s8P4f2A+27J54jD9V5iSGkrmIR4D00JZZRe7OEe1oiFjF9dOVi+VeILe3zfPKv
         jDH0nwa/yuzmg8iagvmHnhF1cJb39vfo2dKOSHJTQESuzs3evWH1sIJFbsCQOG1MT0OA
         mK73IG4C9TBArFlYue0MZDLod1lU35j0spYE6n/97FTrBdifq9aofZZVJhkwseaQXsT6
         FX1UVBD7/bjmqIbaJx+jGTHEsKV9HE1IVWWx4R+vgnj6ZaTyREgjw8QX64u1o71saD4E
         eoY20a7O5kpRNJS3NjnAwH0qorEMaPm9OHdjkJC0Th7/+XIlyQcjbA5/K3cusOnEpZOO
         rOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910383; x=1786515183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zg54fHJsqxob2qajOY2ZU/PplLLALkFA7N5BbCg732Q=;
        b=mWzhwlW7gQYb4B2ZpCptbUuKM1UJR+TtVG2NoxAdwtPiSpaVwFaHyHJiJ0x4xRGcWc
         QuiirhtZlzq33b6gbGNvBdItlkZBCYJUqK2Gtw5q9NiWb4yoJkEi5uo+42JKgGLyd7Kn
         1HRe4FCfYki/67zmsGEDn3eIOeQc2kBZ3xzbE54QS0MNfAKeZGEtUSYSd5PMRsIABiVo
         bVfYk3H32R/QXC0MrArvr0SXMHFMXas/nRMW2X7fgnIWjb0r5tbhB8TP6WVG8FLciL3k
         EIfhNB5NyYgwIqqOd+AJJhMTnmC5teeurSyQH+FGV6Pj7mNRCO2RvsZ/IFLFBbWueHIU
         DGvg==
X-Forwarded-Encrypted: i=1; AHgh+RpVBbrmpPgLOdMzSGEIOx4S2tuNQHjwOOVZpHuyDd2Lm4WeFWQ+WaVdmbAGWgp+d/AkwP3rrdEV@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzqcf/c434vl2YFiDUxWQKKOV7j7NyHd/dtmHn0q/Bo60ddaQxk
	VCrcnGX/2hKywmHBJWZHyRR1K+FQiPio9/wS219JvjqAvBVPoOQxpyzovlStGQ==
X-Gm-Gg: AR+sD11FllUPfoJRGaoGsyAnoKdJauLTcuntI6tG3JGwtjlyQux6qO0ad5gxTLZ9q/X
	hz5MzkHY2onRMyN1/or5qr2xO+1OmT+Y+r3togWJNLyduEEHoS0kphETI/W1srrYygp1Fiee6a3
	tStks1rWKO48J9oPngMVqGIuJst02/IyP2QVtVUVS7Z9IZf/2pKR4Aur3fZMO49av2P5onmhY9s
	wbtoklOhTyDT7pv5iuCX58DFdQGmeiSwH8NsM8Vkx08RpoOPGqN/R1fHWI6H08GnmQZmZEBMkHC
	Jt7hQkJX6O7/TnEybaZ+tI+Fea3wRgRRAhJKufX7VQ3T1fxfxxYjUkPdqpDCBtSoLwxpUtrT53h
	xDIGei/lOwmnc7Rb+sZtNwa3Tj3ZvD+rh5PrPWqkI24KLRUBrIuf+p/sDV1P+KcrwFM3NUnTUH/
	gTAPFfGm3YgGur9vAASRK7cQ9knDDikOjbH5EXImN9uIvFHvX/kZGumvhUizFVcQ1eK7jDiPcTR
	zGec3NFbUxcn/b8OpezmzyNRBTNULAQ/pY=
X-Received: by 2002:a17:90a:d445:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-3903c66ba04mr4597432a91.20.1785910383335;
        Tue, 04 Aug 2026 23:13:03 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917ae54sm2009561a91.8.2026.08.04.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:13:03 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 2/4] iio: adc: Enable multiple consecutive channels based on model data
Date: Wed,  5 Aug 2026 14:13:07 +0800
Message-ID: <20260805061310.1740724-3-chou.cosmo@gmail.com>
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

Add helpers to generate channel masks and enable multiple ADC channels
according to the device model's channel count.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/iio/adc/aspeed_adc.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 8eebaa3dc534..3ff24474f394 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -123,6 +123,24 @@ struct aspeed_adc_data {
 	struct adc_gain		battery_mode_gain;
 };
 
+/*
+ * Enable multiple consecutive channels starting from channel 0.
+ * This creates a bitmask for channels 0 to (num_channels - 1).
+ * For example: num_channels=3 creates mask 0x0007 (channels 0,1,2)
+ */
+static inline u32 aspeed_adc_channels_mask(unsigned int num_channels)
+{
+	if (num_channels > 16)
+		return GENMASK(15, 0);
+
+	return BIT(num_channels) - 1;
+}
+
+static inline unsigned int aspeed_adc_get_active_channels(const struct aspeed_adc_data *data)
+{
+	return data->model_data->num_channels;
+}
+
 #define ASPEED_CHAN(_idx, _data_reg_addr) {			\
 	.type = IIO_VOLTAGE,					\
 	.indexed = 1,						\
@@ -617,7 +635,9 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 	/* Start all channels in normal mode. */
 	adc_engine_control_reg_val =
 		readl(data->base + ASPEED_REG_ENGINE_CONTROL);
-	adc_engine_control_reg_val |= ASPEED_ADC_CTRL_CHANNEL;
+	FIELD_MODIFY(ASPEED_ADC_CTRL_CHANNEL, &adc_engine_control_reg_val,
+		     aspeed_adc_channels_mask(aspeed_adc_get_active_channels(data)));
+
 	writel(adc_engine_control_reg_val,
 	       data->base + ASPEED_REG_ENGINE_CONTROL);
 
-- 
2.53.0


