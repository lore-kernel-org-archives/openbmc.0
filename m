Return-Path: <openbmc+bounces-1739-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE75110F3DC6
	for <openbmc@archiver.kernel.org>; Sat, 28 Mar 2026 01:31:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fjKjF1k67z2yhY;
	Sat, 28 Mar 2026 12:31:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774649317;
	cv=none; b=MAhvYmWe3vD0i853u8MzgRd7lJqMxEjeY4hJmaSMFwAeL7AIErs75CpxvcKg39DFbGqzt+wafSTvKisr0gqvBrfi0yxteTk9StnUGWF/vQFueWB0P78KkrMfvsF1FAQ+V6AljX1fUHxNBbNfxfqZ4pLe/XcIYzaZ7CeCrqAvu28YVQ1uarfskRTVo7KldpZVV8eWKJa5FsSYZAxCNpuQYrrIC5KrJPFiIqTFxX/vitlrYHO+NvA7AnjZ9aeJjvGxT8tDsX2WPR5jM374pIwhOBlPo9bQgkXKLlTUru9RsbjAX9Auw+9x0rf7YzpqkZUwzlZ7sQf4E7s4Jg4FLvWQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774649317; c=relaxed/relaxed;
	bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYZoG5u8k5e+UlLSzPJXAr9plSdWjZsEEZdiOrZPmUTOwj5Ce0Zd5ieVEp/lQ6DtBAWidZY+gPAmTotjh7UhgBeTnsg0m8ejsJSru4ZyTVC1mOuLqHPSiegXpKIV824gja34B7AxT3XsNThIkQmQX8QmJMWX3RiRLVX4BNJwIUTmZa6BCdUpwxW+hah/xbcL+M4toXV5HXWiDMbmGISRwdSZiIUmAwdhCo2PM6PYlbszqtC3p2av0ZcVFNMDTFsC68xlpPvH+HY3mgBlJMb2mY3VP4ZKC3WnICEOkYgPb2rkU0D+VPv3HMXFG4zGQhpRwkR5Cjy7z2SMHhCaZ6YMpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lh0lSeBX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lh0lSeBX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjFCR4gG3z2yfs
	for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 09:08:35 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so1190451f8f.1
        for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2026 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774649310; x=1775254110; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=;
        b=Lh0lSeBXRIZvxvWjDR9yGbgqk2O4SeTT//8Y1ivj3IZjR0YOAkIAErAWxB5b/jV1c0
         J/twOeJb3kBmgJUyfGiBjKrkafOznZ5BDfSlqkSokJgtqildtgVFlwhxBvJgLcOh6NAl
         4VxtJLKPaBh2FRRcijbOKlfbn3Q195CaZBa4HkAbFKjlhba3/a51BOkObiVPi+WBgTrE
         TOMEPam0Co6UKPWh3cGy5aPGnFdYb+IpVkNGT4GvHBDbHquwNCTgpXuZqHpNUJQdZo0e
         zbWllG9pwSdobxkfzDQK/vKKKe9g+ycRf58Krv8M6WYI6C4Uu6EczPZTPgtctGgWH9ch
         j3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774649310; x=1775254110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F49vcSE/rqoVB2cNUPw8hx4gbICx0wrJC2VwflfBWVE=;
        b=sxqh2NjhhZu+bSRQhGCZgocOWzRRcRpPhWChOABy2a87Q3uv5UMceHauQYwqxyt6nj
         Bcd/0c+U2UvHtnFQsvGHDqODYHErwDs/Y0hE5jNyciodHipRvjGWXnXRCpBtxNi/LFbF
         DscGE9Das61Nwv5H0rO+gbuB2DRVKznoqErNAT0zORnkhehkKwc1z7XYP410xGz+Q1Xc
         WV9Nmejkx4jqTBIaJ37w7j8sRSFrdtxQcrlRlXU96PWy6uOjPLyDdI3Z0XVkhHWMBExg
         0eWLQ/htOskrnwQ2GEmoDVHejaKUE6MH958Puh6HoEloa07bVfsxKahgU3gpO5hObvMn
         72Ow==
X-Forwarded-Encrypted: i=1; AJvYcCU/4nrzxbqNCGl3CInwOlnPJlZ72cCHxFgTOX9BEQpG1EGb1yS6g2OEwGYAZVkBDv/tdLaqrT6F@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz364ivOOYGYVCeXHS4v+5KOuH3hz99TFwzhMEGu81snOIlQQAo
	4fur0txsn9OTFZCACFaRljLgYyO9j9GvKY2b+7rdIoOoQwEVs8M63+nU
X-Gm-Gg: ATEYQzw9JLJmSl9V/1WAe117Lj5Zt5rIW53PaasaPK+3ONhOi/rg+Ff9mGtKS9iN9ZZ
	9QS3kP/urMzJi2EvsenJbTBWgTAAypXjtWlr+1yI542Hoj7QtBGCmrglZ32Sv571HumB3FsyEGU
	EjYmWuhhjXaOqT/EGD28dJ1n4H+jw+qsmKtOfDWKrUSRS50U0KeFMylrcFqjLXoIEcwMqplQvTF
	VFX592ttQLdA9IZ57EWfR7ZPiarJc525pRal5k6H3Dgd+3Mx63oda2GGpEXh3mJJF3TjBhjDDWh
	7eanzRWhL42lddMsOLCusg4k1gsX9lLoiynmjbMZNSla3DxlfwtFUAxyEwAxmGENhef1Al+KK2Z
	dLfOFQ4MmhyGgYxHoQBgolMu6v6Aq9MwvgUzyl1sjgv+novirRdUUuLLYTxW3olOEDV+VY89tga
	rxT9TzG4mwNZzp99/s6x1X+L0NwCyaJFNzYPc4uFuj4Sqc5boZQ6Z7AVjAhhc+3Wp//OlYB/Kkk
	TsVOvJzUi7O
X-Received: by 2002:adf:f14a:0:b0:43c:f257:c6fc with SMTP id ffacd0b85a97d-43cf257c851mr576318f8f.10.1774649310249;
        Fri, 27 Mar 2026 15:08:30 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4b9sm898900f8f.20.2026.03.27.15.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:08:29 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: aspeed: fix missing of_reserved_mem_device_release() on probe failure
Date: Fri, 27 Mar 2026 22:08:27 +0000
Message-ID: <20260327220827.266556-1-devnexen@gmail.com>
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

aspeed_video_init() calls of_reserved_mem_device_init() to associate
reserved memory regions with the device. When aspeed_video_setup_video()
subsequently fails in aspeed_video_probe(), the error path frees the
JPEG buffer and unprepares the clocks but does not release the reserved
memory association, leaking the rmem_assigned_device entry on the global
list.

The normal remove path already calls of_reserved_mem_device_release()
correctly; only the probe error path was missing it.

Add the missing of_reserved_mem_device_release() call to the
aspeed_video_setup_video() failure cleanup.

Fixes: d2b4387f3bdf ("media: aspeed: Add Aspeed Video Engine driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 41cb96f60110..a292275f6b7b 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2343,6 +2343,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
+		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
-- 
2.53.0


