Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tcQ7hBWG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="e1wK/z8e"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bTb63NP4zDqws
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 14:57:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 322531611;
 Thu, 10 Jan 2019 22:57:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Jan 2019 22:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=s3Ls2OXauC02m
 lPOSmpF1+8JoDYPWH7zmrhf3lyh71Q=; b=tcQ7hBWG5nDvig0XVeBFZD4TvWGR1
 l4pZRmV/5WOxdPgnAX19lYjg1BnWbQD95pgzKx5Eyak0cnQ61X+OqJ7Ln4Dipz9c
 10/OVSvD8lOelhsg6MnFQ/bzT3++mdf/b/icWximTjmu3Sj7diFpOTbF+ArDkssl
 xMwfJCq3WU0lEmUT6mfV3q5N+bIRR0E6/qYpoV2v9EXR885jB/TnnYnwoS2ZP5qg
 kG8hejyiTTAGDr043ruKeVdHEVtZrp+SrdJNjvQsyqroyewF3K/lQGPcAIzZmszc
 bxCDy1RKh+UclEwRBzNDl/vvdWtgxYDNzIaH9isTx+3/f7VRCvAn/PGrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=s3Ls2OXauC02mlPOSmpF1+8JoDYPWH7zmrhf3lyh71Q=; b=e1wK/z8e
 oDyoQdQAhPV4fQbqelkgg3LoDnHKgnkPory4Sft3NvIdwJ8AVpb+kUiZb4YlWxZl
 m3EDxIr+1CAlhFGqw5YWFrtlzO9KdC/RbwiSB/WTOnsK9MOvgkYaVGaPH7rhKHn7
 Q7bmHAUGTuwaFsC34X0mvzhNwHknXEoZCdCc3Uo0C3/ex68fViofJsNIdTYNyQUa
 +BbY6X23eqJirBbiS3UPogDdtUNRUyDNw+c/nm7YQJtHAJ6VNaMad+WBB3hftyz5
 xzBAeZs54YZ+rPQ061l0vedTTxZIcTV+1uZHnOqkRRcOlKAOwTIh7/weaLayyEAu
 wtc+okGD9SmKDw==
X-ME-Sender: <xms:HxQ4XI04OZAQniqu1siRZJ2vyFRpffndlyblvz5V0bFakgsmSMc0Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepte
 hnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhp
 pedvtddvrdekuddrudekrddvkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:HxQ4XPau0vrNN_415eKvZEgoF-af9D7LX723G54j4qfvdNyhZbfQJA>
 <xmx:HxQ4XDqMrMLxDZmwAAySRzjmOO7d4QBxfWYnGngLh0iqhY3MMt_3Cw>
 <xmx:HxQ4XDpwf1N3AhDc2hlR6lg91aCtL9SGo33kferhV7WcEsi670PNYA>
 <xmx:HxQ4XCmEbp9k0-LlagPX4g5xdRxiPPnHauANLu9lyYsLDrYQIhgF7g>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A87E100BA;
 Thu, 10 Jan 2019 22:57:17 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, clg@kaod.org, geissonator@gmail.com,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC qemu legoater/aspeed-3.1 1/4] timer: aspeed: Fire interrupt on
 failure to meet deadline
Date: Fri, 11 Jan 2019 14:26:35 +1030
Message-Id: <20190111035638.19725-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190111035638.19725-1-andrew@aj.id.au>
References: <20190111035638.19725-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2019 03:57:23 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/timer/aspeed_timer.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 1a54d85e9d49..54c75bf4f322 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -128,10 +128,16 @@ static uint64_t calculate_next(struct AspeedTimer *t)
     if (now < next)
         return next;
 
-    /* We've missed all of the deadlines. Set a timer in the future to let
-     * execution catch up */
-    t->start = now;
-    return next + 10000;
+    /* We've missed all deadlines, fire interrupt and try again */
+    timer_del(&t->timer);
+
+    if (timer_overflow_interrupt(t)) {
+        t->level = !t->level;
+        qemu_set_irq(t->irq, t->level);
+    }
+
+    t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
 }
 
 static void aspeed_timer_mod(AspeedTimer *t)
-- 
2.19.1
