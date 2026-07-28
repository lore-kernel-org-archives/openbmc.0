Return-Path: <openbmc+bounces-2323-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA79C54F51
	for <openbmc@archiver.kernel.org>; Wed, 29 Jul 2026 00:01:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h8stQ4StVz2yjR;
	Wed, 29 Jul 2026 10:01:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785240717;
	cv=none; b=VDfuvJN0gGgR62mpI9NMtSb4IDz7VhMbusvFID4f8tt2+5a6wF0Oh0LwSy60ksWtiYgrQHNvxIr+w+7+8xSLE8GGYZrJfPDfyc9n7nqeOHhitNwSTiTQeqcTRwIziaW5p837Cxi7PhRxvFq62sNPvsRao8ZXk6l82N4xXVrtB7dbWjSOaZtE0Bhb+c3eyE7Ni848LHcCaaFF0MY6P/mhQppJZwFZZ3eGYOjRr5EzikhREUJIE5F2JKT8emdPxXzYJrCmsWEHptqyZJSoo90aHLULL7qKgOzNr7ud1wxNYwWBAEQlS6jrqGo8rl0zC8ciJg0kIHf0xv6U++Y6eGqX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785240717; c=relaxed/relaxed;
	bh=n99i02Gu7p+ZioXqd7dLXXBNhh5AAfhsFukBthP4AHQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hw/CoTgHsPTGHZklznnk6KQn7p5SrtIAA8gY/zGX4peChlbxtTYX1Mta+pLnKpAHefixWLOY5qQsLfg0D1UVOWIguxzt5HSJS85Q7dHLSMfOsxEcYLA3CXZg5NSmcKT01fF8Z6LKmlYagWyQ9K2El8BCeB5jCKVFPkWuyEnt4mkeF4ewinFCGDaNKBc+dbsfk2eqlJTkjEksbQHAq2zUYuA7j2ikyHLoWRko+NStZn+2bRxUOGTc1Kv4Hiq0diVVKME4w0SKSBzypQjoACprUFztg5yAFeFyCHVD6Zm/7+xvesxrlRFZWdvWrQvW9Xbp8/Iup96HXb5UuF+X+BQaJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVZFW/6y; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=hverkuil+cisco@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVZFW/6y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=hverkuil+cisco@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h8Z8D3tXqz2xJR
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2026 22:11:56 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C33A160AA5;
	Tue, 28 Jul 2026 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BD01F0155D;
	Tue, 28 Jul 2026 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785240713;
	bh=n99i02Gu7p+ZioXqd7dLXXBNhh5AAfhsFukBthP4AHQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=HVZFW/6ygVur7hpj2Y4Jrsa1fJ33jPFIhdpL719mNJsPahZQ7AjI8d4SPM2qdzFS2
	 xEndt6xHtRb4kzbTg4SmOyPY+/Tz7ELZRiFn0J4qLDiPfx+jW7H1x8kyUm+mKQf2S/
	 4sWEL5Cb1ofPQFXUhOQGUpFDlBCOCOo3BQ2YhXnc9ajzl2kNg+a32IOmGgDCz2/0Nk
	 7wNjlS9jcCeFchWtQS2d5q5AY5ci1d18O9ka0OfVAOFL69kUyx5OOP8VJDik/GKD1F
	 78RO55+6y0de2ns87KX25rOkA+r8mQjplqZfFxQamfEtIUlbaKVpGt4JszjHJiwIhg
	 wqevlukUNeTzQ==
Message-ID: <efb34ca7-27bf-413e-85b2-e7bb6b80cf2c@kernel.org>
Date: Tue, 28 Jul 2026 14:11:49 +0200
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
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: nuvoton: npcm-video: quiesce VCD IRQ before
 teardown
To: Fan Wu <fanwu01@zju.edu.cn>, kwliu@nuvoton.com, kflin@nuvoton.com
Cc: hverkuil@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <04a332fc-2025-4a74-ae4d-1d8f30fe20bf@kernel.org>
 <20260716101539.3129478-1-fanwu01@zju.edu.cn>
Content-Language: en-US, nl
In-Reply-To: <20260716101539.3129478-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Can Nuvoton test this patch? I feel happier if this is given a quick test.

Regards,

	Hans

On 16/07/2026 12:15, Fan Wu wrote:
> The VCD IRQ is devm-requested, but npcm_video_remove() frees the video
> object before devres releases that IRQ.  The threaded handler dereferences
> video->vcd_regmap before checking VIDEO_STREAMING, so an interrupt in that
> interval can access freed memory.
> 
> Request the IRQ with IRQF_NO_AUTOEN.  Enable it after starting capture and
> setting VIDEO_STREAMING, and disable it first in stop_streaming().
> disable_irq() waits for an in-flight threaded handler to finish, after
> which stop_streaming() can mask and reset the VCD without a handler
> re-enabling it.
> 
> Use vb2_video_unregister_device() during remove.  It releases the vb2
> queue and calls stop_streaming() for an active stream, ensuring that the
> IRQ is disabled before the video object is freed.  Do not release the queue
> separately.
> 
> If streaming is never started, IRQF_NO_AUTOEN keeps the IRQ disabled
> until devres releases it.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
> Changes since v1:
> - Follow Hans Verkuil's suggestion to tie IRQ enablement to the streaming
>   lifecycle (IRQF_NO_AUTOEN + enable_irq/disable_irq) and to use
>   vb2_video_unregister_device() for teardown.
> 
> Compile-tested only; I do not have NPCM hardware, so runtime testing by
> the Nuvoton maintainers would be appreciated.
> ---
>  drivers/media/platform/nuvoton/npcm-video.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index 52505af35c08..c28d9d7edd83 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -120,6 +120,7 @@ struct npcm_video {
>  
>  	struct list_head buffers;
>  	struct mutex buffer_lock; /* buffer list lock */
> +	int irq;
>  	unsigned long flags;
>  	unsigned int sequence;
>  
> @@ -1486,6 +1487,7 @@ static int npcm_video_start_streaming(struct vb2_queue *q, unsigned int count)
>  	}
>  
>  	set_bit(VIDEO_STREAMING, &video->flags);
> +	enable_irq(video->irq);
>  	return 0;
>  }
>  
> @@ -1494,6 +1496,7 @@ static void npcm_video_stop_streaming(struct vb2_queue *q)
>  	struct npcm_video *video = vb2_get_drv_priv(q);
>  	struct regmap *vcd = video->vcd_regmap;
>  
> +	disable_irq(video->irq);
>  	clear_bit(VIDEO_STREAMING, &video->flags);
>  	regmap_write(vcd, VCD_INTE, 0);
>  	regmap_write(vcd, VCD_STAT, VCD_STAT_CLEAR);
> @@ -1707,9 +1710,10 @@ static int npcm_video_init(struct npcm_video *video)
>  		dev_err(dev, "Failed to find VCD IRQ\n");
>  		return -ENODEV;
>  	}
> +	video->irq = irq;
>  
>  	rc = devm_request_threaded_irq(dev, irq, NULL, npcm_video_irq,
> -				       IRQF_ONESHOT, DEVICE_NAME, video);
> +				       IRQF_ONESHOT | IRQF_NO_AUTOEN, DEVICE_NAME, video);
>  	if (rc < 0) {
>  		dev_err(dev, "Failed to request IRQ %d\n", irq);
>  		return rc;
> @@ -1807,8 +1811,7 @@ static void npcm_video_remove(struct platform_device *pdev)
>  	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
>  	struct npcm_video *video = to_npcm_video(v4l2_dev);
>  
> -	video_unregister_device(&video->vdev);
> -	vb2_queue_release(&video->queue);
> +	vb2_video_unregister_device(&video->vdev);
>  	v4l2_ctrl_handler_free(&video->ctrl_handler);
>  	v4l2_device_unregister(v4l2_dev);
>  	if (video->ece.enable)


