Return-Path: <openbmc+bounces-2468-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E14C5DF7D
	for <openbmc@archiver.kernel.org>; Fri, 21 Aug 2026 10:09:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hRGHk3YXZz3cJG;
	Fri, 21 Aug 2026 20:09:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787306962;
	cv=none; b=hBuuAS6HxQOWsWCWy3ehNmNwztAsUEKVKSq9LX+jfcKw5wL/ltZ2W8sHrDAjq0FMaMgaqvIEGw/e7O34bxMDOVDCtXMeqD7vUt8H1+MxTgMG7dlRLPAeE7FT7Xzx0PRBPssmNvnRqqH+X4L9Cxx6JL5lgCduSGx0GSVIlQMNawYrfyLfdBSwn5HasYMS5upqzYolVSLOGd5Nj77i9KPwb7GNuVNM1rSUXeIsAi7jqWpiLXxBLmYolT8l7CvHj/OipRw8dh0E2RB5cGOKtnwX57rGEP1RdnWISynRsJPbqi3fhrhK+Ymvphrimo+Iclo2cEIuf98tPheWuE2C9NSHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787306962; c=relaxed/relaxed;
	bh=eh0RfLPgoqLqvb2tjdMEnmnlNb8UgBi6V6fcXiH8FnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=en/8XnoAkX5fQob2ybS6gju9bSvCwnt6WKTnqrVaSwiAngcfBSQjSvF/324wi7Jr7IqQ6oO75pv5A3dNkPojzQ0q+LZOyfw4HJYDkIKytaq2GJyGgG7OYIdD4YMUuPnYxvw2nes+9VaoSN0D8hP5G44trs+XzLiyFP3MCNieiiOGRlCHLKtZF5dteHM1nm6lMUDoaQOSGS3t2Jl5EqZdqWh5otlf9HfZGED9K4y1VCKJ3c7k4zBWHVFoiPGfFwNU6XF7z9oR65kcryaIAwE+Uev8TU3s7BeGk5l3XwQ/9wYCK4pKVpQyDDnWF6iqj6kQVQ/CZywuBSwzvCjy5Hv1vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hRGHj5W2Pz30BW
	for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2026 20:09:21 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5153741233;
	Fri, 21 Aug 2026 10:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C170E1F00A3D;
	Fri, 21 Aug 2026 10:09:16 +0000 (UTC)
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
Subject: [PATCH 2/5] rtc: m41t80: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:09:03 +0200
Message-ID: <c5290fb9a28b45d6bcec724d5897f8bcbf96ea50.1787241693.git.geert+renesas@glider.be>
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
 drivers/rtc/rtc-m41t80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 3c8c379392c14078..ec86ca3f2c4c85f8 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -574,8 +574,8 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
 	struct i2c_client *client = m41t80->client;
 	struct device_node *node = client->dev.of_node;
 	struct device_node *fixed_clock;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 	int ret;
 
 	fixed_clock = of_get_child_by_name(node, "clock");
-- 
2.43.0


