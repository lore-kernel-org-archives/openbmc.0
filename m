Return-Path: <openbmc+bounces-1737-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE2910F3DC1
	for <openbmc@archiver.kernel.org>; Sat, 28 Mar 2026 01:23:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fjKXj5LVzz2ySY;
	Sat, 28 Mar 2026 12:23:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774649956;
	cv=none; b=eNkYkGEHmiDAT0y+IndbMwQgG2MrnB1njacCeLQFKX3rhJLF0+p/npI+NYTpufZg6quz1wRV+Ay3ejyru7or7lCw0GQEazBa96mYVb+188r9/0a7buapw5xJFiL8np6vYqim2gM8hfsDkc7w6KgkX5XhptPI7Cs2GYVk6UM/yfNMlBhJYHjFhgp1XlFY3lNmgU8QWZXWdujXVB6bX7t/gcKUj3SFJsH+0fc4nwU69/rRA6nXPAt3aWap13q0pfX/xUVMVbWifpAYVsAIGp/G+jgfZ2OmIGWDzxeax/67DzwTAephQ5Aj67vrIqZmuy4gvhrJnlsOx4XoS/0cSqujYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774649956; c=relaxed/relaxed;
	bh=m2youRr357rlRwtasZfNZwC9KNFZnZTwKHeGB3J4nWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DA7Mqu3jZcgv5tLKjCv0tNJ5JARTs8bj5HWRFuwQKawHs2DVxbEyrIpbxhePDV7cQlgPUMJ5maFK2xmflZnF39agPM1JLOPCzF6I3U4nFV1eubVZQ363Rpe3b1XN7NVoAACH+d8EUNcCb4yA+xEp++V4afxpbm+oR8nnV2zUND4Ag8oAFmHgpBq2yQ1tV/Z+yLfC1DNun5vdLmwYROMgw50uzjT7LCq7rmHxuRjZCoJEVSrKL3rkLz2OQ+b8Mpa0+gVFwzGhzDni2pRf0vJt3dwXvTQ/fIciM5W1TIWhf2QaPajhm8e7JagTNaz8s06qIDc+dSSNMyVG9JEl+3XL9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zgax5jHZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zgax5jHZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjFRl44dNz2xMQ
	for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 09:19:15 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48538c5956bso25361635e9.0
        for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2026 15:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774649952; x=1775254752; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2youRr357rlRwtasZfNZwC9KNFZnZTwKHeGB3J4nWQ=;
        b=Zgax5jHZicVMUPc49quIUTLCCGg8yfQVIXTPhvdQJgP6YxOoASspqHLYFvRv7u1zWL
         kqsFTueM8z89MpoKFPC4barcU84LK4uGD7ATPUOLp+Xdxy/bjoX2u/X77LtT7FYh+S0u
         5Rpi2zF6IrL8r/ciSV+hEVkBCQJ3gfGz27sMvRjG3066+e9RPxG7lxvK8plpXGa6aNDj
         fxloc5dwHg1WuZHccu2b2fxbQPaBk+WlqwkRjzN5ice91tXoVao5/vUDidVKXdcfsled
         YLn9ORW7yNCahumzbu9QAPcdQmRmWrRY0db/HU1HZRdRCT8cNWwXlPS+xO0+tbBYtg4+
         QC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774649952; x=1775254752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2youRr357rlRwtasZfNZwC9KNFZnZTwKHeGB3J4nWQ=;
        b=iCVQR9EquSuWzVDn/6ZcIUIAzAKUOOX39I3V38f6pS0XYcuxUAXvlSbJZDvLZucrRH
         fd4f5U4gJjWBrAm1IB4M32wKx/1zqNKKH+eE+KQoC/VHfBVZIeJwZS8cU+iw4qU2oTP1
         sNHZvqQuXAVrPvfHWdB3Q+h9C2jYDGsveB7fg7lkSg0W5qyXmxCA3eBQNnE7uIPqE0XU
         m2FdRDFSbCyd8CBYEfso8yIdadKaYCDaeQOeLfrJyLOQvKQVevndFzqyk4GPygpzNqNX
         hvSKWTpasJclsDIM/DM7I3hgVNzI9K3aDO/K29nLJUTeg4ZwEVJ9HjjDrNJP5kXeoaD9
         wnug==
X-Forwarded-Encrypted: i=1; AJvYcCVjHAMwWdo2UCRKxhEY3ejZQFoaIiSvMqbVfc7KFgDt6gx5WWLoMIa/iBeBomJeTKsXUfPQgwgH@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGr6hiT8p9+VNUc1GFu7PMxKBQkbHel7lgkwfMca/UXhV/LPf7
	vjy54gtcDKd0reLy4UQBmj31KZjhcME3628ucc3bJhSp/CDUs5xyEZ99
X-Gm-Gg: ATEYQzzI5TuPFdtEj/YfFSj0+K35JAeCRjkdL1hrmf5vojMWkmUIMcl9ctwxW91w2xY
	Qt9D3bWLoT+Fp3qOWaDAZeH8RuOXBZQigN2TvKh7ZlFBdca0YtIuvmnX86k2OafZn3uib71OWfb
	Jw4rQntax6SZfFcszg3+4O70LW8P82x2coD1xlAMSIS15VUy0t49hJx8XAQQ3y/6lw1M1nMUoJn
	EAv+eUUQOphQW7TdZdJ96Q6ShNZKjEqW4KFZopmo4dfBO1PxOy7T8eA8D1iYKpiKWEKrJHc5EEa
	hvLHgzRmAvCMyIhocX5dCghnqHUwC3oYUVR/vnS0ZTYkGiTetBCTtm7/JfymN/QNDyqG7oPjrp4
	1wHodAk+7v6RmOItsOJrppm8HYh2FwlPZDI3rw/aqoKFxIuF4YTZGNpYRIczTJE0wE3thkVreca
	qhgmtpeHv2h58HYKXQZln1XRcoSt+w+R40JxuzAfgBL2PuICvMSiAcYa2us0AgD+pabaYKg1HCg
	PS7r41iCZmf
X-Received: by 2002:a05:600c:45cd:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-4872912dd2bmr59241125e9.15.1774649951916;
        Fri, 27 Mar 2026 15:19:11 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487306acb47sm8489965e9.15.2026.03.27.15.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:19:10 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 2/2] media: nuvoton: npcm-video: fix memory leaks in probe and remove
Date: Fri, 27 Mar 2026 22:19:05 +0000
Message-ID: <20260327221905.267410-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327221905.267410-1-devnexen@gmail.com>
References: <20260327221905.267410-1-devnexen@gmail.com>
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

Fixes: 7c3a5e744482 ("media: nuvoton: Add driver for NPCM video capture/encode engine")
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


