Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mUyknVWi"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40grp65K48zF27m
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 19:36:14 +1000 (AEST)
Received: by mail-pl0-x241.google.com with SMTP id a39-v6so3969945pla.10
 for <openbmc@lists.ozlabs.org>; Wed, 09 May 2018 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eFFUqPEnFgISpXeOQqoTJJg2eekl6A9J2+iRtEGnrZE=;
 b=mUyknVWiw84Ln5yyY1wvsaNwkbCu4oTHb4M2eh0+I28Mg9BLX6cNuqmgtoiioh9Qqc
 Q6J3SV5D6Nn7pGAJynIOLbeEWrLBkKGS7tQ8IV3jRKvAgRhQFN0YanOMw0XdqkUsteNx
 HTOOKoqAAgkKuaqg2OtRCdHqF1EM4f8sxPbrREYusWNgeu5KDJFWrnVYIXcYsYrgaMGM
 PCxpFert0tCJbEAYOENzV/DbqZlAB7Dta5719QL92zARRuuYL2dphXohzSEgcxJFzymz
 AIKXYq0DnXQqRa//EhVXp8dC+gqJbMsiYQEt3lAH/ZbuBr3FyjYwvKLtB4pObWk01XV1
 D24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eFFUqPEnFgISpXeOQqoTJJg2eekl6A9J2+iRtEGnrZE=;
 b=Pl9YURM6MR+m00rYfauxUdLJMZOHf/N9arysmDPrZ0LYy0RBGggOPXgXxSUZsGD5za
 XbitIVW9tf/kilFvRdwBNhzdVbeXG5aF1oq/oWDvt1ITsYs3cGU1bHGXLriIDJKNt1u/
 fafKdgS4pJJWtpG0WEd0hqECxZaiLCy5HSCufv19ptCJZ3x3kXT7Cr3zAtdacLVrJCVL
 KaFLJfULK7Rqcug3BBnOfYHJOUXBZRO4xoYD0m5XH7ghqAR72FkYtlNtwqQNTSEUT/7Y
 rW2WE1KDTn36KgnDKBa5E7WJGsvebIoQp8XlXynU81qDyvTsCVlHlIq+4AN+x8k6LS9L
 2sgg==
X-Gm-Message-State: ALQs6tCLrN89GT05FC/6xmwZlvCD8Xl2k1KQcnq1KcwUxfO3Pd5amVfK
 KrQtAYE4SPCy7kmt5OJuN4zOGTa8EgY=
X-Google-Smtp-Source: AB8JxZpjyaJQW9t4RODZuwUteJOij4V9bohabgsBCb0QdRhaspZMea8dim9urERjl/frbsZJcgESog==
X-Received: by 2002:a17:902:3f83:: with SMTP id
 a3-v6mr44993239pld.279.1525858572153; 
 Wed, 09 May 2018 02:36:12 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id o10-v6sm44508488pgc.80.2018.05.09.02.36.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 May 2018 02:36:11 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com
Subject: [PATCH linux dev-4.13 1/2] clk: aspeed: Add 24MHz fixed clock
Date: Wed,  9 May 2018 17:35:58 +0800
Message-Id: <1525858559-130220-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2018 09:36:15 -0000

Add a 24MHz fixed clock.
This clock will be used for certain devices, e.g. pwm.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 drivers/clk/clk-aspeed.c                 | 8 +++++++-
 include/dt-bindings/clock/aspeed-clock.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index c5d2af2..2ea1ec1 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -23,7 +23,7 @@
 
 #include <dt-bindings/clock/aspeed-clock.h>
 
-#define ASPEED_NUM_CLKS		35
+#define ASPEED_NUM_CLKS		36
 
 #define ASPEED_RESET2_OFFSET	32
 
@@ -517,6 +517,12 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_clk_data->hws[ASPEED_CLK_BCLK] = hw;
 
+	/* Fixed 24MHz clock */
+	hw = clk_hw_register_fixed_rate(NULL, "fixed-24m", NULL, 0, 24000000);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
+
 	/*
 	 * TODO: There are a number of clocks that not included in this driver
 	 * as more information is required:
diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index e983d17..9733c77 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -37,6 +37,7 @@
 #define ASPEED_CLK_MAC			32
 #define ASPEED_CLK_BCLK			33
 #define ASPEED_CLK_MPLL			34
+#define ASPEED_CLK_24M			35
 
 #define ASPEED_RESET_XDMA		0
 #define ASPEED_RESET_MCTP		1
-- 
2.7.4
