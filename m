Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656A1606A321
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2026 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FShKVU64
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPMbF4kMLz30VV;
	Wed, 11 Nov 2026 10:01:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::732"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794286698;
	cv=none; b=UU0sm5vWEIS88DKmszNQEmc15SZ1Ny61PBev2bS0xeArGbYkk2BB1j4MWIyuMlGX9zU5pLaKefo5An9dz0OO7qSCj5EXXeFyKID6vA+o6F+dZjTV4hpyzg0uYJaw6mhQ9ZNpTc7oNoLgdlwYShWffJhpUHcNf21YOh6HA1GaF2CYFHwbUfXBfIHHKHGhSOsBZ4jIUnj9VTM8gEhggqWfDpGrvp5E46OgmBtB24mWN6sg/C0CUjKkZ/N7K/umW88bOmRBUjYnFM0lPIKT8+fNxxfr64kKsohyXODlP0riihDmSzynB+un4Vkk4QFqpx9kiYaK5kXChdNDfhkAX1XrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794286698; c=relaxed/relaxed;
	bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHxm3tzBe48GuZ20O069vYN8qqTfDselV569bL21vXG3st0GvlknSdcxCbFaO4+PI8IqjSPgI4cnDpvA8C6YWIw5OHw1anRKUJPi1ybT6zZiKFHkbeYEos0eNHa/bUXnH4wbwgjcDi1nR/xTb9+toaRAjmpLhIOjTfTGowvtJwApihbSnqBZafUZioxeBsIrvUADPqNiXgV8T5O8gL728V3MG2eR1YFiGrdVqF2So6DOI8k735SalojvEkcgk6THLmDgGOoKjT7XgDYgZYGiaYZr0mQSKprybzUktHft6smaxgXPC5yzR09dPiaXJIWYsW5u1zuSLOHCimYd+x8zKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FShKVU64; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FShKVU64;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jNvYP2tfLz2yCr
	for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2026 15:58:17 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-93e635220b4so148332185a.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2026 20:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286695; x=1794891495; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=FShKVU64FW4AEdR4AOMqKLfYRr9dmV+OS84VyKRZ9nI005DL4AXuWkI3YzAzbqNpmN
         iuvrDZaH6t5mDG7cLz7ag8z98wuNkmh8Ei+H0oy2RA1jdN9480fk8NHX2Zb9gDa14Arq
         9QpzRBaptj+QnR1U3WpvKDm9PVzn3nyG+yIXce7DfghlRhBA1rU0q5lOyKK8PT4Tozwq
         CZXfHmntmzLmsvyz5V3FhuvoFtSyvik9Kl1cFC8pxA5N7mWb+zzSDOu+klYm7Us90HpS
         +JEcOFwX8SdLIqrxZz7UsBGRAUjRSkcbm9qda2bZR58Wcsd2e73FjegqBzundVlF5M0+
         5X9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286695; x=1794891495;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=VysoryAtCtBQFzYnniVHu+Z1fxkASWsDr7Wlwq4YFhxIfzJnjSNNxUzGWoGeRbQ+bA
         TMYe8SsqFCSVE5SMUP344OevVl+upcGCBJ7983PiW8YuzcUdEtPaiRBsus2XK/hI/zT2
         eY0cDKJIr8J/tv4hdJiK604+2tOQ0eULpXh53luuE8ldX0CwkNszQQXlkfF0dRFkCKi+
         cc180KUj8uu1fK3Zp6yHrkPIf+cJeXk8MgH39YUd57+OSxH078ciI3lnQbY5unIu7O29
         q6vjpjNShGAbMQEgVS+phMHKZZaxznia+K2+L3Dp3TBgjOuVDrlLkN38vKC2RFMEM684
         zunw==
X-Forwarded-Encrypted: i=1; AL+hErHFDQjc4zxUWFTpsLHj1eaM0tZUIv3KPf/GarijvQDwTGCNj9clNwDDBEOZFxm3biDeGuUdjVHv@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/EiP4jv97timuV3U1fRbp8rsArCG5PNFmnMm0Nijllm9jq9GWJ
	Vn6X/yV9UDBaplZeZAxPwgb5MKoMY7qQqFzRBRsz255wRPZQVzLWJZI=
X-Gm-Gg: AYBFou3H/F/alcdIWtBOuoOuo1nrloXIgp05fTeP7THbzquuCK40Wib/wnpL5gIOp8U
	ok1cSvnQJcmA/WJM3DUrNnc2D1p29opuayZs/ftXZgDqv/jO1sJoii17oKwn11AGt4YuhAMDoGM
	CEawVxC2DsEQAUZEv3GmmnLbOmC1V9BxYP2iHW8x1K3fPqOKaJ/aAchORfPmKnhz/wL7uAadCAt
	2kcWVK4TAn3DKW6GV1PY1L/PmLBiTnvPzSDCFT+V3xz8L1Jccn5tB0QrToBf2NTdeYtC6WHpfT3
	lKQdM90xCn/MU+JNjdTgtpXcfDg4mwmrfw/3o3q6/Xkl7TWvEglHUBzwDecMNjz5PAiXay4N27q
	IOMCyjjqbUnNFlzPkaNlR6iTJ1jl6IA2Gcker8mPusoRjTA84PX0AVEfA8F2vX+SKrCHWuH5pwc
	tvacCHMLJJomNDv+tptoknbrr9R0OeIXsi/2SGUIodJWiu1vJ4dI6epkmt9rgyOFetFYjiquuVY
	V1XjgJpV7hy5k262FuwLwspEhHVH122zZEcRy5vIK1uW89/QlNqf1xFpPIHbPHMf1J7hpHQ36k+
	lyF/eyG5W/IqKeZDi7mrNr9mAzAAHkX5MZg4AzQUNtbjwN7TIq3eX/7Q82SI3dgCxICjxMqY1qZ
	muQ/GNOCIFPHes1uQN/c0ZYhkVrJpSLHYX9SFUSbYjsXuz9AxSEv7ECLMRiItfi28/UADVeCCI1
	3L6yWnZuI2SQ==
X-Received: by 2002:a05:620a:2614:b0:947:8018:978e with SMTP id af79cd13be357-9479f22d879mr260742685a.6.1794286694660;
        Mon, 09 Nov 2026 20:58:14 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:13 -0800 (PST)
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
Subject: [PATCH v2 2/2] media: aspeed: drain IRQ work before stopping the engine
Date: Mon,  9 Nov 2026 23:58:09 -0500
Message-ID: <20261109235731-aspeed-v2-2-mhun512@gmail.com>
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

Last close cancels resolution work while its IRQ producer is still live.
A handler can queue work after cancellation and buffer cleanup. The worker
can then turn clocks back on after stop has cleared VIDEO_STOPPED.

Release the VB2 queue before shutting down the engine, since streamoff
can need capture and mode-detect interrupts. Disable and join the IRQ,
drain work, stop the engine and free its buffers before re-enabling the
IRQ. Check VIDEO_STOPPED before enabling clocks in the worker.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Split normal last-close ordering into a separate patch.
- Balance IRQ disable/enable within stop; add no reopen state.

 drivers/media/platform/aspeed/aspeed-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1423,6 +1423,7 @@
 static void aspeed_video_stop(struct aspeed_video *video)
 {
 	set_bit(VIDEO_STOPPED, &video->flags);
+	disable_irq(video->irq);
 	cancel_delayed_work_sync(&video->res_work);
 
 	aspeed_video_off(video);
@@ -1438,6 +1439,7 @@
 
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	video->flags = 0;
+	enable_irq(video->irq);
 }
 
 static int aspeed_video_querycap(struct file *file, void *fh,
@@ -1847,11 +1849,11 @@
 	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
 						  res_work);
 
-	aspeed_video_on(video);
-
 	/* Exit early in case no clients remain */
 	if (test_bit(VIDEO_STOPPED, &video->flags))
 		goto done;
+
+	aspeed_video_on(video);
 
 	aspeed_video_init_regs(video);
 
@@ -1901,15 +1903,17 @@
 
 static int aspeed_video_release(struct file *file)
 {
+	bool last;
 	int rc;
 	struct aspeed_video *video = video_drvdata(file);
 
 	mutex_lock(&video->video_lock);
 
-	if (v4l2_fh_is_singular_file(file))
+	last = v4l2_fh_is_singular_file(file);
+	rc = _vb2_fop_release(file, NULL);
+
+	if (last)
 		aspeed_video_stop(video);
-
-	rc = _vb2_fop_release(file, NULL);
 
 	mutex_unlock(&video->video_lock);
 

