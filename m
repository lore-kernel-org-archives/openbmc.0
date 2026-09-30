Return-Path: <openbmc+bounces-2685-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0370ECA5FBB
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2026 07:12:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvmT72wqcz30St;
	Wed, 30 Sep 2026 17:12:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790752346;
	cv=none; b=RVJKImMNcZDTTWjnPsPZmlnS4E6ze599XLC8Zw+eVdyD9EkpH7NtymBc9XEnhuJlLcwah/3TW2PocXkN1Fmx64ijjztTQkjXtgZZ64RtuEzE9ROl536rE7fRL74P90LbXd9uywXYYpW2SpZgizTaqYdb6hP78+msCD4rweopETIqCXqXmsxXwszhwt/QDor3FWfXobPkkOONTQoRyOO2qDZUG3Yzg3WyC4J1UAvtSfiWLQlDdb1JuPL8m1NxoSP5O5V1Uvq6gi1Gxtx6PK571lcqKiLKa8VgIDo6BgHSrUBNvKh+4v2zldylL0ivunGmDH1eaPEvgTEFQk96Z/XqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790752346; c=relaxed/relaxed;
	bh=bKxKbtlSjWfNoWPSLj+ZfyXt41fGNBsHBaaf964uOJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZUUZ8xUvnu3FtZV7Z9zEY8vkYJYY6k5pIlS+mFYCIxR27sRzK3D5QWwW7DfJFRXqhivQl0FuywYHnIztpeC+G1F8+GxQsInCHyKEPXqnd0u1YZ9eOnYhvoBgp8Xb/Gbmdr7BpXUWGHDHHExifHBYTTHYPGgS9KAVZ9Ktyokb40nZkUcNJN+Y1vZNL5Oo3m9n7X0uZZdgwUIQwcW084g5XSyrgN4I1liQV/YcqH4rR5FzbuXa9cFeT1mR/ArvZLmefCbpnWrnM3voG6v66MiEDggbDH/z3o194svH/OTOcHwc3hhLjtr+D4p5dD1fM1lZJ/UWKK/1UhIhYKEwm+0xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LC3BX8/7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::29; helo=mail-pz2-x29.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LC3BX8/7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::29; helo=mail-pz2-x29.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x29.google.com (mail-pz2-x29.google.com [IPv6:2607:f8b0:4864:3b::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvmT60bsGz30FB
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 17:12:25 +1000 (AEST)
Received: by mail-pz2-x29.google.com with SMTP id 41be03b00d2f7-cc7d1403bbaso512909a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752344; x=1791357144; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKxKbtlSjWfNoWPSLj+ZfyXt41fGNBsHBaaf964uOJQ=;
        b=LC3BX8/7Rpjfi6wbriCfl+ZqtthBK/Z49lnev7OZcakHpvWtYfDRFTw6l0ucx+A37N
         joT8wqKFLWNCTia/xTLS+3g6wEXHmhXfd/DJt77BFGwAflKCeMFjwFSY2+aopPCw4Xme
         lMuWjnj/tpmcQPTrjxEARX/XzupHV0ahCe61inExRWmlwujuI+vX3j6Qeh5UJCbfOkTl
         PGrkg0WEmMNkqqUqRCDrwEsiRIRIeN3wAmx+MRO+VrM3EDt7w3GoF5aePr3OXvdMgduD
         1EduYiY/za+ADtC5sygV9AdAqc4XhtddLh9viRD/S/TzB4sn2gVIjg+NW2KFs6ImPMOf
         wO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752344; x=1791357144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKxKbtlSjWfNoWPSLj+ZfyXt41fGNBsHBaaf964uOJQ=;
        b=qh6EK+YSaX6NOmfKWZDrZrT8vEjd9Y6ako2SHnYrakdUtDt5OJcTFpI19lFLUyKaP4
         izp7Eo0DgCdMVeZ1pWBdDiwBNp7973qUgbSxAQQPsKSqDoIWuOeIHG+n66lOwsbUvYfZ
         VrMWO2F/2a0na1IzC7CjmhWN9ghGyPYHMuFB45GMSsLxNsTnRS1kg3DcXnJPwo1IZFBv
         xW+2s/V/oXMgp119JpoPPm2AexGCxh4MJZWvV7iYsPcnk89NJd03bf7D0gR1BR/2S7jw
         HwBglirfryMIg4zb+yfSFW6dbwONu6u6opmuLWfGSI5vEucmkyQINdfeSULmeQ7ObDKm
         8+Ww==
X-Gm-Message-State: AFuF++kgYpUtRPLB7zihdanZsBvCaN2702Fe9S2Hzy+G7HWx2QrbgV1p
	3yxxunFMzHYt0JT0m7OcNQs+mK1zBFMO+pWF39Ai1LjAAOu7VmYPm6jAM2XUIQ==
X-Gm-Gg: AYBFou38i+hNrgcPMsUjJhv+MwHC6vmVG8Ua5dLwiOe45784Q7VSiIqIvfDZFOHRj9w
	7uzli+0SR/9bq9y0/niCvnTEoL/zo3QW4tTfAw0/miGQoidSv7q59Lhwn6xeWR3vkIUZFffvQgd
	xZPxj2SOsxupZZv5Tm7cROPvcFMaYsrrP/uz4GSh08IuumHFD6aR9L9WcAONX9GwhL5KREZyOL3
	0fYlKyPdHUsVhWv5TNnDHNsocQJrs6NJJqSkU+ffqX2iKbJBNJaxJYDNBLvUeHfflFnGIuAKB1q
	mnoVX4+mbrMOqUdaPAidj6NIfB43J8W71Bp0Sbrd1EEOSz91rIb5mnphTrzvD7pKixcOJFofvWz
	vD5ZCbNlw61oH+eWWLYe4kVDirhI1zw5fSviNiknGpn6ArV/J09KUxgN7UqlBHt1LXGvvluFkoA
	dob30hFC3I0u+0JI7Xt+HZloySKEAe1IkdYSYGfuUAhRa7N1bW/TbtNsceI1+ftV6IDG2BIIOTb
	zcAyaQZujanFaR9dG1Ym+lPadG0+lmix4XfNekjSLt/
X-Received: by 2002:a05:6a21:1145:b0:3dd:a006:7b3b with SMTP id adf61e73a8af0-3de9e747957mr548319637.58.1790752344046;
        Wed, 30 Sep 2026 00:12:24 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d63a9csm327622b3a.34.2026.09.30.00.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:12:23 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	tan.siewert@9elements.com
Cc: joel@jms.id.au,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 v2 2/4] iio: adc: Enable multiple consecutive channels based on model data
Date: Wed, 30 Sep 2026 15:11:33 +0800
Message-ID: <20260930071135.19297-3-chou.cosmo@gmail.com>
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

Add helpers to generate channel masks and enable multiple ADC channels
according to the device model's channel count.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
(cherry picked from commit 9ee1c3be164de16bab382197202ddef8ae020433)
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/iio/adc/aspeed_adc.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 09c949c1abfc..2416b4c9ad4b 100644
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


