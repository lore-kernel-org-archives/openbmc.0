Return-Path: <xow@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyqqz5qHFzDqKj
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 11:43:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="X0ZmFadx"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id y143so34549750pfb.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 16:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ck0pB5rQflUwDeoDbLkxd3/Xi6f3Gy64aajKf5kgbHU=;
 b=X0ZmFadxwO6LLPt6nc+YXhBSsIPcWgG1V4EpBntEQAivcHDmHIQNYSKqt0kxCB6z3j
 3Xh/cMJ+aLhq0pbWP/pSnuq2rfUG2tpu+EHNA19hzd504lZpjFlrKLQSdG7m+Fz16yxQ
 1RYzr5FgD8zRcAAgxdAv6ZyyitzXBoXbsPTKqbK85HlrWdKBC1v3ePDKp5u6b0usU+T1
 JaHmMTpI/tp4Z3pSFceMnunr8Y+EaXNA6TE5pygBAv8GSAo9xrN9paqZLtCRkIcrTcLL
 HeKDbVOP4YWxiVDORLaoZrCCVnKxZmpl6o1WeKW4BcIIGOCbXzOfy9vqOvtxLq9Ksuwl
 23bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ck0pB5rQflUwDeoDbLkxd3/Xi6f3Gy64aajKf5kgbHU=;
 b=AORh0fuDNf4zmYlu6uAg3w7jJBNxL6lzKc5/71jWkG3IHlUWldLStJuR21kFss05Us
 UiZgFZQjfp60K0XkGPgzsc1Z6csA8jeIeFlkXaGNqfJ4SwTZk8XE6qJ5f5jhgHsv8ep5
 +OZUvG9S0nQraJUmss9bZsIl67/LlvRxG/vJyx6iP2hi3BsnjZR+Il27R9eRmkCCF/c1
 PYzU5yxNKOZu94A8HaIj5r3M2mw7Kscv8yBMmrKyx8gwG7pE8LU7v/E2tyzepLvk7FOF
 AuSZNbNM/VaWFD5ZXOvuyw9gLJTNTyJS+V0H54UlGs0k5oJEKryC2l8ABvnI9SA+n6/+
 sOnQ==
X-Gm-Message-State: AIkVDXJRX/gkUGyMjh8Dtl9yBl3Gc/ebDyEEROxjQFnFCKJbzwxGjwQq/cbEPvfTnasTMU3X
X-Received: by 10.84.231.134 with SMTP id g6mr8999457plk.40.1484095385144;
 Tue, 10 Jan 2017 16:43:05 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id 64sm8459292pfu.17.2017.01.10.16.43.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 16:43:04 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/2] arm: aspeed: zaius: Disable pulldown resistors on
 1-wire IOs
Date: Tue, 10 Jan 2017 16:42:57 -0800
Message-Id: <20170111004257.8817-2-xow@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170111004257.8817-1-xow@google.com>
References: <20170111004257.8817-1-xow@google.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 00:43:12 -0000

Disable internal pulldown resistors on pins used by the 1-wire interface
to thermal sensors.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/mach-aspeed/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index e4150c8a5d8d..4bd3680d742d 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -152,6 +152,10 @@ static void __init do_zaius_setup(void)
 		writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
 	}
 
+	/* Disable GPIO H/AC pulldowns to float 1-wire interface pins */
+	reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
+	writel(reg | BIT(23), AST_IO(AST_BASE_SCU | 0x8C));
+
 	/* Assert MAC2 PHY hardware reset */
 	/* Set pin low */
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
-- 
2.11.0.390.gc69c2f50cf-goog
