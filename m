Return-Path: <openbmc+bounces-1831-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBB2F433CD
	for <openbmc@archiver.kernel.org>; Thu, 16 Apr 2026 00:02:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwyqG24zhz309S;
	Thu, 16 Apr 2026 10:01:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776160780;
	cv=none; b=N6JHyXkgol0KAdXBMxVDVHLlOaFOa1UsCYBuRbfXqoeFGiKCpQ5mWJjDazA9PVbMrKMugDmfq8RgDcx/NdqIFMiT9Eu0FuQukpqQiTwPvInRQPrGwRc02wEDUcxP4LmTzhuTuWcaSHVbX+Fl7ENchoizwPFTx1jUSsW9LzwT5FAjkQO9aK/odEpKOGBnWuCPgsYIUtSafZC+mLIjxZwT8QmTjuPIHCCVTEIN9fnE8NnoLC8PBS9F4WR1CQZeJ0SX0qvQU9haNYmtGBbkbJIJzdHbJB3rc8uFxagtmEPwsPQyUrr4n6pXQLWDAXkG89a9al7lGoAX3W6OYlfbgBnavw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776160780; c=relaxed/relaxed;
	bh=TDjpdI9JCOPXXhqNdEllBIg0nb987Wi+gjesQzdTWuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8m8nTxTUnKEIW/Njla9fMQsHygJbS+G2gWJx+d//0b/vo2e6APDeObMtQA4xYLmffWaZULszJ36GrNiMUYv24oDqAsYA1KWsOR00tOMJmTpojKPTpWuTPLkiQaF1ZB5Y1NigQaceQqOiilThVN6+LtrrpfR0KrLWiQYOwMpM8B4tN4U/JRtHqnuMMWtkMealVDAyK4tu87bpZtGiPAsP24ZGtwBnNfZurtO28VB4E7D0Jx0d/YJKeHQrBUz19f0PH95pgpOoeCB76FYhI26Jn08drFCMyGYpo9jfj852Aj82CuO7ciBJfuT/qC600qO4adkFPskWXthgQ5OvtOYqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XPmKw+5S; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XPmKw+5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fw0B21Qw0z2yFl
	for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 19:59:37 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so51184375e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160773; x=1776765573; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDjpdI9JCOPXXhqNdEllBIg0nb987Wi+gjesQzdTWuo=;
        b=XPmKw+5SUoHXhD7McnB7rY23ndVR5hLaGjkoCx6RKj9ESr8pdh1OhcM1rfbET195uk
         AbV+1CxEypWPup9txmbjQJYNIolv0v5Cqb7M8YCZ78mL3YAPnY/EDPSdqVG7MqSsFrSN
         4pGKGF8JvehD9pqR19jsJFqDdU9svnMI4fg8qztzwG+zMIp5P3f1jjlzBihanZ5TAJna
         seV/gO+XZyu4troe2gT96sFqI6mC2vr0Ztc28znUVo9yJJFwKMlYD/J/3UA8u+2WWH4L
         IGIICJV62rOnxlLqJlP6WokQ8rGALuZU72c2SbB6Ji5UpJsnG+YiFaT6ZR0OUGHjcxrK
         92gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160773; x=1776765573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDjpdI9JCOPXXhqNdEllBIg0nb987Wi+gjesQzdTWuo=;
        b=TmwYbfD1wC/Nv4YhMmzjed220CNhfS77w2lmHiaXIJPWyUIgTe49r8Y8VSY6Y/pn5E
         8FIectJiRSYepqvPEnqqXweKeSAV1VSs4JVYEoHy8pUBDfcn5DToAXBmTFfMrWJYiQ+N
         bMsVmMLF+G9sOMU56Xa5jIO+v2oEyptbowTpPW8QdLRoHg/M4dK/lAf+Z+gK08lszEnn
         NqT2J7xQ8WoILYK9qrhMfB5yg/hcyRGMOExrF//TnfvpoCtkepOKPDol0rBoFfRU/qMa
         K1TWKki4PxEDM3CD8GHU/uB8PpRykv1RgKZnhx6HJXvjJ+WDM9KSLYw9aBTdt2eunMO4
         58MA==
X-Forwarded-Encrypted: i=1; AFNElJ88rzlZWvV0wpJsiqQHrxm0ea2hvOmIFxBLl969rZYr8KwYdBX6vixNs7PKnVyCghsPu4mMbwaJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhUYvaMP71awYPqfdkmVzFkVdZuYrsMjdQR1G5WjDNzSj6wQA1
	XjoDztXEnd5iqLdjxLoORcwDwu7zBjKsEWQ/wh5A5+fylTwze6lFlkkY
X-Gm-Gg: AeBDievh2AszR89rkd6QsP9RzBF/SsQnUrX5vMqRz0s2vyLf6QqLhIbd8zKydse+2oK
	VeZ7uKu9l8Cur6Zubm3CiTZXamN6M3PFcwK99BcF86xiP4kcJPOwqWeHlXT+7kVdEwFkMKeLJN6
	7ctthLBUqkPakLMM6HG2vIiT7eI1kn4ta+9a7XkMICpRr4xzWUxsq5LbXIiplo9hyuJ2Uc43N0b
	Llad2EE+jd9nJnfxOdx0ncXorgvXvUuAgGoYApcU47B3LN0QRlonU+Hmc3m6WPjcoTKDjXnto+P
	U/CfcpCopE9TyfXanb6uHpzmBbOfYd82qC8CnfQVL9acJaJc3+HWoc2NoX7gdQQocmVnaOkWuS/
	sRY73au/RDGpKwCrSPBAEFpHmL92RS4o0KMA2RdsuxmLn5OjvPR6ys9olKVqaoehTMMj/9+9R4K
	fDlJM5tozIZ83hisKzW5SM8y0+TrBZgbhId5Bw9VEd06Od1msIJZSfncRM0fIZw0uGPTSJOg69M
	3b7v/iL5v2V
X-Received: by 2002:a05:600c:3b0e:b0:487:20ee:bef6 with SMTP id 5b1f17b1804b1-488d67e65fdmr230274195e9.11.1776160772762;
        Tue, 14 Apr 2026 02:59:32 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede249fasm37502455e9.7.2026.04.14.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:59:32 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] iio: adc: npcm: fix unbalanced clk_disable_unprepare()
Date: Tue, 14 Apr 2026 10:59:29 +0100
Message-ID: <20260414095929.11257-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The driver acquired the ADC clock with devm_clk_get() and read its
rate, but never called clk_prepare_enable(). The probe error path and
npcm_adc_remove() both called clk_disable_unprepare() unconditionally,
causing the clk framework's enable/prepare counts to underflow on
probe failure or module unbind.

The issue went unnoticed because NPCM BMC firmware leaves the ADC
clock enabled at boot, so the driver happened to work in practice.

Switch to devm_clk_get_enabled() so the clock is properly enabled
during probe and automatically released by the device-managed
cleanup, and drop the now-redundant clk_disable_unprepare() from
both the probe error path and remove().

Fixes: 9bf85fbc9d8f ("iio: adc: add NPCM ADC driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v2: drop redundant dev_err() on devm_request_irq() failure since the
    IRQ core already logs it, and remove the now-single-statement
    braces (Andy Shevchenko).

 drivers/iio/adc/npcm_adc.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index ddabb9600d46..8afa20701756 100644
--- a/drivers/iio/adc/npcm_adc.c
+++ b/drivers/iio/adc/npcm_adc.c
@@ -231,7 +231,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->reset))
 		return PTR_ERR(info->reset);
 
-	info->adc_clk = devm_clk_get(&pdev->dev, NULL);
+	info->adc_clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(info->adc_clk)) {
 		dev_warn(&pdev->dev, "ADC clock failed: can't read clk\n");
 		return PTR_ERR(info->adc_clk);
@@ -244,17 +244,13 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1) * 2);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_disable_clk;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_irq(&pdev->dev, irq, npcm_adc_isr, 0,
 			       "NPCM_ADC", indio_dev);
-	if (ret < 0) {
-		dev_err(dev, "failed requesting interrupt\n");
-		goto err_disable_clk;
-	}
+	if (ret < 0)
+		return ret;
 
 	reg_con = ioread32(info->regs + NPCM_ADCCON);
 	info->vref = devm_regulator_get_optional(&pdev->dev, "vref");
@@ -262,7 +258,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
 		ret = regulator_enable(info->vref);
 		if (ret) {
 			dev_err(&pdev->dev, "Can't enable ADC reference voltage\n");
-			goto err_disable_clk;
+			return ret;
 		}
 
 		iowrite32(reg_con & ~NPCM_ADCCON_REFSEL,
@@ -274,7 +270,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
 		 */
 		if (PTR_ERR(info->vref) != -ENODEV) {
 			ret = PTR_ERR(info->vref);
-			goto err_disable_clk;
+			return ret;
 		}
 
 		/* Use internal reference */
@@ -314,8 +310,6 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	iowrite32(reg_con & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
-err_disable_clk:
-	clk_disable_unprepare(info->adc_clk);
 
 	return ret;
 }
@@ -332,7 +326,6 @@ static void npcm_adc_remove(struct platform_device *pdev)
 	iowrite32(regtemp & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
-	clk_disable_unprepare(info->adc_clk);
 }
 
 static struct platform_driver npcm_adc_driver = {
-- 
2.53.0


