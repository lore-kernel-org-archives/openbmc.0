Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wGc7v10skzDq9m
 for <openbmc@lists.ozlabs.org>; Mon,  1 May 2017 17:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DwIHxxvP"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id t7so15110170pgt.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Va74OPyd432OOrsyrZuAUWYlgtvqS5SiPKwbrhZe8ZA=;
 b=DwIHxxvPSuMGvVxGRoxE508V+OlSjWRNnEJW6Rf5N55mYNWTUhbcfBgoPBNHWPz+xy
 ozxZDGzWFsXT2oI+t3Yx535jAiL7oalC6wD453i1zM9ZkMgerT/TKclYKVLNyAdoSvl0
 +2NGxKYilWJM+tcHMVq+nd4f7nRSJJZ8W/pHyFETRh16mHLkXkbXz0y/VinAwzT0up+z
 MPmLZsrs+bPL1qwNXFmJhLGW/jU5VaeYyyE2T7RdVMovZHajYkN6ZBGRlCyo0B2RcRWu
 xQ7oM6RQmDY4krtQ35NBC0sg+0CpPkn4A53qISFE8YKZK0zu/TgjXZkrEpQ2jwfhBMH+
 5FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Va74OPyd432OOrsyrZuAUWYlgtvqS5SiPKwbrhZe8ZA=;
 b=kTbphCMadG61xskfREEKIqlHq0PhB0gUgR5xILJ9v4zxd+O3mINQe16T1SOFmDis5F
 DerFUhrJ5K8df8QJ4LpKFbnAD4+mTTqZC7J7kMa7azL9zvmb1BLzJRyKRBzpaEo/QVDd
 hUp8IK9crgMtpRu5Ek7uIIpSRwng7CyU/ht54eGKpgOJyS5VNAuOlKTZmU3YKRWm1slB
 WV+/mst5iOcw017h3/0KOQqVRL+74ySDYKilgArhJ5PW9MzhEv7NlGqMArbs6dI11tav
 2rQRYpIw7WbjJmxoRqxfuB7DpO8td1krYcNe1Zqq7NUO+Er/seHzNng8LbSnWvMk/OP0
 PHrg==
X-Gm-Message-State: AN3rC/5OM4YJcAYTz6KWecKugIpb+GhYkxB4bnn6VJv/XG/UHbtAIWam
 4D1FgGeZ8CsyVA==
X-Received: by 10.98.52.4 with SMTP id b4mr6449063pfa.124.1493625113099;
 Mon, 01 May 2017 00:51:53 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id b4sm17153865pfj.122.2017.05.01.00.51.49
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 01 May 2017 00:51:52 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 01 May 2017 17:21:47 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.7 v2] ARM: aspeed: witherspoon: Take UART1 out of
 reset
Date: Mon,  1 May 2017 17:21:39 +0930
Message-Id: <20170501075139.19006-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 01 May 2017 07:51:56 -0000

This is required so the UART can be used before booting the host.

Signed-off-by: Joel Stanley <joel@jms.id.au>

---
This is a minimal workaround for manufacturing. dev-4.10 will receive a
proper fix.

v2:
 - Make it compile

Signed-off-by: Joel Stanley <joel@jms.id.au>

 arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0717181cc890..0d1dded5d91b 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -197,6 +197,8 @@ static void __init do_zaius_setup(void)
 
 static void __init do_witherspoon_setup(void)
 {
+	int reg;
+
 	do_common_setup();
 
 	/* Setup PNOR address mapping for 64M flash
@@ -216,6 +218,14 @@ static void __init do_witherspoon_setup(void)
 
 	/* Set SPI1 CE0 decoding window to 0x30000000 */
 	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
+
+        /* Disable default behavior of UART1 being held in reset by LPCRST#.
+         * By releasing UART1 from being controlled by LPC reset, it becomes
+         * immediately available regardless of the host being up.
+         */
+        reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+        /* Clear "Enable UART1 reset source from LPC" */
+        writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
 static void __init do_romulus_setup(void)
-- 
2.11.0
