Return-Path: <openbmc+bounces-1750-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EDA1061B18
	for <openbmc@archiver.kernel.org>; Mon, 30 Mar 2026 22:46:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fl5w52PRPz2yY1;
	Tue, 31 Mar 2026 09:46:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774709244;
	cv=none; b=AaL/X2/LGeLIwlVhFIncJZNPHOf7Yn40AxVlEw0rUZHWA4lScmFr/wahaX91yh8z++7hRLfk0CAxl4gA6ejiCB9YrltFuI5p+ZOaeZaO5Bjs3wSuYvCciiOCBt94SNUZIZ0rOq3+xZVHrFUAJ58NRRVmY7RpGRcYaQPUY4KuLDkfoDY2Z0RlDkwcxSUz/xCxctaQspWb8wuTO/yA3XR+YdRdfRRHzg2HnfMSAuDeVEqD1rAUNmitYal/21BlIo5gfeu3BP6P890im4QHGK5WZdR6bRnizn9iTq1DCyBzdX6Pkx5YDkZ5ODttRZPsuhVdwKKX1FYXD49MnUBhkMEB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774709244; c=relaxed/relaxed;
	bh=MorpkP6r/T60MTiGCUcfsot6ur/wG/ccNFtLOYY+Uxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vv9GTcCuBIGcwULthHdHbXR8vzgawJyBqBLOo2fpgshpuqcfG6Yvs3FjVnKdVA3HFPqXkntOaYAAQFtEGHQNdCpA+pgNWJzbk7TGCO4IvGG2E0JcySyzFC6jc1ouwYDvtT9lufo9+c5MvglxiXxopvjEF5G2Y8RxqQ9VD8dK6XJHHUWVEv7sRWBOXQRLFsy09Ll6iRNIzb3jMljK2/yKG9xlT/sQX9IYpZkMRZeF95pjq9Mb0EBlmOxcFV06ECvnB85sGcXOJy8/piqZozKIW1gE6HKTCf1nTFqjjzZJhyE5QtDmabYOrweF7a8+5tEpeMvgrI/xvIDu51I81QQKLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XtJqfp+g; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XtJqfp+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjgMv5wWqz2xN8
	for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2026 01:47:23 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so29449525e9.3
        for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774709241; x=1775314041; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MorpkP6r/T60MTiGCUcfsot6ur/wG/ccNFtLOYY+Uxo=;
        b=XtJqfp+gyKKNkmTzKrBjb4YA3BYKbZMibXm2RH2vlqLxg8nkCT4WSjHXRiSgghZoyn
         NFY51CYJL1CQHvpvcAehwztsrQrXiAs1homy1Ma0e8MsqxqiSh6OqOpv9rVYTvh026rp
         ts8WNGgLWgYO+JZ7bthDmSaP4NdkFgDsEF5MgcYu+wMX/c1ij3mjXmQ+xAcVL67ae+W6
         ER766cQ0XMUgGuLymEg4LBJ5SMxJ9KNEkqajXLUAeRb9n/tgD536nAj6b/M3jSzXYwOW
         zzkJey1mnR6LzHzS/D3d5g3SidPVHkHbYD/GNr8NihC/1a5Ol/TqyRL9ZBJTDTZH4TcI
         2Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774709241; x=1775314041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MorpkP6r/T60MTiGCUcfsot6ur/wG/ccNFtLOYY+Uxo=;
        b=asDP/FlgfTRwLL6gx7JcRmDESPnfv1DxyJOrQmysJCmjgaBcfGWifIpNq5BL/PeCOf
         leL6Subgglpe9uNbB/saQKflxEnmyEkOoKVLGuZJKmG1at7BFO9fgfXBuObPVID2LDh1
         2/jzmzst117yvStdth4gFtxnwCjVhY5X0sp8bWYOh+gXj5rcA5u9FcwrkavQAudHKpZ2
         GWOqxHfRndXwpmb5YAuBeJovbiriMp1pdRZrvUPBSJvX+/BSC+awtkD6M47lZ8CdiTC3
         z6yYngnZgnrx88XAi1pwdhbftDQpcHC55qFW8YNBSg/O74W9/Ky5UR64FQv5T9xIfjpb
         uavg==
X-Forwarded-Encrypted: i=1; AJvYcCUqm7zGZC1Fdt3fnbB/33YF/jFv8IqQM+zTUfFWagLvSA5YlPMn1jtC/qz6irRQeXjSiqSlNAiy@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhkrOxZl2UXba0arGmUZP5jkJGOFa2ioEe3DgRhSoddKJSAuiY
	OSInO8g7PpZX254vZTJ3Q64iLy+O9uug4thLd38jjieRDc48xg/E493r64JI/CZZg+w=
X-Gm-Gg: ATEYQzyYA3gVLpsUgkwhg/gjjInzRSXk5389lA20SylejAYPB8MbntvUYyXmnXoaAV/
	tnAczg1iwh5V/0tmGqpEnju2pSivqLuFnAjVulLyOuRne8rhYEx+wKfWd7CurTxW9GWI09eYnhb
	RPyue6zBLJxgjqkEQPD8MlZr//1vcbj77sjAH7Uj4bYsTpfoMuS7CZDByuqYGMlxdaCK2MEqPS9
	t+Yj/xeYnKRyAfKMyoty5LQQeiD9VF1RfvM27HlGN8tHdxAtNzx3zPxQDm0k47/oua5gCJIXbkq
	TilozKxbAUQCsCixV+gkcfWhaX60nIfUY0Bz43I+1M1Q/A1w5J6a0uHTEBD1zuD5fcdhWR1Dv/9
	JwTPFzjWxoDniQ6PfXQYzv96G1NOuu7IfLOhMegVtsk8c9MyjxYC6jms2g+L9wIkY3CsfZlLVNj
	tuViwQqPUa1nvYnOWHC93X6L58Jyk5keN9caqjLHF1StrQTkYli2vjxVa0/zuWwjTWUR7befX6/
	UOT6I2o1/O+
X-Received: by 2002:a05:600c:6287:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-48727ef6617mr104982175e9.26.1774709240531;
        Sat, 28 Mar 2026 07:47:20 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f279bsm5077450f8f.16.2026.03.28.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:47:20 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 2/2] media: nuvoton: npcm-video: fix memory leaks in probe and remove
Date: Sat, 28 Mar 2026 14:47:17 +0000
Message-ID: <20260328144718.68282-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327221905.267410-2-devnexen@gmail.com>
References: <20260327221905.267410-2-devnexen@gmail.com>
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
 drivers/media/platform/nuvoton/npcm-video.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 5c6bddfe8073..87b09979cc52 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1749,6 +1749,7 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
+		kfree(video);
 		dev_err(&pdev->dev, "Failed to parse VCD reg in DTS\n");
 		return PTR_ERR(regs);
 	}
@@ -1756,33 +1757,44 @@ static int npcm_video_probe(struct platform_device *pdev)
 	video->vcd_regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 						  &npcm_video_regmap_cfg);
 	if (IS_ERR(video->vcd_regmap)) {
+		kfree(video);
 		dev_err(&pdev->dev, "Failed to initialize VCD regmap\n");
 		return PTR_ERR(video->vcd_regmap);
 	}
 
 	video->reset = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(video->reset)) {
+		kfree(video);
 		dev_err(&pdev->dev, "Failed to get VCD reset control in DTS\n");
 		return PTR_ERR(video->reset);
 	}
 
 	video->gcr_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgcr");
-	if (IS_ERR(video->gcr_regmap))
+	if (IS_ERR(video->gcr_regmap)) {
+		kfree(video);
 		return PTR_ERR(video->gcr_regmap);
+	}
 
 	video->gfx_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 							    "nuvoton,sysgfxi");
-	if (IS_ERR(video->gfx_regmap))
+	if (IS_ERR(video->gfx_regmap)) {
+		kfree(video);
 		return PTR_ERR(video->gfx_regmap);
+	}
 
 	rc = npcm_video_init(video);
-	if (rc)
+	if (rc) {
+		kfree(video);
 		return rc;
+	}
 
 	rc = npcm_video_setup_video(video);
-	if (rc)
+	if (rc) {
+		of_reserved_mem_device_release(&pdev->dev);
+		kfree(video);
 		return rc;
+	}
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
@@ -1800,6 +1812,7 @@ static void npcm_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
+	kfree(video);
 	of_reserved_mem_device_release(dev);
 }
 
-- 
2.53.0


