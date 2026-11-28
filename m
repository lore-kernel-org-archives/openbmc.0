Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EF4606A32E
	for <openbmc@archiver.kernel.org>; Sat, 28 Nov 2026 02:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DR/3n50C
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbvw21t8Cz3bYx;
	Sat, 28 Nov 2026 13:52:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795834353;
	cv=none; b=UlFjMgs2H3UZ3S+YeREVECqZaBK7UhX22DECy2zgTogG9xyjUxNJjYb7IvRueaMOS0Zh9q/yXzY/t0sYvuSroYY15s1uvb7oQzSSejqjEolfij7bzQ8C3s6pBApsG5es5ZOOvqOmWnOCyEuop1bn0XSQYWiV891yxpGGvi9esNAViMx6sYk0gv3nQtGroVK0Z5rVOAxa0/OIIJly3gQ7ImOju2xbJdjdMgdikI7kWRuLeGudtoZMyWM6P/C9z8lb6/KMcDezhfNwlfpyZDPydVObqlVi+DW+vDeDsPEj8rkSpTi6IQljO62msdw9tGERaSchekJhPwFdQCpCvQbVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795834353; c=relaxed/relaxed;
	bh=tZEOAosPCU3HmTotZCFirLF+uBDQMvQZe2sF1tiSxjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PF2KWIgh02b32fo6KquUzcwqHXVLr4UJ1P/Zw47B6j0/ykSm6cE8ZjN9zjDVnlnC2hG+4hbNCWxuHPtBCpXoa5b1/e+sANiLYTJakPHOHW1RHdG7rRluA4E6A8lx7VlzmmjC/IzgiKFXdlR7GWgNWvMmLPRyT8a809Cl60AB7ZFe4wom95hLrmQOAWFUYmgxXh3RDeJfCJtS/A0TwUIIkCgoXt2xoSd9XbBfN7VA+RWhc0iDcgH03vwsB1WnRonO+BPv3ALsnejk0cbFCnIDLh3kY+qnpUrqolKb13zRZiaKonefo3JkEpOnKBdOAgZj3qO4v0h+F5CNN7qBCn2feQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DR/3n50C; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DR/3n50C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbvvy1F9kz2ySc
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 13:52:29 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso3345746a12.1
        for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2026 18:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834348; x=1796439148; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZEOAosPCU3HmTotZCFirLF+uBDQMvQZe2sF1tiSxjc=;
        b=DR/3n50Cwq86v/5fb8J/4GakP1vgfBZWMi1VTsm1EA2cYFMe0/UdhyXFaZh/sV/L8b
         /2iwpToXt3SGRXGWuKeoQ2k/I9pbSQys+nVlIsznz2tW/2zPotGq2DbkDsvYHdQH4kvl
         tPORJy2WlrQQXrHYHQkW3OAljMCb54qeTD4Q0f4q7T92hlY2dkZn54BhpW3R53Dq9/LL
         v18TS7x9Wtrr0EZp+v7ScAj9jDaEWQ8VAhuPhg4aJORR/GrUUIP7XakDqTUaIgR5eMHA
         IJCoG4Qcg07RDwjN1arzz1UeoH/D6+59M0PxM1XjpmGAuZ9ZvqjKPy1ooXWzkvgFmv/j
         iUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834348; x=1796439148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZEOAosPCU3HmTotZCFirLF+uBDQMvQZe2sF1tiSxjc=;
        b=vet8vOmIEr0EvVPI1DXxgfyGufR9oOBMhwd8CxOGjYYDhlxeZQR5sgkjkk3J42kqZf
         yp0z0DX4K72v4SG8KRdvXwd9qAoC8tMmRDYp2tN38xqpHAmCcfuKXAJ86MMjf76eo20c
         JzNCLOR8hOAGNyJ+ztcnZzuz6r5jiRfnLkXuafGusgUzfvZeTOmzwr1J0SOj/x4WFpgg
         JFI29W85P1qX4nn0NBRa73z3AzMglT/Xvhzz7lL7TJ72bvbNnQtZoOqzYVKjFx9P3epx
         SxcEKXpDOa7Bfx5pz581kYutHpv9/u5E8KNQtzZJW09e8MeAMdjDjTDXEVctV3IfczY1
         fS2Q==
X-Forwarded-Encrypted: i=1; AL+hErFr+2ax3R4rt4BBEprLtl5DsPTCdOo1OZWFNSp8zydtQy4BcZzGTWOrM36e1Tx5r/C2rGOODO23@lists.ozlabs.org
X-Gm-Message-State: APuU4Z9hKx4j26V3EpPQYjn3DiFLXE/uVuH3BQj8Ci+DzjzucWKQlP0U
	I4BnK4/NjWciBf/LGJFNY92gdXwsm1YBO2xLxR+noEp1IgqPUyOLPkzFBYg5RFNlv2E=
X-Gm-Gg: AZFdTZex2W5oT/jaKrfj3QeYpOUEMcHJzcXuAudkoeZUlpQcqC1OK/d9DtEL2nMgkM7
	5FRi55mCoC/cxW+qwE8ni3buZev5dy6CF/KoaBO1zEz8pnpgVdHiNLle9Np1uNs+oo1Z7O49B3q
	du8/uRl79+QKVj3Yor2R8+IhrVKerbbenfrE3w6U/+C8FlTZGnGXHcp1xvhLOjp1lvUtlSatWQm
	MkmA460S7SB1l4c6dnKoh51vfW3Y8cfUnXaqqULXJYrE06DXTcmG7yIOklfi8S2TVTSPGS0cawq
	t5Ln2CZF70+5WR9kU+SPiRyKRczj5RvyjosfGL9Kmi1Jg7XwPOjLueZeDu+bjO61QCCg2Zu2bMJ
	WTwkJFyuz+Jq4Fa9HdLOKOHtlKVl89Kk8ub9zPyVznoIawPK1c3vT7wUUPUCBmJJErcay0s9ktp
	4BVa+GcvKTL6vEd/nzSqyMjSc8ldMWlTdF0Qc93kI2Cdek1sTegEoVfz90SUm3gSA3KZ6F2012q
	kwagPgP/WmAIv2eSv/3e/tv7gNbOa9ZPA9BbVniKhKES6hWN8MdnKW00FjaxVyrfBpxNsU7qllK
	kzler9FLTdiFmXi/RrrR/gCL1gWssYlcohFg1KVakJe6PYM4hTMeRpwOYSCNrgRgsS8HY/HPOu3
	hxBKM8JdGi8krLA==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b41c942629mr23863138a91.32.1795834347869;
        Fri, 27 Nov 2026 18:52:27 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492413a91.17.2026.11.27.18.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:27 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 2/2] clocksource/drivers/timer-npcm7xx: Register timer1 as sched_clock
Date: Sat, 28 Nov 2026 02:52:24 +0000
Message-ID: <20261128025224.2680046-3-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025224.2680046-1-william@wkennington.com>
References: <20261128025224.2680046-1-william@wkennington.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

timer-npcm7xx starts timer1 as a 24-bit free-running down-counter and
registers it as a clocksource, but never calls sched_clock_register().
sched_clock() then falls back to jiffies, which leaves
CONFIG_IRQ_TIME_ACCOUNTING disabled at runtime and gives coarse
scheduler and printk timestamps.

Register timer1 with sched_clock_register() using an inverted
readl_relaxed() callback matching clocksource_mmio_readl_down(). The
counter is the one the clocksource already reads, so its 24-bit wrap
(about 1.3 s at 12.5 MHz) is not a new constraint.

Tested on an NPCM730 BMC, where sched_clock now has 80 ns resolution.
The driver also binds nuvoton,wpcm450-timer, which was not tested.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/clocksource/timer-npcm7xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index c7377f30e95a..f4b828d7c183 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/clockchips.h>
+#include <linux/sched_clock.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include "timer-of.h"
@@ -166,6 +167,11 @@ static void __init npcm7xx_clockevents_init(void)
 					0x1, NPCM7XX_Tx_MAX_CNT);
 }
 
+static u64 notrace npcm7xx_read_sched_clock(void)
+{
+	return ~(u64)readl_relaxed(npcm7xx_to.of_base.base + NPCM7XX_REG_TDR1);
+}
+
 static void __init npcm7xx_clocksource_init(void)
 {
 	u32 val;
@@ -184,6 +190,9 @@ static void __init npcm7xx_clocksource_init(void)
 				"npcm7xx-timer1", timer_of_rate(&npcm7xx_to),
 				200, (unsigned int)NPCM7XX_Tx_TDR_MASK_BITS,
 				clocksource_mmio_readl_down);
+	sched_clock_register(npcm7xx_read_sched_clock,
+			     NPCM7XX_Tx_TDR_MASK_BITS,
+			     timer_of_rate(&npcm7xx_to));
 }
 
 static int __init npcm7xx_timer_init(struct device_node *np)

