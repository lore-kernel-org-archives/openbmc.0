Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WTorYMDX"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBhX4HBLzF3Hc
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:12 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id r1-v6so58488pgp.11
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WDCqUbAJ1b7SoTNVuP7LYvyxKcy9lEwuy3pQ6q0G1P0=;
 b=WTorYMDXarpyxtf184FFBxOJjqCP7HU5V2DeBBZjnAI9hvRqraX6DT+1hnIRtSmpJ2
 MMG3wyxZQAQowZTQQC0A9kVtu95+VTYvhpmBj+Gn+jaqhZN36D8zYrwKE5wOjYY3mHjq
 sjb08Rc7MuY7j/cyukuAOxKTRIGrsKNjqubgYSiv3/smPw254JAOfy770hsWfWX8YpAt
 rD07T5e13oc5st3+48iFJ/7BO7mZHE70lUX1DcqGd87iYJxr6s5pSfeLXkcfKXg8XoPk
 rnL+93g2MBlyC5wy6XyNdGNvxYl3igivRO7vYpFTv+z6oThnxkF0q3nz+hOFivAf600b
 80nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WDCqUbAJ1b7SoTNVuP7LYvyxKcy9lEwuy3pQ6q0G1P0=;
 b=dz/w2JZVP0Nx/I+0IpaVHESDVSmxcz2LOsrDrtEkaFZ2xd8FpwW8A2nDJwZcH9Slup
 0kpletrogL7FGMCot0L2MXfBqNhf3gkq2zYkgyQARjUWK2wn4vxkz8aoYl2DDW+a+GsP
 cmEOdNg7otjtPt541TpRJobgIN++j5cluRiqT+GSaZQmYQHIpP11feD89QlSvIL0huWC
 zpspgOEWfc+qFLDPcemK8+K6SM3vhi0Bnbpt1MpMangeyGuC05dM8sCdC+d53cC5/Dti
 bQyBPAkcmaDte0CM4mDPBGd6n1+V4oReqMW9bKak5bZ9iZQTEaT0gHgMKYrAj8Kz6A17
 UZEQ==
X-Gm-Message-State: AOUpUlGacY4EW/Ov4GFlBtppq2xYpoLEbFzAWzeEH9cg+n7tO2izMrlg
 5zN2hMqAgG+ODlInHKuf39vk6A==
X-Google-Smtp-Source: AAOMgpdOpF23bXV8WYUQpgolt0f2bcVTBPV8WF1A9bczMktM9Ppw/vewuAITHNlGHLm6Bh/1mI/CsA==
X-Received: by 2002:a62:be03:: with SMTP id l3-v6mr540710pff.138.1531812490199; 
 Tue, 17 Jul 2018 00:28:10 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:09 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 1/7] clk: Aspeed: Modify clk-aspeed.c driver
 probe sequence
Date: Tue, 17 Jul 2018 15:26:12 +0800
Message-Id: <1531812378-14316-2-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 07:28:13 -0000

In Aspeed's SoC, all IP clk gating and pll parameter is in scu
controller, before IP driver probe, scu driver need prepare for it.
So buildin_platform_driver to core_initcall.

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/clk/clk-aspeed.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 8796b8a..9e55743 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -573,7 +573,12 @@ static struct platform_driver aspeed_clk_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
-builtin_platform_driver(aspeed_clk_driver);
+
+static int __init aspeed_clk_init(void)
+{
+	return platform_driver_register(&aspeed_clk_driver);
+}
+core_initcall(aspeed_clk_init);
 
 static void __init aspeed_ast2400_cc(struct regmap *map)
 {
-- 
2.7.4
