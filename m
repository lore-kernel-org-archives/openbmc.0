Return-Path: <openbmc+bounces-1752-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAD91061B24
	for <openbmc@archiver.kernel.org>; Mon, 30 Mar 2026 22:47:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fl5w65FmGz2yhX;
	Tue, 31 Mar 2026 09:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774709218;
	cv=none; b=bS+1BowazkbApTm31X5EMiQnYSNMSFtsCrmWWTGHLrAkWz5sa0TNzXGJd6DBn7rClO0zs9elZ/3YUbiZb4k1Ur5aYMz8rhjhEtQkqyStaNtuBDg1nwpi2i+jlDn4PbzDd/lV/4VCrkW6LvN8rguWEfhSEt3ujWWlRyCNvgpesql8yLiEEsqg6eNsXj2oaQ4TvbNWHSwG9nF5dOuP/CTFy3XZRe/rviQgmvWQjuOX5QKbJR07eWOokhpEmHncKeKBVmLgOwUinOakAK+osZ4eF9NNYcU0qko37kblNyGI3oalwgEldmyhsTqrFUf5U6H+yAzt0nCviUOoZetQBnewfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774709218; c=relaxed/relaxed;
	bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U57s6E8olx+smQepb4Q7qbceqxfc0u1xnznWtU6r0CCxDTPw1ZBTyQQCmAvn1l0nAYkIsrJQ83d82mBXC1AYykmRR7qyO1/HoRDcxP05WW5tKDNyEdgef3iWLaPADD87ihI8uhXRVK/JzGbk3kHuW6eQnPi3atcOLuSRArLoazQBGU5MgQ8dFTar6RprJ4xSV74ZZrUDKG8tEUikBouGOHNyUADwM85pVNCd3oVsal+Axstrn2bMN8CCttVDvdLNYt59z/wiLbk8iu8pVbSikSg8E8ZGge8+PJkJSKbQHPBJq1aNB2sy9N2QHs/brKdbhQv9EQQ9uDT99ISbYNo4ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CvFpQZjJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CvFpQZjJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fjgMN4gLhz2xN8
	for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2026 01:46:56 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso26711125e9.3
        for <openbmc@lists.ozlabs.org>; Sat, 28 Mar 2026 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774709208; x=1775314008; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=CvFpQZjJyfvhMrEngnn4LNj1tBxjjabKR2TM3hPmJBDABYqgPOjN0WrpAFsNwgmTao
         IWVVGsIOC+GsEmx3SC39HlYt6oIWHKNmWxbW/bWv94BS+QI7GsqlMl4Ap3zSb53c8xxF
         XA1fHXOZMfnsW7AOPt05uUhBxAxOh4LkPFo0be4wqF1iLylypIEO2j5mriEcrRAg3cAs
         uDK9irUEUokYG5KckjepQXgxAjHKflP9FcpydxPYOPjSjVPEJAeIGP7pcpF2RnmB176t
         uDGGQe9SupcM+sCsOXKiTNHnF1t9qmZ62WO0XW+d22QqK3unxTImAIvmDveSFyjRRR9z
         G/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774709208; x=1775314008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=cBa7g18WN9NFlTWKbtQM7ftXaRIYp3iDebSLhIkYVrfwViLXLgdVY2VVWNoNipP8XT
         0eZkDrpZnaaTMOwG1l6Xu4yUGcNsHmYzD5tXR/ENmSLPl4USaR2E6mNHm+Ie6yitS1bR
         0J7LHnpSWEtnZwb+zBkbVl6o7xDkLAX6jdp1IMa4oXfXkdyqpIeeVMlJJAVMpAZl7jRK
         oiSmfbGFRie5sNuLk0sJ6mtHjJqHvbjatHj9ZOqYTqJ5GGqVh0NqYuOIVZZ0eEOT37eX
         DvIEFWr6KCVm0av8ucjeTLZuUTANziFlSJNXL53lIiCmDPMwEzJ8AVDYt+e0dzkUSL6H
         2V3A==
X-Forwarded-Encrypted: i=1; AJvYcCU0hidQ4tPz16atWGdHfhjhNN5kFlneU2moDr7g26xuRaxvIOJKb7Jw8RbT8D5Ib8hhv/kJuMUL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuJa6+MmrM+G9HOAuVIWyW0ltf/kTS6GxDpCysiIVSp6HkATMd
	8CsZoZu4ODMdkHfI8MF7wvTk2oW+U2nKbjyA7XrKX5315Gy8iDNY0cRy
X-Gm-Gg: ATEYQzy7PybrVIJKPN63E3xs9tP7pItompBZJb5/eiGcfA3zZftHVOWQ5niKzKJXD11
	7EzCJ9nhfSD4YQVSGNupfP02Jy5UYHiZ8+nLIDuFH/CV/u3EbqY+2sxo4B2e+lvPAuauKAGTUYm
	T3na6qpumZHw84dn831tKQzHg6hRXlIOVkAcZ/nZrrLbTNTNO045b1yOp6tQWYkrxWC7ow9MD+3
	EW2T+TeTrGopcGIfAOLrPxXbJeZmFffwsB6WqSwrk/P0OB0g+7JaSFkeqUo139aNw6bj97Ee8Hr
	/a9MxhkBPdf1P1lGcpH4O+WNmRQumyRhyxgte6L/rK/wR7IjEWBagCchnd/2Ne4Rqr421PhTxja
	8YE9pHR9kkWyJ4CHXPBKrvM2mw3BcBp7FdkgnCAYrmOf+6n8jQkqI9vdFHBbW0xyzS/4dajtpD9
	ItA0ak7F5Mh6JqxoVei33wEkyrOW2KIoCyrV2XFTeFBK3BLXurcJ9CncQpBTDYdGrdLyFINAmPW
	oD93re+yi1ltt/LBS2tB6M=
X-Received: by 2002:a05:600c:1d86:b0:483:7783:537b with SMTP id 5b1f17b1804b1-4872807470fmr103447895e9.24.1774709207384;
        Sat, 28 Mar 2026 07:46:47 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm91577275e9.1.2026.03.28.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:46:46 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 1/2] media: nuvoton: npcm-video: fix error handling in npcm_video_init()
Date: Sat, 28 Mar 2026 14:46:44 +0000
Message-ID: <20260328144644.67556-1-devnexen@gmail.com>
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


