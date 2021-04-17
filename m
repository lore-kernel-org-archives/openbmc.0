Return-Path: <SRS0=+FD5=JO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E443C433B4
	for <openbmc@archiver.kernel.org>; Sat, 17 Apr 2021 03:43:27 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFEA6113D
	for <openbmc@archiver.kernel.org>; Sat, 17 Apr 2021 03:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFEA6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMf7K01xxz3bTD
	for <openbmc@archiver.kernel.org>; Sat, 17 Apr 2021 13:43:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=K0b5nLAi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K0b5nLAi; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMf6s5HMrz30DQ;
 Sat, 17 Apr 2021 13:43:00 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id j32so5679763pgm.6;
 Fri, 16 Apr 2021 20:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KEgAGlMIMGSD4Y3PLpFSkmFQK4X2O5FS+oaEvb1q+lY=;
 b=K0b5nLAizD7TGQDjgaOycW3pVacY3L7Ep+L1M4RObdMN2U6homi3AL+6ANBGRcLLyP
 wk2KHAqRuihRNK6M8acRbWXEB0Yl5BTqeVmylR0C3oBJkWqwK/TMaIKX9RziEPXg30as
 njFyJGypqwQaTqgu51A9+FAsuVyKn9MV7JecT/nWsdZrWboOJ9fWObm2t0QhjdsHZUaJ
 nNQceK0PgPxSCKW8hCWNwXpGqh0yWzx/fhIG7ta341FjY68/Gbaz4qLCPTvlRk4JyIwX
 R9r/KuAf3Fa3rKTMMiOOp7VTE/aytP8eME68cR+Kq4UukzCmlj+h07YXZOeBOhnirMgu
 WcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KEgAGlMIMGSD4Y3PLpFSkmFQK4X2O5FS+oaEvb1q+lY=;
 b=F7rrSLZbAPP6mUwDa8vERRhmIryNe7y4Gd04l53dc9AxBa8W0mZFDjPQtA2Uk5M2RU
 QQ6F4Llq1aPkZ9jtsemlNznHHSkb+01/VSNrT7k8AtEpn1MVTkgES2q2W6Oh9nbpJVex
 C3bRRGlvkH/Vyll8317JE+7Fhegu5WJeDbrshqgGGwRTKd69h4sVfkOfJ/v4UHffbPyr
 AYpIYSFLs+tagp+HzJblri6eXeichaHqhTU44vVK/CfnvAIysgeS8C4ilf64MYw/A7ld
 XTta/grk1q4LSLo1zdOm3kv7ogrx0lwapQjQaFKhRH24GIUtYFx3+MQA/EZaLwylTL/6
 ab6A==
X-Gm-Message-State: AOAM532Gog1MO4ZTHoU9ou81HMpW9l1HicMEaAA/SNSoe7tT60sq4BmD
 9u48w9Q6ph63OQFUxn+eoCc=
X-Google-Smtp-Source: ABdhPJz8p4ON3M1hNgneJYgt8P2lIK0ojWFajm7V/CS2x1h65e9dsl/vMa9ItbnRupxHrr2DLFfO/g==
X-Received: by 2002:a63:c14c:: with SMTP id p12mr1872172pgi.417.1618630977196; 
 Fri, 16 Apr 2021 20:42:57 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id f18sm4434821pfk.144.2021.04.16.20.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 20:42:56 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tao Ren <taoren@fb.com>, Amithash Prasad <amithash@fb.com>
Subject: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Date: Fri, 16 Apr 2021 20:42:49 -0700
Message-Id: <20210417034249.5978-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Fix hardware timeout calculation in aspeed_wdt_set_timeout function to
ensure the reload value does not exceed the hardware limit.

Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
Reported-by: Amithash Prasad <amithash@fb.com>
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 7e00960651fa..507fd815d767 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -147,7 +147,7 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
 
 	wdd->timeout = timeout;
 
-	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
+	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
 
 	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
 	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
-- 
2.17.1

