Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="R7UWt9OE"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS5w1XVCzF35h
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:44 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id e10-v6so17623671pfn.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UxOTZIIKzGoJN+o1eaQh+5ZdEKhY7m/gj0mF6OBin9I=;
 b=R7UWt9OEpWUSrPgk818Zep9eNa8AcFIhVvzhJVVSflyFiZlz1bsBKe+YW1rZMnbQXD
 AdmBejPxbdWIoy9UjYbterGCysJBdN6cSQcg75J13F1G/xGzs6PtzPgJQwTnLr6uy2gS
 L7gEHC8reEia2quo057yeBJG3GBu6Dt1ackO6Tf5CEOxhhv0628KZ5CBv6Gw9pU+Zbwi
 ZYkNoOgUhfyPdxSKm7KTJJ2kWZya8J7DaW7NZDd3lMC/LowsbKepZh5cg8XHUI+N6Xl8
 1EGNejXT5qUBRniQkpNOwdVPFM6SyxS2xLjd7hhRSWSGKtgN9XJDnp249XZfZ2s4oqR9
 7m1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UxOTZIIKzGoJN+o1eaQh+5ZdEKhY7m/gj0mF6OBin9I=;
 b=maIRTAuzLVcv1OEZaoAy+7qKT5N1GpLP4D6C/XIQWicIWG19jpF/DvSlWLth5bGyQm
 012VWan8C4/D3dsvXBmXfqEeYUBFSKwG+/U+8AhL1dZs16TtNddhDvgo8E5eMBZo5tTr
 WWFriO6a7EBEA9hGI7b9jUNRsw6JqB6pMHNRnjQRldhK9gFtc72T4GKLp9uV1Gje+Pwn
 AwQ3qc56BbU1eE3k2NqZN5QnDOUK943AZ1kHCqXEPxDtioCBmzxrj4U7oVDK6mbpFBlq
 hEwksAMJuT9IdgPWWpPjcSiSe6DQ/BQLmLv/Isf7nYD0Eg4ZQ4ejq3LaZXUbGviV6nBY
 HU8w==
X-Gm-Message-State: APt69E1RlrQpdap4ru40ld6zQYculyos5HvBvgHQs1BUUYIdOhnECc2Q
 k5hbvC1l69KrGwXyyCj7PAZMWw==
X-Google-Smtp-Source: AAOMgpeAabwes7HJ9OY7VR/mjey3K+0gGLdJeQX102M4ODXHMeW2hzhf3AXcjrVr2HKLt9Bvb9XRRg==
X-Received: by 2002:a62:c410:: with SMTP id
 y16-v6mr28476734pff.161.1531286322277; 
 Tue, 10 Jul 2018 22:18:42 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id p18-v6sm21357097pfe.22.2018.07.10.22.18.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jul 2018 22:18:41 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 2/7] clk: Aspeed: Add sdhci reset and clock
Date: Wed, 11 Jul 2018 13:17:05 +0800
Message-Id: <1531286230-28453-3-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 05:18:44 -0000

1.Add Aspeed sdhci reset for SCU04 bit 16
2.Aspeed sdhci have two clock one is for controller clock,
another is for SD card clock. so when enable sdhci need enable
both.

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/clk/clk-aspeed.c                 | 8 +++++++-
 include/dt-bindings/clock/aspeed-clock.h | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 9e55743..cd1f3b2 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -20,6 +20,7 @@
 
 #define ASPEED_RESET_CTRL	0x04
 #define ASPEED_CLK_SELECTION	0x08
+#define  ASPEED_SDIO_CLK_EN BIT(15)
 #define ASPEED_CLK_STOP_CTRL	0x0c
 #define ASPEED_MPLL_PARAM	0x20
 #define ASPEED_HPLL_PARAM	0x24
@@ -260,6 +261,11 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
 	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
 
+	/* sd ext clk */
+	if (gate->reset_idx == 16) {
+		regmap_update_bits(gate->map, ASPEED_CLK_SELECTION, ASPEED_SDIO_CLK_EN, ASPEED_SDIO_CLK_EN);
+	}
+
 	if (gate->reset_idx >= 0) {
 		/* A delay of 10ms is specified by the ASPEED docs */
 		mdelay(10);
@@ -317,7 +323,7 @@ static const u8 aspeed_resets[] = {
 	[ASPEED_RESET_PECI]	= 10,
 	[ASPEED_RESET_I2C]	=  2,
 	[ASPEED_RESET_AHB]	=  1,
-
+	[ASPEED_RESET_SDHCI]	= 16,
 	/*
 	 * SCUD4 resets start at an offset to separate them from
 	 * the SCU04 resets.
diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index 4476184..088553f 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -50,5 +50,5 @@
 #define ASPEED_RESET_I2C		7
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
-
+#define ASPEED_RESET_SDHCI		10
 #endif
-- 
2.7.4
