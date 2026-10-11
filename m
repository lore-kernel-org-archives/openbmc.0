Return-Path: <openbmc+bounces-2788-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F5FCC6B38
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:34:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5XBX5gCMz3bxf;
	Fri, 16 Oct 2026 15:33:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791748621;
	cv=none; b=cIh3RGoZnckbkYCcojmQA2GFENbqfT0056/GAH7IBfLRyaOP2iaJ9Z8ojOqM7iqmEE8RB0sAPrrHPNm9PhoBITaRA9aMjB+s1kyO0EtMrlxyVuZmIiMAr5H4V60Nz2O6KKThIO48UACnRoYCfcWzEWxKj2qJU+3uebP9NaDY7SqH8vZBeEOvommQWaR1ahbKE8ZQmmHcKqsiEGE+K23S+x615nwcotsds/TLei2Ch1gu0Ida58xYgiNG/k3/7oPxHlqdz34C0bZqkMdGEHRugO/hXPwX9yL9IgexJfK5K/Yxeum7ndZP8xHAe/8aB63asyfA9DJhWrnnqZgLj2M+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791748621; c=relaxed/relaxed;
	bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DHTe5bUN7gAZModSwe7c/sQt+zCrwnrM951+UY15UkM/wiy0IuX5kyTMB3fqDxyePbLT1jGWs1i+jww4gwvu+JWhdMeyvUdx26YQ8L3SkbEPSArnpGQILjfLKyUG883Wd4QaDiHWSH/Kl17Gia9KJ5kU0s4sZvGXZeqXaV/5o6fGGlKq2aEi+WxMVVGVztz4z9ZLrN+qVkn0l5ynMok22iQzsKAJgOAsrLovmoErMp4fRrnbOm3rG93tIZMlclGXEww2ikEHKCK084YkoRzfPISqaJOCZ/vEqSItniDKIQEBsqlAl0pw5R0+wCmko7DvET+jocpnQyEIO7OXRL+Zhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UIH5yb5n; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UIH5yb5n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j2rwC391Pz2y2B
	for <openbmc@lists.ozlabs.org>; Mon, 12 Oct 2026 06:56:58 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-917997ab0d9so18854976d6.3
        for <openbmc@lists.ozlabs.org>; Sun, 11 Oct 2026 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748610; x=1792353410; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=UIH5yb5nzikOnODzqtM80ZscxebxWypya5gCRwLedR1UQCT+ThVykU6+fE80sGU/uO
         O0gzoVEx/amK7mYfxLhl9NlCJTKre7Jdnob4ZP1t65oMYs1URlhvYQRAJCsBc0h8a0uP
         34/hFvqx4ncJd8gwvsfhmvp7G+oagHWi5Tum9WPkuW7q25udp5Ow9dvAxqiuGwfFzeyp
         r8FFFKHHDdVZ7HeNe3FuXLp2D5z20+IqmmZssQxx95ccUACMy7mhzvWbrBxHI2MsH9bv
         N3G89+TA8ChAK8yiyBQDHUT8Iy28wPRTy+UUxeDo0tzs+Z3//PVDU0Bm+5M1cpC4YPH4
         Hamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748610; x=1792353410;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=btE+ksLAP1R0IFmnCcLCk3ro1S1Kegw8N/ADNUTcqmGwQJSv9yVR/LzY0HKudSpNF4
         VWnJq1h6Q+gIkKoXms+MhASHxDZf0TjS+E70wTc8TVT/Ds/ePOkUNPzn5cIqwj8gy8sq
         exITqKHDJ+HnE9MjkP+aBfRtpxL9MZ8r4iLkqcg1n7gcrZeAOeBDfg09zkR7V/XMlSpZ
         HGFRDz4vb0HueMkSr3y0IE3aimCMMdVUapXkCpVtOjhol3hQgyHwqbzzvYPUQ6OdA85C
         19Z5wbsWp37qH4f9IlOPylR/kHYp6/9pHFgonDYn6h+6kZB9mlNDwBsyEl7ay6r7nOKv
         Xzjw==
X-Forwarded-Encrypted: i=1; AKwUvBxm/i4X3+aF5M5LtOXoqU+UAncmGJ1kPwVPjvVQGtfrcPBgwMyMo9l2kYy+QhAfTSWABtSiHotF@lists.ozlabs.org
X-Gm-Message-State: AFq9FYKulWAFNEyS8yE0AmTQ13chsHZpeBNmGA1aYcHauqcdB3qIpRbH
	a7yEnhs61m8/2TTq3gLB+WlJfWVljZjUIRGo3m1eVw3KOMjZwPM6F8Y=
X-Gm-Gg: AYBFou0F++ZAV8adSr85uxfOEoSPRbw/5TPSuAjnfIu6M6SaAtSp5qbcEYyXi0qA2Us
	3XMGPZ81Aa2XX43xf0GIZpcq0enulwm4A6WWLQ+zj6m1Pr+4sEKqfWrTKFyBaR1uQgjPEKiMeK4
	vD4RxFI479a3JjIVyP528N2xKwhiqT4DEzvbAU0OwiZildDu9KH3kvymfJc0JQnxTlGm50FWv/y
	d1SKQE3aLk1OLrr09WHg/pqgGXgqNOJ/iseT+yx7o2EHvzZOmzbrGlLdooJD0in39gf+Po+qDjW
	7LslZO/7Mrwr7AviAQ6Pf8ygAiNtXR8I/fd9uSPQ3jeyzgA5hU7FTGppo+ytf6huHWvri4kw6iX
	azvMibHbBIz2VxmN8i3LriM3MWj8TIvCF0ZuueUF4ywlEwO01mHPCFviCnWqAYod2hGlbRxpKH2
	GhjncJmfF/pp6xDLDYnAEUr0vQaG/3z9BTfjwkFC3it3S6cFlfwf0fs4uD9DGQO8tRMWWPM7h5+
	+/yLIijSldvil/6QxT+t1nzd7nQnUqo1iWehhrkrvI2rkXDm2q1pmnOJ6X1peUXmcgffXyynTu0
	JRTsPXxL219Eh2mc5BYXG5EISnh7iZOD9SDn3L0=
X-Received: by 2002:a05:6214:498e:b0:91b:5d3b:4acc with SMTP id 6a1803df08f44-91b5d3b4e26mr149047996d6.53.1791748610213;
        Sun, 11 Oct 2026 12:56:50 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550dfb6csm77651326d6.45.2026.10.11.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:56:49 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: aspeed: disable resolution work before removing the device
Date: Sun, 11 Oct 2026 15:56:45 -0400
Message-ID: <179174852932.3.2170255507797724902.G64@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A resolution-change interrupt schedules res_work. The worker enables the
video engine clocks, initializes registers and detects the resolution.
It can also queue a V4L2 event or restart frame capture. The remove path
shuts down the engine and releases resources without cancelling or
waiting for this work, so the worker can undo the shutdown or access
resources after they have been released.

Disable and drain res_work before turning the engine off. This cancels
pending work, waits for a running worker and prevents the IRQ handler
from queuing the work again. Keep the clocks and IRQ handler available
during the wait because resolution detection can wait for an IRQ.

This issue was found by static analysis.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm64). No runtime testing.

 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275..4274b90 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2360,6 +2360,7 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct aspeed_video *video = to_aspeed_video(v4l2_dev);
 
+	disable_delayed_work_sync(&video->res_work);
 	aspeed_video_off(video);
 
 	aspeed_video_debugfs_remove(video);

