Return-Path: <openbmc+bounces-1751-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413531061B27
	for <openbmc@archiver.kernel.org>; Mon, 30 Mar 2026 22:47:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fl5w65F1Tz2yhV;
	Tue, 31 Mar 2026 09:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774721896;
	cv=none; b=ooE1WXfIqEIDkALy1mIdlWtXqfsqZoO/g2/zY7uHiHYh5vCUB9Cl/iGf2sn/1VmNgvBcVPXLKWqfDThqOltsA4lYXohwjGoKijmS78BfNBLf/WCIkhs9awE9al42RUE4TH3gHVT7QxOLskUbITeUfLzPxEOpkLzodayRza6V5oJb1h22kQfxUachzwkbhJGvwpw2tQiwALi4kBILaEVWYEPyBCJ9jczE3tkLPsohWiuQsRhNgorTZsH4eIo1V0VrnD4LUbW6KSD+ihJ7ilI4LcwHTBFQn/z4dvXig3edV2r3UbEoM2sZrpztw246FGNViTrhthkVx45cHG8Nu7fiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774721896; c=relaxed/relaxed;
	bh=4wNuQm4/hkzS93ZEPVy54NJxy1R6wP2SseNtwzyElDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OfjzBMaHZoGU26TyBxKvO7NpvhIbTpWWt5SX5UZ5yYWhqo5DPfLL5SEYfoGXFxj1NGISyj3dFuvZeEz5ON2pqXmaUdZUmncUm5Yt4spw1A+UJzUbJCCVPkIe08V9QUVP6cvptzo1ctP59bx0HwSf9rRXlP+GaGrcRtRcEz2DdthKQ4CntEyIhqAyLAXpTiJR123YpwTPI8xp4ON5H/XKb9kfFlbfP0o/bv4aZMp+kG3IAuFUWCjCc4TMdtlaKh1haWiD2ukk82JXuGmH51pWlpe7bcDLwFEjSsHmwWGNMdqUeDbJPiZNZe8CIbzTl/x4AOdVMu7dVNINNq+atMlvWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gAVric9s; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gAVric9s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjm3C5k3Qz2ySY
	for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2026 05:18:15 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso25407015e9.3
        for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774721892; x=1775326692; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wNuQm4/hkzS93ZEPVy54NJxy1R6wP2SseNtwzyElDg=;
        b=gAVric9szifx96n5L1dYokKtS3E+uDjBmetJca9gudd94BWpUaFV79JIzzG5eJWqPm
         d1FJJYgF2zgQnGB9awJsimN5O84uIqrZdNJ6pzYjsKcdnQeumZrw//RwnN+PEYoq+8+9
         KQX9J4a4BYqL0AojO1bjG2qdwb5aXhwzXPaj9gyPI8v+Iyr4+1eT+PtNM4kFK5j6tlKp
         nSvRYZkZ9hAyjtjMmOfLfNpGhCfl4sOE3oGA43rLzGajG3MOvWr17/37xVKM68b18n2S
         AvyXFhU2vP7wV+I+t6sWTCoO9utrkzWIwxcUA5Y2c1hUXL3bc8YFUgl0bnMbvDELXCeK
         8G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774721892; x=1775326692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wNuQm4/hkzS93ZEPVy54NJxy1R6wP2SseNtwzyElDg=;
        b=QL1GNtZzlBcHvKq42kgRFKAUhb356mzTTGRMft/39O3YhvGTOmaAgeN1JnvNzMBmke
         2agqEE5QH8OOpi55v+Bz2ZyDVGMqS1VTBGmv8XZ0/u3HcEPwtmoojv1oU8ii27hdRBxG
         Ilk5GacKiySoPy1s+mfIRS4X8dzqh1w+d5KhP6DnkiRyhbd73iX2tW5MVzj7qJo4CplS
         xmDzV5WZQlzZEbj+llU4qdpDl6KhIAwxxvSrhPRr6U3aEdof7WvqCh2IEehVVxb/3XIX
         FgxR9hx+6UvY4JLhMMstY3FWI9fiM5g3z23A/CqzC5P1+0bjJ4lyQhSGWMAPvlv+uabb
         MKdw==
X-Forwarded-Encrypted: i=1; AJvYcCW55pVH0J8we85WYtlHFsEw/FkoRZQ+nYwfVsdPi/jb00gXrkKEoO7u3BznSBg//R7g1BKTtDWZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzfM1YjMoo4yhRA1J4AaYQ8V02imTXk62BhsKQBjwNF5o/TFQr
	qkCdJiqSdcrx53vN1bFfRVOYxghLGcbiXJQmqi2sv8I3BWU3Ajnfj7ZJ
X-Gm-Gg: ATEYQzw7w1GrsklgSo3XlaM/+lp1Lcm1mg7GUlOUSI4avtsminjfDCSwJYL3h46+cgX
	Llg+QLOCAbyg+Wxhm8GmEwMo839MduVoX9sQ4aMZElKV3IU5zJ2NiM0AW+HhBTOhXAA6Sksa4jZ
	CubON8jxx+fUP/WdwxegwN7Uc1nueM5wlr1ME4YUGU2Lu1L3nPKuALTPOS/WrTF5p+AFC+GilLE
	1YTSnPE4wJ8N5BjXOSDyDaFRxvh0ezJTYq6lUAhlCGJKLHpRwz/0ZQqy4D24Wy4Maza+R90UMnA
	Rqk0sE/c480EFTnpnHEPIA5A6rXiYpfRerIpUiDglOUrxGvO9x+yyn9IzeXvFaI8sW/oexYrksv
	b7aLtZrfl7hMPIabsYt1e0nz3I88s06QUB5F68aqHn01oWE68HYzfc5Y0x0pDRfpR7+5MCe6ZjD
	77Ikd+X02elZ0XSzN/AlAGssQ8ctSV8IMEGPPyRAFpusfvxGHP6orPSLg5rUZNhXgoWh0Gdlpo7
	yqQ6XaCYmp9
X-Received: by 2002:a05:600c:3b95:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48727d59448mr106333395e9.4.1774721892211;
        Sat, 28 Mar 2026 11:18:12 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270dd790sm83670455e9.5.2026.03.28.11.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 11:18:11 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3 2/2] media: nuvoton: npcm-video: fix memory leaks in probe and remove
Date: Sat, 28 Mar 2026 18:18:09 +0000
Message-ID: <20260328181809.13988-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <69c8189a.050a0220.bacd1.a31f@mx.google.com>
References: <69c8189a.050a0220.bacd1.a31f@mx.google.com>
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

npcm_video_probe() allocates the npcm_video structure with kzalloc_obj()
but never frees it on any probe error path or in npcm_video_remove(),
leaking the allocation on every failed probe and every normal unbind.

Additionally, when npcm_video_setup_video() fails, the reserved memory
association established by of_reserved_mem_device_init() in
npcm_video_init() is not released, leaking the rmem_assigned_device
entry on the global list.

Fix both by adding kfree(video) to all probe error paths and to
npcm_video_remove(), and adding the missing
of_reserved_mem_device_release() call when npcm_video_setup_video()
fails.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 32 +++++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 5c6bddfe8073..52505af35c08 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1750,42 +1750,55 @@ static int npcm_video_probe(struct platform_device *pdev)
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		dev_err(&pdev->dev, "Failed to parse VCD reg in DTS\n");
-		return PTR_ERR(regs);
+		rc = PTR_ERR(regs);
+		goto err_free;
 	}
 
 	video->vcd_regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 						  &npcm_video_regmap_cfg);
 	if (IS_ERR(video->vcd_regmap)) {
 		dev_err(&pdev->dev, "Failed to initialize VCD regmap\n");
-		return PTR_ERR(video->vcd_regmap);
+		rc = PTR_ERR(video->vcd_regmap);
+		goto err_free;
 	}
 
 	video->reset = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(video->reset)) {
 		dev_err(&pdev->dev, "Failed to get VCD reset control in DTS\n");
-		return PTR_ERR(video->reset);
+		rc = PTR_ERR(video->reset);
+		goto err_free;
 	}
 
 	video->gcr_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgcr");
-	if (IS_ERR(video->gcr_regmap))
-		return PTR_ERR(video->gcr_regmap);
+	if (IS_ERR(video->gcr_regmap)) {
+		rc = PTR_ERR(video->gcr_regmap);
+		goto err_free;
+	}
 
 	video->gfx_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgfxi");
-	if (IS_ERR(video->gfx_regmap))
-		return PTR_ERR(video->gfx_regmap);
+	if (IS_ERR(video->gfx_regmap)) {
+		rc = PTR_ERR(video->gfx_regmap);
+		goto err_free;
+	}
 
 	rc = npcm_video_init(video);
 	if (rc)
-		return rc;
+		goto err_free;
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		return rc;
+		goto err_release_mem;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
+
+err_release_mem:
+	of_reserved_mem_device_release(&pdev->dev);
+err_free:
+	kfree(video);
+	return rc;
 }
 
 static void npcm_video_remove(struct platform_device *pdev)
@@ -1800,6 +1813,7 @@ static void npcm_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
+	kfree(video);
 	of_reserved_mem_device_release(dev);
 }
 
-- 
2.53.0


