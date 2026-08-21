Return-Path: <openbmc+bounces-2467-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5D6C5DF7D
	for <openbmc@archiver.kernel.org>; Fri, 21 Aug 2026 10:09:35 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hRGHj0wZpz3cGb;
	Fri, 21 Aug 2026 20:09:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787306960;
	cv=none; b=Ho0frcU0R9fSUQ7eoQc0PmOPBvxqJ7stFEhG0Fw9KWwYbmW6YmUMd0oH+pmH8Tos7DRJRwSdAZ0DYYdD/9dKQubEXhcJsyN7KihT8OuUkqe218pV4U/Rmiqq0FTP/k06hLfzsCUK0STOX3fzzQQOtVeCm6x4mQXITxKU4tr1jWP+3VDD/Q3ts/QL2DR9f3og67PbPJYI9Uq8ziyxmLzVL3ViLvkmo+1VoZe8xzRdILOnw9gzMqRlAv3gzSL502jKL97Mk5MxxYLPUjm45vKB2NmwE6HzUH12jbLFfZAg1Vh5DyuqE/0LrYvKLkYWCMoa5c9hkY2nA/zGsXVKbVlaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787306960; c=relaxed/relaxed;
	bh=0MsSTyQyE5AG+XiuZ1ZIcLYtcLapFqazQN9DnQtEbCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/m8S3ep16ctaaHHkJhmXtqRgxMNKdIbaIT68ikU8Deco+ma9KqU6b3RuDgSuSAktQEbtYsQarcyTBNEX2oRDJih0j5E/jOCZGCxGhZ5DFQ8pUaqsZeNhHLAMT9ki3uSE3Y+ou80ZRGawmMR7x5Gkg8EYgZ1Isrh2rXFwvDKO8Gbkt6EoGRMvkHXLFMUblritQXCrtYlzbye3/egXozVa+QYhEiFgZ609jiKEXCQKv+66jvL9clJpMysq1uc7o+zLsLobKP0wOzQUN6x/rApbMuJBhMe3TM/50mewjZoGf3t0qELxgAfSHyJe8ie2jBOYEJAPu1Jw+LH0V30mdVm0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hRGHh1TzGz30BW
	for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2026 20:09:20 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C1C141982;
	Fri, 21 Aug 2026 10:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EB41F000E9;
	Fri, 21 Aug 2026 10:09:13 +0000 (UTC)
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
Subject: [PATCH 1/5] rtc: hym8563: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:09:02 +0200
Message-ID: <657f2b3a871074087aee0b7a70bf527ab0f48da8.1787241693.git.geert+renesas@glider.be>
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
 drivers/rtc/rtc-hym8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 3156aa5f2d9ff264..1d52cc3def02ef22 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -376,8 +376,8 @@ static struct clk *hym8563_clkout_register_clk(struct hym8563 *hym8563)
 {
 	struct i2c_client *client = hym8563->client;
 	struct device_node *node = client->dev.of_node;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 	int ret;
 
 	ret = i2c_smbus_write_byte_data(client, HYM8563_CLKOUT,
-- 
2.43.0


