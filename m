Return-Path: <openbmc+bounces-2378-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B0EC55174
	for <openbmc@archiver.kernel.org>; Wed,  5 Aug 2026 06:13:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hFKpX2Hl2z30B9;
	Wed, 05 Aug 2026 16:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785910388;
	cv=none; b=Z8deZpiFsrEJLK7R/9qgSyCmCXSht2HT1bLVjoOTiD8dNrT0XYD/rX3WmSx9Ed/Iyi62TTIZH2OkQ1JpI4ULsu5CInlYB5A83Jp4X3+1J8usfhp6+KW41B+p4hFDMXjCeQBzB3etoLsmuOJDe5NtT0m0/h7M1R4v4OqJv3H6ZFlPOkMKS7F4Ss1HLhaOpD7q6e+dg8AGQvS+y80VFGYLDwaz0VRe/1fq9Eq5fnedMu44S+1e5K1WeD1uzU6hU7Thv6mkTjqizVR/8yxsQ5XlDb1uIgoe7z1vP1PfolkM5+7fqWRnrlNbTeq770+DjddBLhygQ3spldosk20rjSgN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785910388; c=relaxed/relaxed;
	bh=nwn1zbe2DkdzXm9pv3kiPyJ99OEpbm5r/BI14tM+iAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WV+Y02on5sMO3sRCtXwSaUNsW42zzZ18MYU1QhkOvr1mH5ocS2A/oyhKiJ8W251BhSomxY8OfKaQMInxen12ih0yO7pJBbgshtheMoUm12gsvPRr7g+rh/JZz3DSnU5TK9iP78TzZC6rc164Knm8HjDb1O9osPxS1KoVnaGxgueTTrFQ7dTA9AtqzQYqNGVruh/g43E/b0hn6THQm7V9LqxrbpzAEIi504H8kIm9lj4bO1LgsfqlyDZkHU+bSXtcmLfNHrGsnQ6/CIjkzr0hsXcLIuOuH+dH9xmncjpVdKz4rIv6bcKSZTmC8jobTIsAP+yTHuNKPfDpEDO7Y39QSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OA1UJBUs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OA1UJBUs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hFKpW2l1Sz2xqM
	for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2026 16:13:07 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e041ea211so689903a91.0
        for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785910385; x=1786515185; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwn1zbe2DkdzXm9pv3kiPyJ99OEpbm5r/BI14tM+iAs=;
        b=OA1UJBUshk6uWTGsuBu7olR+tkbcvlVWYRN5wk+X0YYFvCoiemLX3Ctfc0jD1VsZ8U
         fkzoJiybonDwT7qpuppfts47SuLGU/SD1QW3mfWjrjeSgzeabTNeAueGINpfvtAgNlaP
         Y6b4Wr0Js3duFLtLockmQWsiYjfZqL8TRPR3xJlFZCXC8ll1jeeOpsuOfL3z88M8HE04
         S6bl8zKg7luGy+q3CwB1TqqLV36H3sEa5cORnUIsTTjH9qi3QIXsaQHUxaThzBSvlSYi
         4pEtygchrk9I+yXa0WoDJuyx7mnqXEZpg7NKL1oxaF4dOxhe8AUab4U7QPptFlitG49g
         H0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910385; x=1786515185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwn1zbe2DkdzXm9pv3kiPyJ99OEpbm5r/BI14tM+iAs=;
        b=aMySSpk/8n2jk2fbHXqom8vvY4tqNl4fy4eXLAwcboMiNQ1MvX2y8buore1R2tjhfY
         ZyTVI+NBvzd3NittprWppIRTsmkQGluZ4ipd7WpPhBBxt7Yip2xY7zBHp6pPbNwU8b9R
         D+VjNI63G1VhSyjCZjwnZZU3xAeI4MXgRue22b0ncjRaogBJiNe4ZrhYfM0LtLuM9oyp
         YOFCQakoyJQMYzp8EhWLo9reVB2mXITMrpz0A73XVuXciZXCN0AUWAWOoLyyckmUO8/L
         m6WmS4lR7o6sT/AhU1XiK2Uq58oHqueCD36wI3fjWajfbQqDPvmU4HaIaCiWinuk+PB7
         1yYA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/e4DC+t6FLX/ua6tgF0aKphVyZLt/3/Y4dvRSYNlJ2cnOrX7v/NsuDT7bNwpulzRczbGpYlhp@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywa+JGVbGxFS2ZRCQ4/jPgdETbPwDwyMlVOnEh25+gr/r+vnPbg
	sCCHsxUdIAh9rnJdS+H/DKmOzGAAHCIqBPHMoSTCFPQ7xe/sH2FwXERn
X-Gm-Gg: AR+sD13qViHyHjopX8UdIqbzl/zURb1guWgckAiZD2p59YX/D9gCfQMUWqgLGNRA/mG
	yg1nUagrtAJyTsNwjfA4wlUIcurBN/1vqoh1ubvWxzGeX0RdjawpVowpTtBWtFf66xnnXZD/uCN
	8kgEXIEcl4/gFekn+PltBqAVggcB6TIYoaJCakbOTw5xAhxJbT7gubHTpd9HyDbOouTn120HyaJ
	xonC5n+WU64k3WDvTNc2qsgiHXMwH/f3F2qpZbmR3WH67fSMnbXdS97ozMVXvSMCY5yc3Awus8S
	+iyRmrhNluxyE2LfFHIDMQfE0yVe78ZLW8qdYOkzL7Bb4kv6Pp5lF1zpaS++iWh+mAvHDlqxH19
	aIlflLuug7QjQxpDjYB32oOibqPIIT25JTKwnScNMS/TDIyQvFAs79tc/FKZuKS7JndizAMiX5r
	lZlSlZ0XJz86lreYh4ZuRjz6x7kXo/Go6FNsTY3QoPbCu12BcOklFzhtbzLu7KWs9yjHZoTx4BB
	G/81EyrdldkWjOEgSb7fW1nM0q25owhrkM=
X-Received: by 2002:a17:90b:6cf:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-3903c598e78mr4630252a91.6.1785910385168;
        Tue, 04 Aug 2026 23:13:05 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917ae54sm2009561a91.8.2026.08.04.23.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:13:04 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH linux dev-6.18 3/4] iio: adc: aspeed: Replace mdelay() with fsleep() for ADC stabilization delay
Date: Wed,  5 Aug 2026 14:13:08 +0800
Message-ID: <20260805061310.1740724-4-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805061310.1740724-1-chou.cosmo@gmail.com>
References: <20260805061310.1740724-1-chou.cosmo@gmail.com>
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

From: Billy Tsai <billy_tsai@aspeedtech.com>

The ADC stabilization delays in compensation mode and battery sensing
mode do not require atomic context. Using mdelay() here results in
unnecessary busy waiting.

Replace mdelay(1) with fsleep(1000) to allow the scheduler to run other
tasks while waiting for the ADC to stabilize.

Also fix a minor typo in the comment ("adc" -> "ADC").

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/iio/adc/aspeed_adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 3ff24474f394..a1a6296d3003 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -259,7 +259,7 @@ static int aspeed_adc_compensation(struct iio_dev *indio_dev)
 	 * After enable compensating sensing mode need to wait some time for ADC stable
 	 * Experiment result is 1ms.
 	 */
-	mdelay(1);
+	fsleep(1000);
 
 	for (index = 0; index < 16; index++) {
 		/*
@@ -314,10 +314,10 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 				       ASPEED_ADC_BAT_SENSING_ENABLE,
 			       data->base + ASPEED_REG_ENGINE_CONTROL);
 			/*
-			 * After enable battery sensing mode need to wait some time for adc stable
+			 * After enable battery sensing mode need to wait some time for ADC stable
 			 * Experiment result is 1ms.
 			 */
-			mdelay(1);
+			fsleep(1000);
 			*val = readw(data->base + chan->address);
 			*val = (*val * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
-- 
2.53.0


