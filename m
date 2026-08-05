Return-Path: <openbmc+bounces-2376-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA769C55174
	for <openbmc@archiver.kernel.org>; Wed,  5 Aug 2026 06:13:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hFKpT1fbVz2ypY;
	Wed, 05 Aug 2026 16:13:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785910384;
	cv=none; b=dxDEWT34gW1V41CeaqifRZC0i1phIpSlu/atkFnpcU1n4lAqglf+uXcZ5XDEJunEXW91cT0eFWDAsbiRXozaOW35Yjx2+UkKrtw/qlispG9db8mWK+PFWW4vK5+x1uT9DdfGy07ieBqKzlrV+8jtbVDcIx1U/KXSZXyLT0MtP4uQym3wTGTQUaVNVcmEZ1w0T7QhOK3lc3PLUNUityyvAOSNGjvz4ukUcf74uto6MoYWkytD3b3EDObcEYwG/xzKjyN8q0fO5bIH/zl5Gzp+00ql3eFR2fVqRD0m8KmUK85N/TH6UnsHFo2z0KIIdaDbVjZzJDJL0ZSZGWt63tgAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785910384; c=relaxed/relaxed;
	bh=keXdhw4rJtHCZAUhrJeIkpCw716WCkjw7CbjCZfr3EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JoeyvYmduTkloGHWmtZ5QiIj7Pl7vuCdjlIFDS5oAslQUDQnN89Ilo5k6YA+zM+jmJbgIsJHPUgJeHwbJJoIj5ieKS9SADXeetl1LEBOtVr54Ehf87lOYooibwASixdmopS7mqXrTQJMLr34c2dh636MQg/wBTScis+sO2VptasCkZX08YlfAK7nMwI7fUcGOYvYc3N5Cp7mPg9AO9TpFAtGUfetBalqEE4isGNCh2OYH3PK4anpH/ujWBZQWuabcdiyY1kaT9HNvZ3HUk8np4e/dAP4PB5oGqFCaVn2NdTwNsPW2IsGYoxPCp/JfZVFVtWoLn4/jNdhinqAVTlCyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gaqq6EHN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gaqq6EHN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hFKpS06Btz2xqM
	for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2026 16:13:03 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so450479a91.2
        for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 23:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785910381; x=1786515181; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keXdhw4rJtHCZAUhrJeIkpCw716WCkjw7CbjCZfr3EM=;
        b=Gaqq6EHN+BIcHDsA2+YlXWMfcpydnBU/9uTJ2HV4RnROt9w7m3JAPT+qn/3Kv5rqr6
         iBcvQHmhR394zbb6xo/n9QnIRCXKno1l7sJSkryvDdLUmUIWdBzRdAaQrhWK7BHff17X
         DWh4F+MNC6qTrg9R51sNh/u2bn8H3u2ohyWJHl6kaSCGPu0M1vjvjnooBPKUcfdgOPmJ
         6zpH1aYPYH9xlgs1f6I3YBHEy5iPmcJHupkviG2kwwUD6lMmjxkeApSCGf7SBdN0j1ly
         KuQE3uiCa3Shwq0sUL9WtAD5rdVIUutgSHi16ZKu5XyopnzpTiPOmRt1ZShJb0hMneUA
         PRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910381; x=1786515181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=keXdhw4rJtHCZAUhrJeIkpCw716WCkjw7CbjCZfr3EM=;
        b=ZIrZTPeary+KgD8/roxrtz0K3gUJCG0nC8IYdiXh6K7wNKrZSqHQLxRZTFQxRx3kdr
         /+d9pfPNfHS2aYQ05IM5MCPpTgQ0uT7Djk9zni5l2ZRJtUI7WH2rn8beJ69+X542RI13
         KQj6EF6QcVMBfYMsZkXrlpSo6bGCoUYGuk0lnyxAKN0zeDcD/Y7c6up2vMQ9+wcyMKgw
         5NmKlSSlk9DdrOudOgDF4pVjvKN/a566sVrkCIPE5XPK5ToaZAoOwLiNMDnEFlE/vddS
         A2gDGlxz4kDB2WzVHXZ5CIYi7dmGekFlPZKi5PjEl27g3MX7pEl75A0MQBOPuVQzXwYy
         3LQg==
X-Forwarded-Encrypted: i=1; AHgh+RoAZhEi2au3ZoZyUPylC6XHc0C496uuouvvnjNB0UCuZnGHDNH4Bjy0EMKdXIdAC1GPE0FPVgdQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx65O/LnNU2/4MV+ubrAti3JcmVEFA+zjP6WizuCPOETZnpvCei
	rbRNJZDXhU2PsvMK0Wu8ItauA3yo/o3Au01XEmf6JYfTkK19ej5Twybg
X-Gm-Gg: AR+sD11ARttK4E6KPj58RbV61Dy3+P2Bsym5W9sf6AYTYIidNIKtQgp+ZOwodVXKp9C
	KlVnhJwQQx9YdPRu31CHSZdXy1boxwXib3VeignvxyfWDmqreY0+2n9X7QGgNWFmhok+g0JN1Qr
	yylie4JlldcqKwJUAok5D/m84fW7MlyyLAwP32OTL+pIQ2adtw+YCDArEdLsKedqEwnMoMt1jkG
	3Cdi4lNZIU42hdXq8po/uY5hx2x/93BjsDljOVnC/zTVs7lTEDVtkASXW5YoUZII4kFCHiMCfUz
	ckBnAnhCmofl3MF2SKR+rGjjxzWYz4e7RJJPat5BOkIK8rLMlFSg+cdexN4LPQaS+uvgnTEqh2N
	TIigwmjkiKSHTxql9U+Q7aAr5eDfNC9odx5fE6aAbbY7+ikRaOH2L29sZm6f3XQ3I79E0wgxQp0
	ZWpKgf7BE3aphLxjjdCER4UG5AxSaRR0p4eMbuHLR5z/pFyAz+BUcNEAqBa32WlixCCJEDlt7Eo
	3ofwZMzEc360SNAMtQzs9tLC+bCZb5b/Io=
X-Received: by 2002:a17:90b:3c84:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-3903c54ac31mr4383278a91.8.1785910381438;
        Tue, 04 Aug 2026 23:13:01 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917ae54sm2009561a91.8.2026.08.04.23.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:13:01 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 1/4] iio: adc: Add battery channel definition for ADC
Date: Wed,  5 Aug 2026 14:13:06 +0800
Message-ID: <20260805061310.1740724-2-chou.cosmo@gmail.com>
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

Defines a constant for the battery sensing channel, typically the last
channel of the ADC. Clarifies channel usage and improves code
readability.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/iio/adc/aspeed_adc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 4be44c524b4d..8eebaa3dc534 100644
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


