Return-Path: <openbmc+bounces-1824-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D88F433CD
	for <openbmc@archiver.kernel.org>; Thu, 16 Apr 2026 00:00:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwynP62mBz2ytT;
	Thu, 16 Apr 2026 10:00:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776169821;
	cv=none; b=OLnwFPMMsVs2jCKRwXUYJEA76c+zFXCuPLOTnt45L+/6qzJHXhDRrIp8HcsJLar1yaugdNtZcFhTwXaGAtd8vIE9zYYgJ8CGQIvHc2WOIlcF48jnEzTSJVyjzVgxyGz7uW8UU215U11xL/Q9DJx7ssU8n+LZUQHm8fjOKlWuAGE4TtLv1iOfEg75ePeQVZyvRZNiUhtQcxExBoz5+VjdXX0Wyn4oWpx56s2KmBP09zEbICacuPcLe+Dyh47LHIFGfd8IaA5JNLFjCfMBt78QP71MkuO/+rFExR4QKYISPvW+5BG1+68HgvHzaarIzWDKTDcQV9GzqtcSnci3zvvZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776169821; c=relaxed/relaxed;
	bh=WW4kcmfHDRNiC/0ztPa+kXKA3hUAYvX9T4RsXBiI8d8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzDWqnRgCIR1ktTBgYspdlrAngaVkoop6A7qCW2Ss8hFNcsqd8zifXHX/1zYEH8n7OcGgtD7TU7mB7sY+6HmCPkSJCfo8qmYz336qoqUSkv7LOx14w7HDaeSAlNjGN7jViTTf6lbJ6qiNMDHxxyWxzdGMQRtE+ELqnjljFh0ImXeb1Nbv2Zu1T61Mp3N3kD1u4UVITODQ6S9MaR3LdtfGyPV2M2vzjRCwdW9qvAJAzZz0cXOteWOdZI8N1ZH2khUVFWLmtyhcAOQVUJQ7HrgsCxRwBpCo+3LC9xxt+qvDxT0LFPXWmn1q2pbIf6JD812hE8eISVmX8hT2BwKmQYwWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CApidqBD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CApidqBD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fw3Wt6Tqdz2xdL
	for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 22:30:18 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so38507075e9.1
        for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776169811; x=1776774611; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WW4kcmfHDRNiC/0ztPa+kXKA3hUAYvX9T4RsXBiI8d8=;
        b=CApidqBDoY60JW08NpmpW5aDiZEmCjKu/O+kYM2j2rD1Tq6dCIkY7OiOpatk37hx7/
         WViPQ6K10Bee9C0CWP3DCPQ+EPbDmMXzhd0o5QdBqbmujrAngE3kwaVDIa5S3fXCR1Ni
         7j1KieyalHfsliVDLir4H98L/2fX2qgeknl+iCxbr7QRabg0Sd3yPnlUMHZmnk24iKPb
         JS7IzRMf6sspH/ksBCjSXrlj1+d0Es0WgxSfnLBo24PVlx2qQjecLeMt1WF8zvIxG5Vr
         deORCOffRnWTWV3QpD1tRd7PoZOJcS7Fyr/FtDgSCR00uz6Q+2MPZwUyBjCo46deaWBH
         2/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776169811; x=1776774611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW4kcmfHDRNiC/0ztPa+kXKA3hUAYvX9T4RsXBiI8d8=;
        b=Z7sf11cjFIohGZRz8h+ucRNZ97Hbr2zNHA1X+OgK7HZJxSjuK5MYGmajFyRSmr5qa0
         PiAFmwX5QcyLknX0WSOaTtBl7jAku8VKabpFypwZt2wmAlKAMCpk9iORugw8wvEPFr4t
         yqUaIETmYA5h2rkLYvb4I/jiI8RgXXgQ/gmh7wkq8zY/gKxg7iHXdNGSsxbDXGChdo8/
         RiR0sT0IJxGLBOu+WgMkwkYmnVReqg6Z0p2fJDODdtfTfT//2y0wiA85uXhelnOMsOOJ
         IuAQw5aayOVVPOs3CaQf0xX+HCi07quU/rMdmvcmKCkJP4kaTm2be9qwG4KgMmUcRCAP
         5CMA==
X-Forwarded-Encrypted: i=1; AFNElJ/M93CDWyGXlbUEAYwrWza4xs3B1g0sDn6Upxnrp4bQmp6iEucGnkCOpOo5cjwonm8cX3g7aSA/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZwOmPnDL8ImcQ2j9FIHHcJvn1bu+8wsHG3s1fhdscpXnFk02S
	l3iLomKmyPlC8GakNtCgm+G1li8D/Rg7odkU6VwuLrkHf1LXcsjG+l6O
X-Gm-Gg: AeBDiescR6hH+zpSof9I1dE7T1LWg0qk6Dyeu77OMzqGjuuerwEhj/aCbLR1nil2BtJ
	d+QpyWndB/VTrBMRsvS3W8jy5j2nx9f4/l0r16R05sJsm/sLWDd4yxLWRauzG5ZCd8rcMYyHPJZ
	WwyXRG6/io2uqKJ9vo4MI/xB8GFWAtnljNOKWQC2Bd8zE5Z8YM9tDOrInwtgKXE3sqVhNp4kp3N
	oHEt9Sup6rcuLYgRyKIqJO4ZB8nLzXdHgjQL3etw6uoLZ2u4EoHrlTapJ6gIqmEh3wuFTD3wyaE
	fomNagnO2q3+HcNxJyPA4+GqROLX1pvVtyz41ZXSAzyPXqXeA9pp1f4vdqiCf077psAVuGOlB6/
	gRe/V2jf42kAY/mc6ksbM4So5BoT45jEmGDCS8qMF8QHvqe3VBqZmQSkU+z+IDxMUr0C+X6RJW5
	9yF30mZG901/oV4RKxH5qhLpIDXv10DpEdB/Ma6y1Hnz8xdFI8fSijrx9GkmcLDJcgz4W9UGhdz
	ldB+kcwzokW
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488d680577dmr229609355e9.2.1776169810158;
        Tue, 14 Apr 2026 05:30:10 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d681edc7sm118080145e9.17.2026.04.14.05.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:30:09 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: jic23@kernel.org
Cc: tmaimon77@gmail.com,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	andrew@codeconstruct.com.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	openbmc@lists.ozlabs.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3] iio: adc: npcm: fix unbalanced clk_disable_unprepare()
Date: Tue, 14 Apr 2026 13:30:06 +0100
Message-ID: <20260414123006.262152-1-devnexen@gmail.com>
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

While at it, drop the duplicate error message on devm_request_irq()
failure since the IRQ core already logs it.

Fixes: 9bf85fbc9d8f ("iio: adc: add NPCM ADC driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v3: mention the dev_err drop in the commit log and collapse the
    single-statement -ENODEV branch (Andy Shevchenko).
v2: drop redundant dev_err() on devm_request_irq() failure since the
    IRQ core already logs it, and remove the now-single-statement
    braces (Andy Shevchenko).

 drivers/iio/adc/npcm_adc.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index ddabb9600d46..61c8b825bda1 100644
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
@@ -272,10 +268,8 @@ static int npcm_adc_probe(struct platform_device *pdev)
 		 * Any error which is not ENODEV indicates the regulator
 		 * has been specified and so is a failure case.
 		 */
-		if (PTR_ERR(info->vref) != -ENODEV) {
-			ret = PTR_ERR(info->vref);
-			goto err_disable_clk;
-		}
+		if (PTR_ERR(info->vref) != -ENODEV)
+			return PTR_ERR(info->vref);
 
 		/* Use internal reference */
 		iowrite32(reg_con | NPCM_ADCCON_REFSEL,
@@ -314,8 +308,6 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	iowrite32(reg_con & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
-err_disable_clk:
-	clk_disable_unprepare(info->adc_clk);
 
 	return ret;
 }
@@ -332,7 +324,6 @@ static void npcm_adc_remove(struct platform_device *pdev)
 	iowrite32(regtemp & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON);
 	if (!IS_ERR(info->vref))
 		regulator_disable(info->vref);
-	clk_disable_unprepare(info->adc_clk);
 }
 
 static struct platform_driver npcm_adc_driver = {
-- 
2.53.0


