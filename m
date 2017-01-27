Return-Path: <xow@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v94xM0tBZzDqLK
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 04:08:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iPBYz93c"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id 189so74660135pfu.3
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 09:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWpzoJAFDrFiRfz22TrOy8sczp4bM4iPodlZSS2sPY0=;
 b=iPBYz93c+XudyiFHG3OvRv76zXT1KnsugF+nNvcgtFBtL3L2lmQnkEJahV2O9lNlj1
 LJN6rUzjvL9/fYMshcxmvZMAcRuI8KOnStWTokQpIg2fYwwHAAVCfQcC3wEFNP4R50J8
 MyjprQhwO8WVw9W6dGmXlNvKMPvB5s6dx74dz5O4KTtVHlv8EN0BE+RcWyzRtUnWc9Zx
 +VMzzCRItKVuPTcydVjOdLv+aQXMFFuQtcWDTK2b7ZenhPFZV22wi2ZpCeWFPFuD36N1
 Y7pwwEMHyEBMPZunZNAztNx1OdBhp6UDEXJ8VZNbLoQVgOXnV5Os0ymmUQJ/+c6e93Jh
 iwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWpzoJAFDrFiRfz22TrOy8sczp4bM4iPodlZSS2sPY0=;
 b=PLPm0ZyKHX5cmVKbR+zif0V9fo5tJ7KPHg4b2fkzerhFaQyz5q8OTEjjuMrL2FQHQn
 mTaVJ90kHUi8Wosdgr04rCeNZKtp4kym7dvFOsCr9xglylJU9TC8Di2OL7/07wdPUXAI
 9XyrOi6itnqYBtk2fcLRDLIcVHqdpEUYsUxtF83ctVQdRrlkCTxEvNFg9el2Y0/EgQVJ
 SfHJiMvA8B3K+kbCPmbghe+yIcX5CJ+CLZgpAKFOeQRkmOxu/vlZ7D7MTWRuSWilyACl
 ZCrQonV4iBRrp33zoIwZMJJJIHti932N4lSOROymwXoJvcFNR7eBnVQNk3hdcv/h4syQ
 KSiQ==
X-Gm-Message-State: AIkVDXLEwNu3fxy/zI3WE564e0W5tUwOfeLMGuiMC4AzHQRNT4nsFxGGN+XhSUSCujDaFEGa
X-Received: by 10.98.198.90 with SMTP id m87mr10182980pfg.153.1485536900712;
 Fri, 27 Jan 2017 09:08:20 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id s65sm12731550pgb.25.2017.01.27.09.08.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 27 Jan 2017 09:08:19 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm: aspeed: zaius: Disable LPC reset for UART1
Date: Fri, 27 Jan 2017 09:08:14 -0800
Message-Id: <20170127170814.120771-1-xow@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2017 17:08:24 -0000

Currently, UART1 on Zaius BMC is unusable until brought out of reset by
powering the host on. In this reset state, ttyS0 can still be opened
and UART1 silently drops bytes, which is not obviously expected
behavior.

Signed-off-by: Xo Wang <xow@google.com
---
 arch/arm/mach-aspeed/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 4bd3680d742d..9f06191f1630 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -185,6 +185,10 @@ static void __init do_zaius_setup(void)
 
 	/* Set SPI1 CE0 decoding window to 0x30000000 */
 	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
+
+	/* Disable LPC reset for UART1 */
+	reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
 static void __init do_witherspoon_setup(void)
-- 
2.11.0.483.g087da7b7c-goog
