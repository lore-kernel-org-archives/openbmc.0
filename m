Return-Path: <openbmc+bounces-2470-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8903CC5DF87
	for <openbmc@archiver.kernel.org>; Fri, 21 Aug 2026 10:10:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hRGHq6PS0z3cMV;
	Fri, 21 Aug 2026 20:09:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787306967;
	cv=none; b=Dartnp4NGe3FsbS5ZZJT0Awxc0fyHpsF5v0vFaL89dW9AcOCwJ0F0kScDh5vt0pv+1QihyDXs7L1Z69TXpDLhWmrVoJfjmrTDHCKPb+SpCML8k0cCqjPiL47ijFoLd0NhXwM2eohXRCVTreAQQByTVSCRVTdIp7Pr4wtc3AZPkrEUivHua39YJoe3cqP5ZGY+xw/MIXfGhY7scjy0QttGa4PXYkiL8CUZbyoxFJn0OLIbHYkwaE1cxunhZR6rKJv4USqQy3G49jbr7Gq9rjWfFwyLXbmab2I7HgmOizBSo2MeQ2FyoxT0UfHqaBzaqO6UgC2Pen+q+mlwiIoc8XanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787306967; c=relaxed/relaxed;
	bh=7WvQxUev3BI2P5gxVQPPCvNbBVHfS5Wqv+a2lpA7x38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3pLl703t83LMBXkPb+rdsgEAs9UMFubpRP108vn7uRsfglmZg3Kt7MzOz2EUmwEOZFRxdOpT1nfXQS607TeHtth5XwjZSRb2YnWQyipFZL1MmPxH0tV3muUUqcMNlcIaqWYOkQsbT8NPbSIUKtJOr/dzY7mc3nbkfmLlUkbTxFMgdzPePVXfdIoUldH0rTV3SdfGuUgr5kELD7GcGJdqDRk1Km8sXOJgAxGPc/J7yYDBX7NMxb9GY+IZldbs3+MbMMVyk+bVYNXwzOaejBkILkT7laZ+gBEAIPjV1KcaV03XK1ulvzChAN22fX92rQwNiIOjTO+cQroNtK9HR8NKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hRGHq0WmQz3cLr
	for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2026 20:09:27 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37BED60A71;
	Fri, 21 Aug 2026 10:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F011F00A3E;
	Fri, 21 Aug 2026 10:09:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>
Cc: linux-rtc@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] rtc: philips: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:09:05 +0200
Message-ID: <8281eaf605069aac2211d83233e11285b8e8ca84.1787241693.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787241693.git.geert+renesas@glider.be>
References: <cover.1787241693.git.geert+renesas@glider.be>
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

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/rtc/rtc-pcf85063.c | 2 +-
 drivers/rtc/rtc-pcf8563.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 01e209d88f5f357f..8cb9ffc73f6d9001 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -498,7 +498,7 @@ static const struct clk_ops pcf85063_clkout_ops = {
 static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 {
 	struct clk *clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct device_node *node = pcf85063->rtc->dev.parent->of_node;
 	struct device_node *fixed_clock;
 
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 81d13733b1e9372f..5503eb61df13f4a6 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -425,7 +425,7 @@ static const struct clk_ops pcf8563_clkout_ops = {
 static struct clk *pcf8563_clkout_register_clk(struct pcf8563 *pcf8563)
 {
 	struct device_node *node = pcf8563->rtc->dev.parent->of_node;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *clk;
 	int ret;
 
-- 
2.43.0


