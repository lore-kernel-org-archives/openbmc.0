Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DTtOF9gs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RueUKAz/"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bTbF1VtvzDr0s
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 14:57:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E445915F0;
 Thu, 10 Jan 2019 22:57:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Jan 2019 22:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xtLIgyR+PLkTm
 fvRtaZxtSDuKHUnUOQSkr8yD7N9DtQ=; b=DTtOF9gsbrj3kMsgDxx0X84roE70r
 eHVxNS2LNAo3JglnaoDroP8+cfqpSWdplssHkuEuN2LKwQA0dTjmBOPhek/Cp6L+
 UPz3xCjQZc6eVtYFYy01ssDc/TTkwcXhtdJMDOM284CsJ/sqrEEcedywAG0746kL
 DiuxGgfPX13W0tS3XkI/8bxw0ZkonOTUCVK5Q/JwduJtgzm0GOQsXc8HmjuNZlYT
 E3EVNfu0DOz3svSrTAEU/vamroNsT9aMDx12+VWPlba47Iq4lnAL3cvZJfm1FJ9O
 MDKensVvTQaqCPhXpiaeMkVgyUY9rcZLiUE6lRbxryc61ubE8jGDzJfjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xtLIgyR+PLkTmfvRtaZxtSDuKHUnUOQSkr8yD7N9DtQ=; b=RueUKAz/
 +E7fpXo83qwwBk13oZEYZtIk6L8+9AChHs9b0UxlQaSpJwUqyE6OnMuDtHOaNVd9
 b21TrSMp+flXLIR5RJ1G2OoVfJ34ty+qByU5hVFjDc6jA51qSKEE4sEz3MgxNTAx
 RujNniboBpqQhV5TYDHMMKdBIcPx9nqtsfXmlZ2RnZivTr9sFFqaMsnJ72m5VJHQ
 ofu1gTj/Wd0PAwTYLJeANlP9ybi4nhJhcrFaI9cbVSikIY97RIMBc6F3z85s4Dn5
 DoRtntAAzkUdLv6KIYgHT6RPvrOYt2QYrjkCpXng8aY3nGXS4gPeWuDj+My1WWaM
 /3uC9vhJxLgh2w==
X-ME-Sender: <xms:JhQ4XPkF6SFKOymRxSXCmBVotTw2y1oEKCJv-tOXMnaelNQEGn-AxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeeggdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepte
 hnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhp
 pedvtddvrdekuddrudekrddvkeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:JhQ4XGUm46Eu5Qo2MDRfP4vC0mYXMXjKMShQcsTvnV8rgxYS6bDzEw>
 <xmx:JhQ4XOK9Y8P0WIkptKzZW2XVR0Q-D_Ch_0OtNP0F4XgXe8eO6GSDLg>
 <xmx:JhQ4XKaBY6Te9pGitUrtifikoHOZBY1_5qBnaUkqzI4y5DNIk-t6jQ>
 <xmx:JhQ4XNjeuJcSRXSlDDreo4RsutQOAxjkHZxMAd2h3LPtqMcaVIdbGw>
Received: from mistburn.bha-au.ibmmobiledemo.com (unknown [202.81.18.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9BA2C100B8;
 Thu, 10 Jan 2019 22:57:23 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, clg@kaod.org, geissonator@gmail.com,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC qemu legoater/aspeed-3.1 3/4] timer: aspeed: Fix match
 calculations
Date: Fri, 11 Jan 2019 14:26:37 +1030
Message-Id: <20190111035638.19725-4-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Jan 2019 03:57:29 -0000

If the match value exceeds reload then we don't want to include it in
calculations for the next event.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/timer/aspeed_timer.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 6adc14d62034..35b40a7c4010 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -107,6 +107,11 @@ static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
     return t->start + delta_ns;
 }
 
+static inline uint32_t calculate_match(struct AspeedTimer *t, int i)
+{
+    return t->match[i] < t->reload ? t->match[i] : 0;
+}
+
 static uint64_t calculate_next(struct AspeedTimer *t)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -116,11 +121,11 @@ static uint64_t calculate_next(struct AspeedTimer *t)
      * registers, so sort using MAX/MIN/zero. We sort in that order as the
      * timer counts down to zero. */
 
-    next = calculate_time(t, MAX(t->match[0], t->match[1]));
+    next = calculate_time(t, MAX(calculate_match(t, 0), calculate_match(t, 1)));
     if (now < next)
         return next;
 
-    next = calculate_time(t, MIN(t->match[0], t->match[1]));
+    next = calculate_time(t, MIN(calculate_match(t, 0), calculate_match(t, 1)));
     if (now < next)
         return next;
 
@@ -136,8 +141,10 @@ static uint64_t calculate_next(struct AspeedTimer *t)
         qemu_set_irq(t->irq, t->level);
     }
 
+    next = MAX(MAX(calculate_match(t, 0), calculate_match(t, 1)), 0);
     t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
+
+    return calculate_time(t, next);
 }
 
 static void aspeed_timer_mod(AspeedTimer *t)
-- 
2.19.1
