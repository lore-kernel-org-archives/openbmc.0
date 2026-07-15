Return-Path: <openbmc+bounces-2296-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690A2C4451C
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:57:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2Dy170sWz3cFD;
	Sat, 18 Jul 2026 14:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784121657;
	cv=none; b=Q/fvNlw2+okS3JidpJWDu+WKeuiPoBJMKWTjJyy5vL4lPcFegJ5BN3iIk+my9yf4NQcXd8X739iYM0fmhMIRJH2TU7c7WfGTBlfpLqgd3GOdR/5tLHugmQbYNIzJ6SlZ2mxrzlggz7jFv2Q8va3YMavWFICysl0nREa9x0hQ+U8lcKcSSSooO2rc2dID7CJ0pVthBhdrKetN6miFSwlni3x+29h67hW40xn2izbg9Z2fFGSVQiSlualrPF/LdXFb9NzGNYXql6FM0lrZwyEC2Nho79ipRKOIM36aS8rnOM6RSPIJtX6Od5xjoJdm7zHFU4+3r5UhhSa370NFvvzerg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784121657; c=relaxed/relaxed;
	bh=AnJh4ulZ2FDQmjXmLpIokbZz9ArThgRLAhjnD2e/+74=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H3t7Ch4PA7g5U5cbr/T5e6GGx3R7O6Hol+MdQ3QHxrkBmQ1FqS8FEPGIcIefQbwAIvD5EwDtKBNYASe6XH7tlPs5/n71zhsAt2ZKam/CUdkihue2CUDoASoK7KvKeWYtfxLtl85uQ/1x+0E51JXTAzavOFNGsF2geVL4euKLCtZMoZjUeADd6ai5YXNkrqmglP1Q8pT/q4lpgo+kLhacf8tkZnFpanwMRXXbKh/OHJy4UC7rC8H3bhiipic6O5jcjDo2woeOasFYMvQANoChC18AkmJnnGfLUTOu5IoTMh/W6zCJXVp+mbN2ht6dh26/pqUMhKEwhYrVr7xw3GrOfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ryk2LkDx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=hverkuil+cisco@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ryk2LkDx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=hverkuil+cisco@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0cHr50p2z2yb9
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 23:20:56 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0102C600BB;
	Wed, 15 Jul 2026 13:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014EB1F000E9;
	Wed, 15 Jul 2026 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121653;
	bh=AnJh4ulZ2FDQmjXmLpIokbZz9ArThgRLAhjnD2e/+74=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Ryk2LkDxXyn3kUcpDL+0fwufrehLYg8miacUpJ3uT6cWYzFCr1oRAQjxpfzYzVrkp
	 2lud+XhSpfDOTtptne/ZiUDz+X4NB+F6xnQVv+Zj7S8x/0Svu5XbqSqQEvP+edxEDT
	 gcyRRQk3QU8SB77ec8Zwjpico2IA+2KzKId+ExYVeRq5iMevl0aJAAhI6phAJf3zGD
	 mcscVZ8q/QORVOrXvevWdMij9SZQZM1BMg8Usw6heKSjiVWp7KjKb5gtmpPsTtAA8r
	 WRqiVRtrquM4W3APc3v1Aa8LBax2ebEI4SeKFIT4oi53xd4g/nErtXGi1IZVReeWEt
	 CxpnQiVx2dm2A==
Message-ID: <04a332fc-2025-4a74-ae4d-1d8f30fe20bf@kernel.org>
Date: Wed, 15 Jul 2026 15:20:50 +0200
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
Subject: Re: [PATCH] media: nuvoton: npcm-video: quiesce VCD IRQ before
 teardown in remove
To: Fan Wu <fanwu01@zju.edu.cn>, kwliu@nuvoton.com, kflin@nuvoton.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260714020443.2795883-1-fanwu01@zju.edu.cn>
Content-Language: en-US, nl
In-Reply-To: <20260714020443.2795883-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/07/2026 04:04, Fan Wu wrote:
> The VCD interrupt is requested with devm_request_threaded_irq() in
> npcm_video_init(), so it stays registered until the devm release that
> follows npcm_video_remove().  remove() itself calls kfree(video), so a
> VCD interrupt delivered between kfree(video) and that devm release
> dereferences freed memory: npcm_video_irq() reads VCD_STAT off
> video->vcd_regmap before the VIDEO_STREAMING flag early-return, so the
> use-after-free is unconditional on delivery, not gated by streaming
> state.
> 
> With streaming active, stop_streaming() (run from vb2_queue_release())
> masks VCD_INTE and resets the VCD, but an in-flight handler can
> re-enable VCD_INTE afterward.  On a DONE or FIFO-overrun/overflow
> interrupt the handler finishes its buffer under buffer_lock and then
> calls npcm_video_start_frame().  start_frame() drops buffer_lock before
> it re-enables VCD_INTE (VCD_INTE_DONE_IE) and starts the next capture
> (npcm_video_command() with VCD_CMD_GO); it can therefore perform those
> operations after stop_streaming() masks and resets the VCD.
> 
> For the re-arm to happen, start_frame() must take buffer_lock, find a
> next queued buffer, and release the lock before stop_streaming() empties
> the list.  Once start_frame() has released the lock, the VCD re-enable
> and capture start that follow are outside buffer_lock, so emptying the
> list afterwards cannot stop them.  buffer_lock protects the buffer list
> only; it is not held for the re-arm and capture start, nor for
> stop_streaming()'s mask and reset, so those VCD writes are not
> serialized with each other.  start_frame() returns without re-arming
> when no next buffer is queued, there is no video signal, or the VCD
> stays busy past its poll timeout.
> 
> That capture can complete and raise VCD_STAT_DONE; with VCD_INTE
> re-armed, a new interrupt can then fire after kfree(video), and the
> handler dereferences the freed per-device structure.
> 
> Unregister the video device, then mask the VCD interrupt source and
> unregister and drain the threaded handler with devm_free_irq() before
> releasing the vb2 buffers, the ECE state and the per-device structure.
> devm_free_irq() also clears the devm action, so the later devm release
> is a no-op and does not double-free.  Gating the re-arm alone would not
> close the window: the handler dereferences the per-device structure
> before any streaming-flag check, so any interrupt delivered after
> kfree(video) is fatal regardless of re-arm.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>  drivers/media/platform/nuvoton/npcm-video.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index 52505af35c08..637b1fe54824 100644
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
> @@ -1707,6 +1708,7 @@ static int npcm_video_init(struct npcm_video *video)
>  		dev_err(dev, "Failed to find VCD IRQ\n");
>  		return -ENODEV;
>  	}
> +	video->irq = irq;
>  
>  	rc = devm_request_threaded_irq(dev, irq, NULL, npcm_video_irq,
>  				       IRQF_ONESHOT, DEVICE_NAME, video);
> @@ -1808,6 +1810,8 @@ static void npcm_video_remove(struct platform_device *pdev)
>  	struct npcm_video *video = to_npcm_video(v4l2_dev);
>  
>  	video_unregister_device(&video->vdev);
> +	regmap_write(video->vcd_regmap, VCD_INTE, 0);
> +	devm_free_irq(dev, video->irq, video);
>  	vb2_queue_release(&video->queue);
>  	v4l2_ctrl_handler_free(&video->ctrl_handler);
>  	v4l2_device_unregister(v4l2_dev);

I think this can be done easier: in devm_request_threaded_irq add the IRQF_NO_AUTOEN
flag, then just call enable_irq in start_streaming and disable_irq in stop_streaming.

In npcm_video_remove() you should replace video_unregister_device by vb2_video_unregister_device
(as that ensures that stop_streaming is called if streaming is in progress) and drop
vb2_queue_release (since vb2_video_unregister_device calls that).

I think that will be a clean approach.

But nuvoton devs need to test that as well to make sure it doesn't break anything.

Regards,

	Hans

