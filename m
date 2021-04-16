Return-Path: <SRS0=tfcJ=JN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80210C433ED
	for <openbmc@archiver.kernel.org>; Fri, 16 Apr 2021 02:14:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E01FB6115B
	for <openbmc@archiver.kernel.org>; Fri, 16 Apr 2021 02:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E01FB6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM0Bt3gNSz3bV7
	for <openbmc@archiver.kernel.org>; Fri, 16 Apr 2021 12:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bnL7FccJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bnL7FccJ; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM0BP67Dzz2yyK;
 Fri, 16 Apr 2021 12:13:48 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 31so2742354pgn.13;
 Thu, 15 Apr 2021 19:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4aOl9WYg3lZW03MpbHK6GQG1irPulDKlcMdmsoDYUyM=;
 b=bnL7FccJsG4zTTkJBYehFLpBUVXBexu/pyNJ80IOWqbViQDw7z3C/kvtTNDfM2bzZr
 oDNQDWg5jLTENvwM1CT4YhJio8vD5aMBLl1R17FzJpALCLadHm3CPdbJNNsPdA4cY/4I
 XbiHdLJX5Z3/2oXc5ZJGRTW7KMarBWQ6jnnzR5pnWpR5ob80IGmBVNoooi8HZ3+s/t/P
 EdkhKKY8c44MGFBz+txDcSrUHJFH8PVVc7FtqOqkjlDzwvNJ2XcBZy9xd/y2O7O2pVrq
 Uw+v1zNmT4WN3vB5rdK6ZbtLM8DND5b+tGYU7RzCkT6Heg12fTBO/96323NN1bBsAsdI
 qqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4aOl9WYg3lZW03MpbHK6GQG1irPulDKlcMdmsoDYUyM=;
 b=d9AI/tqfbVD+lwiYIFmhTeu+u02xUqL87fw4nfRi6TIHtmWt1bQDQLUigpBJzJwWVH
 YxQqHzm841/y4SFR57awbahK4iM5qAcvKfDYjBKCP+uytShl2ZdnrCCN8Whw3YfrXtkN
 uBoERNrF5ctbv3xNpu1p2i5JYm3I2bk685CiDYAeKRERwOYIWdRbmM6LZ0nEEPg0es9h
 +mU26RlIMWoaG2TyY/NTUHJH1bIGJCT7HkeoMWBkIUy9nwA5ACClOqTyI+b7UecOwEWE
 TgLFL6w7R+uD7iC6FToSJAjG1c4HfptOPVUlOa46vH9ztKbpJ/L9hucBhS4r4Xv8QDk7
 xF+A==
X-Gm-Message-State: AOAM530fQAAgY8cdpOjG0ur9s+05Z0ylUl8n5pqGVIjGtYsGQt9MRZDW
 M8pdaostXigEKU8SfHqiKHc=
X-Google-Smtp-Source: ABdhPJzT1yDrVtxLd5Qh4dvbNL5uVKACMlcjXTmzw+HDicnrP+3i8/R73Qp6cm6BaCw/Uj8qOK/3Fw==
X-Received: by 2002:a05:6a00:2247:b029:25a:978:40b8 with SMTP id
 i7-20020a056a002247b029025a097840b8mr606588pfu.54.1618539225453; 
 Thu, 15 Apr 2021 19:13:45 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id u25sm3407079pgk.34.2021.04.15.19.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 19:13:45 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tao Ren <taoren@fb.com>, Amithash Prasad <amithash@fb.com>
Subject: [PATCH v2] watchdog: aspeed: fix integer overflow in set_timeout
 handler
Date: Thu, 15 Apr 2021 19:13:37 -0700
Message-Id: <20210416021337.18715-1-rentao.bupt@gmail.com>
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

Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
handler to avoid potential integer overflow when the supplied timeout is
greater than aspeed's maximum allowed timeout (4294 seconds).

Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
Reported-by: Amithash Prasad <amithash@fb.com>
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - do not touch "wdd->timeout": only "max_hw_heartbeat_ms * 1000" is
     updated to "max_hw_heartbeat_ms / 1000".

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

