Return-Path: <openbmc+bounces-2761-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D23FCC6B38
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:28:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5X4Q5V02z2xQs;
	Fri, 16 Oct 2026 15:28:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::733"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792113621;
	cv=none; b=OwFh/dbMhhm1wcFvhF4/PziZyJrq+mmf3lcPk5TZwnh16S6zSJrark52Jksqq3tu8zp0FzyzvcvQDnU0+p4LJxlsty0pW6FmROfO57fXIb4MYVAaFAU4+QqB8Yd163I84UabsF3oI2gXMUebjNmlHCCTJetNwWl4qWUFlFWp+9UsCX1qUj3kaK55iZB0D5PJR0HHR+H7zhYVbxa9xDmVQp7P+EHhspn+UltA3Xfaag+sOWCpF/7Q/uKOslKAg3/6wv6XKnERWXKlMeauO6HSxxMQHEDEqatZaVXYNSIGY4YtKWIuW8xXfZHE9uMVV5YXddI6ZfoNFmmV6Ys2CoPjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792113621; c=relaxed/relaxed;
	bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i40cK2xI8JxaaBRVlJ1KhhuX3LWHPd7mX7WoBbrPAAOKALPA8Q+XKxHRyHr2zw39XQxX/nUKWaheAEja5TmqjX/5Bel4/dW6FdRCvqs0PlkY1WdpgGH5buL1ho+cyZ9pBQcT2AtqZYRufa75YwU3D2CUEVsAVYjmkUQny3vnqUDJGlqmTXYoiKMyHiUbjYO4bKjHb/u8EOp8BwSArd8IPgmhgLMPJYeBfYBMlfRHIocKs83Hj1enzkqmaJg4KaCPKPy1bFJXajCOsS/3nDqeeJrg9uNQyBrLY2RUpFRX9d3wP+p3tbgITSvmxd9bIFbUzH6VxZSQm5rQ2XN9UHruKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N7m2e/vi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N7m2e/vi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j5RvR3dMhz2xLv
	for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2026 12:20:18 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-93e7457349eso192621785a.1
        for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2026 18:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792113615; x=1792718415; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=;
        b=N7m2e/viTOK/wDi83lWdghoGSKdNPk7fK5xNNeZjVWkPX0YL/lpbESLR6Os/62eSud
         SDcNdOunX3akCZZdnAzXjkJq6zwkUYDt2lhbpCnJm9z/DkfYCTvYd7AsHUcHAlCCayok
         374DNT+UVI6JqTVkfHYFHlg4dIxkLL7u78Lu/iJ8dkUfhKhH1gx2jR6FYvpNwUghgZoz
         MjZ4p8GvsqwA3DkQbHRaxG4OqEDG6pfi5TE27U5EeNSUomrcRvEkyELKFsxBcezGUPzW
         m5UGLFI4CY0RRkC9fm1lbagMvUPldFrkurVictK1QgNYnSVKNqxXJCqZxAYTzag5kzTY
         26SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113615; x=1792718415;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=;
        b=ScBnbhvGkQlB2uRn/edVK/2Rz5jsA2QBou5IcB0JbszFPjDdrsMnq3s0rd6JulHaM+
         H61JDQiseKMjd1nQpDO/M0EOofUQTRZEFrzINjL296VaAOCWDWAuJO4Bk9e9O1rNu4K4
         a7c8R1Bjia41rphlhci4EyXl+UAONRGM3RJykx4ZCPKU9IcUPvIXwPvKNeKk8SzoVfHg
         wE4mAu+3Phy4OPdhfB4e9rmT8tqEQ1ytA9eYv2UJZULNJNf93mr9H6ChG8ETAHI0BcyG
         dvFQQcaQvstDxiSuSqSI7bp1pB8endZPBUU/itgizTaUQZMeC+6HQVMRhJGl37wVpcvW
         kCWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzsT5pGqMS+QIOfNVJ7EhxBh9AKMfGhhUjB1vUy6GnnLMmQ3x30WAWzxi1AEIDwqa9Ue52G/En@lists.ozlabs.org
X-Gm-Message-State: AFq9FYL61gQcKp0qUAJGWhT7hs1x0zfaDb0BVn+OVIL0JxqzIw6z+wCx
	YzcfUhvj4mzd+2v41jtHXUhihOWl+6jIleT9+laFTTlW4Q1qeSaNuEc=
X-Gm-Gg: AYBFou0qlR/wmyBoYIx2TJjZomw78qG7F9x6owewc3Y6w11b/HhciVUO3psQhpPe8KZ
	yIkWXCxghL//Bgh5nuRkcc3SUp9wp71vxVqppjGe0wxaHIWtKVfpULyzuJbjVscFVQJnQ7h5qeL
	lqbvn6D6ZeV8XG+/h6Xjflz5m3EBL39WC5oTamlf8sb4WsWC8rS/PJGcdr6ia4/aDwhHDiSwgeT
	GA5Rs3ZA67gFZWOMQGwY7E3LmYfksGXIgkw0unq2yBhM/rTQL0RwzixlHal4L2uAh0WmoKstWjy
	T22rEveX68q7jRtcIrhP3bOEFAF0KWDXoTsa4mX16Lah8lfFQvCPw9n4DlAkg6ghVKbW768ub+D
	r/hqPduA4jtawsgnLSnximI+KFWUgKZ/oEOrUUfLHVhWcVP3kVz1EeMw6lHw7D3CjalYvgeqKjq
	CvirW4pVpcnteclc6UMqL+uHuhZzRn4wt+P5QDo99JXCD4iYNLLjs3OMQ1te55W3NSl7GiGNZmO
	cWU9Jeuk90mW5IiwD6OJSGFWdLKzC+8wRCYIuoeIEs3VlUdLA4g8Pif3xD6yZxfvz26ny/EDk2w
	pRpcbOT8+yuTQlDWhUTCHIbGbBbS
X-Received: by 2002:a05:620a:6c01:b0:93c:23e4:359e with SMTP id af79cd13be357-93f1891428amr288853885a.50.1792113614608;
        Thu, 15 Oct 2026 18:20:14 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1a990fsm76619985a.35.2026.10.15.18.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:20:12 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: aspeed: acquire IRQ after reset and clock resources
Date: Thu, 15 Oct 2026 21:20:08 -0400
Message-ID: <gm-top10-20261015191529-g65-295aa0ac5211@mhun512.gmail.com>
Content-Type: text/plain; charset="utf-8"
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

The threaded IRQ uses the reset and clock resources, but it is
registered before those managed handles are acquired. Reverse devres
cleanup can release the handles before the IRQ action has been removed
and joined.

On a resolution-change interrupt, aspeed_video_irq() calls
aspeed_video_irq_res_change(), which invokes aspeed_video_reset() and
accesses video->reset through reset_control_assert() and
reset_control_deassert().

Request the IRQ after reset, clock and JPEG-table initialization so
managed IRQ release precedes release of those handles. Add rollback for
the JPEG allocation, reserved-memory association and prepared clocks if
the later IRQ request fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
This fixes managed handle lifetime only.

Compile-tested with Clang 22.1.2, W=1. No runtime or hardware testing.

Base: 0fcb05b72344f40806cbe810de8872f1698bf053

 drivers/media/platform/aspeed/aspeed-video.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..234001a93ad4 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2232,14 +2232,6 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return -ENODEV;
 	}
 
-	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
-				       IRQF_ONESHOT, DEVICE_NAME, video);
-	if (rc < 0) {
-		dev_err(dev, "Unable to request IRQ %d\n", irq);
-		return rc;
-	}
-	dev_info(video->dev, "irq %d\n", irq);
-
 	video->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(video->reset)) {
 		dev_err(dev, "Unable to get reset\n");
@@ -2286,8 +2278,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	/* Release the IRQ before the reset and clock handles on devres unwind. */
+	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
+				       IRQF_ONESHOT, DEVICE_NAME, video);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		goto err_free_jpeg;
+	}
+	dev_info(video->dev, "irq %d\n", irq);
+
 	return 0;
 
+err_free_jpeg:
+	aspeed_video_free_buf(video, &video->jpeg);
 err_release_reserved_mem:
 	of_reserved_mem_device_release(dev);
 	clk_unprepare(video->vclk);

