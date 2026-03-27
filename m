Return-Path: <openbmc+bounces-1738-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317CF10F3DC0
	for <openbmc@archiver.kernel.org>; Sat, 28 Mar 2026 01:31:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fjKjF1ZwGz2yhX;
	Sat, 28 Mar 2026 12:31:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774649954;
	cv=none; b=I6icC28IVh13d4G2mmrx2y96zIpxUpeWjl5mMGWGcwwyCDs0ZBOhzPjScMTjmdldwL+FaoeBPpgz05Z+LeZKW4IdLJGbPMabsIyHIbvIh3lNmFo9wOEGFS+duPAeUhUKbeU5hz42nyzUw11zmOgM/wForbF5VK/pcPNF0rxpUCidbBpsljAwKoZjMGUmaZXSN+6luCLZauhjHZ3kUJbRo99z+/HFcuV+S0ZOkofnxOW67tKrNrMMwnQ9XDjUdp32guGn3wydE99AILaq4GlHvE4by0b9dY6gytr63/2cAqIdUsXDAr8mY2mWIcVgjDfgAMOlIXztqCALb1bPtz0HQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774649954; c=relaxed/relaxed;
	bh=oOr5ARwTTylH9deTx77kYmBkTdRY5+SBIZ8AjtFWZFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmwEXJ9BoySOkwMDzXvV97DS/61DtKtKdtKGnsF7+rHlPWf/10OmirLl/j0qVvdl0VqXYZeBfgGzkbbnQ6r0W1iNY6kmcJGkeIIM2cZRjamDhFeEE2B2zuBM0ZtalkJuYuP6572NBYw8JPwcZS+NgzwEWAUdufq2JxWirSv4eR2fpu2HewbBcOonGRksIwI7YDAB98UOjjhZ97GvzfToY1K1uVdKOy+Naji+ZSb8PKXnCwq8GympEJCSoHVgMpxjXfTScQ8mX5ie9aQF5oMbduzbuqSgk8hzWTNX9WZIjdGS8MwkevJLhau75T2QOWV2arYX4eaIAQ6S3LpUVD66pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NP7qLTIO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NP7qLTIO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjFRj4wPXz2xMQ
	for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 09:19:12 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fb14227cso33055005e9.3
        for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2026 15:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774649949; x=1775254749; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOr5ARwTTylH9deTx77kYmBkTdRY5+SBIZ8AjtFWZFY=;
        b=NP7qLTIOgnXMvG4F52fhCz7zkbwmTWBesl7khpUX6Pw9c1DVGOmyH6dMH8ZXcClUYz
         57mQ+VYJ3c5q5kIc8CrlTBy1Z1uPwsgXdX2QQTHnJ0AZ6nWOU7t3uLvF//U5y85x7S2t
         jZ2uV+LQUQoD/I+agdb124vtpnPqlkREs92blBDplDL81+EQM3i2dV8f8pd69KkshSvr
         m+WVP5MOA3Cloj7iDU3cz16O1lY5q/kLoOIVPM1g3GZTk+vTQZ8z5AiBb2lhj0SnMaCu
         Z4ZV5+FroHVe9HOOFpC5/p7O1hTQPcIAYiNJHiSXdvRc64BvYJl9TagXouREktWAJVy0
         k0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774649949; x=1775254749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOr5ARwTTylH9deTx77kYmBkTdRY5+SBIZ8AjtFWZFY=;
        b=Pr1tpofOjgJSzCVif6HClYDyF4ObgXwvs4hK+3gJWla2WDEGDczE8xIVftfxPim1xU
         alVo0Nw1lygfabf96/gRwuBqd/4D/dLQipI4mfoHOge96bSbJfA/S6WnLpdzX7ad4hv/
         X6GkLo+xrM/UqA7bGMOx4/NKFcohjwYvzeC1AUuvt3Vv96GlUqhD6sjj3vxYBljw56fT
         lFRQW2pW895EIhljrcmWeCJGEZGydxdt0NADu8gdYdJB9LrNgT/kItVwDAvb/ZrjuVl2
         jSs4eY9RjlmkoF4/LFpNS6Uz5LEP23P4mNzw4+XAdKoioDOPsLgS4Bc7umBJ5DE9eXAk
         g7gw==
X-Forwarded-Encrypted: i=1; AJvYcCUEH+Kpc8ZeyTYXg/vrucTpAZYOA3oApnvAqs1XmdliGqNyCW1gftjrrdxj5r8SmEZfOgkVWOJ0@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrmsKLRq5yoVyChyEW2w9xANd0gbRJy7pPon34/40f3Pczom4O
	nnaRAhLnSWc/Ylso6gK+Qundx7MRy4eGF8VD+GRMqFF+9CPMDvNazFuf
X-Gm-Gg: ATEYQzzEC+7zMdSsTZ0VB16S4j7IodJ2GbjkmOEHTRpb28fWP2x2JLn2Ht4VjuDnXz+
	H7TJTNIYlN2uUimKmjyMybQyhLGWfGXiJmcdgMvEttIxrAkGBeV4pi1bIEEos6eYmmmjovkQDw3
	Q8zW0b+Sjx1z7UHKg4H+1Bf85VU7fs+J9J+VP/xVAwk47Dp28JFJhwAbNOb6+pfziY+LRPxNbhN
	KH4WdTbcBMXzYaL4MBDyjVG4/P5Wct7NZytsgauRdRZ235yLD0U/lT+2dtpyLRfyY1S34tf1lDK
	MEGGBZDY3vZXAybga0H1fVb4lbo9vKEha5gM4rFVChz6uA85/BUgdpr0rOLxs6Qz9dKK411MtF5
	9u9PsWAWZzv6Hti2ldPK/Q4njefpiDrpg3vigVqi42d2jkE0nE0pP63nod5X/JufG255K/lRE7C
	9qloZoBIqCFcZmi7ozzUmk3oG7vrRaGD1Ph7KboAnACjgcrXKnY2/r4HXEAr3FFLkEIny3UQNQw
	QbxJo8eW+aH
X-Received: by 2002:a05:600c:3112:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-48727ea2803mr72526885e9.14.1774649949040;
        Fri, 27 Mar 2026 15:19:09 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487306acb47sm8489965e9.15.2026.03.27.15.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:19:08 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 1/2] media: nuvoton: npcm-video: fix error handling in npcm_video_init()
Date: Fri, 27 Mar 2026 22:19:04 +0000
Message-ID: <20260327221905.267410-1-devnexen@gmail.com>
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

npcm_video_init() has two error handling issues after
of_reserved_mem_device_init() is called:

When dma_set_mask_and_coherent() fails, the function releases the
reserved memory but does not return, allowing execution to fall through
into npcm_video_ece_init() with a failed DMA configuration.

When npcm_video_ece_init() fails, the function returns an error without
calling of_reserved_mem_device_release(), leaking the reserved memory
association.

Fix both by adding the missing return after the DMA mask failure and
adding the missing of_reserved_mem_device_release() call on the ECE init
error path.

Fixes: 7c3a5e744482 ("media: nuvoton: Add driver for NPCM video capture/encode engine")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index b2a562e1ee1c..5c6bddfe8073 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1720,10 +1720,12 @@ static int npcm_video_init(struct npcm_video *video)
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
 		of_reserved_mem_device_release(dev);
+		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
+		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
-- 
2.53.0


