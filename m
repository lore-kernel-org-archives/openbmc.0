Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2EA606A335
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2026 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjDTpviF
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPMbW37K6z30dj;
	Wed, 11 Nov 2026 10:01:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794286697;
	cv=none; b=H158Uj9DVjIt/XrwRjbwIdD8Y2xstd0m5FKtfQ9euy2VFqD1wWA0/CPOTPfpGqx7HnIlYnkLz6ArgxC2Tc2qpp4ugp7FbbT9DFbFQt2tBxwS0ABYpMNMzE7ICqAty10zaALYfjaIVaV+hh12f37tU14LYeiW4y1QsYLFAdStYJTObFuppgkFX+vOKqlCSK1H/Nwl72JB/QWthuGiHa0TBB2u1D0Ck0pJciCBb6g52y65UZxOOGaCdx95NbOSI32lLQit72mZlndyAeSaTLSuA6cqmwc4YZQBfQPbqfJRjbF6Zi6VJaBR/6Ap3rSyboVXpBHF6Bb5BVhiVkuzeq0Mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794286697; c=relaxed/relaxed;
	bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fum/BlLgD0xsUW42OrMEIord6QvCIuRFBec6D1W0jDa+iKgVOXRkRODLtf2TKq1YUMHbAcssIceZ/N7H8YH8TAw0qmKGiZ9lemGx7TsBwLa1D3ojwdbyxsPfcUG7cK72NmRmjmtFUdGmJdjr4FqYAUxw3kDUrQoFMnTHRMF65vPUfRBGN3mW90bP/x4/batsDp70qJtR7NIlXsd/gy4+tK0T2fgmciBYk/dfo0YhhtZn49uN0DUS1/9xQDbdOnwSfU6Zgk/n7cU6hOZrcMpfDMQmKlSqJeI/krvKIrY/8d+Suzin7FfoIEVJzzUvWYd2AHcAXfs4uPTa2r6Zr+31gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjDTpviF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjDTpviF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jNvYM6Zffz2yCr
	for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2026 15:58:15 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-91ea3f6a506so13881746d6.0
        for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2026 20:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286693; x=1794891493; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
        b=TjDTpviFS0cIcvy6Xoc8xpgxLbkOgdRQYP2wmXXwI0rIxoVVITXh1Fsv8290o96ngD
         ukR4g4FsqWWApBlavu3bi6GOCnBLNd3Z624TjFoSjLxKmMFOixiQvSZx9NlNmWZ5yzFs
         p1RCmPqWUC0aU2gUAXXhhc+JNoAfKhGfbYXyXIrjxcGFijRpgc5jemBPLZjTpJF6kPZD
         6L48DnQZTv6HUnAa8ApPXYAN851laTjsQ0E71rMseU/CARGbFykz+oG3vOkibUL5VyGR
         s4bqq0r5qCceTNC+6xwI+9RqlWkzti4vaG71H/Mfymga1Cx+c10ejOqxGPE58Iew8KLS
         gq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286693; x=1794891493;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
        b=pompZAnopVqSPLX1MEbWjcsyjhtKIcxD3Rs7JoQQaOA+rJijEbu4usU2b0CJUumkyl
         dGPEWRd5k4MS9fcgdnvtpWB1tBZZWNZkhULA+vaSwLBhi5lUoZpR8RJqVD1gIqWERRdl
         2Hlnw47gnuAcvuumOOK3wGqkTzY1bU11e2JetIHBFcMgCnhf8k44zRGUwt8vU2o6AWm6
         6t5fbFJcFniFKb6koHruKNKKVBPdt/tjc73VK9OadWMyiQN82GoHDr2vspqP0Hf68yfZ
         TIFNz/c6nALn039DPp4tOtpV+QrU3M4/7K+Q2feFWUbgXVKcFiQd9gXIdawenH+Zr4aY
         MdoQ==
X-Forwarded-Encrypted: i=1; AL+hErGFvFsD7LB1fNuGFWOvf0jv/68PTOEguNei6l5OIT50aOY3OZyG7iRz9Q3nfK99nJI85THsLzDw@lists.ozlabs.org
X-Gm-Message-State: APuU4Z//4UKfNVELnzt0FiQvr4cpj7JnHq7UU/ixcHC0CfDvBemhU2/z
	ImfBnjC76oiRHotYVntv6mqB5dVw2Y70QwYBEZxf6HidsRzKJ+Yr0so=
X-Gm-Gg: AYBFou0kn7OG7TsWNiYe47QAR/qF4UqT1IzQeszrESbdeJCw4q0wgfocmL09pHzsP/5
	xrXMSJiGShBrI0exgSiQcOy+c3CD+ckeXIniRsP6h+6TGmDiSn+nqBwOuMFXAadv+l7a95y/oSQ
	y62LsXMtk1n6EFhMEiI7Jj6/nhmcf9DG/4P+0lBkrM7qiDczyh14lE9xV721Z+/JAUTAev84SRo
	fT4uxFaco61wwr959cen3mBp24Je4XlxsFp4RnHPGePWmgqgfYgWq8L4RE59LnqQ82rNYXHD655
	lYyxrA0TyMxaLM8BvL/OTFAkLYNbz/Aat9UOC0DAYHzouPgt/nmf33JeWwImO9HgMAJLEt/Q2TV
	oDbKn2/kMUNXMz/JRzZu4nAh4zOWdnfmGpHfw5Gh8MALxbJHs/dkqMOG/yVBaRW6lgeC19f0VRK
	hyZnuQQfx1w7H9+khrGhglOM+1inHhXotFl3ePPsR7Xm46QRL7I2LbY7OiL8wA/zRXok50SdqSg
	1h/0InyS7oB5KbvSWTR+QSwRuaxYxe2Ho7lDwBX5k8BrgQjf6+WZ0/RvAk9QvIWSd4MW+acL4/A
	r9BulB6AQWnXU7ytvSJ/X902sFCTFNWGYa0r4xjJx4O3XZ8HPU7WTrypY3HL7Z79IIQPeWo9n78
	x8QzGr70eMyK/Jl5HcdyGBCq5W5h0gHRNxkCRLD4Z0iId/uFaEg+FZhHvd3+qxMZHfWaCj7bril
	NfS0n0MGYzpQ==
X-Received: by 2002:a05:6214:85c7:20b0:91e:9ab9:bf37 with SMTP id 6a1803df08f44-91eef88a091mr21824886d6.14.1794286692755;
        Mon, 09 Nov 2026 20:58:12 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:12 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 1/2] media: aspeed: join IRQ and work before probe cleanup
Date: Mon,  9 Nov 2026 23:58:08 -0500
Message-ID: <20261109235731-aspeed-v2-1-mhun512@gmail.com>
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The setup failure path unprepares the clocks before devres frees the IRQ.
An IRQ handler that has sampled an enabled status can still queue
resolution work. Masking the source does not synchronize that handler.

Save the IRQ number after a successful request, then free the action and
drain resolution work before the manual JPEG and clock cleanup. Turn the
engine off after the work has finished. Request the IRQ after reset,
clock and JPEG initialization so earlier init failures have no live IRQ.

Fixes: 3536169f8531 ("media: aspeed: fix clock handling logic")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

With reset-default masking, no probe IRQ failure has been demonstrated;
this part hardens cleanup ordering.

Changes in v2:
- Join the IRQ and resolution work before manual probe-failure cleanup.
- Rebase onto managed reserved-memory initialization.
- Clean up JPEG and clocks if the late IRQ request fails.
- Split normal last-close ordering into patch 2.

 drivers/media/platform/aspeed/aspeed-video.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -308,6 +308,7 @@
  * perf:		holds the statistics primary for debugfs
  */
 struct aspeed_video {
+	int irq;
 	void __iomem *base;
 	struct clk *eclk;
 	struct clk *vclk;
@@ -2232,14 +2233,6 @@
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
@@ -2286,8 +2279,19 @@
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
+				       IRQF_ONESHOT, DEVICE_NAME, video);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		goto err_free_jpeg;
+	}
+	video->irq = irq;
+	dev_info(video->dev, "irq %d\n", irq);
+
 	return 0;
 
+err_free_jpeg:
+	aspeed_video_free_buf(video, &video->jpeg);
 err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
@@ -2341,6 +2345,10 @@
 
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
+		set_bit(VIDEO_STOPPED, &video->flags);
+		devm_free_irq(video->dev, video->irq, video);
+		cancel_delayed_work_sync(&video->res_work);
+		aspeed_video_off(video);
 		aspeed_video_free_buf(video, &video->jpeg);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);

