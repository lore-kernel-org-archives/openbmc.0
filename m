Return-Path: <openbmc+bounces-2684-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3BACA5FB1
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2026 07:12:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvmT66z1fz30MY;
	Wed, 30 Sep 2026 17:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790752346;
	cv=none; b=eqSUsIi755OYcXV9RRoIRxgS42+e+G3aPeYUsQcv+oPr6v82icgjr0qItocQ6J6MV/NIpLkUXkIPvJv5vCbgdbbP3FPfWqS6Co4+dLugSodGgRxOiPCq0uUXC8BIYNrsbY+kQflxXGrCD+VPNW9TCL8PHR4HtApX7BpY1ZOusxH9XLyM8eRO+/9qfP+6J0sKUZbLdOMVyLivvrt0l8pT8wAG8mn3blKkQIR5qEk1rSKTqPpEPUjm4ZdPAHzckAPp8gTbtpQasQRhnWWdtXaswuhPcPSsN1ACkL1GBPqpPi0Myzw/6jeeQ0a8m9RuBy5kHvN9TQPtg2dU0VZOEc5SPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790752346; c=relaxed/relaxed;
	bh=4eIPfu29j9m72ra18cwtZJfbrIqKJCJgCbJ4gfXzNBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T564dqPAtzYM191HplX0yKdfDb7zNrhieAbP/rUuZm54YcMRT1VQ2uspHfvIyq8DhPlk4xNEVh24L9lOorW7s1Dtfl0vgB7Lq4JYXNTrCJOC32kC5VudHRMrSeF71leLcV7X7tl1+d1+Bqz0LFH0Si52YwtcbMnN1CzeuKpTgOxlGYC7B4DBW4++H1DH5oDSkBZY4iTYsidNj0Lm42ady038QZUxtVTmSPqnHOar0nAO5FBM0qW5IIQUGC4YYsDYIYb5bM6slEO8qp8gkKpvLA3fSCDhyZUzo3B/AGGnOG+HgLyGjyio9jWSgqn1yWecucCETmCyM2oaom7AHExRRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A3RqxK34; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::10; helo=mail-pz2-x10.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A3RqxK34;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::10; helo=mail-pz2-x10.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x10.google.com (mail-pz2-x10.google.com [IPv6:2607:f8b0:4864:3b::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvmT45Hjqz30C0
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 17:12:24 +1000 (AEST)
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469e25400so2012981b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752342; x=1791357142; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4eIPfu29j9m72ra18cwtZJfbrIqKJCJgCbJ4gfXzNBk=;
        b=A3RqxK34d9OHj1S4J8oZzFrcUpoabT3SKdyy50MljnRJL0TOO6CYz+6TyCki4mrN7E
         sZ7IDN+1U04g/94WcyU3oZy+X36olwn7aTYcIj0y9zGzz60xnmQhViCWpRveazW1l2d9
         hE+NiwsDehwAKETQSvJSYBMfcIGV5dMHS4ZDlprWH5NuEWAwBBSw+4QFKvvLtFPKeuJW
         E4nAcwznqecLLjswcPNQaSnFSmYmz8IIny0YykSzsxg9N+eg319G07qTbe51QiPnexTC
         nojKXVa+LnMTvmj4mZLRDoPFINAbrbN3fVCkhpjxlO4rJQxdNA85WXD7ugS0rnTTWici
         q1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752342; x=1791357142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4eIPfu29j9m72ra18cwtZJfbrIqKJCJgCbJ4gfXzNBk=;
        b=d7G3uVM/YsoLivxkCWKauTcsoss07quWIBm3lglg6CptXcLlCekS9ZS7tfOMv6emNt
         BNkbsGqb0nMEZHUW8jUtrDDNj5U3MLsYcDSER8xkSYgyI6yy46dmBu+m9WhZrjiCc1PE
         n+PUd8p0QWJDQOXJ9LgXKco9rpLDXD6MMj/el3EtqJtIr7mL2Dzd0cc/mFCyFBKncFk8
         4MVtIAWgiX9NYm6XqIkqCB7cNAUSJmq1xWPmmrmgyWl1ZdlFX+eDHlt9cgzYfEXeaRCq
         3oX19D8G7XOop76aQCN+EebVt1uXA3GEsG6eEvikSC4q9MRSWqo4qW4RHDn/dzDOSYQG
         YyqQ==
X-Gm-Message-State: AFuF++lAELkgLvtrf3zPsRyOwIoowVL3FKLGNZ6wtAq9VXILo2Mbgtib
	kxATnsPHv0HcNRbF3VjVCtkMG5iYVyNCBHwum9tEFHOV/qbZJ55JNW9tiC5c4g==
X-Gm-Gg: AYBFou2TheV2ctbTN3OBf6OLHeKKXY/v3RTfG8lpPoQdm20dO5v6o1bEwxEB6bZz8Eg
	wACR6N1+vnT0qP+LWxesAQrt1Rsu+KbGuCXxK7RVBNFdUjZBskhb91fRKuvgh6xb2eYIsNEzTtF
	zaIXG5u/mFz9411xDflVea22KKrD2ZEbC+fRVD7iO37DGa+s8/jipfJ+bjtToUpWCZZfUPy1m99
	aT/ObHn9NMKbPOOfjUt4LoDsTHqOyhHf/P3lvicipVHfvQSckuc3kFq3dzz44lkCD5OZFOErY7n
	puIM7W1lxAzSbNhzEGg6kkVRkHlba3rOoTDWS0rNsP4sKlO9M9TcFkBGds+vgSgJJeY9beGNQ9d
	OTDb6QoqlmrALZK9wfNiRjyL6SlrHP+puAlbejssYQA23kwF18ymzUqcsYKHW7H9pvHD0w+RFy6
	eUkS43VtvCD0ZXLKWmcYtEaUFc7QCFkNDFmf8n8A5KY4iZpQ1+r7JrG7fWKLndZqWb7cFLahwLr
	Ri6PSo5+RQg/CdnN66HvCmhXz4Kkcvh7Zi46GqzN18z
X-Received: by 2002:a05:6a00:2e2a:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8874b737e85mr365069b3a.32.1790752342315;
        Wed, 30 Sep 2026 00:12:22 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d63a9csm327622b3a.34.2026.09.30.00.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:12:22 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	tan.siewert@9elements.com
Cc: joel@jms.id.au,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 v2 1/4] iio: adc: Add battery channel definition for ADC
Date: Wed, 30 Sep 2026 15:11:32 +0800
Message-ID: <20260930071135.19297-2-chou.cosmo@gmail.com>
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

Defines a constant for the battery sensing channel, typically the last
channel of the ADC. Clarifies channel usage and improves code
readability.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
(cherry picked from commit a28069be7d34597159840c4a0dfd3886787455db)
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/iio/adc/aspeed_adc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 8ab29948214a..09c949c1abfc 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -75,6 +75,8 @@
 
 #define ASPEED_ADC_INIT_POLLING_TIME	500
 #define ASPEED_ADC_INIT_TIMEOUT		500000
+/* Battery sensing is typically on the last channel */
+#define ASPEED_ADC_BATTERY_CHANNEL		7
 /*
  * When the sampling rate is too high, the ADC may not have enough charging
  * time, resulting in a low voltage value. Thus, the default uses a slow
@@ -285,7 +287,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		if (data->battery_sensing && chan->channel == 7) {
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL) {
 			adc_engine_control_reg_val =
 				readl(data->base + ASPEED_REG_ENGINE_CONTROL);
 			writel(adc_engine_control_reg_val |
@@ -309,7 +311,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OFFSET:
-		if (data->battery_sensing && chan->channel == 7)
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL)
 			*val = (data->cv * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
 		else
-- 
2.53.0


