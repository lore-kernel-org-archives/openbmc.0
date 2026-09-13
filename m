Return-Path: <openbmc+bounces-2589-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A61C88E64
	for <openbmc@archiver.kernel.org>; Mon, 14 Sep 2026 00:16:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hjm0M5bD1z2yjp;
	Mon, 14 Sep 2026 10:16:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:34::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789338951;
	cv=none; b=KqgOJbCPc3mfJTrhr/h1lm7rA96zedWf9sfieOcEnCw7G1C4A1/sTV8eCcR4ghmwcGRaktjviGorChx0qh2y51EgPvhp7EfPYQciXGe3WLeQVdzAeJe8oZO+k4tH6doHxUrPP/BLAz5yazOx/DenwgQah/SrBRvPJCYu6if80fa5NwbuG++aOnArkkUTvb9YMxAa/ntPj8GYAbkQY/zVsj5iTeHIoK6RfJd1LFiwA4YEkN+yOiJPvgboPZ1wykzxPPnISf0UMctZeW9PfQmG+bxQmelziO+ELS58sgblGcobqUWAVL6GKZynpUjWND1pv3+FTrrUug7m6gfizAD0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789338951; c=relaxed/relaxed;
	bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4BRsYMdEIklorxPuA+jQfbRy2mydRp0EtkniDYyGuFrxEK9E0jgmlDVm8LDnQe88ZhZ2bRQeRX59VL+PBF03g3kg2FZ6KTyqzFRUSYiixZNIO0r0QPdx6Jjdgre9eN7UQoPtjbV2MeU/0en1mUg7FadUJ9UTNTq3jjIMufM5T9KgIriX9UoryE6jFpzkWwH1d0pT7jLuy1MAC24tnw6N4xn2FLIrt+I7WdtX1Nd6+utVZSqcghoC5xui56MT3LcelxVNxll3TAieA4nWsv74HkUIXvxKirJjncGTOEg1PUMLfozvqEVRc5dwvwhkVbPtAtHzX8ZijKoNkM8lW5gRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nBj7C3UX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:34::10; helo=mail-qk2-x10.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nBj7C3UX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:34::10; helo=mail-qk2-x10.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk2-x10.google.com (mail-qk2-x10.google.com [IPv6:2607:f8b0:4864:34::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hjjmQ5rprz2xSV
	for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2026 08:35:49 +1000 (AEST)
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb769ca2eso18722731cf.3
        for <openbmc@lists.ozlabs.org>; Sun, 13 Sep 2026 15:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338947; x=1789943747; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=;
        b=nBj7C3UXWcJ6bwOY/GmgHGUGj25s5Bha7K3Tw0yf9KN8YgzUYTM+N/TvLBttSH+/Uk
         BnErS3/PUzUaJdtzKE1e10sjS2Q4sUteEca2yjVr6MM2nQL25yW2A/hL05FOQBtQRt7y
         j3pz2OGGwzRkr+JZtjciHEDqoIqcxi2h4r8W3go/vfgKWoe+aCY0mQt0TA3Ek2VcXpP4
         mMfnniYQtwck5+KBCT41kSJ+AvgAEp5PmznR+ODtCy3BQBkJm0XSTPMt5n1a/1tVfGQh
         RTCQOZza77itBixw4Aa+QHhu2GNN1kDPjU3wNlTbTkBNvzLmguMIf3fHB1QGhlrOHKB7
         ZI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338947; x=1789943747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=;
        b=ew33b8tDH14tOQ9oi4GiQ8p1iP466BuyAAVsMI7zbu7y8NxXklq9v/qeqnTPeEayz0
         ZZ2yBpE4WCl60WqSXzdXrjtBFp7LJy+tzUSqMnMzwsGdxhHDjdbc0QwaF2WL8mkzDVxk
         SZnlVXKymBfmFmNLa6yAvLYpvAzfdwfhXCh1RkKDoQsHST9XTO+Rl223wISTTBPUfzs6
         1oXRUuBTbmScaw+jZQopA5Lu5Nrvw/eZ5X9b0jqXG8jcCAM1eZ+EoFxjLPlQLci44z/F
         BEUcmLQZ4Qhcufmo3N5vcIi29vvMesUUDTR4ndsMrLAebqO3FzIOXG1XwKHYPDcbnuVq
         a8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzrDrJA+vrWZ1sl6dfrVQiio/JFAjnnWZH2CVC1t3mAIvhUhFkNJT7UA0sVu4ov0QrUc0xigL0d@lists.ozlabs.org
X-Gm-Message-State: AFuF++lfXi3oRV9Rp7QRb8X5FXZyagAsdWDE4X92fF1cla8BFAoA9hcS
	axR8BCwMFhmLFq7RH2/ajLRzMySSAtLjGzK0IcmYwCBmZfQow7/CcnQ=
X-Gm-Gg: AYBFou1BxzumvvaTgl1oZC2x/+RQ2vir7FVnspXbUIDtlVCobc2ndk0KgvaDhsdaxm/
	9xprVbbtBrNeRFzrerQI/tlVrNnP9lZY50zqbf/h7kRd7rjmmNUcDjHGX4n6PwMy6xCCViY5eAD
	qfRrsuKWGdY76/QU1XbJaDktXbDqi3JUPlo/M69ppEG1zVhxJnK5qW5zZRRdUdr5lKcKFh6lFbl
	7iWmAqbyBNv3BOjUPZGe+/9v0ZeAsggvzP5m6+2ovxEHiIaxeQnw/+lwL7JehlYYrjSM4fR+oeV
	+7JfWlc1NYRBfQM9UVDCbpsnjK1SmWrPULlQ8RJhv9zv61rCmu8hJzwQX47gr2xtBZg9K/PtElQ
	LnOPl1STRbhaJsXodghHEd9mCRRPhhJpexAQTYU4pqaDQdXg5gI9Zf1r4PGbKWmUhNbveqIxMFb
	OypLPZ2TiDVWvMuOsRmaTRLlyKBPjGp7Gd9PtlY3SejRtfTQBMToAcGYjwp/kjoGjVtMS/aY4Ha
	FTUXOGv1O9cp6yVuLSvRmB7R3HfSOF/fh+uWdR69wPoQDlkEMSSVgn7TTfHFzEhV9CfL4Y3a7tp
	IG5cpTBmzywtZ3gkJbf7TLh/1svGUJ7+tQ==
X-Received: by 2002:a05:622a:11c3:b0:530:eb9e:63d6 with SMTP id d75a77b69052e-5310d09817amr342871cf.49.1789338947507;
        Sun, 13 Sep 2026 15:35:47 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530d5e946a0sm71513481cf.25.2026.09.13.15.35.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:35:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mmc: sdhci-of-aspeed: Remove children before releasing SDC resources
Date: Sun, 13 Sep 2026 18:35:38 -0400
Message-ID: <20260913223538.91579-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

Probe failure and removal leave SDHCI child devices registered after the
parent clock and managed resources are released.

Unregister the OF children in reverse order before disabling the parent
clock on both paths. Use of_platform_device_destroy() because manual
child creation does not set the flag required by of_platform_depopulate().

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: bb7b8ec62dfb ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD controller")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime, probe-failure injection or unbind testing was done.

 drivers/mmc/host/sdhci-of-aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index f5d973783c..d317626feb 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -560,12 +560,14 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
 		if (!cpdev) {
 			ret = -ENODEV;
-			goto err_clk;
+			goto err_children;
 		}
 	}
 
 	return 0;
 
+err_children:
+	device_for_each_child_reverse(&pdev->dev, NULL, of_platform_device_destroy);
 err_clk:
 	clk_disable_unprepare(sdc->clk);
 	return ret;
@@ -575,6 +577,7 @@ static void aspeed_sdc_remove(struct platform_device *pdev)
 {
 	struct aspeed_sdc *sdc = dev_get_drvdata(&pdev->dev);
 
+	device_for_each_child_reverse(&pdev->dev, NULL, of_platform_device_destroy);
 	clk_disable_unprepare(sdc->clk);
 }
 
-- 
2.50.1

