Return-Path: <openbmc+bounces-1833-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7CBF433CD
	for <openbmc@archiver.kernel.org>; Thu, 16 Apr 2026 00:02:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwyr11764z2yvy;
	Thu, 16 Apr 2026 10:02:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775910927;
	cv=none; b=ifCAo0zV4BazBRo6GCOC+vD+vVZF2ukp/6PoQ5mVGyiS436B10QtaJSIgEDFUcjWkTckmzp/3tmwcg//WnQsjyQr7+Ygtjx50hypouwX5G7VHbzcP/aVDGNdNL25iseuSezYNACQ/WhwHYvZnpXKxtlXCC4UfJGCi0DEh8f2AqfFCZltefnTXugdIIFC+nP4wOtX+c5m8CalRsUABgxp8thxu/8oFw1wuhcK0+UxIEmnlHflfoaSkOTpB38pmIvA2m51xnHXsyqZta4p2pbGisJIjw0vc+O3tHmoTkgwyVwKW8fSq5vg7guKNrrwB3xo/9xqhQnJqqg/eD/RMkjanA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775910927; c=relaxed/relaxed;
	bh=JGoFfy0QWc8BwYX8irlGqExRr/Ktk1fkaAh03XIjtf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fjhwm3KQeHlCDdD9diowEf1AikenW+qGPJGCEUiNlP4g5pVcj6h5AXcQJN74M30F3wmhyee/b/4u5OegBr43Y4psRiKXg0yDMbN9pudayhPmYs6heaB8NSOrOjr9Uw7KU0bxEwXprHcHong4m3wiE+oOErsMjyTUKO/R9fuD9XYvpJkII0TBt3rrdton7VWjw0FaQgZxsRs8ZLEyYAlm9U9bZkShZGmm2URpkSEsXEUca3zwKrUfYk4GIX90+Z2iGzWUWGx0zSgEfDGvkoWt2qjKl5KjEpwhtvPc3i0LkwmLzGSn/b2HCyHIlPM5kN8JcBRQ6Zu6hUyDoyLL/QGeDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S5Tw8P2Q; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S5Tw8P2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ftCnB2l0Gz2yl2
	for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2026 22:35:25 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so1813034f8f.1
        for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2026 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775910921; x=1776515721; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGoFfy0QWc8BwYX8irlGqExRr/Ktk1fkaAh03XIjtf4=;
        b=S5Tw8P2QNx0l9+Rzn1AzT2pmqjgkvyFIB+9uQj8aCqLmFX8M/Pdm48UGjWgg3wE3PK
         9y2f+xY8kIjTlogBTRt3wFW7IyhjaSYdvyddks278RGJSoGSh5baDSlhdA/DQghOta5a
         cuUi/F+Nk4aEjFk4Yy4FnEyUcKZU1QwpzrBQ2CxfsCVJTAweW7ii4DIlQ+SERi+0H+N2
         f9oVoQHEH1hJ2XmIkdZJ/TryfDW468rg5zOK1pxySa4LgUNMlnqXFZZUXoIpAnHym+RC
         y2DAEzjciGSHFRcp4kBYW7ya0L6JUNtKFBT7QjHdFnXRGsxSFBJAC+qNXcT0D5S634DU
         UBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775910921; x=1776515721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGoFfy0QWc8BwYX8irlGqExRr/Ktk1fkaAh03XIjtf4=;
        b=CQjLIydVtuFCO6OV9jUhCLn9+DyOY7zr0Phr+nuL0An4TBr7zIv4m/uh9lulfYCgLz
         twzpxYZ0jcRoi7fD2yP9cteJnYn0Dnc5ng82jJTTR9Nf2K1B4mnR5B6IDw0b1F1+0MWl
         UlfnoZMtYGzeIF6rulZy48lSV2dMLl8jdiQrdvzzPe9NlYwzubxcPNbDgoj3BZ8dV6Xp
         zziGmgvKlXkhPHQ2zwE7RIauu7tB34N0TQEiAR97ag53I/bEwIZmtwRGZHD7hlnq2YhO
         gmHmQUIyzZwgh84RroMvDhmEObhzJiziOyS6gj4unWBKhhet2vY/1aQ72GZXUDZUSPrl
         Fcuw==
X-Forwarded-Encrypted: i=1; AJvYcCWk+b4cesGZO7e2Pih2UDlGOuzq7XFNBez9Ay0JGWjji2NUsiMIRE6jPGvJT2VlJwCG6elmTU64@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJcdXqiNiwVBV9KBr3pzF0Kke11izqWqXGrAZJkActBytlGZNr
	3zb6I6h0PBhhtRVVp7YFk3xLkpYA+NjIsBCPNLSToCUFTbYK+GpjnHO1
X-Gm-Gg: AeBDietOybFGdmdrAH7iIQBve9eMnazLs7q2CT0XpK+z2KzbQyHkor8Mb15v+Q+VLsj
	8NZ/hw3j9OG+p4F/S1QLOL2CcKvU13qIHtjgIUwzkBbw/OiKMfxQuiHReXWUhjxxeJK1v26RFqg
	OMQ1rwZ30VQG6jRCypfbmtC4h1QJnMhGpKVizveqwYgh2qdszg7pGCEYlU+/Mu2bcML2M1enRHv
	8HwuHEQCikGPCtpLpWJ1Dg2g3t0JXzQ7MLTKy0qAh+jRnmfyR4hafcqml+tsgzgyfUDFBPEuoRZ
	hN1A1HMfVZYTfYBhkXyq0/O5a8jwZ+126DRIn3D3QN+cAglQRYgRrKPsKGTjxVL0BmpiBXOq1rw
	eClyravkErn182AK42cGmJRzZ0OnHySt9JHrr+7j6nURMKrf5nf1Kcmnwo08x6hAenALl6nWNSs
	k4L2rweePlQVTAolBGWPQmm9ApJzRB5emx69wPjngTiSyQ+VYU/CCmAobKJlCbqWwkO/nVJKo3V
	aBKP27dGscF
X-Received: by 2002:a05:600d:a:b0:485:3428:774c with SMTP id 5b1f17b1804b1-488d682bb48mr68343125e9.4.1775910921131;
        Sat, 11 Apr 2026 05:35:21 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ef00sm163047155e9.5.2026.04.11.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:35:20 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] iio: adc: npcm: fix unbalanced clk_disable_unprepare()
Date: Sat, 11 Apr 2026 13:35:17 +0100
Message-ID: <20260411123517.15083-1-devnexen@gmail.com>
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
 drivers/iio/adc/npcm_adc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index ddabb9600d46..6acafef3e7c7 100644
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
@@ -244,16 +244,14 @@ static int npcm_adc_probe(struct platform_device *pdev)
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
 	if (ret < 0) {
 		dev_err(dev, "failed requesting interrupt\n");
-		goto err_disable_clk;
+		return ret;
 	}
 
 	reg_con = ioread32(info->regs + NPCM_ADCCON);
@@ -262,7 +260,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
 		ret = regulator_enable(info->vref);
 		if (ret) {
 			dev_err(&pdev->dev, "Can't enable ADC reference voltage\n");
-			goto err_disable_clk;
+			return ret;
 		}
 
 		iowrite32(reg_con & ~NPCM_ADCCON_REFSEL,
@@ -274,7 +272,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
 		 */
 		if (PTR_ERR(info->vref) != -ENODEV) {
 			ret = PTR_ERR(info->vref);
-			goto err_disable_clk;
+			return ret;
 		}
 
 		/* Use internal reference */
@@ -314,8 +312,6 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	iowrite32(reg_con & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
-err_disable_clk:
-	clk_disable_unprepare(info->adc_clk);
 
 	return ret;
 }
@@ -332,7 +328,6 @@ static void npcm_adc_remove(struct platform_device *pdev)
 	iowrite32(regtemp & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
-	clk_disable_unprepare(info->adc_clk);
 }
 
 static struct platform_driver npcm_adc_driver = {
-- 
2.53.0


