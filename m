Return-Path: <openbmc+bounces-2286-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C3BC4451C
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:41:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2Dcf0KDZz3c6b;
	Sat, 18 Jul 2026 14:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784197572;
	cv=none; b=KTxqWZ+eN2WmZ6HYUjjl/Iiq18hXXfVj/0ft6Vi3dD9b4c3GrMjdZN6T5aHFW1keMivtoitHHv4ANMvttfyhOikBwomjwEQa624ESSUEDavja2x8EM6TQ1rabtJ40qeU2O7vP4t4BO/W1w2/1haj5dMFckmdk1F42eDbe2LLm4OuPt26iP06GG7bWWNU30kd0hF0VGflLEfSXzAbaqVgn+ttPN41rKAAxVKjVjggQ/UO6pX3/88eH60VRXkG4wDDTc7VAN0bDu5NIzxtBqybqUihbuoN3fv1pZuAiiCHgYXJBt76ayk/GkUT4PuiQLcdlLyJ9tpw6ULlqsMh7C5Pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784197572; c=relaxed/relaxed;
	bh=uHAPApdmcynrrPfYyNsC/FZClixZ4j8DBF455m/TZ90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m6V54UBJPuHfnlgUMS5VddTYFQTSzr3EDyqv+/Jc8IkRJvHmAEZbsGJ/3CLOH2+Q+8DmipsOqS7ZnUBakcjjOqCUDcKp2YXwCnCjJsbW3TlBsYgQTdKNp7QyjZH1Gc6r6SzE5GxxtnmjA5sfY9R8ry2DRkWWqYwfsgse765i1OM5xhsbjjRt4wRzmXbP9PKT2N8APdeYGavfqBvrTSuxVYQ3ng7HKTt+5QB2FuZp6tOE+zGwl9O00OcfcFnMvMLQnrgUKIa4pyjTkF/l0cZFc1HxvcDLtvhGHhXOvnrNd4HUhr64ueN4wDrpFJPSdsEF3X7TNp9zlZoh6ZRyLSoCuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass (client-ip=162.243.164.118; helo=zg8tmtyylji0my4xnjqumte4.icoremail.net; envelope-from=fanwu01@zju.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=zju.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zju.edu.cn (client-ip=162.243.164.118; helo=zg8tmtyylji0my4xnjqumte4.icoremail.net; envelope-from=fanwu01@zju.edu.cn; receiver=lists.ozlabs.org)
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h18Mk6BgRz2xlZ
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2026 20:26:08 +1000 (AEST)
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wB3F8SHr1hqgcdeAA--.12602S3;
	Thu, 16 Jul 2026 18:16:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app3 (Coremail) with SMTP id zS_KCgCHcneHr1hqM+o5Aw--.20469S2;
	Thu, 16 Jul 2026 18:16:39 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com
Cc: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH v2] media: nuvoton: npcm-video: quiesce VCD IRQ before teardown
Date: Thu, 16 Jul 2026 10:15:39 +0000
Message-Id: <20260716101539.3129478-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <04a332fc-2025-4a74-ae4d-1d8f30fe20bf@kernel.org>
References: <04a332fc-2025-4a74-ae4d-1d8f30fe20bf@kernel.org>
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
X-CM-TRANSID:zS_KCgCHcneHr1hqM+o5Aw--.20469S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?sWMI7AXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnZPoDCNGYdHSfuFmYJL54WN26x6ymw/Gzm2rA1oErI67BnJnJgK4NPimhNDjoe6B4OQI
	PUV2ixKyJRdXsuy+OHTN5RPxYw6l01w8CbPzC/8w
X-Coremail-Antispam: 1Uk129KBj93XoWxAF18Jw15KFykZr17KFWxGrX_yoW5tw4kpF
	W8Ga4SkrWftF1I93ZrJw4UZFy3Xr4xKw4FyFyjk34fA3s8JryFqF109Fy8tFWrArykWasr
	taySvwsruFWYqacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==

The VCD IRQ is devm-requested, but npcm_video_remove() frees the video
object before devres releases that IRQ.  The threaded handler dereferences
video->vcd_regmap before checking VIDEO_STREAMING, so an interrupt in that
interval can access freed memory.

Request the IRQ with IRQF_NO_AUTOEN.  Enable it after starting capture and
setting VIDEO_STREAMING, and disable it first in stop_streaming().
disable_irq() waits for an in-flight threaded handler to finish, after
which stop_streaming() can mask and reset the VCD without a handler
re-enabling it.

Use vb2_video_unregister_device() during remove.  It releases the vb2
queue and calls stop_streaming() for an active stream, ensuring that the
IRQ is disabled before the video object is freed.  Do not release the queue
separately.

If streaming is never started, IRQF_NO_AUTOEN keeps the IRQ disabled
until devres releases it.

This issue was found by an in-house static analysis tool.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
Changes since v1:
- Follow Hans Verkuil's suggestion to tie IRQ enablement to the streaming
  lifecycle (IRQF_NO_AUTOEN + enable_irq/disable_irq) and to use
  vb2_video_unregister_device() for teardown.

Compile-tested only; I do not have NPCM hardware, so runtime testing by
the Nuvoton maintainers would be appreciated.
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..c28d9d7edd83 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -120,6 +120,7 @@ struct npcm_video {
 
 	struct list_head buffers;
 	struct mutex buffer_lock; /* buffer list lock */
+	int irq;
 	unsigned long flags;
 	unsigned int sequence;
 
@@ -1486,6 +1487,7 @@ static int npcm_video_start_streaming(struct vb2_queue *q, unsigned int count)
 	}
 
 	set_bit(VIDEO_STREAMING, &video->flags);
+	enable_irq(video->irq);
 	return 0;
 }
 
@@ -1494,6 +1496,7 @@ static void npcm_video_stop_streaming(struct vb2_queue *q)
 	struct npcm_video *video = vb2_get_drv_priv(q);
 	struct regmap *vcd = video->vcd_regmap;
 
+	disable_irq(video->irq);
 	clear_bit(VIDEO_STREAMING, &video->flags);
 	regmap_write(vcd, VCD_INTE, 0);
 	regmap_write(vcd, VCD_STAT, VCD_STAT_CLEAR);
@@ -1707,9 +1710,10 @@ static int npcm_video_init(struct npcm_video *video)
 		dev_err(dev, "Failed to find VCD IRQ\n");
 		return -ENODEV;
 	}
+	video->irq = irq;
 
 	rc = devm_request_threaded_irq(dev, irq, NULL, npcm_video_irq,
-				       IRQF_ONESHOT, DEVICE_NAME, video);
+				       IRQF_ONESHOT | IRQF_NO_AUTOEN, DEVICE_NAME, video);
 	if (rc < 0) {
 		dev_err(dev, "Failed to request IRQ %d\n", irq);
 		return rc;
@@ -1807,8 +1811,7 @@ static void npcm_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct npcm_video *video = to_npcm_video(v4l2_dev);
 
-	video_unregister_device(&video->vdev);
-	vb2_queue_release(&video->queue);
+	vb2_video_unregister_device(&video->vdev);
 	v4l2_ctrl_handler_free(&video->ctrl_handler);
 	v4l2_device_unregister(v4l2_dev);
 	if (video->ece.enable)
-- 
2.34.1


