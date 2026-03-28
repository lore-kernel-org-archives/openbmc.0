Return-Path: <openbmc+bounces-1754-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8DD1061B18
	for <openbmc@archiver.kernel.org>; Mon, 30 Mar 2026 22:51:57 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fl61l5KWkz2xNT;
	Tue, 31 Mar 2026 09:51:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774721883;
	cv=none; b=bxtMZAQZwC/K4QC010I7OMi4JF7Bt51M7H0qYr/Xfd3SLVWUWI82MV2XMxDdidx3bB6QxFgvDMXNE3Fv9/75Q6cfG5w5qADLlZiTKJSaoYXlycOuYjhC+rku13i02uV7MxR5FokZcSHuCI0m2UjyBfBlPh1CZMpBK4Xv9T1dfdsX38U229+O3NYd2AJBERNNVaF74CTJnS/FKiPa+wR9Av3ZCHjimY6Aal4oTEslutslqNDJvbihk+LL4Th8XUDuhUdW62TQnOCXLpu1/tjJBiyv5tFtnfTlbDwOBqyycEvYe9M8raPjttlYnyINMpYmJiE6NPWKg0KLmGm02oDWog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774721883; c=relaxed/relaxed;
	bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiuKoZSV5oJCE8pTS6Xzq2et22cH8g7ria8gXXsfBJDhsqUsvy2R4PLutc//WgkpJdh3bX0V4vKV5fwh8FLuF8HZsJWQlVYLBey5xgrEJHryacGafG9QdnY2EO34smH/eWNdAOvMO/EGFmqf/GQkMfx+QQW60MQeCtLyfmpUsR9mzH7LVFJ9abyYa1IEBE4XwT+/XXw+JvPXgv2US9ZyTQ/1fWKMnyi7MflI7UFMFTaXiIvl0GCHPnCBGFOWX54epc3u/Bih8LdhchDgvjw4yLbCDoiOT7yWLbKxfzC0MBooL56aUqDqCnHJ8lGjXNlzp8VUa0fv62AWN2BtaLhccg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mUmJLYEz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mUmJLYEz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjm2x6t6Cz2ySY
	for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2026 05:18:00 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so2097196f8f.3
        for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 11:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774721873; x=1775326673; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=mUmJLYEzsBMDIKtRRwZA4bfLNXj6E1IBS0F6hr2BnYrKEARzTRy+o4sXXiNjvKAIxF
         4U0oQbk5MYO1xOQPc0V3FO0ggydH6Y9UA9epK6TuXqSdAI7fGMm/CGt6QZbUjiSeD6bw
         K7G+wyhgeYnTALccy4iAgYP+K5JIZnMLqM22/X22VKGyBY1J2uklmPa08eT8woanWeDS
         OUirmmTJAObvEQWzzuYxSu3bFK+DOW1FJj2snuGFyLuRTEPGFKbq9JqNKaIbg55SX9oQ
         cWir1fLwn2pqzTUiDNuHuLTTK9ZRwpZMMY6A7Y+SC6jrt0YblmoYtDwBMurXnk34ECOK
         JLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774721873; x=1775326673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=NqicSDeRxfcO27kUi3njzCHkATsbu2SLCAYCfYeQU4VbTyUcqMIiqcfjomFrsln3q/
         N1kPH3HZ24Owsr9DkAxAhH/NaEEaJFAgT1S4pTLi92tAcdHO5yFkATOnM5j4pr9yN5gG
         mNAccxZ8sh8jaPCpKWtqlPFPgDohKuC0Vw/Y7T8+ADZ3LYaDXwGBS9Mq37bSEZJHVos8
         1pZlw9oA+qfmde290djH7jpv1GHKJybWRug7J2m4h4ws7L2sD1wRKNNC4JQx8vSPn8o0
         Oh2MIp9tBerPsmpgOLezPg8HvDGqzY1ffCu9g419de7Q0iWGNmRp3SlTy7v8RYB+re3e
         Zy1A==
X-Forwarded-Encrypted: i=1; AJvYcCXyBIBjDP3sHakyCz7MBJNsoa94AzY7RUx5big7+4T6LEf6gvCobw9MT14zEhBcFm0mezKFZiPj@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyaJ0R/NSmv+eJ6Xerr7slzZxm4hVDHm+Bg9C3Z9wTq4TekP/zm
	gdX0IIutVSsw00T9OACUx78ukrCnajWoqK4ijOETrXH6IeXCRXV7VSMI
X-Gm-Gg: ATEYQzzrOwqIn/UFEyak8OxAolR0YpstdAD626/1ZvQ+p9R5yk2XSyz2qzoc95In/z6
	C7D7dB9eC8PPLF435T/T1x6OnHbEiwojIq3i5S5Bb23Ene/u2764m+ggfKkoYV88vSslT3PZcyy
	lRbL0Za7qo+waRpeNaY1pmF8d9WS0joiWm5mrHmb0kSqO9CxIG1NbL0FKhGJ2E12UsRFZqmioXA
	hrmZ30HUyCSKTaaFUmZrAXKd8poW0rF+je6F6mhgBKjGwuNKiekTz1ZUkeZINpKFlMedkgy2kV1
	JLx4lp3WueaNMkYfAntBMxLAKMhAEv08J926XRYx6ezgR8fjzkE/acPFjgZTiXS/6X9XweWtZqx
	HXZLQ71M5yLYUAkg8ju3A4yCGhvEMREu2rxWtpJ8ktf5dsEr1SLoL7nUXrBtL1XaqZosC17Ikhd
	LQJwAHbyYfjvpPKZPodtlVZaRD5M0PC7g+eer+9i/Uol6opnXG7fxqcCMyH+iF9mfYJPl7vYo1Y
	D1fImKtn9uf
X-Received: by 2002:a05:6000:220b:b0:43b:8023:8b2 with SMTP id ffacd0b85a97d-43b9ea76481mr11973788f8f.45.1774721872613;
        Sat, 28 Mar 2026 11:17:52 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf247472csm5435632f8f.28.2026.03.28.11.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 11:17:52 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3 1/2] media: nuvoton: npcm-video: fix error handling in npcm_video_init()
Date: Sat, 28 Mar 2026 18:17:49 +0000
Message-ID: <20260328181749.13047-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <69c81867.050a0220.26a904.f72a@mx.google.com>
References: <69c81867.050a0220.26a904.f72a@mx.google.com>
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

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
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


