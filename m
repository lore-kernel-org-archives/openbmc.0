Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lL53vtFL"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS5r602vzF35N
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:40 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id e13-v6so4244859pff.7
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WDCqUbAJ1b7SoTNVuP7LYvyxKcy9lEwuy3pQ6q0G1P0=;
 b=lL53vtFLtiEavOuDf3SqTiqioULArNXeBM5jSrCGe5z2M9xYzcQvJX1H7+xPWTSqJT
 wn9+SBN8kCNjUnrVbQm0YD/89vt1lYT6WQVI1wmm6isSXXw6yfnNBqw8r6psEYMZdmCF
 U/mejGmxgMbhRYyzl7JIdJvag63PrU9MUOPnbG2yTSqN/Su9mvKliAojsUnC4cQ2PBsL
 e3qPHdQSf0lqIm93S5V9BG1M7I+06/0EvKw9kUl6+DT+PpBA14RI9KsQEk8kCpUtbuat
 akk2Q9eMdKNh1VC3Ztzqej9UluWBmB+Cl7/Xq6gu2lR8eOJvdot+6P9vttw/0UA8Ly24
 uUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WDCqUbAJ1b7SoTNVuP7LYvyxKcy9lEwuy3pQ6q0G1P0=;
 b=U97g6HIx7jvYqFGLkEJdcyH+4HADpeEIFTvuKZYNqF0sZC2+JyVYeQCOWUNeOBcC9d
 POPrUkzt/lIYDJX7J3XPaoocWfaGRs0d6+vbSmrjzYGgfnAqwSjZ+4uuVlknFCq84HZ0
 B5v+4rf79tkH4RhGvfK+axks682nciW36I7uwszBtYiw6S025oA1znR+zY/KRw9Gf7x3
 dyU4SDiiKwfRCxLnvgWk5bai46TFRMkb9OqsvVkXBPLnX+DlNuIEhB/4xiyqzgSqgTVa
 Hu/umLcXYFmTqD/tMVdn5OVbXXz9H/YVrIYRx9uUeiBZ0UOy6SZYe99Gkl8smT6CQvJl
 h3oA==
X-Gm-Message-State: APt69E1M28hzcu8WwR3Yav59UQGNW7sGSV+3K+p797VKcWYSlAMj0i3R
 wT6kj7bEWVc9dIY9skPziPumTw==
X-Google-Smtp-Source: AAOMgpeUc/yAeJ3b/JAiAbZLsGSyfXR0NxnFB0UKuTURHFtGLlN2mEBfnVjAov5vbn6zt4qDLvMsSA==
X-Received: by 2002:a62:4695:: with SMTP id
 o21-v6mr28334300pfi.176.1531286318952; 
 Tue, 10 Jul 2018 22:18:38 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id p18-v6sm21357097pfe.22.2018.07.10.22.18.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jul 2018 22:18:38 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 1/7] clk: Aspeed: Modify clk-aspeed.c driver
 probe sequence
Date: Wed, 11 Jul 2018 13:17:04 +0800
Message-Id: <1531286230-28453-2-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 05:18:41 -0000
X-List-Received-Date: Wed, 11 Jul 2018 05:18:41 -0000

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
