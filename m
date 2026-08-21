Return-Path: <openbmc+bounces-2469-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD255C5DF7D
	for <openbmc@archiver.kernel.org>; Fri, 21 Aug 2026 10:10:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hRGHn3q6qz3cLR;
	Fri, 21 Aug 2026 20:09:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787306965;
	cv=none; b=SXxeOyctn34jq9zk3mP7IubQtMhdvh6RftEoWYUCLVKfeZtVVY0qYS0NscSuEWpmJF98FlcBEXmculZCTYoYUIUJlo9nufvPSL84+Cem8lbK+ZFK7EmItuUWgFJtT3PEIpKxEoZNolmlh73Ge+p67b512upBAWpxRO1y0MOYd7iDrZuYtHfut33Ni1m7hUw8983mgrWo3DlYYIQ5hH0FWTMv8bDN5GHoU6C3BHRZmfMFFA9LVZph1BT25P2Vvwaf9fx2cvR2ky0hJe9h9WLlYgvmakf40avPNYW/+gtW6BzrKiL4Adjpw1yIjhpCXCIF9RFEKas8sr3ek3Vd9+Q2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787306965; c=relaxed/relaxed;
	bh=sfYaIoBOEASvzq1i7dIYu4XF1t7MgpDFB+WSqbP6mFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEt8ndseyXxCWWIXugXwBzXZm5kh9BjEUCrgjQbXdjSHih/vmzjkERzIXC6BWFGbh+jEq15+BTkn+DQMXV2WqqMKWOuiiCIEaWh0pmziQHCzcGg+GWJG8vdPDUsL8re6nBoUiocmKuiLlFsbxw1RZWFvEOxDh0W6st88ndo7C/l8YKSd6Zj6CuNxPhPqr9V82eJ5e4khxWc7FlJVqWL8HSsRNs2dkyAX4pF8kDrhUJGs2jDyx+TQWCpxOMYi3qXCHTdidJilZ7t39a8AsmbvHkLnbObsei48Ovox6EHc5dtXYqjhBbxTNLrQ/P3pZgjGIVkUv/Ahn2+n2mEWMO/Jzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=h7h1=go=glider.be=geert+renesas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hRGHm2bQyz30BW
	for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2026 20:09:24 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30DBF4055A;
	Fri, 21 Aug 2026 10:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26911F00A3F;
	Fri, 21 Aug 2026 10:09:19 +0000 (UTC)
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
Subject: [PATCH 3/5] rtc: nct3018y: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:09:04 +0200
Message-ID: <6dba18b645aeea279a67f4625d5ec48037c76f0c.1787241693.git.geert+renesas@glider.be>
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
 drivers/rtc/rtc-nct3018y.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index 700a395fad3a63b6..2f7ad57057a4b8a1 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -459,8 +459,8 @@ static struct clk *nct3018y_clkout_register_clk(struct nct3018y *nct3018y)
 {
 	struct i2c_client *client = nct3018y->client;
 	struct device_node *node = client->dev.of_node;
+	struct clk_init_data init = {};
 	struct clk *clk;
-	struct clk_init_data init;
 
 	init.name = "nct3018y-clkout";
 	init.ops = &nct3018y_clkout_ops;
-- 
2.43.0


