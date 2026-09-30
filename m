Return-Path: <openbmc+bounces-2686-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2371CCA5FBB
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2026 07:13:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvmT852VDz30TY;
	Wed, 30 Sep 2026 17:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790752348;
	cv=none; b=ngaJn/WE/2IwuHBemxw9ZH5dQrDhpYH45DMRwFxZEDnteb6uNInK0na2rNtGpJ3xnjBYWQrgLrj6IWsgy/y3K6xs1m8DDRH/1anT2FjFZpWa184DwcN830saLfH5le0Q9vOuRzp28tIkE54T1Gfzh1UR80vKXtkAuuR2yutksPG2jS7CMdRc+0M/P8gNJZSyQK7qIBUktSbV5CBUealcNSvvqVmloIMtFlYoPxfR0FURYah6CyPZJ8clBG5HEoX2zdnwjjxf4FfXQLmnHzJ/jxp6BrPGcSxwgchJ/tqQnpAPLQ+6ajHNS8rRoo7m2yeyOV3PYDpjSZH4JENhZsmKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790752348; c=relaxed/relaxed;
	bh=G1cMOVo6ojeh6PGpGkxSI8gHP9cIfcMDOf+Dgd1rXcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/Z5yooxZp9lYVOpk3zuW+2GA/NK5l1hd76H7fcvZMsBoA6PDljU4s2oSMfMalH9CZwYIFKYEIeH5yqrhUMHV+pMsO2tAzu8aw3CKA931ateaDO7wmjwc72TF1bH/RB1zdyLjh4Ejt5QP5FH71qXoUpGPJVOHkO6fqERgmkxcpJnFYyWOvwUsjnvbvgAdRCFmXwmTLZlmIntLnk+ntsUM77MpttM4YTXBkd5JEvGnIYA2SXYsgNr87eXcosT+hQjwL9+svh+1r6F3IEOSYMZdZH0qTH1Oyn2fjQPDyA5ss8E47YhSb2nd0ctjxq47uZ1+K/fSPiCXfg0sCnWx5zSMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMwgn/U3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::d; helo=mail-pz2-x0d.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMwgn/U3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::d; helo=mail-pz2-x0d.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x0d.google.com (mail-pz2-x0d.google.com [IPv6:2607:f8b0:4864:3b::d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvmT756zvz30C0
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 17:12:27 +1000 (AEST)
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso2437409b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752346; x=1791357146; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1cMOVo6ojeh6PGpGkxSI8gHP9cIfcMDOf+Dgd1rXcc=;
        b=PMwgn/U3nnnXMldFE3b8RC1znvsCM6tgzwpg1dJfbAroQHwjvY3g0sHRBrxgIgZHXL
         0yxZ6BJMkYghlThgvTypmMLhhkFHusHqfBzc/wpXA1ZAV5zBTLHH09QSc7UzkxHup5lz
         gzakEJQWq/wx78Mv/9MH7+gZsoK4JiNTUt2pjAnjyo/HGOdObTq4SczDqbgROX3BkmGm
         LEDnapzPA1XYPSz/wTwO7QxKObEfjwbs7tvad6gUgnew+q1UdAil+sEfTyh3BTSXgyAN
         POYy+HpEdAUOkY+G1DDuXX4oukOXbXkwccoYNwPCcwxwinG4bESHQkmeRsIaOsMTPaYz
         oAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752346; x=1791357146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1cMOVo6ojeh6PGpGkxSI8gHP9cIfcMDOf+Dgd1rXcc=;
        b=hBhY4/gymABcFPMXVY17fVFQXpyKy3jrXLYSCwNYfo0ghSYCdxyXN8Q/ntDsSqTbhN
         zqILyVytZXUdNrynQAYPUsjn5qswYtT5K5j0F7A3qzoWC3rRtEznXpIl1UlMV9RHUVHL
         BC9CjGf02U1UWy3aUxQAvejq/c8jCvCt5No9MLx+JlkbMiMVxOUg/w67j6lfaRKV8lcS
         QNhY3AjgEZ97Tn2rcHmI8V3j6otG5LeVV0e0f7Tg3eOWxGB9vfmBuABrbbxJckbZH8yb
         uZyV07+K3REZ2kASiHGpg7Skld9+aEhvZ/dVwmpwySk45cCL+Q42du4FL33HOcSHBAXD
         wtrA==
X-Gm-Message-State: AFq9FYLEdF36kuOmKq5mCmvrYw2+bTyB4tFBWIq4VXOp1CGwEs1K3j6c
	QIvaqwD5Sf1MPefKzxOxsk1nx7N7n2Q/1Nh+AtpiK4R9sML0QvvfKaKXHP/NTg==
X-Gm-Gg: AYBFou1eORkzF7ifCL2lslBt6xi7gq+5wKfeQx3lzFUH8KgMrMjlDMZKyxdKsVLeA1B
	FiS4yP0WR7KEPaaQQIOno1ov4tj9iIPpPy0M2YhBFZeNwV3TJK6nXrkl0UYz9kwOl+UE/JL+SkJ
	gfx/fIgQKb+AQqysvnQLu96PM19NBdF4hTWrmsuIuoMt0BqDJFzgYOUIsmBkS2gkuXKFfW6dYDq
	BI6JMok5WBlRzGiCTCnhUU4fE3TaxXpQpCJaTPRSMpzIvPFf7jgLQQLTQaomon6Rc76pZ4mSDeq
	qf6zArg0jLN1mcu0SOhKzir2RSgw2hzCf7l8ar/z22KH6H2UVfQ8G4DQFiZr3VdqJtlW8SRmIXR
	GKDXzFH6iF0vZAuU/SECOJ+FhM+lq0fNVI//nFq+RigcJy3OwJFiUICNI5FoM9n45Ez5zquim1e
	/jHt3apegwUABeYgrFVFjKyctAuGSfCZXbdjN00YPBkw0Pl83Yx/2aOwDxZP2U936GDjGgt/q+0
	s2RxYeUQF5Ir7LFKZolW14sdDtsQfRhkco+lM9tiI5v
X-Received: by 2002:a05:6a00:23c2:b0:881:158c:3b59 with SMTP id d2e1a72fcca58-8874e05eaa2mr336639b3a.57.1790752345762;
        Wed, 30 Sep 2026 00:12:25 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725d63a9csm327622b3a.34.2026.09.30.00.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:12:25 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	tan.siewert@9elements.com
Cc: joel@jms.id.au,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 v2 3/4] iio: adc: aspeed: Replace mdelay() with fsleep() for ADC stabilization delay
Date: Wed, 30 Sep 2026 15:11:34 +0800
Message-ID: <20260930071135.19297-4-chou.cosmo@gmail.com>
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

The ADC stabilization delays in compensation mode and battery sensing
mode do not require atomic context. Using mdelay() here results in
unnecessary busy waiting.

Replace mdelay(1) with fsleep(1000) to allow the scheduler to run other
tasks while waiting for the ADC to stabilize.

Also fix a minor typo in the comment ("adc" -> "ADC").

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
(cherry picked from commit 66ab53c286989634acaa2c4a5703c0f647cb9aa3)
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/iio/adc/aspeed_adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 2416b4c9ad4b..32eb5f89cb12 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -259,7 +259,7 @@ static int aspeed_adc_compensation(struct iio_dev *indio_dev)
 	 * After enable compensating sensing mode need to wait some time for ADC stable
 	 * Experiment result is 1ms.
 	 */
-	mdelay(1);
+	fsleep(1000);
 
 	for (index = 0; index < 16; index++) {
 		/*
@@ -314,10 +314,10 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 				       ASPEED_ADC_BAT_SENSING_ENABLE,
 			       data->base + ASPEED_REG_ENGINE_CONTROL);
 			/*
-			 * After enable battery sensing mode need to wait some time for adc stable
+			 * After enable battery sensing mode need to wait some time for ADC stable
 			 * Experiment result is 1ms.
 			 */
-			mdelay(1);
+			fsleep(1000);
 			*val = readw(data->base + chan->address);
 			*val = (*val * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
-- 
2.53.0


