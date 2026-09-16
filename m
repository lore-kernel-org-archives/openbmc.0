Return-Path: <openbmc+bounces-2598-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023B1C982C1
	for <openbmc@archiver.kernel.org>; Wed, 16 Sep 2026 22:59:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hlZ8D0rdhz2yln;
	Thu, 17 Sep 2026 08:59:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:3b::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789550886;
	cv=none; b=Bma4yKwFS4KdwogOoe/UW3T14xr36E7Kz6gCtnAKCg1atKAr20EAr29WzSIkv6x8JXzUwQNPDShKpEhKPrmlivufF6rExF4+4G7CiYKlvMQl/we0syMNV310iwML9vixoQVPHOTVEC2gex88i1tdOhUeBx+Zp/9J8bjvXmcv6BKbDRr8fbU7hYppqHvmI690kQUo+czTb7copFHfmeQ2yAnUADxHVSKyPZ8snBjPYPUm019lfBp9LWob4yAEfzwe0E65Y32RqMQODpwT+O9PV+AfLYusVmxPIFA6asaP7Igf+jG8+aLIr/d4ZNwxY4Sf4vv//KV8WtvonJC+DXR7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789550886; c=relaxed/relaxed;
	bh=Xo7H/CC3TMNfFUOdZ9uePQypBhksHgJvu4rQrR1pwFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8GyWa3Ez9lV/GTb4V+C0ID8N4j9dGTIgNxbTGrJGlcPQ/FdUx+zCE20Z5g4929ThMY3SnjnIxBqyAiR8TfNVg7T6drbQdSIN7TUXrwJesKsfuhQSo9AqIjsC05po/YzrSOS/bulMrarPQByWKy17JaKZSFf8OxsqFl0CrWN0TuB4biGCnKCi32xyxo3/veXp6mEoIiA0OTW9WT7BxBaMaNMlp223cs+CcR5L+H7f5xwvVp/2hUdhrQCet7wrGbka35xIjGWLEJ+kEQGh4nxSvISKwG2524+SSqwUYKTIkscKZS5x5gAGb75scJId06L1dqEoJYzo+hp5IhemHY2Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kJ7AneJ+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::10; helo=mail-pz2-x10.google.com; envelope-from=triet.hoang.dev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kJ7AneJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:3b::10; helo=mail-pz2-x10.google.com; envelope-from=triet.hoang.dev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pz2-x10.google.com (mail-pz2-x10.google.com [IPv6:2607:f8b0:4864:3b::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlD8524V3z2xns
	for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 19:28:03 +1000 (AEST)
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so474390a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550881; x=1790155681; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xo7H/CC3TMNfFUOdZ9uePQypBhksHgJvu4rQrR1pwFA=;
        b=kJ7AneJ+Z89yHtJZgJQgSmCNkU37UGLQwsNu4ftwJgOZ62/e09vQpY0T/OLHew2ybD
         bl2EK0PiDcnHfDOb4lI5XtGwvbVtVcwGKyVWwJRVn/Rc2vo/cg7Jn9YXyCFlPli37a+b
         KeKoBfgNxirHSXIZrRLpn97hPKIaaIb4jvOB5uwWD0XeWhPCg+kfPr7N8ejZtfaWe+nn
         mBUj8SYxAnGVW8ekUSEEzCkKakK4vJqB5WzKA2GwY5/JG3TXKKOqxybXHK3cVBye+TPo
         yUdzDhjqYNJ9DgzN/HlPmwFOq6DwCf0bV6NRLmYHBhYVpuwPQ1WB9E5liEUqLpwJHnip
         TgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550881; x=1790155681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xo7H/CC3TMNfFUOdZ9uePQypBhksHgJvu4rQrR1pwFA=;
        b=LfLgIXVlDqNLx4C5QNgx5MOlesE/cXGPfVPBEKGCLvkm1NhMDeq4J6s5XbcEM+IGua
         zEdDvfH2SM/YbamPtECbzweLPDh9NUSQzHTX1xO7JU0D63FPUSmue6B8wsZe2tG6WTku
         nPGxIjT08WKXM5JMT4pAjmTaK265awdOHeZWjvd4clLsz6cVKApCp5687ALPkp4mRzJg
         NTfk1vm14cLafUyzMydw18DTXkr5LZB1AlzBY1u7vu3dq7riHecCPzv4efyEIMWik0HP
         j4F36UX28jdbtNyLDPE3pXJhKiWOBaqyY+TfwhBOP2fN2UKs9Dg/iWLXmNAY1KkKo9sK
         pjZg==
X-Forwarded-Encrypted: i=1; AKwUvByI7/xadXN2hOFyCVNWBGi3+dbAQZugBaNjHBe9ccjUqidkG7YQEA/w94Ktp/xM5MyK8Ev8lGNp@lists.ozlabs.org
X-Gm-Message-State: AFuF++nFAQCOjHLD46D8E3cexYRfFWAO1LVagA6rc/NModLnmYmOOqT3
	g0VmBtBN4uVKYtQ6KMpaJ/gAW7JRZuKx6qTjhSRK+NTpBYj8tV5goGI=
X-Gm-Gg: AYBFou25dx+sjf0aLPBnJlF+gXM8ZrqPDZ/TuH9IWqHhqK1wIQo7I7WxfSfv7NTR4jj
	wf1Ap416Xkz2F6pN8P8fK15mcQ9Oj1+VI7hx5kBMFZuCewfmGLv+YX+j3qshxhAoZstv5HAwKx+
	pXKfIPePddC6YkIXEWFX1u4RQSdqBgSdAMBRAz5ZaPt0QgSTmk2a5Gp80yNNq+uSj6AP5sxllhB
	mButbPGhzng6oQJta2mCX2g0hjKkzriuduVoEBoDrD4qOj+v2OQXww9i6WsFfBApoyohjaI+8l2
	dr+pTLR4zsKl+rBPCmPaU4uo2z0fwaht1UVR2jvo0H+25a693cfdRCKyvQSuhiFkis2gTjxukvE
	fxvX9GFmlCOzGAn/YFvUt9EZr6JwDbFUa1X1y3ULACGKTdaWrANTvERr/WT64uFz5IbWFVchilw
	moo8UdU2DfWO5Dik7vA5/O2DxaKQkRGj/wXbY8AyCZJlvMphdCXjQvLQNZdA9I2LuFjFlKSZOp4
	DqOMArAKQIh
X-Received: by 2002:a17:90b:2252:b0:39d:ec42:df69 with SMTP id 98e67ed59e1d1-39e1e4d3ff4mr4427894a91.20.1789550881491;
        Wed, 16 Sep 2026 02:28:01 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bb22ee5sm3784158a91.5.2026.09.16.02.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:28:01 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] watchdog: npcm: Propagate errors from clock enable
Date: Wed, 16 Sep 2026 16:27:53 +0700
Message-ID: <20260916092753.187583-1-triet.hoang.dev@gmail.com>
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

Check and propagate errors returned by clk_prepare_enable() when
starting or restarting the watchdog. Also propagate errors from
npcm_wdt_start() through npcm_wdt_set_timeout() and probe.

This prevents the driver from silently continuing when the watchdog
clock cannot be enabled.

Fixes: 975b7f0fe669 ("watchdog: Add Nuvoton NPCM watchdog driver")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 51348969bf49..0976a580b9f2 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -149,8 +149,11 @@ static int npcm_wdt_start(struct watchdog_device *wdd)
 {
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
 	u32 val;
+	int err;
 
-	clk_prepare_enable(wdt->clk);
+	err = clk_prepare_enable(wdt->clk);
+	if (err)
+		return err;
 
 	if (wdd->timeout < 2)
 		val = 0x800;
@@ -216,7 +219,7 @@ static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
 		wdd->timeout = 2750;
 
 	if (watchdog_active(wdd))
-		npcm_wdt_start(wdd);
+		return npcm_wdt_start(wdd);
 
 	return 0;
 }
@@ -234,9 +237,12 @@ static int npcm_wdt_restart(struct watchdog_device *wdd,
 			    unsigned long action, void *data)
 {
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
+	int err;
 
 	/* For reset, we start the WDT clock and leave it running. */
-	clk_prepare_enable(wdt->clk);
+	err = clk_prepare_enable(wdt->clk);
+	if (err)
+		return err;
 
 	writel(NPCM_WTR | NPCM_WTRE | NPCM_WTE, wdt->reg);
 	udelay(1000);
@@ -428,13 +434,18 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
 	/* Ensure timeout is able to be represented by the hardware */
-	npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+	ret = npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
+	if (ret)
+		return ret;
 
 	npcm_get_reset_status(wdt, dev, data, start);
 
 	if (npcm_is_running(&wdt->wdd)) {
 		/* Restart with the default or device-tree specified timeout */
-		npcm_wdt_start(&wdt->wdd);
+		ret = npcm_wdt_start(&wdt->wdd);
+		if (ret)
+			return ret;
+
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-- 
2.53.0


